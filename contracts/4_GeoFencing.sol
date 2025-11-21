contract GeoFencing {
    mapping(address => bool) public authorized;
    int256[2][] public allowedZones; // [lat, lng, radius]

    constructor() {
        allowedZones.push([48.8566e6, 2.3522e6, 5000]); // Paris 5km
    }

    function enterZone(int256 lat, int256 lng) external {
        for (uint i = 0; i < allowedZones.length; i++) {
            if (distance(lat, lng, allowedZones[i][0], allowedZones[i][1]) <= allowedZones[i][2]) {
                authorized[msg.sender] = true;
                return;
            }
        }
        revert("Outside allowed zones");
    }

    function distance(int256 lat1, int256 lng1, int256 lat2, int256 lng2) internal pure returns (uint256) {
        int256 dLat = lat2 - lat1;
        int256 dLng = lng2 - lng1;
        return uint256(sqrt((dLat * dLat + dLng * dLng) * 1e12));
    }

    function sqrt(uint256 x) internal pure returns (uint256 y) {
        // même fonction que plus haut
        uint256 z = (x + 1) / 2;
        y = x;
        while (z < y) { y = z; z = (x / z + z) / 2; }
    }
}
