// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

/**
 * Functions and state variables have to declare whether they are accessible by other contracts.
 * Functions can be declared as:
 * - public: any contract and account can call
 * - private: only inside the contract that defines the contract
 * - internal: only inside contract that inherits an internal function
 * - external: only other contratcs and accounts can call
 *
 * State variables can be decalred as public, private, or internal but not external
 */

contract Base {
    //private function can only be called inside this contract
    //contracts that inherit this contract cannot call this function
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    //internal function can be called
    //-inside this contract
    //-inside contracts that inherit this contract
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure returns (string memory) {
        return internalFunc();
    }

    //public functions can be called:
    //inside this contract
    //inside contracts that inherit this contract
    //by other contracts
    function publicFun() public pure returns (string memory) {
        return "public function called";
    }

    //external functions can only called
    //- by other contracts and accounts
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    //state variables
    string private privateVar = "my private variable";
    string internal internalVar = "my internal var";
    string public publicVar = "my public variables";

    //state variables cannot be external;
}

contract Child is Base {
    //Inherited contracts do not have access to private functions and state variables

    //Internal function call be called inside child contracts.
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }
}
