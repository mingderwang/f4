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
