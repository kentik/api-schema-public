/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/saved_filter/v202501alpha1/saved_filter.proto */

#ifndef PROTOBUF_C_kentik_2fsaved_5ffilter_2fv202501alpha1_2fsaved_5ffilter_2eproto__INCLUDED
#define PROTOBUF_C_kentik_2fsaved_5ffilter_2fv202501alpha1_2fsaved_5ffilter_2eproto__INCLUDED

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
#include "protoc-gen-openapiv2/options/annotations.pb-c.h"
#include "kentik/core/v202303/annotations.pb-c.h"
#include "kentik/saved_filter/v202501alpha1/saved_filter_message.pb-c.h"

typedef struct Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest;
typedef struct Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse;
typedef struct Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest;
typedef struct Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse;
typedef struct Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest;
typedef struct Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest;
typedef struct Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse;
typedef struct Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse;
typedef struct Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest;
typedef struct Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse;
typedef struct Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest;
typedef struct Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse;


/* --- enums --- */


/* --- messages --- */

struct  Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest
{
  ProtobufCMessage base;
  Kentik__SavedFilter__V202501alpha1__SavedFilter *filter;
};
#define KENTIK__SAVED_FILTER__V202501ALPHA1__CREATE_SAVED_FILTER_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__saved_filter__v202501alpha1__create_saved_filter_request__descriptor) \
    , NULL }


struct  Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse
{
  ProtobufCMessage base;
  Kentik__SavedFilter__V202501alpha1__SavedFilter *filter;
};
#define KENTIK__SAVED_FILTER__V202501ALPHA1__CREATE_SAVED_FILTER_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__saved_filter__v202501alpha1__create_saved_filter_response__descriptor) \
    , NULL }


struct  Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest
{
  ProtobufCMessage base;
  char *id;
  Kentik__SavedFilter__V202501alpha1__SavedFilter *filter;
};
#define KENTIK__SAVED_FILTER__V202501ALPHA1__UPDATE_SAVED_FILTER_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__saved_filter__v202501alpha1__update_saved_filter_request__descriptor) \
    , (char *)protobuf_c_empty_string, NULL }


struct  Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse
{
  ProtobufCMessage base;
  Kentik__SavedFilter__V202501alpha1__SavedFilter *filter;
};
#define KENTIK__SAVED_FILTER__V202501ALPHA1__UPDATE_SAVED_FILTER_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__saved_filter__v202501alpha1__update_saved_filter_response__descriptor) \
    , NULL }


struct  Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest
{
  ProtobufCMessage base;
};
#define KENTIK__SAVED_FILTER__V202501ALPHA1__LIST_SAVED_FILTERS_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__saved_filter__v202501alpha1__list_saved_filters_request__descriptor) \
     }


struct  Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest
{
  ProtobufCMessage base;
};
#define KENTIK__SAVED_FILTER__V202501ALPHA1__LIST_SAVED_FILTERS_ALL_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__saved_filter__v202501alpha1__list_saved_filters_all_request__descriptor) \
     }


struct  Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse
{
  ProtobufCMessage base;
  size_t n_filters;
  Kentik__SavedFilter__V202501alpha1__SavedFilter **filters;
};
#define KENTIK__SAVED_FILTER__V202501ALPHA1__LIST_SAVED_FILTERS_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__saved_filter__v202501alpha1__list_saved_filters_response__descriptor) \
    , 0,NULL }


struct  Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse
{
  ProtobufCMessage base;
  size_t n_filters;
  Kentik__SavedFilter__V202501alpha1__SavedFilter **filters;
};
#define KENTIK__SAVED_FILTER__V202501ALPHA1__LIST_SAVED_FILTERS_ALL_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__saved_filter__v202501alpha1__list_saved_filters_all_response__descriptor) \
    , 0,NULL }


struct  Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest
{
  ProtobufCMessage base;
  char *id;
};
#define KENTIK__SAVED_FILTER__V202501ALPHA1__GET_SAVED_FILTER_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__saved_filter__v202501alpha1__get_saved_filter_request__descriptor) \
    , (char *)protobuf_c_empty_string }


