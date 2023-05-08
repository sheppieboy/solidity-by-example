// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract Primitives {
    bool public boo = true;

    /**
     * uint stands for unsigned integer, meaning non negative integers
     * different sizes are available:
     *
     * uint8 ranges from 0 to 2**8 -1
     * uint16 ranges from 0 to 2**16 -1
     * unint256 ranges from 0 to 2**256 -1
     *
     */

    uint public u8 = 1;
    uint256 public u256 = 456;
    uint public u = 256; //uint is an alias for uint256

    /**
     * Negative numbers are allowed for int types
     * Like uint, different ranges are avilable from int8 to int256
     * int8 ranges from -2**7 and 2**7 -1
     * ....
     * int256 ranges from -2**255 and 2**255 -1
     */

    int8 public i8 = -1;
    int256 public i256 = 456;
    int public i = -123; //alias for int256

    address public addy = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
}
