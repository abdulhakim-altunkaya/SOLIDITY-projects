pragma solidity >=0.8.7;

//In this contract we are assuming that there are many kids
// instead of one
contract Heritance {
    mapping(address => uint) public amounts;
    mapping(address => uint) public timeLeft;

    function addKid(address kid, uint timeToMaturity) external payable {
        amounts[kid] = msg.value;
        timeLeft[kid] = block.timestamp + timeToMaturity;
    }

    function withdraw() external {
        require(timeLeft[msg.sender] <= block.timestamp, "you arent mature yet");
        require(amounts[msg.sender] > 0, "only kid can withdraw");
        payable(msg.sender).transfer(amounts[msg.sender]);
    }
}