struct  Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse
{
  ProtobufCMessage base;
  Kentik__SavedFilter__V202501alpha1__SavedFilter *filter;
};
#define KENTIK__SAVED_FILTER__V202501ALPHA1__GET_SAVED_FILTER_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__saved_filter__v202501alpha1__get_saved_filter_response__descriptor) \
    , NULL }


struct  Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest
{
  ProtobufCMessage base;
  char *id;
};
#define KENTIK__SAVED_FILTER__V202501ALPHA1__DELETE_SAVED_FILTER_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__saved_filter__v202501alpha1__delete_saved_filter_request__descriptor) \
    , (char *)protobuf_c_empty_string }


struct  Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse
{
  ProtobufCMessage base;
};
#define KENTIK__SAVED_FILTER__V202501ALPHA1__DELETE_SAVED_FILTER_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__saved_filter__v202501alpha1__delete_saved_filter_response__descriptor) \
     }


/* Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest methods */
void   kentik__saved_filter__v202501alpha1__create_saved_filter_request__init
                     (Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest         *message);
size_t kentik__saved_filter__v202501alpha1__create_saved_filter_request__get_packed_size
                     (const Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest   *message);
size_t kentik__saved_filter__v202501alpha1__create_saved_filter_request__pack
                     (const Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest   *message,
                      uint8_t             *out);
