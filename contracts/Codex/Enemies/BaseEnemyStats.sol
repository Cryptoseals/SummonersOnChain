import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {GameObjects, GameObjects_Stats} from "../../Interfaces/GameObjects/IGameObjects.sol";

pragma solidity ^0.8.0;

contract BaseEnemyStats is Initializable {
    string constant public index = "Codex";
    string constant public class = "BaseEnemyStats";
    string constant public version = "0.0.1";

    uint[100] public ENEMY_BASE_HP;
    uint[100] public ENEMY_BASE_DEF;
    uint[100] public ENEMY_BASE_ATK;
    uint[100] public ENEMY_BASE_STR;
    uint[100] public ENEMY_BASE_AGI;
    uint[100] public ENEMY_BASE_DEX;
    uint[100] public ENEMY_BASE_INT;
    uint[100] public ENEMY_BASE_VIT;
    uint[100] public ENEMY_BASE_LUCK;
    uint[100] public ENEMY_BASE_ACC;
    uint[100] public ENEMY_BASE_DODGE;
    uint[100] public ENEMY_BASE_CRIT;
    uint[100] public ENEMY_BASE_CRIT_MULTI;

    function initializeDEF() external {
        ENEMY_BASE_DEF = [100, 104, 108, 112, 116, 120, 124, 128, 133, 138, 143, 148, 153, 159, 165, 171, 177, 184, 191, 198, 205, 213, 221, 229, 238, 247, 256, 266, 276, 287, 298, 309, 321, 333, 346, 359, 373, 387, 402, 418, 434, 451, 469, 487, 506, 526, 547, 568, 590, 613, 637, 662, 688, 715, 743, 772, 802, 834, 867, 901, 937, 974, 1012, 1052, 1094, 1137, 1182, 1229, 1278, 1329, 1382, 1437, 1494, 1553, 1615, 1679, 1746, 1815, 1887, 1962, 2040, 2121, 2205, 2293, 2384, 2479, 2578, 2681, 2788, 2899, 3014, 3134, 3259, 3389, 3524, 3664, 3810, 3962, 4120, 4284];
    }

    function initializeHP() external {
        ENEMY_BASE_HP = [120, 240, 366, 492, 618, 756, 894, 1035, 1167, 1311, 1458, 1605, 1761, 1911, 2070, 2232, 2397, 2559, 2721, 2895, 3072, 3246, 3432, 3621, 3804, 4002, 4200, 4395, 4602, 4803, 5016, 5244, 5463, 5697, 5922, 6159, 6390, 6633, 6879, 7119, 7380, 7632, 7887, 8151, 8418, 8688, 8958, 9246, 9537, 9825, 10125, 10425, 10731, 11046, 11361, 11679, 12015, 12342, 12672, 13017, 13356, 13710, 14073, 14439, 14799, 15177, 15555, 15939, 16332, 16728, 17130, 17538, 17952, 18381, 18807, 19242, 19686, 20142, 20601, 21069, 21540, 22020, 22512, 23004, 23505, 24012, 24522, 25041, 25569, 26106, 26658, 27210, 27774, 28344, 28923, 29514, 30114, 30717, 31332, 31956];
    }

    function initializeATK() external {
        ENEMY_BASE_ATK = [100, 104, 108, 112, 116, 120, 124, 128, 133, 138, 143, 148, 153, 159, 165, 171, 177, 184, 191, 198, 205, 213, 221, 229, 238, 247, 256, 266, 276, 287, 298, 309, 321, 333, 346, 359, 373, 387, 402, 418, 434, 451, 469, 487, 506, 526, 547, 568, 590, 613, 637, 662, 688, 715, 743, 772, 802, 834, 867, 901, 937, 974, 1012, 1052, 1094, 1137, 1182, 1229, 1278, 1329, 1382, 1437, 1494, 1553, 1615, 1679, 1746, 1815, 1887, 1962, 2040, 2121, 2205, 2293, 2384, 2479, 2578, 2681, 2788, 2899, 3014, 3134, 3259, 3389, 3524, 3664, 3810, 3962, 4120, 4284];
    }

    function initializeSTR() external {
        ENEMY_BASE_STR = [40, 80, 120, 160, 200, 240, 280, 320, 360, 400, 440, 480, 520, 560, 600, 640, 680, 720, 760, 800, 840, 880, 920, 960, 1000, 1040, 1080, 1120, 1160, 1200, 1240, 1280, 1320, 1360, 1400, 1440, 1480, 1520, 1560, 1600, 1640, 1680, 1720, 1760, 1800, 1840, 1880, 1920, 1960, 2000, 2040, 2080, 2120, 2160, 2200, 2240, 2280, 2320, 2360, 2400, 2440, 2480, 2520, 2560, 2600, 2640, 2680, 2720, 2760, 2800, 2840, 2880, 2920, 2960, 3000, 3040, 3080, 3120, 3160, 3200, 3240, 3280, 3320, 3360, 3400, 3440, 3480, 3520, 3560, 3600, 3640, 3680, 3720, 3760, 3800, 3840, 3880, 3920, 3960, 4000];
    }

    function initializeAGI() external {
        ENEMY_BASE_AGI = [40, 80, 120, 160, 200, 240, 280, 320, 360, 400, 440, 480, 520, 560, 600, 640, 680, 720, 760, 800, 840, 880, 920, 960, 1000, 1040, 1080, 1120, 1160, 1200, 1240, 1280, 1320, 1360, 1400, 1440, 1480, 1520, 1560, 1600, 1640, 1680, 1720, 1760, 1800, 1840, 1880, 1920, 1960, 2000, 2040, 2080, 2120, 2160, 2200, 2240, 2280, 2320, 2360, 2400, 2440, 2480, 2520, 2560, 2600, 2640, 2680, 2720, 2760, 2800, 2840, 2880, 2920, 2960, 3000, 3040, 3080, 3120, 3160, 3200, 3240, 3280, 3320, 3360, 3400, 3440, 3480, 3520, 3560, 3600, 3640, 3680, 3720, 3760, 3800, 3840, 3880, 3920, 3960, 4000];
    }

    function initializeDEX() external {
        ENEMY_BASE_DEX = [40, 80, 120, 160, 200, 240, 280, 320, 360, 400, 440, 480, 520, 560, 600, 640, 680, 720, 760, 800, 840, 880, 920, 960, 1000, 1040, 1080, 1120, 1160, 1200, 1240, 1280, 1320, 1360, 1400, 1440, 1480, 1520, 1560, 1600, 1640, 1680, 1720, 1760, 1800, 1840, 1880, 1920, 1960, 2000, 2040, 2080, 2120, 2160, 2200, 2240, 2280, 2320, 2360, 2400, 2440, 2480, 2520, 2560, 2600, 2640, 2680, 2720, 2760, 2800, 2840, 2880, 2920, 2960, 3000, 3040, 3080, 3120, 3160, 3200, 3240, 3280, 3320, 3360, 3400, 3440, 3480, 3520, 3560, 3600, 3640, 3680, 3720, 3760, 3800, 3840, 3880, 3920, 3960, 4000];
    }

    function initializeINT() external {
        ENEMY_BASE_INT = [40, 80, 120, 160, 200, 240, 280, 320, 360, 400, 440, 480, 520, 560, 600, 640, 680, 720, 760, 800, 840, 880, 920, 960, 1000, 1040, 1080, 1120, 1160, 1200, 1240, 1280, 1320, 1360, 1400, 1440, 1480, 1520, 1560, 1600, 1640, 1680, 1720, 1760, 1800, 1840, 1880, 1920, 1960, 2000, 2040, 2080, 2120, 2160, 2200, 2240, 2280, 2320, 2360, 2400, 2440, 2480, 2520, 2560, 2600, 2640, 2680, 2720, 2760, 2800, 2840, 2880, 2920, 2960, 3000, 3040, 3080, 3120, 3160, 3200, 3240, 3280, 3320, 3360, 3400, 3440, 3480, 3520, 3560, 3600, 3640, 3680, 3720, 3760, 3800, 3840, 3880, 3920, 3960, 4000];
    }

    function initializeVIT() external {
        ENEMY_BASE_VIT = [40, 80, 120, 160, 200, 240, 280, 320, 360, 400, 440, 480, 520, 560, 600, 640, 680, 720, 760, 800, 840, 880, 920, 960, 1000, 1040, 1080, 1120, 1160, 1200, 1240, 1280, 1320, 1360, 1400, 1440, 1480, 1520, 1560, 1600, 1640, 1680, 1720, 1760, 1800, 1840, 1880, 1920, 1960, 2000, 2040, 2080, 2120, 2160, 2200, 2240, 2280, 2320, 2360, 2400, 2440, 2480, 2520, 2560, 2600, 2640, 2680, 2720, 2760, 2800, 2840, 2880, 2920, 2960, 3000, 3040, 3080, 3120, 3160, 3200, 3240, 3280, 3320, 3360, 3400, 3440, 3480, 3520, 3560, 3600, 3640, 3680, 3720, 3760, 3800, 3840, 3880, 3920, 3960, 4000];
    }

    function initializeLUCK() external {
        ENEMY_BASE_LUCK = [40, 80, 120, 160, 200, 240, 280, 320, 360, 400, 440, 480, 520, 560, 600, 640, 680, 720, 760, 800, 840, 880, 920, 960, 1000, 1040, 1080, 1120, 1160, 1200, 1240, 1280, 1320, 1360, 1400, 1440, 1480, 1520, 1560, 1600, 1640, 1680, 1720, 1760, 1800, 1840, 1880, 1920, 1960, 2000, 2040, 2080, 2120, 2160, 2200, 2240, 2280, 2320, 2360, 2400, 2440, 2480, 2520, 2560, 2600, 2640, 2680, 2720, 2760, 2800, 2840, 2880, 2920, 2960, 3000, 3040, 3080, 3120, 3160, 3200, 3240, 3280, 3320, 3360, 3400, 3440, 3480, 3520, 3560, 3600, 3640, 3680, 3720, 3760, 3800, 3840, 3880, 3920, 3960, 4000];
    }

    function initializeACC() external {
        ENEMY_BASE_ACC = [250, 260, 270, 280, 291, 302, 314, 326, 339, 352, 366, 380, 395, 410, 426, 443, 460, 478, 497, 516, 536, 557, 579, 602, 626, 651, 677, 704, 732, 761, 791, 822, 854, 888, 923, 959, 997, 1036, 1077, 1120, 1164, 1210, 1258, 1308, 1360, 1414, 1470, 1528, 1589, 1652, 1718, 1786, 1857, 1931, 2008, 2088, 2171, 2257, 2347, 2440, 2537, 2638, 2743, 2852, 2966, 3084, 3207, 3335, 3468, 3606, 3750, 3900, 4056, 4218, 4386, 4561, 4743, 4932, 5129, 5334, 5547, 5768, 5998, 6237, 6486, 6745, 7014, 7294, 7585, 7888, 8203, 8531, 8872, 9226, 9595, 9978, 10377, 10792, 11223, 11671];
    }

    function initializeDODGE() external {
        ENEMY_BASE_DODGE = [1000, 1020, 1040, 1060, 1081, 1102, 1124, 1146, 1168, 1191, 1214, 1238, 1262, 1287, 1312, 1338, 1364, 1391, 1418, 1446, 1474, 1503, 1533, 1563, 1594, 1625, 1657, 1690, 1723, 1757, 1792, 1827, 1863, 1900, 1938, 1976, 2015, 2055, 2096, 2137, 2179, 2222, 2266, 2311, 2357, 2404, 2452, 2501, 2551, 2602, 2654, 2707, 2761, 2816, 2872, 2929, 2987, 3046, 3106, 3168, 3231, 3295, 3360, 3427, 3495, 3564, 3635, 3707, 3781, 3856, 3933, 4011, 4091, 4172, 4255, 4340, 4426, 4514, 4604, 4696, 4789, 4884, 4981, 5080, 5181, 5284, 5389, 5496, 5605, 5717, 5831, 5947, 6065, 6186, 6309, 6435, 6563, 6694, 6827, 6963];
    }

    function initializeCRIT() external {
        ENEMY_BASE_CRIT = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 12, 12, 12, 12, 12, 13, 13, 13, 13, 13, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 21];
    }

    function initializeCRITMULT() external {
        ENEMY_BASE_CRIT_MULTI = [150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 202, 204, 206, 208, 210, 212, 214, 216, 218, 220, 222, 224, 226, 228, 230, 232, 234, 236, 238, 240, 242, 244, 246, 248, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250];
    }

    modifier maxLvl(uint level) {
        require(level > 0 &&  level < 101, "lvl");
        _;
    }

    function enemyDEF(GameObjects.Element element, uint level) maxLvl(level) external view returns (uint) {
        uint def = ENEMY_BASE_DEF[level - 1];
        return def;
    }

    function enemyHP(GameObjects.Element element, uint level) maxLvl(level) external view returns (uint) {
        uint hp = ENEMY_BASE_HP[level - 1];
        return hp;
    }

    function enemyACC(GameObjects.Element element, uint level) maxLvl(level) external view returns (uint) {
        uint acc = ENEMY_BASE_ACC[level - 1];
        return acc;
    }

    function enemyDODGE(GameObjects.Element element, uint level) maxLvl(level) external view returns (uint) {
        uint dodge = ENEMY_BASE_DODGE[level - 1];
        return dodge;
    }

    function enemySTAT(GameObjects.Element element, uint level) maxLvl(level) external view returns (GameObjects_Stats.Stats memory) {

        return GameObjects_Stats.Stats({
        STR : ENEMY_BASE_STR[level - 1],
        AGI : ENEMY_BASE_AGI[level - 1],
        INT : ENEMY_BASE_INT[level - 1],
        DEX : ENEMY_BASE_DEX[level - 1],
        VIT : ENEMY_BASE_VIT[level - 1],
        LUCK : ENEMY_BASE_LUCK[level - 1]
        });
    }

    function enemyATK(GameObjects.Element element, uint level) maxLvl(level) external view returns (uint) {
        uint atk = ENEMY_BASE_ATK[level - 1];
        return atk;
    }

    function enemyCRIT(GameObjects.Element element, uint level) maxLvl(level) external view returns (uint) {
        uint crit = ENEMY_BASE_CRIT[level - 1];
        return crit;
    }

    function enemyCRIT_MULT(GameObjects.Element element, uint level) maxLvl(level) external view returns (uint) {
        uint crit = ENEMY_BASE_CRIT_MULTI[level - 1];
        return crit;
    }

    function getStatSet(uint level) maxLvl(level) external view returns (GameObjects_Stats.Stats memory, GameObjects_Stats.GeneratedStats memory, GameObjects_Stats.ElementalStats memory ele_stats) {

        GameObjects_Stats.Stats memory stats = GameObjects_Stats.Stats({
        STR : ENEMY_BASE_STR[level - 1],
        AGI : ENEMY_BASE_AGI[level - 1],
        INT : ENEMY_BASE_INT[level - 1],
        DEX : ENEMY_BASE_DEX[level - 1],
        VIT : ENEMY_BASE_VIT[level - 1],
        LUCK : ENEMY_BASE_LUCK[level - 1]
        });

        GameObjects_Stats.GeneratedStats memory gen_stats = GameObjects_Stats.GeneratedStats({
        HP : ENEMY_BASE_HP[level - 1],
        P_ATK : ENEMY_BASE_ATK[level - 1],
        M_ATK : ENEMY_BASE_ATK[level - 1],
        P_DEF : ENEMY_BASE_DEF[level - 1],
        M_DEF : ENEMY_BASE_DEF[level - 1],
        ACCURACY : ENEMY_BASE_ACC[level - 1],
        DODGE : ENEMY_BASE_DODGE[level - 1],
        CRIT : ENEMY_BASE_CRIT[level - 1],
        CRIT_MULTIPLIER : ENEMY_BASE_CRIT_MULTI[level - 1],
        INFUSION : 0
        });

        ele_stats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : ENEMY_BASE_ATK[level - 1],
        COLD_ATK : ENEMY_BASE_ATK[level - 1],
        EARTH_ATK : ENEMY_BASE_ATK[level - 1],
        LIGHTNING_ATK : ENEMY_BASE_ATK[level - 1],
        DARK_ATK : ENEMY_BASE_ATK[level - 1],
        HOLY_ATK : ENEMY_BASE_ATK[level - 1],
        VOID_ATK : ENEMY_BASE_ATK[level - 1]
        });

        ele_stats.ElementalDef = GameObjects_Stats.ElementalDef({
        FIRE_DEF : ENEMY_BASE_DEF[level - 1],
        COLD_DEF : ENEMY_BASE_DEF[level - 1],
        EARTH_DEF : ENEMY_BASE_DEF[level - 1],
        LIGHTNING_DEF : ENEMY_BASE_DEF[level - 1],
        DARK_DEF : ENEMY_BASE_DEF[level - 1],
        HOLY_DEF : ENEMY_BASE_DEF[level - 1],
        VOID_DEF : ENEMY_BASE_DEF[level - 1]
        });

        return (stats, gen_stats, ele_stats);
    }
}
