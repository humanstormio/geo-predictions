# Verification Guide

## Purpose

This document explains how independent parties can verify:

* repository publication history
* prediction integrity
* OpenTimestamps proofs
* Bitcoin-anchored timestamp evidence

The most core verification is the date of the prediction was before the event.

---

# Verification Models

This repository supports two independent verification mechanisms:

1. Git/GitHub publication history
2. OpenTimestamps Bitcoin anchoring

These systems complement one another but provide different guarantees.

---

# 1. GitHub Verification

Git commits provide public historical evidence that a prediction file existed at or before a given commit timestamp.

## Verify commit history

Example:

```
git log -- predictions/ghana/2026-05-04--2026-05-07_power-grid-fracture/prediction.md
```

This shows:

* commit chronology
* commit hashes
* commit timestamps
* historical modifications

## Verify repository integrity

Clone the repository directly:

```
git clone <repo-url>
```

Git itself provides integrity verification through commit hashes and Merkle-linked history.

---

# Important Note About GitHub Timestamps

GitHub timestamps are platform-based publication evidence.

They are useful for:

* public visibility
* historical transparency
* distributed replication

However, GitHub timestamps are NOT equivalent to decentralized cryptographic timestamp proofs.

---

# 2. OpenTimestamps Verification

OpenTimestamps provides decentralized timestamp proofs anchored into the Bitcoin blockchain.

## Verify file integrity

Compute SHA256:

```
sha256sum prediction.md
```

Compare against:

```
proof.json.sha256
```

---

## Verify OpenTimestamps proof

Run:

```
ots verify prediction.md.ots prediction.md
```

If confirmed, OpenTimestamps resolves the proof against a Bitcoin block.

---

# Understanding OpenTimestamps

OpenTimestamps proves:

```
"This exact file hash existed before a certain Bitcoin block."
```

It does NOT prove:

* authorship
* originality
* truthfulness of predictions

It proves timestamped existence only.

---

# Why Both Systems Are Used

GitHub provides:

* public publication evidence
* replication
* transparent history

Bitcoin/OpenTimestamps provides:

* decentralized timestamp anchoring
* cryptographic existence proofs
* blockchain-backed temporal evidence

Using both systems creates layered provenance.

---

# Reproducibility

All proof artifacts are deterministically generated according to:

```
specs/provenance-spec-v1.md
```

Independent implementations should produce identical:

* IDs
* SHA256 hashes
* proof manifests

given identical repository contents.

---

# Core Verification Invariant

```
hash(file) ↔ OTS proof ↔ Bitcoin timestamp
```

and:

```
Git commit history ↔ public publication chronology
```

