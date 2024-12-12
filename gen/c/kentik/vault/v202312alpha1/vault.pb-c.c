/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/vault/v202312alpha1/vault.proto */

/* Do not generate deprecated warnings for self */
#ifndef PROTOBUF_C__NO_DEPRECATED
#define PROTOBUF_C__NO_DEPRECATED
#endif

#include "kentik/vault/v202312alpha1/vault.pb-c.h"
void   kentik__vault__v202312alpha1__secret__init
                     (Kentik__Vault__V202312alpha1__Secret         *message)
{
  static const Kentik__Vault__V202312alpha1__Secret init_value = KENTIK__VAULT__V202312ALPHA1__SECRET__INIT;
  *message = init_value;
}
size_t kentik__vault__v202312alpha1__secret__get_packed_size
                     (const Kentik__Vault__V202312alpha1__Secret *message)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__secret__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__vault__v202312alpha1__secret__pack
                     (const Kentik__Vault__V202312alpha1__Secret *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__secret__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__vault__v202312alpha1__secret__pack_to_buffer
                     (const Kentik__Vault__V202312alpha1__Secret *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__secret__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Vault__V202312alpha1__Secret *
       kentik__vault__v202312alpha1__secret__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Vault__V202312alpha1__Secret *)
     protobuf_c_message_unpack (&kentik__vault__v202312alpha1__secret__descriptor,
                                allocator, len, data);
}
void   kentik__vault__v202312alpha1__secret__free_unpacked
                     (Kentik__Vault__V202312alpha1__Secret *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__secret__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   kentik__vault__v202312alpha1__get_secret_request__init
                     (Kentik__Vault__V202312alpha1__GetSecretRequest         *message)
{
  static const Kentik__Vault__V202312alpha1__GetSecretRequest init_value = KENTIK__VAULT__V202312ALPHA1__GET_SECRET_REQUEST__INIT;
  *message = init_value;
}
size_t kentik__vault__v202312alpha1__get_secret_request__get_packed_size
                     (const Kentik__Vault__V202312alpha1__GetSecretRequest *message)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__get_secret_request__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__vault__v202312alpha1__get_secret_request__pack
                     (const Kentik__Vault__V202312alpha1__GetSecretRequest *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__get_secret_request__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__vault__v202312alpha1__get_secret_request__pack_to_buffer
                     (const Kentik__Vault__V202312alpha1__GetSecretRequest *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__get_secret_request__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Vault__V202312alpha1__GetSecretRequest *
       kentik__vault__v202312alpha1__get_secret_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Vault__V202312alpha1__GetSecretRequest *)
     protobuf_c_message_unpack (&kentik__vault__v202312alpha1__get_secret_request__descriptor,
                                allocator, len, data);
}
void   kentik__vault__v202312alpha1__get_secret_request__free_unpacked
                     (Kentik__Vault__V202312alpha1__GetSecretRequest *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__get_secret_request__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   kentik__vault__v202312alpha1__get_secret_response__init
                     (Kentik__Vault__V202312alpha1__GetSecretResponse         *message)
{
  static const Kentik__Vault__V202312alpha1__GetSecretResponse init_value = KENTIK__VAULT__V202312ALPHA1__GET_SECRET_RESPONSE__INIT;
  *message = init_value;
}
size_t kentik__vault__v202312alpha1__get_secret_response__get_packed_size
                     (const Kentik__Vault__V202312alpha1__GetSecretResponse *message)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__get_secret_response__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__vault__v202312alpha1__get_secret_response__pack
                     (const Kentik__Vault__V202312alpha1__GetSecretResponse *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__get_secret_response__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__vault__v202312alpha1__get_secret_response__pack_to_buffer
                     (const Kentik__Vault__V202312alpha1__GetSecretResponse *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__get_secret_response__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Vault__V202312alpha1__GetSecretResponse *
       kentik__vault__v202312alpha1__get_secret_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Vault__V202312alpha1__GetSecretResponse *)
     protobuf_c_message_unpack (&kentik__vault__v202312alpha1__get_secret_response__descriptor,
                                allocator, len, data);
}
void   kentik__vault__v202312alpha1__get_secret_response__free_unpacked
                     (Kentik__Vault__V202312alpha1__GetSecretResponse *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__get_secret_response__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   kentik__vault__v202312alpha1__list_secret_request__init
                     (Kentik__Vault__V202312alpha1__ListSecretRequest         *message)
{
  static const Kentik__Vault__V202312alpha1__ListSecretRequest init_value = KENTIK__VAULT__V202312ALPHA1__LIST_SECRET_REQUEST__INIT;
  *message = init_value;
}
size_t kentik__vault__v202312alpha1__list_secret_request__get_packed_size
                     (const Kentik__Vault__V202312alpha1__ListSecretRequest *message)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__list_secret_request__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__vault__v202312alpha1__list_secret_request__pack
                     (const Kentik__Vault__V202312alpha1__ListSecretRequest *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__list_secret_request__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__vault__v202312alpha1__list_secret_request__pack_to_buffer
                     (const Kentik__Vault__V202312alpha1__ListSecretRequest *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__list_secret_request__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Vault__V202312alpha1__ListSecretRequest *
       kentik__vault__v202312alpha1__list_secret_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Vault__V202312alpha1__ListSecretRequest *)
     protobuf_c_message_unpack (&kentik__vault__v202312alpha1__list_secret_request__descriptor,
                                allocator, len, data);
}
void   kentik__vault__v202312alpha1__list_secret_request__free_unpacked
                     (Kentik__Vault__V202312alpha1__ListSecretRequest *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__list_secret_request__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   kentik__vault__v202312alpha1__list_secret_response__init
                     (Kentik__Vault__V202312alpha1__ListSecretResponse         *message)
{
  static const Kentik__Vault__V202312alpha1__ListSecretResponse init_value = KENTIK__VAULT__V202312ALPHA1__LIST_SECRET_RESPONSE__INIT;
  *message = init_value;
}
size_t kentik__vault__v202312alpha1__list_secret_response__get_packed_size
                     (const Kentik__Vault__V202312alpha1__ListSecretResponse *message)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__list_secret_response__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__vault__v202312alpha1__list_secret_response__pack
                     (const Kentik__Vault__V202312alpha1__ListSecretResponse *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__list_secret_response__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__vault__v202312alpha1__list_secret_response__pack_to_buffer
                     (const Kentik__Vault__V202312alpha1__ListSecretResponse *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__list_secret_response__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__Vault__V202312alpha1__ListSecretResponse *
       kentik__vault__v202312alpha1__list_secret_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__Vault__V202312alpha1__ListSecretResponse *)
     protobuf_c_message_unpack (&kentik__vault__v202312alpha1__list_secret_response__descriptor,
                                allocator, len, data);
}
void   kentik__vault__v202312alpha1__list_secret_response__free_unpacked
                     (Kentik__Vault__V202312alpha1__ListSecretResponse *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__vault__v202312alpha1__list_secret_response__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
static const ProtobufCFieldDescriptor kentik__vault__v202312alpha1__secret__field_descriptors[6] =
{
  {
    "name",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Vault__V202312alpha1__Secret, name),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "value",
    2,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Vault__V202312alpha1__Secret, value),
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
    offsetof(Kentik__Vault__V202312alpha1__Secret, version),
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
    offsetof(Kentik__Vault__V202312alpha1__Secret, description),
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
    offsetof(Kentik__Vault__V202312alpha1__Secret, type),
    &kentik__vault__v202312alpha1__secret_type__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "id",
    6,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Vault__V202312alpha1__Secret, id),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__vault__v202312alpha1__secret__field_indices_by_name[] = {
  3,   /* field[3] = description */
  5,   /* field[5] = id */
  0,   /* field[0] = name */
  4,   /* field[4] = type */
  1,   /* field[1] = value */
  2,   /* field[2] = version */
};
static const ProtobufCIntRange kentik__vault__v202312alpha1__secret__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 6 }
};
const ProtobufCMessageDescriptor kentik__vault__v202312alpha1__secret__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.vault.v202312alpha1.Secret",
  "Secret",
  "Kentik__Vault__V202312alpha1__Secret",
  "kentik.vault.v202312alpha1",
  sizeof(Kentik__Vault__V202312alpha1__Secret),
  6,
  kentik__vault__v202312alpha1__secret__field_descriptors,
  kentik__vault__v202312alpha1__secret__field_indices_by_name,
  1,  kentik__vault__v202312alpha1__secret__number_ranges,
  (ProtobufCMessageInit) kentik__vault__v202312alpha1__secret__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCFieldDescriptor kentik__vault__v202312alpha1__get_secret_request__field_descriptors[1] =
{
  {
    "name",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__Vault__V202312alpha1__GetSecretRequest, name),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__vault__v202312alpha1__get_secret_request__field_indices_by_name[] = {
  0,   /* field[0] = name */
};
static const ProtobufCIntRange kentik__vault__v202312alpha1__get_secret_request__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 1 }
};
const ProtobufCMessageDescriptor kentik__vault__v202312alpha1__get_secret_request__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.vault.v202312alpha1.GetSecretRequest",
  "GetSecretRequest",
  "Kentik__Vault__V202312alpha1__GetSecretRequest",
  "kentik.vault.v202312alpha1",
  sizeof(Kentik__Vault__V202312alpha1__GetSecretRequest),
  1,
  kentik__vault__v202312alpha1__get_secret_request__field_descriptors,
  kentik__vault__v202312alpha1__get_secret_request__field_indices_by_name,
  1,  kentik__vault__v202312alpha1__get_secret_request__number_ranges,
  (ProtobufCMessageInit) kentik__vault__v202312alpha1__get_secret_request__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCFieldDescriptor kentik__vault__v202312alpha1__get_secret_response__field_descriptors[1] =
{
  {
    "secret",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_MESSAGE,
    0,   /* quantifier_offset */
    offsetof(Kentik__Vault__V202312alpha1__GetSecretResponse, secret),
    &kentik__vault__v202312alpha1__secret__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__vault__v202312alpha1__get_secret_response__field_indices_by_name[] = {
  0,   /* field[0] = secret */
};
static const ProtobufCIntRange kentik__vault__v202312alpha1__get_secret_response__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 1 }
};
const ProtobufCMessageDescriptor kentik__vault__v202312alpha1__get_secret_response__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.vault.v202312alpha1.GetSecretResponse",
  "GetSecretResponse",
  "Kentik__Vault__V202312alpha1__GetSecretResponse",
  "kentik.vault.v202312alpha1",
  sizeof(Kentik__Vault__V202312alpha1__GetSecretResponse),
  1,
  kentik__vault__v202312alpha1__get_secret_response__field_descriptors,
  kentik__vault__v202312alpha1__get_secret_response__field_indices_by_name,
  1,  kentik__vault__v202312alpha1__get_secret_response__number_ranges,
  (ProtobufCMessageInit) kentik__vault__v202312alpha1__get_secret_response__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCFieldDescriptor kentik__vault__v202312alpha1__list_secret_request__field_descriptors[1] =
{
  {
    "names",
    1,
    PROTOBUF_C_LABEL_REPEATED,
    PROTOBUF_C_TYPE_STRING,
    offsetof(Kentik__Vault__V202312alpha1__ListSecretRequest, n_names),
    offsetof(Kentik__Vault__V202312alpha1__ListSecretRequest, names),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__vault__v202312alpha1__list_secret_request__field_indices_by_name[] = {
  0,   /* field[0] = names */
};
static const ProtobufCIntRange kentik__vault__v202312alpha1__list_secret_request__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 1 }
};
const ProtobufCMessageDescriptor kentik__vault__v202312alpha1__list_secret_request__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.vault.v202312alpha1.ListSecretRequest",
  "ListSecretRequest",
  "Kentik__Vault__V202312alpha1__ListSecretRequest",
  "kentik.vault.v202312alpha1",
  sizeof(Kentik__Vault__V202312alpha1__ListSecretRequest),
  1,
  kentik__vault__v202312alpha1__list_secret_request__field_descriptors,
  kentik__vault__v202312alpha1__list_secret_request__field_indices_by_name,
  1,  kentik__vault__v202312alpha1__list_secret_request__number_ranges,
  (ProtobufCMessageInit) kentik__vault__v202312alpha1__list_secret_request__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCFieldDescriptor kentik__vault__v202312alpha1__list_secret_response__field_descriptors[2] =
{
  {
    "secrets",
    1,
    PROTOBUF_C_LABEL_REPEATED,
    PROTOBUF_C_TYPE_MESSAGE,
    offsetof(Kentik__Vault__V202312alpha1__ListSecretResponse, n_secrets),
    offsetof(Kentik__Vault__V202312alpha1__ListSecretResponse, secrets),
    &kentik__vault__v202312alpha1__secret__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "invalid_credential_count",
    2,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_UINT32,
    0,   /* quantifier_offset */
    offsetof(Kentik__Vault__V202312alpha1__ListSecretResponse, invalid_credential_count),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__vault__v202312alpha1__list_secret_response__field_indices_by_name[] = {
  1,   /* field[1] = invalid_credential_count */
  0,   /* field[0] = secrets */
};
static const ProtobufCIntRange kentik__vault__v202312alpha1__list_secret_response__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 2 }
};
const ProtobufCMessageDescriptor kentik__vault__v202312alpha1__list_secret_response__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.vault.v202312alpha1.ListSecretResponse",
  "ListSecretResponse",
  "Kentik__Vault__V202312alpha1__ListSecretResponse",
  "kentik.vault.v202312alpha1",
  sizeof(Kentik__Vault__V202312alpha1__ListSecretResponse),
  2,
  kentik__vault__v202312alpha1__list_secret_response__field_descriptors,
  kentik__vault__v202312alpha1__list_secret_response__field_indices_by_name,
  1,  kentik__vault__v202312alpha1__list_secret_response__number_ranges,
  (ProtobufCMessageInit) kentik__vault__v202312alpha1__list_secret_response__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCEnumValue kentik__vault__v202312alpha1__secret_type__enum_values_by_number[9] =
{
  { "SECRET_TYPE_UNSPECIFIED", "KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_UNSPECIFIED", 0 },
  { "SECRET_TYPE_BASIC_AUTH", "KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_BASIC_AUTH", 1 },
  { "SECRET_TYPE_SNMP_V1", "KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_SNMP_V1", 2 },
  { "SECRET_TYPE_SNMP_V2C", "KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_SNMP_V2C", 3 },
  { "SECRET_TYPE_SNMP_V3", "KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_SNMP_V3", 4 },
  { "SECRET_TYPE_STREAMING_TELEMETRY", "KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_STREAMING_TELEMETRY", 5 },
  { "SECRET_TYPE_BGP_MD5", "KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_BGP_MD5", 6 },
  { "SECRET_TYPE_API_TOKEN", "KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_API_TOKEN", 7 },
  { "SECRET_TYPE_OTHER", "KENTIK__VAULT__V202312ALPHA1__SECRET_TYPE__SECRET_TYPE_OTHER", 8 },
};
static const ProtobufCIntRange kentik__vault__v202312alpha1__secret_type__value_ranges[] = {
{0, 0},{0, 9}
};
static const ProtobufCEnumValueIndex kentik__vault__v202312alpha1__secret_type__enum_values_by_name[9] =
{
  { "SECRET_TYPE_API_TOKEN", 7 },
  { "SECRET_TYPE_BASIC_AUTH", 1 },
  { "SECRET_TYPE_BGP_MD5", 6 },
  { "SECRET_TYPE_OTHER", 8 },
  { "SECRET_TYPE_SNMP_V1", 2 },
  { "SECRET_TYPE_SNMP_V2C", 3 },
  { "SECRET_TYPE_SNMP_V3", 4 },
  { "SECRET_TYPE_STREAMING_TELEMETRY", 5 },
  { "SECRET_TYPE_UNSPECIFIED", 0 },
};
const ProtobufCEnumDescriptor kentik__vault__v202312alpha1__secret_type__descriptor =
{
  PROTOBUF_C__ENUM_DESCRIPTOR_MAGIC,
  "kentik.vault.v202312alpha1.SecretType",
  "SecretType",
  "Kentik__Vault__V202312alpha1__SecretType",
  "kentik.vault.v202312alpha1",
  9,
  kentik__vault__v202312alpha1__secret_type__enum_values_by_number,
  9,
  kentik__vault__v202312alpha1__secret_type__enum_values_by_name,
  1,
  kentik__vault__v202312alpha1__secret_type__value_ranges,
  NULL,NULL,NULL,NULL   /* reserved[1234] */
};
static const ProtobufCMethodDescriptor kentik__vault__v202312alpha1__vault_service__method_descriptors[2] =
{
  { "GetSecret", &kentik__vault__v202312alpha1__get_secret_request__descriptor, &kentik__vault__v202312alpha1__get_secret_response__descriptor },
  { "ListSecret", &kentik__vault__v202312alpha1__list_secret_request__descriptor, &kentik__vault__v202312alpha1__list_secret_response__descriptor },
};
const unsigned kentik__vault__v202312alpha1__vault_service__method_indices_by_name[] = {
  0,        /* GetSecret */
  1         /* ListSecret */
};
const ProtobufCServiceDescriptor kentik__vault__v202312alpha1__vault_service__descriptor =
{
  PROTOBUF_C__SERVICE_DESCRIPTOR_MAGIC,
  "kentik.vault.v202312alpha1.VaultService",
  "VaultService",
  "Kentik__Vault__V202312alpha1__VaultService",
  "kentik.vault.v202312alpha1",
  2,
  kentik__vault__v202312alpha1__vault_service__method_descriptors,
  kentik__vault__v202312alpha1__vault_service__method_indices_by_name
};
void kentik__vault__v202312alpha1__vault_service__get_secret(ProtobufCService *service,
                                                             const Kentik__Vault__V202312alpha1__GetSecretRequest *input,
                                                             Kentik__Vault__V202312alpha1__GetSecretResponse_Closure closure,
                                                             void *closure_data)
{
  assert(service->descriptor == &kentik__vault__v202312alpha1__vault_service__descriptor);
  service->invoke(service, 0, (const ProtobufCMessage *) input, (ProtobufCClosure) closure, closure_data);
}
void kentik__vault__v202312alpha1__vault_service__list_secret(ProtobufCService *service,
                                                              const Kentik__Vault__V202312alpha1__ListSecretRequest *input,
                                                              Kentik__Vault__V202312alpha1__ListSecretResponse_Closure closure,
                                                              void *closure_data)
{
  assert(service->descriptor == &kentik__vault__v202312alpha1__vault_service__descriptor);
  service->invoke(service, 1, (const ProtobufCMessage *) input, (ProtobufCClosure) closure, closure_data);
}
void kentik__vault__v202312alpha1__vault_service__init (Kentik__Vault__V202312alpha1__VaultService_Service *service,
                                                        Kentik__Vault__V202312alpha1__VaultService_ServiceDestroy destroy)
{
  protobuf_c_service_generated_init (&service->base,
                                     &kentik__vault__v202312alpha1__vault_service__descriptor,
                                     (ProtobufCServiceDestroy) destroy);
}