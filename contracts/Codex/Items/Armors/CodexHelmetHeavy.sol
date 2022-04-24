import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../../../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexHelmetHeavy is Initializable {
    uint[21] public BASE_STR;
    uint[21] public BASE_AGI;
    uint[21] public BASE_INT;
    uint[21] public BASE_DEX;
    uint[21] public BASE_VIT;
    uint[21] public BASE_DEF;
    uint[21] public BASE_MDEF;
    uint[21] public BASE_HP;
    uint[21] public BASE_DODGE;
    uint[21] public BASE_ACCURACY;
    uint[21] public BASE_ELE_DEF;


    function initialize() external initializer {
        initializeSTR();
        initializeAGI();
        initializeINT();
        initializeDEX();
        initializeVIT();
        initializeDEF();
        initializeMDEF();
        initializeHP();
        initializeDODGE();
        initializeACCURACY();
        initializeELE_DEF();
    }

    function initializeSTR() public {
        BASE_STR = [2, 9, 17, 25, 33, 42, 50, 58, 66, 75, 83, 91, 99, 108, 116, 124, 132, 141, 149, 157, 165];
    }

    function initializeAGI() public {
        BASE_AGI = [2, 7, 14, 21, 27, 34, 41, 48, 54, 61, 68, 75, 81, 88, 95, 102, 108, 115, 122, 129, 135];
    }

    function initializeINT() public {
        BASE_INT = [4, 19, 38, 57, 76, 95, 114, 133, 152, 171, 190, 209, 228, 247, 266, 285, 304, 323, 342, 361, 380];
    }

    function initializeDEX() public {
        BASE_DEX = [1, 5, 9, 14, 18, 23, 27, 32, 36, 41, 45, 50, 54, 59, 63, 68, 72, 77, 81, 86, 90];
    }

    function initializeVIT() public {
        BASE_VIT = [7, 33, 66, 99, 132, 165, 198, 231, 264, 297, 330, 363, 396, 429, 462, 495, 528, 561, 594, 627, 660];
    }

    function initializeDEF() public {
        BASE_DEF = [24, 28, 34, 40, 48, 57, 69, 84, 101, 122, 148, 179, 217, 263, 319, 388, 471, 573, 696, 846, 1029];
    }

    function initializeMDEF() public {
        BASE_MDEF = [10, 12, 14, 16, 19, 23, 28, 33, 40, 49, 59, 71, 86, 104, 127, 154, 187, 227, 276, 335, 407];
    }

    function initializeHP() public {
        BASE_HP = [50, 250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000];
    }

    function initializeDODGE() public {
        BASE_DODGE = [45, 55, 70, 89, 113, 144, 183, 233, 297, 379, 483, 599, 787, 1004, 1281, 1634, 2085, 2661, 3396, 4334, 5530];
    }

    function initializeACCURACY() public {
        BASE_ACCURACY = [22, 26, 31, 37, 45, 54, 65, 79, 96, 116, 141, 171, 208, 253, 307, 373, 454, 552, 671, 816, 993];
    }

    function initializeELE_DEF() public {
        BASE_ELE_DEF = [5, 5, 6, 7, 9, 10, 12, 15, 17, 21, 25, 31, 37, 45, 54, 66, 80, 97, 118, 143, 174];
    }


    function applyTier(GameObjects.Armor memory _armor, uint tier, uint percentage) public view returns (GameObjects._armor memory){
        if (tier == 0) return _armor;
        _armor.generatedStatBonus = EquipableUtils.sumGeneratedStatsAsTier(_armor.generatedStatBonus, (tier) *percentage);
        _armor.elementalStats = EquipableUtils.sumGeneratedElementalStatsAsTier(_armor.elementalStats, (tier) *percentage);
        return _armor;
    }

    function armor(uint id, uint tier) public view returns (GameObjects.Armor memory) {
        require(tier < 10, "t");

        if (id == 64) {
            return applyTier(WoodenAxe(tier), tier, 4);
        }

        revert("?ar");
    }
}
