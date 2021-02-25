pragma solidity 0.6.11;

//Votre smart contract doit s’appeler “Choice”.
//Votre smart contract doit utiliser la version 0.6.11 du compilateur.
//Votre smart contract doit définir un mapping “choices”, où la clé est une adresse et la valeur un uint.
//Votre smart contract doit définir une fonction “add” qui permet à un utilisateur de stocker son uint renseigné (en paramètre de la fonction “_myuint”) dans le mapping “choices”.

contract Choice {

    mapping(address => uint) choices;

    function add(uint _myuint) public {
        choices[msg.sender] = _myuint;
    }

}
