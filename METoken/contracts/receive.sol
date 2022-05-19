// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Receive {
   event Received(address Sender, uint Value);
   event fallbackCalled(address Sender, uint Value,bytes Data);
   receive() external payable {
      emit Received(msg.sender, msg.value);
   }

   fallback() external payable{
       emit fallbackCalled(msg.sender,msg.value,msg.data);
   }
}