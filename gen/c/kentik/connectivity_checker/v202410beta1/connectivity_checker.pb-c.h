/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/connectivity_checker/v202410beta1/connectivity_checker.proto */

#ifndef PROTOBUF_C_kentik_2fconnectivity_5fchecker_2fv202410beta1_2fconnectivity_5fchecker_2eproto__INCLUDED
#define PROTOBUF_C_kentik_2fconnectivity_5fchecker_2fv202410beta1_2fconnectivity_5fchecker_2eproto__INCLUDED

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
#include "google/protobuf/timestamp.pb-c.h"
#include "kentik/core/v202303/annotations.pb-c.h"

typedef struct Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest;
typedef struct Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse;


/* --- enums --- */

/*
 * {{.Name}}
 */
typedef enum _Kentik__ConnectivityChecker__V202410beta1__CloudProvider {
  /*
   * Invalid value.
   */
  KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CLOUD_PROVIDER__CLOUD_PROVIDER_UNSPECIFIED = 0,
  /*
   * Amazon Web Services
   */
  KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CLOUD_PROVIDER__CLOUD_PROVIDER_AWS = 1,
  /*
   * Microsoft Azure
   */
  KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CLOUD_PROVIDER__CLOUD_PROVIDER_AZURE = 2
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CLOUD_PROVIDER)
} Kentik__ConnectivityChecker__V202410beta1__CloudProvider;
/*
 * {{.Name}}
 */
typedef enum _Kentik__ConnectivityChecker__V202410beta1__EntityType {
  /*
   * Invalid value.
   */
  KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__ENTITY_TYPE__ENTITY_TYPE_UNSPECIFIED = 0,
  /*
   * Subnet
   */
  KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__ENTITY_TYPE__ENTITY_TYPE_SUBNET = 1,
  /*
   * Instance
   */
  KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__ENTITY_TYPE__ENTITY_TYPE_INSTANCE = 2,
  /*
   * Network Interfaces
   */
  KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__ENTITY_TYPE__ENTITY_TYPE_NETWORK_INTERFACE = 3
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__ENTITY_TYPE)
} Kentik__ConnectivityChecker__V202410beta1__EntityType;

/* --- messages --- */

/*
 * {{.Name}}
 */
struct  Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest
{
  ProtobufCMessage base;
  Kentik__ConnectivityChecker__V202410beta1__CloudProvider cloud_provider;
  char *src;
  char *dst;
  char *dst_port;
  char *protocol;
  Kentik__ConnectivityChecker__V202410beta1__EntityType src_type;
  Kentik__ConnectivityChecker__V202410beta1__EntityType dst_type;
  Google__Protobuf__Timestamp *start_time;
  Google__Protobuf__Timestamp *end_time;
  char *name;
};
#define KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CREATE_CONNECTIVITY_REPORT_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__descriptor) \
    , KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CLOUD_PROVIDER__CLOUD_PROVIDER_UNSPECIFIED, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__ENTITY_TYPE__ENTITY_TYPE_UNSPECIFIED, KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__ENTITY_TYPE__ENTITY_TYPE_UNSPECIFIED, NULL, NULL, (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse
{
  ProtobufCMessage base;
  protobuf_c_boolean reachable;
  protobuf_c_boolean return_reachable;
  char *query_status;
  char *report_url;
  size_t n_paths;
  char **paths;
  size_t n_return_paths;
  char **return_paths;
};
#define KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CREATE_CONNECTIVITY_REPORT_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__descriptor) \
    , 0, 0, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, 0,NULL, 0,NULL }


/* Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest methods */
void   kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__init
                     (Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest         *message);
size_t kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__get_packed_size
                     (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest   *message);
size_t kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__pack
                     (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest   *message,
                      uint8_t             *out);
size_t kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__pack_to_buffer
                     (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest *
       kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__free_unpacked
                     (Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse methods */
void   kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__init
                     (Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse         *message);
size_t kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__get_packed_size
                     (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse   *message);
size_t kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__pack
                     (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse   *message,
                      uint8_t             *out);
size_t kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__pack_to_buffer
                     (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse *
       kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__free_unpacked
                     (Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest_Closure)
                 (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest *message,
                  void *closure_data);
typedef void (*Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse_Closure)
                 (const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse *message,
                  void *closure_data);

/* --- services --- */

typedef struct Kentik__ConnectivityChecker__V202410beta1__ConnectivityCheckerAdminService_Service Kentik__ConnectivityChecker__V202410beta1__ConnectivityCheckerAdminService_Service;
struct Kentik__ConnectivityChecker__V202410beta1__ConnectivityCheckerAdminService_Service
{
  ProtobufCService base;
  void (*create_connectivity_report)(Kentik__ConnectivityChecker__V202410beta1__ConnectivityCheckerAdminService_Service *service,
                                     const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest *input,
                                     Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse_Closure closure,
                                     void *closure_data);
};
typedef void (*Kentik__ConnectivityChecker__V202410beta1__ConnectivityCheckerAdminService_ServiceDestroy)(Kentik__ConnectivityChecker__V202410beta1__ConnectivityCheckerAdminService_Service *);
void kentik__connectivity_checker__v202410beta1__connectivity_checker_admin_service__init (Kentik__ConnectivityChecker__V202410beta1__ConnectivityCheckerAdminService_Service *service,
                                                                                           Kentik__ConnectivityChecker__V202410beta1__ConnectivityCheckerAdminService_ServiceDestroy destroy);
#define KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CONNECTIVITY_CHECKER_ADMIN_SERVICE__BASE_INIT \
    { &kentik__connectivity_checker__v202410beta1__connectivity_checker_admin_service__descriptor, protobuf_c_service_invoke_internal, NULL }
#define KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CONNECTIVITY_CHECKER_ADMIN_SERVICE__INIT(function_prefix__) \
    { KENTIK__CONNECTIVITY_CHECKER__V202410BETA1__CONNECTIVITY_CHECKER_ADMIN_SERVICE__BASE_INIT,\
      function_prefix__ ## create_connectivity_report  }
void kentik__connectivity_checker__v202410beta1__connectivity_checker_admin_service__create_connectivity_report(ProtobufCService *service,
                                                                                                                const Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportRequest *input,
                                                                                                                Kentik__ConnectivityChecker__V202410beta1__CreateConnectivityReportResponse_Closure closure,
                                                                                                                void *closure_data);

/* --- descriptors --- */

extern const ProtobufCEnumDescriptor    kentik__connectivity_checker__v202410beta1__cloud_provider__descriptor;
extern const ProtobufCEnumDescriptor    kentik__connectivity_checker__v202410beta1__entity_type__descriptor;
extern const ProtobufCMessageDescriptor kentik__connectivity_checker__v202410beta1__create_connectivity_report_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__connectivity_checker__v202410beta1__create_connectivity_report_response__descriptor;
extern const ProtobufCServiceDescriptor kentik__connectivity_checker__v202410beta1__connectivity_checker_admin_service__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_kentik_2fconnectivity_5fchecker_2fv202410beta1_2fconnectivity_5fchecker_2eproto__INCLUDED */