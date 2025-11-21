// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 1_GeoCheckIn.sol - Check-in simple avec coordonnées GPS
contract GeoCheckIn {
    event CheckIn(address indexed user, int256 lat, int256 lng, uint256 timestamp);

    function checkIn(int256 latitude, int256 longitude) external {
        require(latitude >= -90e6 && latitude <= 90e6, "Invalid lat");
        require(longitude >= -180e6 && longitude <= 180e6, "Invalid lng");
        emit CheckIn(msg.sender, latitude, longitude, block.timestamp);
    }
}
