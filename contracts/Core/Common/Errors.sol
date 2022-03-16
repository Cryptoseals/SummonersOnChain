pragma solidity ^0.8.0;


error VOID();
error UnauthorizedSender(address sender, string _msg);
error TooEarly(uint lastClaim, uint now);
