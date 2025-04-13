 //SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/UpgradeBox.s.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {BoxV1} from "../src/BoxV1.sol";

contract DeployAndUpgrateTest is Test{
DeployBox public deployer;
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
    upgrader.upgradeBox(proxy, address(boxV2));
    uint256 expectedValue = 2;
    assertEq(expectedValue, BoxV2(proxy).version());
    // BoxV2(proxy).setNumber(7);
    // assertEq(7, BoxV2(proxy).getNumber());
}

    function testDeploymentIsV1() public {
        address proxyAddress = deployer.deployBox();
        uint256 expectedValue = 7;
        vm.expectRevert();
        BoxV2(proxyAddress).setNumber(expectedValue);
    }

}


