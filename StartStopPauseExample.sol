//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

contract MyContract {
    
    address owner;
    bool isPaused;
    
    constructor() {
        owner = msg.sender;
    }
    
    function pauseContract(bool _isPaused) public {
        require(msg.sender == owner, "You are not the owner!");
        isPaused = _isPaused;
    }
    
    function sendEther() public payable {}
    
    function withdtrawEther(address payable _to) public {
        require(msg.sender == owner, "You are not the owner!");
        require(!isPaused, "The contract is paused!");
        _to.transfer(address(this).balance);
    }
    
    function destroyContract(address payable _to) public {
        require(msg.sender == owner, "You are not the owner!");
        selfdestruct(_to);
    }
    
}
