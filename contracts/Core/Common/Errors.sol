pragma solidity ^0.8.0;


error VOID();
error UnauthorizedSender(address sender, string _msg);
error TooEarly(uint lastClaim, uint now);
error AlreadyAllocated(uint summoner, string message);
error StatZero(string message);
error StatOverflow(string message);
error NotDistributed(string message);
error CannotEquip(string message);
error InvalidItem(string message);
