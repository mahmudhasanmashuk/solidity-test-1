// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorage() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {

    }
}