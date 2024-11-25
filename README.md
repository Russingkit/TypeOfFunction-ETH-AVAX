
# myToken Smart Contract

## Overview
`myToken` is an ERC20 token built on Solidity, utilizing OpenZeppelin's ERC20 and Ownable contracts. This token allows minting, burning, and transferring functionalities with additional ownership restrictions on minting.

## Features
- **ERC20 Standard**: Implements standard ERC20 token functionalities.
- **Minting**: Token owner can mint new tokens.
- **Burning**: Users can burn tokens, subject to specific conditions.
- **Ownership Control**: Minting is restricted to the contract owner.

## Functions
### Constructor
```solidity
constructor(uint256 initialSupply)
```
- Initializes the contract with the given `initialSupply` and mints it to the deployer's address.

### Mint
```solidity
function mint(uint256 amount) public onlyOwner
```
- Mints `amount` tokens to the owner's address.
- Only callable by the contract owner.

### Burn
```solidity
function burn(uint256 amount) public
```
- Burns `amount` tokens from the caller's balance.
- Requirements:
  - `amount` must be greater than 10.
  - Caller must have sufficient balance to burn.

### Transfer
```solidity
function transfer(address to, uint256 amount) public override returns (bool)
```
- Transfers `amount` tokens from the caller to the specified `to` address.

## Deployment
1. Deploy the contract using a Solidity-compatible environment (e.g., Remix, Hardhat).
2. Provide the `initialSupply` as a parameter during deployment.

## Requirements
- **Solidity Version**: `^0.8.18`
- **Dependencies**:
  - OpenZeppelin Contracts (`@openzeppelin/contracts@4.9.0`)

## License
This project is licensed under the [Curt Russel Celeste](https://www.facebook.com/profile.php?id=10006976638a0432) License.
