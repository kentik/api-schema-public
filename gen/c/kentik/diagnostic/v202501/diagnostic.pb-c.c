/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/diagnostic/v202501/diagnostic.proto */

/* Do not generate deprecated warnings for self */
#ifndef PROTOBUF_C__NO_DEPRECATED
#define PROTOBUF_C__NO_DEPRECATED
#endif

#include "kentik/diagnostic/v202501/diagnostic.pb-c.h"
void   kentik__diagnostic__v202501__echo_request__init
                     (Kentik__Diagnostic__V202501__EchoRequest         *message)
{
  static const Kentik__Diagnostic__V202501__EchoRequest init_value = KENTIK__DIAGNOSTIC__V202501__ECHO_REQUEST__INIT;
  *message = init_value;
}
size_t kentik__diagnostic__v202501__echo_request__get_packed_size
                     (const Kentik__Diagnostic__V202501__EchoRequest *message)
{
  assert(message->base.descriptor == &kentik__diagnostic__v202501__echo_request__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__diagnostic__v202501__echo_request__pack
                     (const Kentik__Diagnostic__V202501__EchoRequest *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__diagnostic__v202501__echo_request__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__diagnostic__v202501__echo_request__pack_to_buffer
                     (const Kentik__Diagnostic__V202501__EchoRequest *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__diagnostic__v202501__echo_request__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Diagnostic__V202501__EchoRequest *
       kentik__diagnostic__v202501__echo_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Diagnostic__V202501__EchoRequest *)
     protobuf_c_message_unpack (&kentik__diagnostic__v202501__echo_request__descriptor,
                                allocator, len, data);
}
void   kentik__diagnostic__v202501__echo_request__free_unpacked
                     (Kentik__Diagnostic__V202501__EchoRequest *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__diagnostic__v202501__echo_request__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   kentik__diagnostic__v202501__echo_response__init
                     (Kentik__Diagnostic__V202501__EchoResponse         *message)
{
  static const Kentik__Diagnostic__V202501__EchoResponse init_value = KENTIK__DIAGNOSTIC__V202501__ECHO_RESPONSE__INIT;
  *message = init_value;
}
size_t kentik__diagnostic__v202501__echo_response__get_packed_size
                     (const Kentik__Diagnostic__V202501__EchoResponse *message)
{
  assert(message->base.descriptor == &kentik__diagnostic__v202501__echo_response__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__diagnostic__v202501__echo_response__pack
                     (const Kentik__Diagnostic__V202501__EchoResponse *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__diagnostic__v202501__echo_response__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__diagnostic__v202501__echo_response__pack_to_buffer
                     (const Kentik__Diagnostic__V202501__EchoResponse *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__diagnostic__v202501__echo_response__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Diagnostic__V202501__EchoResponse *
       kentik__diagnostic__v202501__echo_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Diagnostic__V202501__EchoResponse *)
     protobuf_c_message_unpack (&kentik__diagnostic__v202501__echo_response__descriptor,
                                allocator, len, data);
}
void   kentik__diagnostic__v202501__echo_response__free_unpacked
                     (Kentik__Diagnostic__V202501__EchoResponse *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__diagnostic__v202501__echo_response__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   kentik__diagnostic__v202501__chat_request__init
                     (Kentik__Diagnostic__V202501__ChatRequest         *message)
{
  static const Kentik__Diagnostic__V202501__ChatRequest init_value = KENTIK__DIAGNOSTIC__V202501__CHAT_REQUEST__INIT;
  *message = init_value;
}
size_t kentik__diagnostic__v202501__chat_request__get_packed_size
                     (const Kentik__Diagnostic__V202501__ChatRequest *message)
{
  assert(message->base.descriptor == &kentik__diagnostic__v202501__chat_request__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__diagnostic__v202501__chat_request__pack
                     (const Kentik__Diagnostic__V202501__ChatRequest *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__diagnostic__v202501__chat_request__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__diagnostic__v202501__chat_request__pack_to_buffer
                     (const Kentik__Diagnostic__V202501__ChatRequest *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__diagnostic__v202501__chat_request__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Diagnostic__V202501__ChatRequest *
       kentik__diagnostic__v202501__chat_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Diagnostic__V202501__ChatRequest *)
     protobuf_c_message_unpack (&kentik__diagnostic__v202501__chat_request__descriptor,
                                allocator, len, data);
}
void   kentik__diagnostic__v202501__chat_request__free_unpacked
                     (Kentik__Diagnostic__V202501__ChatRequest *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__diagnostic__v202501__chat_request__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   kentik__diagnostic__v202501__chat_response__init
                     (Kentik__Diagnostic__V202501__ChatResponse         *message)
{
  static const Kentik__Diagnostic__V202501__ChatResponse init_value = KENTIK__DIAGNOSTIC__V202501__CHAT_RESPONSE__INIT;
  *message = init_value;
}
size_t kentik__diagnostic__v202501__chat_response__get_packed_size
                     (const Kentik__Diagnostic__V202501__ChatResponse *message)
{
  assert(message->base.descriptor == &kentik__diagnostic__v202501__chat_response__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__diagnostic__v202501__chat_response__pack
                     (const Kentik__Diagnostic__V202501__ChatResponse *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__diagnostic__v202501__chat_response__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__diagnostic__v202501__chat_response__pack_to_buffer
                     (const Kentik__Diagnostic__V202501__ChatResponse *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__diagnostic__v202501__chat_response__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Diagnostic__V202501__ChatResponse *
       kentik__diagnostic__v202501__chat_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Diagnostic__V202501__ChatResponse *)
     protobuf_c_message_unpack (&kentik__diagnostic__v202501__chat_response__descriptor,
                                allocator, len, data);
}
void   kentik__diagnostic__v202501__chat_response__free_unpacked
                     (Kentik__Diagnostic__V202501__ChatResponse *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__diagnostic__v202501__chat_response__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
static const ProtobufCFieldDescriptor kentik__diagnostic__v202501__echo_request__field_descriptors[1] =
{
  {
    "message",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Diagnostic__V202501__EchoRequest, message),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__diagnostic__v202501__echo_request__field_indices_by_name[] = {
  0,   /* field[0] = message */
};
static const ProtobufCIntRange kentik__diagnostic__v202501__echo_request__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 1 }
};
const ProtobufCMessageDescriptor kentik__diagnostic__v202501__echo_request__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.diagnostic.v202501.EchoRequest",
  "EchoRequest",
  "Kentik__Diagnostic__V202501__EchoRequest",
  "kentik.diagnostic.v202501",
  sizeof(Kentik__Diagnostic__V202501__EchoRequest),
  1,
  kentik__diagnostic__v202501__echo_request__field_descriptors,
  kentik__diagnostic__v202501__echo_request__field_indices_by_name,
  1,  kentik__diagnostic__v202501__echo_request__number_ranges,
  (ProtobufCMessageInit) kentik__diagnostic__v202501__echo_request__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCFieldDescriptor kentik__diagnostic__v202501__echo_response__field_descriptors[1] =
{
  {
    "message",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Diagnostic__V202501__EchoResponse, message),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__diagnostic__v202501__echo_response__field_indices_by_name[] = {
  0,   /* field[0] = message */
};
static const ProtobufCIntRange kentik__diagnostic__v202501__echo_response__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 1 }
};
const ProtobufCMessageDescriptor kentik__diagnostic__v202501__echo_response__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.diagnostic.v202501.EchoResponse",
  "EchoResponse",
  "Kentik__Diagnostic__V202501__EchoResponse",
  "kentik.diagnostic.v202501",
  sizeof(Kentik__Diagnostic__V202501__EchoResponse),
  1,
  kentik__diagnostic__v202501__echo_response__field_descriptors,
  kentik__diagnostic__v202501__echo_response__field_indices_by_name,
  1,  kentik__diagnostic__v202501__echo_response__number_ranges,
  (ProtobufCMessageInit) kentik__diagnostic__v202501__echo_response__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCFieldDescriptor kentik__diagnostic__v202501__chat_request__field_descriptors[3] =
{
  {
    "message_id",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Diagnostic__V202501__ChatRequest, message_id),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "echo_request",
    2,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_MESSAGE,
    offsetof(Kentik__Diagnostic__V202501__ChatRequest, msg_case),
    offsetof(Kentik__Diagnostic__V202501__ChatRequest, echo_request),
    &kentik__diagnostic__v202501__echo_request__descriptor,
    NULL,
    0 | PROTOBUF_C_FIELD_FLAG_ONEOF,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "echo_response",
    3,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_MESSAGE,
    offsetof(Kentik__Diagnostic__V202501__ChatRequest, msg_case),
    offsetof(Kentik__Diagnostic__V202501__ChatRequest, echo_response),
    &kentik__diagnostic__v202501__echo_response__descriptor,
    NULL,
    0 | PROTOBUF_C_FIELD_FLAG_ONEOF,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__diagnostic__v202501__chat_request__field_indices_by_name[] = {
  1,   /* field[1] = echo_request */
  2,   /* field[2] = echo_response */
  0,   /* field[0] = message_id */
};
static const ProtobufCIntRange kentik__diagnostic__v202501__chat_request__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 3 }
};
const ProtobufCMessageDescriptor kentik__diagnostic__v202501__chat_request__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.diagnostic.v202501.ChatRequest",
  "ChatRequest",
  "Kentik__Diagnostic__V202501__ChatRequest",
  "kentik.diagnostic.v202501",
  sizeof(Kentik__Diagnostic__V202501__ChatRequest),
  3,
  kentik__diagnostic__v202501__chat_request__field_descriptors,
  kentik__diagnostic__v202501__chat_request__field_indices_by_name,
  1,  kentik__diagnostic__v202501__chat_request__number_ranges,
  (ProtobufCMessageInit) kentik__diagnostic__v202501__chat_request__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCFieldDescriptor kentik__diagnostic__v202501__chat_response__field_descriptors[3] =
{
  {
    "message_id",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Diagnostic__V202501__ChatResponse, message_id),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "echo_request",
    2,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_MESSAGE,
    offsetof(Kentik__Diagnostic__V202501__ChatResponse, msg_case),
    offsetof(Kentik__Diagnostic__V202501__ChatResponse, echo_request),
    &kentik__diagnostic__v202501__echo_request__descriptor,
    NULL,
    0 | PROTOBUF_C_FIELD_FLAG_ONEOF,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "echo_response",
    3,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_MESSAGE,
    offsetof(Kentik__Diagnostic__V202501__ChatResponse, msg_case),
    offsetof(Kentik__Diagnostic__V202501__ChatResponse, echo_response),
    &kentik__diagnostic__v202501__echo_response__descriptor,
    NULL,
    0 | PROTOBUF_C_FIELD_FLAG_ONEOF,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__diagnostic__v202501__chat_response__field_indices_by_name[] = {
  1,   /* field[1] = echo_request */
  2,   /* field[2] = echo_response */
  0,   /* field[0] = message_id */
};
static const ProtobufCIntRange kentik__diagnostic__v202501__chat_response__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 3 }
};
const ProtobufCMessageDescriptor kentik__diagnostic__v202501__chat_response__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.diagnostic.v202501.ChatResponse",
  "ChatResponse",
  "Kentik__Diagnostic__V202501__ChatResponse",
  "kentik.diagnostic.v202501",
  sizeof(Kentik__Diagnostic__V202501__ChatResponse),
  3,
  kentik__diagnostic__v202501__chat_response__field_descriptors,
  kentik__diagnostic__v202501__chat_response__field_indices_by_name,
  1,  kentik__diagnostic__v202501__chat_response__number_ranges,
  (ProtobufCMessageInit) kentik__diagnostic__v202501__chat_response__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCMethodDescriptor kentik__diagnostic__v202501__diagnostic_service__method_descriptors[2] =
{
  { "Echo", &kentik__diagnostic__v202501__echo_request__descriptor, &kentik__diagnostic__v202501__echo_response__descriptor },
  { "Chat", &kentik__diagnostic__v202501__chat_request__descriptor, &kentik__diagnostic__v202501__chat_response__descriptor },
};
const unsigned kentik__diagnostic__v202501__diagnostic_service__method_indices_by_name[] = {
  1,        /* Chat */
  0         /* Echo */
};
const ProtobufCServiceDescriptor kentik__diagnostic__v202501__diagnostic_service__descriptor =
{
  PROTOBUF_C__SERVICE_DESCRIPTOR_MAGIC,
  "kentik.diagnostic.v202501.DiagnosticService",
  "DiagnosticService",
  "Kentik__Diagnostic__V202501__DiagnosticService",
  "kentik.diagnostic.v202501",
  2,
  kentik__diagnostic__v202501__diagnostic_service__method_descriptors,
  kentik__diagnostic__v202501__diagnostic_service__method_indices_by_name
};
void kentik__diagnostic__v202501__diagnostic_service__echo(ProtobufCService *service,
                                                           const Kentik__Diagnostic__V202501__EchoRequest *input,
                                                           Kentik__Diagnostic__V202501__EchoResponse_Closure closure,
                                                           void *closure_data)
{
  assert(service->descriptor == &kentik__diagnostic__v202501__diagnostic_service__descriptor);
  service->invoke(service, 0, (const ProtobufCMessage *) input, (ProtobufCClosure) closure, closure_data);
}
void kentik__diagnostic__v202501__diagnostic_service__chat(ProtobufCService *service,
                                                           const Kentik__Diagnostic__V202501__ChatRequest *input,
                                                           Kentik__Diagnostic__V202501__ChatResponse_Closure closure,
                                                           void *closure_data)
{
  assert(service->descriptor == &kentik__diagnostic__v202501__diagnostic_service__descriptor);
  service->invoke(service, 1, (const ProtobufCMessage *) input, (ProtobufCClosure) closure, closure_data);
}
void kentik__diagnostic__v202501__diagnostic_service__init (Kentik__Diagnostic__V202501__DiagnosticService_Service *service,
                                                            Kentik__Diagnostic__V202501__DiagnosticService_ServiceDestroy destroy)
{
  protobuf_c_service_generated_init (&service->base,
                                     &kentik__diagnostic__v202501__diagnostic_service__descriptor,
                                     (ProtobufCServiceDestroy) destroy);
}