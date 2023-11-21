// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiOptionVoting {
    mapping(address => bool) public hasVoted;
    mapping(uint256 => uint256) public votes;

    uint256 public totalOptions;

    event VoteCasted(address indexed voter, uint256 option);

    modifier validOption(uint256 _option) {
        require(_option > 0 && _option <= totalOptions, "Invalid option");
        _;
    }

    modifier notVoted() {
        require(!hasVoted[msg.sender], "You have already voted");
        _;
    }

    constructor(uint256 _totalOptions) {
        require(_totalOptions > 0, "Total options must be greater than 0");
        totalOptions = _totalOptions;
    }

    
}
