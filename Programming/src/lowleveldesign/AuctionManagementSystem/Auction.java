package lowleveldesign.AuctionManagementSystem;

import java.util.List;
import java.util.Map;

public class Auction {
    int auctionId;
    Seller seller;
    int baseBidAmt;
    int sellerMargin;
    String status;
    Map<String, String> metadata;
    List<Bid> bids;
    Bid finalBid;

    int getBenefit() {
        return finalBid.amount - (baseBidAmt*sellerMargin)/100;
    }
}
