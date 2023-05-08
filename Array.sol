// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

//array can have a compile time fized size or a dynamic size

contract Array {
    //several ways to initialize an array
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    //fized sized array, all elems initialized to 0
    uint[10] public fixedSizedArray;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    //Solidity can return a whole array, but this should be avoided incase
    //the array is infinite in size/growing infinitely
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        //append to array
        arr.push(i);
    }

    function pop() public {
        //Remove the last element from array
        arr.pop();
    }

    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint index) public {
        //delete does not change the array length
        //It resets the value at the index to its default value
        //in this case 0

        delete arr[index];
    }

    function examples() external pure {
        //create array in emmory, only fixed size can be created
        uint[] memory a = new uint[](5);
    }

    //EXAMPLES OF REMOVING ARRAY ELEMENT
    //shifting array elems from right to left
}

contract ArrayRemoveByShifting {
    //[1, 2, 3] --remove(1) --> [1,3,3] --> [1,3]
    //[1,2,3,4,5,6] --remove(2) --> [1,2,4,5,6,6] --> [1,2,4,5,6]
    //[1,2,3,4,5,6] -- remove(0) --> [2,3,4,5,6,6] --> [2,3,4,5,6]
    //[1] -- remove(0) --> [1] --> []

    uint256[] public arr;

    function remove(uint256 _index) public {
        require(_index < arr.length, "Index out of bound");
        for (uint i = _index; i < arr.length; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        //[1,2,4,5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        //[]
        assert(arr.length == 0);
    }
}
