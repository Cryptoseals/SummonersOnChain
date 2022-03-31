import "../../Interfaces/Codex/ICodexPrefixAndSuffix.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

pragma solidity ^0.8.0;

contract UpgradeableCodex is Initializable {
    ICodexPrefixAndSuffix PrefixContract;
    ICodexPrefixAndSuffix SuffixContract;

    struct EquippedItemStruct {
        uint tokenId;
        uint itemId;
        uint itemTier;
        uint prefixId;
        uint prefixTier;
        uint suffixId;
        uint suffixTier;
    }

    function initialize (address prefix, address suffix) external initializer {
        PrefixContract = ICodexPrefixAndSuffix(prefix);
        SuffixContract = ICodexPrefixAndSuffix(suffix);
    }
}
