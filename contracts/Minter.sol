pragma solidity ^0.4.18;

import './zepellin/ownership/Ownable.sol';
import './IVICoin.sol';

/**
* @title minter of VICoin token
*/
contract Minter is Ownable {

	address public token_address = address(0);

	event Mint(address to, uint256 amount);
	event Burn(address at, uint256 value);
	
	function Minter(address _token_address) public {
		token_address = _token_address;
	}
	
	/**
	* @dev Function to mint tokens
	* @param _to The address that will receive the minted tokens.
	* @param _amount The amount of tokens to mint.
	* @return A boolean that indicates if the operation was successful.
	*/
	function mint(address _to, uint256 _amount) onlyOwner public returns (bool) {
		IVICoin token = IVICoin(token_address);
		bool res = token.mint(_to, _amount);
		if (res) {
			Mint(_to, _amount);
		}
	}

	/**
	* @dev Function to burn tokens
	* @param _at The address that will burned tokens.
	* @param _amount The amount of tokens to burn.
	* @return A boolean that indicates if the operation was successful.
	*/
	function burn(address _at, uint256 _amount) onlyOwner public returns (bool) {
		IVICoin token = IVICoin(token_address);
		bool res = token.burn(_at, _amount);
		if (res) {
			Burn(_at, _amount);
		}
	}
}
