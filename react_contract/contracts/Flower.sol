//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.7;
contract Flower {
    string public myFlower = "Rose";
    function changeWord(string memory _word) external {
        myFlower = _word;
    }
}