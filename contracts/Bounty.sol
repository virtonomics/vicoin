pragma solidity ^0.4.18;

import './Minter.sol';

/**
* @title Bounty reward minter
*/
contract Bounty is Minter {
	
	// Events:
	// when user rewarded
	event Reward(address who, uint256 amount);
	
	// Constructor
	function Bounty(address _token_address) Minter(_token_address) public {}

	// send bounty to address
	function reward(address _to, uint256 _amount) public returns (bool) {
		mint(_to, _amount);
		Reward(_to, _amount);
		return true;
	}
}