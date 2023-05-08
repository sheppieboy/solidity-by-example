// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

/**
 * Fallnack is a special functoion that is executed either when
 * - a function that does not exist is call or
 * - ether is sent directly to a contract but receive() does not exist or msg.data is not empty
 *
 * fallback has a 2300 gas limit when called by transfer or send
 */

contract Fallback {
    event Log(string func, uint gas);

    //Fallback function must be declared external
    fallback() external payable {
        //send / transfer (forwards 2300 gas to this fallback function)
        //call (forwards all of the gas)
        emit Log("fallback", gasleft());
    }

    //Receive is a variant of fallback that is triggered when msg.data is empty
    receive() external payable {
        emit Log("recieve", gasleft());
    }

    //helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallBack(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send ether");
    }
}
