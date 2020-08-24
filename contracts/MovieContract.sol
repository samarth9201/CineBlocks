pragma solidity ^0.5.1;

contract MovieContract {
	  string public movieName;
	  string public tokenName;
	  uint256 public creationDate;
	  uint256 public deadline;
	  uint256 public totalSupply;
	  address public owner;
	  address public tokenAddress;

	  constructor(string memory _movieName, address payable _movieCreator) public{
		    owner = _movieCreator;
		    movieName = _movieName;
	}
}
