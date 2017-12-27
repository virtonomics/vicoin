pragma solidity ^0.4.18;

import './zepellin/ownership/Ownable.sol';
import './VICoin.sol';
import './zepellin/math/SafeMath.sol';

/**
* @title minter of VICoin token
* base for all minters in Virtonomics world
*/
contract Minter is Ownable {
	using SafeMath for uint256;

	address public token_address = address(0);
	bool public is_mint_allow = true;
	uint256 public total;

	function Minter(address _token_address) public {
		token_address = _token_address;
	}
	
	/**
	* @dev Function to mint tokens
	* @param _to The address that will receive the minted tokens.
	* @param _amount The amount of tokens to mint.
	* @return A boolean that indicates if the operation was successful.
	*/
	function mint(address _to, uint256 _amount) onlyOwner internal returns (bool) {
		require(is_mint_allow == true);
		VICoin token = VICoin(token_address);
		token.mint(_to, _amount);
		total = total.add(_amount);
		return true;
	}

	/**
	* @dev stop minting tokens in derived contract
	*/
	function noMoreMint() onlyOwner public {
		is_mint_allow = false;
	}
}
