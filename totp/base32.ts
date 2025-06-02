const NumberToAlphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';

const AlphabetToNumber = Object.fromEntries(
  NumberToAlphabet.split('').map((c, i) => [c, i]),
);

export function base32Encode(input: Uint8Array): string {
  const packed = pack8to5(input);
  const base32 = packed.map((n) => NumberToAlphabet[n]).join('');
  return base32 + '='.repeat((8 - (packed.length % 8)) % 8);
}

export function base32Decode(input: string): Uint8Array {
  const packed = [...input.toUpperCase().replace(/=+$/, '')].map((c) => {
    const n = AlphabetToNumber[c];
    if (n == null) {
      throw new Error('invalid input');
    }
    return n;
  });
  return unpack5to8(packed);
}

function pack8to5(input: Uint8Array): number[] {
  const output: number[] = [];
  let buf = 0;
  let bits = 0;

  for (const b of input) {
    buf = (buf << 8) | b;
    bits += 8;
    while (bits >= 5) {
      bits -= 5;
      output.push((buf >> bits) & 0x1f);
    }
  }

  if (bits > 0) {
    output.push((buf << (5 - bits)) & 0x1f);
  }

  return output;
}

function unpack5to8(input: number[]): Uint8Array {
  const output: number[] = [];
  let buf = 0;
  let bits = 0;

  for (const n of input) {
    buf = (buf << 5) | n;
    bits += 5;
    if (bits >= 8) {
      bits -= 8;
      output.push((buf >> bits) & 0xff);
    }
  }

  return new Uint8Array(output);
}
