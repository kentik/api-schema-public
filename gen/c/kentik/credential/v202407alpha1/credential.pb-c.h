/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/credential/v202407alpha1/credential.proto */

#ifndef PROTOBUF_C_kentik_2fcredential_2fv202407alpha1_2fcredential_2eproto__INCLUDED
#define PROTOBUF_C_kentik_2fcredential_2fv202407alpha1_2fcredential_2eproto__INCLUDED

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
#include "kentik/user/v202211/user.pb-c.h"
#include "kentik/vault/v202312alpha1/vault.pb-c.h"

typedef struct Kentik__Credential__V202407alpha1__CredentialGroup Kentik__Credential__V202407alpha1__CredentialGroup;
typedef struct Kentik__Credential__V202407alpha1__GetCredentialGroupRequest Kentik__Credential__V202407alpha1__GetCredentialGroupRequest;
typedef struct Kentik__Credential__V202407alpha1__GetCredentialGroupResponse Kentik__Credential__V202407alpha1__GetCredentialGroupResponse;
typedef struct Kentik__Credential__V202407alpha1__ListCredentialGroupRequest Kentik__Credential__V202407alpha1__ListCredentialGroupRequest;
typedef struct Kentik__Credential__V202407alpha1__ListCredentialGroupResponse Kentik__Credential__V202407alpha1__ListCredentialGroupResponse;


/* --- enums --- */


/* --- messages --- */

struct  Kentik__Credential__V202407alpha1__CredentialGroup
{
  ProtobufCMessage base;
  char *id;
  char *name;
  uint32_t version;
  char *description;
  Kentik__Vault__V202312alpha1__SecretType type;
  Google__Protobuf__Timestamp *cdate;
  Google__Protobuf__Timestamp *edate;
  Kentik__User__V202211__User *created_by;
  size_t n_credentials;
  Kentik__Vault__V202312alpha1__Secret **credentials;
  size_t n_labels;
  char **labels;
};
#define KENTIK__CREDENTIAL__V202407ALPHA1__CREDENTIAL_GROUP__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__credential__v202407alpha1__credential_group__descriptor) \
    , (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, 0, (char *)protobuf_c_empty_string, KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_UNSPECIFIED, NULL, NULL, NULL, 0,NULL, 0,NULL }


/*
 * {{.Name}}
 */
struct  Kentik__Credential__V202407alpha1__GetCredentialGroupRequest
{
  ProtobufCMessage base;
  char *id;
};
#define KENTIK__CREDENTIAL__V202407ALPHA1__GET_CREDENTIAL_GROUP_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__credential__v202407alpha1__get_credential_group_request__descriptor) \
    , (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  Kentik__Credential__V202407alpha1__GetCredentialGroupResponse
{
  ProtobufCMessage base;
  Kentik__Credential__V202407alpha1__CredentialGroup *group;
};
#define KENTIK__CREDENTIAL__V202407ALPHA1__GET_CREDENTIAL_GROUP_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__credential__v202407alpha1__get_credential_group_response__descriptor) \
    , NULL }


/*
 * {{.Name}}
 */
struct  Kentik__Credential__V202407alpha1__ListCredentialGroupRequest
{
  ProtobufCMessage base;
};
#define KENTIK__CREDENTIAL__V202407ALPHA1__LIST_CREDENTIAL_GROUP_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__credential__v202407alpha1__list_credential_group_request__descriptor) \
     }


/*
 * {{.Name}}
 */
struct  Kentik__Credential__V202407alpha1__ListCredentialGroupResponse
{
  ProtobufCMessage base;
  size_t n_groups;
  Kentik__Credential__V202407alpha1__CredentialGroup **groups;
  uint32_t invalid_count;
};
#define KENTIK__CREDENTIAL__V202407ALPHA1__LIST_CREDENTIAL_GROUP_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__credential__v202407alpha1__list_credential_group_response__descriptor) \
    , 0,NULL, 0 }


/* Kentik__Credential__V202407alpha1__CredentialGroup methods */
void   kentik__credential__v202407alpha1__credential_group__init
                     (Kentik__Credential__V202407alpha1__CredentialGroup         *message);
size_t kentik__credential__v202407alpha1__credential_group__get_packed_size
                     (const Kentik__Credential__V202407alpha1__CredentialGroup   *message);
size_t kentik__credential__v202407alpha1__credential_group__pack
                     (const Kentik__Credential__V202407alpha1__CredentialGroup   *message,
                      uint8_t             *out);
