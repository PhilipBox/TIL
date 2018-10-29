pragma solidity 0.4.25;
contract Vote {
    // structure
    struct candidator {
        string name;
        uint upVote;
    }
    // variable
    candidator[] public candidatorList;
    
    // mapping
    
    // event
    event AddCandidator(string name);
    
    // modifier
        
    // constructor    
        
    //condidator
    function addCandidator(string _name)public {
        require(candidatorList.length < 5);
        candidatorList.push(candidator(_name, 0));
        
        // emit event
        emit AddCandidator(_name);  
        
    }
    // voting
    function Voting() public {
        
    }
    // finish vtoe
    function finishVote() public{
        
    }
    
}