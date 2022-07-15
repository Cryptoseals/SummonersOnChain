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
        ENEMY_BASE_DEF = [120,124,128,132,136,143,150,157,164,171,178,185,192,199,206,216,226,236,246,256,269,282,295,308,321,337,353,369,385,401,417,433,450,467,484,502,520,538,557,576,596,616,636,657,678,700,722,744,767,790,814,838,863,888,922,958,995,1033,1072,1109,1147,1186,1226,1268,1306,1345,1384,1424,1465,1507,1550,1594,1639,1685,1732,1781,1831,1882,1934,1987,2042,2098,2155,2214,2274,2335,2398,2462,2527,2594,2662,2732,2803,2876,2951,3027,3105,3185,3267,3351];
    }

    function initializeHP() external {
        ENEMY_BASE_HP = [372,418,461,502,593,711,818,916,1005,1088,1198,1300,1394,1482,1564,1688,1801,1904,2000,2087,2215,2330,2436,2532,2621,2748,2864,2969,3066,3155,3303,3454,3608,3765,3924,4084,4246,4410,4576,4745,4916,5090,5267,5447,5630,5815,6003,6194,6389,6588,6790,6995,7204,7417,7709,8011,8323,8645,8978,9296,9623,9959,10304,10659,10981,11311,11648,11993,12346,12707,13077,13455,13842,14238,14644,15059,15484,15919,16365,16821,17288,17766,18256,18757,19270,19794,20329,20876,21435,22007,22591,23188,23799,24423,25062,25715,26383,27067,27767,28483];
    }

    function initializeATK() external {
        ENEMY_BASE_ATK = [263,339,387,423,553,499,315,461,456,455,464,474,485,497,509,522,535,548,562,576,593,610,627,644,661,688,714,741,767,794,825,855,884,913,939,967,1002,1034,1067,1101,1136,1171,1207,1244,1282,1321,1361,1402,1443,1485,1528,1572,1617,1663,1727,1793,1861,1931,2004,2073,2144,2217,2292,2369,2439,2511,2585,2660,2737,2816,2897,2980,3065,3152,3241,3332,3425,3520,3618,3718,3821,3926,4034,4144,4257,4372,4490,4610,4733,4859,4987,5118,5252,5389,5529,5673,5820,5970,6124,6281];
    }

    function initializeSTR() external {
        ENEMY_BASE_STR = [30,43,56,69,82,113,144,175,206,237,266,295,324,353,382,413,444,475,506,537,569,601,633,665,697,728,759,790,821,852,894,937,981,1025,1070,1116,1162,1209,1256,1304,1352,1401,1451,1501,1552,1604,1657,1711,1765,1820,1876,1933,1991,2050,2131,2215,2301,2390,2482,2570,2660,2753,2848,2946,3035,3126,3219,3314,3411,3511,3613,3717,3824,3933,4045,4159,4276,4396,4519,4645,4774,4906,5041,5179,5320,5464,5611,5762,5916,6073,6234,6398,6566,6738,6914,7094,7278,7466,7659,7856];
    }

    function initializeAGI() external {
        ENEMY_BASE_AGI = [25,31,37,43,49,56,63,70,77,85,93,101,109,117,125,132,139,146,153,160,168,176,184,192,200,207,214,221,228,235,246,257,268,279,290,301,312,324,336,348,360,372,384,396,409,422,435,448,461,475,489,503,517,532,552,573,595,617,640,662,685,708,732,757,779,802,825,849,873,898,923,949,976,1003,1031,1070,1110,1152,1195,1240,1287,1335,1385,1437,1491,1547,1605,1665,1727,1791,1857,1926,1997,2071,2147,2226,2308,2393,2481,2572];
    }

    function initializeINT() external {
        ENEMY_BASE_INT = [30,43,56,69,82,113,144,175,206,237,266,295,324,353,382,413,444,475,506,537,569,601,633,665,697,728,759,790,821,852,894,937,981,1025,1070,1116,1162,1209,1256,1304,1352,1401,1451,1501,1552,1604,1657,1711,1765,1820,1876,1933,1991,2050,2131,2215,2301,2390,2482,2570,2660,2753,2848,2946,3035,3126,3219,3314,3411,3511,3613,3717,3824,3933,4045,4159,4276,4396,4519,4645,4774,4906,5041,5179,5320,5464,5611,5762,5916,6073,6234,6398,6566,6738,6914,7094,7278,7466,7659,7856];
    }

    function initializeDEX() external {
        ENEMY_BASE_DEX = [25,33,41,49,57,66,75,84,93,102,112,122,132,142,152,161,170,179,188,197,207,217,227,237,247,256,265,274,283,292,306,320,334,348,362,376,390,405,420,435,450,465,481,497,513,529,546,563,580,597,615,633,651,670,696,723,751,780,810,838,867,897,928,959,987,1016,1046,1076,1107,1139,1172,1205,1239,1274,1310,1347,1384,1422,1461,1501,1542,1584,1627,1671,1716,1762,1809,1857,1906,1956,2007,2059,2113,2168,2224,2281,2340,2400,2461,2524];
    }

    function initializeVIT() external {
        ENEMY_BASE_VIT = [30,56,82,108,134,166,198,230,262,295,328,361,394,427,460,492,524,556,588,620,653,686,719,752,785,817,849,881,913,945,992,1039,1087,1135,1184,1233,1283,1334,1385,1437,1489,1542,1596,1651,1706,1762,1819,1877,1936,1996,2057,2119,2182,2246,2334,2425,2519,2617,2718,2814,2913,3014,3118,3225,3322,3421,3523,3627,3733,3842,3953,4067,4184,4303,4425,4550,4678,4809,4943,5080,5221,5365,5512,5663,5817,5975,6136,6301,6469,6641,6817,6997,7181,7369,7561,7758,7959,8165,8376,8591];
    }

    function initializeLUCK() external {
        ENEMY_BASE_LUCK = [28,36,44,52,60,69,78,87,96,106,116,126,136,146,156,165,174,183,192,201,211,221,231,241,251,260,269,278,287,296,308,322,336,350,364,378,392,407,422,437,452,467,483,499,515,531,548,565,582,599,617,635,653,672,680,706,733,761,790,817,845,874,904,934,961,989,999,1008,1017,1026,1035,1044,1052,1060,1068,1076,1084,1091,1098,1105,1112,1119,1125,1131,1137,1143,1148,1153,1158,1162,1166,1170,1174,1177,1180,1183,1186,1189,1191,1193];
    }

    function initializeACC() external {
        ENEMY_BASE_ACC = [300,312,321,333,346,359,373,387,402,418,434,451,464,477,496,515,535,556,578,601,625,650,682,709,765,795,826,859,893,928,965,1003,1043,1084,1127,1194,1253,1315,1380,1449,1521,1581,1644,1709,1777,1848,1921,1997,2076,2159,2245,2334,2450,2572,2726,2835,2948,3065,3187,3314,3446,3618,3798,3987,4206,4374,4592,4821,5013,5213,5421,5692,5919,6155,6401,6657,6923,7269,7632,8013,8413,8833,9274,9737,10223,10734,11270,11833,12424,13045,13697,14381,15100,15855,16647,17479,18352,19269,20232,21243];
    }

    function initializeDODGE() external {
        ENEMY_BASE_DODGE = [630,661,680,714,749,786,825,858,892,918,963,991,1040,1071,1103,1158,1192,1227,1263,1300,1339,1379,1434,1498,1572,1619,1683,1733,1819,1891,1947,2024,2104,2198,2296,2410,2530,2656,2788,2927,3073,3195,3322,3488,3627,3772,3922,4078,4241,4453,4631,4862,5105,5360,5628,5909,6204,6514,6839,7180,7539,7915,8310,8725,9161,9619,10099,10603,11133,11689,12273,12886,13530,14206,14916,15661,16444,17266,18129,19035,19986,20985,22034,23135,24291,25505,26780,28119,29524,31000,32550,34177,35885,37679,39562,41540,43617,45797,48086,50490];
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
