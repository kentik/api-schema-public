/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/connectivity_checker/v202410beta1/connectivity_checker.proto */

/* Do not generate deprecated warnings for self */
#ifndef PROTOBUF_C__NO_DEPRECATED
#define PROTOBUF_C__NO_DEPRECATED
#endif

#include "kentik/connectivity_checker/v202410beta1/connectivity_checker.pb-c.h"
void   kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__init
                     (Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest         *message)
{
  static const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest init_value = KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CREATE_CONNECTIVITY_REPORT_REQUEST__INIT;
  *message = init_value;
}
size_t kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__get_packed_size
                     (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest *message)
{
  assert(message->base.descriptor == &kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__pack
                     (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__pack_to_buffer
                     (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest *
       kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest *)
     protobuf_c_message_unpack (&kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__descriptor,
                                allocator, len, data);
}
void   kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__free_unpacked
                     (Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
void   kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__init
                     (Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse         *message)
{
  static const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse init_value = KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CREATE_CONNECTIVITY_REPORT_RESPONSE__INIT;
  *message = init_value;
}
size_t kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__get_packed_size
                     (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse *message)
{
  assert(message->base.descriptor == &kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__descriptor);
  return protobuf_c_message_get_packed_size ((const ProtobufCMessage*)(message));
}
size_t kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__pack
                     (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse *message,
                      uint8_t       *out)
{
  assert(message->base.descriptor == &kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__descriptor);
  return protobuf_c_message_pack ((const ProtobufCMessage*)message, out);
}
size_t kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__pack_to_buffer
                     (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse *message,
                      ProtobufCBuffer *buffer)
{
  assert(message->base.descriptor == &kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__descriptor);
  return protobuf_c_message_pack_to_buffer ((const ProtobufCMessage*)message, buffer);
}
Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse *
       kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data)
{
  return (Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse *)
     protobuf_c_message_unpack (&kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__descriptor,
                                allocator, len, data);
}
void   kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__free_unpacked
                     (Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse *message,
                      ProtobufCAllocator *allocator)
{
  if(!message)
    return;
  assert(message->base.descriptor == &kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__descriptor);
  protobuf_c_message_free_unpacked ((ProtobufCMessage*)message, allocator);
}
static const ProtobufCFieldDescriptor kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__field_descriptors[10] =
{
  {
    "cloud_provider",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_ENUM,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest, cloud_provider),
    &kentik__connectivity_checker__v202410beta1__cloud_provider__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "src",
    2,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest, src),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "dst",
    3,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest, dst),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "dst_port",
    4,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest, dst_port),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "protocol",
    5,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest, protocol),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "src_type",
    6,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_ENUM,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest, src_type),
    &kentik__connectivity_checker__v202410beta1__entity_type__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "dst_type",
    7,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_ENUM,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest, dst_type),
    &kentik__connectivity_checker__v202410beta1__entity_type__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "start_time",
    8,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_MESSAGE,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest, start_time),
    &google__protobuf__timestamp__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "end_time",
    9,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_MESSAGE,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest, end_time),
    &google__protobuf__timestamp__descriptor,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "name",
    10,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest, name),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__field_indices_by_name[] = {
  0,   /* field[0] = cloud_provider */
  2,   /* field[2] = dst */
  3,   /* field[3] = dst_port */
  6,   /* field[6] = dst_type */
  8,   /* field[8] = end_time */
  9,   /* field[9] = name */
  4,   /* field[4] = protocol */
  1,   /* field[1] = src */
  5,   /* field[5] = src_type */
  7,   /* field[7] = start_time */
};
static const ProtobufCIntRange kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 10 }
};
const ProtobufCMessageDescriptor kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest",
  "CreateConnectivityReportRequest",
  "Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest",
  "kentik.connectivity_checker.v202410beta1",
  sizeof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest),
  10,
  kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__field_descriptors,
  kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__field_indices_by_name,
  1,  kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__number_ranges,
  (ProtobufCMessageInit) kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCFieldDescriptor kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__field_descriptors[6] =
{
  {
    "reachable",
    1,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_BOOL,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse, reachable),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "return_reachable",
    2,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_BOOL,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse, return_reachable),
    NULL,
    NULL,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "query_status",
    3,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse, query_status),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "report_url",
    4,
    PROTOBUF_C_LABEL_NONE,
    PROTOBUF_C_TYPE_STRING,
    0,   /* quantifier_offset */
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse, report_url),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "paths",
    5,
    PROTOBUF_C_LABEL_REPEATED,
    PROTOBUF_C_TYPE_STRING,
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse, n_paths),
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse, paths),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
  {
    "return_paths",
    6,
    PROTOBUF_C_LABEL_REPEATED,
    PROTOBUF_C_TYPE_STRING,
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse, n_return_paths),
    offsetof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse, return_paths),
    NULL,
    &protobuf_c_empty_string,
    0,             /* flags */
    0,NULL,NULL    /* reserved1,reserved2, etc */
  },
};
static const unsigned kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__field_indices_by_name[] = {
  4,   /* field[4] = paths */
  2,   /* field[2] = query_status */
  0,   /* field[0] = reachable */
  3,   /* field[3] = report_url */
  5,   /* field[5] = return_paths */
  1,   /* field[1] = return_reachable */
};
static const ProtobufCIntRange kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__number_ranges[1 + 1] =
{
  { 1, 0 },
  { 0, 6 }
};
const ProtobufCMessageDescriptor kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__descriptor =
{
  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,
  "kentik.connectivity_checker.v202410beta1.CreateConnectivityReportResponse",
  "CreateConnectivityReportResponse",
  "Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse",
  "kentik.connectivity_checker.v202410beta1",
  sizeof(Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse),
  6,
  kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__field_descriptors,
  kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__field_indices_by_name,
  1,  kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__number_ranges,
  (ProtobufCMessageInit) kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__init,
  NULL,NULL,NULL    /* reserved[123] */
};
static const ProtobufCEnumValue kentik__connectivity_checker__v202410beta1__cloud_provider__enum_values_by_number[3] =
{
  { "CLOUD_PROVIDER_UNSPECIFIED", "KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CLOUD_PROVIDER__CLOUD_PROVIDER_UNSPECIFIED", 0 },
  { "CLOUD_PROVIDER_AWS", "KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CLOUD_PROVIDER__CLOUD_PROVIDER_AWS", 1 },
  { "CLOUD_PROVIDER_AZURE", "KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CLOUD_PROVIDER__CLOUD_PROVIDER_AZURE", 2 },
};
static const ProtobufCIntRange kentik__connectivity_checker__v202410beta1__cloud_provider__value_ranges[] = {
{0, 0},{0, 3}
};
static const ProtobufCEnumValueIndex kentik__connectivity_checker__v202410beta1__cloud_provider__enum_values_by_name[3] =
{
  { "CLOUD_PROVIDER_AWS", 1 },
  { "CLOUD_PROVIDER_AZURE", 2 },
  { "CLOUD_PROVIDER_UNSPECIFIED", 0 },
};
const ProtobufCEnumDescriptor kentik__connectivity_checker__v202410beta1__cloud_provider__descriptor =
{
  PROTOBUF_C__ENUM_DESCRIPTOR_MAGIC,
  "kentik.connectivity_checker.v202410beta1.CloudProvider",
  "CloudProvider",
  "Kentik__ConnectivityChecker__V202410beta1__CloudProvider",
  "kentik.connectivity_checker.v202410beta1",
  3,
  kentik__connectivity_checker__v202410beta1__cloud_provider__enum_values_by_number,
  3,
  kentik__connectivity_checker__v202410beta1__cloud_provider__enum_values_by_name,
  1,
  kentik__connectivity_checker__v202410beta1__cloud_provider__value_ranges,
  NULL,NULL,NULL,NULL   /* reserved[1234] */
};
static const ProtobufCEnumValue kentik__connectivity_checker__v202410beta1__entity_type__enum_values_by_number[4] =
{
  { "ENTITY_TYPE_UNSPECIFIED", "KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__ENTITY_TYPE__ENTITY_TYPE_UNSPECIFIED", 0 },
  { "ENTITY_TYPE_SUBNET", "KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__ENTITY_TYPE__ENTITY_TYPE_SUBNET", 1 },
  { "ENTITY_TYPE_INSTANCE", "KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__ENTITY_TYPE__ENTITY_TYPE_INSTANCE", 2 },
  { "ENTITY_TYPE_NETWORK_INTERFACE", "KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__ENTITY_TYPE__ENTITY_TYPE_NETWORK_INTERFACE", 3 },
};
static const ProtobufCIntRange kentik__connectivity_checker__v202410beta1__entity_type__value_ranges[] = {
{0, 0},{0, 4}
};
static const ProtobufCEnumValueIndex kentik__connectivity_checker__v202410beta1__entity_type__enum_values_by_name[4] =
{
  { "ENTITY_TYPE_INSTANCE", 2 },
  { "ENTITY_TYPE_NETWORK_INTERFACE", 3 },
  { "ENTITY_TYPE_SUBNET", 1 },
  { "ENTITY_TYPE_UNSPECIFIED", 0 },
};
const ProtobufCEnumDescriptor kentik__connectivity_checker__v202410beta1__entity_type__descriptor =
{
  PROTOBUF_C__ENUM_DESCRIPTOR_MAGIC,
  "kentik.connectivity_checker.v202410beta1.EntityType",
  "EntityType",
  "Kentik__ConnectivityChecker__V202410beta1__EntityType",
  "kentik.connectivity_checker.v202410beta1",
  4,
  kentik__connectivity_checker__v202410beta1__entity_type__enum_values_by_number,
  4,
  kentik__connectivity_checker__v202410beta1__entity_type__enum_values_by_name,
  1,
  kentik__connectivity_checker__v202410beta1__entity_type__value_ranges,
  NULL,NULL,NULL,NULL   /* reserved[1234] */
};
static const ProtobufCMethodDescriptor kentik__connectivity_checker__v202410beta1__connectivity_checker_admin_service__method_descriptors[1] =
{
  { "CreateConnectivityReport", &kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__descriptor, &kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__descriptor },
};
const unsigned kentik__connectivity_checker__v202410beta1__connectivity_checker_admin_service__method_indices_by_name[] = {
  0         /* CreateConnectivityReport */
};
const ProtobufCServiceDescriptor kentik__connectivity_checker__v202410beta1__connectivity_checker_admin_service__descriptor =
{
  PROTOBUF_C__SERVICE_DESCRIPTOR_MAGIC,
  "kentik.connectivity_checker.v202410beta1.ConnectivityCheckerAdminService",
  "ConnectivityCheckerAdminService",
  "Kentik__ConnectivityChecker__V202410beta1__ConnectivityCheckerAdminService",
  "kentik.connectivity_checker.v202410beta1",
  1,
  kentik__connectivity_checker__v202410beta1__connectivity_checker_admin_service__method_descriptors,
  kentik__connectivity_checker__v202410beta1__connectivity_checker_admin_service__method_indices_by_name
};
void kentik__connectivity_checker__v202410beta1__connectivity_checker_admin_service__create_connectivity_report(ProtobufCService *service,
                                                                                                                const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest *input,
                                                                                                                Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse_Closure closure,
                                                                                                                void *closure_data)
{
  assert(service->descriptor == &kentik__connectivity_checker__v202410beta1__connectivity_checker_admin_service__descriptor);
  service->invoke(service, 0, (const ProtobufCMessage *) input, (ProtobufCClosure) closure, closure_data);
}
void kentik__connectivity_checker__v202410beta1__connectivity_checker_admin_service__init (Kentik__ConnectivityChecker__V202410beta1__ConnectivityCheckerAdminService_Service *service,
                                                                                           Kentik__ConnectivityChecker__V202410beta1__ConnectivityCheckerAdminService_ServiceDestroy destroy)
{
  protobuf_c_service_generated_init (&service->base,
                                     &kentik__connectivity_checker__v202410beta1__connectivity_checker_admin_service__descriptor,
                                     (ProtobufCServiceDestroy) destroy);
}
