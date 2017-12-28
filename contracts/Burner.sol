pragma solidity ^0.4.18;

import './zepellin/ownership/Ownable.sol';
import './VICoin.sol';

/**
* @title burner of VICoin token
* base for all burners in Virtonomics world
*/
contract Burner is Ownable {

	address public token_address = address(0);
	bool public is_burn_allow = true;

	event Burn(address at, uint256 value);
	
	function Burner(address _token_address) public {
		token_address = _token_address;
	}
	
	/**
	* @dev Function to burn tokens
	* @param _at The address that will burned tokens.
	* @param _amount The amount of tokens to burn.
	* @return A boolean that indicates if the operation was successful.
	*/
	function burn(address _at, uint256 _amount) onlyOwner internal returns (bool) {
		require(is_burn_allow == true);
		VICoin token = VICoin(token_address);
		token.burn(_at, _amount);
		Burn(_at, _amount);
		return true;
	}

	/**
	* @dev stop birning tokens in derived contract
	*/
	function noMoreBurn() onlyOwner public {
		is_burn_allow = false;
	}
}
