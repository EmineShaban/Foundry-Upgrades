//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract BoxV2 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 internal number;

    function setNumber(uint256 _number) external onlyOwner {
        number = _number;
    }

    function internalNumber() external view returns (uint256) {
        return number;
    }
     function version() external pure returns (uint256) {
        return 2;
    }
    function getNumber() external view returns (uint256) {
        return number; 
    }
    function _authorizeUpgrade(address newImplementation) internal override  {}
}