#ifndef C_MONGOSOCKET_H
#define C_MONGOSOCKET_H

#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/err.h>
#include <openssl/bio.h>
#include <openssl/ssl.h>
#include <openssl/sha.h>
#include <openssl/md5.h>
#include <openssl/hmac.h>
#include <openssl/rand.h>
#include <openssl/pkcs12.h>
#include <openssl/x509v3.h>

void COpenKittenSSL_init();
const SSL_METHOD *COpenKittenSSL_client_method();

#endif