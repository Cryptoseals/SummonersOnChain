import {GameObjects_Elixir} from "../GameObjects/IGameObjects.sol";
pragma solidity ^0.8.0;

interface ICodexElixirs {
    function elixir(uint _id, uint _tier) external pure returns (GameObjects_Elixir.Elixir memory);
}
