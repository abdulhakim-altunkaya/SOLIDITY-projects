pragma solidity >=0.8.7;

//In this contract we are assuming that there are many kids
// instead of one
contract Heritance {
    struct Kid {
        uint amount;
        uint maturity;
        bool paid;
    }
    mapping(address => Kid) public kids;

    address public admin;

    constructor() {
        admin = msg.sender;
    }

    function addKid(address kid, uint timeToMaturity) external payable {
        require(msg.sender == admin, "only parents can use this function");
        require(kids[msg.sender].amount == 0, "kid can withdraw");
        kids[kid] = Kid(msg.value, block.timestamp + timeToMaturity, false);
    }

    function withdraw() external {
        Kİd storage kid = kids[msg.sender];
        require(kid.maturity <= block.timestamp, "you arent mature yet");
        require(kid.amount > 0, "only kid can withdraw");
        require(kid.paid == false, "dont steal");
        kid.paid = true;
        payable(msg.sender).transfer(kid.amount);
    }
}