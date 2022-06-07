
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/lotteries/1.guess-the-number.sol";

// add extra contracts you need to hack here

contract GuessTheNumberChallengeTest is Test {
    GuessTheNumberChallenge target;
    address hacker;

    function setUp() public {
        target = new GuessTheNumberChallenge{value: 1 ether}();
        
        hacker = vm.addr(1);
        vm.label(hacker, "Hacker");
        vm.deal(hacker, 1 ether);
    }

    function testChallenge() public {
        vm.prank(hacker);        
        // your code
        
        // kaktheplanet
        
        // end of your code
        vm.stopPrank();
        assertTrue(target.isComplete());
    }
}
