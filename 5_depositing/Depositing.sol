//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7;

contract Deposit3 {
    function getBalance() external view returns(uint) {
        return address(this).balance;
    }

    //Address --> Contract deposit
    function deposit() external payable {
    }

    //Contract --> Address
    function withdraw1(address payable _to) external {
        _to.transfer(99);
    }
    //Contract --> Address
    function withdraw2(address payable _to, uint _amount) external {
        _to.transfer(_amount);
    }
}