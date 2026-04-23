# Skill: bootstrap_ubuntu_machine

## Trigger
Use when the user has a fresh Ubuntu install or is about to install Ubuntu on a separate SSD.

## Steps
1. Verify network access first.
2. Run package index refresh.
3. Install core CLI toolchain.
4. Create workspace directories.
5. Install Docker.
6. Install Python and Node workflows.
7. Run validation checks.
8. Save artifacts.

## Required outputs
- setup transcript
- installed tools summary
- unresolved issues list

## Anti-hallucination
If Wi-Fi, GPU, or driver status is unknown, say UNKNOWN and ask for evidence from the machine.
