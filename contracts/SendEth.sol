// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.8.0;

/**
* @title SendEther
* @dev send ether between 2 accounts
*/
contract SendEther {

    address payable private owner;
    mapping(address => uint) private deposits;
    mapping(address => bool) private admins;
    uint private dateLimit;

    /**
    * @dev Set contract deployer as admin
    * Set dateLimit
    */
    constructor() {
        owner = msg.sender;
        admins[msg.sender] = true;
        dateLimit = block.timestamp + 1 minutes;
    }

    /**
    * @dev receive
    * receive ethers and store value to deposits
    */
    receive() external payable {
        deposits[msg.sender] += msg.value;
    }

    /**
    * @dev transfer ethers sender
    */
    function takeViaTransfer(uint _amount) public payable {
        require(deposits[msg.sender] >= _amount, "Not possible to send more than your deposit !");
        msg.sender.transfer(_amount);
        deposits[msg.sender] -= _amount;
    }

    /**
    * @dev withdraw all the balance from admin after 1 minutes
    */
    function withdraw() public {
        require(admins[msg.sender] == true, "Not a admin !");
        require(block.timestamp >= dateLimit, "Not possible to withdraw the balance for the moment !");
        msg.sender.transfer(address(this).balance);
        emptyDeposits();
    }

    /**
    * @dev Add Admin
    */
    function addAdmin(address _target) public {
        require(owner == msg.sender, "Not a owner !");
        admins[_target] = true;
    }

    /**
    * @dev Remove Admin
    */
    function removeAdmin(address _target) public {
        require(owner == msg.sender, "Not a owner !");
        admins[_target] = false;
    }

    /**
    * @dev empty all the deposits
    */
    function emptyDeposits() private {
        // Trouver un moyen de vider le deposits
    }

    /**
    * @dev get balance of the contract
    */
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}
