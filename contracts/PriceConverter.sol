// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// CHAINLINK AGGREGATOR V3 INTERFACE
import "./AggregatorV3Interface.sol";

library PriceConverter {
    
    function getPrice() internal view returns(uint256) {
        // ABI

        // ETH/USD price feed contract address from chain link latest price feed
        // mainnet address 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419

        // testnet address
        // sepolia testnet eth/usd price address chainlink
        // address 0x694AA1769357215DE4FAC081bf1f309aDC325306

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // answer == price of ETH in terms of USD
        return uint256(price * 1e10);
    }

    function getVersion() internal view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint256 _ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD = (ethPrice * _ethAmount) / 1e18;
        return ethAmountInUSD;
    }
}