# **ADR-0002** Pairing Mechanism Selection

**Author:** Pierre Fouilloux (@pfouilloux)

![Accepted](https://img.shields.io/badge/status-accepted-green)
![Date](https://img.shields.io/badge/Date-07_Feb_2025-lightblue)

## Context and Problem Statement

Secure device pairing requires temporary authentication credentials that balance security with usability.
The solution must work without pre-shared keys while being implementable on constrained devices.

## Decision Drivers

- Entropy requirements
- Code entry complexity
- Resistance to brute-force attacks
- Implementation cost

## Considered Options

- 6-character alphanumeric code (36^6 = ~2.2B combinations)
- 8-digit numeric code (10^8 = 100M combinations)
- QR code with ECC200 error correction

## Decision Outcome

Chosen option: **ephemeral 6-character alphanumeric QR code**

### Implementation Details

```rust
impl PairingCodeStore {
  fn generate_pairing_code(expiry: DateTime<Utc>, allowed_attempts: u8) -> [u8; 6] {
    let mut rng = OsRng;
    let mut code = [0u8; 6];
    rng.fill_bytes(&mut code);
    code.map(|b| BASE36_ALPHABET[(b % 36) as usize])

    self.store(code, expiry, allowed_attempts);
    code
  }

  fn validate(&self, code: [u8; 6]) -> bool {
    let record = self.lookup(code)
    if record.exp.Before(Utc::now()) {
      self.store.revoke(code);
      return false;
    }

    record.is_some() 
  }

  fn on_scheduled_timer(&self) {
    self.store.revoke_expired_codes();
  }
}
```

### Positive Consequences

- 36 bits of entropy (2^36 = ~68B combinations)
- QR scanning avoids manual entry errors
- Alphanumeric fits standard 6-character UI layouts
- Short lived, single use codes to prevent common attacks

### Negative Consequences

- Alternate mechanism required for initiator devices without cameras.
- Additional QR generation dependency

## Confirmation Metrics

- Brute-force resistance: 1000 guesses/second → 2+ years to exhaust
- QR decode success rate >99.9% (tested with zxing-rs)

## Links

- [NIST SP 800-63B Authentication Guidelines](https://pages.nist.gov/800-63-3/sp800-63b.html)
- [QR Error Correction Levels](https://www.qrcode.com/en/about/error_correction.html)
