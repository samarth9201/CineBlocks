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

	struct movieDetails{
    string name;
    string details;
    string ipfsHash;
    uint256 deadline;
  }

  modifier  onlyOwner() { 
    require(msg.sender == owner); 
    _; 
  }
  
  movieDetails public movie;

  function addMovie(string memory _details, string memory _ipfs, uint256 _timeInDays) public onlyOwner{
    movie.name = movieName;
    movie.details = _details;
    movie.ipfsHash = _ipfs;
    movie.deadline = now + _timeInDays * 1 days;
  }
}
