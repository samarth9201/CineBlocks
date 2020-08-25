pragma solidity ^0.5.1;

import "./TokenFactory.sol";
import "./SafeMath.sol";

contract MovieContract {
  using SafeMath for uint256;

  address public owner;
  address public tokenAddress;
  string public movieName;
  string public tokenName;
  uint256 public deadline;
  uint256 public totalSupply;
  uint256 public tokenPrice;
  uint256 public creationDate;
  uint256 public investorCount;

	  
TokenFactory public token;


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

  struct investorDetails{
  	string name;
  	string contactDetails;
    address investorAddress;
    uint256 tokensBought;
  }

   movieDetails public movie;


  mapping (uint256 => investorDetails)public investors;
  mapping (address => uint256 ) public investedAmount;

  modifier  onlyOwner() { 
    require(msg.sender == owner); 
    _; 
  }
  

  function addMovie(string memory _details, string memory _ipfs, uint256 _timeInDays) public onlyOwner{
    movie.name = movieName;
    movie.details = _details;
    movie.ipfsHash = _ipfs;
    movie.deadline = now + _timeInDays * 1 days;
  }

  function  createMovieToken(string memory _symbol, string memory _name, uint256 _totalSupply,uint256 _price) public onlyOwner{
      token = new TokenFactory(_symbol, _name, _totalSupply);
      tokenAddress = address(token);
      tokenName = _name;
      totalSupply = _totalSupply;
      tokenPrice = _price;

  }
  
  
  
  
}
