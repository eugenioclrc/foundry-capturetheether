
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/lotteries/5.predict-the-block-hash.sol";

// add extra contracts you need to hack here

contract PredictTheBlockHashChallengeTest is Test {
    PredictTheBlockHashChallenge target;
    address hacker;
    
    function setUp() public {
        target = new PredictTheBlockHashChallenge{value: 1 ether}();

        hacker = vm.addr(1);
        vm.label(hacker, "Hacker");
        vm.deal(hacker, 1 ether);
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
