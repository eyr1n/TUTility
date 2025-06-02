const NumberToAlphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';

const AlphabetToNumber = Object.fromEntries(
  NumberToAlphabet.split('').map((c, i) => [c, i]),
);

export function base32Encode(data: Uint8Array): string {
  const packed = pack(data);
  return (
    packed.map((e) => NumberToAlphabet[e]).join('') +
    '='.repeat((8 - (packed.length % 8)) % 8)
  );
}

export function base32Decode(str: string): Uint8Array {
  const packed = [...str.toUpperCase().replace(/=+$/, '')].map((e) => {
    const n = AlphabetToNumber[e];
    if (n == null) {
      throw new Error('invalid input');
    }
    return n;
  });
  return unpack(packed);
}

function pack(unpacked: Uint8Array): number[] {
  const packed: number[] = [];
  let buf = 0;
  let bits = 0;

  for (const e of unpacked) {
    buf = (buf << 8) | e;
    bits += 8;
    while (bits >= 5) {
      bits -= 5;
      packed.push((buf >> bits) & 0x1f);
    }
  }

  if (bits > 0) {
    packed.push((buf << (5 - bits)) & 0x1f);
  }

  return packed;
}

function unpack(packed: number[]): Uint8Array {
  const unpacked: number[] = [];
  let buf = 0;
  let bits = 0;

  for (const e of packed) {
    buf = (buf << 5) | e;
    bits += 5;
    if (bits >= 8) {
      bits -= 8;
      unpacked.push((buf >> bits) & 0xff);
    }
  }

  return new Uint8Array(unpacked);
}
