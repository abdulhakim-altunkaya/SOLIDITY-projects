//SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.7;

contract Voting {

    address public owner;
    constructor(){
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner, "you arent owner");
        _;
    }

    address[] internal votedAddresses;
    string[] public proposals;

    mapping(string => address[]) internal votedProposals;

    uint public yesCount = 0;
    uint public noCount = 0;
    uint public abstentionCount = 0;



    function seeProposals(uint _number) public view returns(string memory) {
        return proposals[_number-1];
    }

    function addProposals(string memory _proposal) public onlyOwner {}
    /*
    - a time limit on the poposal voting 
    - require for seePrposals function 
    */

}