// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Test5 {
   mapping(uint => address) public idToAddress; // id映射到地址
   mapping(address=>address) public swapPair;   // 币对的映射，地址到地址

   struct Stident{
       uint256 id;
       uint256 score;
   }

   function writeMap(uint _Key,address _Value) public {
       idToAddress[_Key] = _Value;
   }

   function insertionSort(uint[] memory a) public pure returns (uint[] memory){
        for(uint i = 1;i<a.length;i++){
            uint temp = a[i];
            uint j = i;
            while((j>=1) && (temp<a[j-1])){
                a[j] = a[j-1];
                j--;
            }
            a[j] = temp;
        }
        return (a);
    }


}