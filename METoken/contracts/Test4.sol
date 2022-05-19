// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Test4 {
   // 固定长度 Array
    uint[8] array1;
    address[100] array3;

    //结构体
    Student student;


    // 可变长度 Array
    uint[] array4;
    address[] array6;
    bytes array7;


    struct Student{
        uint256 id;
        uint256 score;
    }


    function initStudent1() external{
        Student storage _student = student;
        _student.id = 1;
        _student.score = 100;
    }
}