import "../Core/Common/Errors.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
import "../Interfaces/Inventory/EquipableLibrary.sol";
import "../Interfaces/Core/Constants/Constants.sol";
import "../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract Attributes is InitNavigator {
    // @TODO change this to default stat, according to GDD
    GameObjects.Stats public DEFAULT_STAT = GameObjects.Stats(8,8,8,8,8,8);

    // @dev maps each summoner to their allocated stats
    mapping(uint => GameObjects.Stats) public SummonerStats;

    mapping(uint => uint) public UsedPoints;
    mapping(uint => uint) public UsedLevelPoints;

    constructor (address _navigator) InitNavigator(_navigator) {}

    function allocate(uint summoner, GameObjects.Stats memory _stats) external ensureNotPaused {
        if (UsedPoints[summoner] > 0) revert AlreadyAllocated(summoner, "ALREADY ALLOCATED");
        if (!Summoners.senderIsOwner(summoner) || Navigator.isGameContract(msg.sender)) revert UnauthorizedSender(msg.sender, "CALLER IS NOT THE OWNER");

        // @TODO , stat allocation conditions will be implemented as they decided in GDD
        SummonerStats[summoner] = _stats;

        uint _usedPoints = 0;
        _usedPoints += _stats.STR;
        _usedPoints += _stats.AGI;
        _usedPoints += _stats.INT;
        _usedPoints += _stats.DEX;
        _usedPoints += _stats.VIT;
        _usedPoints += _stats.LUCK;

        UsedPoints[summoner] = _usedPoints;
    }

    function increaseStat(uint summoner, GameObjects.StatsEnum stat) external ensureNotPaused {
        if(UsedLevelPoints[summoner] >= pointsFromLevel(summoner)) revert AlreadyAllocated(summoner, "NO POINTS LEFT");
        if (!Summoners.senderIsOwner(summoner)) revert UnauthorizedSender(msg.sender, "CALLER IS NOT THE OWNER");

        // @TODO check conditions,

        //...

        // apply
        if (stat == GameObjects.StatsEnum.STR) {
            SummonerStats[summoner].STR++;
        } else if (stat == GameObjects.StatsEnum.AGI) {
            SummonerStats[summoner].AGI++;
        } else if (stat == GameObjects.StatsEnum.INT) {
            SummonerStats[summoner].INT++;
        } else if (stat == GameObjects.StatsEnum.DEX) {
            SummonerStats[summoner].DEX++;
        } else if (stat == GameObjects.StatsEnum.VIT) {
            SummonerStats[summoner].VIT++;
        } else if (stat == GameObjects.StatsEnum.LUCK) {
            SummonerStats[summoner].LUCK++;
        }

        UsedLevelPoints[summoner]++;
    }

    function stats(uint summoner) external view returns (GameObjects.Stats memory _stats) {
        if (UsedPoints[summoner] < 1) revert AlreadyAllocated(summoner, "NOT ALLOCATED");
        _stats = SummonerStats[summoner];
    }

    function pointsFromLevel(uint summoner) public returns(uint) {
        uint level = Summoners.level(summoner);
        // @TODO , to be implemented after GDD
        return 0;
    }
}
