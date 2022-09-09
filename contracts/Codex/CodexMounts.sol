import {Mount, ItemType} from "../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

contract CodexMounts {
    string constant public index = "Codex";
    string constant public class = "Mounts";
    string constant public version = "0.0.1";

    function mount(uint _id, uint _tier) public pure returns (Mount memory) {
        if (_id == 1) {
            return DummyDonkey(_tier);
        }

        revert("invalid");
    }

    function DummyDonkey(uint tier) public pure returns (Mount memory _mount) {
        _mount.metadata.id = 1;
        _mount.metadata.baseType = ItemType.MOUNT;
//        _mount.metadata.name = "Dummy Donkey";
//        _mount.metadata.description = "Dummy Donkey is best mount";
        _mount.metadata.upgradable = true;
        _mount.requirement.level = 1;
    }
}
