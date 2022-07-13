import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {InitNavigator, INavigator} from "../Core/Navigator/InitNavigator.sol";
import {Strings}from "@openzeppelin/contracts/utils/Strings.sol";
import {ERC1155Upgradeable}from "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import {OwnableUpgradeable}from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {GameObjects_Elixir} from "../Interfaces/GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

contract Elixirs is Initializable, OwnableUpgradeable, InitNavigator, ERC1155Upgradeable {
    using Strings for uint256;

    function initialize(address _navigator, string memory uri) external initializer {
        initializeNavigator(_navigator);
        __ERC1155_init(uri);
        __Ownable_init();
    }

    function mintElixir(uint elixir_id, uint elixir_tier, address to, uint amount) external onlyGameContracts {
        require(amount > 0, "0");
        uint id = elixirTokenIdByTier(elixir_id, elixir_tier);
        _mint(to, id, amount, new bytes(0));
    }

    // test purposes
    function mintDev(uint elixir, uint amount) external onlyOwner {
        _mint(msg.sender, uint(elixir), amount, new bytes(0));
    }

    function burnElixir(address from, uint id, uint amount) external onlyGameContracts {
        require(amount > 0, "0");
        _burn(from, uint(id), amount);
    }


    function setURI(string memory __uri) external onlyOwner {
        _setURI(__uri);
    }

    function tokenURI(uint256 id) public view returns (string memory) {
        return string(abi.encodePacked(uri(id), id.toString()));
    }

    function elixirsOf(address account, uint[] memory ids) external view returns (uint[] memory) {
        uint[] memory result = new uint[](ids.length);
        uint i = 0;
        for (i; i < ids.length; i++) {
            result[i] = balanceOf(account, ids[i]);
        }
        return result;
    }

    function elixirTokenIdByTier(uint elixir_id, uint tier) public pure returns (uint) {
        string memory concat = string.concat(elixir_id.toString(), string("000"), tier.toString());
        (uint id, bool b) = strToUint(concat);
        require(b, "err");
        return id;
    }

    function strToUint(string memory _str) public pure returns (uint256 res, bool err) {

        for (uint256 i = 0; i < bytes(_str).length; i++) {
            if ((uint8(bytes(_str)[i]) - 48) < 0 || (uint8(bytes(_str)[i]) - 48) > 9) {
                return (0, false);
            }
            res += (uint8(bytes(_str)[i]) - 48) * 10 ** (bytes(_str).length - i - 1);
        }

        return (res, true);
    }

    function decodeElixir(uint tokenId) external pure returns(uint, uint) {
        string memory s = tokenId.toString();
        uint stringTotalLength = bytes(s).length;
        string memory tier_s = getSlice(bytes(s).length-1, bytes(s).length, s);
        (uint tier, bool _b) = strToUint(tier_s);
        require(_b, "ce.");

        string memory id_s = getSlice(1, stringTotalLength - 4, s);
        (uint id, bool _bb) = strToUint(id_s);
        require(_bb, "ce2.");

        return (id, tier);
    }

    function getSlice(uint256 begin, uint256 end, string memory text) internal pure returns (string memory) {
        bytes memory a = new bytes(end-begin+1);
        for(uint i=0;i<=end-begin;i++){
            a[i] = bytes(text)[i+begin-1];
        }
        return string(a);
    }
}
