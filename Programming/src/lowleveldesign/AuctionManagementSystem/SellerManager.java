package lowleveldesign.AuctionManagementSystem;

import java.util.List;

public abstract class SellerManager {
    List<Seller> sellerList;
    abstract void registerSeller(Seller seller);
}
