pragma solidity ^0.4.18;

/**
 * @title VICoin interface
 * Using for call mint and burh methods from other available contracts
 */
contract IVICoin {
	function mint(address _to, uint256 _amount) public returns (bool);	
	function burn(address _at, uint256 _amount) public returns (bool);
}
