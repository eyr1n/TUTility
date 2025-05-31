const ALPHABET_MAP = Object.fromEntries(
  'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'.split('').map((c, i) => [c, i]),
);

export function base32(input: string): Uint8Array {
  const trimmed = input.replace(/=*$/, '').toUpperCase();
  const output = new Uint8Array((trimmed.length * 5) >>> 3);

  let byte = 0;
  let bitLen = 0;
  let byteLen = 0;

  for (const c of trimmed) {
    const value = ALPHABET_MAP[c];

    byte <<= 5;
    byte |= value;
    bitLen += 5;

    if (bitLen >= 8) {
      bitLen -= 8;
      output[byteLen] = byte >>> bitLen;
      byteLen++;
    }
  }

  return output;
}
