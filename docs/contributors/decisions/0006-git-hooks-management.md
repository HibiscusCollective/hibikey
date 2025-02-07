# **ADR-0006** Git Hooks Management

**Authors**: Pierre Fouilloux (@pfouilloux)

![Accepted](https://img.shields.io/badge/status-accepted-darkgreen) ![Date](https://img.shields.io/badge/Date-07_Feb_2025-lightblue)

## Context and Problem Statement

The project needs consistent git hooks across all developers to ensure code quality, run linters, and maintain consistent formatting. The solution must work across different platforms, support multiple languages (Rust, Go), and integrate with our task runner.

## Considered Options

* lefthook
* husky
* pre-commit
* Custom git hooks

## Decision Outcome

Chosen option: "lefthook", because it provides cross-platform git hooks management with parallel execution support and integrates well with our mise task runner.

### Consequences

* Good, because enables parallel execution of hooks for better performance
* Good, because supports both Go and Rust toolchains
* Good, because configuration is in YAML for better readability
* Good, because integrates with mise for tool version management
* Bad, because requires installation on developer machines
* Bad, because adds complexity to the git workflow
