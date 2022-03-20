pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "../../Core/Common/Errors.sol";
import "../../Interfaces/Fungibles/Common/IFungibleInGameToken.sol";
import "../../Core/Navigator/InitNavigator.sol";

contract FungibleAndClaimableInGameToken is Initializable, InitNavigator, ERC20Upgradeable, OwnableUpgradeable,
IFungibleInGameToken {
    uint256 public CLAIM_INTERVAL;
    uint256 public REWARD_PER_LEVEL;
    mapping(uint => uint) public LAST_CLAIMS;


    event Claim(uint[] summoners, uint claimed);

    function initializeFungibleClaimable(string memory _name, string memory _symbol, uint256 _claimInterval,
        uint256 _rewardPerLevel, address _navigator) internal {
        __Ownable_init();
        __ERC20_init(_name, _symbol);

        CLAIM_INTERVAL = _claimInterval;
        REWARD_PER_LEVEL = _rewardPerLevel;
        initializeNavigator(_navigator);
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

    function spendToken(address _account, address _to, uint256 _amount) external override onlyGameContracts {
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
