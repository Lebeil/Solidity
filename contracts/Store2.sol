pragma solidity ^0.4.0;

contract Magasin {
    struct Item {
        uint id;
        string name;
        uint price;
        uint units;
    }

    Item[] public items;

    function addItem(string memory name, uint price, uint units) public {
        Item memory item = Item(items.length, name, price, units);
        items.push(item);
    }

    function deleteItem() public {
        items.pop();
    }

    function totalItem() public view returns (uint){
        return items.length;
    }

    function getItem(uint id) public view returns (string memory) {
        return items[id].name;
    }

    function setItem(uint id, uint price, string memory name, uint units) public returns (bool) {
        // Méthode 1 :
        items[id].price = price;
        items[id].name = name;
        items[id].units = units;
        // Méthode 2 :
        Item memory item = Item(id, name, price, units);
        items[id] = item;
        // Méthode 3 : items[id] = Item(id, name, price, units);
        return true;
    }
}
