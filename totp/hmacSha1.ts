import { CryptoDigestAlgorithm, digest } from 'expo-crypto';

export async function hmacSha1(
  key: Uint8Array,
  data: Uint8Array,
): Promise<Uint8Array> {
  const k = concat(key, new Uint8Array(64 - key.length));
  const ipad = k.map((k) => k ^ 0x36);
  const opad = k.map((k) => k ^ 0x5c);
  return sha1(concat(opad, await sha1(concat(ipad, data))));
}

async function sha1(data: Uint8Array): Promise<Uint8Array> {
  return new Uint8Array(await digest(CryptoDigestAlgorithm.SHA1, data));
}

function concat(a: Uint8Array, b: Uint8Array): Uint8Array {
  const c = new Uint8Array(a.length + b.length);
  c.set(a, 0);
  c.set(b, a.length);
  return c;
}
