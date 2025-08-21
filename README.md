# zk_proof_mul_and_sum

This Noir circuit allows you to prove, in zero-knowledge, that you know two secret values `x` and `y` such that their product is `42`, **and** to reveal only their sum as a public output—without revealing the actual values of `x` or `y`.

This project demonstrates a simple but powerful Zero-Knowledge Proof (ZKP) circuit using **Noir** for privacy-preserving arithmetic proofs. It's a classic example in ZK: you prove knowledge of two numbers based on their relationship, but only reveal a derived property (their sum).

---

## 📝 Circuit Description

### What does this circuit do?

- **Public Output:**
  - `sum = x + y` (`Field`): The sum of the secret values.

- **Private Inputs:**
  - `x` (`Field`): Secret value.
  - `y` (`Field`): Secret value.

The circuit:
1. Asserts `x * y == 42`
2. Computes `sum = x + y`
3. Returns the sum publicly, without revealing `x` or `y` themselves.

**Important:** This circuit does _not_ reveal `x` or `y`, only that their product is `42` and their sum is as claimed.

#### Example Circuit Code

```rust
fn main(x: Field, y: Field) -> pub Field {
    // Constraint 1: product must equal 42
    assert(x * y == 42);

    // Constraint 2: sum is computed
    let sum = x + y;

    // Return the sum as a public output (can be verified on-chain, for example)
    sum
}
```

---

## 🧪 Testing

Unit tests are included to verify correct and incorrect usage:

```rust
#[test]
fn test_valid_factors_6_and_7() {
    // 6 * 7 = 42, sum = 13
    let x = 6;
    let y = 7;
    let sum = main(x, y);
    assert(sum == 13);
}

#[test]
fn test_valid_factors_21_and_2() {
    // 21 * 2 = 42, sum = 23
    let x = 21;
    let y = 2;
    let sum = main(x, y);
    assert(sum == 23);
}

#[test]
fn test_valid_factors_negative_6_and_negative_7() {
    // (-6) * (-7) = 42, sum = -13
    let x = -6;
    let y = -7;
    let sum = main(x, y);
    assert(sum == -13);
}

#[test(should_fail)]
fn test_invalid_factors_should_fail() {
    // 5 * 8 != 42, should fail 
    let x = 5;
    let y = 8;
    let sum = main(x, y);
    assert(sum == 13);
}

#[test(should_fail)]
fn test_invalid_sum_should_fail() {
    // 7 + 6 != 10, should fail 
    let x = 7;
    let y = 6;
    let sum = main(x, y);
    assert(sum == 10);
}
```

---

## 📁 Project Structure

- `/src/main.nr` — Noir circuit code and tests
- (Optionally) `/js` or `/contract` for integrations with other stacks

**Tested with:**
- Noir >= 1.0.0-beta.6
- Barretenberg CLI (`bb`) 0.84.0

---

## 🚀 Installation / Setup

```bash
# Build circuit
nargo build

# Run circuit tests
nargo test
```

---

## 🧑‍💻 Proof Generation

### JS (bb.js) Approach

```bash
# Install JS dependencies
cd js
yarn install

# Generate proof
yarn generate-proof
```

### CLI Approach

```bash
# Generate witness
nargo execute

# Generate proof with CLI
bb prove -b ./target/zk_proof_mul_and_sum.json -w target/zk_proof_mul_and_sum.gz -o ./target --oracle_hash keccak
```

---

## 🛠️ Solidity Verification

You can verify the generated proof using a Solidity contract and Foundry:

```bash
# Run Foundry tests
cd contract
forge test --optimize --optimizer-runs 5000 --gas-report -vvv
```

---

## 💡 Use Cases

- **Privacy-preserving math competitions**
- **ZKP education and demos**
- **Building blocks for more advanced cryptographic protocols**
- **Anonymous arithmetic attestations**

---

## 🏆 Why Use This Circuit?

- Prove knowledge of two numbers whose product is 42, without revealing them.
- Reveal only their sum, which can be a useful public attestation.
- Simple, understandable Noir ZKP example.
- Useful for math, education, and privacy research.

---