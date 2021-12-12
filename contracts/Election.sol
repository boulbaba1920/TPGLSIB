pragma solidity ^0.5.0;
contract Election{

    // Read/writecandidate
    string public candidate;



  // Model a Candidate
     struct Candidate {
         uint id;
         string name;
         string avatar
         uint voteCount;
         }

         mapping(uint => Candidate) public candidates;
         mapping(uint => bool) public voters;

         uint public candidatesCount ;
         uint public totalvotes;

event votedEvent
(
    uint indexed _candidateId
);

    // Constructor 
    constructor() public {
        addcandidate("Chayma","yrl1");
        addcandidate("Wassim","yrl2");
        addcandidate("Oumayma","yrl3");
        addcandidate("Amine","yrl4");
        
     }


function addCandidate (string memory_name,string memory _url) private {
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
   
   cast Vote:function(){ 
       var candidateId=$('#candidatesSelect').val();
       App.contracts.Election.deployed().then(function(instance)
       {
           returninstance.vote(candidateId,{from:App.account});
           }).then(function(result){
               //Waitforvotestoupdate
               $("#content").hide();
               $("#loader").show();
               }).catch(function(err){
                   console.error(err);
                   });
                   }
                   };