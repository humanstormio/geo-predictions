# geo-predictions

## ⚡ GEO-Governor: Sovereign Prediction Ledger 
A deterministic, cryptographically verifiable repository for **Topological Stability** Forecasts. This ledger serves as the primary "Proof of Work" for the **GEO-Governor Predictive Engine**, monitoring systemic entropy within global infrastructure networks.

All artifacts are independently verifiable using:

- SHA256 Content Hashing

- Bitcoin-Backed Time-Proofs (via OpenTimestamps)

- Structural Invariant Identification

A deterministic, cryptographically verifiable prediction ledger using:

* SHA256 content hashing
* OpenTimestamps (Bitcoin-backed timestamp proofs)
* Deterministic provenance manifests
* Reproducible filesystem-derived identities
* Github public commit timestamp

This repository stores prediction artifacts together with independently verifiable cryptographic proofs of existence.

---

# Repository Structure

```
.
├── predictions/
│   └── <country>/
│       └── <prediction-record>/
│           ├── prediction.md
│           ├── prediction.md.ots
│           └── proof.json
│
├── archive/
│   └── legacy prediction artifacts
│
├── scripts/
│   └── provenance-build.sh
│
├── specs/
│   └── provenance-spec-v1.md
│
├── README.md
└── what-this-is-prediction-is-not.md
```

---

# Core Design Principles

This system is designed around the following invariants:

* Prediction identity is derived from filesystem structure.
* Prediction integrity is derived from SHA256 hashes.
* Timestamp proofs are anchored to Bitcoin via OpenTimestamps.
* Provenance manifests are deterministically generated.
* Mutable verification state is never stored.

The system stores evidence, not trust assertions.

---

# Prediction Record Format

Each prediction record MUST contain:

```
prediction.md
prediction.md.ots
proof.json
```

Example:

```
predictions/ghana/2026-05-04--2026-05-07_power-grid-fracture/
```
--- 
## 🧠 The Sovereign Invariant  
This system stores **Evidence**, not **Trust Assertions.**

Unlike utility forecasting, which relies on proprietary SCADA access, the **GEO-Governor** utilizes publicly available data to identify the crossing of mathematical limits. By hashing these findings to the Bitcoin blockchain 72 hours prior to realization, we establish a **72-Hour Operation Window** for industrial and institutional protection.  

---  

## ⏱️ Precision Verification
Forecasts are identified as **verified** when the observed **Physical Fracture** Mode (Mechanical vs. Thermal) matches the deterministic ledger entry within the **90-minute Precision Window.**

# Installing OpenTimestamps

## Option 1 — Global Install (Recommended)

Install the OpenTimestamps CLI globally:

```
npm install -g ots-cli
```

Verify installation:

```
ots --version
```

---

## Option 2 — Using npx

If you prefer not to install globally:

```
npx ots-cli --version
```

You may then modify the script to replace:

```
ots
```

with:

```
npx ots-cli
```

---

# Running the Provenance Builder

## Usage

```
./scripts/provenance-build.sh <path-to-prediction.md>
```

Example:

```
./scripts/provenance-build.sh predictions/ghana/2026-05-04--2026-05-07_power-grid-fracture/prediction.md
```

---

# What the Script Does

The provenance builder performs the following deterministic pipeline:

1. Computes SHA256 hash of `prediction.md`
2. Generates or upgrades OpenTimestamps proof (`.ots`)
3. Derives deterministic prediction identity from filesystem path
4. Generates deterministic `proof.json`

Outputs:

```
prediction.md
prediction.md.ots
proof.json
```

---

# Deterministic Identity Rules

Prediction IDs are derived from relative filesystem paths.

Example:

```
predictions/ghana/2026-05-04--2026-05-07_power-grid-fracture/prediction.md
```

becomes:

```
ghana.2026-05-04--2026-05-07_power-grid-fracture
```

No machine-specific absolute paths are included.

---

# Verification

## Verify SHA256

```
sha256sum prediction.md
```

Compare the output against:

```
proof.json.sha256
```

---

## Verify OpenTimestamps Proof

```
ots verify prediction.md.ots prediction.md
```

If confirmed, OpenTimestamps will resolve the proof against a Bitcoin block.

---

# Legacy Artifacts

Older prediction files created before the deterministic ledger format are stored under:

```
archive/
```

These are preserved as historical artifacts and are not retroactively modified.

---

# Specification

Formal protocol and determinism rules are defined in:

```
specs/provenance-spec-v1.md
```

---

# Notes

* All hashes are SHA256.
* All manifests are deterministically generated.
* No mutable verification state is stored.
* Bitcoin confirmation state is derived at verification time.
* The repository is designed for reproducibility and independent verification.

---

# 🛡️ Sovereign Intelligence Advisory 
These forecasts represent the identification of mathematical limits and topological invariants. **Human Storm** operates as an infrastructure-agnostic intelligence service; we do not represent or manage utility hardware. Contents are provided for research, verification, and industrial risk-mitigation purposes.
