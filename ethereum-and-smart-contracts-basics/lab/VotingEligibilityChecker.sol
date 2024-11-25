// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract VotingEligibilityChecker {
    error NotEligible(uint256 age, string message);

    function checkEligibility(uint256 age) public pure returns (bool){
        uint256 minAge = 18;

        if (age < minAge) {
            revert NotEligible(age, "Citizen too young to vote");
        }

        return true;
    }
}