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
    string[] internal proposals;
    string public currentProposal;
    string[] internal passedProposals;

    //this part is for future voting count and voting result functions.
    uint internal yesCount = 0;
    uint internal noCount = 0;
    uint internal abstentionCount = 0;


    //Currently and account can make a proposal. In future I need to limit this to only stakeholders.
    function submitProposals(string memory _proposal) public {
        proposals.push(_proposal);
    }

    //Only owner can choose which proposal should be put on election. In future, I need to replace owner power
    //with majority will. 
    function selectProposals(uint _number) public onlyOwner {
        currentProposal = proposals[_number];
        if(_number == proposals.length-1) {
            proposals.pop();
        } else {
            proposals[_number] = proposals[proposals.length-1];
            proposals.pop();
        }

    }

    //I need to deepen the code with result functions.
    function closeVoting() public onlyOwner {
        passedProposals.push(currentProposal);
        currentProposal = "";
    }

    //To see a specific proposal from Waiting proposals, just enter an index number
    function seeProposals(uint _number) public view returns(string memory) {
        return proposals[_number-1];
    }

    //See  proposal on agenda.
    function seeMainProposal() public view returns(string memory) {
        return currentProposal;
    }

    //See waiting proposals
    function getProposals() external view returns(string[] memory) {
        return proposals;
    }

    //see passed proposals.
    function getPassedProposals() external view returns(string[] memory) {
        return passedProposals;
    }

    //passed proposals = accepted and declined proposals
    //number limitations for all uint parameter functions.

}