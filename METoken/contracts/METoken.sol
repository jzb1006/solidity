pragma solidity ^0.8.0;

import 'openzeppelin-solidity/contracts/token/ERC20/ERC20.sol';

contract METoken is ERC20 {
    string public constant name = 'Mastering Ether Token';
    string public constant symbol = 'MET';
    uint8 public constant decimals = 2;
    uint256 constant _initial_supply = 2100000000;
    address[] balances;
    uint256 totalSupply;

    constructor () public {
        totalSupply = _initial_supply;
        balances[msg.sender] = _initial_supply;
        emit Transfer(msg.sender, msg.sender, totalSupply);
    }
}
