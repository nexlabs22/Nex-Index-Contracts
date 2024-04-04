// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../contracts/test/TestToken.sol";
contract TestTestToken{

   TestToken public testToken;
   address add1 = '0xbe4acD2cc9587CC0F2ba4E46aA2cc64E64d171d9';
   address add2 = '0xCDb062419F0eaeFD0E06d5D70BF923Ccc3111F21';

     function setUp() public {
        testToken = new TestToken('Thitha', 'THT',18, 1000);
     }

     function firstTest() public{
        assertEq(testToken.name, 'Thitha');
        assertEq(testToken.symbol, 'THT');
        assertEq(testToken.decimal, 18);
        assertEq(testToken.totalSupply, 1000 * 10 ** 18);
     }

     function testTransfer() public{
      uint256 expectedBalance = testToken.balanceOf[add1] + 10;
      testToken.transfer(add1, 10);
      assertEq(testToken.balanceOf[add1], expectedBalance);
     }

     function testApprove() {
      testToken.approve(add2, 1);
      assertEq(testToken.allowance[msg.sender][add1], 1);
     }

     function testTransferFrom(){
      uint256 expectedBalance1 = testToken.balanceOf[add1] - 5;
      uint256 expectedBalance2 = testToken.balanceOf[add2] + 5;

      testToken.approve(add1, 5);
      testToken.transferFrom(add1, add2, 5);
      assertEq(testToken.balanceOf[add1], expectedBalance1);
      assertEq(testToken.balanceOf[add2], expectedBalance2);

     }
}