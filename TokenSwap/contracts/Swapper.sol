//SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./Token.sol";

contract Swapper {
    IERC20 public tokenA;
    IERC20 public tokenB;
    IERC20 public tokenC;

    constructor() {
        tokenA = new Token("tokenA", "TKA", 1000000 * (10 ** 18), msg.sender );
        tokenB = new Token("tokenB", "TKB", 1000000 * (10 ** 18), msg.sender);
        tokenC = new Token("tokenC", "TKC", 1000000 * (10 ** 18), msg.sender);

    }


    function swap(address token_, uint256 amount) external {
        _swap(address(token_), amount);
    }

    function unswap(address token_, uint256 amount) external {
        _unswap(address(token_), amount);
    }

    function swapAforC(uint256 amount) external {
        _swap(address(tokenA), amount);
    }

    function swapBforC(uint256 amount) external {
        _swap(address(tokenB), amount);
    }

    function unswapCforA(uint256 amount) external {
        _unswap(address(tokenA), amount);

    }

    function unswapCforB(uint256 amount) external {
        _unswap(address(tokenB), amount);
    }

    function _swap(address token_, uint256 amount) private {
        require(
            (IERC20(token_).allowance(msg.sender, address(this)) >= amount),
            "amount surpass allowance"
        );
        require(
            tokenC.balanceOf(address(this)) >= amount,
            "transfer amount surpass balance"
        );
        require(
            IERC20(token_).transferFrom(msg.sender, address(this), amount),
            "Error01"
        );
        require(tokenC.transfer(msg.sender, amount), "Error01");


    }

    function _unswap(address token_, uint256 amount) private {
        require(
            (tokenC.allowance(msg.sender, address(this)) >= amount),
           "amount surpass allowance"
        );
        require(
            tokenC.balanceOf(address(this)) >= amount,
            "transfer amount surpass balance"
        );
        require(
            IERC20(token_).transferFrom(msg.sender, address(this), amount),
            "Error01"
        );
        require(tokenC.transfer(msg.sender, amount), "Error01");
    }





}
