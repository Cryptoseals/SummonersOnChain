pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../../Core/Common/Errors.sol";
import "../../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import "../../Core/Navigator/InitNavigator.sol";

contract FungibleAndClaimableInGameToken is ERC20, Ownable, IFungibleInGameToken, InitNavigator {

    event Claim(uint[] summoners, uint claimed);

    uint256 CLAIM_INTERVAL = 1 days;
    uint256 REWARD_PER_LEVEL = 1e18;
    mapping(uint => uint) public LAST_CLAIMS;

    constructor(string memory _name, string memory _symbol, uint256 _claimInterval,
        uint256 _rewardPerLevel, address _navigator) ERC20(_name, _symbol) InitNavigator(_navigator) {
        CLAIM_INTERVAL = _claimInterval;
        REWARD_PER_LEVEL = _rewardPerLevel;
    }

    function setIntervalAndRewardPerLevel(uint _interval, uint _rewardPerLevel) external onlyOwner {
        CLAIM_INTERVAL = _interval;
        REWARD_PER_LEVEL = _rewardPerLevel;
    }

    function rewardToken(address _account, uint256 _amount) external override onlyGameContracts {

        _mint(_account, _amount);
    }

    function burnToken(address _account, uint256 _amount) external override onlyGameContracts {
        _burn(_account, _amount);
    }

    function spendToken(address _account, address _to, uint256 _amount) external override {
        _transfer(_account, _to, _amount);
    }

    function claim(uint[] memory _summoners) external {
        _claim(_summoners);
    }

    function _claim(uint[] memory _summoners) internal {
        uint toMint = 0;
        for (uint i = 0; i < _summoners.length; i++) {
            require(ownerOfSummoner(_summoners[i]) == msg.sender, "unauth");

            if (block.timestamp < LAST_CLAIMS[_summoners[i]]) {
                revert TooEarly(LAST_CLAIMS[_summoners[i]], block.timestamp);
            }
            toMint += Summoners.level(_summoners[i]) * REWARD_PER_LEVEL;
            LAST_CLAIMS[_summoners[i]] = block.timestamp;
        }
        _mint(msg.sender, toMint);
        emit Claim(_summoners, toMint);
    }
}
