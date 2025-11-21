contract GeoCarbonCredit {
    mapping(address => uint256) public credits;
    function logEcoTrip(int256 startLat, int256 startLng, int256 endLat, int256 endLng) external {
        uint256 dist = approximateDistance(startLat, startLng, endLat, endLng);
        if (dist > 1000) { // >1km
            credits[msg.sender] += dist / 1000; // 1 crédit par km
        }
    }
    // approximateDistance comme avant
}
