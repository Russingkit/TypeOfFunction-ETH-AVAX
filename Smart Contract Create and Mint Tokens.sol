// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Importing ERC20 standard token implementation and Ownable contract from OpenZeppelin
import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

// Defining the myToken contract that inherits from ERC20 and Ownable
contract myToken is ERC20, Ownable {
    // Constructor initializes the token with a name, symbol, and initial supply
    constructor(uint256 initialSupply) ERC20("Erc20", "ETH") {
        // Mint the initial supply to the deployer of the contract
        _mint(msg.sender, initialSupply);
    }

    // Function to mint new tokens; restricted to the contract owner
    function mint(uint256 amount) public onlyOwner {
        _mint(msg.sender, amount); // Mint the specified amount to the owner's address
    }

    // Function to burn tokens from the caller's balance
    function burn(uint256 amount) public {
        require(amount > 10, "Amount should be greater than 10"); // Ensure amount is greater than 10
        require(amount <= balanceOf(msg.sender), "Insufficient balance to burn"); // Check for sufficient balance
        _burn(msg.sender, amount); // Burn the specified amount
    }

    // Overriding the default transfer function
    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), to, amount); // Execute the transfer
        return true; // Return true if the transfer succeeds
    }
}
