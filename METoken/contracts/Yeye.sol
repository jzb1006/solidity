// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Yeye {

 event Log(string msg);

 function hip() public virtual {
     emit Log("Yeye");
 }

 function pop()public virtual{
     emit Log("Yeye");
 }

    function yeye() public virtual {
        emit Log("Yeye");
    }

}

contract Baba is Yeye {


 function hip() public virtual override {
     emit Log("Baba");
 }

 function pop()public virtual override{
     emit Log("Baba");
 }

    function baba() public virtual {
        emit Log("Baba");
    }

    function callParent() public{
        super.pop();
    }

    

}

abstract contract A {
    uint public a;

    constructor(uint _a) {
        a = _a;
    }
}

contract C is A {
    constructor(uint _c) A(_c * _c) {}
}