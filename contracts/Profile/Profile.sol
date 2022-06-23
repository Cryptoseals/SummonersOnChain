pragma solidity ^0.8.0;

import "../Interfaces/Profile/IProfile.sol";


contract Profile is IProfile {
    using EnumerableSet for EnumerableSet.AddressSet;

    mapping(address => Player) Players;
    // @dev Maps friends requests as Sender=>Receiver=>Bool
    mapping(address => mapping(address => bool)) FriendRequests;

    function setProfileData(string memory _name, string memory _note, string memory _image) external override {
        Players[msg.sender]._name = _name;
        Players[msg.sender]._note = _note;
        Players[msg.sender]._image = _image;
    }

    function setProfileName(string memory _name) external {
        Players[msg.sender]._name = _name;
    }

    function setProfileImage(string memory _image) external {
        Players[msg.sender]._image = _image;
    }

    function setProfileNote(string memory _note) external {
        Players[msg.sender]._note = _note;
    }

    function sendFriendRequest(address _player) external override {
        FriendRequests[msg.sender][_player] = true;
    }

    function sendFriendRequests(address[] memory _players) external override {
        for (uint _player = 0; _player < _players.length; _player++) {
            FriendRequests[msg.sender][_players[_player]] = true;
        }
    }

    function cancelFriendRequests(address[] memory _players) external override {
        for (uint _player = 0; _player < _players.length; _player++) {
            FriendRequests[msg.sender][_players[_player]] = false;
        }
    }

    function acceptFriendRequest(address _player) external override {
        FriendRequests[msg.sender][_player] = false;
        Players[msg.sender].friends.add(_player);
    }

    function acceptFriendRequests(address[] memory _players) external override {
        for (uint _player = 0; _player < _players.length; _player++) {
            if (FriendRequests[msg.sender][_players[_player]]) {
                FriendRequests[msg.sender][_players[_player]] = false;
                Players[msg.sender].friends.add(_players[_player]);
            }
        }
    }

    function player(address _address) external view override returns (string memory _name, string memory _note, string memory _image) {
        _name = Players[_address]._name;
        _note = Players[_address]._note;
        _image = Players[_address]._image;
    }

    function image(address _address) external view override returns (string memory) {
        return Players[_address]._image;
    }

    function friends(address _address) external view override returns (address[] memory) {
        return Players[_address].friends.values();
    }
}
