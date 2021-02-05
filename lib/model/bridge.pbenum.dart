///
//  Generated code. Do not modify.
//  source: bridge.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class SaltLength extends $pb.ProtobufEnum {
  static const SaltLength SALTLENGTH_UNSPECIFIED = SaltLength._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SALTLENGTH_UNSPECIFIED');
  static const SaltLength SALTLENGTH_AUTO = SaltLength._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SALTLENGTH_AUTO');
  static const SaltLength SALTLENGTH_EQUALS_HASH = SaltLength._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SALTLENGTH_EQUALS_HASH');

  static const $core.List<SaltLength> values = <SaltLength>[
    SALTLENGTH_UNSPECIFIED,
    SALTLENGTH_AUTO,
    SALTLENGTH_EQUALS_HASH,
  ];

  static final $core.Map<$core.int, SaltLength> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SaltLength valueOf($core.int value) => _byValue[value];

  const SaltLength._($core.int v, $core.String n) : super(v, n);
}

class PEMCipher extends $pb.ProtobufEnum {
  static const PEMCipher PEMCIPHER_UNSPECIFIED = PEMCipher._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PEMCIPHER_UNSPECIFIED');
  static const PEMCipher PEMCIPHER_DES = PEMCipher._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PEMCIPHER_DES');
  static const PEMCipher PEMCIPHER_3DES = PEMCipher._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PEMCIPHER_3DES');
  static const PEMCipher PEMCIPHER_AES128 = PEMCipher._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PEMCIPHER_AES128');
  static const PEMCipher PEMCIPHER_AES192 = PEMCipher._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PEMCIPHER_AES192');
  static const PEMCipher PEMCIPHER_AES256 = PEMCipher._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PEMCIPHER_AES256');

  static const $core.List<PEMCipher> values = <PEMCipher>[
    PEMCIPHER_UNSPECIFIED,
    PEMCIPHER_DES,
    PEMCIPHER_3DES,
    PEMCIPHER_AES128,
    PEMCIPHER_AES192,
    PEMCIPHER_AES256,
  ];

  static final $core.Map<$core.int, PEMCipher> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static PEMCipher valueOf($core.int value) => _byValue[value];

  const PEMCipher._($core.int v, $core.String n) : super(v, n);
}

class Hash extends $pb.ProtobufEnum {
  static const Hash HASH_UNSPECIFIED = Hash._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'HASH_UNSPECIFIED');
  static const Hash HASH_MD5 = Hash._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'HASH_MD5');
  static const Hash HASH_SHA1 = Hash._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'HASH_SHA1');
  static const Hash HASH_SHA224 = Hash._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'HASH_SHA224');
  static const Hash HASH_SHA256 = Hash._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'HASH_SHA256');
  static const Hash HASH_SHA384 = Hash._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'HASH_SHA384');
  static const Hash HASH_SHA512 = Hash._(
      6,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'HASH_SHA512');

  static const $core.List<Hash> values = <Hash>[
    HASH_UNSPECIFIED,
    HASH_MD5,
    HASH_SHA1,
    HASH_SHA224,
    HASH_SHA256,
    HASH_SHA384,
    HASH_SHA512,
  ];

  static final $core.Map<$core.int, Hash> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Hash valueOf($core.int value) => _byValue[value];

  const Hash._($core.int v, $core.String n) : super(v, n);
}
