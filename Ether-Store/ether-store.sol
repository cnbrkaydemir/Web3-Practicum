// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract store {
    address public owner;
    uint public balance;

    constructor(){
        owner = msg.sender;
    }

    function getFee() payable external {
        balance += msg.value;
    }

    function withdraw(uint amount, address payable destination) public {
        require(msg.sender == owner, "Only the owner can withdraw!");
        require(balance >= amount, "Not enough credits!");

        destination.transfer(amount);
        balance -= amount;

    }

}