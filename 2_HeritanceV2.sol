pragma solidity >=0.8.7;

//In this contract we are assuming that there are many kids
// instead of one
contract Heritance {
    mapping(address => uint) public amounts;
    mapping(address => uint) public timeLeft;
    mapping(address => bool) public paid;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    function addKid(address kid, uint timeToMaturity) external payable {
        require(msg.sender == admin, "only parents can use this function");
        require(amounts[msg.sender] == 0, "kid can withdraw");
        amounts[kid] = msg.value;
        timeLeft[kid] = block.timestamp + timeToMaturity;
    }

    function withdraw() external {
        require(timeLeft[msg.sender] <= block.timestamp, "you arent mature yet");
        require(amounts[msg.sender] > 0, "only kid can withdraw");
        require(paid[msg.sender] == false, "dont steal");
        paid[msg.sender] = true;
        payable(msg.sender).transfer(amounts[msg.sender]);
    }
}