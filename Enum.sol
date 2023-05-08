// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract Enum {
    /**
     * Solidity supports enumerables and they are useful to model choice
     * and keep track of state
     *
     * Enums can be declared outside of a contract
     */

    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    //default value is the first element listed in
    //definition of the type, in this case "Pending"
    Status public status;

    //returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    function cancel() public {
        status = Status.Canceled;
    }

    //delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}
