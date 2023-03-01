/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/as_group/v202212/as_group.proto */

#ifndef PROTOBUF_C_kentik_2fas_5fgroup_2fv202212_2fas_5fgroup_2eproto__INCLUDED
#define PROTOBUF_C_kentik_2fas_5fgroup_2fv202212_2fas_5fgroup_2eproto__INCLUDED

#include <protobuf-c/protobuf-c.h>

PROTOBUF_C__BEGIN_DECLS

#if PROTOBUF_C_VERSION_NUMBER < 1003000
# error This file was generated by a newer version of protoc-c which is incompatible with your libprotobuf-c headers. Please update your headers.
#elif 1003003 < PROTOBUF_C_MIN_COMPILER_VERSION
# error This file was generated by an older version of protoc-c which is incompatible with your libprotobuf-c headers. Please regenerate this file with a newer version of protoc-c.
#endif

#include "google/api/annotations.pb-c.h"
#include "google/api/client.pb-c.h"
#include "google/api/field_behavior.pb-c.h"
#include "google/protobuf/timestamp.pb-c.h"
#include "protoc-gen-openapiv2/options/annotations.pb-c.h"
#include "kentik/core/v202012alpha1/annotations.pb-c.h"

typedef struct _Kentik__AsGroup__V202212__AutonomousSystem Kentik__AsGroup__V202212__AutonomousSystem;
typedef struct _Kentik__AsGroup__V202212__ASGroupConcise Kentik__AsGroup__V202212__ASGroupConcise;
typedef struct _Kentik__AsGroup__V202212__ASGroupDetailed Kentik__AsGroup__V202212__ASGroupDetailed;
typedef struct _Kentik__AsGroup__V202212__ListASGroupsRequest Kentik__AsGroup__V202212__ListASGroupsRequest;
typedef struct _Kentik__AsGroup__V202212__ListASGroupsResponse Kentik__AsGroup__V202212__ListASGroupsResponse;
typedef struct _Kentik__AsGroup__V202212__GetASGroupRequest Kentik__AsGroup__V202212__GetASGroupRequest;
typedef struct _Kentik__AsGroup__V202212__GetASGroupResponse Kentik__AsGroup__V202212__GetASGroupResponse;
typedef struct _Kentik__AsGroup__V202212__CreateASGroupRequest Kentik__AsGroup__V202212__CreateASGroupRequest;
typedef struct _Kentik__AsGroup__V202212__CreateASGroupResponse Kentik__AsGroup__V202212__CreateASGroupResponse;
typedef struct _Kentik__AsGroup__V202212__UpdateASGroupRequest Kentik__AsGroup__V202212__UpdateASGroupRequest;
typedef struct _Kentik__AsGroup__V202212__UpdateASGroupResponse Kentik__AsGroup__V202212__UpdateASGroupResponse;
typedef struct _Kentik__AsGroup__V202212__DeleteASGroupRequest Kentik__AsGroup__V202212__DeleteASGroupRequest;
typedef struct _Kentik__AsGroup__V202212__DeleteASGroupResponse Kentik__AsGroup__V202212__DeleteASGroupResponse;


/* --- enums --- */


/* --- messages --- */

/*
 * {{.Name}}
 */
struct  _Kentik__AsGroup__V202212__AutonomousSystem
{
  ProtobufCMessage base;
  uint32_t asn;
  char *name;
};
#define KENTIK__AS_GROUP__V202212__AUTONOMOUS_SYSTEM__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__as_group__v202212__autonomous_system__descriptor) \
    , 0, (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  _Kentik__AsGroup__V202212__ASGroupConcise
{
  ProtobufCMessage base;
  char *id;
  char *name;
  size_t n_asn;
  char **asn;
  Google__Protobuf__Timestamp *created_date;
  Google__Protobuf__Timestamp *updated_date;
};
#define KENTIK__AS_GROUP__V202212__ASGROUP_CONCISE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__as_group__v202212__asgroup_concise__descriptor) \
    , (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, 0,NULL, NULL, NULL }


/*
 * {{.Name}}
 */
struct  _Kentik__AsGroup__V202212__ASGroupDetailed
{
  ProtobufCMessage base;
  char *id;
  char *name;
  size_t n_asn;
  Kentik__AsGroup__V202212__AutonomousSystem **asn;
  Google__Protobuf__Timestamp *created_date;
  Google__Protobuf__Timestamp *updated_date;
};
#define KENTIK__AS_GROUP__V202212__ASGROUP_DETAILED__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__as_group__v202212__asgroup_detailed__descriptor) \
    , (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, 0,NULL, NULL, NULL }


/*
 * {{.Name}}
 */
struct  _Kentik__AsGroup__V202212__ListASGroupsRequest
{
  ProtobufCMessage base;
};
#define KENTIK__AS_GROUP__V202212__LIST_ASGROUPS_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__as_group__v202212__list_asgroups_request__descriptor) \
     }


