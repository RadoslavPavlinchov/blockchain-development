// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract LoadCalculator {
    error IncorrectInterestRate(int256 rate, string message);
    error IncorrectLoanPeriod(int256 period, string message);

    function calculateTotalPayable(int256 principal, int256 rate, int256 period) public pure returns (int256) {
        if (rate < 0 || rate > 100) {
            revert IncorrectInterestRate(rate, "Rate should be between 0 and 100");
        } 

        if (period < 1) {
            revert IncorrectLoanPeriod(period, "Period should be at least 1 year.");
        }
 
        return principal + (principal * rate * period / 100);
    }
}