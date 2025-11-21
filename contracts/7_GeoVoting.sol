contract GeoVoting {
    mapping(bytes32 => bool) public hasVoted; // keccak(lat,lng,addr)
    function vote(int256 lat, int256 lng, uint8 choice) external {
        bytes32 key = keccak256(abi.encode(lat, lng, msg.sender));
        require(!hasVoted[key]);
        hasVoted[key] = true;
        // émettre event
    }
}
