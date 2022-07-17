import {GameObjects, GameObjects_Stats, GameObjects_Equipments} from "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract CodexSuffixes {
    string constant public index = "Codex";
    string constant public class = "Suffixes";
    string constant public version = "0.0.1";

    function allSuffix(uint tier) external view returns (GameObjects_Equipments.Suffix[] memory){
        GameObjects_Equipments.Suffix[] memory result = new GameObjects_Equipments.Suffix[](45);
        for (uint i = 0; i <= 44; i++) {
            result[i] = suffix(i, tier);
        }
        return result;
    }

    function suffix(uint _id,
        uint _tier) public pure returns (GameObjects_Equipments.Suffix memory) {
        require(_tier < 21, "?");
        if (_id == 0) {
            return none();
        } if (_id == 1) {
            return OfSolarion(_tier);
        } else if (_id == 2) {
            return OfTemplar(_tier);
        } else if (_id == 3) {
            return OfPhoenix(_tier);
        } else if (_id == 4) {
            return OfCelestion(_tier);
        } else if (_id == 5) {
            return OfBaphomet(_tier);
        } else if (_id == 6) {
            return OfSujin(_tier);
        } else if (_id == 7) {
            return OfSentinel(_tier);
        } else if (_id == 8) {
            return OfVerdant(_tier);
        } else if (_id == 9) {
            return OfWatcher(_tier);
        } else if (_id == 10) {
            return OfDeathbringer(_tier);
        } else if (_id == 11) {
            return OfWraith(_tier);
        } else if (_id == 12) {
            return OfSpellcaster(_tier);
        } else if (_id == 13) {
            return OfLuminous(_tier);
        } else if (_id == 14) {
            return OfFallen(_tier);
        } else if (_id == 15) {
            return OfGreedy(_tier);
        } else if (_id == 16) {
            return OfBlacksmith(_tier);
        } else if (_id == 17) {
            return OfSun(_tier);
        } else if (_id == 18) {
            return OfMoon(_tier);
        } else if (_id == 19) {
            return OfStorm(_tier);
        } else if (_id == 20) {
            return OfGladiator(_tier);
        } else if (_id == 21) {
            return OfVoidheart(_tier);
        } else if (_id == 22) {
            return OfTroll(_tier);
        } else if (_id == 23) {
            return OfWarmonger(_tier);
        } else if (_id == 24) {
            return OfAssassin(_tier);
        } else if (_id == 25) {
            return OfDeath(_tier);
        } else if (_id == 26) {
            return OfAcrobat(_tier);
        } else if (_id == 27) {
            return OfShadow(_tier);
        } else if (_id == 28) {
            return OfConcentration(_tier);
        } else if (_id == 29) {
            return OfGuardian(_tier);
        } else if (_id == 30) {
            return OfSavage(_tier);
        } else if (_id == 31) {
            return OfCultist(_tier);
        } else if (_id == 32) {
            return OfFaith(_tier);
        } else if (_id == 33) {
            return OfWanderer(_tier);
        } else if (_id == 34) {
            return OfRoots(_tier);
        } else if (_id == 35) {
            return OfOrder(_tier);
        } else if (_id == 36) {
            return OfSeal(_tier);
        } else if (_id == 37) {
            return OfResistance(_tier);
        } else if (_id == 38) {
            return OfFortitude(_tier);
        } else if (_id == 39) {
            return OfRunes(_tier);
        } else if (_id == 40) {
            return OfMalevolence(_tier);
        } else if (_id == 41) {
            return OfEclipse(_tier);
        } else if (_id == 42) {
            return OfImmortal(_tier);
        } else if (_id == 43) {
            return OfSanctity(_tier);
        } else if (_id == 44) {
            return OfWisdom(_tier);
        }

        revert("invalid");
    }


    function getPercentage(uint val, uint percentage) internal pure returns (uint) {
        return (val * percentage) / 100;
    }


    function baseStr() internal pure returns (uint) {
        return 14;
    }

    function baseDex() internal pure returns (uint) {
        return 3;
    }

    function baseAgi() internal pure returns (uint) {
        return 3;
    }

    function baseInt() internal pure returns (uint) {
        return 15;
    }

    function baseVit() internal pure returns (uint) {
        return 16;
    }

    function baseLuck() internal pure returns (uint) {
        return 3;
    }

    function baseAtk() internal pure returns (uint) {
        return 3;
    }

    function baseDef() internal pure returns (uint) {
        return 5;
    }

    function baseCrit() internal pure returns (uint) {
        return 1;
    }

    function baseCritMulti() internal pure returns (uint) {
        return 10;
    }

    function baseDodge() internal pure returns (uint) {
        return 2;
    }

    function baseAcc() internal pure returns (uint) {
        return 3;
    }

    function baseEleDef() internal pure returns (uint) {
        return 5;
    }

    function baseEleAtk() internal pure returns (uint) {
        return 3;
    }

    function baseHp() internal pure returns (uint) {
        return 3;
    }

    function none() public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "";
        _suffix.difficulty = 1;
    }

    function OfSolarion(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Solarion";
        _suffix.difficulty = 1;




        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : baseEleAtk() * _tier,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects_Stats.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : baseEleDef() * _tier,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }

    function OfTemplar(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Templar";
        _suffix.difficulty = 1;




        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : baseEleAtk() * _tier,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects_Stats.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : baseEleDef() * _tier,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }

    function OfPhoenix(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Phoenix";
        _suffix.difficulty = 1;




        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : baseEleAtk() * _tier,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects_Stats.ElementalDef({
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }

    function OfCelestion(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Celestion";
        _suffix.difficulty = 4;




        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : baseEleAtk() * _tier
        });

        _suffix.elementalStats.ElementalDef = GameObjects_Stats.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : baseEleDef() * _tier
        });
    }

    function OfBaphomet(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Baphomet";
        _suffix.difficulty = 1;




        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : baseEleAtk() * _tier,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects_Stats.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }

    function OfSujin(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Sujin";
        _suffix.difficulty = 1;




        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : baseEleAtk() * _tier,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects_Stats.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : baseEleDef() * _tier,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }

    function OfSentinel(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Sentinel";
        _suffix.difficulty = 1;




        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : baseEleAtk() * _tier,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects_Stats.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : 0
        });
    }

    function OfVerdant(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Verdant";
        _suffix.difficulty = 1;


        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : baseDef() * _tier,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfWatcher(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Watcher";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseInt() * _tier,
        VIT : 0,
        LUCK : baseLuck() * _tier
        });






    }

    function OfDeathbringer(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Deathbringer";
        _suffix.difficulty = 4;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : baseLuck() * _tier
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : baseCrit() * _tier,
        CRIT_MULTIPLIER : baseCritMulti() * _tier,
        INFUSION : 0
        });




    }

    function OfWraith(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Wraith";
        _suffix.difficulty = 1;


        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : baseDodge() * _tier,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfSpellcaster(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Spellcaster";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseInt() * _tier,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : baseCrit() * _tier,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfLuminous(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Luminous";
        _suffix.difficulty = 1;


        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseDef() * _tier,
        M_DEF : baseDef() * _tier,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfFallen(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Fallen";
        _suffix.difficulty = 2;


        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseDef() * _tier,
        M_DEF : baseDef() * _tier,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfGreedy(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Greedy";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : baseLuck() * _tier
        });






    }

    function OfBlacksmith(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Blacksmith";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseInt() * _tier,
        VIT : 0,
        LUCK : baseLuck() * _tier
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseDef() * _tier,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfSun(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Sun";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : baseVit() * _tier,
        LUCK : 0
        });



        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : baseEleAtk() * _tier,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });


    }

    function OfMoon(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Moon";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : baseVit() * _tier,
        LUCK : 0
        });



        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : baseEleAtk() * _tier,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });


    }

    function OfStorm(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Storm";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseInt() * _tier,
        VIT : 0,
        LUCK : 0
        });



        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : baseEleAtk() * _tier,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });


    }

    function OfGladiator(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Gladiator";
        _suffix.difficulty = 2;


        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : baseAtk() * _tier,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : baseCritMulti() * _tier,
        INFUSION : 0
        });




    }

    function OfVoidheart(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Voidheart";
        _suffix.difficulty = 5;




        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : baseEleAtk() * _tier
        });


    }

    function OfTroll(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Troll";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : baseStr() * _tier,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : baseVit() * _tier,
        LUCK : 0
        });






    }

    function OfWarmonger(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Warmonger";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : baseStr() * _tier,
        DEX : baseDex() * _tier,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : baseAtk() * _tier,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfAssassin(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Assassin";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : baseDex() * _tier,
        AGI : baseAgi() * _tier,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : baseCrit() * _tier,
        CRIT_MULTIPLIER : baseCritMulti() * _tier,
        INFUSION : 0
        });




    }

    function OfDeath(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Death";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : baseDex() * _tier,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseDef() * _tier,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : baseEleAtk() * _tier,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });


    }

    function OfAcrobat(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Acrobat";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : baseDex() * _tier,
        AGI : baseAgi() * _tier,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : baseDodge() * _tier,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfShadow(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Shadow";
        _suffix.difficulty = 2;


        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });



        _suffix.elementalStats.ElementalDef = GameObjects_Stats.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : 0,
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : 0
        });
    }

    function OfConcentration(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Concentration";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseInt() * _tier,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : baseAcc() * _tier,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfGuardian(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Guardian";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : 0,
        VIT : baseVit() * _tier,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : baseHp() * _tier,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : baseEleAtk() * _tier,
        VOID_ATK : 0
        });


    }

    function OfSavage(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Savage";
        _suffix.difficulty = 2;


        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : baseAtk() * _tier,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : baseDef() * _tier,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfCultist(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Cultist";
        _suffix.difficulty = 3;


        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : baseEleAtk() * _tier,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });


    }

    function OfFaith(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Faith";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseInt() * _tier,
        VIT : 0,
        LUCK : 0
        });



        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : baseEleAtk() * _tier,
        VOID_ATK : 0
        });


    }

    function OfWanderer(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Wanderer";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : baseDex() * _tier,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : baseAcc() * _tier,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfRoots(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Roots";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : baseAgi() * _tier,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : baseAtk() * _tier,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : baseEleAtk() * _tier,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });


    }

    function OfOrder(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Order";
        _suffix.difficulty = 2;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseInt() * _tier,
        VIT : 0,
        LUCK : baseLuck() * _tier
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : baseHp() * _tier,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfSeal(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Seal";
        _suffix.difficulty = 4;


        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : baseAtk() * _tier,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : baseEleAtk() * _tier,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });


    }

    function OfResistance(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Resistance";
        _suffix.difficulty = 3;






        _suffix.elementalStats.ElementalDef = GameObjects_Stats.ElementalDef({
        FIRE_DEF : baseEleDef() * _tier,
        COLD_DEF : baseEleDef() * _tier,
        EARTH_DEF : baseEleDef() * _tier,
        LIGHTNING_DEF : baseEleDef() * _tier,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : baseEleDef() * _tier,
        VOID_DEF : baseEleDef() * _tier
        });
    }

    function OfFortitude(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Fortitude";
        _suffix.difficulty = 2;


        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : baseHp() * _tier,
        P_ATK : baseAtk() * _tier,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : baseAcc() * _tier,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfRunes(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Runes";
        _suffix.difficulty = 3;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : baseDex() * _tier,
        AGI : 0,
        INT : 0,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : baseHp() * _tier,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : 0,
        M_DEF : baseDef() * _tier,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfMalevolence(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Malevolence";
        _suffix.difficulty = 2;


        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : baseEleAtk() * _tier,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });


    }

    function OfEclipse(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Eclipse";
        _suffix.difficulty = 2;


        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });

        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : baseEleAtk() * _tier,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : 0,
        VOID_ATK : 0
        });


    }

    function OfImmortal(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Immortal";
        _suffix.difficulty = 3;


        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : baseHp() * _tier,
        P_ATK : 0,
        M_ATK : 0,
        P_DEF : baseDef() * _tier,
        M_DEF : baseDef() * _tier,
        ACCURACY : 0,
        DODGE : baseDodge() * _tier,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }

    function OfSanctity(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Sanctity";
        _suffix.difficulty = 2;




        _suffix.elementalStats.ElementalAtk = GameObjects_Stats.ElementalAtk({
        FIRE_ATK : 0,
        COLD_ATK : 0,
        EARTH_ATK : 0,
        LIGHTNING_ATK : 0,
        DARK_ATK : 0,
        HOLY_ATK : baseEleAtk() * _tier,
        VOID_ATK : 0
        });

        _suffix.elementalStats.ElementalDef = GameObjects_Stats.ElementalDef({
        FIRE_DEF : 0,
        COLD_DEF : 0,
        EARTH_DEF : 0,
        LIGHTNING_DEF : 0,
        DARK_DEF : baseEleDef() * _tier,
        HOLY_DEF : 0,
        VOID_DEF : 0
        });
    }

    function OfWisdom(uint _tier) public pure returns (GameObjects_Equipments.Suffix memory _suffix) {
        //        _suffix.title = "of Wisdom";
        _suffix.difficulty = 1;
        _suffix.statBonus = GameObjects_Stats.Stats({
        STR : 0,
        DEX : 0,
        AGI : 0,
        INT : baseInt() * _tier,
        VIT : 0,
        LUCK : 0
        });

        _suffix.generatedStatBonus = GameObjects_Stats.GeneratedStats({
        HP : 0,
        P_ATK : 0,
        M_ATK : baseAtk() * _tier,
        P_DEF : 0,
        M_DEF : 0,
        ACCURACY : 0,
        DODGE : 0,
        CRIT : 0,
        CRIT_MULTIPLIER : 0,
        INFUSION : 0
        });




    }
}