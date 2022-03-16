pragma solidity ^0.8.0;

library GameEntities {

    struct SummonerMetadata {
        uint id;
        string summonerName;
        address summonedBy;
    }

    struct SummonerData {
        uint level;
        uint EXP;
        bool isBusy;
    }

}
