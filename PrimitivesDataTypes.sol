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

    /**
     * The data type byte represents a sequence of bytes.
     * Solidity presents two types of bytes types
     * 1) fixed size byte arrays
     * 2) dynamically-sized byte arrays
     *
     * The term bytes in Solidity represents a dynamic array of bytes
     * It's shorthand for byte[]
     */

    bytes1 a = 0xb5; //[10110101]
    bytes1 b = 0x56; //[01010110]

    //Defualt values
    //Unassigned variables have a default value
    bool public defaultBoo; //false
    uint public defaultUint; //0
    int public defaultInt; //0
    address public defaultAddr; //0x0000000000000000000000000000000000000000
}
