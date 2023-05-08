// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract EtherUnits {
    uint public oneWei = 1 wei;
    //1 wei is equal to 1
    bool public isOneWei = 1 wei == 1;

    //1 ether is equal to 10^18 wei
    uint public oneEther = 1 ether;
    bool public isOneEther = 1 ether == 1e18;
}
