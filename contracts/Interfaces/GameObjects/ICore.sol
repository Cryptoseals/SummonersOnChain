import {Element} from "./IGameObjects.sol";

pragma solidity ^0.8.0;
    struct Core {
        uint minItemLvl;
        uint difficulty;
        Effect fx;
    }
    struct Effect {
        EffectType fxType;
        uint prefixToAdd;
        uint suffixToAdd;
        Element elementToAdd;
    }

    enum EffectType {
        OVERRIDE_ELEMENT,
        OVERRIDE_PREFIX,
        OVERRIDE_SUFFIX
    }



