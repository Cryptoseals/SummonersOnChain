import "../GameObjects/IJob.sol";
pragma solidity ^0.8.0;

interface ICodexJobs {
    function jobs(uint _id, uint _times) external pure returns (IJob.Job memory);
}
