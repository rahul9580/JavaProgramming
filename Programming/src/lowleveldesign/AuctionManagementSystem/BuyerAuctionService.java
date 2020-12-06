package lowleveldesign.AuctionManagementSystem;

public interface BuyerAuctionService {
    void makeANewBid(Auction auction, Bid bid);
    void withdrawBid(Auction auction, Bid bid);
    void updateExistingBid(Auction auction, Bid bid);
}
