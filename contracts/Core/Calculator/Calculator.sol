import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Interfaces/Core/Calculator/ICalculator.sol";
import "../../Core/Navigator/InitNavigator.sol";
import "../../Interfaces/Core/Navigator/INavigator.sol";
import "../../Interfaces/Codex/ICodexWeapons.sol";
import "../../Interfaces/Codex/ICodexRandom.sol";
import "../../Interfaces/Attributes/IAttributes.sol";
import "../../Interfaces/Core/Constants/Constants.sol";
import "../../Interfaces/Inventory/IEquipable.sol";
import "../../Interfaces/Summoners/ISummoners.sol";
pragma solidity ^0.8.0;

contract Calculator is Initializable, InitNavigator {

    function CostOfStat(uint skill) public view returns (uint) {
        //1+target_skill_point/10
        return skill == 0 || skill == 1 ? 0 : 1 + (skill / 10);
    }

    function SumOfStatSetCost(GameObjects.Stats memory stats) external view returns (uint) {
        uint cost = 0;

        for (uint i = 0; i <= stats.STR; i++) {
            cost += CostOfStat(i);
        }

        for (uint i = 0; i <= stats.DEX; i++) {
            cost += CostOfStat(i);
        }

        for (uint i = 0; i <= stats.AGI; i++) {
            cost += CostOfStat(i);
        }

        for (uint i = 0; i <= stats.INT; i++) {
            cost += CostOfStat(i);
        }

        for (uint i = 0; i <= stats.VIT; i++) {
            cost += CostOfStat(i);
        }

        for (uint i = 0; i <= stats.LUCK; i++) {
            cost += CostOfStat(i);
        }

        return cost;
    }

    // generated value based calculations
    function HitChance(uint ACC, uint DODGE) external pure returns (uint){
        return HitChanceWDecimals(ACC, DODGE) / GameConstants.GAME_DECIMAL;
    }

    function HitChanceWDecimals(uint ACC, uint DODGE) public pure returns (uint) {
        //(100+(accuracy - dodge))/100
        int ACC_W_DECIMAL = int(ACC * GameConstants.GAME_DECIMAL);
        int DODGE_W_DECIMAL = int(DODGE * GameConstants.GAME_DECIMAL);
        int CHANCE = (int(GameConstants.HUNDRED) + ACC_W_DECIMAL - DODGE_W_DECIMAL);
        return CHANCE > 0 ? uint(CHANCE) : uint(0);
    }

    function CritChance(uint LUCK, uint CRIT) external pure returns (uint){
        return CritChanceWDecimals(LUCK, CRIT) / GameConstants.GAME_DECIMAL;
    }

    function CritChanceWDecimals(uint LUCK, uint CRIT) public pure returns (uint) {
        uint CRIT_W_DECIMAL = CRIT * GameConstants.GAME_DECIMAL;
        uint LUCK_W_DECIMAL = LUCK * GameConstants.GAME_DECIMAL;
        //(1+luk/3)/100
        return (CRIT_W_DECIMAL + GameConstants.GAME_DECIMAL + (LUCK_W_DECIMAL / 3));
    }

    // @param _dns, N of dice, n=20 means d20
    function BatchRollN(uint summoner, uint[] calldata _seeds, uint[] calldata _chances, uint[] calldata _dns) external view returns (bool[] memory) {
        bool[] memory results = new bool[](_chances.length);
        for (uint i = 0; i < _seeds.length; i++) {
            results[i] = IsSuccessfulDiceRollN(summoner, _seeds[i], _chances[i], _dns[i]);
        }
        return results;
    }

    function BatchRoll100(uint summoner, uint[] calldata _seeds, uint[] calldata _chances) external view returns (bool[] memory) {
        bool[] memory results = new bool[](_chances.length);
        for (uint i = 0; i < _seeds.length; i++) {
            results[i] = IsSuccessfulDiceRoll100(summoner, _seeds[i], _chances[i]);
        }
        return results;
    }

    // chance based calculations
    function IsSuccessfulDiceRoll100(uint summoner, uint seed, uint chance) public view returns (bool) {
        uint CHANCE_W_DEC = chance * GameConstants.E18;
        ICodexRandom RNG = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
        uint _seed = uint(keccak256(abi.encodePacked(msg.sender, block.number, summoner, seed)));
        uint rollE18 = GameConstants.HUNDRED - (RNG.d100(_seed) * GameConstants.E18);
        /* @notice */
        /* example: assume crit chance = 10, use rolled 80, 100-80=20, 20 <= 10, false*/
        /* example2: assume crit chance = 20, use rolled 80, 100-80=20, 20 <= 20, true*/
        return rollE18 <= CHANCE_W_DEC;
    }

    // chance based calculations
    function IsSuccessfulDiceRollN(uint summoner, uint seed, uint chance, uint dice) public view returns (bool) {
        uint CHANCE_W_DEC = chance * GameConstants.E18;
        ICodexRandom RNG = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));
        uint _seed = uint(keccak256(abi.encodePacked(msg.sender, block.number, summoner, seed)));
        uint rollE18 = (dice * GameConstants.E18) - (RNG.dn(_seed, dice) * GameConstants.E18);
        /* @notice */
        /* example: assume crit chance = 10, use rolled 80, 100-80=20, 20 <= 10, false*/
        /* example2: assume crit chance = 20, use rolled 80, 100-80=20, 20 <= 20, true*/
        return rollE18 <= CHANCE_W_DEC;
    }



    // STAT RELATED CALCULATIONS
    function DPS(uint ATK, uint DEF, uint PEN) external pure returns (uint){
        return DPSWDecimals(ATK, DEF, PEN) / GameConstants.GAME_DECIMAL;
    }

    function DPSWDecimals(uint ATK, uint DEF, uint PEN) public pure returns (uint) {
        uint DEF_W_DECIMAL = (DEF * GameConstants.GAME_DECIMAL);
        uint ATK_W_DECIMAL = (ATK * GameConstants.GAME_DECIMAL);
        uint DEF_PENETRATED = DEF_W_DECIMAL - ((DEF_W_DECIMAL) * (PEN * GameConstants.GAME_DECIMAL)) / GameConstants.HUNDRED;
        uint DEF_PLUS_H = (GameConstants.HUNDRED + DEF_PENETRATED);
        uint MULTIPLIER = GameConstants.HUNDRED * GameConstants.HUNDRED;
        uint PERCENTAGE = (MULTIPLIER / DEF_PLUS_H);
        uint FINAL_ATK = (ATK_W_DECIMAL * (PERCENTAGE / GameConstants.GAME_DECIMAL)) / 100;
        return FINAL_ATK;
    }

    function P_ATK(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,) = getAllStats(summoner);
        return ATKWDecimals(_generatedStatsFromEquipments.P_ATK, _summonerStats.STR + _statsFromEquipments.STR) / GameConstants.GAME_DECIMAL;
    }

    function P_ATKwDecimal(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,) = getAllStats(summoner);
        return ATKWDecimals(_generatedStatsFromEquipments.P_ATK, _summonerStats.STR + _statsFromEquipments.STR);
    }

    function M_ATK(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,) = getAllStats(summoner);
        return ATKWDecimals(_generatedStatsFromEquipments.M_ATK, _summonerStats.INT + _statsFromEquipments.INT) / GameConstants.GAME_DECIMAL;
    }

    function M_ATKwDecimal(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,) = getAllStats(summoner);
        return ATKWDecimals(_generatedStatsFromEquipments.M_ATK, _summonerStats.INT + _statsFromEquipments.INT);
    }

    function ATKWDecimals(uint STAT, uint ATK) public pure returns (uint) {
        // (equipTotalAttack+(1+(STR/200))+STR/2)
        uint ATK_W_DECIMAL = ATK * GameConstants.GAME_DECIMAL;
        uint STAT_W_DECIMAL = STAT * GameConstants.GAME_DECIMAL;
        uint ATK_BONUS_FROM_STATS = (GameConstants.GAME_DECIMAL + (STAT_W_DECIMAL / 200)) + (STAT_W_DECIMAL / 2);
        return ATK_W_DECIMAL + ATK_BONUS_FROM_STATS;
    }

    function P_DEF(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,uint lvl) = getAllStats(summoner);
        return DEFWDecimals(_generatedStatsFromEquipments.P_DEF, _summonerStats.VIT + _statsFromEquipments.VIT, lvl) / GameConstants.GAME_DECIMAL;
    }

    function P_DEFWDecimals(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,
        uint lvl) = getAllStats(summoner);
        return DEFWDecimals(_generatedStatsFromEquipments.P_DEF, _summonerStats.VIT + _statsFromEquipments.VIT, lvl);
    }

    function M_DEF(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,uint lvl) = getAllStats(summoner);
        return DEFWDecimals(_generatedStatsFromEquipments.M_DEF, _summonerStats.INT + _statsFromEquipments.INT, lvl) / GameConstants.GAME_DECIMAL;
    }

    function M_DEFWDecimals(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,
        uint lvl) = getAllStats(summoner);
        return DEFWDecimals(_generatedStatsFromEquipments.M_DEF, _summonerStats.INT + _statsFromEquipments.INT, lvl);
    }

    function DEFWDecimals(uint DEF, uint STAT, uint LVL) public pure returns (uint) {
        // (vitOrInt / 2)+(lv/4)
        uint DEF_W_DECIMAL = DEF * GameConstants.GAME_DECIMAL;
        uint STAT_W_DECIMAL = STAT * GameConstants.GAME_DECIMAL;
        uint LVL_W_DECIMAL = LVL * GameConstants.GAME_DECIMAL;
        return DEF_W_DECIMAL + (STAT_W_DECIMAL / 2) + (LVL_W_DECIMAL / 4);
    }

    function HP(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,
        uint lvl) = getAllStats(summoner);
        return HIT_POINTS(_generatedStatsFromEquipments.HP, _summonerStats.VIT + _statsFromEquipments.VIT, lvl) / GameConstants.GAME_DECIMAL;
    }

    function HPWDecimals(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,
        uint lvl) = getAllStats(summoner);
        return HIT_POINTS(_generatedStatsFromEquipments.HP, _summonerStats.VIT + _statsFromEquipments.VIT, lvl);
    }

    function HIT_POINTS(uint HP, uint VIT, uint LVL) public pure returns (uint) {
        // equipTotalHP+(lvl*10)+(vit*10)
        uint HP_W_DECIMAL = HP * GameConstants.GAME_DECIMAL;
        uint VIT_W_DECIMAL = VIT * GameConstants.GAME_DECIMAL;
        uint LVL_W_DECIMAL = LVL * GameConstants.GAME_DECIMAL;
        return HP_W_DECIMAL + (LVL_W_DECIMAL * 10) + (VIT_W_DECIMAL * 4);
    }

    function ACCURACY(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,) = getAllStats(summoner);
        return ACCWDecimals(_generatedStatsFromEquipments.ACCURACY,
            _summonerStats.DEX + _statsFromEquipments.DEX) / GameConstants.GAME_DECIMAL;
    }

    function ACCURACYWDecimals(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,) = getAllStats(summoner);
        return ACCWDecimals(_generatedStatsFromEquipments.ACCURACY,
            _summonerStats.DEX + _statsFromEquipments.DEX);
    }

    function ACCWDecimals(uint ACC, uint DEX) public pure returns (uint) {
        // 1+(dex/2)
        uint DEX_W_DECIMAL = DEX * GameConstants.GAME_DECIMAL;
        uint ACC_W_DECIMAL = ACC * GameConstants.GAME_DECIMAL;
        return ACC_W_DECIMAL + GameConstants.GAME_DECIMAL + (DEX_W_DECIMAL / 2);
    }

    function DODGE(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,) = getAllStats(summoner);
        return DODWDecimals(_generatedStatsFromEquipments.DODGE,
            _summonerStats.AGI + _statsFromEquipments.AGI) / GameConstants.GAME_DECIMAL;
    }

    function DODGEWDecimals(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,) = getAllStats(summoner);
        return DODWDecimals(_generatedStatsFromEquipments.DODGE,
            _summonerStats.AGI + _statsFromEquipments.AGI);
    }

    function DODWDecimals(uint _DODGE, uint AGI) public pure returns (uint){
        //1+(agi/3)
        uint DODGE_W_DECIMAL = _DODGE * GameConstants.GAME_DECIMAL;
        uint AGI_W_DECIMAL = AGI * GameConstants.GAME_DECIMAL;
        return DODGE_W_DECIMAL + GameConstants.GAME_DECIMAL + (AGI_W_DECIMAL / 3);
    }

    function CRIT(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,) = getAllStats(summoner);
        return CRITICALWDecimals(_generatedStatsFromEquipments.CRIT,
            _summonerStats.LUCK + _statsFromEquipments.LUCK) / GameConstants.GAME_DECIMAL;
    }

    function CRITWDecimals(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,) = getAllStats(summoner);
        return CRITICALWDecimals(_generatedStatsFromEquipments.CRIT,
            _summonerStats.LUCK + _statsFromEquipments.LUCK);
    }

    function CRITICALWDecimals(uint _CRIT, uint LUCK) public pure returns (uint){
        //1+(agi/3)
        uint CRIT_W_DECIMAL = _CRIT * GameConstants.GAME_DECIMAL;
        uint LUCK_W_DECIMAL = LUCK * GameConstants.GAME_DECIMAL;
        return CRIT_W_DECIMAL + GameConstants.GAME_DECIMAL + (LUCK_W_DECIMAL / 3);
    }

    // @notice VIEW UTILS
    function getAllStats(uint summoner) internal view returns (GameObjects.Stats memory, GameObjects.Stats memory, GameObjects.GeneratedStats memory, uint) {
        ISummoners summonersContract = ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS));
        IEquipable equipablesContract = IEquipable(contractAddress(INavigator.CONTRACT.INVENTORY));
        IAttributes attributesContract = IAttributes(contractAddress(INavigator.CONTRACT.ATTRIBUTES));
        GameObjects.Stats memory _summonerStats = attributesContract.stats(summoner);
        GameObjects.Stats memory _statsFromEquipments = equipablesContract.getPreCalculatedStats(summoner);
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments = equipablesContract.getPreCalculatedGeneratedStats(summoner);
        uint lvl = summonersContract.level(summoner);
        return (_summonerStats, _statsFromEquipments, _generatedStatsFromEquipments, lvl);
    }

    function summonerBaseStats(GameObjects.Class _class) public view returns (GameObjects.GeneratedStats memory) {
        return GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
    }
}