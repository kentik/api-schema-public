/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/core/v202012alpha1/errors.proto */

/* Do not generate deprecated warnings for self */
#ifndef PROTOBUF_C__NO_DEPRECATED
#define PROTOBUF_C__NO_DEPRECATED
#endif

#include "kentik/core/v202012alpha1/errors.pb-c.h"
void   kentik__core__v202012alpha1__error_info__init
                     (Kentik__Core__V202012alpha1__ErrorInfo         *message)
{
  static const Kentik__Core__V202012alpha1__ErrorInfo init_value = KENTIK__CORE__V202012ALPHA1__ERROR_INFO__INIT;
  *message = init_value;
}
size_t kentik__core__v202012alpha1__error_info__get_packed_size
                     (const Kentik__Core__V202012alpha1__ErrorInfo *message)
{
  assert(message->base.descriptor == &kentik__core__v202012alpha1__error_info__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__core__v202012alpha1__error_info__pack
                     (const Kentik__Core__V202012alpha1__ErrorInfo *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__core__v202012alpha1__error_info__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__core__v202012alpha1__error_info__pack_to_buffer
                     (const Kentik__Core__V202012alpha1__ErrorInfo *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__core__v202012alpha1__error_info__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Core__V202012alpha1__ErrorInfo *
       kentik__core__v202012alpha1__error_info__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Core__V202012alpha1__ErrorInfo *)
     protobuf_c_message_unpack (&kentik__core__v202012alpha1__error_info__descriptor,
                                allocator, len, data);
}
void   kentik__core__v202012alpha1__error_info__free_unpacked
                     (Kentik__Core__V202012alpha1__ErrorInfo *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__core__v202012alpha1__error_info__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
static const ProtobufCFieldDescriptor kentik__core__v202012alpha1__error_info__field_descriptors[5] =
{
  {
    "code",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_INT32,
    0,   /* quantifier_offset */
    offsetof(Kentik__Core__V202012alpha1__ErrorInfo, code),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "message",
    2,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Core__V202012alpha1__ErrorInfo, message),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "correlation_id",
    3,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Core__V202012alpha1__ErrorInfo, correlation_id),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "timestamp",
    4,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_MESSAGE,
    0,   /* quantifier_offset */
    offsetof(Kentik__Core__V202012alpha1__ErrorInfo, timestamp),
    &google__protobuf__timestamp__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "documentation_link",
    5,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Core__V202012alpha1__ErrorInfo, documentation_link),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__core__v202012alpha1__error_info__field_indices_by_name[] = {
  0,   /* field[0] = code */
  2,   /* field[2] = correlation_id */
  4,   /* field[4] = documentation_link */
  1,   /* field[1] = message */
  3,   /* field[3] = timestamp */
};
static const ProtobufCIntRange kentik__core__v202012alpha1__error_info__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 5 }
};
const ProtobufCMessageDescriptor kentik__core__v202012alpha1__error_info__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.core.v202012alpha1.ErrorInfo",
  "ErrorInfo",
  "Kentik__Core__V202012alpha1__ErrorInfo",
  "kentik.core.v202012alpha1",
  sizeof(Kentik__Core__V202012alpha1__ErrorInfo),
  5,
  kentik__core__v202012alpha1__error_info__field_descriptors,
  kentik__core__v202012alpha1__error_info__field_indices_by_name,
  1,  kentik__core__v202012alpha1__error_info__number_ranges,
  (ProtobufCMessageInit) kentik__core__v202012alpha1__error_info__init,
  NULL,NULL,NULL    /* reserved[123] */
};
