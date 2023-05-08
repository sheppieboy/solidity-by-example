// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

/**
 * There are sveral ways to return outputs from a function
 * Public functions cannot accept certain data types as inputs or outputs
 */

contract Function {
    //functions can return multiple values
    function returnMany() public pure returns (uint, bool, uint) {
        return (1, true, 2);
    }

    //return values can be names
    function named() public pure returns (uint x, bool b, uint y) {
        return (1, true, 2);
    }

    //return values can be assigned by their name
    //In this case the return can be omitted
    function assigned() public pure returns (uint x, bool b, uint y) {
        x = 1;
        b = true;
        y = 2;
    }

    //Use destructuring assignments when calling another
    //function that returns multiple values
    function destructuringAssignments()
        public
        pure
        returns (uint, bool, uint, uint, uint)
    {
        (uint i, bool b, uint j) = returnMany();
        //values can be left out
        (uint x, , uint y) = returnMany();

        return (i, b, j, x, y);
    }

    //can use array for input
    function arrayInput(uint[] memory _arr) public {}

    //can use array for output
    uint[] public arr;

    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }
}

//call function with key-value inputs
contract XYZ {
    function someFuncWithManyInputs(
        uint x,
        uint y,
        uint z,
        address a,
        bool b,
        string memory c
    ) public pure returns (uint) {}

    function callFunc() external pure returns (uint) {
        return someFuncWithManyInputs(1, 2, 3, address(0), true, "c");
    }

    function callFuncWithKeyValue() external pure returns (uint) {
        return
            someFuncWithManyInputs({
                a: address(0),
                b: true,
                c: "c",
                x: 1,
                y: 2,
                z: 3
            });
    }
}
