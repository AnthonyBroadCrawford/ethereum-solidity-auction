pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Auction.sol";

contract TestAuction{
  Auction auction = Auction(DeployedAddresses.Auction());

  function testHighestBidderIsRecorded() public {
    address lowerBidderJonDoe = 0xe0F5206Bbd039e7B0592D8918820024E2A7487B9;
    address higherBidderJaneDoe = 0xe0F5206BbD039E7B0592d8918820024E877437b9;

    auction.bid(lowerBidderJonDoe, 10);
    auction.bid(higherBidderJaneDoe, 100);

    address expected = 0xe0F5206BbD039E7B0592d8918820024E877437b9;
    address actual = auction.getHighestBidder();

    Assert.equal(expected, actual, "Should record the highgest bidder");
  }
}
