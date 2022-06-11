// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract TokenSaleChallenge {
    mapping(address => uint256) public balanceOf;
    uint256 constant PRICE_PER_TOKEN = 1 ether;

    event log_uint(uint256);

    constructor() payable {
        require(msg.value == 1 ether);
    }

    function isComplete() public view returns (bool) {
        return address(this).balance < 1 ether;
    }

    function buy(uint256 numTokens) public payable {
        unchecked {
            emit log_uint(msg.value);
            emit log_uint(numTokens * PRICE_PER_TOKEN);
            emit log_uint(numTokens);
            require(msg.value == numTokens * PRICE_PER_TOKEN);
            balanceOf[msg.sender] += numTokens;
        }
    }

    function sell(uint256 numTokens) public {
        require(balanceOf[msg.sender] >= numTokens);

        unchecked {
            balanceOf[msg.sender] -= numTokens;
            payable(msg.sender).transfer(numTokens * PRICE_PER_TOKEN);            
        }
    }
}