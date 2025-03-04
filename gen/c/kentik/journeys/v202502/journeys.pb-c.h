/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/journeys/v202502/journeys.proto */

#ifndef PROTOBUF_C_kentik_2fjourneys_2fv202502_2fjourneys_2eproto__INCLUDED
#define PROTOBUF_C_kentik_2fjourneys_2fv202502_2fjourneys_2eproto__INCLUDED

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

typedef struct Kentik__Journeys__V202502__JourneysRequest Kentik__Journeys__V202502__JourneysRequest;
typedef struct Kentik__Journeys__V202502__JourneysResponse Kentik__Journeys__V202502__JourneysResponse;


/* --- enums --- */


/* --- messages --- */

/*
 * {{.Name}}
 */
struct  Kentik__Journeys__V202502__JourneysRequest
{
  ProtobufCMessage base;
  char *prompt;
};
#define KENTIK__JOURNEYS__V202502__JOURNEYS_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__journeys__v202502__journeys_request__descriptor) \
    , (char *)protobuf_c_empty_string }


typedef enum {
  KENTIK__JOURNEYS__V202502__JOURNEYS_RESPONSE___DATA__NOT_SET = 0,
  KENTIK__JOURNEYS__V202502__JOURNEYS_RESPONSE___DATA_DATA = 2
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__JOURNEYS__V202502__JOURNEYS_RESPONSE___DATA__CASE)
} Kentik__Journeys__V202502__JourneysResponse__DataCase;

/*
 * {{.Name}}
 */
struct  Kentik__Journeys__V202502__JourneysResponse
{
  ProtobufCMessage base;
  char *summary;
  Kentik__Journeys__V202502__JourneysResponse__DataCase _data_case;
  union {
    char *data;
  };
};
#define KENTIK__JOURNEYS__V202502__JOURNEYS_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__journeys__v202502__journeys_response__descriptor) \
    , (char *)protobuf_c_empty_string, KENTIK__JOURNEYS__V202502__JOURNEYS_RESPONSE___DATA__NOT_SET, {0} }


/* Kentik__Journeys__V202502__JourneysRequest methods */
void   kentik__journeys__v202502__journeys_request__init
                     (Kentik__Journeys__V202502__JourneysRequest         *message);
size_t kentik__journeys__v202502__journeys_request__get_packed_size
                     (const Kentik__Journeys__V202502__JourneysRequest   *message);
size_t kentik__journeys__v202502__journeys_request__pack
                     (const Kentik__Journeys__V202502__JourneysRequest   *message,
                      uint8_t             *out);
size_t kentik__journeys__v202502__journeys_request__pack_to_buffer
                     (const Kentik__Journeys__V202502__JourneysRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Journeys__V202502__JourneysRequest *
       kentik__journeys__v202502__journeys_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__journeys__v202502__journeys_request__free_unpacked
                     (Kentik__Journeys__V202502__JourneysRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Journeys__V202502__JourneysResponse methods */
void   kentik__journeys__v202502__journeys_response__init
                     (Kentik__Journeys__V202502__JourneysResponse         *message);
size_t kentik__journeys__v202502__journeys_response__get_packed_size
                     (const Kentik__Journeys__V202502__JourneysResponse   *message);
size_t kentik__journeys__v202502__journeys_response__pack
                     (const Kentik__Journeys__V202502__JourneysResponse   *message,
                      uint8_t             *out);
size_t kentik__journeys__v202502__journeys_response__pack_to_buffer
                     (const Kentik__Journeys__V202502__JourneysResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Journeys__V202502__JourneysResponse *
       kentik__journeys__v202502__journeys_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__journeys__v202502__journeys_response__free_unpacked
                     (Kentik__Journeys__V202502__JourneysResponse *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Kentik__Journeys__V202502__JourneysRequest_Closure)
                 (const Kentik__Journeys__V202502__JourneysRequest *message,
                  void *closure_data);
typedef void (*Kentik__Journeys__V202502__JourneysResponse_Closure)
                 (const Kentik__Journeys__V202502__JourneysResponse *message,
                  void *closure_data);

/* --- services --- */

typedef struct Kentik__Journeys__V202502__JourneysDataService_Service Kentik__Journeys__V202502__JourneysDataService_Service;
struct Kentik__Journeys__V202502__JourneysDataService_Service
{
  ProtobufCService base;
  void (*journeys)(Kentik__Journeys__V202502__JourneysDataService_Service *service,
                   const Kentik__Journeys__V202502__JourneysRequest *input,
                   Kentik__Journeys__V202502__JourneysResponse_Closure closure,
                   void *closure_data);
};
typedef void (*Kentik__Journeys__V202502__JourneysDataService_ServiceDestroy)(Kentik__Journeys__V202502__JourneysDataService_Service *);
void kentik__journeys__v202502__journeys_data_service__init (Kentik__Journeys__V202502__JourneysDataService_Service *service,
                                                             Kentik__Journeys__V202502__JourneysDataService_ServiceDestroy destroy);
#define KENTIK__JOURNEYS__V202502__JOURNEYS_DATA_SERVICE__BASE_INIT \
    { &kentik__journeys__v202502__journeys_data_service__descriptor, protobuf_c_service_invoke_internal, NULL }
#define KENTIK__JOURNEYS__V202502__JOURNEYS_DATA_SERVICE__INIT(function_prefix__) \
    { KENTIK__JOURNEYS__V202502__JOURNEYS_DATA_SERVICE__BASE_INIT,\
      function_prefix__ ## journeys  }
void kentik__journeys__v202502__journeys_data_service__journeys(ProtobufCService *service,
                                                                const Kentik__Journeys__V202502__JourneysRequest *input,
                                                                Kentik__Journeys__V202502__JourneysResponse_Closure closure,
                                                                void *closure_data);

/* --- descriptors --- */

extern const ProtobufCMessageDescriptor kentik__journeys__v202502__journeys_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__journeys__v202502__journeys_response__descriptor;
extern const ProtobufCServiceDescriptor kentik__journeys__v202502__journeys_data_service__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_kentik_2fjourneys_2fv202502_2fjourneys_2eproto__INCLUDED */
