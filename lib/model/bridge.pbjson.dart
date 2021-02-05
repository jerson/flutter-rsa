///
//  Generated code. Do not modify.
//  source: bridge.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const SaltLength$json = const {
  '1': 'SaltLength',
  '2': const [
    const {'1': 'SALTLENGTH_UNSPECIFIED', '2': 0},
    const {'1': 'SALTLENGTH_AUTO', '2': 1},
    const {'1': 'SALTLENGTH_EQUALS_HASH', '2': 2},
  ],
};

const PEMCipher$json = const {
  '1': 'PEMCipher',
  '2': const [
    const {'1': 'PEMCIPHER_UNSPECIFIED', '2': 0},
    const {'1': 'PEMCIPHER_DES', '2': 1},
    const {'1': 'PEMCIPHER_3DES', '2': 2},
    const {'1': 'PEMCIPHER_AES128', '2': 3},
    const {'1': 'PEMCIPHER_AES192', '2': 4},
    const {'1': 'PEMCIPHER_AES256', '2': 5},
  ],
};

const Hash$json = const {
  '1': 'Hash',
  '2': const [
    const {'1': 'HASH_UNSPECIFIED', '2': 0},
    const {'1': 'HASH_MD5', '2': 1},
    const {'1': 'HASH_SHA1', '2': 2},
    const {'1': 'HASH_SHA224', '2': 3},
    const {'1': 'HASH_SHA256', '2': 4},
    const {'1': 'HASH_SHA384', '2': 5},
    const {'1': 'HASH_SHA512', '2': 6},
  ],
};

const ConvertJWTRequest$json = const {
  '1': 'ConvertJWTRequest',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 9, '10': 'data'},
    const {'1': 'keyId', '3': 3, '4': 1, '5': 9, '10': 'keyId'},
  ],
};