/*
 * {{.Name}}
 */
struct  _Kentik__AsGroup__V202212__ListASGroupsResponse
{
  ProtobufCMessage base;
  size_t n_as_groups;
  Kentik__AsGroup__V202212__ASGroupDetailed **as_groups;
  uint32_t invalid_count;
};
#define KENTIK__AS_GROUP__V202212__LIST_ASGROUPS_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__as_group__v202212__list_asgroups_response__descriptor) \
    , 0,NULL, 0 }


/*
 * {{.Name}}
 */
struct  _Kentik__AsGroup__V202212__GetASGroupRequest
{
  ProtobufCMessage base;
  char *id;
};
#define KENTIK__AS_GROUP__V202212__GET_ASGROUP_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__as_group__v202212__get_asgroup_request__descriptor) \
    , (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  _Kentik__AsGroup__V202212__GetASGroupResponse
{
  ProtobufCMessage base;
  Kentik__AsGroup__V202212__ASGroupDetailed *as_group;
};
#define KENTIK__AS_GROUP__V202212__GET_ASGROUP_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__as_group__v202212__get_asgroup_response__descriptor) \
    , NULL }


/*
 * {{.Name}}
 */
struct  _Kentik__AsGroup__V202212__CreateASGroupRequest
{
  ProtobufCMessage base;
  Kentik__AsGroup__V202212__ASGroupConcise *as_group;
};
#define KENTIK__AS_GROUP__V202212__CREATE_ASGROUP_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__as_group__v202212__create_asgroup_request__descriptor) \
    , NULL }


/*
 * {{.Name}}
 */
struct  _Kentik__AsGroup__V202212__CreateASGroupResponse
{
  ProtobufCMessage base;
  Kentik__AsGroup__V202212__ASGroupDetailed *as_group;
};
#define KENTIK__AS_GROUP__V202212__CREATE_ASGROUP_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__as_group__v202212__create_asgroup_response__descriptor) \
    , NULL }


/*
 * {{.Name}}
 */
struct  _Kentik__AsGroup__V202212__UpdateASGroupRequest
{
  ProtobufCMessage base;
  Kentik__AsGroup__V202212__ASGroupConcise *as_group;
};
#define KENTIK__AS_GROUP__V202212__UPDATE_ASGROUP_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__as_group__v202212__update_asgroup_request__descriptor) \
    , NULL }


/*
 * {{.Name}}
 */
struct  _Kentik__AsGroup__V202212__UpdateASGroupResponse
{
  ProtobufCMessage base;
  Kentik__AsGroup__V202212__ASGroupDetailed *as_group;
};
#define KENTIK__AS_GROUP__V202212__UPDATE_ASGROUP_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__as_group__v202212__update_asgroup_response__descriptor) \
    , NULL }


/*
 * {{.Name}}
 */
struct  _Kentik__AsGroup__V202212__DeleteASGroupRequest
{
  ProtobufCMessage base;
  char *id;
};
#define KENTIK__AS_GROUP__V202212__DELETE_ASGROUP_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__as_group__v202212__delete_asgroup_request__descriptor) \
    , (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  _Kentik__AsGroup__V202212__DeleteASGroupResponse
{
  ProtobufCMessage base;
};
#define KENTIK__AS_GROUP__V202212__DELETE_ASGROUP_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__as_group__v202212__delete_asgroup_response__descriptor) \
     }


