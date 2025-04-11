//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/UpgradeBox.s.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {BoxV1} from "../src/BoxV1.sol";

contract DeployAndUpgrateTest is Test{
DepliyBox public deployer;
UpgradeBox public upgrader;
address public owner = makeAddr("user");

address public proxy;

function setUp() public {
    deployer = new DeployBox();
    upgrader = new UpgradeBox();
    proxy = deployer.run();
}
function testUpgrade() public{
    BoxV2 boxV2 = new BoxV2();
    upgader.upgradeBox(proxy, address(boxV2));
    uint256 expectedValue = 2;
    assertEq(expectedValue, boxV2(proxy).version());
    boxV2(proxy).setNumber(7);
    assertEq(7, boxV2(proxy).getNumber());
}
}