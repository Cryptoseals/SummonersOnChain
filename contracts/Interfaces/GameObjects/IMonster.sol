import "./IGameObjects.sol";
import "./IGenericMetadata.sol";
pragma solidity ^0.8.0;

interface IMonster {

    struct Monster {
        IGenericMetadata.Metadata MonsterMetadata;
        GameObjects.Stats EnemyStats;
        GameObjects.GeneratedStats EnemyGeneratedStats;
        GameObjects.ElementalStats EnemyElementalStats;
        GameObjects.Element damageType;
    }
}
