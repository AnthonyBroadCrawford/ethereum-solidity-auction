pragma solidity ^0.4.17;

contract Auction {

  //current highest bidder for auction
  address public _highestBidder;

  //current highest bid
  uint _highestBid;

  function Auction() public { _highestBid = 0; }

  function bid(address bidder) public payable {
    if(msg.value > _highestBid){
      _highestBidder = bidder;
      _highestBid = msg.value;
    }
  }

  //
  //Getters
  //
  function getHighestBidder() public view returns (address) {
    return _highestBidder;
  }
}
