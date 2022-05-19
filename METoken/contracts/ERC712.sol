// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;


contract Error {
    mapping(uint256 => address) private _owners; // id映射到地址
   error TransferNotOwner();

   function transferOwner(uint256 tokenId,address newOwner) public{
      if(_owners[tokenId] != msg.sender){
         revert TransferNotOwner();
      }
      _owners[tokenId] = newOwner;
    }
}


