pragma solidity ^0.8.0;

library GameEntities {

    enum SummonerState {
        FREE,
        BUSY,
        EXHAUSTED
    }

    struct SummonerMetadata {
        uint id;
        string summonerName;
        address summonedBy;
    }

    struct SummonerData {
        uint level;
        uint EXP;
        SummonerState state;
    }

}
