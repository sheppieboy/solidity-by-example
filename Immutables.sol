// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract Immutable {
    /**
     * Similiar to constants, values of immutable variables can be set inside the
     * contructor but cannot be modified afterwards
     */

    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint256 _MyUINT) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _MyUINT;
    }
}
