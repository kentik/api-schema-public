/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/credential/v202407alpha1/credential.proto */

/* Do not generate deprecated warnings for self */
#ifndef PROTOBUF_C__NO_DEPRECATED
#define PROTOBUF_C__NO_DEPRECATED
#endif

#include "kentik/credential/v202407alpha1/credential.pb-c.h"
void   kentik__credential__v202407alpha1__credential_group__init
                     (Kentik__Credential__V202407alpha1__CredentialGroup         *message)
{
  static const Kentik__Credential__V202407alpha1__CredentialGroup init_value = KENTIK__CREDENTIAL__V202407ALPHA1__CREDENTIAL_GROUP__INIT;
  *message = init_value;
}
size_t kentik__credential__v202407alpha1__credential_group__get_packed_size
                     (const Kentik__Credential__V202407alpha1__CredentialGroup *message)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__credential_group__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__credential__v202407alpha1__credential_group__pack
                     (const Kentik__Credential__V202407alpha1__CredentialGroup *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__credential_group__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__credential__v202407alpha1__credential_group__pack_to_buffer
                     (const Kentik__Credential__V202407alpha1__CredentialGroup *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__credential_group__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Credential__V202407alpha1__CredentialGroup *
       kentik__credential__v202407alpha1__credential_group__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Credential__V202407alpha1__CredentialGroup *)
     protobuf_c_message_unpack (&kentik__credential__v202407alpha1__credential_group__descriptor,
                                allocator, len, data);
}
void   kentik__credential__v202407alpha1__credential_group__free_unpacked
                     (Kentik__Credential__V202407alpha1__CredentialGroup *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__credential_group__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   kentik__credential__v202407alpha1__get_credential_group_request__init
                     (Kentik__Credential__V202407alpha1__GetCredentialGroupRequest         *message)
{
  static const Kentik__Credential__V202407alpha1__GetCredentialGroupRequest init_value = KENTIK__CREDENTIAL__V202407ALPHA1__GET_CREDENTIAL_GROUP_REQUEST__INIT;
  *message = init_value;
}
size_t kentik__credential__v202407alpha1__get_credential_group_request__get_packed_size
                     (const Kentik__Credential__V202407alpha1__GetCredentialGroupRequest *message)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__get_credential_group_request__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__credential__v202407alpha1__get_credential_group_request__pack
                     (const Kentik__Credential__V202407alpha1__GetCredentialGroupRequest *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__get_credential_group_request__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__credential__v202407alpha1__get_credential_group_request__pack_to_buffer
                     (const Kentik__Credential__V202407alpha1__GetCredentialGroupRequest *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__get_credential_group_request__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Credential__V202407alpha1__GetCredentialGroupRequest *
       kentik__credential__v202407alpha1__get_credential_group_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Credential__V202407alpha1__GetCredentialGroupRequest *)
     protobuf_c_message_unpack (&kentik__credential__v202407alpha1__get_credential_group_request__descriptor,
                                allocator, len, data);
}
void   kentik__credential__v202407alpha1__get_credential_group_request__free_unpacked
                     (Kentik__Credential__V202407alpha1__GetCredentialGroupRequest *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__get_credential_group_request__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   kentik__credential__v202407alpha1__get_credential_group_response__init
                     (Kentik__Credential__V202407alpha1__GetCredentialGroupResponse         *message)
{
  static const Kentik__Credential__V202407alpha1__GetCredentialGroupResponse init_value = KENTIK__CREDENTIAL__V202407ALPHA1__GET_CREDENTIAL_GROUP_RESPONSE__INIT;
  *message = init_value;
}
size_t kentik__credential__v202407alpha1__get_credential_group_response__get_packed_size
                     (const Kentik__Credential__V202407alpha1__GetCredentialGroupResponse *message)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__get_credential_group_response__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__credential__v202407alpha1__get_credential_group_response__pack
                     (const Kentik__Credential__V202407alpha1__GetCredentialGroupResponse *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__get_credential_group_response__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__credential__v202407alpha1__get_credential_group_response__pack_to_buffer
                     (const Kentik__Credential__V202407alpha1__GetCredentialGroupResponse *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__get_credential_group_response__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Credential__V202407alpha1__GetCredentialGroupResponse *
       kentik__credential__v202407alpha1__get_credential_group_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Credential__V202407alpha1__GetCredentialGroupResponse *)
     protobuf_c_message_unpack (&kentik__credential__v202407alpha1__get_credential_group_response__descriptor,
                                allocator, len, data);
}
void   kentik__credential__v202407alpha1__get_credential_group_response__free_unpacked
                     (Kentik__Credential__V202407alpha1__GetCredentialGroupResponse *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__get_credential_group_response__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   kentik__credential__v202407alpha1__list_credential_group_request__init
                     (Kentik__Credential__V202407alpha1__ListCredentialGroupRequest         *message)
{
  static const Kentik__Credential__V202407alpha1__ListCredentialGroupRequest init_value = KENTIK__CREDENTIAL__V202407ALPHA1__LIST_CREDENTIAL_GROUP_REQUEST__INIT;
  *message = init_value;
}
size_t kentik__credential__v202407alpha1__list_credential_group_request__get_packed_size
                     (const Kentik__Credential__V202407alpha1__ListCredentialGroupRequest *message)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__list_credential_group_request__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__credential__v202407alpha1__list_credential_group_request__pack
                     (const Kentik__Credential__V202407alpha1__ListCredentialGroupRequest *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__list_credential_group_request__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__credential__v202407alpha1__list_credential_group_request__pack_to_buffer
                     (const Kentik__Credential__V202407alpha1__ListCredentialGroupRequest *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__list_credential_group_request__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Credential__V202407alpha1__ListCredentialGroupRequest *
       kentik__credential__v202407alpha1__list_credential_group_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Credential__V202407alpha1__ListCredentialGroupRequest *)
     protobuf_c_message_unpack (&kentik__credential__v202407alpha1__list_credential_group_request__descriptor,
                                allocator, len, data);
}
void   kentik__credential__v202407alpha1__list_credential_group_request__free_unpacked
                     (Kentik__Credential__V202407alpha1__ListCredentialGroupRequest *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__list_credential_group_request__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   kentik__credential__v202407alpha1__list_credential_group_response__init
                     (Kentik__Credential__V202407alpha1__ListCredentialGroupResponse         *message)
{
  static const Kentik__Credential__V202407alpha1__ListCredentialGroupResponse init_value = KENTIK__CREDENTIAL__V202407ALPHA1__LIST_CREDENTIAL_GROUP_RESPONSE__INIT;
  *message = init_value;
}
size_t kentik__credential__v202407alpha1__list_credential_group_response__get_packed_size
                     (const Kentik__Credential__V202407alpha1__ListCredentialGroupResponse *message)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__list_credential_group_response__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__credential__v202407alpha1__list_credential_group_response__pack
                     (const Kentik__Credential__V202407alpha1__ListCredentialGroupResponse *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__list_credential_group_response__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__credential__v202407alpha1__list_credential_group_response__pack_to_buffer
                     (const Kentik__Credential__V202407alpha1__ListCredentialGroupResponse *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__list_credential_group_response__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Credential__V202407alpha1__ListCredentialGroupResponse *
       kentik__credential__v202407alpha1__list_credential_group_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Credential__V202407alpha1__ListCredentialGroupResponse *)
     protobuf_c_message_unpack (&kentik__credential__v202407alpha1__list_credential_group_response__descriptor,
                                allocator, len, data);
}
void   kentik__credential__v202407alpha1__list_credential_group_response__free_unpacked
                     (Kentik__Credential__V202407alpha1__ListCredentialGroupResponse *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__credential__v202407alpha1__list_credential_group_response__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
static const ProtobufCFieldDescriptor kentik__credential__v202407alpha1__credential_group__field_descriptors[10] =
{
  {
    "id",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Credential__V202407alpha1__CredentialGroup, id),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "name",
    2,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Credential__V202407alpha1__CredentialGroup, name),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "version",
    3,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_UINT32,
    0,   /* quantifier_offset */
    offsetof(Kentik__Credential__V202407alpha1__CredentialGroup, version),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "description",
    4,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Credential__V202407alpha1__CredentialGroup, description),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "type",
    5,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_ENUM,
    0,   /* quantifier_offset */
    offsetof(Kentik__Credential__V202407alpha1__CredentialGroup, type),
    &kentik__vault__v202312alpha1__secret_type__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "cdate",
    6,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_MESSAGE,
    0,   /* quantifier_offset */
    offsetof(Kentik__Credential__V202407alpha1__CredentialGroup, cdate),
    &google__protobuf__timestamp__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "edate",
    7,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_MESSAGE,
    0,   /* quantifier_offset */
    offsetof(Kentik__Credential__V202407alpha1__CredentialGroup, edate),
    &google__protobuf__timestamp__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "created_by",
    8,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_MESSAGE,
    0,   /* quantifier_offset */
    offsetof(Kentik__Credential__V202407alpha1__CredentialGroup, created_by),
    &kentik__user__v202211__user__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "credentials",
    9,
    PROTOBUF_C_LABEL_REPEATED,
    PROTOBUF_C_TYPE_MESSAGE,
    offsetof(Kentik__Credential__V202407alpha1__CredentialGroup, n_credentials),
    offsetof(Kentik__Credential__V202407alpha1__CredentialGroup, credentials),
    &kentik__vault__v202312alpha1__secret__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "labels",
    10,
    PROTOBUF_C_LABEL_REPEATED,
    PROTOBUF_C_TYPE_STRING,
    offsetof(Kentik__Credential__V202407alpha1__CredentialGroup, n_labels),
    offsetof(Kentik__Credential__V202407alpha1__CredentialGroup, labels),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__credential__v202407alpha1__credential_group__field_indices_by_name[] = {
  5,   /* field[5] = cdate */
  7,   /* field[7] = created_by */
  8,   /* field[8] = credentials */
  3,   /* field[3] = description */
  6,   /* field[6] = edate */
  0,   /* field[0] = id */
  9,   /* field[9] = labels */
  1,   /* field[1] = name */
  4,   /* field[4] = type */
  2,   /* field[2] = version */
};
static const ProtobufCIntRange kentik__credential__v202407alpha1__credential_group__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 10 }
};
const ProtobufCMessageDescriptor kentik__credential__v202407alpha1__credential_group__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.credential.v202407alpha1.CredentialGroup",
  "CredentialGroup",
  "Kentik__Credential__V202407alpha1__CredentialGroup",
  "kentik.credential.v202407alpha1",
  sizeof(Kentik__Credential__V202407alpha1__CredentialGroup),
  10,
  kentik__credential__v202407alpha1__credential_group__field_descriptors,
  kentik__credential__v202407alpha1__credential_group__field_indices_by_name,
  1,  kentik__credential__v202407alpha1__credential_group__number_ranges,
  (ProtobufCMessageInit) kentik__credential__v202407alpha1__credential_group__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCFieldDescriptor kentik__credential__v202407alpha1__get_credential_group_request__field_descriptors[1] =
{
  {
    "id",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Credential__V202407alpha1__GetCredentialGroupRequest, id),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__credential__v202407alpha1__get_credential_group_request__field_indices_by_name[] = {
  0,   /* field[0] = id */
};
static const ProtobufCIntRange kentik__credential__v202407alpha1__get_credential_group_request__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 1 }
};
const ProtobufCMessageDescriptor kentik__credential__v202407alpha1__get_credential_group_request__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.credential.v202407alpha1.GetCredentialGroupRequest",
  "GetCredentialGroupRequest",
  "Kentik__Credential__V202407alpha1__GetCredentialGroupRequest",
  "kentik.credential.v202407alpha1",
  sizeof(Kentik__Credential__V202407alpha1__GetCredentialGroupRequest),
  1,
  kentik__credential__v202407alpha1__get_credential_group_request__field_descriptors,
  kentik__credential__v202407alpha1__get_credential_group_request__field_indices_by_name,
  1,  kentik__credential__v202407alpha1__get_credential_group_request__number_ranges,
  (ProtobufCMessageInit) kentik__credential__v202407alpha1__get_credential_group_request__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCFieldDescriptor kentik__credential__v202407alpha1__get_credential_group_response__field_descriptors[1] =
{
  {
    "group",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_MESSAGE,
    0,   /* quantifier_offset */
    offsetof(Kentik__Credential__V202407alpha1__GetCredentialGroupResponse, group),
    &kentik__credential__v202407alpha1__credential_group__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__credential__v202407alpha1__get_credential_group_response__field_indices_by_name[] = {
  0,   /* field[0] = group */
};
static const ProtobufCIntRange kentik__credential__v202407alpha1__get_credential_group_response__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 1 }
};
const ProtobufCMessageDescriptor kentik__credential__v202407alpha1__get_credential_group_response__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.credential.v202407alpha1.GetCredentialGroupResponse",
  "GetCredentialGroupResponse",
  "Kentik__Credential__V202407alpha1__GetCredentialGroupResponse",
  "kentik.credential.v202407alpha1",
  sizeof(Kentik__Credential__V202407alpha1__GetCredentialGroupResponse),
  1,
  kentik__credential__v202407alpha1__get_credential_group_response__field_descriptors,
  kentik__credential__v202407alpha1__get_credential_group_response__field_indices_by_name,
  1,  kentik__credential__v202407alpha1__get_credential_group_response__number_ranges,
  (ProtobufCMessageInit) kentik__credential__v202407alpha1__get_credential_group_response__init,
  NULL,NULL,NULL    /* reserved[123] */
};
#define kentik__credential__v202407alpha1__list_credential_group_request__field_descriptors NULL
#define kentik__credential__v202407alpha1__list_credential_group_request__field_indices_by_name NULL
#define kentik__credential__v202407alpha1__list_credential_group_request__number_ranges NULL
const ProtobufCMessageDescriptor kentik__credential__v202407alpha1__list_credential_group_request__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.credential.v202407alpha1.ListCredentialGroupRequest",
  "ListCredentialGroupRequest",
  "Kentik__Credential__V202407alpha1__ListCredentialGroupRequest",
  "kentik.credential.v202407alpha1",
  sizeof(Kentik__Credential__V202407alpha1__ListCredentialGroupRequest),
  0,
  kentik__credential__v202407alpha1__list_credential_group_request__field_descriptors,
  kentik__credential__v202407alpha1__list_credential_group_request__field_indices_by_name,
  0,  kentik__credential__v202407alpha1__list_credential_group_request__number_ranges,
  (ProtobufCMessageInit) kentik__credential__v202407alpha1__list_credential_group_request__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCFieldDescriptor kentik__credential__v202407alpha1__list_credential_group_response__field_descriptors[2] =
{
  {
    "groups",
    1,
    PROTOBUF_C_LABEL_REPEATED,
    PROTOBUF_C_TYPE_MESSAGE,
    offsetof(Kentik__Credential__V202407alpha1__ListCredentialGroupResponse, n_groups),
    offsetof(Kentik__Credential__V202407alpha1__ListCredentialGroupResponse, groups),
    &kentik__credential__v202407alpha1__credential_group__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "invalid_count",
    2,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_UINT32,
    0,   /* quantifier_offset */
    offsetof(Kentik__Credential__V202407alpha1__ListCredentialGroupResponse, invalid_count),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__credential__v202407alpha1__list_credential_group_response__field_indices_by_name[] = {
  0,   /* field[0] = groups */
  1,   /* field[1] = invalid_count */
};
static const ProtobufCIntRange kentik__credential__v202407alpha1__list_credential_group_response__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 2 }
};
const ProtobufCMessageDescriptor kentik__credential__v202407alpha1__list_credential_group_response__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.credential.v202407alpha1.ListCredentialGroupResponse",
  "ListCredentialGroupResponse",
  "Kentik__Credential__V202407alpha1__ListCredentialGroupResponse",
  "kentik.credential.v202407alpha1",
  sizeof(Kentik__Credential__V202407alpha1__ListCredentialGroupResponse),
  2,
  kentik__credential__v202407alpha1__list_credential_group_response__field_descriptors,
  kentik__credential__v202407alpha1__list_credential_group_response__field_indices_by_name,
  1,  kentik__credential__v202407alpha1__list_credential_group_response__number_ranges,
  (ProtobufCMessageInit) kentik__credential__v202407alpha1__list_credential_group_response__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCMethodDescriptor kentik__credential__v202407alpha1__credential_service__method_descriptors[2] =
{
  { "GetCredentialGroup", &kentik__credential__v202407alpha1__get_credential_group_request__descriptor, &kentik__credential__v202407alpha1__get_credential_group_response__descriptor },
  { "ListCredentialGroup", &kentik__credential__v202407alpha1__list_credential_group_request__descriptor, &kentik__credential__v202407alpha1__list_credential_group_response__descriptor },
};
const unsigned kentik__credential__v202407alpha1__credential_service__method_indices_by_name[] = {
  0,        /* GetCredentialGroup */
  1         /* ListCredentialGroup */
};
const ProtobufCServiceDescriptor kentik__credential__v202407alpha1__credential_service__descriptor =
{
  PROTOBUF_C__SERVICE_DESCRIPTOR_MAGIC,
  "kentik.credential.v202407alpha1.CredentialService",
  "CredentialService",
  "Kentik__Credential__V202407alpha1__CredentialService",
  "kentik.credential.v202407alpha1",
  2,
  kentik__credential__v202407alpha1__credential_service__method_descriptors,
  kentik__credential__v202407alpha1__credential_service__method_indices_by_name
};
void kentik__credential__v202407alpha1__credential_service__get_credential_group(ProtobufCService *service,
                                                                                 const Kentik__Credential__V202407alpha1__GetCredentialGroupRequest *input,
                                                                                 Kentik__Credential__V202407alpha1__GetCredentialGroupResponse_Closure closure,
                                                                                 void *closure_data)
{
  assert(service->descriptor == &kentik__credential__v202407alpha1__credential_service__descriptor);
  service->invoke(service, 0, (const ProtobufCMessage *) input, (ProtobufCClosure) closure, closure_data);
}
void kentik__credential__v202407alpha1__credential_service__list_credential_group(ProtobufCService *service,
                                                                                  const Kentik__Credential__V202407alpha1__ListCredentialGroupRequest *input,
                                                                                  Kentik__Credential__V202407alpha1__ListCredentialGroupResponse_Closure closure,
                                                                                  void *closure_data)
{
  assert(service->descriptor == &kentik__credential__v202407alpha1__credential_service__descriptor);
  service->invoke(service, 1, (const ProtobufCMessage *) input, (ProtobufCClosure) closure, closure_data);
}
void kentik__credential__v202407alpha1__credential_service__init (Kentik__Credential__V202407alpha1__CredentialService_Service *service,
                                                                  Kentik__Credential__V202407alpha1__CredentialService_ServiceDestroy destroy)
{
  protobuf_c_service_generated_init (&service->base,
                                     &kentik__credential__v202407alpha1__credential_service__descriptor,
                                     (ProtobufCServiceDestroy) destroy);
}
