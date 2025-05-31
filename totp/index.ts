import { hmac_sha1 } from './hmac_sha1';

async function hotp(
  key: Uint8Array,
  count: number,
  digit: number,
): Promise<string> {
  const a = new Uint8Array(8);
  const countView = new DataView(a.buffer);
  countView.setBigUint64(0, BigInt(count), false);

  const signature = await hmac_sha1(key, a);

  const offset = signature[signature.length - 1] & 0x0f;
  signature[offset] &= 0x7f;
  const value = new DataView(signature.buffer, offset, 4).getUint32(0, false);

  return value.toString().slice(-digit);
}

export async function totp(
  key: Uint8Array,
  seconds: number,
  digit: number,
  step: number,
) {
  const T = Math.floor(seconds / step);
  return await hotp(key, T, digit);
}
