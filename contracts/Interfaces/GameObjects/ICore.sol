import {GameObjects} from "./IGameObjects.sol";

pragma solidity ^0.8.0;

library ICore {

    enum EffectType {
        OVERRIDE_ELEMENT,
        OVERRIDE_PREFIX,
        OVERRIDE_SUFFIX
    }

    struct Core {
        uint minItemLvl;
        uint difficulty;
        Effect fx;
    }

    struct Effect {
        EffectType fxType;
        uint prefixToAdd;
        uint suffixToAdd;
        GameObjects.Element elementToAdd;
    }
}
