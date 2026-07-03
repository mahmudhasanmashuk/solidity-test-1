// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    function changeNumber(uint256 _additionalNumber) public override returns(uint256) {
        number += _additionalNumber;
        return number;
    }
}