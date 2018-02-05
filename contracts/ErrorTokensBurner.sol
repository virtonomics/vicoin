pragma solidity ^0.4.18;

import './Burner.sol';

/**
* @title Bounty reward minter
*/
contract ErrorTokensBurner is Burner {
	
	// Events:
	// when user rewarded
	event BurnOnError(address who, uint256 amount);
	
	// Constructor
	function ErrorTokensBurner(address _token_address) Burner(_token_address) public {}

	// vurn tokens at address
	function burnOnError(address _to, uint256 _amount) public returns (bool) {
		burn(_to, _amount);
		BurnOnError(_to, _amount);
		return true;
	}
}