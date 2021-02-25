// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.8.0;
pragma abicoder v2;

/**
 * @title Store
 */

contract Store {
    struct Item{
        uint8 id;
        uint8 price;
        uint8 units;
        string name;
        string marque;
    }

    mapping(uint => Item) public items;
    // items[0] =>  Item(0, 0, 0, "", "")
    // items[1] =>  Item(0, 0, 0, "", "")
    // items[2] =>  Item(0, 0, 0, "", "")
    // ...

    uint8 public ids;

    // gas 106760 (sans optimisation des inputs)
    // gas 91331 (avec optimisation des inputs)
    // gas 74201 (aec optimisation bytes8)
    function addItem(uint8 _price, uint8 _units, string memory _name, string memory _marque) public {
        items[ids] = Item(ids, _price, _units, _name, _marque);

        /*
        // gas 106913
        Item memory item;

        item.id = ids;
        item.price = _price;
        item.units = _units;
        item.name = _name;
        item.marque = _marque;

        items[ids] = item;
        */

        ids++;
    }

    function getItem(uint _id) public view returns(Item memory){
        //Item memory item = items[_id];
        return items[_id];
    }

    function setItem(uint _id, uint8 _price, uint8 _units, string memory _name, string memory _marque) public {
        // si je veux modifier une partie
        items[_id].price = _price;
        items[_id].units = _units;

        // si je veux tout modifier
        items[_id] = Item(ids, _price, _units, _name, _marque);
    }

    function removeItem(uint _id) public {
        delete items[_id];
        //items[_id] = Item(0, 0, 0, "", "");
    }
}
