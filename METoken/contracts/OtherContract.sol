// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract OutherContract {
   uint256 private _x  = 0;
   event Log(uint amount,uint gas);

   function getBalance() view public returns(uint){
      return address(this).balance;
   }

   function setX(uint256 x)external payable {
       _x = x;
       if(msg.value > 0){
           emit Log(msg.value, gasleft());  
       }
   }

   function getx( ) external view returns(uint x){
      x = _x;
   }
}

contract CallContract{
    function callSetX(address _Address,uint256 x) external {
        OutherContract(_Address).setX(x);
    }


    function callGetX(OutherContract _Address) external view returns(uint x){
        x = _Address.getx();
    }

    function callGet2(address _Address)external view returns(uint x){
        OutherContract oc = OutherContract(_Address);
        x = oc.getx();
    }

    function setXTransferETH(address outherContract,uint256 x)payable external{
        OutherContract(outherContract).setX{value:msg.value}(x);
    }
    
}