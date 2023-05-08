// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

/**
 * An error will undo all changes made to the state during a transaction
 *
 * You can throw an error by calling rquire, revert or assert
 * - require is used to validate inputs and conditions before execution
 * - revert is similar to require
 * - asset is used to check for code that should never be false.
 * Failing assertion probably mean sthat there is a big
 *
 * Use custome error to save gas
 */

contract Error {
    function testRequire(uint _i) public pure {
        //Require should be sued to validate conditions such as:
        //- inputs
        // - conditions
        // - return values from calls to other functions
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure {
        //revert is useful when the condition to check is complex
        //This code does the exact same thing as the example above
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint256 num;

    function testAssert() public view {
        //assert should only be used to test for internal erros
        //and to check invariants

        //here we asset taht num is always equal to 0
        //since it is impossible to update the value of num
        assert(num == 0);
    }

    //custom Error

    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({
                balance: bal,
                withdrawAmount: _withdrawAmount
            });
        }
    }
}

//another more concrete example
contract Account {
    uint public balance;
    uint public constant MAX_INT = 2 ** 256 - 1;

    function deposit(uint _amount) public {
        uint oldBalance = balance;
        uint newBalance = balance + _amount;

        //balance + _amount does not overflow if balance + _amount >= balance
        require(newBalance >= oldBalance, "overflow");
        balance = newBalance;
        assert(balance >= oldBalance);
    }

    function withdraw(uint _amount) public {
        uint oldBalance = balance;

        //balance - _amount does not underflow if balance >= _amount
        require(balance >= _amount, "unferflow");

        if (balance <= _amount) {
            revert("underflow");
        }
        balance -= _amount;

        assert(balance <= oldBalance);
    }
}
