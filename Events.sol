// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

/**
 * Events allow logging to the Ethereum blockchain.  Some use cases are:
 * - Listening for events and updating user interface
 * - A cheap form of storage
 */

contract Event {
    //Event declaration
    //Up to 3 params can be indexed
    //Indexed params helps you filter the logs by the indexed parameter
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "Testing");
        emit Log(msg.sender, "EVM");
        emit AnotherLog();
    }
}
