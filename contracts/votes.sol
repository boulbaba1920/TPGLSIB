// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;


contract vote {

    address public owner = msg.sender;
    uint256 public deadline  = block.timestamp + 1 days;
    uint256 nbrevotes;
    uint256 nbrevotesPositive;
    bool public Result;
    mapping(address =>  bool) ListVotes;

    
    function voter (bool choice ) public{

        require(block.timestamp < deadline);
        require(!ListVotes[msg.sender]);
        nbrevotes++;
        ListVotes[msg.sender]=choice;
        if(choice == true){
        nbrevotesPositive++;
              }

    if(nbrevotesPositive >= (nbrevotes/2)+1){
        Result=true;
    }
    else{
        Result=false;
    }

    }

}
 


