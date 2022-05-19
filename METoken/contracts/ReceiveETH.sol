// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ReceiveETH {
   event Log(uint amount,uint gas);
   receive() external payable{
       emit Log(msg.value, gasleft());
   }

   function getBalabce() view public returns (uint){
       return address(this).balance;
   }
}