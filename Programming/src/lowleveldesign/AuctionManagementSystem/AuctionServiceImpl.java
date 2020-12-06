package lowleveldesign.AuctionManagementSystem;

import java.util.Map;

public class AuctionServiceImpl implements AuctionService {

    @Override
    public Auction createAuction(Seller seller, int baseBidAmount, Map<String, String> metadata) {
        return null;
        // check is registered seller
        // Create new auction
    }

    @Override
    public Bid closeAuction(Auction auction) {
        // status check it should be active
        // update final bid
        // update seller benefit
        return null;
    }
}
