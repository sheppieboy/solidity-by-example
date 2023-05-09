// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

/**
 * call is a low level function to interact with other contracts.
 * This is the recommended method to use when you're just sending Ether via calling the fallback function
 * However it is not the recommended way to call existing functions
 *
 * Few reasons why low-level call is not recommended
 * - Reverts are not bubbled up
 * - Type Checks are bypassed
 * - Function existence checks are omitted
 */

contract Receiver {
    event Received(address caller, uint amount, string message);

    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function foo(
        string memory _message,
        uint _x
    ) public payable returns (uint) {
        emit Received(msg.sender, msg.value, _message);
        return _x + 1;
    }
}

contract Caller {
    event Response(bool success, bytes data);

    //Lets imagine that contract Caller does not have the source code for the contract
    //Receiver, but we do know the address of contract Reciver and the function to call

    function testCallFoo(address payable _addr) public payable {
        //you can send ether and specify a custom gas amount
        (bool success, bytes memory data) = _addr.call{
            value: msg.value,
            gas: 5000
        }(abi.encodeWithSignature("foo(string, uint256)", "call foo", 123));
        emit Response(success, data);
    }

    //call a function that does not exist triggers tyhe fallback function
    function testCallDoesNotExist(address payable _addr) public payable {
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("DoesNotexist()")
        );
        emit Response(success, data);
    }
}
