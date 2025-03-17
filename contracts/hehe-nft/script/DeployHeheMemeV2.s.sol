// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {HeheMeme} from "../src/HeheMeme.sol";
import {console} from "forge-std/console.sol";

contract DeployHeheMemeV2 is Script {
    function run() external returns (HeheMeme) {
        string memory privateKeyStr = vm.envString("PRIVATE_KEY");
        // If using the raw key, convert it:
        bytes memory privateKeyBytes = vm.parseBytes(privateKeyStr);
        uint256 deployerPrivateKey = uint256(bytes32(privateKeyBytes));
        
        vm.startBroadcast(deployerPrivateKey);

        // Deploy HeheMeme
        HeheMeme heheMeme = new HeheMeme();
        
        vm.stopBroadcast();
        
        console.log("HeheMeme contract deployed at:", address(heheMeme));
    }
}
