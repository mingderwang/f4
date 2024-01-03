## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

# Test

```shell
➜  f4 git:(main) # 1. building the project
forge build
# 2. testing example contract
forge test

[⠒] Compiling...
[⠒] Compiling 24 files with 0.8.21
[⠆] Solc 0.8.21 finished in 21.92s
Compiler run successful!
[⠆] Compiling...
No files changed, compilation skipped

Running 2 tests for test/Counter.t.sol:CounterTest
[PASS] testFuzz_SetNumber(uint256) (runs: 256, μ: 27709, ~: 28409)
[PASS] test_Increment() (gas: 28379)
Test result: ok. 2 passed; 0 failed; 0 skipped; finished in 158.30ms

Ran 1 test suites: 2 tests passed, 0 failed, 0 skipped (2 total tests)
```

## remapping

```shell
➜  f4 git:(main) forge remappings > remappings.txt

➜  f4 git:(main) ✗ cat remappings.txt
@openzeppelin/contracts/=lib/openzeppelin-contracts/contracts/
ds-test/=lib/forge-std/lib/ds-test/src/
erc4626-tests/=lib/openzeppelin-contracts/lib/erc4626-tests/
forge-std/=lib/forge-std/src/
openzeppelin-contracts/=lib/openzeppelin-contracts/
```

## forge build

```shell
➜  script git:(main) ✗ forge build
[⠔] Compiling...
[⠊] Compiling 9 files with 0.8.21
[⠆] Solc 0.8.21 finished in 7.67s
Compiler run successful!
```

## forge test

```shell
➜  f4 git:(main) ✗ forge test
[⠒] Compiling...
[⠘] Compiling 1 files with 0.8.21
[⠊] Solc 0.8.21 finished in 7.31s
Compiler run successful!

Running 1 test for test/MyToken.t.sol:MyTokenTest
[PASS] testMint() (gas: 58176)
Test result: ok. 1 passed; 0 failed; 0 skipped; finished in 33.07ms

Ran 1 test suites: 1 tests passed, 0 failed, 0 skipped (1 total tests)
```

## forge test -vvvv

```shell
➜  f4 git:(main) forge test -vvvv
[⠢] Compiling...
No files changed, compilation skipped

Running 1 test for test/MyToken.t.sol:MyTokenTest
[PASS] testMint() (gas: 58176)
Traces:
  [58176] MyTokenTest::testMint()
    ├─ [0] VM::prank(0x636C16881D405cdE477f56546825c88862be5189)
    │   └─ ← ()
    ├─ [49064] MyToken::mint(0x001C7CA24BC0B0b81b2F9Ee69dEDD76995861C39, 10000000 [1e7])
    │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: 0x001C7CA24BC0B0b81b2F9Ee69dEDD76995861C39, value: 10000000 [1e7])
    │   └─ ← ()
    ├─ [563] MyToken::balanceOf(0x001C7CA24BC0B0b81b2F9Ee69dEDD76995861C39) [staticcall]
    │   └─ ← 10000000 [1e7]
    └─ ← ()

Test result: ok. 1 passed; 0 failed; 0 skipped; finished in 3.93ms

Ran 1 test suites: 1 tests passed, 0 failed, 0 skipped (1 total tests)
```

## forge test --gas-report

```shell
➜  f4 git:(main) forge test --gas-report
[⠒] Compiling...
No files changed, compilation skipped

Running 1 test for test/MyToken.t.sol:MyTokenTest
[PASS] testMint() (gas: 58176)
Test result: ok. 1 passed; 0 failed; 0 skipped; finished in 2.48ms
| src/MyToken.sol:MyToken contract |                 |       |        |       |         |
|----------------------------------|-----------------|-------|--------|-------|---------|
| Deployment Cost                  | Deployment Size |       |        |       |         |
| 518372                           | 3007            |       |        |       |         |
| Function Name                    | min             | avg   | median | max   | # calls |
| balanceOf                        | 563             | 563   | 563    | 563   | 1       |
| mint                             | 49064           | 49064 | 49064  | 49064 | 1       |




Ran 1 test suites: 1 tests passed, 0 failed, 0 skipped (1 total tests)
➜  f4 git:(main)
```

## anvil

