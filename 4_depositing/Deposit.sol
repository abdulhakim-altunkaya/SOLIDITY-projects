//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7;

contract Deposit {
    string public myWord = "Flower";

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }

    function getAddress() external view returns(address) {
        return address(this);
    }
    //Contract -> Address(_to)
    function deposit(address payable _to) external payable {
        _to.transfer(55);
    }

    //Contract -> Address(_to)
    function deposit2(address payable _to) external payable {
        (bool success, ) = _to.call{value: 55}("");
        require(success, "failed to send ether");
    }

    //Function Caller -> Contract (but I need to use msg.value input field)
    function deposit3() external payable {
    }


    //Function Caller -> Contract
    fallback() external payable{}
    receive() external payable{}

}
