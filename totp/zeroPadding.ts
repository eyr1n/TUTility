export function zeroPadding(value: number, digit: number): string {
  return ('0'.repeat(digit) + value.toString()).slice(-digit);
}
