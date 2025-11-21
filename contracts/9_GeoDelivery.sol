contract GeoDelivery {
    struct Delivery {
        address courier;
        address client;
        int256 clientLat;
        int256 clientLng;
        bool delivered;
    }
    mapping(uint256 => Delivery) public deliveries;
    function confirmDelivery(uint256 id, int256 courierLat, int256 courierLng) external {
        Delivery storage d = deliveries[id];
        require(msg.sender == d.courier);
        require(distance(courierLat, courierLng, d.clientLat, d.clientLng) < 50); // 50m
        d.delivered = true;
        // libérer paiement
    }
    // distance function comme avant
}
