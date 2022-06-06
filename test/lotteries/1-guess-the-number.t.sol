
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/lotteries/1.guess-the-number.sol";

// add extra contracts you need to hack here

contract GuessTheNumberChallengeTest is Test {
    GuessTheNumberChallenge target;
    function setUp() public {
        target = new GuessTheNumberChallenge{value: 1 ether}();
    }

    function testChallenge() public {
        // your code

        // end of your code

        assertTrue(target.isComplete());
    }

    receive() external payable {
        // for receiving eth in this contract 
    }
}
