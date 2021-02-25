// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;

//Ecrire un smart contract qui récupère la balance de l’address “0xb2f55315C465297A5926795d5Bb94f985209398E” sur kovan

contract AddressExamples {
    address public ownerAddress = 0xb2f55315C465297A5926795d5Bb94f985209398E;
    function getOwnerBalance() public view returns (uint)  {
        return  ownerAddress.balance;
    }
}
