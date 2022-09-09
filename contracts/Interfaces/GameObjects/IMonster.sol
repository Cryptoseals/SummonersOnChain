import {Stats, GeneratedStats, ElementalStats, Element} from "./IGameObjects.sol";
//import "./IGenericMetadata.sol";
pragma solidity ^0.8.0;

interface IMonster {

    struct Monster {
        //        IGenericMetadata.Metadata MonsterMetadata;
        Stats EnemyStats;
        GeneratedStats EnemyGeneratedStats;
        ElementalStats EnemyElementalStats;
        Element damageType;
    }
}
