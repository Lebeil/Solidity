// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.8.0;

//1- Ajouter un administrateur qui a la possibilité de récupérer toute la balance du contrat
//2- Ajouter la condition suivante : l'administrateur ne peut récupérer les fonds qu'après une semaine du déploiement du contrat

/**
* @title SendEther
* @dev send ether between 2 accounts
*/
contract SendEther {
    address payable public user =
    0x6db64B65E05cFdffcc59aed245B65278E8AaDd79;
    address payable public admin;
    mapping(address => uint) public deposits;
    uint public dateLimit;
    /**
     * @dev Set contract deployer as admin
     * Set dateLimit
 */
    constructor() {
        admin = msg.sender;
        dateLimit = block.timestamp + 7 days;
    }
    /**
     * @dev receive
     * receive ethers and store value to deposits
     */

    receive() external payable {
        deposits[msg.sender] += msg.value;
    }

    /**
       * @dev transfer ethers to user
       *
       */
    function sendViaTransfer(uint _amount) public payable {
        require(deposits[msg.sender] >= _amount, "Not possible to
    send more than your deposit !");
        user.transfer(_amount);
        deposits[msg.sender] -= _amount;
    }
    /**
     * @dev withdraw all the balance from admin after 7 days
     */
    function withdraw() public {
        require(admin == msg.sender, "Not the owner !");
        require(block.timestamp >= dateLimit, "Not possible to
    withdraw the balance for the moment !");
        admin.transfer(address(this).balance);
    }
    /**
     * @dev get balance of the contract
     */
    function getBalance() public view returns(uint) {
        return address(this).balance;
    } }
