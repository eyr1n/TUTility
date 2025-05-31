import { CryptoDigestAlgorithm, digest } from 'expo-crypto';

async function hash(data: Uint8Array) {
  return new Uint8Array(await digest(CryptoDigestAlgorithm.SHA1, data));
}

function concat(a: Uint8Array, b: Uint8Array) {
  const res = new Uint8Array(a.length + b.length);
  res.set(a, 0);
  res.set(b, a.length);
  return res;
}

export async function hmac_sha1(key: Uint8Array, data: Uint8Array) {
  const K = concat(key, new Uint8Array(64 - key.length));
  const ipad = K.map((k) => k ^ 0x36);
  const opad = K.map((k) => k ^ 0x5c);
  return hash(concat(opad, await hash(concat(ipad, data))));
}
