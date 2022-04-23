import "../../Interfaces/Codex/ICodexPrefixAndSuffix.sol";
import "../../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract UpgradeableCodex is InitNavigator {
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

    function initialize (address _navigator) external initializer {
        initializeNavigator(_navigator);
        PrefixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.PREFIX_CODEX));
        SuffixContract = ICodexPrefixAndSuffix(contractAddress(INavigator.CONTRACT.SUFFIX_CODEX));
    }

    function prefixAndSuffix(uint _prefix, uint _prefixTier, uint _suffix, uint _suffixTier) internal view returns (GameObjects.Prefix memory, GameObjects.Suffix memory) {
        GameObjects.Prefix memory prefix = PrefixContract.prefix(_prefix, _prefixTier);
        GameObjects.Suffix memory suffix = SuffixContract.suffix(_suffix, _suffixTier);

        return (prefix, suffix);
    }
}
