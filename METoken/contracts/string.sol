// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract TestString {
   function getString(uint256 _number)public pure returns (string memory){
       return String.toHexString(_number);
   }
}