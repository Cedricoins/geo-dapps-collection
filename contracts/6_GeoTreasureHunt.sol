contract GeoTreasureHunt {
    bytes32 private secretHash;
    uint256 public reward = 1 ether;
    constructor(bytes32 _hash) payable { secretHash = _hash; }
    function claim(int256 lat, int256 lng, string memory secret) external {
        require(keccak256(abi.encodePacked(secret)) == secretHash);
        require(lat == 48.8584e6 && lng == 2.2945e6); // Tour Eiffel
        payable(msg.sender).transfer(reward);
    }
}
