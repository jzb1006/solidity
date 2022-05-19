pragma solidity ^0.8.0;

contract Tese2 {
    uint256 public  _numbers = 5;

    function add() external {
        _numbers = _numbers + 1;
    }

    // pure
    function addPure(uint256 _number) external pure returns (uint256 new_number) {
        new_number = _number + 1;
    }

    // view
    function addView() external view returns (uint256 new_number) {
        new_number = _numbers + 1;
    }

    // internal
    function minus() internal {
        _numbers = _numbers + 1;
    }

    // external
    function minusCall() external {
        minus();
    }

    // payable
    function minusPayable() external payable returns (uint256 balance) {
        minus();
        balance = address(this).balance;
    }

    function fCalldata(uint[] calldata _x) public pure returns(uint[] calldata){
        return(_x);
    }
}

