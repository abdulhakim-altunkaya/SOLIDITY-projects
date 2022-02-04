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
        require(block.timestamp > maturity, "still there is time")
        require(msg.sender == kid, "you are not my child");
        payable(msg.sender).transfer(address(this).balance);
    }
}
