// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12; contract parent{
    // Declaring internal // state varaiable uint internal sum;
    // Defining external function to set value of internal state variable sum
    function setValue() external { uint a = 10;
        uint b = 20;
        sum = a + b;
    } }
// Defining child contract
contract child is parent{
    // Defining external function to return value of internal state variable sum
    function getValue(
    ) external view returns(uint) {
        return sum; }
}
contract caller {
    // Creating child contract object child cc = new child();
    // Defining function to call setValue and getValue functions
    function testInheritance( ) public returns (uint) {
        cc.setValue();
        return cc.getValue(); }
}


// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;
// Defining parent contract A
contract A {
string internal x; string a = "Geeks" ; string b = "For";
// Defining external function to return concatenated string
function getA() external{
x = string(abi.encodePacked(a, b));
} }
// Defining child contract B inheriting parent contract A
contract B is A {
    string public y; string c = "Geeks";
// Defining external function to return concatenated string
function getB() external payable returns( string memory){
return y = string(abi.encodePacked(x, c));
}
}

// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;
// Defining child contract C inheriting parent contract A
contract C is B {
// Defining external function returning concatenated string
// generated in child contract B
function getC() external view returns(string memory){ return y;
}
}
// Defining calling contract contract caller {
C cc = new C();
// Defining public function to return final concatenated string
function testInheritance( ) public returns (
string memory) {
cc.getA(); cc.getB();
return cc.getC();
} }
}

// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;
// Defining child contract C inheriting parent contract A
contract C is B {
// Defining external function returning concatenated string
// generated in child contract B
function getC() external view returns(string memory){ return y;
}
}
// Defining calling contract contract caller {
C cc = new C();
// Defining public function to return final concatenated string
function testInheritance( ) public returns (
string memory) {
cc.getA(); cc.getB();
return cc.getC();
} }

// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;
// Defining parent contract A
contract A {
string internal x;
// Defining external function to set value of internalstate variable
function getA() external { x = "GeeksForGeeks" ;
// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;
// Defining child contract C inheriting parent contract A
contract C is A {
// Defining external function to return state variable sum function getAValue() external view returns(uint){
return sum; }
}}
// Declaring internal state variable
uint internal sum;
// Defining external function to set the value of internal state
varibale sum
function setA() external { uint a = 10;
uint b = 20;
sum = a + b;
} }
// Defining child contract B inheriting parent contract A
contract B is A {
// Defining external function to return state variable x function getAstr() external view returns(string memory){
// Defining calling contract
contract caller {
// Creating object of contract B B contractB = new B();
// Creating object of contract C
C contractC = new C();
// Defining public function to
// return values of state variables // x and sum
function testInheritance (
) public returns (
string memory, uint) { return (
return x; }}
contractB.getAstr(), contractC.getAValue());

