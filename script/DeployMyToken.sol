// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {MyToken} from "../src/MyToken.sol";

/// @title DeployMyTokenScript
/// @notice This script is used for deploying the MyToken contract
/// @dev Inherits from Script in forge-std for deployment functionalities
contract DeployMyTokenScript is Script {
    /// @notice Runs the deployment script for MyToken
    /// @dev Retrieves the deployer's private key and contract owner address from environment variables.
    /// It then broadcasts the transaction to deploy MyToken and stops broadcasting after deployment.
    function run() external {
        // load variables from envinronment
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_PRIVATE_KEY");
        address contractOwner = vm.envAddress("CONTRACT_OWNER_ADDRESS");
        // deploying the contract
        vm.startBroadcast(deployerPrivateKey);
        MyToken token = new MyToken(contractOwner);
        vm.stopBroadcast();
    }
}
