package lowleveldesign.AuctionManagementSystem;

public class SellerAuctionServiceImpl extends SellerManager implements SellerAuctionService {

    void registerSeller(Seller seller) {}

    @Override
    public void updateSellerBenefit(Seller seller, int benefitAmount) {
        seller.sellerBenefitAmount += benefitAmount;
    }

}
