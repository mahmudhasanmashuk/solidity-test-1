// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

contract SimpleStorage {
    struct People {
        string name;
        uint256 age;
    }

    People[] public users;

    mapping(address => People) public validators;
    address[] public validatorAddresses; 

    function addValidators(address _walletAddress, string memory _name, uint256 _age) public {
        validators[_walletAddress] = People(_name, _age);
        validatorAddresses.push(_walletAddress);
    }

    event logValidatorsEvent(string name, uint256 age);

    function printValidator(address _walletAddress) public view returns(string memory, uint256) {
        People memory validator = validators[_walletAddress];
        return (validator.name, validator.age);
    }

    function logValidators() public {
        for(uint256 i = 0; i<validatorAddresses.length; i++){
            emit logValidatorsEvent(validators[validatorAddresses[i]].name, validators[validatorAddresses[i]].age);
        }
    }

    function addUser(string memory _name, uint256 _age) public {
        users.push(People(_name, _age));
    }
    uint256 length = users.length;

    event printUsersEvent(string name, uint256 age);

    function logUsers() public {
        for(uint256 i = 0; i<users.length; i++) {
            emit printUsersEvent(users[i].name, users[i].age);
        }
    }

    // function printUsers() public view returns(string[] memory, uint256[] memory) {
    //     string[] memory names = new string[](length);
    //     uint256[] memory ages = new uint256[](length);

    //     for(uint256 i = 0; i<length; i++){
    //         names[i] = users[i].name;
    //         ages[i] = users[i].age;
    //     }

    //     return (names, ages);

    // }


    uint256 number = 256;
    function changeNumber(uint256 _number) public virtual returns(uint256) {
        number = _number;
        return number;
    }

}