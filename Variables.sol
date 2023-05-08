// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

/**
 * There are 3 tyoes of variables in Solidity
 * 1) local
 * - declared inside a function
 * - not stored on the blockchain
 *
 * 2) state
 * - declared outside a function
 * -stored on the blockchain
 *
 * 3) global
 * - provides information about the blockchain
 *
 */

contract Variables {
    //state variables stored on the blockchain
    string public text = "hello";
    uint public num = 123;

    function doSomething() public {
        //Local variables are not saved to the blockchain
        uint i = 456;

        //here are some global variables
        uint timestamp = block.timestamp; //curent block timestamp
        address sender = msg.sender; //address of the caller
    }
}
