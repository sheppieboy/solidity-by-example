// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

//functions and addresses declare payable can recieve ether into the contract

contract Payable {
    //Payable address can recieve Ether
    address payable public owner;

    //payable constructor can recoeve Ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    //Function to deposit Ether into this contract
    //Call this function along with some Ether
    //The balance of this contract will be automatically updated
    function deposit() public payable {}

    //Call this function along with some Ether
    //The function will throw an error since this function is not payable
    function notPayable() public {}

    //function to withdraw all ether from this contract.
    function withdraw() public {
        //get amount of ether stored in this contract
        uint amount = address(this).balance;

        //send all Ether to owner
        //Owner can recieve Ether since the address of owner is payable
        (bool success, ) = owner.call{value: amount}("");
        require(success, "failed to send ether");
    }

    //function to transfer EWther from this contract to address from input
    function transfer(address payable _to, uint _amount) public {
        //Note that "to" is declared as payable
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "failed to send ether");
    }
}
