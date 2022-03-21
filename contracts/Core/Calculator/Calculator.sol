import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Interfaces/Core/Calculator/ICalculator.sol";
import "../../Core/Navigator/InitNavigator.sol";
import "../../Interfaces/Core/Navigator/INavigator.sol";
import "../../Interfaces/Codex/ICodexWeapons.sol";
import "../../Interfaces/Attributes/IAttributes.sol";
import "../../Interfaces/Core/Constants/Constants.sol";
import "../../Interfaces/Inventory/IEquipable.sol";
import "../../Interfaces/Summoners/ISummoners.sol";
pragma solidity ^0.8.0;

contract Calculator is Initializable, InitNavigator {

    function initialize(address _navigator) public initializer {
        initializeNavigator(_navigator);
    }

    function damageToArmor(uint ATK, uint DEF) external pure returns (uint){
        return damageToWDecimals(ATK, DEF) / GameConstants.GAME_DECIMAL;
    }

    function damageToWDecimals(uint ATK, uint DEF) public pure returns (uint) {
        return (ATK * GameConstants.GAME_DECIMAL) *
        (GameConstants.HUNDRED /
        (GameConstants.HUNDRED + (DEF * GameConstants.GAME_DECIMAL) * GameConstants.GAME_DECIMAL));
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
        return DEFWDecimals(_generatedStatsFromEquipments.HP, _summonerStats.VIT + _statsFromEquipments.VIT, lvl) / GameConstants.GAME_DECIMAL;
    }

    function HPWDecimals(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,
        uint lvl) = getAllStats(summoner);
        return DEFWDecimals(_generatedStatsFromEquipments.HP, _summonerStats.VIT + _statsFromEquipments.VIT, lvl);
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

    function DODWDecimals(uint DODGE, uint AGI) public pure returns (uint){
        //1+(agi/3)
        uint DODGE_W_DECIMAL = DODGE * GameConstants.GAME_DECIMAL;
        uint AGI_W_DECIMAL = AGI * GameConstants.GAME_DECIMAL;
        return DODGE_W_DECIMAL + GameConstants.GAME_DECIMAL + (AGI_W_DECIMAL / 3);
    }

    function LUCK(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,) = getAllStats(summoner);
        return DODWDecimals(_generatedStatsFromEquipments.CRIT,
            _summonerStats.LUCK + _statsFromEquipments.LUCK) / GameConstants.GAME_DECIMAL;
    }

    function LUCKWDecimals(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments,) = getAllStats(summoner);
        return LUCWDecimals(_generatedStatsFromEquipments.CRIT,
            _summonerStats.LUCK + _statsFromEquipments.LUCK);
    }

    function LUCWDecimals(uint CRIT, uint LUCK) public pure returns (uint){
        //1+(agi/3)
        uint CRIT_W_DECIMAL = CRIT * GameConstants.GAME_DECIMAL;
        uint LUCK_W_DECIMAL = LUCK * GameConstants.GAME_DECIMAL;
        return CRIT_W_DECIMAL + GameConstants.GAME_DECIMAL + (LUCK_W_DECIMAL / 3);
    }

    // @notice UTILS

    function getAllStats(uint summoner) internal view returns (GameObjects.Stats memory, GameObjects.Stats memory, GameObjects.GeneratedStats memory, uint) {
        ISummoners summonersContract = ISummoners(contractAddress(INavigator.CONTRACT.SUMMONERS));
        IEquipable equipablesContract = IEquipable(contractAddress(INavigator.CONTRACT.EQUIPABLES));
        IAttributes attributesContract = IAttributes(contractAddress(INavigator.CONTRACT.ATTRIBUTES));
        GameObjects.Stats memory _summonerStats = attributesContract.stats(summoner);
        GameObjects.Stats memory _statsFromEquipments = equipablesContract.getPreCalculatedStats(summoner);
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments = equipablesContract.getPreCalculatedGeneratedStats(summoner);
        uint lvl = summonersContract.level(summoner);
        return (_summonerStats, _statsFromEquipments, _generatedStatsFromEquipments, lvl);
    }


    function getWeapon(uint id, uint tier) internal view returns (GameObjects.Weapon memory) {
        address codex = InitNavigator.contractAddress(INavigator.CONTRACT.WEAPONS_CODEX);
        return ICodexWeapons(codex).weapon(id, tier);
    }

    function bonusGeneratedStats(uint summoner) internal view returns (GameObjects.GeneratedStats memory _generated) {
        address attributes = InitNavigator.contractAddress(INavigator.CONTRACT.WEAPONS_CODEX);
        GameObjects.Stats memory _stats = IAttributes(attributes).stats(summoner);

        // TODO calculate generated stats according to GDD Formula

        return _generated;
    }

    function classBaseStats(GameObjects.Class _class) public view returns (GameObjects.GeneratedStats memory) {
        //        if (_class == GameObjects.Class.Barbarian)
        //            return GameObjects.GeneratedStats({HP: 1,P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
        //        else if (_class == GameObjects.Class.Paladin)
        //            return GameObjects.GeneratedStats({HP: 1,P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
        //        else if (_class == GameObjects.Class.Assassin)
        //            return GameObjects.GeneratedStats({HP: 1,P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
        //        else if (_class == GameObjects.Class.Wizard)
        //            return GameObjects.GeneratedStats({HP: 1,P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
        //        else if (_class == GameObjects.Class.Necromancer)
        //            return GameObjects.GeneratedStats({HP: 1,P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
        //        else if (_class == GameObjects.Class.Priest)
        //            return GameObjects.GeneratedStats({HP: 1,P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
        //        return GameObjects.GeneratedStats({HP: 1,P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
        //    }
        return GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1});
    }
}