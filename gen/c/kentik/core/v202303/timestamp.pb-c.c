/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/core/v202303/timestamp.proto */

/* Do not generate deprecated warnings for self */
#ifndef PROTOBUF_C__NO_DEPRECATED
#define PROTOBUF_C__NO_DEPRECATED
#endif

#include "kentik/core/v202303/timestamp.pb-c.h"
void   kentik__core__v202303__pseudo_timestamp__init
                     (Kentik__Core__V202303__PseudoTimestamp         *message)
{
  static const Kentik__Core__V202303__PseudoTimestamp init_value = KENTIK__CORE__V202303__PSEUDO_TIMESTAMP__INIT;
  *message = init_value;
}
size_t kentik__core__v202303__pseudo_timestamp__get_packed_size
                     (const Kentik__Core__V202303__PseudoTimestamp *message)
{
  assert(message->base.descriptor == &kentik__core__v202303__pseudo_timestamp__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__core__v202303__pseudo_timestamp__pack
                     (const Kentik__Core__V202303__PseudoTimestamp *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__core__v202303__pseudo_timestamp__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__core__v202303__pseudo_timestamp__pack_to_buffer
                     (const Kentik__Core__V202303__PseudoTimestamp *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__core__v202303__pseudo_timestamp__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Core__V202303__PseudoTimestamp *
       kentik__core__v202303__pseudo_timestamp__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Core__V202303__PseudoTimestamp *)
     protobuf_c_message_unpack (&kentik__core__v202303__pseudo_timestamp__descriptor,
                                allocator, len, data);
}
void   kentik__core__v202303__pseudo_timestamp__free_unpacked
                     (Kentik__Core__V202303__PseudoTimestamp *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__core__v202303__pseudo_timestamp__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
static const ProtobufCFieldDescriptor kentik__core__v202303__pseudo_timestamp__field_descriptors[2] =
{
  {
    "seconds",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_INT64,
    0,   /* quantifier_offset */
    offsetof(Kentik__Core__V202303__PseudoTimestamp, seconds),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "nanos",
    2,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_INT32,
    0,   /* quantifier_offset */
    offsetof(Kentik__Core__V202303__PseudoTimestamp, nanos),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__core__v202303__pseudo_timestamp__field_indices_by_name[] = {
  1,   /* field[1] = nanos */
  0,   /* field[0] = seconds */
};
static const ProtobufCIntRange kentik__core__v202303__pseudo_timestamp__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 2 }
};
const ProtobufCMessageDescriptor kentik__core__v202303__pseudo_timestamp__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.core.v202303.PseudoTimestamp",
  "PseudoTimestamp",
  "Kentik__Core__V202303__PseudoTimestamp",
  "kentik.core.v202303",
  sizeof(Kentik__Core__V202303__PseudoTimestamp),
  2,
  kentik__core__v202303__pseudo_timestamp__field_descriptors,
  kentik__core__v202303__pseudo_timestamp__field_indices_by_name,
  1,  kentik__core__v202303__pseudo_timestamp__number_ranges,
  (ProtobufCMessageInit) kentik__core__v202303__pseudo_timestamp__init,
  NULL,NULL,NULL    /* reserved[123] */
};
