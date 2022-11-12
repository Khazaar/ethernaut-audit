// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract selfDestroy {
    address addrContr = 0x79eCba43ca4a4bF65D2A5263B817b7f15d0624ED;
    function dstr() public {
        selfdestruct(payable(addrContr));
    }

    function collect() public payable {
    }

}
  
