# **ADR-0005** Task Runner and Dev Tools Selection

**Authors**: Pierre Fouilloux (@pfouilloux)

![Accepted](https://img.shields.io/badge/status-accepted-darkgreen) ![Date](https://img.shields.io/badge/Date-07_Feb_2025-lightblue)

## Context and Problem Statement

The project needs a unified way to manage development tools, environment variables, and task automation across different platforms and languages (Rust, Go). We need a solution that supports both local development and CI/CD pipelines while maintaining consistent tool versions and configurations.

## Considered Options

* mise (mise.jdx.dev)
* asdf
* direnv + make
* Custom shell scripts

## Decision Outcome

Chosen option: "mise", because it provides cross-platform task running, environment management, and tool version control in a single, maintainable solution.

### Consequences

* Good, because provides unified task running across Go and Rust components
* Good, because enables declarative tool version management
* Good, because supports both local development and CI/CD
* Good, because integrates well with lefthook for git hooks
* Bad, because it is not supported by dependabot
* Bad, because adds another dependency to the project
* Bad, because requires learning a new tool for contributors
