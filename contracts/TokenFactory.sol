pragma solidity ^0.5.1;

 contract ERC20Interface {
     // Get the total token supply
     function totalSupply() public returns (uint256 _totalSupply);

     // Get the account balance of another account with address _owner
     function balanceOf(address _owner) public returns (uint256 balance);

     // Send _value amount of tokens to address _to
     function transfer(address _to, uint256 _value) public returns (bool success);

     // Send _value amount of tokens from address _from to address _to
     function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);

     // Allow _spender to withdraw from your account, multiple times, up to the _value amount.
     // If this function is called again it overwrites the current allowance with _value.
     // this function is required for some DEX functionality
     function approve(address _spender, uint256 _value) public returns (bool success);

     // Returns the amount which _spender is still allowed to withdraw from      _owner
     function allowance(address _owner, address _spender) public returns (uint256 remaining);

     // Triggered when tokens are transferred.
     event Transfer(address indexed _from, address indexed _to, uint256 _value);

     // Triggered whenever approve(address _spender, uint256 _value) is called.
     event Approval(address indexed _owner, address indexed _spender, uint256 _value);
 }

 contract TokenFactory is ERC20Interface {
      string public symbol;
      string public name;
      uint8 public decimals = 18;
      uint256 public TotalSupply;
    

     // Owner of this contract
     address public owner;

     // Balances for each account
     mapping(address => uint256) public balances;

     // Owner of account approves the transfer of an amount to another account
     mapping(address => mapping (address => uint256)) allowed;

     // Functions with this modifier can only be executed by the owner
     modifier onlyOwner() {
         require(msg.sender != owner); {

          }
          _;
      }

      // Constructor
      constructor(string memory _symbol, string memory _name, uint256 _initalSupply) public{
          owner = msg.sender;
          balances[msg.sender] = _initalSupply;
          symbol = _symbol;
          name = _name;
          TotalSupply = _initalSupply;
      } 

 