// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract SimpleStorage {
    //state variable to store a number
    uint public num;

    //function to send a transaction to write to a state variable
    function set(uint256 _num) public {
        num = _num;
    }

    //function to read from a state variable without sending a transaction
    function get() public view returns (uint) {
        return num;
    }
}
