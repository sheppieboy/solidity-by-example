// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

/**
 * Parent contracts can be called directly, or by using the keyword super
 * By using the keyword super, all of the immediate parent contracts will be called
 * 
 * A
 /  \
B   C
 \ /
  D
 */

contract A {
    //This is called an event.  You can emit events from your function
    //and they are logged into the transaction log
    //In our case, this will be useful for tracing function calls

    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo called");
    }

    function bar() public virtual {
        emit Log("A.bar is called");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("b.foo called");
    }

    function bar() public virtual override {
        emit Log("B.bar is called");
        super.bar();
    }
}

contract C is A {
    function foo() public virtual override {
        emit Log("C.foo is called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar is called");
        super.bar();
    }
}

contract D is B, C {
    function foo() public override(B, C) {
        super.foo();
    }

    // D.foo()
    //Although D inherits A, C, and c, it only called C and then A

    function bar() public override(B, C) {
        super.bar();
    }

    // D.bar()
    //D called C, then B, and Finally A
    //Although super was called twice (B and C) it only called A once
}
