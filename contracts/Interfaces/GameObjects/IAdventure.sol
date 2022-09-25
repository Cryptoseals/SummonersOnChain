import {BattleStats, Element} from "./IGameObjects.sol";
import {Reward, CurrencyRewards} from "./IGameRewards.sol";
pragma solidity ^0.8.0;

struct AdventureBattle {
    uint256 battleId;
    address account;
    uint256 summoner;
    uint256 adventureArea;
    uint256 adventureLevel;
    bool isActive;
    AdventureMonster monster;
    BattleStats playerStats;
    BattleStats monsterStats;
}

struct AdventureMonster {
    Element element;
    uint256 monsterId;
    uint256 level;
}

struct AdventureLevel {
    AdventureMonster[] MonsterList;
    Reward Rewards;
    CurrencyRewards CurrencyRewards;
    uint256 MonsterLevel;
    uint256 Difficulty;
}

interface IAdventure {
    function adventureLevel(uint256 level)
        external
        view
        returns (AdventureLevel memory);
}
