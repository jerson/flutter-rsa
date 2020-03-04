#include "rsa_bridge.h"
#include <iostream>

KeyPair *buildKeyPair(char * publicKey,char * privateKey)
{
  KeyPair *keyPair;
  keyPair->publicKey = publicKey;
  keyPair->privateKey = privateKey;
  return keyPair;
}

void errorGenerateThrow(char * message)
{
  throw message;
}