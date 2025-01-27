/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/diagnostic/v202501/diagnostic.proto */

#ifndef PROTOBUF_C_kentik_2fdiagnostic_2fv202501_2fdiagnostic_2eproto__INCLUDED
#define PROTOBUF_C_kentik_2fdiagnostic_2fv202501_2fdiagnostic_2eproto__INCLUDED

#include <protobuf-c/protobuf-c.h>

PROTOBUF_C__BEGIN_DECLS

#if PROTOBUF_C_VERSION_NUMBER < 1003000
# error This file was generated by a newer version of protoc-c which is incompatible with your libprotobuf-c headers. Please update your headers.
#elif 1004001 < PROTOBUF_C_MIN_COMPILER_VERSION
# error This file was generated by an older version of protoc-c which is incompatible with your libprotobuf-c headers. Please regenerate this file with a newer version of protoc-c.
#endif

#include "google/api/client.pb-c.h"
#include "kentik/core/v202303/annotations.pb-c.h"

typedef struct Kentik__Diagnostic__V202501__EchoRequest Kentik__Diagnostic__V202501__EchoRequest;
typedef struct Kentik__Diagnostic__V202501__EchoResponse Kentik__Diagnostic__V202501__EchoResponse;
typedef struct Kentik__Diagnostic__V202501__ChatRequest Kentik__Diagnostic__V202501__ChatRequest;
typedef struct Kentik__Diagnostic__V202501__ChatResponse Kentik__Diagnostic__V202501__ChatResponse;


/* --- enums --- */


/* --- messages --- */

struct  Kentik__Diagnostic__V202501__EchoRequest
{
  ProtobufCMessage base;
  char *message;
};
#define KENTIK__DIAGNOSTIC__V202501__ECHO_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__diagnostic__v202501__echo_request__descriptor) \
    , (char *)protobuf_c_empty_string }


struct  Kentik__Diagnostic__V202501__EchoResponse
{
  ProtobufCMessage base;
  char *message;
};
#define KENTIK__DIAGNOSTIC__V202501__ECHO_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__diagnostic__v202501__echo_response__descriptor) \
    , (char *)protobuf_c_empty_string }


typedef enum {
  KENTIK__DIAGNOSTIC__V202501__CHAT_REQUEST__MSG__NOT_SET = 0,
  KENTIK__DIAGNOSTIC__V202501__CHAT_REQUEST__MSG_ECHO_REQUEST = 2,
  KENTIK__DIAGNOSTIC__V202501__CHAT_REQUEST__MSG_ECHO_RESPONSE = 3
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__DIAGNOSTIC__V202501__CHAT_REQUEST__MSG__CASE)
} Kentik__Diagnostic__V202501__ChatRequest__MsgCase;

struct  Kentik__Diagnostic__V202501__ChatRequest
{
  ProtobufCMessage base;
  char *message_id;
  Kentik__Diagnostic__V202501__ChatRequest__MsgCase msg_case;
  union {
    Kentik__Diagnostic__V202501__EchoRequest *echo_request;
    Kentik__Diagnostic__V202501__EchoResponse *echo_response;
  };
};
#define KENTIK__DIAGNOSTIC__V202501__CHAT_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__diagnostic__v202501__chat_request__descriptor) \
    , (char *)protobuf_c_empty_string, KENTIK__DIAGNOSTIC__V202501__CHAT_REQUEST__MSG__NOT_SET, {0} }


typedef enum {
  KENTIK__DIAGNOSTIC__V202501__CHAT_RESPONSE__MSG__NOT_SET = 0,
  KENTIK__DIAGNOSTIC__V202501__CHAT_RESPONSE__MSG_ECHO_REQUEST = 2,
  KENTIK__DIAGNOSTIC__V202501__CHAT_RESPONSE__MSG_ECHO_RESPONSE = 3
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__DIAGNOSTIC__V202501__CHAT_RESPONSE__MSG__CASE)
} Kentik__Diagnostic__V202501__ChatResponse__MsgCase;

