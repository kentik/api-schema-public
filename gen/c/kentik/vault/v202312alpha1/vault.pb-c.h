/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/vault/v202312alpha1/vault.proto */

#ifndef PROTOBUF_C_kentik_2fvault_2fv202312alpha1_2fvault_2eproto__INCLUDED
#define PROTOBUF_C_kentik_2fvault_2fv202312alpha1_2fvault_2eproto__INCLUDED

#include <protobuf-c/protobuf-c.h>

PROTOBUF_C__BEGIN_DECLS

#if PROTOBUF_C_VERSION_NUMBER < 1003000
# error This file was generated by a newer version of protoc-c which is incompatible with your libprotobuf-c headers. Please update your headers.
#elif 1004001 < PROTOBUF_C_MIN_COMPILER_VERSION
# error This file was generated by an older version of protoc-c which is incompatible with your libprotobuf-c headers. Please regenerate this file with a newer version of protoc-c.
#endif

#include "google/api/annotations.pb-c.h"
#include "google/api/client.pb-c.h"
#include "google/api/field_behavior.pb-c.h"
#include "google/protobuf/timestamp.pb-c.h"
#include "protoc-gen-openapiv2/options/annotations.pb-c.h"
#include "kentik/core/v202303/annotations.pb-c.h"

typedef struct Kentik__Vault__V202312alpha1__Secret Kentik__Vault__V202312alpha1__Secret;
typedef struct Kentik__Vault__V202312alpha1__GetSecretRequest Kentik__Vault__V202312alpha1__GetSecretRequest;
typedef struct Kentik__Vault__V202312alpha1__GetSecretResponse Kentik__Vault__V202312alpha1__GetSecretResponse;
typedef struct Kentik__Vault__V202312alpha1__ListSecretRequest Kentik__Vault__V202312alpha1__ListSecretRequest;
typedef struct Kentik__Vault__V202312alpha1__ListSecretResponse Kentik__Vault__V202312alpha1__ListSecretResponse;


/* --- enums --- */

/*
 * {{.Name}}
 */
typedef enum _Kentik__Vault__V202312alpha1__SecretType {
  KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_UNSPECIFIED = 0,
  KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_BASIC_AUTH = 1,
  KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_SNMP_V1 = 2,
  KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_SNMP_V2C = 3,
  KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_SNMP_V3 = 4,
  KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_STREAMING_TELEMETRY = 5,
  KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_BGP_MD5 = 6,
  KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_API_TOKEN = 7,
  KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_OTHER = 8
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE)
} Kentik__Vault__V202312alpha1__SecretType;

/* --- messages --- */

/*
 * {{.Name}}
 */
struct  Kentik__Vault__V202312alpha1__Secret
{
  ProtobufCMessage base;
  char *name;
  char *value;
  uint32_t version;
  char *description;
  Kentik__Vault__V202312alpha1__SecretType type;
  char *id;
};
#define KENTIK__VAULT__V202312ALPHA1__SECRET__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__vault__v202312alpha1__secret__descriptor) \
    , (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, 0, (char *)protobuf_c_empty_string, KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_UNSPECIFIED, (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  Kentik__Vault__V202312alpha1__GetSecretRequest
{
  ProtobufCMessage base;
  char *name;
};
#define KENTIK__VAULT__V202312ALPHA1__GET_SECRET_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__vault__v202312alpha1__get_secret_request__descriptor) \
    , (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  Kentik__Vault__V202312alpha1__GetSecretResponse
{
  ProtobufCMessage base;
  Kentik__Vault__V202312alpha1__Secret *secret;
};
#define KENTIK__VAULT__V202312ALPHA1__GET_SECRET_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__vault__v202312alpha1__get_secret_response__descriptor) \
    , NULL }


/*
 * {{.Name}}
 */
struct  Kentik__Vault__V202312alpha1__ListSecretRequest
{
  ProtobufCMessage base;
  size_t n_names;
  char **names;
};
#define KENTIK__VAULT__V202312ALPHA1__LIST_SECRET_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__vault__v202312alpha1__list_secret_request__descriptor) \
    , 0,NULL }


struct  Kentik__Vault__V202312alpha1__ListSecretResponse
{
  ProtobufCMessage base;
  size_t n_secrets;
  Kentik__Vault__V202312alpha1__Secret **secrets;
  uint32_t invalid_credential_count;
};
#define KENTIK__VAULT__V202312ALPHA1__LIST_SECRET_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__vault__v202312alpha1__list_secret_response__descriptor) \
    , 0,NULL, 0 }


