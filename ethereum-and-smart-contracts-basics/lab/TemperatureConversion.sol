// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract TemperatureConversion {
    enum Unit {Fahrenheit, Celsius }

    struct Conversion {
        bool exists;
        function(int256) pure internal returns (int256) func;
    }

    mapping(Unit => Conversion) internal conversions;

     constructor() {
        // Initialize the conversion mappings
        conversions[Unit.Celsius] = Conversion(true, toFahrenheit);
        conversions[Unit.Fahrenheit] = Conversion(true, toCelsius);
    }
    
    function toFahrenheit(int256 temp) pure internal returns (int256) {
        return (temp * 9) / 5 + 32;
    }

    function toCelsius(int256 temp) pure internal returns (int256) {
        return (temp - 32) * 5 / 9;
    }

    function charToUnit(string memory unitStr) internal pure returns (Unit) {
        bytes memory unitBytes = bytes(unitStr);
        require(unitBytes.length == 1, "Unit must be a single character.");

        bytes1 char = unitBytes[0];

        if (char == "C") {
            return Unit.Celsius;
        } else if (char == "F") {
            return Unit.Fahrenheit;
        } else {
            revert("Invalid unit provided.");
        }
    }

    function convertTemperature(
        int256 temperature,
        string memory fromStr
    ) public view returns (int256) {
        Unit fromUnit = charToUnit(fromStr);

        Conversion memory conversion = conversions[fromUnit];

        require(conversion.exists, "Invalid unit conversion requested.");

        return conversion.func(temperature);
    }
}