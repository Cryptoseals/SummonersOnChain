import {GameObjects, GameObjects_Stats} from "./IGameObjects.sol";
//import "./IGenericMetadata.sol";
pragma solidity ^0.8.0;

interface IMonster {

    struct Monster {
        //        IGenericMetadata.Metadata MonsterMetadata;
        GameObjects_Stats.Stats EnemyStats;
        GameObjects_Stats.GeneratedStats EnemyGeneratedStats;
        GameObjects_Stats.ElementalStats EnemyElementalStats;
        GameObjects.Element damageType;
    }
}
