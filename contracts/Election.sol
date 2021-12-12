pragma solidity ^0.5.0;
contract Election{

    // Read/writecandidate
    string public candidate;



  // Model a Candidate
     struct Candidate {
         uint id;
         string name;
         uint voteCount;
         }

         mapping(uint => Candidate) public candidates;

         uint public candidatesCount ;


    // Constructor 
    constructor() public {
        addcandidate("boulbaba");
        addcandidate("mohamed");
        addcandidate("amin");
        addcandidate("ilyes");
     }


function addCandidate (stringmemory_name) private {
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
   