size_t kentik__saved_filter__v202501alpha1__create_saved_filter_request__pack_to_buffer
                     (const Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest *
       kentik__saved_filter__v202501alpha1__create_saved_filter_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__saved_filter__v202501alpha1__create_saved_filter_request__free_unpacked
                     (Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse methods */
void   kentik__saved_filter__v202501alpha1__create_saved_filter_response__init
                     (Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse         *message);
size_t kentik__saved_filter__v202501alpha1__create_saved_filter_response__get_packed_size
                     (const Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse   *message);
size_t kentik__saved_filter__v202501alpha1__create_saved_filter_response__pack
                     (const Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse   *message,
                      uint8_t             *out);
size_t kentik__saved_filter__v202501alpha1__create_saved_filter_response__pack_to_buffer
                     (const Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse *
       kentik__saved_filter__v202501alpha1__create_saved_filter_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__saved_filter__v202501alpha1__create_saved_filter_response__free_unpacked
                     (Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest methods */
void   kentik__saved_filter__v202501alpha1__update_saved_filter_request__init
                     (Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest         *message);
size_t kentik__saved_filter__v202501alpha1__update_saved_filter_request__get_packed_size
                     (const Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest   *message);
size_t kentik__saved_filter__v202501alpha1__update_saved_filter_request__pack
                     (const Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest   *message,
                      uint8_t             *out);
size_t kentik__saved_filter__v202501alpha1__update_saved_filter_request__pack_to_buffer
                     (const Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest *
       kentik__saved_filter__v202501alpha1__update_saved_filter_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__saved_filter__v202501alpha1__update_saved_filter_request__free_unpacked
                     (Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse methods */
void   kentik__saved_filter__v202501alpha1__update_saved_filter_response__init
                     (Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse         *message);
size_t kentik__saved_filter__v202501alpha1__update_saved_filter_response__get_packed_size
                     (const Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse   *message);
size_t kentik__saved_filter__v202501alpha1__update_saved_filter_response__pack
                     (const Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse   *message,
                      uint8_t             *out);
size_t kentik__saved_filter__v202501alpha1__update_saved_filter_response__pack_to_buffer
                     (const Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse *
       kentik__saved_filter__v202501alpha1__update_saved_filter_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__saved_filter__v202501alpha1__update_saved_filter_response__free_unpacked
                     (Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest methods */
void   kentik__saved_filter__v202501alpha1__list_saved_filters_request__init
                     (Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest         *message);
size_t kentik__saved_filter__v202501alpha1__list_saved_filters_request__get_packed_size
                     (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest   *message);
size_t kentik__saved_filter__v202501alpha1__list_saved_filters_request__pack
                     (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest   *message,
                      uint8_t             *out);
size_t kentik__saved_filter__v202501alpha1__list_saved_filters_request__pack_to_buffer
                     (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest *
       kentik__saved_filter__v202501alpha1__list_saved_filters_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__saved_filter__v202501alpha1__list_saved_filters_request__free_unpacked
                     (Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest methods */
void   kentik__saved_filter__v202501alpha1__list_saved_filters_all_request__init
                     (Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest         *message);
size_t kentik__saved_filter__v202501alpha1__list_saved_filters_all_request__get_packed_size
                     (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest   *message);
size_t kentik__saved_filter__v202501alpha1__list_saved_filters_all_request__pack
                     (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest   *message,
                      uint8_t             *out);
size_t kentik__saved_filter__v202501alpha1__list_saved_filters_all_request__pack_to_buffer
                     (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest *
       kentik__saved_filter__v202501alpha1__list_saved_filters_all_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__saved_filter__v202501alpha1__list_saved_filters_all_request__free_unpacked
                     (Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse methods */
void   kentik__saved_filter__v202501alpha1__list_saved_filters_response__init
                     (Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse         *message);
size_t kentik__saved_filter__v202501alpha1__list_saved_filters_response__get_packed_size
                     (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse   *message);
size_t kentik__saved_filter__v202501alpha1__list_saved_filters_response__pack
                     (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse   *message,
                      uint8_t             *out);
size_t kentik__saved_filter__v202501alpha1__list_saved_filters_response__pack_to_buffer
                     (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse *
       kentik__saved_filter__v202501alpha1__list_saved_filters_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__saved_filter__v202501alpha1__list_saved_filters_response__free_unpacked
                     (Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse methods */
void   kentik__saved_filter__v202501alpha1__list_saved_filters_all_response__init
                     (Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse         *message);
size_t kentik__saved_filter__v202501alpha1__list_saved_filters_all_response__get_packed_size
                     (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse   *message);
size_t kentik__saved_filter__v202501alpha1__list_saved_filters_all_response__pack
                     (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse   *message,
                      uint8_t             *out);
size_t kentik__saved_filter__v202501alpha1__list_saved_filters_all_response__pack_to_buffer
                     (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse *
       kentik__saved_filter__v202501alpha1__list_saved_filters_all_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__saved_filter__v202501alpha1__list_saved_filters_all_response__free_unpacked
                     (Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest methods */
void   kentik__saved_filter__v202501alpha1__get_saved_filter_request__init
                     (Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest         *message);
size_t kentik__saved_filter__v202501alpha1__get_saved_filter_request__get_packed_size
                     (const Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest   *message);
size_t kentik__saved_filter__v202501alpha1__get_saved_filter_request__pack
                     (const Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest   *message,
                      uint8_t             *out);
size_t kentik__saved_filter__v202501alpha1__get_saved_filter_request__pack_to_buffer
                     (const Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest *
       kentik__saved_filter__v202501alpha1__get_saved_filter_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__saved_filter__v202501alpha1__get_saved_filter_request__free_unpacked
                     (Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse methods */
void   kentik__saved_filter__v202501alpha1__get_saved_filter_response__init
                     (Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse         *message);
size_t kentik__saved_filter__v202501alpha1__get_saved_filter_response__get_packed_size
                     (const Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse   *message);
size_t kentik__saved_filter__v202501alpha1__get_saved_filter_response__pack
                     (const Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse   *message,
                      uint8_t             *out);
size_t kentik__saved_filter__v202501alpha1__get_saved_filter_response__pack_to_buffer
                     (const Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse *
       kentik__saved_filter__v202501alpha1__get_saved_filter_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__saved_filter__v202501alpha1__get_saved_filter_response__free_unpacked
                     (Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest methods */
void   kentik__saved_filter__v202501alpha1__delete_saved_filter_request__init
                     (Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest         *message);
size_t kentik__saved_filter__v202501alpha1__delete_saved_filter_request__get_packed_size
                     (const Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest   *message);
size_t kentik__saved_filter__v202501alpha1__delete_saved_filter_request__pack
                     (const Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest   *message,
                      uint8_t             *out);
size_t kentik__saved_filter__v202501alpha1__delete_saved_filter_request__pack_to_buffer
                     (const Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest *
       kentik__saved_filter__v202501alpha1__delete_saved_filter_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__saved_filter__v202501alpha1__delete_saved_filter_request__free_unpacked
                     (Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse methods */
void   kentik__saved_filter__v202501alpha1__delete_saved_filter_response__init
                     (Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse         *message);
size_t kentik__saved_filter__v202501alpha1__delete_saved_filter_response__get_packed_size
                     (const Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse   *message);
size_t kentik__saved_filter__v202501alpha1__delete_saved_filter_response__pack
                     (const Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse   *message,
                      uint8_t             *out);
size_t kentik__saved_filter__v202501alpha1__delete_saved_filter_response__pack_to_buffer
                     (const Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse *
       kentik__saved_filter__v202501alpha1__delete_saved_filter_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__saved_filter__v202501alpha1__delete_saved_filter_response__free_unpacked
                     (Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest_Closure)
                 (const Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest *message,
                  void *closure_data);
typedef void (*Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse_Closure)
                 (const Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse *message,
                  void *closure_data);
typedef void (*Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest_Closure)
                 (const Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest *message,
                  void *closure_data);
typedef void (*Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse_Closure)
                 (const Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse *message,
                  void *closure_data);
typedef void (*Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest_Closure)
                 (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest *message,
                  void *closure_data);
typedef void (*Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest_Closure)
                 (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest *message,
                  void *closure_data);
typedef void (*Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse_Closure)
                 (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse *message,
                  void *closure_data);
typedef void (*Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse_Closure)
                 (const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse *message,
                  void *closure_data);
typedef void (*Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest_Closure)
                 (const Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest *message,
                  void *closure_data);
typedef void (*Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse_Closure)
                 (const Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse *message,
                  void *closure_data);
typedef void (*Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest_Closure)
                 (const Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest *message,
                  void *closure_data);
typedef void (*Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse_Closure)
                 (const Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse *message,
                  void *closure_data);

/* --- services --- */

typedef struct Kentik__SavedFilter__V202501alpha1__SavedFilterService_Service Kentik__SavedFilter__V202501alpha1__SavedFilterService_Service;
struct Kentik__SavedFilter__V202501alpha1__SavedFilterService_Service
{
  ProtobufCService base;
  void (*create_saved_filter)(Kentik__SavedFilter__V202501alpha1__SavedFilterService_Service *service,
                              const Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest *input,
                              Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse_Closure closure,
                              void *closure_data);
  void (*list_saved_filters)(Kentik__SavedFilter__V202501alpha1__SavedFilterService_Service *service,
                             const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest *input,
                             Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse_Closure closure,
                             void *closure_data);
  void (*list_saved_filters_all)(Kentik__SavedFilter__V202501alpha1__SavedFilterService_Service *service,
                                 const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest *input,
                                 Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse_Closure closure,
                                 void *closure_data);
  void (*get_saved_filter)(Kentik__SavedFilter__V202501alpha1__SavedFilterService_Service *service,
                           const Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest *input,
                           Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse_Closure closure,
                           void *closure_data);
  void (*update_saved_filter)(Kentik__SavedFilter__V202501alpha1__SavedFilterService_Service *service,
                              const Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest *input,
                              Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse_Closure closure,
                              void *closure_data);
  void (*delete_saved_filter)(Kentik__SavedFilter__V202501alpha1__SavedFilterService_Service *service,
                              const Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest *input,
                              Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse_Closure closure,
                              void *closure_data);
};
typedef void (*Kentik__SavedFilter__V202501alpha1__SavedFilterService_ServiceDestroy)(Kentik__SavedFilter__V202501alpha1__SavedFilterService_Service *);
void kentik__saved_filter__v202501alpha1__saved_filter_service__init (Kentik__SavedFilter__V202501alpha1__SavedFilterService_Service *service,
                                                                      Kentik__SavedFilter__V202501alpha1__SavedFilterService_ServiceDestroy destroy);
#define KENTIK__SAVED_FILTER__V202501ALPHA1__SAVED_FILTER_SERVICE__BASE_INIT \
    { &kentik__saved_filter__v202501alpha1__saved_filter_service__descriptor, protobuf_c_service_invoke_internal, NULL }
#define KENTIK__SAVED_FILTER__V202501ALPHA1__SAVED_FILTER_SERVICE__INIT(function_prefix__) \
    { KENTIK__SAVED_FILTER__V202501ALPHA1__SAVED_FILTER_SERVICE__BASE_INIT,\
      function_prefix__ ## create_saved_filter,\
      function_prefix__ ## list_saved_filters,\
      function_prefix__ ## list_saved_filters_all,\
      function_prefix__ ## get_saved_filter,\
      function_prefix__ ## update_saved_filter,\
      function_prefix__ ## delete_saved_filter  }
void kentik__saved_filter__v202501alpha1__saved_filter_service__create_saved_filter(ProtobufCService *service,
                                                                                    const Kentik__SavedFilter__V202501alpha1__CreateSavedFilterRequest *input,
                                                                                    Kentik__SavedFilter__V202501alpha1__CreateSavedFilterResponse_Closure closure,
                                                                                    void *closure_data);
void kentik__saved_filter__v202501alpha1__saved_filter_service__list_saved_filters(ProtobufCService *service,
                                                                                   const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersRequest *input,
                                                                                   Kentik__SavedFilter__V202501alpha1__ListSavedFiltersResponse_Closure closure,
                                                                                   void *closure_data);
void kentik__saved_filter__v202501alpha1__saved_filter_service__list_saved_filters_all(ProtobufCService *service,
                                                                                       const Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllRequest *input,
                                                                                       Kentik__SavedFilter__V202501alpha1__ListSavedFiltersAllResponse_Closure closure,
                                                                                       void *closure_data);
void kentik__saved_filter__v202501alpha1__saved_filter_service__get_saved_filter(ProtobufCService *service,
                                                                                 const Kentik__SavedFilter__V202501alpha1__GetSavedFilterRequest *input,
                                                                                 Kentik__SavedFilter__V202501alpha1__GetSavedFilterResponse_Closure closure,
                                                                                 void *closure_data);
void kentik__saved_filter__v202501alpha1__saved_filter_service__update_saved_filter(ProtobufCService *service,
                                                                                    const Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterRequest *input,
                                                                                    Kentik__SavedFilter__V202501alpha1__UpdateSavedFilterResponse_Closure closure,
                                                                                    void *closure_data);
void kentik__saved_filter__v202501alpha1__saved_filter_service__delete_saved_filter(ProtobufCService *service,
                                                                                    const Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterRequest *input,
                                                                                    Kentik__SavedFilter__V202501alpha1__DeleteSavedFilterResponse_Closure closure,
                                                                                    void *closure_data);

/* --- descriptors --- */

extern const ProtobufCMessageDescriptor kentik__saved_filter__v202501alpha1__create_saved_filter_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__saved_filter__v202501alpha1__create_saved_filter_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__saved_filter__v202501alpha1__update_saved_filter_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__saved_filter__v202501alpha1__update_saved_filter_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__saved_filter__v202501alpha1__list_saved_filters_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__saved_filter__v202501alpha1__list_saved_filters_all_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__saved_filter__v202501alpha1__list_saved_filters_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__saved_filter__v202501alpha1__list_saved_filters_all_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__saved_filter__v202501alpha1__get_saved_filter_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__saved_filter__v202501alpha1__get_saved_filter_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__saved_filter__v202501alpha1__delete_saved_filter_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__saved_filter__v202501alpha1__delete_saved_filter_response__descriptor;
extern const ProtobufCServiceDescriptor kentik__saved_filter__v202501alpha1__saved_filter_service__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_kentik_2fsaved_5ffilter_2fv202501alpha1_2fsaved_5ffilter_2eproto__INCLUDED */
