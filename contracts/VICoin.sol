pragma solidity ^0.4.18;

import './zepellin/token/StandardToken.sol';
import './zepellin/ownership/Ownable.sol';
import './RestrictedCaller.sol';
import './IVICoin.sol';

/**
* @title VICoin token
*/
contract VICoin is IVICoin, StandardToken, RestrictedCaller {

	string public constant name = "Virtonomics Token - VICoin";
	string public constant symbol = "VIC";
	uint8 public constant decimals = 18;

	event Mint(address to, uint256 amount);
	event Burn(address at, uint256 value);

	/**
	* @dev Function to mint tokens
	* @param _to The address that will receive the minted tokens.
	* @param _amount The amount of tokens to mint.
	* @return A boolean that indicates if the operation was successful.
	*/
	function mint(address _to, uint256 _amount) onlyAvailableCaller public returns (bool) {
		totalSupply = totalSupply.add(_amount);
		balances[_to] = balances[_to].add(_amount);
		Mint(_to, _amount);
		Transfer(msg.sender, _to, _amount);
		return true;
	}

	/**
	* @dev Function to burn tokens
	* @param _at The address that will burned tokens.
	* @param _amount The amount of tokens to burn.
	* @return A boolean that indicates if the operation was successful.
	*/
	function burn(address _at, uint256 _amount) onlyAvailableCaller public returns (bool) {
		require(_amount <= balances[_at]);
		totalSupply = totalSupply.sub(_amount);
		balances[_at] = balances[_at].sub(_amount);
		Burn(_at, _amount);
		Transfer(_at, msg.sender, _amount);
		return true;
	}
}