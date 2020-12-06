package lowleveldesign.AuctionManagementSystem;

public class BuyerAuctionServiceImpl extends BuyerManager implements BuyerAuctionService {

    @Override
    public void makeANewBid(Auction auction, Bid bid) {
        // Check is auction active
        // is registered buyer
        // delete bid object from auction's bid list
    }

    @Override
    public void withdrawBid(Auction auction, Bid bid) {
        // Check is auction active
        // is this buyer made a bid earlier in this auction
        // delete bid object from auction's bid list
    }

    @Override
    public void updateExistingBid(Auction auction, Bid bid) {
        // Check is auction active
        // is this buyer made a bid earlier in this auction

        // Update bid object in auction's bid list
    }
}
