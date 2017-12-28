pragma solidity ^0.4.18;

import './Minter.sol';

/**
* @title Crowdsale for VICoin token
*/
contract Crowdsale is Minter {

	// virts sold on presale (10**18)
	uint256 public virts_presold;
	uint256 public virts_bounty_presold;
	// virts converted while ICO is available (10**18)
	uint256 public virts_converted = 0;
	//
	// uint256 public token_bounty_presold;

	// Events:
	// when user by vicoins
	event Buy(address who, uint256 amount, uint16 usd_cents);
	// when user converts virts to vicoin
	event Convert(address who, uint256 amount, uint8 user_id);
	
	// Constructor
	function Crowdsale(address _token_address, uint256 _virts_presold, uint256 _virts_bounty_presold) Minter(_token_address) public {
		require(_virts_presold > 0);
		require(_virts_bounty_presold > 0);
		virts_presold = _virts_presold * 10**18;
		virts_bounty_presold = _virts_bounty_presold * 10**18;
	}

	// buy tokens
	function buyTokens(address _to, uint256 _amount, uint16 _usd_cents) onlyOwner public returns (bool) {
		require(_amount > 0);
		require(_usd_cents > 0);
		mint(_to, _amount);
		Buy(_to, _amount, _usd_cents);
		return true;
	}

	// convert tokens from virts
	function convertFromVirts(address _to, uint256 _amount, uint8 _user_id) onlyOwner public returns (bool) {
		// one vicoin = 100 virts
		virts_converted += 100 * _amount;
		mint(_to, _amount);
		Convert(_to, _amount, _user_id);
		return true;
	}
}