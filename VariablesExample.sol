//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

contract WrokingWithVariables {
    
    uint public myUint;
    bool public myBool;
    address public myAddress;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    function setMyBool(bool _myBool) public {
        myBool = _myBool;   
    }
    
    function setAddress(address _address) public {
        myAddress = _address;
    }
    
    function getBalance() public view returns(uint) {
        return myAddress.balance;
    }
    
}
