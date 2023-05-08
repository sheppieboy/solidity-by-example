// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract Mapping {
    //Mapping from address to uint
    mapping(address => uint256) public myMap;

    function get(address _addr) public view returns (uint256) {
        //Mapping always returns a value
        //If the value was never set, it will rteurn the default value
        return myMap[_addr];
    }

    function set(address _addr, uint256 _i) public {
        //update the value at this address
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        //Reset the value to the default value
        delete myMap[_addr];
    }
}

contract NestedMapping {
    //nested mapping (mapping from address to another mapping)
    mapping(address => mapping(uint256 => bool)) public nested;

    function get(address _addr1, uint256 _i) public view returns (bool) {
        //You cna get values from a nested mapping
        //even when it is not initalized
        return nested[_addr1][_i];
    }

    function set(address _addr1, uint _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint256 _i) public {
        delete nested[_addr1][_i];
    }
}
