// 2_GeoNFT.sol - Mint NFT seulement si tu es dans une zone définie
contract GeoNFT {
    uint256 public tokenId;
    mapping(uint256 => string) public tokenURI;
    mapping(address => bool) public hasMinted;
    int256 public constant LAT_PARIS = 48.8566e6;
    int256 public constant LNG_PARIS = 2.3522e6;
    uint256 public constant RADIUS = 10_000; // 10km en mètres

    event Minted(address to, uint256 tokenId);

    function distance(int256 lat1, int256 lng1, int256 lat2, int256 lng2) internal pure returns (uint256) {
        // Approximation distance en mètres (formule haversine simplifiée)
        int256 dLat = lat2 - lat1;
        int256 dLng = lng2 - lng1;
        return uint256(sqrt((dLat * dLat + dLng * dLng) * 1e12)); // très approximatif mais suffisant
    }

    function sqrt(uint256 x) internal pure returns (uint256) {
        uint256 z = (x + 1) / 2;
        uint256 y = x;
        while (z < y) { y = z; z = (x / z + z) / 2; }
        return y;
    }

    function mintIfInParis(int256 lat, int256 lng) external {
      require(!hasMinted[msg.sender], "Already minted");
        require(distance(lat, lng, LAT_PARIS, LNG_PARIS) <= RADIUS, "Not in Paris zone");
        tokenId++;
        tokenURI[tokenId] = "ipfs://ParisNFT";
        hasMinted[msg.sender] = true;
        emit Minted(msg.sender, tokenId);
    }
}
