pragma solidity ^0.6.0;

contract SimpleStorage {
    uint256 public favoriteNumber;

    function store(uint256 _favoriteNumber) private {
        favoriteNumber = _favoriteNumber;
        uint256 test = 4;
    }
}