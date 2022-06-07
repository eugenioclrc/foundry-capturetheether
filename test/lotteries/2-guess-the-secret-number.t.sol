
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/lotteries/2.guess-the-secret-number.sol";

// add extra contracts you need to hack here

contract GuessTheSecretNumberChallengeTest is Test {
    GuessTheSecretNumberChallenge target;
    address hacker;
    
    function setUp() public {
        target = new GuessTheSecretNumberChallenge{value: 1 ether}();

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
