// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract store {
    address public owner; // Field for storing owner of the smart contract
    uint public balance; // Field for storing the current balance of the owner

    constructor(){
        // Very basic constructor for initializing the owner field with the sender property of message.
        owner = msg.sender;
    }

    function getFee() payable external {
        // Basic deposit function used for depositing some amount to owner
        balance += msg.value;
    }

    function withdraw(uint amount, address payable destination) public {
        // Basic function for withdrawing a specific amount and sending it to another address

        require(msg.sender == owner, "Only the owner can withdraw!");
        // Make sure that the withdraw takes place from the owner  

        require(balance >= amount, "Not enough credits!");
        // Make sure there is enough amount in the owner's balance

        destination.transfer(amount); // Send the specified amount to the destination address
        balance -= amount; // Update balance

    }

}