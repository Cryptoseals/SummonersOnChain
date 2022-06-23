import "../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

contract CodexMounts {
    string constant public index = "Codex";
    string constant public class = "Mounts";
    string constant public version = "0.0.1";

    function mount(uint _id, uint _tier) public pure returns (GameObjects.Mount memory) {
        if (_id == 1) {
            return DummyDonkey(_tier);
        }

        revert("invalid");
    }

    function DummyDonkey(uint tier) public pure returns (GameObjects.Mount memory _mount) {
        _mount.metadata.id = 1;
        _mount.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _mount.metadata.name = "Dummy Donkey";
        _mount.metadata.description = "Dummy Donkey is best mount";
        _mount.metadata.upgradable = true;

        _mount.requirement.level = 1;
        _mount.requirement.classRequirement = new GameObjects.Class[](0);
        _mount.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _mount.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _mount.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION: 0});
    }
}
