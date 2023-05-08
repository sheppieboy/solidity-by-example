// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;

contract Counter {
    uint256 public count;

    // Function to get the current count
    function get() public view returns (uint256) {
        return count;
    }

    //Function to increment count by 1
    function increment() public {
        count++;
    }

    //Function to decrement count by 1
    function decrement() public {
        count--;
    }
}
