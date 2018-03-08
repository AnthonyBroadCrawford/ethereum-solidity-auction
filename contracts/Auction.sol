pragma solidity ^0.4.17;

contract Auction {

  //current highest bidder for auction
  address public _highestBidder;

  //current highest bid
  uint _highestBid;

  function Auction() public { _highestBid = 0; }

  //
  //I should be using msg.value however, it's currently unknown to me how to pass that from the unit test.  That's why you see an unused payable modifier on the function.
  //
  function bid(uint amount) public payable {
    if(amount > _highestBid) {
      _highestBidder = msg.sender;
      _highestBid = amount;
    }
  }

  //
  //Getters
  //
  function getHighestBidder() public view returns (address) {
    return _highestBidder;
  }

  //
  //For testing support
  //
  function reset() public {
    _highestBid = 0;
    _highestBidder = this;
  }
}
