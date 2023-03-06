// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract HotelBooking{
    enum isOccupied {Vacant, Occupied} isOccupied public currentStatus;
    address payable public owner;
    constructor(){
        owner = payable(msg.sender);
    }
    // Book a room if it is available
    
    modifier onlyWhenAvailable{
        require(currentStatus == isOccupied.Vacant, "Room isn't available, Please try later");
        _;
    }
    // check the price 2 be more than 2 ether 
    modifier haveEnoughBudget{
        require(msg.value >= 2 ether, "Not enough Ether provided");
        _;
    }
    function bookAroom() public payable onlyWhenAvailable haveEnoughBudget{
        owner.transfer(msg.value);
        currentStatus = isOccupied.Occupied;
    }
    function checkOutAroom() public{
        currentStatus = isOccupied.Vacant;
    }
}