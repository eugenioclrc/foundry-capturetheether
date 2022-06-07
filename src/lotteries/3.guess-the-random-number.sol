pragma solidity ^0.8.13;

contract GuessTheRandomNumberChallenge {
    uint8 private answer;

    constructor() payable {
        require(msg.value == 1 ether, "You must pay 1 ether to play this game.");
        answer = uint8(uint(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))));
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 1 ether);

        if (n == answer) {
            payable(msg.sender).transfer(address(this).balance);
        }
    }
}