import "../Interfaces/GameObjects/IJob.sol";

pragma solidity ^0.8.0;

contract CodexJobs {
    string public constant index = "Codex";
    string public constant class = "Jobs";
    string public constant version = "0.0.1";

    function DummyJob(uint difficulty) public pure returns (IJob.Job memory _job) {
        _job.Metadata.name = "First Level";
        _job.Metadata.description = "First Level is very easy.";
        
        _job.Time = 1 days;
        
        _job.Requirements.statRequirement = GameObjects.Stats({STR : 0, AGI : 0, INT : 0, DEX : 0, VIT : 0, LUCK : 0});
        _job.Requirements.level = 1;
        _job.Requirements.classRequirement = new GameObjects.Class[](0); // means every class can do
        
        _job.Rewards.pool.yieldsGold = true;
        _job.Rewards.rewards.goldRewards.minAmount = 50e18;
        _job.Rewards.rewards.goldRewards.minAmount = 100e18;
    }
}
