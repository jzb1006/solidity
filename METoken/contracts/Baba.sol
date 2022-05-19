// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Baba is Yeye {


 function hip() public virtual override {
     emit Log("Baba");
 }

 function pop()public virtual override{
     emit Log("Baba");
 }

    function yeye() public virtual {
        emit Log("Baba");
    }

}