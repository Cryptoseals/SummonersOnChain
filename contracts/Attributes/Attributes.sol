import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../Core/Common/Errors.sol";
import "../Interfaces/GameObjects/IGameEntities.sol";
import "../Interfaces/GameObjects/IGameObjects.sol";
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
        if (_stats.STR == 0 || _stats.DEX == 0 || _stats.INT == 0 || _stats.AGI == 0 || _stats.VIT == 0 || _stats.LUCK == 0) revert StatZero("STAT CANNOT BE 0");
        Distributed[summoner] = true;

        // calculate cost.
        ICalculator calculator = ICalculator(contractAddress(INavigator.CONTRACT.CALCULATOR));

        uint _usedPoints = 0;

        for (uint i = 0; i <= _stats.STR; i++) {
            _usedPoints += calculator.CostOfSkill(i);
        }
        for (uint i = 0; i <= _stats.DEX; i++) {
            _usedPoints += calculator.CostOfSkill(i);
        }
        for (uint i = 0; i <= _stats.INT; i++) {
            _usedPoints += calculator.CostOfSkill(i);
        }
        for (uint i = 0; i <= _stats.AGI; i++) {
            _usedPoints += calculator.CostOfSkill(i);
        }
        for (uint i = 0; i <= _stats.VIT; i++) {
            _usedPoints += calculator.CostOfSkill(i);
        }
        for (uint i = 0; i <= _stats.LUCK; i++) {
            _usedPoints += calculator.CostOfSkill(i);
        }

        // check if exceeds initial points
        require(GameConstants.SUMMONER_INITIAL_STAT_POINTS >= _usedPoints, "NOT ENOUGH POINTS");
        SummonerStats[summoner] = _stats;
        UsedPoints[summoner] = _usedPoints;
    }

    function reset(uint summoner) external ensureNotPaused senderIsSummonerOwner(summoner) {
        if (UsedPoints[summoner] == 0 || !Distributed[summoner]) revert NotDistributed("NOT ALLOCATED");
        Distributed[summoner] = false;
        SummonerStats[summoner] = GameObjects.Stats(0, 0, 0, 0, 0, 0);
        UsedPoints[summoner] = 0;
    }

    function increaseStat(uint summoner, GameObjects.StatsEnum stat) external ensureNotPaused senderIsSummonerOwner(summoner) {
        uint total = totalPointsOfSummoner(summoner);
        uint used = UsedLevelPoints[summoner];
        if (used >= total) revert AlreadyAllocated(summoner, "NO POINTS LEFT");

        ICalculator calculator = ICalculator(contractAddress(INavigator.CONTRACT.CALCULATOR));
        uint nextStatLevel;
        // apply
        if (stat == GameObjects.StatsEnum.STR) {
            nextStatLevel = SummonerStats[summoner].STR;
            SummonerStats[summoner].STR++;
        } else if (stat == GameObjects.StatsEnum.AGI) {
            nextStatLevel = SummonerStats[summoner].AGI;
            SummonerStats[summoner].AGI++;
        } else if (stat == GameObjects.StatsEnum.INT) {
            nextStatLevel = SummonerStats[summoner].INT;
            SummonerStats[summoner].INT++;
        } else if (stat == GameObjects.StatsEnum.DEX) {
            nextStatLevel = SummonerStats[summoner].DEX;
            SummonerStats[summoner].DEX++;
        } else if (stat == GameObjects.StatsEnum.VIT) {
            nextStatLevel = SummonerStats[summoner].VIT;
            SummonerStats[summoner].VIT++;
        } else if (stat == GameObjects.StatsEnum.LUCK) {
            nextStatLevel = SummonerStats[summoner].LUCK;
            SummonerStats[summoner].LUCK++;
        }

        uint cost = calculator.CostOfSkill(nextStatLevel);
        require(used + cost <= total, "EXCEEDS MAX. POINTS");
        UsedLevelPoints[summoner] += cost;
    }

    function stats(uint summoner) external view returns (GameObjects.Stats memory _stats) {
        if (UsedPoints[summoner] < 1) revert AlreadyAllocated(summoner, "NOT ALLOCATED");
        _stats = SummonerStats[summoner];
    }

    function totalPointsOfSummoner(uint summoner) public returns (uint) {
        uint level = Summoners.level(summoner);
        return GameConstants.SUMMONER_INITIAL_STAT_POINTS + level * 10;
    }
}
