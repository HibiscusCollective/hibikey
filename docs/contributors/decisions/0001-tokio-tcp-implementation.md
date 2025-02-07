# **ADR-0001** Use Tokio and TCP for Initial Implementation

**Author:** Pierre Fouilloux (@pfouilloux)

![Accepted](https://img.shields.io/badge/status-accepted-green)
![Date](https://img.shields.io/badge/Date-07_Feb_2025-lightblue)

## Context and Problem Statement

We need a reliable async runtime and transport layer for device pairing.
The chosen solution must work across resource-constrained devices and desktop environments.
The solution must balance performance with embedded compatibility.

## Decision Drivers

- Async runtime ecosystem maturity
- Embedded system compatibility
- TLS readiness path
- Cross-platform support

## Considered Options

- **Tokio with TCP**
- async-std with TCP
- CoAP/UDP

## Decision Outcome

Chosen option: **Tokio with TCP**

### Positive Consequences

- Mature ecosystem with 300+ compatible crates
- Clear path to embassy-net for embedded targets
- Native TLS support through tokio-rustls
- Work-stealing scheduler optimizes multi-core use

### Negative Consequences

- Larger memory footprint than CoAP (~150KB vs 50KB)
- More complex than UDP-based solutions

## Confirmation

```rust
// Example feature flags in Cargo.toml
[features]
default = ["tokio-runtime"]
tokio-runtime = ["tokio", "tokio-native-tls"]
embedded = ["embassy-net", "heapless"]
```

## Pros and cons of the options

| Option | Pros | Cons |
|--------|-----|------|
| Tokio with TCP | Clear path to embassy-net for embedded targets | Larger memory footprint than CoAP |
| async-std with TCP | Smaller memory footprint than Tokio | More complex than UDP-based solutions |
| CoAP/UDP | Better for constrained devices | More complex than TCP-based solutions |

## More information

- [Tokio Runtime Metrics](https://tokio.rs/tokio/topics/metrics)
- [embassy-net Documentation](https://embassy.dev/embassy-net/)
