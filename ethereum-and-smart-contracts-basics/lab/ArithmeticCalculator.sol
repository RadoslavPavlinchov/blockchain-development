// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract ArithmeticCalculator {
    int256 constant SCALING_FACTOR = 1e18;

    error CannotDivideByZero(int256 num, string message);

    function add(int256 a , int256 b) public pure returns (int256) {
        return a + b;
    }

    function subtract(int256 a, int256 b) public pure returns (int256) {
        return a - b;
    }

    function multiply(int256 a, int256 b) public pure returns (int256) {
        return a * b;
    }

    function divide(int256 a, int256 b) public pure returns (int256) {
        if (b == 0) {
            revert CannotDivideByZero(b, "Cannot divide by zero");
        }

        return a / b;
    }
}