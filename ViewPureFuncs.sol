// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract ViewAndPure {
    uint public x = 1;

    //does not modify the state
    //returns the sum but does not change x in the global state
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    //promise not to modify or read from the state
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}
