pragma solidity ^0.4.18;

import './zepellin/ownership/Ownable.sol';

/**
 * @title RestrictedCaller
 * @dev storage of callers who available to call some methods of contracts
 */
contract RestrictedCaller is Ownable {

	mapping(address => address) public callers;

	event callerAdded(address caller);

	/**
	* @dev Throws if called by any account other than the caller.
	*/
	modifier onlyAvailableCaller() {
		require(callers[msg.sender] != address(0));
		_;
	}

	/**
	* @dev add new caller for call methods permissions.
	* @param _address The address to transfer permissions to call to.
	*/
	function callerAdd(address _address) public onlyOwner {
		require(_address != address(0));
		require(callers[msg.sender] == address(0)); // duplicate
		callers[_address] = _address;
	}

	/**
	* @dev delete caller for call methods permissions.
	* @param _address The address to del caller.
	*/
	function callerDel(address _address) public onlyOwner {
		require(_address != address(0));
		require(callers[msg.sender] == address(0)); // not exists
		delete callers[_address];
	}
}
