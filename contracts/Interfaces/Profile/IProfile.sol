import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
pragma solidity ^0.8.0;


// @title Customizable Player Profile System of Winternet
interface IProfile {

    struct Player {
        string _name;
        string _note;
        string _image;
        EnumerableSet.AddressSet friends;
    }

    function setProfileData(string memory _name, string memory _note, string memory _image) external;

    function sendFriendRequest(address _player) external;

    function sendFriendRequests(address[] memory _players) external;

    function acceptFriendRequest(address _players) external;

    function acceptFriendRequests(address[] memory _players) external;

    function cancelFriendRequests(address[] memory _players) external;

    function player(address _address) external view returns(string memory _name, string memory _note, string memory _image);

    function image(address _address) external view returns(string memory);

    function friends(address _address) external view returns(address[] memory);

}
