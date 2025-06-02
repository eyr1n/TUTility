import { hotp } from './hotp';

export function totp(
  key: Uint8Array,
  seconds: number,
  step: number,
  digit: number,
): Promise<number> {
  const count = Math.floor(seconds / step);
  return hotp(key, BigInt(count), digit);
}
