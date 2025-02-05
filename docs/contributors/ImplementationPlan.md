# Hibikey Implementation Plan

## Technology Stack

### Desktop Components

| Component         | Technology   | License     | Purpose                          |
|-------------------|--------------|-------------|----------------------------------|
| Core Language     | Go (Latest)  | BSD-3       | Backend services                 |
| CLI Framework     | Cobra        | Apache 2.0  | Command-line interface           |
| GUI Framework     | Wails        | MIT         | Desktop frontend                 |
| BLE Communication | TinyGo bluetooth      | BSD-3       | Linux Bluetooth stack            |
| Config Management | Viper        | Apache 2.0  | YAML/JSON config handling        |
| Packaging         | nfpm         | MIT         | .deb/RPM creation                |

### Mobile Components

| Component         | Technology           | License     | Purpose                          |
|-------------------|----------------------|-------------|----------------------------------|
| Language          | Kotlin 1.9+         | Apache 2.0  | Android native development       |
| BLE Stack         | Kable                | Apache 2.0  | Bluetooth communication          |
| Biometrics        | AndroidX Biometric   | Apache 2.0  | Fingerprint authentication       |
| Security          | Android Keystore     | Apache 2.0  | Hardware-backed key storage      |

---

## Milestone Roadmap

### Milestone 0: Proof of Concept

- CLI Scaffolding
- TCP Auth Server
- FIDO2 Key Generation
- TCP Challenge Client

### Milestone 1: MVP

- Desktop GUI with pairing workflow
- BLE integration for Linux (BlueZ)
- .deb and RPM packages
- Basic PAM module

### Milestone 2: Beta

- Windows BLE support via WinRT
- Audit logging subsystem
- Developer documentation

### Milestone 3: 1.0 Release

- Security audit completion
- Production-ready packaging
- User documentation portal
- Community governance model

## Key user stories

### Milestone 0: PoC

#### As a user, I can start a desktop listener and pair with a mobile device using the command line

- [[RelyLib] Initiation side of the pairing flow](https://github.com/HibiscusCollective/hibikey/issues/13)
- [[AuthLib] Response side of the pairing flow](https://github.com/HibiscusCollective/hibikey/issues/14)
- [[CLI] Serve command to start a local server](https://github.com/HibiscusCollective/hibikey/issues/15)
- [[CLI] Pair command to start a pairing session with a mobile device](https://github.com/HibiscusCollective/hibikey/issues/16)
- [[APP] Mobile app that can pair with the local server](https://github.com/HibiscusCollective/hibikey/issues/17)

#### As a developer, I can test FIDO challenges over a TCP connection on the local network

- [[RelyLib] Request registration of authenticators](https://github.com/HibiscusCollective/hibikey/issues/18)
- [[AuthLib] Return proof of possession and new key](https://github.com/HibiscusCollective/hibikey/issues/19)
- [[RelyLib] Request authentication of a user](https://github.com/HibiscusCollective/hibikey/issues/20)
- [[AuthLib] Return proof of authentication](https://github.com/HibiscusCollective/hibikey/issues/21)

### Milestone 1: MVP

#### As a user, I can authenticate via Bluetooth

- Set up bluetooth pairing flow

#### As a user, I can log in via Hibikey instead of a password

- Finalise the CLI
- Implement PAM authentication module

#### As a user, I can report issues, ask for help and report security vulnerabilities

- Set up community communications channels.
- Set up issue templates, discussion templates, etc.
- Write up a community code of conduct.

#### As a developer, I can contribute to the project

- Write contribution guidelines, contributor agreements, code of conduct,
and developer docs.
- Set up automated checks on pull requests, pre-commit hooks, and CI.

### Milestone 2: Beta

#### As an admin, I can view auth logs for auditing

- Set up audit logging subsystem on the desktop side.

#### As a user, I can set up authentication using a simple GUI

- Set up the GUI
- Set up basic packaging and release mechanism

#### As a user, I can find documentation for the project

- Set up a documentation portal.
- Document how to install the desktop app and mobile app.
- Document the main flows and configuration options.

#### As a maintainer, I can distribute the project via reputable channels

- Set up deb/rpm packaging.
- Set up flatpack packaging.
- Set up Play store releases.
- Investigate and set up releases for GrapheneOS and other open OSes.

### Milestone 3: 1.0 Release

#### As a user, I can be confident the project is secure

- Set up security audits.
- Set up security testing.
- Set up security monitoring.
- Write up security policy

#### As a maintainer, I want to get FIDO certified

- Perform the self auditing and self-reporting activities required
- Investigate how to raise the funds for certification and/or reach out to the FIDO alliance to see what we can do.

#### As a maintainer, I want to get feedback from users and plan for the future

- Set up user feedback and testing.
- Set up community governance model.
- Plan the next major release.

## References

[1] D. Baghdasaryan, D. Balfanz, B. Hill, J. Hodges, and K. Yang, FIDO UAF Protocol Specification v1.2.
Beaverton, Oregon, United States of America: FIDO Alliance Inc, 2020. Accessed: Feb. 05, 2025. [Online]. Available: [https://fidoalliance.org/specs/fido-uaf-v1.2-ps-20201020/fido-uaf-protocol-v1.2-ps-20201020.html](https://fidoalliance.org/specs/fido-uaf-v1.2-ps-20201020/fido-uaf-protocol-v1.2-ps-20201020.html)