/* Kentik__Vault__V202312alpha1__Secret methods */
void   kentik__vault__v202312alpha1__secret__init
                     (Kentik__Vault__V202312alpha1__Secret         *message);
size_t kentik__vault__v202312alpha1__secret__get_packed_size
                     (const Kentik__Vault__V202312alpha1__Secret   *message);
size_t kentik__vault__v202312alpha1__secret__pack
                     (const Kentik__Vault__V202312alpha1__Secret   *message,
                      uint8_t             *out);
size_t kentik__vault__v202312alpha1__secret__pack_to_buffer
                     (const Kentik__Vault__V202312alpha1__Secret   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Vault__V202312alpha1__Secret *
       kentik__vault__v202312alpha1__secret__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__vault__v202312alpha1__secret__free_unpacked
                     (Kentik__Vault__V202312alpha1__Secret *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Vault__V202312alpha1__GetSecretRequest methods */
void   kentik__vault__v202312alpha1__get_secret_request__init
                     (Kentik__Vault__V202312alpha1__GetSecretRequest         *message);
size_t kentik__vault__v202312alpha1__get_secret_request__get_packed_size
                     (const Kentik__Vault__V202312alpha1__GetSecretRequest   *message);
size_t kentik__vault__v202312alpha1__get_secret_request__pack
                     (const Kentik__Vault__V202312alpha1__GetSecretRequest   *message,
                      uint8_t             *out);
size_t kentik__vault__v202312alpha1__get_secret_request__pack_to_buffer
                     (const Kentik__Vault__V202312alpha1__GetSecretRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Vault__V202312alpha1__GetSecretRequest *
       kentik__vault__v202312alpha1__get_secret_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__vault__v202312alpha1__get_secret_request__free_unpacked
                     (Kentik__Vault__V202312alpha1__GetSecretRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Vault__V202312alpha1__GetSecretResponse methods */
void   kentik__vault__v202312alpha1__get_secret_response__init
                     (Kentik__Vault__V202312alpha1__GetSecretResponse         *message);
size_t kentik__vault__v202312alpha1__get_secret_response__get_packed_size
                     (const Kentik__Vault__V202312alpha1__GetSecretResponse   *message);
size_t kentik__vault__v202312alpha1__get_secret_response__pack
                     (const Kentik__Vault__V202312alpha1__GetSecretResponse   *message,
                      uint8_t             *out);
size_t kentik__vault__v202312alpha1__get_secret_response__pack_to_buffer
                     (const Kentik__Vault__V202312alpha1__GetSecretResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Vault__V202312alpha1__GetSecretResponse *
       kentik__vault__v202312alpha1__get_secret_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__vault__v202312alpha1__get_secret_response__free_unpacked
                     (Kentik__Vault__V202312alpha1__GetSecretResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Vault__V202312alpha1__ListSecretRequest methods */
void   kentik__vault__v202312alpha1__list_secret_request__init
                     (Kentik__Vault__V202312alpha1__ListSecretRequest         *message);
size_t kentik__vault__v202312alpha1__list_secret_request__get_packed_size
                     (const Kentik__Vault__V202312alpha1__ListSecretRequest   *message);
size_t kentik__vault__v202312alpha1__list_secret_request__pack
                     (const Kentik__Vault__V202312alpha1__ListSecretRequest   *message,
                      uint8_t             *out);
size_t kentik__vault__v202312alpha1__list_secret_request__pack_to_buffer
                     (const Kentik__Vault__V202312alpha1__ListSecretRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Vault__V202312alpha1__ListSecretRequest *
       kentik__vault__v202312alpha1__list_secret_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__vault__v202312alpha1__list_secret_request__free_unpacked
                     (Kentik__Vault__V202312alpha1__ListSecretRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Vault__V202312alpha1__ListSecretResponse methods */
void   kentik__vault__v202312alpha1__list_secret_response__init
                     (Kentik__Vault__V202312alpha1__ListSecretResponse         *message);
size_t kentik__vault__v202312alpha1__list_secret_response__get_packed_size
                     (const Kentik__Vault__V202312alpha1__ListSecretResponse   *message);
size_t kentik__vault__v202312alpha1__list_secret_response__pack
                     (const Kentik__Vault__V202312alpha1__ListSecretResponse   *message,
                      uint8_t             *out);
size_t kentik__vault__v202312alpha1__list_secret_response__pack_to_buffer
                     (const Kentik__Vault__V202312alpha1__ListSecretResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Vault__V202312alpha1__ListSecretResponse *
       kentik__vault__v202312alpha1__list_secret_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__vault__v202312alpha1__list_secret_response__free_unpacked
                     (Kentik__Vault__V202312alpha1__ListSecretResponse *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Kentik__Vault__V202312alpha1__Secret_Closure)
                 (const Kentik__Vault__V202312alpha1__Secret *message,
                  void *closure_data);
typedef void (*Kentik__Vault__V202312alpha1__GetSecretRequest_Closure)
                 (const Kentik__Vault__V202312alpha1__GetSecretRequest *message,
                  void *closure_data);
typedef void (*Kentik__Vault__V202312alpha1__GetSecretResponse_Closure)
                 (const Kentik__Vault__V202312alpha1__GetSecretResponse *message,
                  void *closure_data);
typedef void (*Kentik__Vault__V202312alpha1__ListSecretRequest_Closure)
                 (const Kentik__Vault__V202312alpha1__ListSecretRequest *message,
                  void *closure_data);
typedef void (*Kentik__Vault__V202312alpha1__ListSecretResponse_Closure)
                 (const Kentik__Vault__V202312alpha1__ListSecretResponse *message,
                  void *closure_data);

/* --- services --- */

typedef struct Kentik__Vault__V202312alpha1__VaultService_Service Kentik__Vault__V202312alpha1__VaultService_Service;
struct Kentik__Vault__V202312alpha1__VaultService_Service
{
  ProtobufCService base;
  void (*get_secret)(Kentik__Vault__V202312alpha1__VaultService_Service *service,
                     const Kentik__Vault__V202312alpha1__GetSecretRequest *input,
                     Kentik__Vault__V202312alpha1__GetSecretResponse_Closure closure,
                     void *closure_data);
  void (*list_secret)(Kentik__Vault__V202312alpha1__VaultService_Service *service,
                      const Kentik__Vault__V202312alpha1__ListSecretRequest *input,
                      Kentik__Vault__V202312alpha1__ListSecretResponse_Closure closure,
                      void *closure_data);
};
typedef void (*Kentik__Vault__V202312alpha1__VaultService_ServiceDestroy)(Kentik__Vault__V202312alpha1__VaultService_Service *);
void kentik__vault__v202312alpha1__vault_service__init (Kentik__Vault__V202312alpha1__VaultService_Service *service,
                                                        Kentik__Vault__V202312alpha1__VaultService_ServiceDestroy destroy);
#define KENTIK__VAULT__V202312ALPHA1__VAULT_SERVICE__BASE_INIT \
    { &kentik__vault__v202312alpha1__vault_service__descriptor, protobuf_c_service_invoke_internal, NULL }
#define KENTIK__VAULT__V202312ALPHA1__VAULT_SERVICE__INIT(function_prefix__) \
    { KENTIK__VAULT__V202312ALPHA1__VAULT_SERVICE__BASE_INIT,\
      function_prefix__ ## get_secret,\
      function_prefix__ ## list_secret  }
void kentik__vault__v202312alpha1__vault_service__get_secret(ProtobufCService *service,
                                                             const Kentik__Vault__V202312alpha1__GetSecretRequest *input,
                                                             Kentik__Vault__V202312alpha1__GetSecretResponse_Closure closure,
                                                             void *closure_data);
void kentik__vault__v202312alpha1__vault_service__list_secret(ProtobufCService *service,
                                                              const Kentik__Vault__V202312alpha1__ListSecretRequest *input,
                                                              Kentik__Vault__V202312alpha1__ListSecretResponse_Closure closure,
                                                              void *closure_data);

/* --- descriptors --- */

extern const ProtobufCEnumDescriptor    kentik__vault__v202312alpha1__secret_type__descriptor;
extern const ProtobufCMessageDescriptor kentik__vault__v202312alpha1__secret__descriptor;
extern const ProtobufCMessageDescriptor kentik__vault__v202312alpha1__get_secret_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__vault__v202312alpha1__get_secret_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__vault__v202312alpha1__list_secret_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__vault__v202312alpha1__list_secret_response__descriptor;
extern const ProtobufCServiceDescriptor kentik__vault__v202312alpha1__vault_service__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_kentik_2fvault_2fv202312alpha1_2fvault_2eproto__INCLUDED */