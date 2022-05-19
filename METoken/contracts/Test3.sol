pragma solidity ^0.8.0;

contract Test3 {
    uint[] x = [1,2,3];
    
    function fStorage() public{
        uint[] storage xStorage = x;
        xStorage[0] = 100;
    }

    function fMemory() public view{
        uint[] memory xMemory = x;
        xMemory[0] = 100;
    }
}