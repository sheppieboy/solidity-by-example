// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

/**
 * Sending ether(transfer, call, send)
 *
 * You can send Ether to other contracts by
 * - transfer (2300 gas, throws error)
 * - send (2300 gas, returns bool)
 * - call(forward all gas or set gas, returns bool)
 *
 * How to recieve Ether?
 * A contract recieving Ether must ahve at least one of the functions below
 * - recieve() external payable
 * - fallback() external payable
 * recieve is call if msg.data is empty, otherwise fallback is called
 *
 * Which method should you use
 * call in combination with re-entrancy guard is the recommended method to use fater Dec. 2029
 *
 * Guard against re-entrancy by
 * - making all state changes before calling other contracts
 * - using re-entrancy guard modifier
 */

contract ReceiveEther {
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    //function to recieve Ether. msg.data must be empty
    receive() external payable {}

    //fallback function is called when msg.data is not empty
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        //This function is no longer recommened for sending ether
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        //send returns a boolean value indicating success or failure
        //this function is not recommended for sending eth
        bool sent = _to.send(msg.value);
        require(sent, "failed to send ether");
    }

    function sendViaCall(address payable _to) public payable {
        //Call returns a boolean indicating success or failure
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "failed to send ether");
    }
}
