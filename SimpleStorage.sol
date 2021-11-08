// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage {
    // will be initialized to 0
    uint256 public favoriteNumber;
    uint256 public extra = 44;

    struct People {
        uint256 favNumber;
        string name;
    }

    People public person = People({favNumber:2, name:"Matt"});

    People[] public people;
    mapping(string => uint256) public nameToFaboriteNumber;

    // 'memory' or 'storage'
    function addPerson(string memory _name, uint256 _favNumber) public {
        people.push(People({favNumber: _favNumber, name: _name}));
        nameToFaboriteNumber[_name] = _favNumber;
    }

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        uint256 test = 4;
    }

    // 'view' or 'pure' doesn't cost gas because it is read operation and doesn't create a new transaction. 
    // view reads, pure performs operation
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    // pure can't even access favoriteNumber, because then it will also read the state and require 'view'
    function calculate(uint256 number) public pure {
        number + number;
    }
}