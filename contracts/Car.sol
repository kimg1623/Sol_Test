pragma solidity^0.4.18;
pragma experimental ABIEncoderV2;

contract Car{ 
    struct CarDetails{ 
        uint Id;
        uint timestamp;
        string carName;
        string[] accident;
    }
   
    mapping (uint => CarDetails) cars;
    
    // event1: check enroll status
    event logCarAddedStatus(bool status, uint timestamp, uint carId);
    //event2: get All of CarDetails
    event logGetAllOfCars(uint amount);
    
    //owner set with timestamp of block 
    function enroll(uint _Id, string _name) public { 
        if(cars[_Id].timestamp == 0){
            cars[_Id].Id = _Id;
            cars[_Id].carName = _name;
            logCarAddedStatus(true, block.timestamp, _Id); 
        }else{ 
            logCarAddedStatus(false, block.timestamp, _Id); 
        } 
    }
    
    // get All of CarDetails
    function getAll(uint amount) {
        logGetAllOfCars(amount);
    }
    
    // get CarDetails.accident by carId
    function get(uint _Id) returns (string, string[]){
        return (cars[_Id].carName, cars[_Id].accident); 
    }

    // add new issue into car's accident 
    function addAccident(uint _Id, string _issue){
        cars[_Id].accident.push(_issue);
    }
}