/* Kentik__AsGroup__V202212__AutonomousSystem methods */
void   kentik__as_group__v202212__autonomous_system__init
                     (Kentik__AsGroup__V202212__AutonomousSystem         *message);
size_t kentik__as_group__v202212__autonomous_system__get_packed_size
                     (const Kentik__AsGroup__V202212__AutonomousSystem   *message);
size_t kentik__as_group__v202212__autonomous_system__pack
                     (const Kentik__AsGroup__V202212__AutonomousSystem   *message,
                      uint8_t             *out);
size_t kentik__as_group__v202212__autonomous_system__pack_to_buffer
                     (const Kentik__AsGroup__V202212__AutonomousSystem   *message,
                      ProtobufCBuffer     *buffer);
Kentik__AsGroup__V202212__AutonomousSystem *
       kentik__as_group__v202212__autonomous_system__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__as_group__v202212__autonomous_system__free_unpacked
                     (Kentik__AsGroup__V202212__AutonomousSystem *message,
                      ProtobufCAllocator *allocator);
/* Kentik__AsGroup__V202212__ASGroupConcise methods */
void   kentik__as_group__v202212__asgroup_concise__init
                     (Kentik__AsGroup__V202212__ASGroupConcise         *message);
size_t kentik__as_group__v202212__asgroup_concise__get_packed_size
                     (const Kentik__AsGroup__V202212__ASGroupConcise   *message);
size_t kentik__as_group__v202212__asgroup_concise__pack
                     (const Kentik__AsGroup__V202212__ASGroupConcise   *message,
                      uint8_t             *out);
size_t kentik__as_group__v202212__asgroup_concise__pack_to_buffer
                     (const Kentik__AsGroup__V202212__ASGroupConcise   *message,
                      ProtobufCBuffer     *buffer);
Kentik__AsGroup__V202212__ASGroupConcise *
       kentik__as_group__v202212__asgroup_concise__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__as_group__v202212__asgroup_concise__free_unpacked
                     (Kentik__AsGroup__V202212__ASGroupConcise *message,
                      ProtobufCAllocator *allocator);
/* Kentik__AsGroup__V202212__ASGroupDetailed methods */
void   kentik__as_group__v202212__asgroup_detailed__init
                     (Kentik__AsGroup__V202212__ASGroupDetailed         *message);
size_t kentik__as_group__v202212__asgroup_detailed__get_packed_size
                     (const Kentik__AsGroup__V202212__ASGroupDetailed   *message);
size_t kentik__as_group__v202212__asgroup_detailed__pack
                     (const Kentik__AsGroup__V202212__ASGroupDetailed   *message,
                      uint8_t             *out);
size_t kentik__as_group__v202212__asgroup_detailed__pack_to_buffer
                     (const Kentik__AsGroup__V202212__ASGroupDetailed   *message,
                      ProtobufCBuffer     *buffer);
Kentik__AsGroup__V202212__ASGroupDetailed *
       kentik__as_group__v202212__asgroup_detailed__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__as_group__v202212__asgroup_detailed__free_unpacked
                     (Kentik__AsGroup__V202212__ASGroupDetailed *message,
                      ProtobufCAllocator *allocator);
/* Kentik__AsGroup__V202212__ListASGroupsRequest methods */
void   kentik__as_group__v202212__list_asgroups_request__init
                     (Kentik__AsGroup__V202212__ListASGroupsRequest         *message);
size_t kentik__as_group__v202212__list_asgroups_request__get_packed_size
                     (const Kentik__AsGroup__V202212__ListASGroupsRequest   *message);
size_t kentik__as_group__v202212__list_asgroups_request__pack
                     (const Kentik__AsGroup__V202212__ListASGroupsRequest   *message,
                      uint8_t             *out);
