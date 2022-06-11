// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/math/1-token-sale.sol";

// add extra contracts you need to hack here

contract TokenSaleChallengeTest is Test {
    TokenSaleChallenge target;
    address hacker;

    function setUp() public {
        target = new TokenSaleChallenge{value: 1 ether}();
        
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
