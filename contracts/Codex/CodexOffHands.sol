import "./Common/UpgradeableCodex.sol";
import "../Inventory/EquipableUtils.sol";
pragma solidity ^0.8.0;

contract CodexOffHands is UpgradeableCodex {
    string constant public index = "Codex";
    string constant public class = "OffHands";
    string constant public version = "0.0.1";

    function offHand(EquippedItemStruct memory _equipable) public view returns (GameObjects.OffHand memory) {
        GameObjects.OffHand memory _offHand;
        GameObjects.Prefix memory _prefix = PrefixContract.prefix(_equipable.prefixId, _equipable.prefixTier);
        GameObjects.Suffix memory _suffix = SuffixContract.suffix(_equipable.suffixId, _equipable.suffixTier);

        if (_equipable.itemId == 1) {
            _offHand = DummyOffHand(_equipable.itemTier);
        }

        revert("invalid");
    }

    function DummyOffHand(uint tier) public pure returns (GameObjects.OffHand memory _offHand) {
        _offHand.metadata.id = 1;
        _offHand.metadata.baseType = GameObjects.ItemType.OFFHAND;
        _offHand.metadata.name = "Dummy OffHand";
        _offHand.metadata.description = "Dummy OffHand is best offHand";
        _offHand.metadata.upgradable = true;

        _offHand.requirement.level = 1;
        _offHand.requirement.classRequirement = new GameObjects.Class[](0);
        _offHand.requirement.statRequirement = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});

        _offHand.statBonus = GameObjects.Stats({STR : 0, DEX : 0, AGI : 0, INT : 0, VIT : 0, LUCK : 0});
        _offHand.generatedStatBonus = GameObjects.GeneratedStats({HP : 1, P_ATK : 1, M_ATK : 1, P_DEF : 1, M_DEF : 1, ACCURACY : 1, DODGE : 1, CRIT : 1, CRIT_MULTIPLIER : 1, INFUSION : 0});
    }
}
