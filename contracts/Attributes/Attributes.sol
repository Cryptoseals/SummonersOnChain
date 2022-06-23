import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../Core/Common/Errors.sol";
import "../Interfaces/Inventory/EquipableLibrary.sol";
import "../Interfaces/Core/Constants/Constants.sol";
import "../Interfaces/Core/Calculator/ICalculator.sol";
import "../Core/Navigator/InitNavigator.sol";

pragma solidity ^0.8.0;

contract Attributes is Initializable, InitNavigator {
    // @TODO change this to default stat, according to GDD

    // @dev maps each summoner to their allocated stats
    mapping(uint => GameObjects.Stats) public SummonerStats;
    mapping(uint => bool) public Distributed;

    mapping(uint => uint) public UsedPoints;
    mapping(uint => uint) public UsedLevelPoints;

    function initialize(address _navigator) public initializer {
        initializeNavigator(_navigator);
    }

    function allocate(uint summoner, GameObjects.Stats memory _stats) external ensureNotPaused senderIsSummonerOwner(summoner) {
        if (Distributed[summoner] || UsedPoints[summoner] > 0) revert AlreadyAllocated(summoner, "ALREADY ALLOCATED");
        //if (_stats.STR == 0 || _stats.DEX == 0 || _stats.INT == 0 || _stats.AGI == 0 || _stats.VIT == 0 || _stats.LUCK == 0) revert StatZero("STAT CANNOT BE 0");
        if (_stats.STR > 10
        || _stats.DEX > 10
        || _stats.INT > 10
        || _stats.AGI > 10
        || _stats.VIT > 10
            || _stats.LUCK > 10) revert StatOverflow("GT 10");

        Distributed[summoner] = true;

        // calculate cost.
        ICalculator calculator = ICalculator(contractAddress(INavigator.CONTRACT.CALCULATOR));

        uint _usedPoints = calculator.SumOfStatSetCost(_stats);

        // check if exceeds initial points
        require(GameConstants.SUMMONER_INITIAL_STAT_POINTS == _usedPoints, "?30");
        SummonerStats[summoner] = GameObjects.Stats({STR : _stats.STR * 10, AGI : _stats.AGI * 10, DEX : _stats.DEX * 10, INT : _stats.INT * 10, VIT : _stats.VIT * 10, LUCK : _stats.LUCK * 10});
        UsedPoints[summoner] = GameConstants.SUMMONER_INITIAL_STAT_POINTS;
    }

    function reset(uint summoner) external ensureNotPaused senderIsSummonerOwner(summoner) {
        if (UsedPoints[summoner] == 0 || !Distributed[summoner]) revert NotDistributed("NOT ALLOCATED");
        Distributed[summoner] = false;
        SummonerStats[summoner] = GameObjects.Stats(0, 0, 0, 0, 0, 0);
        UsedPoints[summoner] = 0;
        UsedLevelPoints[summoner] = 0;
    }

    function increaseStat(uint summoner, GameObjects.StatsEnum stat) external ensureNotPaused senderIsSummonerOwner(summoner) {
        uint total = levelPointsOfSummoner(summoner);
        uint used = UsedLevelPoints[summoner];
        if (used >= total) revert AlreadyAllocated(summoner, "NO POINTS LEFT");

        ICalculator calculator = ICalculator(contractAddress(INavigator.CONTRACT.CALCULATOR));
        uint nextStatLevel;
        // apply
        if (stat == GameObjects.StatsEnum.STR) {
            SummonerStats[summoner].STR += 10;
            nextStatLevel = SummonerStats[summoner].STR;
        } else if (stat == GameObjects.StatsEnum.AGI) {
            SummonerStats[summoner].AGI += 10;
            nextStatLevel = SummonerStats[summoner].AGI;
        } else if (stat == GameObjects.StatsEnum.INT) {
            SummonerStats[summoner].INT += 10;
            nextStatLevel = SummonerStats[summoner].INT;
        } else if (stat == GameObjects.StatsEnum.DEX) {
            SummonerStats[summoner].DEX += 10;
            nextStatLevel = SummonerStats[summoner].DEX;
        } else if (stat == GameObjects.StatsEnum.VIT) {
            SummonerStats[summoner].VIT += 10;
            nextStatLevel = SummonerStats[summoner].VIT;
        } else if (stat == GameObjects.StatsEnum.LUCK) {
            SummonerStats[summoner].LUCK += 10;
            nextStatLevel = SummonerStats[summoner].LUCK;
        } else {
            revert("enum");
        }

        uint cost = calculator.CostOfStat(nextStatLevel);
        require(used + cost <= total, "EXCEEDS MAX. POINTS");
        UsedLevelPoints[summoner] += cost;
    }

    function stats(uint summoner) external view returns (GameObjects.Stats memory _stats) {
        //        if (UsedPoints[summoner] < 1) revert AlreadyAllocated(summoner, "NOT ALLOCATED");
        _stats = SummonerStats[summoner];
    }

    function statsOfSummoners(uint[] memory ids) external view returns (GameObjects.Stats memory _stats) {
        //        if (UsedPoints[summoner] < 1) revert AlreadyAllocated(summoner, "NOT ALLOCATED");
        for (uint i = 0; i < ids.length; i++) {
            _stats = SummonerStats[ids[i]];
        }
    }

    function totalPointsOfSummoner(uint summoner) public view returns (uint) {
        ISummoners Summoners = ISummoners(Navigator.getContractAddress(INavigator.CONTRACT.SUMMONERS));
        uint level = Summoners.level(summoner);
        return GameConstants.SUMMONER_INITIAL_STAT_POINTS + (level - 1) * 10;
    }

    function levelPointsOfSummoner(uint summoner) public view returns (uint) {
        ISummoners Summoners = ISummoners(Navigator.getContractAddress(INavigator.CONTRACT.SUMMONERS));
        uint level = Summoners.level(summoner);
        return (level - 1) * 10;
    }
}
