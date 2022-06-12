// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/math/2-token-whale.sol";

// add extra contracts you need to hack here

contract TokenWhaleChallengeTest is Test {
    TokenWhaleChallenge target;
    address hacker;

    function setUp() public {
        hacker = vm.addr(1);
        vm.label(hacker, "Hacker");

        target = new TokenWhaleChallenge(hacker);
    }

    function testChallenge() public {
        vm.startPrank(hacker);

        // your code

        // kaktheplanet

        // end of your code
        vm.stopPrank();

        assertTrue(target.isComplete());
    }
}
