contract ProofOfLocation {
    struct Proof {
        address witness1;
        address witness2;
        int256 lat;
        int256 lng;
        uint256 timestamp;
    }
    mapping(bytes32 => Proof) public proofs;

    function submitProof(
        bytes32 hash,
        int256 lat,
        int256 lng,
        address witness1,
        address witness2
    ) external {
        require(msg.sender == witness1 || msg.sender == witness2);
        proofs[hash] = Proof(witness1, witness2, lat, lng, block.timestamp);
    }
}
