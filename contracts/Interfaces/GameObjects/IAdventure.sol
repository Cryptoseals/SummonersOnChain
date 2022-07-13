import {GameObjects, GameObjects_Stats} from "./IGameObjects.sol";
import "./IGameRewards.sol";
pragma solidity ^0.8.0;

interface IAdventure {
    function adventureLevel(uint level) external view returns (AdventureLevel memory);

    struct AdventureBattle {
        uint battleId;
        address account;
        uint summoner;
        uint adventureArea;
        uint adventureLevel;
        bool isActive;
        IAdventure.AdventureMonster monster;
        GameObjects_Stats.BattleStats playerStats;
        GameObjects_Stats.BattleStats monsterStats;

    }
    struct AdventureMonster {
        GameObjects.Element element;
        uint monsterId;
        uint level;
    }

    struct AdventureLevel {
        AdventureMonster[] MonsterList;
        IGameRewards.Reward Rewards;
        IGameRewards.CurrencyRewards CurrencyRewards;
        uint MonsterLevel;
        uint Difficulty;
    }

}