size_t kentik__credential__v202407alpha1__credential_group__pack_to_buffer
                     (const Kentik__Credential__V202407alpha1__CredentialGroup   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Credential__V202407alpha1__CredentialGroup *
       kentik__credential__v202407alpha1__credential_group__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__credential__v202407alpha1__credential_group__free_unpacked
                     (Kentik__Credential__V202407alpha1__CredentialGroup *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Credential__V202407alpha1__GetCredentialGroupRequest methods */
void   kentik__credential__v202407alpha1__get_credential_group_request__init
                     (Kentik__Credential__V202407alpha1__GetCredentialGroupRequest         *message);
size_t kentik__credential__v202407alpha1__get_credential_group_request__get_packed_size
                     (const Kentik__Credential__V202407alpha1__GetCredentialGroupRequest   *message);
size_t kentik__credential__v202407alpha1__get_credential_group_request__pack
                     (const Kentik__Credential__V202407alpha1__GetCredentialGroupRequest   *message,
                      uint8_t             *out);
size_t kentik__credential__v202407alpha1__get_credential_group_request__pack_to_buffer
                     (const Kentik__Credential__V202407alpha1__GetCredentialGroupRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Credential__V202407alpha1__GetCredentialGroupRequest *
       kentik__credential__v202407alpha1__get_credential_group_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__credential__v202407alpha1__get_credential_group_request__free_unpacked
                     (Kentik__Credential__V202407alpha1__GetCredentialGroupRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Credential__V202407alpha1__GetCredentialGroupResponse methods */
void   kentik__credential__v202407alpha1__get_credential_group_response__init
                     (Kentik__Credential__V202407alpha1__GetCredentialGroupResponse         *message);
size_t kentik__credential__v202407alpha1__get_credential_group_response__get_packed_size
                     (const Kentik__Credential__V202407alpha1__GetCredentialGroupResponse   *message);
size_t kentik__credential__v202407alpha1__get_credential_group_response__pack
                     (const Kentik__Credential__V202407alpha1__GetCredentialGroupResponse   *message,
                      uint8_t             *out);
size_t kentik__credential__v202407alpha1__get_credential_group_response__pack_to_buffer
                     (const Kentik__Credential__V202407alpha1__GetCredentialGroupResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Credential__V202407alpha1__GetCredentialGroupResponse *
       kentik__credential__v202407alpha1__get_credential_group_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__credential__v202407alpha1__get_credential_group_response__free_unpacked
                     (Kentik__Credential__V202407alpha1__GetCredentialGroupResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Credential__V202407alpha1__ListCredentialGroupRequest methods */
void   kentik__credential__v202407alpha1__list_credential_group_request__init
                     (Kentik__Credential__V202407alpha1__ListCredentialGroupRequest         *message);
size_t kentik__credential__v202407alpha1__list_credential_group_request__get_packed_size
                     (const Kentik__Credential__V202407alpha1__ListCredentialGroupRequest   *message);
size_t kentik__credential__v202407alpha1__list_credential_group_request__pack
                     (const Kentik__Credential__V202407alpha1__ListCredentialGroupRequest   *message,
                      uint8_t             *out);
size_t kentik__credential__v202407alpha1__list_credential_group_request__pack_to_buffer
                     (const Kentik__Credential__V202407alpha1__ListCredentialGroupRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Credential__V202407alpha1__ListCredentialGroupRequest *
       kentik__credential__v202407alpha1__list_credential_group_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__credential__v202407alpha1__list_credential_group_request__free_unpacked
                     (Kentik__Credential__V202407alpha1__ListCredentialGroupRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Credential__V202407alpha1__ListCredentialGroupResponse methods */
void   kentik__credential__v202407alpha1__list_credential_group_response__init
                     (Kentik__Credential__V202407alpha1__ListCredentialGroupResponse         *message);
size_t kentik__credential__v202407alpha1__list_credential_group_response__get_packed_size
                     (const Kentik__Credential__V202407alpha1__ListCredentialGroupResponse   *message);
size_t kentik__credential__v202407alpha1__list_credential_group_response__pack
                     (const Kentik__Credential__V202407alpha1__ListCredentialGroupResponse   *message,
                      uint8_t             *out);
size_t kentik__credential__v202407alpha1__list_credential_group_response__pack_to_buffer
                     (const Kentik__Credential__V202407alpha1__ListCredentialGroupResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Credential__V202407alpha1__ListCredentialGroupResponse *
       kentik__credential__v202407alpha1__list_credential_group_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__credential__v202407alpha1__list_credential_group_response__free_unpacked
                     (Kentik__Credential__V202407alpha1__ListCredentialGroupResponse *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Kentik__Credential__V202407alpha1__CredentialGroup_Closure)
                 (const Kentik__Credential__V202407alpha1__CredentialGroup *message,
                  void *closure_data);
typedef void (*Kentik__Credential__V202407alpha1__GetCredentialGroupRequest_Closure)
                 (const Kentik__Credential__V202407alpha1__GetCredentialGroupRequest *message,
                  void *closure_data);
typedef void (*Kentik__Credential__V202407alpha1__GetCredentialGroupResponse_Closure)
                 (const Kentik__Credential__V202407alpha1__GetCredentialGroupResponse *message,
                  void *closure_data);
typedef void (*Kentik__Credential__V202407alpha1__ListCredentialGroupRequest_Closure)
                 (const Kentik__Credential__V202407alpha1__ListCredentialGroupRequest *message,
                  void *closure_data);
typedef void (*Kentik__Credential__V202407alpha1__ListCredentialGroupResponse_Closure)
                 (const Kentik__Credential__V202407alpha1__ListCredentialGroupResponse *message,
                  void *closure_data);

/* --- services --- */

typedef struct Kentik__Credential__V202407alpha1__CredentialService_Service Kentik__Credential__V202407alpha1__CredentialService_Service;
struct Kentik__Credential__V202407alpha1__CredentialService_Service
{
  ProtobufCService base;
  void (*get_credential_group)(Kentik__Credential__V202407alpha1__CredentialService_Service *service,
                               const Kentik__Credential__V202407alpha1__GetCredentialGroupRequest *input,
                               Kentik__Credential__V202407alpha1__GetCredentialGroupResponse_Closure closure,
                               void *closure_data);
  void (*list_credential_group)(Kentik__Credential__V202407alpha1__CredentialService_Service *service,
                                const Kentik__Credential__V202407alpha1__ListCredentialGroupRequest *input,
                                Kentik__Credential__V202407alpha1__ListCredentialGroupResponse_Closure closure,
                                void *closure_data);
};
typedef void (*Kentik__Credential__V202407alpha1__CredentialService_ServiceDestroy)(Kentik__Credential__V202407alpha1__CredentialService_Service *);
void kentik__credential__v202407alpha1__credential_service__init (Kentik__Credential__V202407alpha1__CredentialService_Service *service,
                                                                  Kentik__Credential__V202407alpha1__CredentialService_ServiceDestroy destroy);
#define KENTIK__CREDENTIAL__V202407ALPHA1__CREDENTIAL_SERVICE__BASE_INIT \
    { &kentik__credential__v202407alpha1__credential_service__descriptor, protobuf_c_service_invoke_internal, NULL }
#define KENTIK__CREDENTIAL__V202407ALPHA1__CREDENTIAL_SERVICE__INIT(function_prefix__) \
    { KENTIK__CREDENTIAL__V202407ALPHA1__CREDENTIAL_SERVICE__BASE_INIT,\
      function_prefix__ ## get_credential_group,\
      function_prefix__ ## list_credential_group  }
void kentik__credential__v202407alpha1__credential_service__get_credential_group(ProtobufCService *service,
                                                                                 const Kentik__Credential__V202407alpha1__GetCredentialGroupRequest *input,
                                                                                 Kentik__Credential__V202407alpha1__GetCredentialGroupResponse_Closure closure,
                                                                                 void *closure_data);
void kentik__credential__v202407alpha1__credential_service__list_credential_group(ProtobufCService *service,
                                                                                  const Kentik__Credential__V202407alpha1__ListCredentialGroupRequest *input,
                                                                                  Kentik__Credential__V202407alpha1__ListCredentialGroupResponse_Closure closure,
                                                                                  void *closure_data);

/* --- descriptors --- */

extern const ProtobufCMessageDescriptor kentik__credential__v202407alpha1__credential_group__descriptor;
extern const ProtobufCMessageDescriptor kentik__credential__v202407alpha1__get_credential_group_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__credential__v202407alpha1__get_credential_group_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__credential__v202407alpha1__list_credential_group_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__credential__v202407alpha1__list_credential_group_response__descriptor;
extern const ProtobufCServiceDescriptor kentik__credential__v202407alpha1__credential_service__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_kentik_2fcredential_2fv202407alpha1_2fcredential_2eproto__INCLUDED */
