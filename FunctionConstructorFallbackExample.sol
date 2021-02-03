//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

contract MyContract {
    
    mapping(address => uint) public balanceReceived;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function destroySmartContract() public {
        require(msg.sender == payable(owner), "You are not the owner");
        selfdestruct(payable(owner));
    }

    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "not enough funds.");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
 
    receive () external payable {
        receiveMoney();
    }
    
}
