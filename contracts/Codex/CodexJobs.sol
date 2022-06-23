import "../Interfaces/GameObjects/IJob.sol";

pragma solidity ^0.8.0;

contract CodexJobs {
    string public constant index = "Codex";
    string public constant class = "Jobs";
    string public constant version = "0.0.1";

    function jobs(uint256 _id, uint256 _times)
        public
        pure
        returns (IJob.Job memory)
    {
        if (_id == 1) {
            return DummyJob(_times);
        }

        revert("invalid");
    }

    function DummyJob(uint256 _times)
        public
        pure
        returns (IJob.Job memory _job)
    {

    }
}
