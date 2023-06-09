// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

/**
 * A constructor is an optimal function that is executed upon contract creation
 */

//Base contract X
contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

//Base contract Y
contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

//There are 2 ways to initailize parent contract with parameters

//1) Pass the parameters here in the inheritance list
contract B is X("Input to X"), Y("Input to Y") {

}

//2)Pass the parameters to the child contracts constructor,

contract C is X, Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

/**
 * Parent constructors are always called in the order of inheritance
 * regardless of the order of parent contracts listed in the constrcutor of the child contract
 *
 */

//Ex. Order of constrcutors called:
//1. X
//2. Y
//3. D
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}

//Ex. Order of constructors called:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}
