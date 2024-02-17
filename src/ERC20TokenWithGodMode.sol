// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/// @author kovalgek
contract ERC20TokenWithGodMode is ERC20, Ownable {

    constructor(string memory name, string memory symbol) ERC20(name, symbol) Ownable(msg.sender) {}

    /// @notice Mints tokens
    /// @param account an address tokens minted for
    /// @param value amount of minted tokens
    function mint(address account, uint256 value) external onlyOwner {
        _mint(account, value);
    }

    /// @notice Burns tokens
    /// @param account an address tokens burned for
    /// @param value amount of burned tokens
    function burn(address account, uint256 value) external onlyOwner {
        _burn(account, value);
    }

    /// @notice Moves a `value` amount of tokens from `from` to `to` not using the allowance mechanism.
    /// @param from an address tokens moves from
    /// @param to an address tokens moves to
    /// @param value amount of moved tokens
    function godTransferFrom(address from, address to, uint256 value) external onlyOwner {
        _transfer(from, to, value);
    }
}
