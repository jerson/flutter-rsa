///
//  Generated code. Do not modify.
//  source: bridge.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'bridge.pbenum.dart';

export 'bridge.pbenum.dart';

class ConvertJWTRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertJWTRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'keyId',
        protoName: 'keyId')
    ..hasRequiredFields = false;

  ConvertJWTRequest._() : super();
  factory ConvertJWTRequest({
    $core.String data,
    $core.String keyId,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    if (keyId != null) {
      _result.keyId = keyId;
    }
    return _result;
  }
  factory ConvertJWTRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertJWTRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertJWTRequest clone() => ConvertJWTRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertJWTRequest copyWith(void Function(ConvertJWTRequest) updates) =>
      super.copyWith((message) => updates(
          message as ConvertJWTRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertJWTRequest create() => ConvertJWTRequest._();
  ConvertJWTRequest createEmptyInstance() => create();
  static $pb.PbList<ConvertJWTRequest> createRepeated() =>
      $pb.PbList<ConvertJWTRequest>();
  @$core.pragma('dart2js:noInline')
  static ConvertJWTRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertJWTRequest>(create);
  static ConvertJWTRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get data => $_getSZ(0);
  @$pb.TagNumber(1)
  set data($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get keyId => $_getSZ(1);
  @$pb.TagNumber(3)
  set keyId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasKeyId() => $_has(1);
  @$pb.TagNumber(3)
  void clearKeyId() => clearField(3);
}

class ConvertKeyPairRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertKeyPairRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privateKey',
        protoName: 'privateKey')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'certificate')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false;

  ConvertKeyPairRequest._() : super();
  factory ConvertKeyPairRequest({
    $core.String privateKey,
    $core.String certificate,
    $core.String password,
  }) {
    final _result = create();
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    if (certificate != null) {
      _result.certificate = certificate;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory ConvertKeyPairRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertKeyPairRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertKeyPairRequest clone() =>
      ConvertKeyPairRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertKeyPairRequest copyWith(
          void Function(ConvertKeyPairRequest) updates) =>
      super.copyWith((message) => updates(
          message as ConvertKeyPairRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertKeyPairRequest create() => ConvertKeyPairRequest._();
  ConvertKeyPairRequest createEmptyInstance() => create();
  static $pb.PbList<ConvertKeyPairRequest> createRepeated() =>
      $pb.PbList<ConvertKeyPairRequest>();
  @$core.pragma('dart2js:noInline')
  static ConvertKeyPairRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertKeyPairRequest>(create);
  static ConvertKeyPairRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get privateKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set privateKey($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get certificate => $_getSZ(1);
  @$pb.TagNumber(3)
  set certificate($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCertificate() => $_has(1);
  @$pb.TagNumber(3)
  void clearCertificate() => clearField(3);

  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(5)
  set password($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(5)
  void clearPassword() => clearField(5);
}

class ConvertPKCS12Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertPKCS12Request',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkcs12')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'password')
    ..hasRequiredFields = false;

  ConvertPKCS12Request._() : super();
  factory ConvertPKCS12Request({
    $core.String pkcs12,
    $core.String password,
  }) {
    final _result = create();
    if (pkcs12 != null) {
      _result.pkcs12 = pkcs12;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory ConvertPKCS12Request.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertPKCS12Request.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertPKCS12Request clone() =>
      ConvertPKCS12Request()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertPKCS12Request copyWith(void Function(ConvertPKCS12Request) updates) =>
      super.copyWith((message) => updates(
          message as ConvertPKCS12Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertPKCS12Request create() => ConvertPKCS12Request._();
  ConvertPKCS12Request createEmptyInstance() => create();
  static $pb.PbList<ConvertPKCS12Request> createRepeated() =>
      $pb.PbList<ConvertPKCS12Request>();
  @$core.pragma('dart2js:noInline')
  static ConvertPKCS12Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertPKCS12Request>(create);
  static ConvertPKCS12Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pkcs12 => $_getSZ(0);
  @$pb.TagNumber(1)
  set pkcs12($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPkcs12() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkcs12() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(3)
  set password($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

class ConvertPrivateKeyRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertPrivateKeyRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privateKey',
        protoName: 'privateKey')
    ..hasRequiredFields = false;

  ConvertPrivateKeyRequest._() : super();
  factory ConvertPrivateKeyRequest({
    $core.String privateKey,
  }) {
    final _result = create();
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    return _result;
  }
  factory ConvertPrivateKeyRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertPrivateKeyRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertPrivateKeyRequest clone() =>
      ConvertPrivateKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertPrivateKeyRequest copyWith(
          void Function(ConvertPrivateKeyRequest) updates) =>
      super.copyWith((message) => updates(message
          as ConvertPrivateKeyRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertPrivateKeyRequest create() => ConvertPrivateKeyRequest._();
  ConvertPrivateKeyRequest createEmptyInstance() => create();
  static $pb.PbList<ConvertPrivateKeyRequest> createRepeated() =>
      $pb.PbList<ConvertPrivateKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static ConvertPrivateKeyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertPrivateKeyRequest>(create);
  static ConvertPrivateKeyRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get privateKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set privateKey($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => clearField(1);
}

class ConvertPublicKeyRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertPublicKeyRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'publicKey',
        protoName: 'publicKey')
    ..hasRequiredFields = false;

  ConvertPublicKeyRequest._() : super();
  factory ConvertPublicKeyRequest({
    $core.String publicKey,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    return _result;
  }
  factory ConvertPublicKeyRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertPublicKeyRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertPublicKeyRequest clone() =>
      ConvertPublicKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertPublicKeyRequest copyWith(
          void Function(ConvertPublicKeyRequest) updates) =>
      super.copyWith((message) => updates(
          message as ConvertPublicKeyRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertPublicKeyRequest create() => ConvertPublicKeyRequest._();
  ConvertPublicKeyRequest createEmptyInstance() => create();
  static $pb.PbList<ConvertPublicKeyRequest> createRepeated() =>
      $pb.PbList<ConvertPublicKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static ConvertPublicKeyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertPublicKeyRequest>(create);
  static ConvertPublicKeyRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get publicKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set publicKey($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);
}

class DecryptOAEPRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DecryptOAEPRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ciphertext')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..e<Hash>(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash', $pb.PbFieldType.OE,
        defaultOrMaker: Hash.HASH_UNSPECIFIED,
        valueOf: Hash.valueOf,
        enumValues: Hash.values)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privateKey',
        protoName: 'privateKey')
    ..hasRequiredFields = false;

  DecryptOAEPRequest._() : super();
  factory DecryptOAEPRequest({
    $core.String ciphertext,
    $core.String label,
    Hash hash,
    $core.String privateKey,
  }) {
    final _result = create();
    if (ciphertext != null) {
      _result.ciphertext = ciphertext;
    }
    if (label != null) {
      _result.label = label;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    return _result;
  }
  factory DecryptOAEPRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DecryptOAEPRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DecryptOAEPRequest clone() => DecryptOAEPRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DecryptOAEPRequest copyWith(void Function(DecryptOAEPRequest) updates) =>
      super.copyWith((message) => updates(
          message as DecryptOAEPRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DecryptOAEPRequest create() => DecryptOAEPRequest._();
  DecryptOAEPRequest createEmptyInstance() => create();
  static $pb.PbList<DecryptOAEPRequest> createRepeated() =>
      $pb.PbList<DecryptOAEPRequest>();
  @$core.pragma('dart2js:noInline')
  static DecryptOAEPRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DecryptOAEPRequest>(create);
  static DecryptOAEPRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ciphertext => $_getSZ(0);
  @$pb.TagNumber(1)
  set ciphertext($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCiphertext() => $_has(0);
  @$pb.TagNumber(1)
  void clearCiphertext() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(3)
  set label($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(3)
  void clearLabel() => clearField(3);

  @$pb.TagNumber(5)
  Hash get hash => $_getN(2);
  @$pb.TagNumber(5)
  set hash(Hash v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHash() => $_has(2);
  @$pb.TagNumber(5)
  void clearHash() => clearField(5);

  @$pb.TagNumber(7)
  $core.String get privateKey => $_getSZ(3);
  @$pb.TagNumber(7)
  set privateKey($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPrivateKey() => $_has(3);
  @$pb.TagNumber(7)
  void clearPrivateKey() => clearField(7);
}

class DecryptOAEPBytesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DecryptOAEPBytesRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ciphertext',
        $pb.PbFieldType.OY)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..e<Hash>(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash', $pb.PbFieldType.OE,
        defaultOrMaker: Hash.HASH_UNSPECIFIED,
        valueOf: Hash.valueOf,
        enumValues: Hash.values)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privateKey', protoName: 'privateKey')
    ..hasRequiredFields = false;

  DecryptOAEPBytesRequest._() : super();
  factory DecryptOAEPBytesRequest({
    $core.List<$core.int> ciphertext,
    $core.String label,
    Hash hash,
    $core.String privateKey,
  }) {
    final _result = create();
    if (ciphertext != null) {
      _result.ciphertext = ciphertext;
    }
    if (label != null) {
      _result.label = label;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    return _result;
  }
  factory DecryptOAEPBytesRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DecryptOAEPBytesRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DecryptOAEPBytesRequest clone() =>
      DecryptOAEPBytesRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DecryptOAEPBytesRequest copyWith(
          void Function(DecryptOAEPBytesRequest) updates) =>
      super.copyWith((message) => updates(
          message as DecryptOAEPBytesRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DecryptOAEPBytesRequest create() => DecryptOAEPBytesRequest._();
  DecryptOAEPBytesRequest createEmptyInstance() => create();
  static $pb.PbList<DecryptOAEPBytesRequest> createRepeated() =>
      $pb.PbList<DecryptOAEPBytesRequest>();
  @$core.pragma('dart2js:noInline')
  static DecryptOAEPBytesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DecryptOAEPBytesRequest>(create);
  static DecryptOAEPBytesRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ciphertext => $_getN(0);
  @$pb.TagNumber(1)
  set ciphertext($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCiphertext() => $_has(0);
  @$pb.TagNumber(1)
  void clearCiphertext() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(3)
  set label($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(3)
  void clearLabel() => clearField(3);

  @$pb.TagNumber(5)
  Hash get hash => $_getN(2);
  @$pb.TagNumber(5)
  set hash(Hash v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHash() => $_has(2);
  @$pb.TagNumber(5)
  void clearHash() => clearField(5);

  @$pb.TagNumber(7)
  $core.String get privateKey => $_getSZ(3);
  @$pb.TagNumber(7)
  set privateKey($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPrivateKey() => $_has(3);
  @$pb.TagNumber(7)
  void clearPrivateKey() => clearField(7);
}

class DecryptPKCS1v15Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DecryptPKCS1v15Request',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ciphertext')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privateKey',
        protoName: 'privateKey')
    ..hasRequiredFields = false;

  DecryptPKCS1v15Request._() : super();
  factory DecryptPKCS1v15Request({
    $core.String ciphertext,
    $core.String privateKey,
  }) {
    final _result = create();
    if (ciphertext != null) {
      _result.ciphertext = ciphertext;
    }
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    return _result;
  }
  factory DecryptPKCS1v15Request.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DecryptPKCS1v15Request.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DecryptPKCS1v15Request clone() =>
      DecryptPKCS1v15Request()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DecryptPKCS1v15Request copyWith(
          void Function(DecryptPKCS1v15Request) updates) =>
      super.copyWith((message) => updates(
          message as DecryptPKCS1v15Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DecryptPKCS1v15Request create() => DecryptPKCS1v15Request._();
  DecryptPKCS1v15Request createEmptyInstance() => create();
  static $pb.PbList<DecryptPKCS1v15Request> createRepeated() =>
      $pb.PbList<DecryptPKCS1v15Request>();
  @$core.pragma('dart2js:noInline')
  static DecryptPKCS1v15Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DecryptPKCS1v15Request>(create);
  static DecryptPKCS1v15Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ciphertext => $_getSZ(0);
  @$pb.TagNumber(1)
  set ciphertext($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCiphertext() => $_has(0);
  @$pb.TagNumber(1)
  void clearCiphertext() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get privateKey => $_getSZ(1);
  @$pb.TagNumber(3)
  set privateKey($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrivateKey() => $_has(1);
  @$pb.TagNumber(3)
  void clearPrivateKey() => clearField(3);
}

class DecryptPKCS1v15BytesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DecryptPKCS1v15BytesRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ciphertext',
        $pb.PbFieldType.OY)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privateKey',
        protoName: 'privateKey')
    ..hasRequiredFields = false;

  DecryptPKCS1v15BytesRequest._() : super();
  factory DecryptPKCS1v15BytesRequest({
    $core.List<$core.int> ciphertext,
    $core.String privateKey,
  }) {
    final _result = create();
    if (ciphertext != null) {
      _result.ciphertext = ciphertext;
    }
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    return _result;
  }
  factory DecryptPKCS1v15BytesRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DecryptPKCS1v15BytesRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DecryptPKCS1v15BytesRequest clone() =>
      DecryptPKCS1v15BytesRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DecryptPKCS1v15BytesRequest copyWith(
          void Function(DecryptPKCS1v15BytesRequest) updates) =>
      super.copyWith((message) => updates(message
          as DecryptPKCS1v15BytesRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DecryptPKCS1v15BytesRequest create() =>
      DecryptPKCS1v15BytesRequest._();
  DecryptPKCS1v15BytesRequest createEmptyInstance() => create();
  static $pb.PbList<DecryptPKCS1v15BytesRequest> createRepeated() =>
      $pb.PbList<DecryptPKCS1v15BytesRequest>();
  @$core.pragma('dart2js:noInline')
  static DecryptPKCS1v15BytesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DecryptPKCS1v15BytesRequest>(create);
  static DecryptPKCS1v15BytesRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ciphertext => $_getN(0);
  @$pb.TagNumber(1)
  set ciphertext($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCiphertext() => $_has(0);
  @$pb.TagNumber(1)
  void clearCiphertext() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get privateKey => $_getSZ(1);
  @$pb.TagNumber(3)
  set privateKey($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrivateKey() => $_has(1);
  @$pb.TagNumber(3)
  void clearPrivateKey() => clearField(3);
}

class DecryptPrivateKeyRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DecryptPrivateKeyRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privateKeyEncrypted',
        protoName: 'privateKeyEncrypted')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'password')
    ..hasRequiredFields = false;

  DecryptPrivateKeyRequest._() : super();
  factory DecryptPrivateKeyRequest({
    $core.String privateKeyEncrypted,
    $core.String password,
  }) {
    final _result = create();
    if (privateKeyEncrypted != null) {
      _result.privateKeyEncrypted = privateKeyEncrypted;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory DecryptPrivateKeyRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DecryptPrivateKeyRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DecryptPrivateKeyRequest clone() =>
      DecryptPrivateKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DecryptPrivateKeyRequest copyWith(
          void Function(DecryptPrivateKeyRequest) updates) =>
      super.copyWith((message) => updates(message
          as DecryptPrivateKeyRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DecryptPrivateKeyRequest create() => DecryptPrivateKeyRequest._();
  DecryptPrivateKeyRequest createEmptyInstance() => create();
  static $pb.PbList<DecryptPrivateKeyRequest> createRepeated() =>
      $pb.PbList<DecryptPrivateKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static DecryptPrivateKeyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DecryptPrivateKeyRequest>(create);
  static DecryptPrivateKeyRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get privateKeyEncrypted => $_getSZ(0);
  @$pb.TagNumber(1)
  set privateKeyEncrypted($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrivateKeyEncrypted() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKeyEncrypted() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(3)
  set password($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

class EncryptOAEPRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EncryptOAEPRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..e<Hash>(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash', $pb.PbFieldType.OE,
        defaultOrMaker: Hash.HASH_UNSPECIFIED,
        valueOf: Hash.valueOf,
        enumValues: Hash.values)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey',
        protoName: 'publicKey')
    ..hasRequiredFields = false;

  EncryptOAEPRequest._() : super();
  factory EncryptOAEPRequest({
    $core.String message,
    $core.String label,
    Hash hash,
    $core.String publicKey,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (label != null) {
      _result.label = label;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    return _result;
  }
  factory EncryptOAEPRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EncryptOAEPRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EncryptOAEPRequest clone() => EncryptOAEPRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EncryptOAEPRequest copyWith(void Function(EncryptOAEPRequest) updates) =>
      super.copyWith((message) => updates(
          message as EncryptOAEPRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EncryptOAEPRequest create() => EncryptOAEPRequest._();
  EncryptOAEPRequest createEmptyInstance() => create();
  static $pb.PbList<EncryptOAEPRequest> createRepeated() =>
      $pb.PbList<EncryptOAEPRequest>();
  @$core.pragma('dart2js:noInline')
  static EncryptOAEPRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EncryptOAEPRequest>(create);
  static EncryptOAEPRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(3)
  set label($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(3)
  void clearLabel() => clearField(3);

  @$pb.TagNumber(5)
  Hash get hash => $_getN(2);
  @$pb.TagNumber(5)
  set hash(Hash v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHash() => $_has(2);
  @$pb.TagNumber(5)
  void clearHash() => clearField(5);

  @$pb.TagNumber(7)
  $core.String get publicKey => $_getSZ(3);
  @$pb.TagNumber(7)
  set publicKey($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPublicKey() => $_has(3);
  @$pb.TagNumber(7)
  void clearPublicKey() => clearField(7);
}

class EncryptOAEPBytesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EncryptOAEPBytesRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message',
        $pb.PbFieldType.OY)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..e<Hash>(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash', $pb.PbFieldType.OE,
        defaultOrMaker: Hash.HASH_UNSPECIFIED,
        valueOf: Hash.valueOf,
        enumValues: Hash.values)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey', protoName: 'publicKey')
    ..hasRequiredFields = false;

  EncryptOAEPBytesRequest._() : super();
  factory EncryptOAEPBytesRequest({
    $core.List<$core.int> message,
    $core.String label,
    Hash hash,
    $core.String publicKey,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (label != null) {
      _result.label = label;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    return _result;
  }
  factory EncryptOAEPBytesRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EncryptOAEPBytesRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EncryptOAEPBytesRequest clone() =>
      EncryptOAEPBytesRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EncryptOAEPBytesRequest copyWith(
          void Function(EncryptOAEPBytesRequest) updates) =>
      super.copyWith((message) => updates(
          message as EncryptOAEPBytesRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EncryptOAEPBytesRequest create() => EncryptOAEPBytesRequest._();
  EncryptOAEPBytesRequest createEmptyInstance() => create();
  static $pb.PbList<EncryptOAEPBytesRequest> createRepeated() =>
      $pb.PbList<EncryptOAEPBytesRequest>();
  @$core.pragma('dart2js:noInline')
  static EncryptOAEPBytesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EncryptOAEPBytesRequest>(create);
  static EncryptOAEPBytesRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get message => $_getN(0);
  @$pb.TagNumber(1)
  set message($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(3)
  set label($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(3)
  void clearLabel() => clearField(3);

  @$pb.TagNumber(5)
  Hash get hash => $_getN(2);
  @$pb.TagNumber(5)
  set hash(Hash v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHash() => $_has(2);
  @$pb.TagNumber(5)
  void clearHash() => clearField(5);

  @$pb.TagNumber(7)
  $core.String get publicKey => $_getSZ(3);
  @$pb.TagNumber(7)
  set publicKey($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPublicKey() => $_has(3);
  @$pb.TagNumber(7)
  void clearPublicKey() => clearField(7);
}

class EncryptPKCS1v15Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EncryptPKCS1v15Request',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'publicKey',
        protoName: 'publicKey')
    ..hasRequiredFields = false;

  EncryptPKCS1v15Request._() : super();
  factory EncryptPKCS1v15Request({
    $core.String message,
    $core.String publicKey,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    return _result;
  }
  factory EncryptPKCS1v15Request.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EncryptPKCS1v15Request.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EncryptPKCS1v15Request clone() =>
      EncryptPKCS1v15Request()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EncryptPKCS1v15Request copyWith(
          void Function(EncryptPKCS1v15Request) updates) =>
      super.copyWith((message) => updates(
          message as EncryptPKCS1v15Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EncryptPKCS1v15Request create() => EncryptPKCS1v15Request._();
  EncryptPKCS1v15Request createEmptyInstance() => create();
  static $pb.PbList<EncryptPKCS1v15Request> createRepeated() =>
      $pb.PbList<EncryptPKCS1v15Request>();
  @$core.pragma('dart2js:noInline')
  static EncryptPKCS1v15Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EncryptPKCS1v15Request>(create);
  static EncryptPKCS1v15Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get publicKey => $_getSZ(1);
  @$pb.TagNumber(3)
  set publicKey($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(3)
  void clearPublicKey() => clearField(3);
}

class EncryptPKCS1v15BytesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EncryptPKCS1v15BytesRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message',
        $pb.PbFieldType.OY)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'publicKey',
        protoName: 'publicKey')
    ..hasRequiredFields = false;

  EncryptPKCS1v15BytesRequest._() : super();
  factory EncryptPKCS1v15BytesRequest({
    $core.List<$core.int> message,
    $core.String publicKey,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    return _result;
  }
  factory EncryptPKCS1v15BytesRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EncryptPKCS1v15BytesRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EncryptPKCS1v15BytesRequest clone() =>
      EncryptPKCS1v15BytesRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EncryptPKCS1v15BytesRequest copyWith(
          void Function(EncryptPKCS1v15BytesRequest) updates) =>
      super.copyWith((message) => updates(message
          as EncryptPKCS1v15BytesRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EncryptPKCS1v15BytesRequest create() =>
      EncryptPKCS1v15BytesRequest._();
  EncryptPKCS1v15BytesRequest createEmptyInstance() => create();
  static $pb.PbList<EncryptPKCS1v15BytesRequest> createRepeated() =>
      $pb.PbList<EncryptPKCS1v15BytesRequest>();
  @$core.pragma('dart2js:noInline')
  static EncryptPKCS1v15BytesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EncryptPKCS1v15BytesRequest>(create);
  static EncryptPKCS1v15BytesRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get message => $_getN(0);
  @$pb.TagNumber(1)
  set message($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get publicKey => $_getSZ(1);
  @$pb.TagNumber(3)
  set publicKey($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(3)
  void clearPublicKey() => clearField(3);
}

class EncryptPrivateKeyRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EncryptPrivateKeyRequest',
      package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'model'),
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privateKey',
        protoName: 'privateKey')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'password')
    ..e<PEMCipher>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cipher',
        $pb.PbFieldType.OE,
        defaultOrMaker: PEMCipher.PEMCIPHER_UNSPECIFIED,
        valueOf: PEMCipher.valueOf,
        enumValues: PEMCipher.values)
    ..hasRequiredFields = false;

  EncryptPrivateKeyRequest._() : super();
  factory EncryptPrivateKeyRequest({
    $core.String privateKey,
    $core.String password,
    PEMCipher cipher,
  }) {
    final _result = create();
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    if (password != null) {
      _result.password = password;
    }
    if (cipher != null) {
      _result.cipher = cipher;
    }
    return _result;
  }
  factory EncryptPrivateKeyRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EncryptPrivateKeyRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EncryptPrivateKeyRequest clone() =>
      EncryptPrivateKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EncryptPrivateKeyRequest copyWith(
          void Function(EncryptPrivateKeyRequest) updates) =>
      super.copyWith((message) => updates(message
          as EncryptPrivateKeyRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EncryptPrivateKeyRequest create() => EncryptPrivateKeyRequest._();
  EncryptPrivateKeyRequest createEmptyInstance() => create();
  static $pb.PbList<EncryptPrivateKeyRequest> createRepeated() =>
      $pb.PbList<EncryptPrivateKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static EncryptPrivateKeyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EncryptPrivateKeyRequest>(create);
  static EncryptPrivateKeyRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get privateKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set privateKey($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(3)
  set password($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);

  @$pb.TagNumber(5)
  PEMCipher get cipher => $_getN(2);
  @$pb.TagNumber(5)
  set cipher(PEMCipher v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCipher() => $_has(2);
  @$pb.TagNumber(5)
  void clearCipher() => clearField(5);
}

class GenerateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GenerateRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nBits',
        $pb.PbFieldType.O3,
        protoName: 'nBits')
    ..hasRequiredFields = false;

  GenerateRequest._() : super();
  factory GenerateRequest({
    $core.int nBits,
  }) {
    final _result = create();
    if (nBits != null) {
      _result.nBits = nBits;
    }
    return _result;
  }
  factory GenerateRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GenerateRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GenerateRequest clone() => GenerateRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GenerateRequest copyWith(void Function(GenerateRequest) updates) =>
      super.copyWith((message) =>
          updates(message as GenerateRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenerateRequest create() => GenerateRequest._();
  GenerateRequest createEmptyInstance() => create();
  static $pb.PbList<GenerateRequest> createRepeated() =>
      $pb.PbList<GenerateRequest>();
  @$core.pragma('dart2js:noInline')
  static GenerateRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateRequest>(create);
  static GenerateRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nBits => $_getIZ(0);
  @$pb.TagNumber(1)
  set nBits($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNBits() => $_has(0);
  @$pb.TagNumber(1)
  void clearNBits() => clearField(1);
}

class HashRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HashRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..e<Hash>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hash',
        $pb.PbFieldType.OE,
        defaultOrMaker: Hash.HASH_UNSPECIFIED,
        valueOf: Hash.valueOf,
        enumValues: Hash.values)
    ..hasRequiredFields = false;

  HashRequest._() : super();
  factory HashRequest({
    $core.String message,
    Hash hash,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    return _result;
  }
  factory HashRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HashRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HashRequest clone() => HashRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HashRequest copyWith(void Function(HashRequest) updates) =>
      super.copyWith((message) =>
          updates(message as HashRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HashRequest create() => HashRequest._();
  HashRequest createEmptyInstance() => create();
  static $pb.PbList<HashRequest> createRepeated() => $pb.PbList<HashRequest>();
  @$core.pragma('dart2js:noInline')
  static HashRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HashRequest>(create);
  static HashRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(3)
  Hash get hash => $_getN(1);
  @$pb.TagNumber(3)
  set hash(Hash v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(3)
  void clearHash() => clearField(3);
}

class Base64Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Base64Request',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..hasRequiredFields = false;

  Base64Request._() : super();
  factory Base64Request({
    $core.String message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory Base64Request.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Base64Request.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Base64Request clone() => Base64Request()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Base64Request copyWith(void Function(Base64Request) updates) =>
      super.copyWith((message) =>
          updates(message as Base64Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Base64Request create() => Base64Request._();
  Base64Request createEmptyInstance() => create();
  static $pb.PbList<Base64Request> createRepeated() =>
      $pb.PbList<Base64Request>();
  @$core.pragma('dart2js:noInline')
  static Base64Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Base64Request>(create);
  static Base64Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class MetadataPrivateKeyRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MetadataPrivateKeyRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privateKey',
        protoName: 'privateKey')
    ..hasRequiredFields = false;

  MetadataPrivateKeyRequest._() : super();
  factory MetadataPrivateKeyRequest({
    $core.String privateKey,
  }) {
    final _result = create();
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    return _result;
  }
  factory MetadataPrivateKeyRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MetadataPrivateKeyRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MetadataPrivateKeyRequest clone() =>
      MetadataPrivateKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MetadataPrivateKeyRequest copyWith(
          void Function(MetadataPrivateKeyRequest) updates) =>
      super.copyWith((message) => updates(message
          as MetadataPrivateKeyRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MetadataPrivateKeyRequest create() => MetadataPrivateKeyRequest._();
  MetadataPrivateKeyRequest createEmptyInstance() => create();
  static $pb.PbList<MetadataPrivateKeyRequest> createRepeated() =>
      $pb.PbList<MetadataPrivateKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static MetadataPrivateKeyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MetadataPrivateKeyRequest>(create);
  static MetadataPrivateKeyRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get privateKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set privateKey($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => clearField(1);
}

class MetadataPublicKeyRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MetadataPublicKeyRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'publicKey',
        protoName: 'publicKey')
    ..hasRequiredFields = false;

  MetadataPublicKeyRequest._() : super();
  factory MetadataPublicKeyRequest({
    $core.String publicKey,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    return _result;
  }
  factory MetadataPublicKeyRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MetadataPublicKeyRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MetadataPublicKeyRequest clone() =>
      MetadataPublicKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MetadataPublicKeyRequest copyWith(
          void Function(MetadataPublicKeyRequest) updates) =>
      super.copyWith((message) => updates(message
          as MetadataPublicKeyRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MetadataPublicKeyRequest create() => MetadataPublicKeyRequest._();
  MetadataPublicKeyRequest createEmptyInstance() => create();
  static $pb.PbList<MetadataPublicKeyRequest> createRepeated() =>
      $pb.PbList<MetadataPublicKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static MetadataPublicKeyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MetadataPublicKeyRequest>(create);
  static MetadataPublicKeyRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get publicKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set publicKey($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);
}

class SignPKCS1v15Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SignPKCS1v15Request',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..e<Hash>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash',
        $pb.PbFieldType.OE,
        defaultOrMaker: Hash.HASH_UNSPECIFIED,
        valueOf: Hash.valueOf,
        enumValues: Hash.values)
    ..aOS(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privateKey',
        protoName: 'privateKey')
    ..hasRequiredFields = false;

  SignPKCS1v15Request._() : super();
  factory SignPKCS1v15Request({
    $core.String message,
    Hash hash,
    $core.String privateKey,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    return _result;
  }
  factory SignPKCS1v15Request.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SignPKCS1v15Request.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SignPKCS1v15Request clone() => SignPKCS1v15Request()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SignPKCS1v15Request copyWith(void Function(SignPKCS1v15Request) updates) =>
      super.copyWith((message) => updates(
          message as SignPKCS1v15Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignPKCS1v15Request create() => SignPKCS1v15Request._();
  SignPKCS1v15Request createEmptyInstance() => create();
  static $pb.PbList<SignPKCS1v15Request> createRepeated() =>
      $pb.PbList<SignPKCS1v15Request>();
  @$core.pragma('dart2js:noInline')
  static SignPKCS1v15Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignPKCS1v15Request>(create);
  static SignPKCS1v15Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(3)
  Hash get hash => $_getN(1);
  @$pb.TagNumber(3)
  set hash(Hash v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(3)
  void clearHash() => clearField(3);

  @$pb.TagNumber(5)
  $core.String get privateKey => $_getSZ(2);
  @$pb.TagNumber(5)
  set privateKey($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPrivateKey() => $_has(2);
  @$pb.TagNumber(5)
  void clearPrivateKey() => clearField(5);
}

class SignPKCS1v15BytesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SignPKCS1v15BytesRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message',
        $pb.PbFieldType.OY)
    ..e<Hash>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash', $pb.PbFieldType.OE,
        defaultOrMaker: Hash.HASH_UNSPECIFIED,
        valueOf: Hash.valueOf,
        enumValues: Hash.values)
    ..aOS(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privateKey',
        protoName: 'privateKey')
    ..hasRequiredFields = false;

  SignPKCS1v15BytesRequest._() : super();
  factory SignPKCS1v15BytesRequest({
    $core.List<$core.int> message,
    Hash hash,
    $core.String privateKey,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    return _result;
  }
  factory SignPKCS1v15BytesRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SignPKCS1v15BytesRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SignPKCS1v15BytesRequest clone() =>
      SignPKCS1v15BytesRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SignPKCS1v15BytesRequest copyWith(
          void Function(SignPKCS1v15BytesRequest) updates) =>
      super.copyWith((message) => updates(message
          as SignPKCS1v15BytesRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignPKCS1v15BytesRequest create() => SignPKCS1v15BytesRequest._();
  SignPKCS1v15BytesRequest createEmptyInstance() => create();
  static $pb.PbList<SignPKCS1v15BytesRequest> createRepeated() =>
      $pb.PbList<SignPKCS1v15BytesRequest>();
  @$core.pragma('dart2js:noInline')
  static SignPKCS1v15BytesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignPKCS1v15BytesRequest>(create);
  static SignPKCS1v15BytesRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get message => $_getN(0);
  @$pb.TagNumber(1)
  set message($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(3)
  Hash get hash => $_getN(1);
  @$pb.TagNumber(3)
  set hash(Hash v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(3)
  void clearHash() => clearField(3);

  @$pb.TagNumber(5)
  $core.String get privateKey => $_getSZ(2);
  @$pb.TagNumber(5)
  set privateKey($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPrivateKey() => $_has(2);
  @$pb.TagNumber(5)
  void clearPrivateKey() => clearField(5);
}

class SignPSSRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SignPSSRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..e<Hash>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash', $pb.PbFieldType.OE,
        defaultOrMaker: Hash.HASH_UNSPECIFIED,
        valueOf: Hash.valueOf,
        enumValues: Hash.values)
    ..e<SaltLength>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'saltLength',
        $pb.PbFieldType.OE,
        protoName: 'saltLength',
        defaultOrMaker: SaltLength.SALTLENGTH_UNSPECIFIED,
        valueOf: SaltLength.valueOf,
        enumValues: SaltLength.values)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privateKey', protoName: 'privateKey')
    ..hasRequiredFields = false;

  SignPSSRequest._() : super();
  factory SignPSSRequest({
    $core.String message,
    Hash hash,
    SaltLength saltLength,
    $core.String privateKey,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (saltLength != null) {
      _result.saltLength = saltLength;
    }
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    return _result;
  }
  factory SignPSSRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SignPSSRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SignPSSRequest clone() => SignPSSRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SignPSSRequest copyWith(void Function(SignPSSRequest) updates) =>
      super.copyWith((message) =>
          updates(message as SignPSSRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignPSSRequest create() => SignPSSRequest._();
  SignPSSRequest createEmptyInstance() => create();
  static $pb.PbList<SignPSSRequest> createRepeated() =>
      $pb.PbList<SignPSSRequest>();
  @$core.pragma('dart2js:noInline')
  static SignPSSRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignPSSRequest>(create);
  static SignPSSRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(3)
  Hash get hash => $_getN(1);
  @$pb.TagNumber(3)
  set hash(Hash v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(3)
  void clearHash() => clearField(3);

  @$pb.TagNumber(5)
  SaltLength get saltLength => $_getN(2);
  @$pb.TagNumber(5)
  set saltLength(SaltLength v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSaltLength() => $_has(2);
  @$pb.TagNumber(5)
  void clearSaltLength() => clearField(5);

  @$pb.TagNumber(7)
  $core.String get privateKey => $_getSZ(3);
  @$pb.TagNumber(7)
  set privateKey($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPrivateKey() => $_has(3);
  @$pb.TagNumber(7)
  void clearPrivateKey() => clearField(7);
}

class SignPSSBytesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SignPSSBytesRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message',
        $pb.PbFieldType.OY)
    ..e<Hash>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash', $pb.PbFieldType.OE,
        defaultOrMaker: Hash.HASH_UNSPECIFIED,
        valueOf: Hash.valueOf,
        enumValues: Hash.values)
    ..e<SaltLength>(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'saltLength', $pb.PbFieldType.OE,
        protoName: 'saltLength',
        defaultOrMaker: SaltLength.SALTLENGTH_UNSPECIFIED,
        valueOf: SaltLength.valueOf,
        enumValues: SaltLength.values)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privateKey', protoName: 'privateKey')
    ..hasRequiredFields = false;

  SignPSSBytesRequest._() : super();
  factory SignPSSBytesRequest({
    $core.List<$core.int> message,
    Hash hash,
    SaltLength saltLength,
    $core.String privateKey,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (saltLength != null) {
      _result.saltLength = saltLength;
    }
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    return _result;
  }
  factory SignPSSBytesRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SignPSSBytesRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SignPSSBytesRequest clone() => SignPSSBytesRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SignPSSBytesRequest copyWith(void Function(SignPSSBytesRequest) updates) =>
      super.copyWith((message) => updates(
          message as SignPSSBytesRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignPSSBytesRequest create() => SignPSSBytesRequest._();
  SignPSSBytesRequest createEmptyInstance() => create();
  static $pb.PbList<SignPSSBytesRequest> createRepeated() =>
      $pb.PbList<SignPSSBytesRequest>();
  @$core.pragma('dart2js:noInline')
  static SignPSSBytesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignPSSBytesRequest>(create);
  static SignPSSBytesRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get message => $_getN(0);
  @$pb.TagNumber(1)
  set message($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(3)
  Hash get hash => $_getN(1);
  @$pb.TagNumber(3)
  set hash(Hash v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(3)
  void clearHash() => clearField(3);

  @$pb.TagNumber(5)
  SaltLength get saltLength => $_getN(2);
  @$pb.TagNumber(5)
  set saltLength(SaltLength v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSaltLength() => $_has(2);
  @$pb.TagNumber(5)
  void clearSaltLength() => clearField(5);

  @$pb.TagNumber(7)
  $core.String get privateKey => $_getSZ(3);
  @$pb.TagNumber(7)
  set privateKey($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPrivateKey() => $_has(3);
  @$pb.TagNumber(7)
  void clearPrivateKey() => clearField(7);
}

class VerifyPKCS1v15Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VerifyPKCS1v15Request',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'signature')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..e<Hash>(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash', $pb.PbFieldType.OE,
        defaultOrMaker: Hash.HASH_UNSPECIFIED,
        valueOf: Hash.valueOf,
        enumValues: Hash.values)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey',
        protoName: 'publicKey')
    ..hasRequiredFields = false;

  VerifyPKCS1v15Request._() : super();
  factory VerifyPKCS1v15Request({
    $core.String signature,
    $core.String message,
    Hash hash,
    $core.String publicKey,
  }) {
    final _result = create();
    if (signature != null) {
      _result.signature = signature;
    }
    if (message != null) {
      _result.message = message;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    return _result;
  }
  factory VerifyPKCS1v15Request.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VerifyPKCS1v15Request.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VerifyPKCS1v15Request clone() =>
      VerifyPKCS1v15Request()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VerifyPKCS1v15Request copyWith(
          void Function(VerifyPKCS1v15Request) updates) =>
      super.copyWith((message) => updates(
          message as VerifyPKCS1v15Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyPKCS1v15Request create() => VerifyPKCS1v15Request._();
  VerifyPKCS1v15Request createEmptyInstance() => create();
  static $pb.PbList<VerifyPKCS1v15Request> createRepeated() =>
      $pb.PbList<VerifyPKCS1v15Request>();
  @$core.pragma('dart2js:noInline')
  static VerifyPKCS1v15Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VerifyPKCS1v15Request>(create);
  static VerifyPKCS1v15Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get signature => $_getSZ(0);
  @$pb.TagNumber(1)
  set signature($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(3)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(5)
  Hash get hash => $_getN(2);
  @$pb.TagNumber(5)
  set hash(Hash v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHash() => $_has(2);
  @$pb.TagNumber(5)
  void clearHash() => clearField(5);

  @$pb.TagNumber(7)
  $core.String get publicKey => $_getSZ(3);
  @$pb.TagNumber(7)
  set publicKey($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPublicKey() => $_has(3);
  @$pb.TagNumber(7)
  void clearPublicKey() => clearField(7);
}

class VerifyPKCS1v15BytesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VerifyPKCS1v15BytesRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'signature',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message',
        $pb.PbFieldType.OY)
    ..e<Hash>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash', $pb.PbFieldType.OE,
        defaultOrMaker: Hash.HASH_UNSPECIFIED,
        valueOf: Hash.valueOf,
        enumValues: Hash.values)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey', protoName: 'publicKey')
    ..hasRequiredFields = false;

  VerifyPKCS1v15BytesRequest._() : super();
  factory VerifyPKCS1v15BytesRequest({
    $core.List<$core.int> signature,
    $core.List<$core.int> message,
    Hash hash,
    $core.String publicKey,
  }) {
    final _result = create();
    if (signature != null) {
      _result.signature = signature;
    }
    if (message != null) {
      _result.message = message;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    return _result;
  }
  factory VerifyPKCS1v15BytesRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VerifyPKCS1v15BytesRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VerifyPKCS1v15BytesRequest clone() =>
      VerifyPKCS1v15BytesRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VerifyPKCS1v15BytesRequest copyWith(
          void Function(VerifyPKCS1v15BytesRequest) updates) =>
      super.copyWith((message) => updates(message
          as VerifyPKCS1v15BytesRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyPKCS1v15BytesRequest create() => VerifyPKCS1v15BytesRequest._();
  VerifyPKCS1v15BytesRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyPKCS1v15BytesRequest> createRepeated() =>
      $pb.PbList<VerifyPKCS1v15BytesRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyPKCS1v15BytesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VerifyPKCS1v15BytesRequest>(create);
  static VerifyPKCS1v15BytesRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get signature => $_getN(0);
  @$pb.TagNumber(1)
  set signature($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => clearField(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get message => $_getN(1);
  @$pb.TagNumber(3)
  set message($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(5)
  Hash get hash => $_getN(2);
  @$pb.TagNumber(5)
  set hash(Hash v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHash() => $_has(2);
  @$pb.TagNumber(5)
  void clearHash() => clearField(5);

  @$pb.TagNumber(7)
  $core.String get publicKey => $_getSZ(3);
  @$pb.TagNumber(7)
  set publicKey($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPublicKey() => $_has(3);
  @$pb.TagNumber(7)
  void clearPublicKey() => clearField(7);
}

class VerifyPSSRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VerifyPSSRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'signature')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..e<Hash>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash', $pb.PbFieldType.OE,
        defaultOrMaker: Hash.HASH_UNSPECIFIED,
        valueOf: Hash.valueOf,
        enumValues: Hash.values)
    ..e<SaltLength>(
        7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'saltLength', $pb.PbFieldType.OE,
        protoName: 'saltLength',
        defaultOrMaker: SaltLength.SALTLENGTH_UNSPECIFIED,
        valueOf: SaltLength.valueOf,
        enumValues: SaltLength.values)
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey', protoName: 'publicKey')
    ..hasRequiredFields = false;

  VerifyPSSRequest._() : super();
  factory VerifyPSSRequest({
    $core.String signature,
    $core.String message,
    Hash hash,
    SaltLength saltLength,
    $core.String publicKey,
  }) {
    final _result = create();
    if (signature != null) {
      _result.signature = signature;
    }
    if (message != null) {
      _result.message = message;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (saltLength != null) {
      _result.saltLength = saltLength;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    return _result;
  }
  factory VerifyPSSRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VerifyPSSRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VerifyPSSRequest clone() => VerifyPSSRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VerifyPSSRequest copyWith(void Function(VerifyPSSRequest) updates) =>
      super.copyWith((message) => updates(
          message as VerifyPSSRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyPSSRequest create() => VerifyPSSRequest._();
  VerifyPSSRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyPSSRequest> createRepeated() =>
      $pb.PbList<VerifyPSSRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyPSSRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VerifyPSSRequest>(create);
  static VerifyPSSRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get signature => $_getSZ(0);
  @$pb.TagNumber(1)
  set signature($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(3)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(5)
  Hash get hash => $_getN(2);
  @$pb.TagNumber(5)
  set hash(Hash v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHash() => $_has(2);
  @$pb.TagNumber(5)
  void clearHash() => clearField(5);

  @$pb.TagNumber(7)
  SaltLength get saltLength => $_getN(3);
  @$pb.TagNumber(7)
  set saltLength(SaltLength v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSaltLength() => $_has(3);
  @$pb.TagNumber(7)
  void clearSaltLength() => clearField(7);

  @$pb.TagNumber(9)
  $core.String get publicKey => $_getSZ(4);
  @$pb.TagNumber(9)
  set publicKey($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPublicKey() => $_has(4);
  @$pb.TagNumber(9)
  void clearPublicKey() => clearField(9);
}

class VerifyPSSBytesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyPSSBytesRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'signature',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message',
        $pb.PbFieldType.OY)
    ..e<Hash>(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash', $pb.PbFieldType.OE,
        defaultOrMaker: Hash.HASH_UNSPECIFIED,
        valueOf: Hash.valueOf,
        enumValues: Hash.values)
    ..e<SaltLength>(
        7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'saltLength', $pb.PbFieldType.OE,
        protoName: 'saltLength',
        defaultOrMaker: SaltLength.SALTLENGTH_UNSPECIFIED,
        valueOf: SaltLength.valueOf,
        enumValues: SaltLength.values)
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey', protoName: 'publicKey')
    ..hasRequiredFields = false;

  VerifyPSSBytesRequest._() : super();
  factory VerifyPSSBytesRequest({
    $core.List<$core.int> signature,
    $core.List<$core.int> message,
    Hash hash,
    SaltLength saltLength,
    $core.String publicKey,
  }) {
    final _result = create();
    if (signature != null) {
      _result.signature = signature;
    }
    if (message != null) {
      _result.message = message;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (saltLength != null) {
      _result.saltLength = saltLength;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    return _result;
  }
  factory VerifyPSSBytesRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VerifyPSSBytesRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VerifyPSSBytesRequest clone() =>
      VerifyPSSBytesRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VerifyPSSBytesRequest copyWith(
          void Function(VerifyPSSBytesRequest) updates) =>
      super.copyWith((message) => updates(
          message as VerifyPSSBytesRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyPSSBytesRequest create() => VerifyPSSBytesRequest._();
  VerifyPSSBytesRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyPSSBytesRequest> createRepeated() =>
      $pb.PbList<VerifyPSSBytesRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyPSSBytesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VerifyPSSBytesRequest>(create);
  static VerifyPSSBytesRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get signature => $_getN(0);
  @$pb.TagNumber(1)
  set signature($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => clearField(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get message => $_getN(1);
  @$pb.TagNumber(3)
  set message($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(5)
  Hash get hash => $_getN(2);
  @$pb.TagNumber(5)
  set hash(Hash v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHash() => $_has(2);
  @$pb.TagNumber(5)
  void clearHash() => clearField(5);

  @$pb.TagNumber(7)
  SaltLength get saltLength => $_getN(3);
  @$pb.TagNumber(7)
  set saltLength(SaltLength v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSaltLength() => $_has(3);
  @$pb.TagNumber(7)
  void clearSaltLength() => clearField(7);

  @$pb.TagNumber(9)
  $core.String get publicKey => $_getSZ(4);
  @$pb.TagNumber(9)
  set publicKey($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPublicKey() => $_has(4);
  @$pb.TagNumber(9)
  void clearPublicKey() => clearField(9);
}

class StringResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StringResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'output')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'error')
    ..hasRequiredFields = false;

  StringResponse._() : super();
  factory StringResponse({
    $core.String output,
    $core.String error,
  }) {
    final _result = create();
    if (output != null) {
      _result.output = output;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory StringResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StringResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StringResponse clone() => StringResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StringResponse copyWith(void Function(StringResponse) updates) =>
      super.copyWith((message) =>
          updates(message as StringResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StringResponse create() => StringResponse._();
  StringResponse createEmptyInstance() => create();
  static $pb.PbList<StringResponse> createRepeated() =>
      $pb.PbList<StringResponse>();
  @$core.pragma('dart2js:noInline')
  static StringResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StringResponse>(create);
  static StringResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get output => $_getSZ(0);
  @$pb.TagNumber(1)
  set output($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOutput() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutput() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(3)
  set error($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

class BytesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BytesResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'output',
        $pb.PbFieldType.OY)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'error')
    ..hasRequiredFields = false;

  BytesResponse._() : super();
  factory BytesResponse({
    $core.List<$core.int> output,
    $core.String error,
  }) {
    final _result = create();
    if (output != null) {
      _result.output = output;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory BytesResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BytesResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BytesResponse clone() => BytesResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BytesResponse copyWith(void Function(BytesResponse) updates) =>
      super.copyWith((message) =>
          updates(message as BytesResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BytesResponse create() => BytesResponse._();
  BytesResponse createEmptyInstance() => create();
  static $pb.PbList<BytesResponse> createRepeated() =>
      $pb.PbList<BytesResponse>();
  @$core.pragma('dart2js:noInline')
  static BytesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BytesResponse>(create);
  static BytesResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get output => $_getN(0);
  @$pb.TagNumber(1)
  set output($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOutput() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutput() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(3)
  set error($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

class BoolResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BoolResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'output')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'error')
    ..hasRequiredFields = false;

  BoolResponse._() : super();
  factory BoolResponse({
    $core.bool output,
    $core.String error,
  }) {
    final _result = create();
    if (output != null) {
      _result.output = output;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory BoolResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BoolResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BoolResponse clone() => BoolResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BoolResponse copyWith(void Function(BoolResponse) updates) =>
      super.copyWith((message) =>
          updates(message as BoolResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BoolResponse create() => BoolResponse._();
  BoolResponse createEmptyInstance() => create();
  static $pb.PbList<BoolResponse> createRepeated() =>
      $pb.PbList<BoolResponse>();
  @$core.pragma('dart2js:noInline')
  static BoolResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoolResponse>(create);
  static BoolResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get output => $_getBF(0);
  @$pb.TagNumber(1)
  set output($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOutput() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutput() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(3)
  set error($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

class PKCS12KeyPairResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PKCS12KeyPairResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOM<PKCS12KeyPair>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'output',
        subBuilder: PKCS12KeyPair.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'error')
    ..hasRequiredFields = false;

  PKCS12KeyPairResponse._() : super();
  factory PKCS12KeyPairResponse({
    PKCS12KeyPair output,
    $core.String error,
  }) {
    final _result = create();
    if (output != null) {
      _result.output = output;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory PKCS12KeyPairResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PKCS12KeyPairResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PKCS12KeyPairResponse clone() =>
      PKCS12KeyPairResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PKCS12KeyPairResponse copyWith(
          void Function(PKCS12KeyPairResponse) updates) =>
      super.copyWith((message) => updates(
          message as PKCS12KeyPairResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PKCS12KeyPairResponse create() => PKCS12KeyPairResponse._();
  PKCS12KeyPairResponse createEmptyInstance() => create();
  static $pb.PbList<PKCS12KeyPairResponse> createRepeated() =>
      $pb.PbList<PKCS12KeyPairResponse>();
  @$core.pragma('dart2js:noInline')
  static PKCS12KeyPairResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PKCS12KeyPairResponse>(create);
  static PKCS12KeyPairResponse _defaultInstance;

  @$pb.TagNumber(1)
  PKCS12KeyPair get output => $_getN(0);
  @$pb.TagNumber(1)
  set output(PKCS12KeyPair v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOutput() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutput() => clearField(1);
  @$pb.TagNumber(1)
  PKCS12KeyPair ensureOutput() => $_ensure(0);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(3)
  set error($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

class PKCS12KeyPair extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PKCS12KeyPair',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privateKey',
        protoName: 'privateKey')
    ..aOS(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey',
        protoName: 'publicKey')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'certificate')
    ..hasRequiredFields = false;

  PKCS12KeyPair._() : super();
  factory PKCS12KeyPair({
    $core.String privateKey,
    $core.String publicKey,
    $core.String certificate,
  }) {
    final _result = create();
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (certificate != null) {
      _result.certificate = certificate;
    }
    return _result;
  }
  factory PKCS12KeyPair.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PKCS12KeyPair.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PKCS12KeyPair clone() => PKCS12KeyPair()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PKCS12KeyPair copyWith(void Function(PKCS12KeyPair) updates) =>
      super.copyWith((message) =>
          updates(message as PKCS12KeyPair)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PKCS12KeyPair create() => PKCS12KeyPair._();
  PKCS12KeyPair createEmptyInstance() => create();
  static $pb.PbList<PKCS12KeyPair> createRepeated() =>
      $pb.PbList<PKCS12KeyPair>();
  @$core.pragma('dart2js:noInline')
  static PKCS12KeyPair getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PKCS12KeyPair>(create);
  static PKCS12KeyPair _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get privateKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set privateKey($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get publicKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set publicKey($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get certificate => $_getSZ(2);
  @$pb.TagNumber(3)
  set certificate($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCertificate() => $_has(2);
  @$pb.TagNumber(3)
  void clearCertificate() => clearField(3);
}

class KeyPairResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KeyPairResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOM<KeyPair>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'output',
        subBuilder: KeyPair.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'error')
    ..hasRequiredFields = false;

  KeyPairResponse._() : super();
  factory KeyPairResponse({
    KeyPair output,
    $core.String error,
  }) {
    final _result = create();
    if (output != null) {
      _result.output = output;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory KeyPairResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KeyPairResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KeyPairResponse clone() => KeyPairResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KeyPairResponse copyWith(void Function(KeyPairResponse) updates) =>
      super.copyWith((message) =>
          updates(message as KeyPairResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KeyPairResponse create() => KeyPairResponse._();
  KeyPairResponse createEmptyInstance() => create();
  static $pb.PbList<KeyPairResponse> createRepeated() =>
      $pb.PbList<KeyPairResponse>();
  @$core.pragma('dart2js:noInline')
  static KeyPairResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KeyPairResponse>(create);
  static KeyPairResponse _defaultInstance;

  @$pb.TagNumber(1)
  KeyPair get output => $_getN(0);
  @$pb.TagNumber(1)
  set output(KeyPair v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOutput() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutput() => clearField(1);
  @$pb.TagNumber(1)
  KeyPair ensureOutput() => $_ensure(0);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(3)
  set error($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

class KeyPair extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KeyPair',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privateKey',
        protoName: 'privateKey')
    ..aOS(2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey',
        protoName: 'publicKey')
    ..hasRequiredFields = false;

  KeyPair._() : super();
  factory KeyPair({
    $core.String privateKey,
    $core.String publicKey,
  }) {
    final _result = create();
    if (privateKey != null) {
      _result.privateKey = privateKey;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    return _result;
  }
  factory KeyPair.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KeyPair.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KeyPair clone() => KeyPair()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KeyPair copyWith(void Function(KeyPair) updates) =>
      super.copyWith((message) =>
          updates(message as KeyPair)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KeyPair create() => KeyPair._();
  KeyPair createEmptyInstance() => create();
  static $pb.PbList<KeyPair> createRepeated() => $pb.PbList<KeyPair>();
  @$core.pragma('dart2js:noInline')
  static KeyPair getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeyPair>(create);
  static KeyPair _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get privateKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set privateKey($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get publicKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set publicKey($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => clearField(2);
}

class PrivateKeyInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PrivateKeyInfoResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOM<PrivateKeyInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'output',
        subBuilder: PrivateKeyInfo.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'error')
    ..hasRequiredFields = false;

  PrivateKeyInfoResponse._() : super();
  factory PrivateKeyInfoResponse({
    PrivateKeyInfo output,
    $core.String error,
  }) {
    final _result = create();
    if (output != null) {
      _result.output = output;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory PrivateKeyInfoResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrivateKeyInfoResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrivateKeyInfoResponse clone() =>
      PrivateKeyInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrivateKeyInfoResponse copyWith(
          void Function(PrivateKeyInfoResponse) updates) =>
      super.copyWith((message) => updates(
          message as PrivateKeyInfoResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrivateKeyInfoResponse create() => PrivateKeyInfoResponse._();
  PrivateKeyInfoResponse createEmptyInstance() => create();
  static $pb.PbList<PrivateKeyInfoResponse> createRepeated() =>
      $pb.PbList<PrivateKeyInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static PrivateKeyInfoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrivateKeyInfoResponse>(create);
  static PrivateKeyInfoResponse _defaultInstance;

  @$pb.TagNumber(1)
  PrivateKeyInfo get output => $_getN(0);
  @$pb.TagNumber(1)
  set output(PrivateKeyInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOutput() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutput() => clearField(1);
  @$pb.TagNumber(1)
  PrivateKeyInfo ensureOutput() => $_ensure(0);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(3)
  set error($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

class PrivateKeyInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PrivateKeyInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bitLen',
        protoName: 'bitLen')
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false;

  PrivateKeyInfo._() : super();
  factory PrivateKeyInfo({
    $fixnum.Int64 bitLen,
    $fixnum.Int64 size,
    $core.String error,
  }) {
    final _result = create();
    if (bitLen != null) {
      _result.bitLen = bitLen;
    }
    if (size != null) {
      _result.size = size;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory PrivateKeyInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrivateKeyInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrivateKeyInfo clone() => PrivateKeyInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrivateKeyInfo copyWith(void Function(PrivateKeyInfo) updates) =>
      super.copyWith((message) =>
          updates(message as PrivateKeyInfo)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrivateKeyInfo create() => PrivateKeyInfo._();
  PrivateKeyInfo createEmptyInstance() => create();
  static $pb.PbList<PrivateKeyInfo> createRepeated() =>
      $pb.PbList<PrivateKeyInfo>();
  @$core.pragma('dart2js:noInline')
  static PrivateKeyInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrivateKeyInfo>(create);
  static PrivateKeyInfo _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get bitLen => $_getI64(0);
  @$pb.TagNumber(1)
  set bitLen($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBitLen() => $_has(0);
  @$pb.TagNumber(1)
  void clearBitLen() => clearField(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(1);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(3)
  void clearSize() => clearField(3);

  @$pb.TagNumber(5)
  $core.String get error => $_getSZ(2);
  @$pb.TagNumber(5)
  set error($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(5)
  void clearError() => clearField(5);
}

class PublicKeyInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PublicKeyInfoResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aOM<PublicKeyInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'output',
        subBuilder: PublicKeyInfo.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'error')
    ..hasRequiredFields = false;

  PublicKeyInfoResponse._() : super();
  factory PublicKeyInfoResponse({
    PublicKeyInfo output,
    $core.String error,
  }) {
    final _result = create();
    if (output != null) {
      _result.output = output;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory PublicKeyInfoResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PublicKeyInfoResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PublicKeyInfoResponse clone() =>
      PublicKeyInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PublicKeyInfoResponse copyWith(
          void Function(PublicKeyInfoResponse) updates) =>
      super.copyWith((message) => updates(
          message as PublicKeyInfoResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PublicKeyInfoResponse create() => PublicKeyInfoResponse._();
  PublicKeyInfoResponse createEmptyInstance() => create();
  static $pb.PbList<PublicKeyInfoResponse> createRepeated() =>
      $pb.PbList<PublicKeyInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static PublicKeyInfoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PublicKeyInfoResponse>(create);
  static PublicKeyInfoResponse _defaultInstance;

  @$pb.TagNumber(1)
  PublicKeyInfo get output => $_getN(0);
  @$pb.TagNumber(1)
  set output(PublicKeyInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOutput() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutput() => clearField(1);
  @$pb.TagNumber(1)
  PublicKeyInfo ensureOutput() => $_ensure(0);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(3)
  set error($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

class PublicKeyInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PublicKeyInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'model'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bitLen',
        protoName: 'bitLen')
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'e')
    ..hasRequiredFields = false;

  PublicKeyInfo._() : super();
  factory PublicKeyInfo({
    $fixnum.Int64 bitLen,
    $fixnum.Int64 size,
    $fixnum.Int64 e,
  }) {
    final _result = create();
    if (bitLen != null) {
      _result.bitLen = bitLen;
    }
    if (size != null) {
      _result.size = size;
    }
    if (e != null) {
      _result.e = e;
    }
    return _result;
  }
  factory PublicKeyInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PublicKeyInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PublicKeyInfo clone() => PublicKeyInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PublicKeyInfo copyWith(void Function(PublicKeyInfo) updates) =>
      super.copyWith((message) =>
          updates(message as PublicKeyInfo)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PublicKeyInfo create() => PublicKeyInfo._();
  PublicKeyInfo createEmptyInstance() => create();
  static $pb.PbList<PublicKeyInfo> createRepeated() =>
      $pb.PbList<PublicKeyInfo>();
  @$core.pragma('dart2js:noInline')
  static PublicKeyInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PublicKeyInfo>(create);
  static PublicKeyInfo _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get bitLen => $_getI64(0);
  @$pb.TagNumber(1)
  set bitLen($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBitLen() => $_has(0);
  @$pb.TagNumber(1)
  void clearBitLen() => clearField(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(1);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(3)
  void clearSize() => clearField(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get e => $_getI64(2);
  @$pb.TagNumber(5)
  set e($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasE() => $_has(2);
  @$pb.TagNumber(5)
  void clearE() => clearField(5);
}
