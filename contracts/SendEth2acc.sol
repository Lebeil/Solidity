// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.8.0;

//Ecrire un smart contract qui transfère des Ethers entre deux comptes ethereum

contract sendEth {
    address payable public receiveTransac = 0x1926E357c5cDe2367b2757bd10261042A76f1F23;
    function sendTransac() public payable returns (bool){
        receiveTransac.transfer(250);
        return true;
    }
    function getBalance() public view returns(uint){
        return receiveTransac.balance;
    }
    function getBalanceContract() public view returns(uint){
        return address(this).balance;
    }
}

//Correction version Sandy

/*

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.8.0;
*/
/**
* @title SendEther
* @dev send ether between 2 accounts
*//*

contract SendEther {
    address payable user = 0x6db64B65E05cFdffcc59aed245B65278E8AaDd79;
    mapping(address => uint) public deposits;
    receive() external payable {
        deposits[msg.sender] += msg.value;
    }
    function sendViaTransfer(uint _amount) public payable {
        require(deposits[msg.sender] >= _amount);
        user.transfer(_amount);
        deposits[msg.sender] -= _amount;
    }
    function getBalance() public view returns(uint) {
        return address(this).balance;
    } }

*/
