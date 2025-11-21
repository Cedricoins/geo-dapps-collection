contract GeoInsurance {
    mapping(address => bool) public claimed;
    function claimIfInDisasterZone(int256 lat, int256 lng) external {
        require(isInHurricaneZone(lat, lng));
        require(!claimed[msg.sender]);
        claimed[msg.sender] = true;
        payable(msg.sender).transfer(10 ether);
    }
    function isInHurricaneZone(int256 lat, int256 lng) internal pure returns (bool) {
        return (lat > 20e6 && lat < 30e6 && lng > -90e6 && lng < -80e6);
    }
}