```shell
➜  f4 git:(main) ✗ anvil


                             _   _
                            (_) | |
      __ _   _ __   __   __  _  | |
     / _` | | '_ \  \ \ / / | | | |
    | (_| | | | | |  \ V /  | | | |
     \__,_| |_| |_|   \_/   |_| |_|

    0.2.0 (619f3c5 2023-10-20T00:22:09.997951000Z)
    https://github.com/foundry-rs/foundry

Available Accounts
==================

(0) "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266" (10000.000000000000000000 ETH)
(1) "0x70997970C51812dc3A010C7d01b50e0d17dc79C8" (10000.000000000000000000 ETH)
(2) "0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC" (10000.000000000000000000 ETH)
(3) "0x90F79bf6EB2c4f870365E785982E1f101E93b906" (10000.000000000000000000 ETH)
(4) "0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65" (10000.000000000000000000 ETH)
(5) "0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc" (10000.000000000000000000 ETH)
(6) "0x976EA74026E726554dB657fA54763abd0C3a0aa9" (10000.000000000000000000 ETH)
(7) "0x14dC79964da2C08b23698B3D3cc7Ca32193d9955" (10000.000000000000000000 ETH)
(8) "0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f" (10000.000000000000000000 ETH)
(9) "0xa0Ee7A142d267C1f36714E4a8F75612F20a79720" (10000.000000000000000000 ETH)

Private Keys
==================

(0) 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
(1) 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d
(2) 0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a
(3) 0x7c852118294e51e653712a81e05800f419141751be58f605c371e15141b007a6
(4) 0x47e179ec197488593b187f80a00eb0da91f1b9d0b13f8733639f19c30a34926a
(5) 0x8b3a350cf5c34c9194ca85829a2df0ec3153be0318b5e2d3348e872092edffba
(6) 0x92db14e403b83dfe3df233f83dfa3a0d7096f21ca9b0d6d6b8d88b2b4ec1564e
(7) 0x4bbbf85ce3377467afe5d46f804f221813b2bb87f24d81f60f1fcdbf7cbf4356
(8) 0xdbda1821b80551c9d65939329250298aa3472ba22feea921c0cf5d620ea67b97
(9) 0x2a871d0798f97d79848a013d4936a73bf4cc922c825d33c1cf7073dff6d409c6

Wallet
==================
Mnemonic:          test test test test test test test test test test test junk
Derivation path:   m/44'/60'/0'/0/


Chain ID
==================

31337

Base Fee
==================

1000000000

Gas Limit
==================

30000000

Genesis Timestamp
==================

1704288656

Listening on 127.0.0.1:8545
```

## deployment

```shell
➜  f4 git:(main) forge script script/DeployMyToken.sol:DeployMyTokenScript --rpc-url $SEPOLIA_URL --broadcast --verify -vvvv
[⠔] Compiling...
No files changed, compilation skipped
Traces:
  [576327] DeployMyTokenScript::run()
    ├─ [0] VM::envUint(DEPLOYER_PRIVATE_KEY) [staticcall]
    │   └─ ← <env var value>
    ├─ [0] VM::envAddress(CONTRACT_OWNER_ADDRESS) [staticcall]
    │   └─ ← <env var value>
    ├─ [0] VM::startBroadcast(<pk>)
    │   └─ ← ()
    ├─ [518372] → new MyToken@0xd7C8d8a67288dF71140Fed5dEFEB9a2cab21645F
    │   ├─ emit OwnershipTransferred(previousOwner: 0x0000000000000000000000000000000000000000, newOwner: 0xEd588bce2d3a2Fd4681258417Df2eB31149cb879)
    │   └─ ← 2244 bytes of code
    ├─ [0] VM::stopBroadcast()
    │   └─ ← ()
    └─ ← ()


Script ran successfully.

## Setting up (1) EVMs.
==========================
Simulated On-chain Traces:

  [617844] → new MyToken@0xd7C8d8a67288dF71140Fed5dEFEB9a2cab21645F
    ├─ emit OwnershipTransferred(previousOwner: 0x0000000000000000000000000000000000000000, newOwner: 0xEd588bce2d3a2Fd4681258417Df2eB31149cb879)
    └─ ← 2244 bytes of code


==========================

Chain 11155111

Estimated gas price: 127.324994017 gwei

Estimated total gas used for script: 803197

Estimated amount required: 0.102267053219472349 ETH

==========================

###
Finding wallets for all the necessary addresses...
##
Sending transactions [0 - 0].
⠁ [00:00:00] [##########################################################################] 1/1 txes (0.0s)
Transactions saved to: /private/tmp/f4/broadcast/DeployMyToken.sol/11155111/run-latest.json

Sensitive values saved to: /private/tmp/f4/cache/DeployMyToken.sol/11155111/run-latest.json

##
Waiting for receipts.
⠉ [00:00:20] [######################################################################] 1/1 receipts (0.0s)
##### sepolia
✅  [Success]Hash: 0xa7d5c20213d59640752b70e3a1034fd50bb6a0a90d711c9a77d3f8fdfc98b0ef
Contract Address: 0xd7C8d8a67288dF71140Fed5dEFEB9a2cab21645F
Block: 5014077
Paid: 0.048100354110180384 ETH (618032 gas * 77.828258262 gwei)


Transactions saved to: /private/tmp/f4/broadcast/DeployMyToken.sol/11155111/run-latest.json

Sensitive values saved to: /private/tmp/f4/cache/DeployMyToken.sol/11155111/run-latest.json



==========================

ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.
Total Paid: 0.048100354110180384 ETH (618032 gas * avg 77.828258262 gwei)
##
Start verification for (1) contracts
Start verifying contract `0xd7C8d8a67288dF71140Fed5dEFEB9a2cab21645F` deployed on sepolia

Submitting verification for [src/MyToken.sol:MyToken] "0xd7C8d8a67288dF71140Fed5dEFEB9a2cab21645F".
Submitted contract for verification:
	Response: `OK`
	GUID: `vscajfatxumxfwefw6bwtnprsepyv3rhhp3wcru3bq9vqcucfp`
	URL:
        https://sepolia.etherscan.io/address/0xd7c8d8a67288df71140fed5defeb9a2cab21645f
Contract verification status:
Response: `NOTOK`
Details: `Pending in queue`
Contract verification status:
Response: `OK`
Details: `Pass - Verified`
Contract successfully verified
All (1) contracts were verified!

Transactions saved to: /private/tmp/f4/broadcast/DeployMyToken.sol/11155111/run-latest.json

Sensitive values saved to: /private/tmp/f4/cache/DeployMyToken.sol/11155111/run-latest.json

➜  f4 git:(main)
```
