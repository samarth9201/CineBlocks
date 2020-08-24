pragma solidity ^0.5.1;

import "./MovieContract.sol";

contract FactoryContract {
  
	uint256 public contractCount;
	address[] public contractContainer;
	address public recentContract;

	mapping(string => address) public MovieToContracts;

	function newMovieContract(string memory _movieName) public{
		MovieContract instance = new MovieContract(_movieName,msg.sender);
		recentContract = address(instance);
		contractCount++;
		contractContainer.push(address(instance));
		MovieToContracts[_movieName] = address(instance);

	}

}