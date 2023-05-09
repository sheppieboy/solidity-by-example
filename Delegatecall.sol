// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

/**
 * delegatecall is a low level function similar to call
 * When contract A executes delegatecall to contract B, B's code is executed
 * with contract A's stroage, msg.sender and msg.value
 */

contract B {
    //storage layout must be the same as contract A
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("SetVars(uint256)", _num)
        );
    }
}