struct  Kentik__Diagnostic__V202501__ChatResponse
{
  ProtobufCMessage base;
  char *message_id;
  Kentik__Diagnostic__V202501__ChatResponse__MsgCase msg_case;
  union {
    Kentik__Diagnostic__V202501__EchoRequest *echo_request;
    Kentik__Diagnostic__V202501__EchoResponse *echo_response;
  };
};
#define KENTIK__DIAGNOSTIC__V202501__CHAT_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__diagnostic__v202501__chat_response__descriptor) \
    , (char *)protobuf_c_empty_string, KENTIK__DIAGNOSTIC__V202501__CHAT_RESPONSE__MSG__NOT_SET, {0} }


/* Kentik__Diagnostic__V202501__EchoRequest methods */
void   kentik__diagnostic__v202501__echo_request__init
                     (Kentik__Diagnostic__V202501__EchoRequest         *message);
size_t kentik__diagnostic__v202501__echo_request__get_packed_size
                     (const Kentik__Diagnostic__V202501__EchoRequest   *message);
size_t kentik__diagnostic__v202501__echo_request__pack
                     (const Kentik__Diagnostic__V202501__EchoRequest   *message,
                      uint8_t             *out);
size_t kentik__diagnostic__v202501__echo_request__pack_to_buffer
                     (const Kentik__Diagnostic__V202501__EchoRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Diagnostic__V202501__EchoRequest *
       kentik__diagnostic__v202501__echo_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__diagnostic__v202501__echo_request__free_unpacked
                     (Kentik__Diagnostic__V202501__EchoRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Diagnostic__V202501__EchoResponse methods */
void   kentik__diagnostic__v202501__echo_response__init
                     (Kentik__Diagnostic__V202501__EchoResponse         *message);
size_t kentik__diagnostic__v202501__echo_response__get_packed_size
                     (const Kentik__Diagnostic__V202501__EchoResponse   *message);
size_t kentik__diagnostic__v202501__echo_response__pack
                     (const Kentik__Diagnostic__V202501__EchoResponse   *message,
                      uint8_t             *out);
size_t kentik__diagnostic__v202501__echo_response__pack_to_buffer
                     (const Kentik__Diagnostic__V202501__EchoResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Diagnostic__V202501__EchoResponse *
       kentik__diagnostic__v202501__echo_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__diagnostic__v202501__echo_response__free_unpacked
                     (Kentik__Diagnostic__V202501__EchoResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Diagnostic__V202501__ChatRequest methods */
void   kentik__diagnostic__v202501__chat_request__init
                     (Kentik__Diagnostic__V202501__ChatRequest         *message);
size_t kentik__diagnostic__v202501__chat_request__get_packed_size
                     (const Kentik__Diagnostic__V202501__ChatRequest   *message);
size_t kentik__diagnostic__v202501__chat_request__pack
                     (const Kentik__Diagnostic__V202501__ChatRequest   *message,
                      uint8_t             *out);
size_t kentik__diagnostic__v202501__chat_request__pack_to_buffer
                     (const Kentik__Diagnostic__V202501__ChatRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Diagnostic__V202501__ChatRequest *
       kentik__diagnostic__v202501__chat_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__diagnostic__v202501__chat_request__free_unpacked
                     (Kentik__Diagnostic__V202501__ChatRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Diagnostic__V202501__ChatResponse methods */
void   kentik__diagnostic__v202501__chat_response__init
                     (Kentik__Diagnostic__V202501__ChatResponse         *message);
size_t kentik__diagnostic__v202501__chat_response__get_packed_size
                     (const Kentik__Diagnostic__V202501__ChatResponse   *message);
size_t kentik__diagnostic__v202501__chat_response__pack
                     (const Kentik__Diagnostic__V202501__ChatResponse   *message,
                      uint8_t             *out);
size_t kentik__diagnostic__v202501__chat_response__pack_to_buffer
                     (const Kentik__Diagnostic__V202501__ChatResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Diagnostic__V202501__ChatResponse *
       kentik__diagnostic__v202501__chat_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__diagnostic__v202501__chat_response__free_unpacked
                     (Kentik__Diagnostic__V202501__ChatResponse *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Kentik__Diagnostic__V202501__EchoRequest_Closure)
                 (const Kentik__Diagnostic__V202501__EchoRequest *message,
                  void *closure_data);
typedef void (*Kentik__Diagnostic__V202501__EchoResponse_Closure)
                 (const Kentik__Diagnostic__V202501__EchoResponse *message,
                  void *closure_data);
typedef void (*Kentik__Diagnostic__V202501__ChatRequest_Closure)
                 (const Kentik__Diagnostic__V202501__ChatRequest *message,
                  void *closure_data);
typedef void (*Kentik__Diagnostic__V202501__ChatResponse_Closure)
                 (const Kentik__Diagnostic__V202501__ChatResponse *message,
                  void *closure_data);

/* --- services --- */

typedef struct Kentik__Diagnostic__V202501__DiagnosticService_Service Kentik__Diagnostic__V202501__DiagnosticService_Service;
struct Kentik__Diagnostic__V202501__DiagnosticService_Service
{
  ProtobufCService base;
  void (*echo)(Kentik__Diagnostic__V202501__DiagnosticService_Service *service,
               const Kentik__Diagnostic__V202501__EchoRequest *input,
               Kentik__Diagnostic__V202501__EchoResponse_Closure closure,
               void *closure_data);
  void (*chat)(Kentik__Diagnostic__V202501__DiagnosticService_Service *service,
               const Kentik__Diagnostic__V202501__ChatRequest *input,
               Kentik__Diagnostic__V202501__ChatResponse_Closure closure,
               void *closure_data);
};
typedef void (*Kentik__Diagnostic__V202501__DiagnosticService_ServiceDestroy)(Kentik__Diagnostic__V202501__DiagnosticService_Service *);
void kentik__diagnostic__v202501__diagnostic_service__init (Kentik__Diagnostic__V202501__DiagnosticService_Service *service,
                                                            Kentik__Diagnostic__V202501__DiagnosticService_ServiceDestroy destroy);
#define KENTIK__DIAGNOSTIC__V202501__DIAGNOSTIC_SERVICE__BASE_INIT \
    { &kentik__diagnostic__v202501__diagnostic_service__descriptor, protobuf_c_service_invoke_internal, NULL }
#define KENTIK__DIAGNOSTIC__V202501__DIAGNOSTIC_SERVICE__INIT(function_prefix__) \
    { KENTIK__DIAGNOSTIC__V202501__DIAGNOSTIC_SERVICE__BASE_INIT,\
      function_prefix__ ## echo,\
      function_prefix__ ## chat  }
void kentik__diagnostic__v202501__diagnostic_service__echo(ProtobufCService *service,
                                                           const Kentik__Diagnostic__V202501__EchoRequest *input,
                                                           Kentik__Diagnostic__V202501__EchoResponse_Closure closure,
                                                           void *closure_data);
void kentik__diagnostic__v202501__diagnostic_service__chat(ProtobufCService *service,
                                                           const Kentik__Diagnostic__V202501__ChatRequest *input,
                                                           Kentik__Diagnostic__V202501__ChatResponse_Closure closure,
                                                           void *closure_data);

/* --- descriptors --- */

extern const ProtobufCMessageDescriptor kentik__diagnostic__v202501__echo_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__diagnostic__v202501__echo_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__diagnostic__v202501__chat_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__diagnostic__v202501__chat_response__descriptor;
extern const ProtobufCServiceDescriptor kentik__diagnostic__v202501__diagnostic_service__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_kentik_2fdiagnostic_2fv202501_2fdiagnostic_2eproto__INCLUDED */