const ConvertKeyPairRequest$json = const {
  '1': 'ConvertKeyPairRequest',
  '2': const [
    const {'1': 'privateKey', '3': 1, '4': 1, '5': 9, '10': 'privateKey'},
    const {'1': 'certificate', '3': 3, '4': 1, '5': 9, '10': 'certificate'},
    const {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
  ],
};

const ConvertPKCS12Request$json = const {
  '1': 'ConvertPKCS12Request',
  '2': const [
    const {'1': 'pkcs12', '3': 1, '4': 1, '5': 9, '10': 'pkcs12'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

const ConvertPrivateKeyRequest$json = const {
  '1': 'ConvertPrivateKeyRequest',
  '2': const [
    const {'1': 'privateKey', '3': 1, '4': 1, '5': 9, '10': 'privateKey'},
  ],
};

const ConvertPublicKeyRequest$json = const {
  '1': 'ConvertPublicKeyRequest',
  '2': const [
    const {'1': 'publicKey', '3': 1, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

const DecryptOAEPRequest$json = const {
  '1': 'DecryptOAEPRequest',
  '2': const [
    const {'1': 'ciphertext', '3': 1, '4': 1, '5': 9, '10': 'ciphertext'},
    const {'1': 'label', '3': 3, '4': 1, '5': 9, '10': 'label'},
    const {
      '1': 'hash',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.model.Hash',
      '10': 'hash'
    },
    const {'1': 'privateKey', '3': 7, '4': 1, '5': 9, '10': 'privateKey'},
  ],
};

const DecryptOAEPBytesRequest$json = const {
  '1': 'DecryptOAEPBytesRequest',
  '2': const [
    const {'1': 'ciphertext', '3': 1, '4': 1, '5': 12, '10': 'ciphertext'},
    const {'1': 'label', '3': 3, '4': 1, '5': 9, '10': 'label'},
    const {
      '1': 'hash',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.model.Hash',
      '10': 'hash'
    },
    const {'1': 'privateKey', '3': 7, '4': 1, '5': 9, '10': 'privateKey'},
  ],
};

const DecryptPKCS1v15Request$json = const {
  '1': 'DecryptPKCS1v15Request',
  '2': const [
    const {'1': 'ciphertext', '3': 1, '4': 1, '5': 9, '10': 'ciphertext'},
    const {'1': 'privateKey', '3': 3, '4': 1, '5': 9, '10': 'privateKey'},
  ],
};

const DecryptPKCS1v15BytesRequest$json = const {
  '1': 'DecryptPKCS1v15BytesRequest',
  '2': const [
    const {'1': 'ciphertext', '3': 1, '4': 1, '5': 12, '10': 'ciphertext'},
    const {'1': 'privateKey', '3': 3, '4': 1, '5': 9, '10': 'privateKey'},
  ],
};

const DecryptPrivateKeyRequest$json = const {
  '1': 'DecryptPrivateKeyRequest',
  '2': const [
    const {
      '1': 'privateKeyEncrypted',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'privateKeyEncrypted'
    },
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

const EncryptOAEPRequest$json = const {
  '1': 'EncryptOAEPRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'label', '3': 3, '4': 1, '5': 9, '10': 'label'},
    const {
      '1': 'hash',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.model.Hash',
      '10': 'hash'
    },
    const {'1': 'publicKey', '3': 7, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

const EncryptOAEPBytesRequest$json = const {
  '1': 'EncryptOAEPBytesRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 12, '10': 'message'},
    const {'1': 'label', '3': 3, '4': 1, '5': 9, '10': 'label'},
    const {
      '1': 'hash',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.model.Hash',
      '10': 'hash'
    },
    const {'1': 'publicKey', '3': 7, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

const EncryptPKCS1v15Request$json = const {
  '1': 'EncryptPKCS1v15Request',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'publicKey', '3': 3, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

const EncryptPKCS1v15BytesRequest$json = const {
  '1': 'EncryptPKCS1v15BytesRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 12, '10': 'message'},
    const {'1': 'publicKey', '3': 3, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

const EncryptPrivateKeyRequest$json = const {
  '1': 'EncryptPrivateKeyRequest',
  '2': const [
    const {'1': 'privateKey', '3': 1, '4': 1, '5': 9, '10': 'privateKey'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    const {
      '1': 'cipher',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.model.PEMCipher',
      '10': 'cipher'
    },
  ],
};

const GenerateRequest$json = const {
  '1': 'GenerateRequest',
  '2': const [
    const {'1': 'nBits', '3': 1, '4': 1, '5': 5, '10': 'nBits'},
  ],
};

const HashRequest$json = const {
  '1': 'HashRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {
      '1': 'hash',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.model.Hash',
      '10': 'hash'
    },
  ],
};

const Base64Request$json = const {
  '1': 'Base64Request',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

const MetadataPrivateKeyRequest$json = const {
  '1': 'MetadataPrivateKeyRequest',
  '2': const [
    const {'1': 'privateKey', '3': 1, '4': 1, '5': 9, '10': 'privateKey'},
  ],
};

const MetadataPublicKeyRequest$json = const {
  '1': 'MetadataPublicKeyRequest',
  '2': const [
    const {'1': 'publicKey', '3': 1, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

const SignPKCS1v15Request$json = const {
  '1': 'SignPKCS1v15Request',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {
      '1': 'hash',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.model.Hash',
      '10': 'hash'
    },
    const {'1': 'privateKey', '3': 5, '4': 1, '5': 9, '10': 'privateKey'},
  ],
};

const SignPKCS1v15BytesRequest$json = const {
  '1': 'SignPKCS1v15BytesRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 12, '10': 'message'},
    const {
      '1': 'hash',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.model.Hash',
      '10': 'hash'
    },
    const {'1': 'privateKey', '3': 5, '4': 1, '5': 9, '10': 'privateKey'},
  ],
};

const SignPSSRequest$json = const {
  '1': 'SignPSSRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {
      '1': 'hash',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.model.Hash',
      '10': 'hash'
    },
    const {
      '1': 'saltLength',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.model.SaltLength',
      '10': 'saltLength'
    },
    const {'1': 'privateKey', '3': 7, '4': 1, '5': 9, '10': 'privateKey'},
  ],
};

const SignPSSBytesRequest$json = const {
  '1': 'SignPSSBytesRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 12, '10': 'message'},
    const {
      '1': 'hash',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.model.Hash',
      '10': 'hash'
    },
    const {
      '1': 'saltLength',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.model.SaltLength',
      '10': 'saltLength'
    },
    const {'1': 'privateKey', '3': 7, '4': 1, '5': 9, '10': 'privateKey'},
  ],
};

const VerifyPKCS1v15Request$json = const {
  '1': 'VerifyPKCS1v15Request',
  '2': const [
    const {'1': 'signature', '3': 1, '4': 1, '5': 9, '10': 'signature'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {
      '1': 'hash',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.model.Hash',
      '10': 'hash'
    },
    const {'1': 'publicKey', '3': 7, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

const VerifyPKCS1v15BytesRequest$json = const {
  '1': 'VerifyPKCS1v15BytesRequest',
  '2': const [
    const {'1': 'signature', '3': 1, '4': 1, '5': 12, '10': 'signature'},
    const {'1': 'message', '3': 3, '4': 1, '5': 12, '10': 'message'},
    const {
      '1': 'hash',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.model.Hash',
      '10': 'hash'
    },
    const {'1': 'publicKey', '3': 7, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

const VerifyPSSRequest$json = const {
  '1': 'VerifyPSSRequest',
  '2': const [
    const {'1': 'signature', '3': 1, '4': 1, '5': 9, '10': 'signature'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {
      '1': 'hash',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.model.Hash',
      '10': 'hash'
    },
    const {
      '1': 'saltLength',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.model.SaltLength',
      '10': 'saltLength'
    },
    const {'1': 'publicKey', '3': 9, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

const VerifyPSSBytesRequest$json = const {
  '1': 'VerifyPSSBytesRequest',
  '2': const [
    const {'1': 'signature', '3': 1, '4': 1, '5': 12, '10': 'signature'},
    const {'1': 'message', '3': 3, '4': 1, '5': 12, '10': 'message'},
    const {
      '1': 'hash',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.model.Hash',
      '10': 'hash'
    },
    const {
      '1': 'saltLength',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.model.SaltLength',
      '10': 'saltLength'
    },
    const {'1': 'publicKey', '3': 9, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

const StringResponse$json = const {
  '1': 'StringResponse',
  '2': const [
    const {'1': 'output', '3': 1, '4': 1, '5': 9, '10': 'output'},
    const {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

const BytesResponse$json = const {
  '1': 'BytesResponse',
  '2': const [
    const {'1': 'output', '3': 1, '4': 1, '5': 12, '10': 'output'},
    const {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

const BoolResponse$json = const {
  '1': 'BoolResponse',
  '2': const [
    const {'1': 'output', '3': 1, '4': 1, '5': 8, '10': 'output'},
    const {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

const PKCS12KeyPairResponse$json = const {
  '1': 'PKCS12KeyPairResponse',
  '2': const [
    const {
      '1': 'output',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.model.PKCS12KeyPair',
      '10': 'output'
    },
    const {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

const PKCS12KeyPair$json = const {
  '1': 'PKCS12KeyPair',
  '2': const [
    const {'1': 'privateKey', '3': 1, '4': 1, '5': 9, '10': 'privateKey'},
    const {'1': 'publicKey', '3': 2, '4': 1, '5': 9, '10': 'publicKey'},
    const {'1': 'certificate', '3': 3, '4': 1, '5': 9, '10': 'certificate'},
  ],
};

const KeyPairResponse$json = const {
  '1': 'KeyPairResponse',
  '2': const [
    const {
      '1': 'output',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.model.KeyPair',
      '10': 'output'
    },
    const {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

const KeyPair$json = const {
  '1': 'KeyPair',
  '2': const [
    const {'1': 'privateKey', '3': 1, '4': 1, '5': 9, '10': 'privateKey'},
    const {'1': 'publicKey', '3': 2, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

const PrivateKeyInfoResponse$json = const {
  '1': 'PrivateKeyInfoResponse',
  '2': const [
    const {
      '1': 'output',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.model.PrivateKeyInfo',
      '10': 'output'
    },
    const {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

const PrivateKeyInfo$json = const {
  '1': 'PrivateKeyInfo',
  '2': const [
    const {'1': 'bitLen', '3': 1, '4': 1, '5': 3, '10': 'bitLen'},
    const {'1': 'size', '3': 3, '4': 1, '5': 3, '10': 'size'},
    const {'1': 'error', '3': 5, '4': 1, '5': 9, '10': 'error'},
  ],
};

const PublicKeyInfoResponse$json = const {
  '1': 'PublicKeyInfoResponse',
  '2': const [
    const {
      '1': 'output',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.model.PublicKeyInfo',
      '10': 'output'
    },
    const {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

const PublicKeyInfo$json = const {
  '1': 'PublicKeyInfo',
  '2': const [
    const {'1': 'bitLen', '3': 1, '4': 1, '5': 3, '10': 'bitLen'},
    const {'1': 'size', '3': 3, '4': 1, '5': 3, '10': 'size'},
    const {'1': 'e', '3': 5, '4': 1, '5': 3, '10': 'e'},
  ],
};
