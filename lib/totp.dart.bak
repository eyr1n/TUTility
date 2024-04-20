import 'dart:typed_data';

import 'package:crypto/crypto.dart';

final _base32Alphabets = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'
    .runes
    .toList()
    .asMap()
    .map((k, v) => MapEntry(v, k));

Uint8List _base32(String input) {
  final trimmed = input.replaceAll(RegExp(r'=*$'), '').toUpperCase();
  final output = Uint8List((trimmed.length * 5) >>> 3);

  var byte = 0;
  var bitLen = 0;
  var byteLen = 0;

  for (var c in trimmed.runes) {
    final value = _base32Alphabets[c]!;
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

String _hotp(String key, int counter, int digit) {
  final hmacSha1 = Hmac(sha1, _base32(key));
  final counterBytes = Uint8List(8)
    ..buffer.asByteData().setUint64(0, counter, Endian.big);
  final hash = hmacSha1.convert(counterBytes).bytes;

  // Dynamic Truncation
  final offset = hash[hash.length - 1] & 0x0f;
  final hotpStr = (((hash[offset] & 0x7f) << 24) |
          (hash[offset + 1] << 16) |
          (hash[offset + 2] << 8) |
          hash[offset + 3])
      .toString();

  return hotpStr.substring(hotpStr.length - digit);
}

String totp(String key, DateTime time, [int digit = 6, int step = 30]) {
  final counter = (time.millisecondsSinceEpoch / 1000 / step).floor();
  return _hotp(key, counter, digit);
}
