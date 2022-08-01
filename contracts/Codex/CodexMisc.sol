import {GameObjects, GameObjects_Equipments} from "../Interfaces/GameObjects/IGameObjects.sol";
import "./Common/Rarity.sol";

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract CodexMiscItems is Rarity {
    string constant public index = "Codex";
    string constant public class = "MiscItems";
    string constant public version = "0.0.1";

    function getAllMiscItems() external pure returns (GameObjects_Equipments.MiscItem[] memory) {
        GameObjects_Equipments.MiscItem[] memory result = new GameObjects_Equipments.MiscItem[](66);
        for (uint i = 1; i <= 66; i++) {
            result[i - 1] = item(i);
        }
        return result;
    }

    function item(uint _id) public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        if (_id == 0) {
            _misc = Junk();
        }
        if (_id == 1) {
            _misc = Rope();
        } else if (_id == 2) {
            _misc = Bronze_Coin();
        } else if (_id == 3) {
            _misc = Poisonous_Fang();
        } else if (_id == 4) {
            _misc = Fish_Bone();
        } else if (_id == 5) {
            _misc = Feathers();
        } else if (_id == 6) {
            _misc = Unknown_Key();
        } else if (_id == 7) {
            _misc = Silver_Chalice();
        } else if (_id == 8) {
            _misc = Golden_Chalice();
        } else if (_id == 9) {
            _misc = Needle();
        } else if (_id == 10) {
            _misc = Scissor();
        } else if (_id == 11) {
            _misc = Alcohol();
        } else if (_id == 12) {
            _misc = Mirror();
        } else if (_id == 13) {
            _misc = Broom();
        } else if (_id == 14) {
            _misc = Broken_Knife();
        } else if (_id == 15) {
            _misc = Unknown_Map();
        } else if (_id == 16) {
            _misc = Ribbon();
        } else if (_id == 17) {
            _misc = Nails();
        } else if (_id == 18) {
            _misc = Bucket();
        } else if (_id == 19) {
            _misc = Seed();
        } else if (_id == 20) {
            _misc = Tribal_Mask();
        } else if (_id == 21) {
            _misc = Skull();
        } else if (_id == 22) {
            _misc = Engagement_Ring();
        } else if (_id == 23) {
            _misc = Broken_Teeth();
        } else if (_id == 24) {
            _misc = Amethyst_Shard();
        } else if (_id == 25) {
            _misc = Horseshoe();
        } else if (_id == 26) {
            _misc = Voodoo();
        } else if (_id == 27) {
            _misc = Unlit_Torch();
        } else if (_id == 28) {
            _misc = Lit_Torch();
        } else if (_id == 29) {
            _misc = Bat_Wing();
        } else if (_id == 30) {
            _misc = Sailing_Rope();
        } else if (_id == 31) {
            _misc = Gaslamp();
        } else if (_id == 32) {
            _misc = Rotten_Plank();
        } else if (_id == 33) {
            _misc = Entrails();
        } else if (_id == 34) {
            _misc = Heart();
        } else if (_id == 35) {
            _misc = Infused_Heart();
        } else if (_id == 36) {
            _misc = Magma_Heart();
        } else if (_id == 37) {
            _misc = Eye();
        } else if (_id == 38) {
            _misc = Bandit_Trophy();
        } else if (_id == 39) {
            _misc = Ball_Of_Yarn();
        } else if (_id == 40) {
            _misc = Anchor();
        } else if (_id == 41) {
            _misc = Shovel();
        } else if (_id == 42) {
            _misc = Stolen_Gol_Bar();
        } else if (_id == 43) {
            _misc = Golden_Skull();
        } else if (_id == 44) {
            _misc = Hook();
        } else if (_id == 45) {
            _misc = Dice();
        } else if (_id == 46) {
            _misc = Gold_Chunk();
        } else if (_id == 47) {
            _misc = Lock();
        } else if (_id == 48) {
            _misc = Stolen_Treasure();
        } else if (_id == 49) {
            _misc = Whip();
        } else if (_id == 50) {
            _misc = Animal_Scales();
        } else if (_id == 51) {
            _misc = Alchemy_Mortar();
        } else if (_id == 52) {
            _misc = Chain();
        } else if (_id == 53) {
            _misc = Ancient_Statue();
        } else if (_id == 54) {
            _misc = Chisel();
        } else if (_id == 55) {
            _misc = Hammer();
        } else if (_id == 56) {
            _misc = Infused_Horseshoe();
        } else if (_id == 57) {
            _misc = Otherworldly_Horseshoe();
        } else if (_id == 58) {
            _misc = Magical_Horseshoe();
        } else if (_id == 59) {
            _misc = Silver_Horseshoe();
        } else if (_id == 60) {
            _misc = Usable_Horseshoe();
        } else if (_id == 61) {
            _misc = Key_Of_Order();
        } else if (_id == 62) {
            _misc = Key_Of_Wraith();
        } else if (_id == 63) {
            _misc = Whetstone();
        } else if (_id == 64) {
            _misc = Leather_Patch();
        } else if (_id == 65) {
            _misc = Stolen_Silver_Bar();
        } else if (_id == 66) {
            _misc = Stolen_Copper_Bar();
        } else if (_id == 67) {
            _misc = Lost_Diary();
        } else if (_id == 68) {
            _misc = Spoon();
        } else if (_id == 69) {
            _misc = Crown();
        } else if (_id == 70) {
            _misc = Unknown_Recipe();
        } else if (_id == 71) {
            _misc = Vial_Of_Poison();
        } else if (_id == 72) {
            _misc = Vial_Of_Blood();
        } else if (_id == 73) {
            _misc = Fang();
        } else if (_id == 74) {
            _misc = Professional_Fishing_Rod();
        } else if (_id == 75) {
            _misc = Explosive();
        } else if (_id == 76) {
            _misc = Gun_Powder();
        } else if (_id == 77) {
            _misc = Magic_Powder();
        } else if (_id == 78) {
            _misc = Mechanics_Handbook();
        } else if (_id == 79) {
            _misc = RoyalCoin();
        } else {
            revert("wrong");
        }

        _misc.metadata.baseType = GameObjects.ItemType.MISC;

    }

    function Junk() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 0;
    }

    function Rope() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 1;
    }

    function Bronze_Coin() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {

        _misc.metadata.id = 2;
    }

    function Poisonous_Fang() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 3;
    }

    function Fish_Bone() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 4;
    }

    function Feathers() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 5;
    }

    function Unknown_Key() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 6;
    }

    function Silver_Chalice() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 7;
    }

    function Golden_Chalice() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 8;
    }

    function Needle() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 9;
    }

    function Scissor() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 10;
    }

    function Alcohol() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 11;
    }

    function Mirror() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 12;
    }

    function Broom() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 13;
    }

    function Broken_Knife() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 14;
    }

    function Unknown_Map() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 15;
    }

    function Ribbon() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 16;
    }

    function Nails() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 17;
    }

    function Bucket() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 18;
    }

    function Seed() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 19;
    }

    function Tribal_Mask() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 20;
    }

    function Skull() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 21;
    }

    function Engagement_Ring() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 22;
    }

    function Broken_Teeth() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 23;
    }

    function Amethyst_Shard() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 24;
    }

    function Horseshoe() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 25;
    }

    function Voodoo() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 26;
    }

    function Unlit_Torch() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 27;
    }

    function Lit_Torch() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 28;
    }

    function Bat_Wing() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 29;
    }

    function Sailing_Rope() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 30;
    }

    function Gaslamp() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 31;
    }

    function Rotten_Plank() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 32;
    }

    function Entrails() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 33;
    }

    function Heart() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 34;
    }

    function Infused_Heart() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 35;
    }

    function Magma_Heart() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 36;
    }

    function Eye() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 37;
    }

    function Bandit_Trophy() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 38;
    }

    function Ball_Of_Yarn() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 39;
    }

    function Anchor() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 40;
    }

    function Shovel() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 41;
    }

    function Stolen_Gol_Bar() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 42;
    }

    function Golden_Skull() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 43;
    }

    function Hook() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 44;
    }

    function Dice() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 45;
    }

    function Gold_Chunk() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 46;
    }

    function Lock() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 47;
    }

    function Stolen_Treasure() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 48;
    }

    function Whip() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 49;
    }

    function Animal_Scales() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 50;
    }

    function Alchemy_Mortar() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 51;
    }

    function Chain() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 52;
    }

    function Ancient_Statue() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 53;
    }

    function Chisel() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 54;
    }

    function Hammer() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 55;
    }

    function Infused_Horseshoe() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 56;
    }

    function Otherworldly_Horseshoe() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 57;
    }

    function Magical_Horseshoe() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 58;
    }

    function Silver_Horseshoe() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 59;
    }

    function Usable_Horseshoe() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 60;
    }

    function Key_Of_Order() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 61;
    }

    function Key_Of_Wraith() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 62;
    }

    function Whetstone() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 63;
    }

    function Leather_Patch() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 64;
    }

    function Stolen_Silver_Bar() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 65;
    }

    function Stolen_Copper_Bar() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 66;
    }

    function Lost_Diary() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 67;
    }

    function Spoon() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 68;
    }

    function Crown() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 69;
    }

    function Unknown_Recipe() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 70;
    }

    function Vial_Of_Poison() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 71;
    }

    function Vial_Of_Blood() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 72;
    }

    function Fang() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 73;
    }

    function Professional_Fishing_Rod() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 74;
    }

    function Explosive() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 75;
    }

    function Gun_Powder() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 76;
    }

    function Magic_Powder() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 77;
    }

    function Mechanics_Handbook() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 78;
    }

    function RoyalCoin() public pure returns (GameObjects_Equipments.MiscItem memory _misc) {
        _misc.metadata.id = 79;
    }
}