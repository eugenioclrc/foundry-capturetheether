
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/lotteries/2.guess-the-secret-number.sol";

// add extra contracts you need to hack here

contract GuessTheSecretNumberChallengeTest is Test {
    GuessTheSecretNumberChallenge target;
    function setUp() public {
        target = new GuessTheSecretNumberChallenge{value: 1 ether}();
    }

    function testChallenge() public {
        // your code
        uint8 i = 0;

        bytes32 _hashAnswer = target.answerHash();
        while(_hashAnswer != keccak256(abi.encodePacked(i))) {
            ++i;
        }
        target.guess{value: 1 ether}(uint8(i));
        // end of your code

        assertTrue(target.isComplete());
    }

    receive() external payable {
        // for receiving eth in this contract 
    }
}
