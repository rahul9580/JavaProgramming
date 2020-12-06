package lowleveldesign.AuctionManagementSystem;

import java.util.Map;

public interface AuctionService {
    Auction createAuction(Seller seller, int baseBidAmount, Map<String, String> metadata);
    Bid closeAuction(Auction auction);
}
