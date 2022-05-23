pragma solidity >=0.8.7;

//This project bequeaths Ethereum from parents
//to their kid, once the kid reaches the desired age.

contract Heritance {
    address public myKidAccount;
    uint public releaseDate;

    contructor(address _myKidAccount, uint timeToMaturity) payable {
        releaseDate = block.timestamp + timeToMaturity;
        myKidAccount = _myKidAccount;
    }

    function withdraw() external {
        require(block.timestamp > releaseDate, "time is not filled yet");
        require(msg.sender == myKidAccount, "only kid can withdraw");
        payable(msg.sender).transfer(address(this).balance);
    }
}
