# jovawallet-core-swift

SwiftPM distribution of the [jovawallet-core](https://github.com/jovachain/jovawallet-core) multi-chain signing SDK. Ships a pre-built XCFramework for iOS and macOS. The source of truth for the underlying Rust implementation is the main repo.

## Install

**Xcode:** File → Add Package Dependencies → enter `https://github.com/jovachain/jovawallet-core-swift` → set version rule to `from: "0.3.0"`.

**Package.swift:**

```swift
dependencies: [
    .package(url: "https://github.com/jovachain/jovawallet-core-swift", from: "0.3.0"),
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: [.product(name: "JovaCore", package: "jovawallet-core-swift")]
    ),
]
```

## Usage

```swift
import JovaCore

// Derive a wallet from a BIP-39 mnemonic.
let wallet = try JovaWallet(mnemonic: "your twelve word mnemonic phrase goes here ...")

// Derive a receiving address for any supported chain.
let ethAddress = try wallet.deriveAddress(chain: .ethereum, index: 0)
let btcAddress = try wallet.deriveAddress(chain: .bitcoin,  index: 0)
let solAddress = try wallet.deriveAddress(chain: .solana,   index: 0)
let xrpAddress = try wallet.deriveAddress(chain: .xrp,     index: 0)

// Sign an EVM transaction (EIP-1559).
let signed = try wallet.signTx(
    chain: .ethereum,
    index: 0,
    tx: .evm(tx: EvmUnsigned(
        chainId:              1,
        nonce:                0,
        to:                   "0xRecipient...",
        value:                "1000000000000000000",  // 1 ETH in wei
        gasLimit:             21000,
        maxFeePerGas:         "30000000000",
        maxPriorityFeePerGas: "1000000000",
        data:                 "0x",
        accessList:           []
    ))
)
print(signed.signedHex)
```

## Supported chains at v0.3.0

- Bitcoin — BIP-84 native SegWit (P2WPKH), PSBT signing, BIP-322 message signing
- EVM family — Ethereum, Polygon, BSC, Arbitrum, Optimism, Base, customEvm (EIP-1559)
- Solana — v0 versioned transactions (ed25519)
- XRP — classic address, secp256k1

## Versioning

Satellite repo tags mirror SDK tags one-for-one. `v0.3.0` here corresponds to `v0.3.0` of `jovawallet-core`.

## License

MIT. See [LICENSE](LICENSE).

## Bug reports and contributions

Please open issues and pull requests against the [main repo](https://github.com/jovachain/jovawallet-core), not this distribution repo.
