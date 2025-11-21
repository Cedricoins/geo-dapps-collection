contract GeoDistanceBet {
    struct Bet {
        address player;
        int256 startLat;
        int256 startLng;
        uint256 startTime;
        uint256 distanceTarget; // en mètres
        bool claimed;
    }
    mapping(address => Bet) public bets;
    uint256 public constant ENTRY_FEE = 0.01 ether;

    function startBet(int256 lat, int256 lng, uint256 targetMeters) external payable {
        require(msg.value == ENTRY_FEE);
        bets[msg.sender] = Bet(msg.sender, lat, lng, block.timestamp, targetMeters, false);
    }

    function claimReward(int256 endLat, int256 endLng) external {
        Bet storage bet = bets[msg.sender];
        require(!bet.claimed);
        uint256 dist = approximateDistance(bet.startLat, bet.startLng, endLat, endLng);
        require(dist >= bet.distanceTarget, "Not enough distance");
        bet.claimed = true;
        payable(msg.sender).transfer(ENTRY_FEE * 2); // double ou rien
    }

    function approximateDistance(int256 lat1, int256 lng1, int256 lat2, int256 lng2) internal pure returns (uint256) {
        int256 dLat = lat2 - lat1;
        int256 dLng = lng2 - lng1;
        return uint256((abs(dLat) + abs(dLng)) * 111000); // très approximatif
    }function abs(int256 x) internal pure returns (int256) {
        return x >= 0 ? x : -x;
    }
}
