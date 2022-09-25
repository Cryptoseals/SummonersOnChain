import {INavigator, InitNavigator, Initializable} from "../Core/Navigator/InitNavigator.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {ERC721EnumerableUpgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import {IReward, Reward} from "../Interfaces/Reward/IReward.sol";
import {ICodexRandom} from "../Interfaces/Codex/ICodexRandom.sol";

pragma solidity ^0.8.15;

contract Chests is
    Initializable,
    OwnableUpgradeable,
    InitNavigator,
    ERC721EnumerableUpgradeable
{
    ICodexRandom RNG;
    uint256 constant PRICE = 2 ether;
    uint256 constant MAX_SUPPLY = 500;
    address RECEIVER;
    bool SALE_STARTED;
    uint256 additionalSeed;

    function initialize(address receiver) external initializer {
        RECEIVER = receiver;
        RNG = ICodexRandom(contractAddress(INavigator.CONTRACT.RANDOM_CODEX));

        __Context_init();
        __Ownable_init();
        __ERC721Enumerable_init();
        __ERC721_init("Bronze Chest", "SoC$BRONZE");
    }

    function mintChest(uint256 amount) external payable {
        require(SALE_STARTED, "not yet");
        require(msg.value >= amount * PRICE, "price issue");
        require(amount < 10, "max 10");
        require(amount + totalSupply() < MAX_SUPPLY, "exceeds max supply");

        // get funds
        (bool ok, ) = RECEIVER.call{value: msg.value}("");
        require(ok, "some error");

        for (uint256 index = 0; index < amount; index++) {
            _mint(msg.sender, totalSupply());
        }
    }

    function claimChest(uint256 chestId) external {
        require(ownerOf(chestId) == msg.sender, "no");
        _burn(chestId);

        // handle rolls and stuff.
        // roll stuff and send
    }

    function flipSale() external onlyOwner {
        SALE_STARTED = !SALE_STARTED;
    }

    function tokensOfOwner(address _owner)
        public
        view
        returns (uint256[] memory)
    {
        uint256[] memory _tokensOfOwner = new uint256[](balanceOf(_owner));
        uint256 i;

        for (i = 0; i < _tokensOfOwner.length; i++) {
            _tokensOfOwner[i] = tokenOfOwnerByIndex(_owner, i);
        }
        return (_tokensOfOwner);
    }

    function chestRewards()
        internal
        returns (Reward memory _pool)
    {}
}