size_t kentik__as_group__v202212__list_asgroups_request__pack_to_buffer
                     (const Kentik__AsGroup__V202212__ListASGroupsRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__AsGroup__V202212__ListASGroupsRequest *
       kentik__as_group__v202212__list_asgroups_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__as_group__v202212__list_asgroups_request__free_unpacked
                     (Kentik__AsGroup__V202212__ListASGroupsRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__AsGroup__V202212__ListASGroupsResponse methods */
void   kentik__as_group__v202212__list_asgroups_response__init
                     (Kentik__AsGroup__V202212__ListASGroupsResponse         *message);
size_t kentik__as_group__v202212__list_asgroups_response__get_packed_size
                     (const Kentik__AsGroup__V202212__ListASGroupsResponse   *message);
size_t kentik__as_group__v202212__list_asgroups_response__pack
                     (const Kentik__AsGroup__V202212__ListASGroupsResponse   *message,
                      uint8_t             *out);
size_t kentik__as_group__v202212__list_asgroups_response__pack_to_buffer
                     (const Kentik__AsGroup__V202212__ListASGroupsResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__AsGroup__V202212__ListASGroupsResponse *
       kentik__as_group__v202212__list_asgroups_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__as_group__v202212__list_asgroups_response__free_unpacked
                     (Kentik__AsGroup__V202212__ListASGroupsResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__AsGroup__V202212__GetASGroupRequest methods */
void   kentik__as_group__v202212__get_asgroup_request__init
                     (Kentik__AsGroup__V202212__GetASGroupRequest         *message);
size_t kentik__as_group__v202212__get_asgroup_request__get_packed_size
                     (const Kentik__AsGroup__V202212__GetASGroupRequest   *message);
size_t kentik__as_group__v202212__get_asgroup_request__pack
                     (const Kentik__AsGroup__V202212__GetASGroupRequest   *message,
                      uint8_t             *out);
size_t kentik__as_group__v202212__get_asgroup_request__pack_to_buffer
                     (const Kentik__AsGroup__V202212__GetASGroupRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__AsGroup__V202212__GetASGroupRequest *
       kentik__as_group__v202212__get_asgroup_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__as_group__v202212__get_asgroup_request__free_unpacked
                     (Kentik__AsGroup__V202212__GetASGroupRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__AsGroup__V202212__GetASGroupResponse methods */
void   kentik__as_group__v202212__get_asgroup_response__init
                     (Kentik__AsGroup__V202212__GetASGroupResponse         *message);
size_t kentik__as_group__v202212__get_asgroup_response__get_packed_size
                     (const Kentik__AsGroup__V202212__GetASGroupResponse   *message);
size_t kentik__as_group__v202212__get_asgroup_response__pack
                     (const Kentik__AsGroup__V202212__GetASGroupResponse   *message,
                      uint8_t             *out);
size_t kentik__as_group__v202212__get_asgroup_response__pack_to_buffer
                     (const Kentik__AsGroup__V202212__GetASGroupResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__AsGroup__V202212__GetASGroupResponse *
       kentik__as_group__v202212__get_asgroup_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__as_group__v202212__get_asgroup_response__free_unpacked
                     (Kentik__AsGroup__V202212__GetASGroupResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__AsGroup__V202212__CreateASGroupRequest methods */
void   kentik__as_group__v202212__create_asgroup_request__init
                     (Kentik__AsGroup__V202212__CreateASGroupRequest         *message);
size_t kentik__as_group__v202212__create_asgroup_request__get_packed_size
                     (const Kentik__AsGroup__V202212__CreateASGroupRequest   *message);
size_t kentik__as_group__v202212__create_asgroup_request__pack
                     (const Kentik__AsGroup__V202212__CreateASGroupRequest   *message,
                      uint8_t             *out);
size_t kentik__as_group__v202212__create_asgroup_request__pack_to_buffer
                     (const Kentik__AsGroup__V202212__CreateASGroupRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__AsGroup__V202212__CreateASGroupRequest *
       kentik__as_group__v202212__create_asgroup_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__as_group__v202212__create_asgroup_request__free_unpacked
                     (Kentik__AsGroup__V202212__CreateASGroupRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__AsGroup__V202212__CreateASGroupResponse methods */
void   kentik__as_group__v202212__create_asgroup_response__init
                     (Kentik__AsGroup__V202212__CreateASGroupResponse         *message);
size_t kentik__as_group__v202212__create_asgroup_response__get_packed_size
                     (const Kentik__AsGroup__V202212__CreateASGroupResponse   *message);
size_t kentik__as_group__v202212__create_asgroup_response__pack
                     (const Kentik__AsGroup__V202212__CreateASGroupResponse   *message,
                      uint8_t             *out);
size_t kentik__as_group__v202212__create_asgroup_response__pack_to_buffer
                     (const Kentik__AsGroup__V202212__CreateASGroupResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__AsGroup__V202212__CreateASGroupResponse *
       kentik__as_group__v202212__create_asgroup_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__as_group__v202212__create_asgroup_response__free_unpacked
                     (Kentik__AsGroup__V202212__CreateASGroupResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__AsGroup__V202212__UpdateASGroupRequest methods */
void   kentik__as_group__v202212__update_asgroup_request__init
                     (Kentik__AsGroup__V202212__UpdateASGroupRequest         *message);
size_t kentik__as_group__v202212__update_asgroup_request__get_packed_size
                     (const Kentik__AsGroup__V202212__UpdateASGroupRequest   *message);
size_t kentik__as_group__v202212__update_asgroup_request__pack
                     (const Kentik__AsGroup__V202212__UpdateASGroupRequest   *message,
                      uint8_t             *out);
size_t kentik__as_group__v202212__update_asgroup_request__pack_to_buffer
                     (const Kentik__AsGroup__V202212__UpdateASGroupRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__AsGroup__V202212__UpdateASGroupRequest *
       kentik__as_group__v202212__update_asgroup_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__as_group__v202212__update_asgroup_request__free_unpacked
                     (Kentik__AsGroup__V202212__UpdateASGroupRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__AsGroup__V202212__UpdateASGroupResponse methods */
void   kentik__as_group__v202212__update_asgroup_response__init
                     (Kentik__AsGroup__V202212__UpdateASGroupResponse         *message);
size_t kentik__as_group__v202212__update_asgroup_response__get_packed_size
                     (const Kentik__AsGroup__V202212__UpdateASGroupResponse   *message);
size_t kentik__as_group__v202212__update_asgroup_response__pack
                     (const Kentik__AsGroup__V202212__UpdateASGroupResponse   *message,
                      uint8_t             *out);
size_t kentik__as_group__v202212__update_asgroup_response__pack_to_buffer
                     (const Kentik__AsGroup__V202212__UpdateASGroupResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__AsGroup__V202212__UpdateASGroupResponse *
       kentik__as_group__v202212__update_asgroup_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__as_group__v202212__update_asgroup_response__free_unpacked
                     (Kentik__AsGroup__V202212__UpdateASGroupResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__AsGroup__V202212__DeleteASGroupRequest methods */
void   kentik__as_group__v202212__delete_asgroup_request__init
                     (Kentik__AsGroup__V202212__DeleteASGroupRequest         *message);
size_t kentik__as_group__v202212__delete_asgroup_request__get_packed_size
                     (const Kentik__AsGroup__V202212__DeleteASGroupRequest   *message);
size_t kentik__as_group__v202212__delete_asgroup_request__pack
                     (const Kentik__AsGroup__V202212__DeleteASGroupRequest   *message,
                      uint8_t             *out);
size_t kentik__as_group__v202212__delete_asgroup_request__pack_to_buffer
                     (const Kentik__AsGroup__V202212__DeleteASGroupRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__AsGroup__V202212__DeleteASGroupRequest *
       kentik__as_group__v202212__delete_asgroup_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__as_group__v202212__delete_asgroup_request__free_unpacked
                     (Kentik__AsGroup__V202212__DeleteASGroupRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__AsGroup__V202212__DeleteASGroupResponse methods */
void   kentik__as_group__v202212__delete_asgroup_response__init
                     (Kentik__AsGroup__V202212__DeleteASGroupResponse         *message);
size_t kentik__as_group__v202212__delete_asgroup_response__get_packed_size
                     (const Kentik__AsGroup__V202212__DeleteASGroupResponse   *message);
size_t kentik__as_group__v202212__delete_asgroup_response__pack
                     (const Kentik__AsGroup__V202212__DeleteASGroupResponse   *message,
                      uint8_t             *out);
size_t kentik__as_group__v202212__delete_asgroup_response__pack_to_buffer
                     (const Kentik__AsGroup__V202212__DeleteASGroupResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__AsGroup__V202212__DeleteASGroupResponse *
       kentik__as_group__v202212__delete_asgroup_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__as_group__v202212__delete_asgroup_response__free_unpacked
                     (Kentik__AsGroup__V202212__DeleteASGroupResponse *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Kentik__AsGroup__V202212__AutonomousSystem_Closure)
                 (const Kentik__AsGroup__V202212__AutonomousSystem *message,
                  void *closure_data);
typedef void (*Kentik__AsGroup__V202212__ASGroupConcise_Closure)
                 (const Kentik__AsGroup__V202212__ASGroupConcise *message,
                  void *closure_data);
typedef void (*Kentik__AsGroup__V202212__ASGroupDetailed_Closure)
                 (const Kentik__AsGroup__V202212__ASGroupDetailed *message,
                  void *closure_data);
typedef void (*Kentik__AsGroup__V202212__ListASGroupsRequest_Closure)
                 (const Kentik__AsGroup__V202212__ListASGroupsRequest *message,
                  void *closure_data);
typedef void (*Kentik__AsGroup__V202212__ListASGroupsResponse_Closure)
                 (const Kentik__AsGroup__V202212__ListASGroupsResponse *message,
                  void *closure_data);
typedef void (*Kentik__AsGroup__V202212__GetASGroupRequest_Closure)
                 (const Kentik__AsGroup__V202212__GetASGroupRequest *message,
                  void *closure_data);
typedef void (*Kentik__AsGroup__V202212__GetASGroupResponse_Closure)
                 (const Kentik__AsGroup__V202212__GetASGroupResponse *message,
                  void *closure_data);
typedef void (*Kentik__AsGroup__V202212__CreateASGroupRequest_Closure)
                 (const Kentik__AsGroup__V202212__CreateASGroupRequest *message,
                  void *closure_data);
typedef void (*Kentik__AsGroup__V202212__CreateASGroupResponse_Closure)
                 (const Kentik__AsGroup__V202212__CreateASGroupResponse *message,
                  void *closure_data);
typedef void (*Kentik__AsGroup__V202212__UpdateASGroupRequest_Closure)
                 (const Kentik__AsGroup__V202212__UpdateASGroupRequest *message,
                  void *closure_data);
typedef void (*Kentik__AsGroup__V202212__UpdateASGroupResponse_Closure)
                 (const Kentik__AsGroup__V202212__UpdateASGroupResponse *message,
                  void *closure_data);
typedef void (*Kentik__AsGroup__V202212__DeleteASGroupRequest_Closure)
                 (const Kentik__AsGroup__V202212__DeleteASGroupRequest *message,
                  void *closure_data);
typedef void (*Kentik__AsGroup__V202212__DeleteASGroupResponse_Closure)
                 (const Kentik__AsGroup__V202212__DeleteASGroupResponse *message,
                  void *closure_data);

/* --- services --- */

typedef struct _Kentik__AsGroup__V202212__ASGroupService_Service Kentik__AsGroup__V202212__ASGroupService_Service;
struct _Kentik__AsGroup__V202212__ASGroupService_Service
{
  ProtobufCService base;
  void (*list_asgroups)(Kentik__AsGroup__V202212__ASGroupService_Service *service,
                        const Kentik__AsGroup__V202212__ListASGroupsRequest *input,
                        Kentik__AsGroup__V202212__ListASGroupsResponse_Closure closure,
                        void *closure_data);
  void (*get_asgroup)(Kentik__AsGroup__V202212__ASGroupService_Service *service,
                      const Kentik__AsGroup__V202212__GetASGroupRequest *input,
                      Kentik__AsGroup__V202212__GetASGroupResponse_Closure closure,
                      void *closure_data);
  void (*create_asgroup)(Kentik__AsGroup__V202212__ASGroupService_Service *service,
                         const Kentik__AsGroup__V202212__CreateASGroupRequest *input,
                         Kentik__AsGroup__V202212__CreateASGroupResponse_Closure closure,
                         void *closure_data);
  void (*update_asgroup)(Kentik__AsGroup__V202212__ASGroupService_Service *service,
                         const Kentik__AsGroup__V202212__UpdateASGroupRequest *input,
                         Kentik__AsGroup__V202212__UpdateASGroupResponse_Closure closure,
                         void *closure_data);
  void (*delete_asgroup)(Kentik__AsGroup__V202212__ASGroupService_Service *service,
                         const Kentik__AsGroup__V202212__DeleteASGroupRequest *input,
                         Kentik__AsGroup__V202212__DeleteASGroupResponse_Closure closure,
                         void *closure_data);
};
typedef void (*Kentik__AsGroup__V202212__ASGroupService_ServiceDestroy)(Kentik__AsGroup__V202212__ASGroupService_Service *);
void kentik__as_group__v202212__asgroup_service__init (Kentik__AsGroup__V202212__ASGroupService_Service *service,
                                                       Kentik__AsGroup__V202212__ASGroupService_ServiceDestroy destroy);
#define KENTIK__AS_GROUP__V202212__ASGROUP_SERVICE__BASE_INIT \
    { &kentik__as_group__v202212__asgroup_service__descriptor, protobuf_c_service_invoke_internal, NULL }
#define KENTIK__AS_GROUP__V202212__ASGROUP_SERVICE__INIT(function_prefix__) \
    { KENTIK__AS_GROUP__V202212__ASGROUP_SERVICE__BASE_INIT,\
      function_prefix__ ## list_asgroups,\
      function_prefix__ ## get_asgroup,\
      function_prefix__ ## create_asgroup,\
      function_prefix__ ## update_asgroup,\
      function_prefix__ ## delete_asgroup  }
void kentik__as_group__v202212__asgroup_service__list_asgroups(ProtobufCService *service,
                                                               const Kentik__AsGroup__V202212__ListASGroupsRequest *input,
                                                               Kentik__AsGroup__V202212__ListASGroupsResponse_Closure closure,
                                                               void *closure_data);
void kentik__as_group__v202212__asgroup_service__get_asgroup(ProtobufCService *service,
                                                             const Kentik__AsGroup__V202212__GetASGroupRequest *input,
                                                             Kentik__AsGroup__V202212__GetASGroupResponse_Closure closure,
                                                             void *closure_data);
void kentik__as_group__v202212__asgroup_service__create_asgroup(ProtobufCService *service,
                                                                const Kentik__AsGroup__V202212__CreateASGroupRequest *input,
                                                                Kentik__AsGroup__V202212__CreateASGroupResponse_Closure closure,
                                                                void *closure_data);
void kentik__as_group__v202212__asgroup_service__update_asgroup(ProtobufCService *service,
                                                                const Kentik__AsGroup__V202212__UpdateASGroupRequest *input,
                                                                Kentik__AsGroup__V202212__UpdateASGroupResponse_Closure closure,
                                                                void *closure_data);
void kentik__as_group__v202212__asgroup_service__delete_asgroup(ProtobufCService *service,
                                                                const Kentik__AsGroup__V202212__DeleteASGroupRequest *input,
                                                                Kentik__AsGroup__V202212__DeleteASGroupResponse_Closure closure,
                                                                void *closure_data);

/* --- descriptors --- */

extern const ProtobufCMessageDescriptor kentik__as_group__v202212__autonomous_system__descriptor;
extern const ProtobufCMessageDescriptor kentik__as_group__v202212__asgroup_concise__descriptor;
extern const ProtobufCMessageDescriptor kentik__as_group__v202212__asgroup_detailed__descriptor;
extern const ProtobufCMessageDescriptor kentik__as_group__v202212__list_asgroups_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__as_group__v202212__list_asgroups_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__as_group__v202212__get_asgroup_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__as_group__v202212__get_asgroup_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__as_group__v202212__create_asgroup_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__as_group__v202212__create_asgroup_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__as_group__v202212__update_asgroup_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__as_group__v202212__update_asgroup_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__as_group__v202212__delete_asgroup_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__as_group__v202212__delete_asgroup_response__descriptor;
extern const ProtobufCServiceDescriptor kentik__as_group__v202212__asgroup_service__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_kentik_2fas_5fgroup_2fv202212_2fas_5fgroup_2eproto__INCLUDED */