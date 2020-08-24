pragma solidity ^0.5.1;

import "./MovieContract.sol";

contract FactoryContract {
  
	uint256 public contractCount;
	address[] public contractContainer;
	address public recentContract;

	mapping(string => address) public MovieToContracts;

}