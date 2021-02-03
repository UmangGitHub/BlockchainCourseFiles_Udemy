//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

contract MyContract {
    
    uint public contractBalance;    
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function sendEther() public payable{
        contractBalance = msg.value;
    }
    
    function withdrawEther(address payable _to) public {
        contractBalance -= this.getBalance();
        _to.transfer(this.getBalance());
    }
    
}
