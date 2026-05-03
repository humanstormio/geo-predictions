# Provable Provenance Specification v1.0

## 0. System definition

This system defines a deterministic method for generating:

- a file identity (`id`)
- a cryptographic digest (`sha256`)
- a Bitcoin-anchored timestamp proof (`.ots`)
- a structured manifest (`proof.json`)

from a filesystem-based prediction record.

---

## 1. Input definition

A Prediction Record is defined as:

A directory containing exactly one file named:

```

prediction.md

```

Path example:

```

predictions/<country>/<domain>/<date>/<label>/prediction.md

```

---

## 2. Identity (ID) rule

### 2.1 Definition

The `id` is derived from the file’s relative path within the repository.

### 2.2 Computation

Given:

```

predictions/ghana/election/2026-05-02/incumbent/prediction.md

```

Step 1 — remove filename:

```

predictions/ghana/election/2026-05-02/incumbent/

```

Step 2 — remove leading `predictions/`:

```

ghana/election/2026-05-02/incumbent

```

Step 3 — replace `/` with `.`:

```

ghana.election.2026-05-02.incumbent

```

### 2.3 Final rule

```

id = normalized_relative_path_without_filename

```

---

## 3. File hash rule

### Definition

SHA256 is computed from raw file bytes.

### Rule

```

sha256 = SHA256(prediction.md bytes)

```

No normalization or transformation is applied.

---

## 4. OpenTimestamps rule

### Creation

Each `prediction.md` is stamped using OpenTimestamps:

```

prediction.md.ots

```

### Verification

```

ots verify prediction.md.ots prediction.md

```

This yields Bitcoin-anchored proof of existence.

---

## 5. Proof manifest (proof.json)

### Required fields

- id
- path
- file
- sha256
- ots_file

### Field order (mandatory)

```

id → path → file → sha256 → ots_file

```

### Format rules

- UTF-8 encoding
- LF line endings
- deterministic field order
- no trailing commas

---

## 6. Explicit exclusions

The following are NOT stored:

- bitcoin_block
- timestamp_status
- derived verification state

These are computed at verification time.

---

## 7. Determinism rules

The system is deterministic if:

- directory traversal is lexicographically sorted
- field order is fixed
- file bytes are unmodified
- no runtime randomness is used

---

## 8. Output artifacts

Each prediction produces:

```

prediction.md
prediction.md.ots
proof.json

```

---

## 9. Verification procedure

### Step 1 — compute hash

```

sha256sum prediction.md

```

### Step 2 — verify timestamp

```

ots verify prediction.md.ots prediction.md

```

### Step 3 — validate manifest

Ensure:

```

proof.json.sha256 == computed sha256

```

---

## 10. System invariant

```

hash(file) ↔ OTS proof ↔ Bitcoin timestamp

```

---

## 11. Core principle

This system stores only evidence, never mutable state.

---

## 12. Formal definition

A Prediction Record is a filesystem-bound, hash-committed, Bitcoin-timestamped artifact whose identity is derived from its path and whose integrity is derived from its raw byte content.
```
S