pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Auction.sol";


contract Bidder {
  Auction _auction;

  function Bidder(Auction auction) public { _auction = auction; }

  function bid(uint amount) public {
    _auction.bid(amount);
  }
}

contract JaneDoe is Bidder { }
contract JonDoe is Bidder { }

contract TestAuction{
  Auction auction = Auction(DeployedAddresses.Auction());

  //Reset highest bid and highest bidder so tests can operate automically.  Blazing that local host Eth via gas
  function beforeEach() public {
    auction.reset();
  }

  function testHighestBidderIsRecorded() public {

    //Instantiate Bidders to obtain unique address for each contract on the Blockchain
    JonDoe jon = JonDoe(auction);
    JaneDoe jane = JaneDoe(auction);

    jon.bid(10);
    jane.bid(15);

    address expected = jane;
    address actual = auction.getHighestBidder();

    Assert.equal(expected, actual, "Should record the highgest bidder");
  }
}
