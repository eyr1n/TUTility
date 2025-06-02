import { hmacSha1 } from './hmacSha1';

export async function hotp(
  key: Uint8Array,
  count: bigint,
  digit: number,
): Promise<number> {
  const data = new Uint8Array(8);
  const view = new DataView(data.buffer);
  view.setBigUint64(0, count);
  const hs = await hmacSha1(key, data);
  const offset = hs[hs.length - 1] & 0x0f;
  hs[offset] &= 0x7f;
  const snum = new DataView(hs.buffer).getUint32(offset);
  return snum % 10 ** digit;
}
