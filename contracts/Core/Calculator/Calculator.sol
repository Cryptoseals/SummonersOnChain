import "../../Interfaces/Core/Calculator/ICalculator.sol";
import "../../Core/Navigator/InitNavigator.sol";
import "../../Interfaces/Codex/ICodexWeapons.sol";
import "../../Interfaces/Attributes/IAttributes.sol";
pragma solidity ^0.8.0;

contract Calculator is InitNavigator, ICalculator {

    constructor(address _navigator) InitNavigator(_navigator) {}

    function damage(uint ATK, uint DEF) external view override returns (uint){
        return ATK * (100 / (100 + DEF));
    }

    function dodge() external view returns (uint){
        return 0;
    }

    function getWeapon(uint id, uint tier) internal view returns (GameObjects.Weapon memory) {
        address codex = InitNavigator.contractAddress(INavigator.CONTRACT.WEAPONS_CODEX);
        return ICodexWeapons(codex).weapon(id, tier);
    }

    function generatedStats(uint summoner) internal view returns (GameObjects.GeneratedStats memory _generated) {
        address attributes = InitNavigator.contractAddress(INavigator.CONTRACT.WEAPONS_CODEX);
        GameObjects.Stats memory _stats = IAttributes(attributes).stats(summoner);

        // TODO calculate generated stats according to GDD Formula

        return _generated;
    }

    function classBaseStats(GameObjects.Class _class) public view returns (GameObjects.GeneratedStats memory) {
        if (_class == GameObjects.Class.Barbarian)
            return GameObjects.GeneratedStats({P_ATK : 0, M_ATK : 0, P_DEF : 0, M_DEF : 0, ACCURACY : 0, DODGE : 0});
        else if (_class == GameObjects.Class.Paladin)
            return GameObjects.GeneratedStats({P_ATK: 0, M_ATK: 0, P_DEF: 0, M_DEF: 0, ACCURACY: 0, DODGE: 0});
        else if (_class == GameObjects.Class.Assassin)
            return GameObjects.GeneratedStats({P_ATK: 0, M_ATK: 0, P_DEF: 0, M_DEF: 0, ACCURACY: 0, DODGE: 0});
        else if (_class == GameObjects.Class.Wizard)
            return GameObjects.GeneratedStats({P_ATK: 0, M_ATK: 0, P_DEF: 0, M_DEF: 0, ACCURACY: 0, DODGE: 0});
        else if (_class == GameObjects.Class.Necromancer)
            return GameObjects.GeneratedStats({P_ATK: 0, M_ATK: 0, P_DEF: 0, M_DEF: 0, ACCURACY: 0, DODGE: 0});
        else if (_class == GameObjects.Class.Priest)
            return GameObjects.GeneratedStats({P_ATK: 0, M_ATK: 0, P_DEF: 0, M_DEF: 0, ACCURACY: 0, DODGE: 0});
        return GameObjects.GeneratedStats({P_ATK: 0, M_ATK: 0, P_DEF: 0, M_DEF: 0, ACCURACY: 0, DODGE: 0});
    }
}
