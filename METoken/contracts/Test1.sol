pragma solidity ^0.8.0;

contract Test1 {
    address public _address = 0x0000000000000000000000000000000000000000;
    address payable public _address1 = payable(_address);

    uint256 public balance = _address1.balance;

    bytes32 public _byte32 = "MiniSolidity";
    bytes1 public _byte = _byte32[0];
}
