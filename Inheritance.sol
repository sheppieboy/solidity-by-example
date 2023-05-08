// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

/* 
Solidity supports multiple inheritance.  Contracts can inherit other contract by using is keyword.
Function that is going to be overriden by a child contract must be declared as virtual.
Function that is going to override a parent function must use the keyword override.
Order of inheritance is important.
You have to list the parent contracts in the order from "most base-like" to "most derived".


Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B is A {
    //override A.foo()

    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    //Override A.foo()

    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

/**
 * Contracts can inherit from multiple parent contracts.
 * When a function is called that is defined multiple times in different contracts, parent cintracts are searched
 * from right to left, and in deoth first manner
 */

contract D is B, C {
    //D.foo returns "C"
    //since C is the right most parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B {
    //E.foo() returns "B"
    //since B is the right most parent contract with function foo()
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}

//inheritance must be ordered from "most base-like" to "most derived"
//Swapping the order of A and B will throw a compilation.

contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}