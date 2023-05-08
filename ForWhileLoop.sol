// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract Loop {
    function loop() public pure {
        for (uint i = 0; i < 6; i++) {
            if (i == 3) {
                continue;
            }
            if (i == 4) {
                break;
            }
        }

        //while loop
        uint j;
        while (j < 4) {
            j++;
        }
    }
}
