// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface iBuilding {
    function isLastFloor(uint) external returns (bool);
}

contract Building is iBuilding {
    uint lastFloor = 5;
    address elevAddress = 0x0faC03cf6E4D2C75eAEf40C503Daf7590EfCB289;
    Elevator elevator = Elevator(elevAddress);
    function isLastFloor(uint _floor) external override returns (bool) {
        bool _result;
        if (_floor == lastFloor) {
            if (_floor != elevator.floor()) {
                return false;
            }
            else {
                return true;
            }
        } 

    }

    function callGoTo(uint floor) public returns(bool) {
        elevator.goTo(floor);
        return elevator.top();
    }

}

contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}


// contract Elevator {
//   bool public top;
//   uint public floor;

//   function goTo(uint _floor) public {
//     Building building = Building(msg.sender);

//     if (! building.isLastFloor(_floor)) {
//       floor = _floor;
//       top = building.isLastFloor(floor);
//     }
//   }
// }