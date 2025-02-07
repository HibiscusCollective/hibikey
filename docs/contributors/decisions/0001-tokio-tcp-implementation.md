# **ADR-0001** Use Tokio and TCP for Initial Implementation

**Authors**: Pierre Fouilloux (@pfouilloux)

![Accepted](https://img.shields.io/badge/status-accepted-darkgreen)
![Date](https://img.shields.io/badge/Date-07_Feb_2025-lightblue)

## Context and Problem Statement

The FIDO UAF authentication system requires secure device pairing capabilities that work across
a wide range of devices, from resource-constrained IoT hardware to powerful desktop systems.
The pairing process must be secure against network attacks while remaining usable on devices
with as little as 64KB RAM. We need an async runtime and transport layer that supports these
requirements while enabling future security enhancements.

## Decision Drivers

* Security: Support for TLS 1.3, secure memory handling, and attack mitigation, 
* Aim to use only components scoring high on the OpenSSF scorecard.
* Quality: Test coverage >80%, async operation latency <50ms
* Embedded: Support for no_std and <64KB RAM targets
* Ecosystem: Long-term maintenance and security updates
* Cross-platform: Mobile and desktop SDK integration

## Considered Options

* Tokio with TCP - Industry standard async runtime with TCP transport
* async-std with TCP - Lighter alternative runtime with TCP transport
* CoAP/UDP - Constrained Application Protocol over UDP

## Decision Outcome

Chosen option: "Tokio with TCP", because:
1. Provides comprehensive security features (TLS, ALPN, timeouts)
2. Maintains 90%+ test coverage across core components
3. Supports embedded via embassy-net with acceptable overhead
4. Has active security maintenance and CVE tracking

### Consequences

* Good, because security features are built-in (TLS, timeouts, backpressure)
* Good, because test coverage exceeds 80% requirement
* Good, because embassy-net enables no_std support
* Good, because tokio-rustls provides modern TLS
* Bad, because 150KB baseline exceeds some constraints
* Bad, because requires careful resource management
* Bad, because embassy-net only has a [5.8/10 on the OpenSSF security scorecard](https://deps.dev/cargo/embassy-net).

### Confirmation

Implementation verified through:
1. Security
   * Fuzzing of network handlers
   * Static analysis (MIRI, Clippy safety lints)
   * Penetration testing report

2. Quality
   * >90% test coverage (unit, integration, e2e)
   * Async operations <50ms at p99
   * All quality lints passing

3. Resource Usage
   * Embedded: <200KB total footprint
   * Desktop: <5MB with all features

```rust
// Feature flags demonstrating security and testing support
[features]
default = ["tokio-runtime", "tls"]
tokio-runtime = ["tokio", "tokio-rustls"]
embedded = ["embassy-net", "heapless"]
tls = ["rustls", "webpki-roots"]
fuzz = ["arbitrary"]
```

## Pros and Cons of the Options

### Tokio with TCP

Industry standard with security focus

* Good, because comprehensive security features
* Good, because 90%+ test coverage
* Good, because active CVE monitoring
* Good, because [8.2/10 on the OpenSSF scorecard](https://deps.dev/cargo/tokio)
* Bad, because 150KB minimum footprint
* Bad, because complex async patterns

### async-std with TCP

Simpler alternative lacking security features

* Good, because 120KB footprint
* Good, because simpler programming model
* Bad, because [4.2/10 on the OpenSSF scorecard](https://deps.dev/cargo/async-std)
* Bad, because basic TLS only
* Bad, because limited security testing

### CoAP/UDP

IoT-focused with security gaps

* Good, because 50KB footprint
* Good, because IoT-optimized
* Bad, because [4.7/10 on the OpenSSF scorecard](https://deps.dev/cargo/coap)
* Bad, because DTLS complexity
* Bad, because limited testing tools

## More Information

### Security Considerations
* TLS 1.3 support via rustls
* Regular dependency audits
* Fuzzing infrastructure included
* CVE monitoring automated

### Quality Metrics
* Test coverage: >80%
* Response time: p99 <50ms
* Memory usage: Profiled weekly
* Security scans: Daily

### Review Schedule
* Security audit: Month 3
* Performance review: Month 6
* Resource audit: Ongoing

**References:**
[1] Tokio Contributors, “GitHub - tokio-rs/tokio: a Runtime for Writing Reliable Asynchronous Applications with Rust,” GitHub, Jan. 08, 2025. https://github.com/tokio-rs/tokio (accessed Feb. 07, 2025).

[2] C. Lerche and Tokio Contributors, “Tokio - an Asynchronous Rust Runtime,” tokio.rs, 2025. https://tokio.rs/ (accessed Feb. 07, 2025).

[3] Google LLC, “Open Source Insights, tokio” Deps.dev, Jan. 08, 2025. https://deps.dev/cargo/tokio (accessed Feb. 07, 2025).

[4] Embassy, “Embassy,” Embassy, Jun. 02, 2024. https://embassy.dev/ (accessed Feb. 07, 2025).

[5] Embassy project contributors, “embassy-rs,” GitHub, Feb. 05, 2025. https://github.com/embassy-rs/ (accessed Feb. 07, 2025).

[6] Google LLC, “Open Source Insights, embassy-net” Deps.dev, Jan. 05, 2025. https://deps.dev/cargo/embassy-net (accessed Feb. 07, 2025).

[7] D. Baghdasaryan, D. Balfanz, B. Hill, J. Hodges, and K. Yang, FIDO UAF Protocol Specification v1.2.
Beaverton, Oregon, United States of America: FIDO Alliance Inc, 2020. Accessed: Feb. 05, 2025. [Online]. Available: [https://fidoalliance.org/specs/fido-uaf-v1.2-ps-20201020/fido-uaf-protocol-v1.2-ps-20201020.html](https://fidoalliance.org/specs/fido-uaf-v1.2-ps-20201020/fido-uaf-protocol-v1.2-ps-20201020.html)

[8] Google LLC, “Open Source Insights, async-std” Deps.dev, Jan. 05, 2025. https://deps.dev/cargo/async-std (accessed Feb. 07, 2025).

[9] Google LLC, “Open Source Insights, coap-rs” Deps.dev, Jan. 05, 2025. https://deps.dev/cargo/coap (accessed Feb. 07, 2025).