
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/lotteries/3.guess-the-random-number.sol";

// add extra contracts you need to hack here

contract GuessTheRandomNumberChallengeTest is Test {
    GuessTheRandomNumberChallenge target;
    address hacker;
    
    function setUp() public {
        target = new GuessTheRandomNumberChallenge{value: 1 ether}();

        hacker = vm.addr(1);
        vm.label(hacker, "Hacker");
        vm.deal(hacker, 1 ether);
    }

    function testChallenge() public {
        vm.startPrank(hacker);
        // your code
        
        // kaktheplanet
        uint8 secretData = uint8(uint256(vm.load(address(target), bytes32(uint256(0)))));
        target.guess{value: 1 ether}(secretData);
        
        // end of your code
        vm.stopPrank();
        assertTrue(target.isComplete());
    }
}
