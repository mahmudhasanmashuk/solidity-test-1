// Get Funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 4 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == i_owner, "Sender is not the owner");
        _;
    }

    function fund() public payable {
        // set a minimum funding value in USD
        // How do we send ETH to this contract?
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Minimum required fund not met");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {
        for(uint256 i = 0; i<funders.length; i++){
            address funder = funders[i];
            addressToAmountFunded[funder] = 0;
        }

        // reset the address
        funders = new address[](0);

        // send ether
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }   


    // what if somebody sends eth to this contract without calling this fund() function?

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }

    

}