import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../Interfaces/Core/Calculator/ICalculator.sol";
import "../../Core/Navigator/InitNavigator.sol";
import "../../Interfaces/Core/Navigator/INavigator.sol";
import "../../Interfaces/Codex/ICodexWeapons.sol";
import "../../Interfaces/Attributes/IAttributes.sol";
import "../../Interfaces/Core/Constants/Constants.sol";
import "../../Interfaces/Inventory/IEquipable.sol";
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
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments) = getAllStats(summoner);
        return ATKWDecimals(_generatedStatsFromEquipments.P_ATK, _summonerStats.STR + _statsFromEquipments.STR) / GameConstants.GAME_DECIMAL;
    }
    function P_ATKwDecimal(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments) = getAllStats(summoner);
        return ATKWDecimals(_generatedStatsFromEquipments.P_ATK, _summonerStats.STR + _statsFromEquipments.STR);
    }

    function M_ATK(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments) = getAllStats(summoner);
        return ATKWDecimals(_generatedStatsFromEquipments.M_ATK, _summonerStats.INT + _statsFromEquipments.INT) / GameConstants.GAME_DECIMAL;
    }

    function M_ATKwDecimal(uint summoner) public view returns (uint) {
        (GameObjects.Stats memory _summonerStats,
        GameObjects.Stats memory _statsFromEquipments,
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments) = getAllStats(summoner);
        return ATKWDecimals(_generatedStatsFromEquipments.M_ATK, _summonerStats.INT + _statsFromEquipments.INT);
    }

    function ATKWDecimals(uint STAT, uint ATK) public pure returns (uint) {
        // (equipTotalAttack+(1+(STR/200))+STR/2)
        uint ATK_W_DECIMAL = ATK * GameConstants.GAME_DECIMAL;
        uint STAT_W_DECIMAL = STAT * GameConstants.GAME_DECIMAL;
        uint ATK_BONUS_FROM_STATS = (GameConstants.GAME_DECIMAL + (STAT_W_DECIMAL / 200)) + (STAT_W_DECIMAL / 2);
        return ATK_W_DECIMAL + ATK_BONUS_FROM_STATS;
    }







    function dodge() external view returns (uint){
        return 0;
    }

    // @notice UTILS

    function getAllStats(uint summoner) internal view returns (GameObjects.Stats memory, GameObjects.Stats memory, GameObjects.GeneratedStats memory) {
        address equipableAddress = contractAddress(INavigator.CONTRACT.EQUIPABLES);
        address attributesAddress = contractAddress(INavigator.CONTRACT.ATTRIBUTES);
        IEquipable equipablesContract = IEquipable(equipableAddress);
        IAttributes attributesContract = IAttributes(attributesAddress);
        GameObjects.Stats memory _summonerStats = attributesContract.stats(summoner);
        GameObjects.Stats memory _statsFromEquipments = equipablesContract.getPreCalculatedStats(summoner);
        GameObjects.GeneratedStats memory _generatedStatsFromEquipments = equipablesContract.getPreCalculatedGeneratedStats(summoner);
        return (_summonerStats, _statsFromEquipments, _generatedStatsFromEquipments);
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
        if (_class == GameObjects.Class.Barbarian)
            return GameObjects.GeneratedStats({P_ATK : 0, M_ATK : 0, P_DEF : 0, M_DEF : 0, ACCURACY : 0, DODGE : 0, CRIT : 0, CRIT_MULTIPLIER : 0});
        else if (_class == GameObjects.Class.Paladin)
            return GameObjects.GeneratedStats({P_ATK : 0, M_ATK : 0, P_DEF : 0, M_DEF : 0, ACCURACY : 0, DODGE : 0, CRIT : 0, CRIT_MULTIPLIER : 0});
        else if (_class == GameObjects.Class.Assassin)
            return GameObjects.GeneratedStats({P_ATK : 0, M_ATK : 0, P_DEF : 0, M_DEF : 0, ACCURACY : 0, DODGE : 0, CRIT : 0, CRIT_MULTIPLIER : 0});
        else if (_class == GameObjects.Class.Wizard)
            return GameObjects.GeneratedStats({P_ATK : 0, M_ATK : 0, P_DEF : 0, M_DEF : 0, ACCURACY : 0, DODGE : 0, CRIT : 0, CRIT_MULTIPLIER : 0});
        else if (_class == GameObjects.Class.Necromancer)
            return GameObjects.GeneratedStats({P_ATK : 0, M_ATK : 0, P_DEF : 0, M_DEF : 0, ACCURACY : 0, DODGE : 0, CRIT : 0, CRIT_MULTIPLIER : 0});
        else if (_class == GameObjects.Class.Priest)
            return GameObjects.GeneratedStats({P_ATK : 0, M_ATK : 0, P_DEF : 0, M_DEF : 0, ACCURACY : 0, DODGE : 0, CRIT : 0, CRIT_MULTIPLIER : 0});
        return GameObjects.GeneratedStats({P_ATK : 0, M_ATK : 0, P_DEF : 0, M_DEF : 0, ACCURACY : 0, DODGE : 0, CRIT : 0, CRIT_MULTIPLIER : 0});
    }
}
