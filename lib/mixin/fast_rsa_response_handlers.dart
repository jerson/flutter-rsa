import 'dart:typed_data';

import 'package:fast_rsa/fast_rsa.dart';
import 'package:fast_rsa/model/bridge_model_generated.dart' as model;

mixin RSAResponseHandlers {
  static Uint8List bytesResponse(Uint8List data) {
    var response = model.BytesResponse(data);
    if (response.error != null && response.error != "") {
      throw RSAException(response.error!);
    }
    return Uint8List.fromList(response.output!);
  }

  static String stringResponse(Uint8List data) {
    var response = model.StringResponse(data);
    if (response.error != null && response.error != "") {
      throw RSAException(response.error!);
    }
    return response.output!;
  }

  static bool boolResponse(Uint8List data) {
    var response = model.BoolResponse(data);
    if (response.error != null && response.error != "") {
      throw RSAException(response.error!);
    }
    return response.output;
  }

  static KeyPair keyPairResponse(Uint8List data) {
    var response = model.KeyPairResponse(data);
    if (response.error != null && response.error != "") {
      throw RSAException(response.error!);
    }
    var output = response.output!;
    return KeyPair(output.publicKey!, output.privateKey!);
  }

  static PKCS12KeyPair pkcs12KeyPairResponse(Uint8List data) {
    var response = model.Pkcs12KeyPairResponse(data);
    if (response.error != null && response.error != "") {
      throw RSAException(response.error!);
    }
    var output = response.output!;
    return PKCS12KeyPair(
        output.publicKey!, output.privateKey!, output.certificate!);
  }
}
