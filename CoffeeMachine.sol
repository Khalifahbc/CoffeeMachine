// SPDX-License-Identifier: MIT
pragma solidity >=0.7.16 <0.9.0;


contract addCoffeeMachine{
      // state variables

     address public  Owner;
     mapping (address => uint) public coffeeBalance; 

    // set the owner as th address that deployed the contract
    // set the initial coffee machine balance to 200

     constructor(){
         Owner = msg.sender;
         coffeeBalance[address(this)] = 200;
     }

     function getCoffeeMachineBalance() public view returns (uint) {
        return coffeeBalance[address(this)];
    }
    // Let the owner add the coffee machine

     function addCoffeeMachines(uint amount) public {
       require(msg.sender == Owner, "Only the owner can add" );
       coffeeBalance[address(this)] += amount;
     }
      // Purchase coffee from the coffee machine

     function buyCoffee(uint amount ) public payable {
         require (msg.value >= amount * 2 ether , "You must pay at least 2 ETH per coffee");
         require(coffeeBalance[address(this)] >= amount , "Not enough coffee ");
         coffeeBalance[address(this)] -= amount;
         coffeeBalance[msg.sender]+= amount;
     }
     
     }
