import {Class} from "./IGameObjects.sol";
pragma solidity ^0.8.0;

enum SummonerState {
    FREE,
    BUSY,
    EXHAUSTED,
    IN_FIGHT
}

struct SummonerMetadata {
    uint256 id;
    string summonerName;
    address summonedBy;
}

struct SummonerData {
    uint256 level;
    Class class;
    uint256 EXP;
    SummonerState state;
}
