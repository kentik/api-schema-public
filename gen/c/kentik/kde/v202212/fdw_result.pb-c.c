/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/kde/v202212/fdw_result.proto */

/* Do not generate deprecated warnings for self */
#ifndef PROTOBUF_C__NO_DEPRECATED
#define PROTOBUF_C__NO_DEPRECATED
#endif

#include "kentik/kde/v202212/fdw_result.pb-c.h"
void   kentik__kde__v202212__fdw_query__init
                     (Kentik__Kde__V202212__FdwQuery         *message)
{
  static const Kentik__Kde__V202212__FdwQuery init_value = KENTIK__KDE__V202212__FDW_QUERY__INIT;
  *message = init_value;
}
size_t kentik__kde__v202212__fdw_query__get_packed_size
                     (const Kentik__Kde__V202212__FdwQuery *message)
{
  assert(message->base.descriptor == &kentik__kde__v202212__fdw_query__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__kde__v202212__fdw_query__pack
                     (const Kentik__Kde__V202212__FdwQuery *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__kde__v202212__fdw_query__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__kde__v202212__fdw_query__pack_to_buffer
                     (const Kentik__Kde__V202212__FdwQuery *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__kde__v202212__fdw_query__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Kde__V202212__FdwQuery *
       kentik__kde__v202212__fdw_query__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Kde__V202212__FdwQuery *)
     protobuf_c_message_unpack (&kentik__kde__v202212__fdw_query__descriptor,
                                allocator, len, data);
}
void   kentik__kde__v202212__fdw_query__free_unpacked
                     (Kentik__Kde__V202212__FdwQuery *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__kde__v202212__fdw_query__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
static const ProtobufCFieldDescriptor kentik__kde__v202212__fdw_query__field_descriptors[13] =
{
  {
    "request_id",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Kde__V202212__FdwQuery, request_id),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "query",
    2,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Kde__V202212__FdwQuery, query),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "tn",
    3,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Kde__V202212__FdwQuery, tn),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "user_id",
    4,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_UINT32,
    0,   /* quantifier_offset */
    offsetof(Kentik__Kde__V202212__FdwQuery, user_id),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "server_id",
    5,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_UINT32,
    0,   /* quantifier_offset */
    offsetof(Kentik__Kde__V202212__FdwQuery, server_id),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "remote_host",
    6,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Kde__V202212__FdwQuery, remote_host),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "aggs",
    7,
    PROTOBUF_C_LABEL_REPEATED,
    PROTOBUF_C_TYPE_STRING,
    offsetof(Kentik__Kde__V202212__FdwQuery, n_aggs),
    offsetof(Kentik__Kde__V202212__FdwQuery, aggs),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "orderby",
    8,
    PROTOBUF_C_LABEL_REPEATED,
    PROTOBUF_C_TYPE_STRING,
    offsetof(Kentik__Kde__V202212__FdwQuery, n_orderby),
    offsetof(Kentik__Kde__V202212__FdwQuery, orderby),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "groupby",
    9,
    PROTOBUF_C_LABEL_REPEATED,
    PROTOBUF_C_TYPE_STRING,
    offsetof(Kentik__Kde__V202212__FdwQuery, n_groupby),
    offsetof(Kentik__Kde__V202212__FdwQuery, groupby),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "kt_cid",
    10,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_UINT32,
    0,   /* quantifier_offset */
    offsetof(Kentik__Kde__V202212__FdwQuery, kt_cid),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "kt_request_id",
    11,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Kde__V202212__FdwQuery, kt_request_id),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "kt_uid",
    12,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_UINT32,
    0,   /* quantifier_offset */
    offsetof(Kentik__Kde__V202212__FdwQuery, kt_uid),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "kt_spoof_uid",
    13,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_UINT32,
    0,   /* quantifier_offset */
    offsetof(Kentik__Kde__V202212__FdwQuery, kt_spoof_uid),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__kde__v202212__fdw_query__field_indices_by_name[] = {
  6,   /* field[6] = aggs */
  8,   /* field[8] = groupby */
  9,   /* field[9] = kt_cid */
  10,   /* field[10] = kt_request_id */
  12,   /* field[12] = kt_spoof_uid */
  11,   /* field[11] = kt_uid */
  7,   /* field[7] = orderby */
  1,   /* field[1] = query */
  5,   /* field[5] = remote_host */
  0,   /* field[0] = request_id */
  4,   /* field[4] = server_id */
  2,   /* field[2] = tn */
  3,   /* field[3] = user_id */
};
static const ProtobufCIntRange kentik__kde__v202212__fdw_query__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 13 }
};
const ProtobufCMessageDescriptor kentik__kde__v202212__fdw_query__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.kde.v202212.FdwQuery",
  "FdwQuery",
  "Kentik__Kde__V202212__FdwQuery",
  "kentik.kde.v202212",
  sizeof(Kentik__Kde__V202212__FdwQuery),
  13,
  kentik__kde__v202212__fdw_query__field_descriptors,
  kentik__kde__v202212__fdw_query__field_indices_by_name,
  1,  kentik__kde__v202212__fdw_query__number_ranges,
  (ProtobufCMessageInit) kentik__kde__v202212__fdw_query__init,
  NULL,NULL,NULL    /* reserved[123] */
};
