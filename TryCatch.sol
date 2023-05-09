// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

//try/catch can only catch erros from external function calls and contract creation

//external contract usefd for try /catch examples
contract Foo {
    address public owner;

    constructor(address _owner) {
        require(_owner != address(0), "invalid address");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }

    function myFunc(uint x) public pure returns (string memory) {
        require(x != 0, "require failed");
        return "my func was called";
    }
}

contract Bar {
    event Log(string message);
    event LogBytes(bytes data);

    Foo public foo;

    constructor() {
        //This foo contract is used for examples of try and catch with extenrall call
        foo = new Foo(msg.sender);
    }

    //Example of trr/catch with external call
    //tryCatchExternalCall(0) => Log("external call failed")
    //tryCatchExternalCall(1) => Log("my func was called")
    function tryCatchExternalCall(uint _i) public {
        try foo.myFunc(_i) returns (string memory result) {
            emit Log(result);
        } catch {
            emit Log("external call failed");
        }
    }

    //Example of try / catch with contract creation
    // tryCatchNewContract(0x0000000000000000000000000000000000000000) => Log("invalid address")
    // tryCatchNewContract(0x0000000000000000000000000000000000000001) => LogBytes("")
    // tryCatchNewContract(0x0000000000000000000000000000000000000002) => Log("Foo created")
    function tryCatchExternalCall(address _owner) public {
        try new Foo(_owner) returns (Foo foo) {
            emit Log("Foo was created");
        } catch Error(string memory reason) {
            //catch failing revert() and require()
            emit Log(reason);
        } catch (bytes memory reason) {
            //catch failing assert()
            emit LogBytes(reason);
        }
    }
}
