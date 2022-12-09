/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: grpc/lb/v1/load_reporter.proto */

#ifndef PROTOBUF_C_grpc_2flb_2fv1_2fload_5freporter_2eproto__INCLUDED
#define PROTOBUF_C_grpc_2flb_2fv1_2fload_5freporter_2eproto__INCLUDED

#include <protobuf-c/protobuf-c.h>

PROTOBUF_C__BEGIN_DECLS

#if PROTOBUF_C_VERSION_NUMBER < 1003000
# error This file was generated by a newer version of protoc-c which is incompatible with your libprotobuf-c headers. Please update your headers.
#elif 1003003 < PROTOBUF_C_MIN_COMPILER_VERSION
# error This file was generated by an older version of protoc-c which is incompatible with your libprotobuf-c headers. Please regenerate this file with a newer version of protoc-c.
#endif

#include "google/protobuf/duration.pb-c.h"

typedef struct _Grpc__Lb__V1__LoadReportRequest Grpc__Lb__V1__LoadReportRequest;
typedef struct _Grpc__Lb__V1__InitialLoadReportRequest Grpc__Lb__V1__InitialLoadReportRequest;
typedef struct _Grpc__Lb__V1__LoadReportResponse Grpc__Lb__V1__LoadReportResponse;
typedef struct _Grpc__Lb__V1__InitialLoadReportResponse Grpc__Lb__V1__InitialLoadReportResponse;
typedef struct _Grpc__Lb__V1__LoadBalancingFeedback Grpc__Lb__V1__LoadBalancingFeedback;
typedef struct _Grpc__Lb__V1__Load Grpc__Lb__V1__Load;
typedef struct _Grpc__Lb__V1__CallMetricData Grpc__Lb__V1__CallMetricData;
typedef struct _Grpc__Lb__V1__OrphanedLoadIdentifier Grpc__Lb__V1__OrphanedLoadIdentifier;


/* --- enums --- */

typedef enum _Grpc__Lb__V1__InitialLoadReportResponse__ImplementationIdentifier {
  GRPC__LB__V1__INITIAL_LOAD_REPORT_RESPONSE__IMPLEMENTATION_IDENTIFIER__IMPL_UNSPECIFIED = 0,
  /*
   * Standard Google C++ implementation.
   */
  GRPC__LB__V1__INITIAL_LOAD_REPORT_RESPONSE__IMPLEMENTATION_IDENTIFIER__CPP = 1,
  /*
   * Standard Google Java implementation.
   */
  GRPC__LB__V1__INITIAL_LOAD_REPORT_RESPONSE__IMPLEMENTATION_IDENTIFIER__JAVA = 2,
  /*
   * Standard Google Go implementation.
   */
  GRPC__LB__V1__INITIAL_LOAD_REPORT_RESPONSE__IMPLEMENTATION_IDENTIFIER__GO = 3
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(GRPC__LB__V1__INITIAL_LOAD_REPORT_RESPONSE__IMPLEMENTATION_IDENTIFIER)
} Grpc__Lb__V1__InitialLoadReportResponse__ImplementationIdentifier;

/* --- messages --- */

struct  _Grpc__Lb__V1__LoadReportRequest
{
  ProtobufCMessage base;
  /*
   * This message should be sent on the first request to the gRPC server.
   */
  Grpc__Lb__V1__InitialLoadReportRequest *initial_request;
};
#define GRPC__LB__V1__LOAD_REPORT_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&grpc__lb__v1__load_report_request__descriptor) \
    , NULL }


struct  _Grpc__Lb__V1__InitialLoadReportRequest
{
  ProtobufCMessage base;
  /*
   * The hostname this load reporter client is requesting load for.
   */
  char *load_balanced_hostname;
  /*
   * Additional information to disambiguate orphaned load: load that should have
   * gone to this load reporter client, but was not able to be sent since the
   * load reporter client has disconnected. load_key is sent in orphaned load
   * reports; see Load.load_key.
   */
  ProtobufCBinaryData load_key;
  /*
   * This interval defines how often the server should send load reports to
   * the load balancer.
   */
  Google__Protobuf__Duration *load_report_interval;
};
#define GRPC__LB__V1__INITIAL_LOAD_REPORT_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&grpc__lb__v1__initial_load_report_request__descriptor) \
    , (char *)protobuf_c_empty_string, {0,NULL}, NULL }


struct  _Grpc__Lb__V1__LoadReportResponse
{
  ProtobufCMessage base;
  /*
   * This message should be sent on the first response to the load balancer.
   */
  Grpc__Lb__V1__InitialLoadReportResponse *initial_response;
  /*
   * Reports server-wide statistics for load balancing.
   * This should be reported with every response.
   */
  Grpc__Lb__V1__LoadBalancingFeedback *load_balancing_feedback;
  /*
   * A load report for each <tag, user_id> tuple. This could be considered to be
   * a multimap indexed by <tag, user_id>. It is not strictly necessary to
   * aggregate all entries into one entry per <tag, user_id> tuple, although it
   * is preferred to do so.
   */
  size_t n_load;
  Grpc__Lb__V1__Load **load;
};
#define GRPC__LB__V1__LOAD_REPORT_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&grpc__lb__v1__load_report_response__descriptor) \
    , NULL, NULL, 0,NULL }


struct  _Grpc__Lb__V1__InitialLoadReportResponse
{
  ProtobufCMessage base;
  /*
   * Initial response returns the Load balancer ID. This must be plain text
   * (printable ASCII).
   */
  char *load_balancer_id;
  /*
   * Optional identifier of this implementation of the load reporting server.
   */
  Grpc__Lb__V1__InitialLoadReportResponse__ImplementationIdentifier implementation_id;
  /*
   * Optional server_version should be a value that is modified (and
   * monotonically increased) when changes are made to the server
   * implementation.
   */
  int64_t server_version;
};
#define GRPC__LB__V1__INITIAL_LOAD_REPORT_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&grpc__lb__v1__initial_load_report_response__descriptor) \
    , (char *)protobuf_c_empty_string, GRPC__LB__V1__INITIAL_LOAD_REPORT_RESPONSE__IMPLEMENTATION_IDENTIFIER__IMPL_UNSPECIFIED, 0 }


struct  _Grpc__Lb__V1__LoadBalancingFeedback
{
  ProtobufCMessage base;
  /*
   * Reports the current utilization of the server (typical range [0.0 - 1.0]).
   */
  float server_utilization;
  /*
   * The total rate of calls handled by this server (including errors).
   */
  float calls_per_second;
  /*
   * The total rate of error responses sent by this server.
   */
  float errors_per_second;
};
#define GRPC__LB__V1__LOAD_BALANCING_FEEDBACK__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&grpc__lb__v1__load_balancing_feedback__descriptor) \
    , 0, 0, 0 }


typedef enum {
  GRPC__LB__V1__LOAD__IN_PROGRESS_REPORT__NOT_SET = 0,
  GRPC__LB__V1__LOAD__IN_PROGRESS_REPORT_NUM_CALLS_IN_PROGRESS = 5
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(GRPC__LB__V1__LOAD__IN_PROGRESS_REPORT)
} Grpc__Lb__V1__Load__InProgressReportCase;

typedef enum {
  GRPC__LB__V1__LOAD__ORPHANED_LOAD__NOT_SET = 0,
  GRPC__LB__V1__LOAD__ORPHANED_LOAD_LOAD_KEY = 12,
  GRPC__LB__V1__LOAD__ORPHANED_LOAD_LOAD_KEY_UNKNOWN = 13,
  GRPC__LB__V1__LOAD__ORPHANED_LOAD_ORPHANED_LOAD_IDENTIFIER = 14
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(GRPC__LB__V1__LOAD__ORPHANED_LOAD)
} Grpc__Lb__V1__Load__OrphanedLoadCase;

struct  _Grpc__Lb__V1__Load
{
  ProtobufCMessage base;
  /*
   * The (plain text) tag used by the calls covered by this load report. The
   * tag is that part of the load balancer token after removing the load
   * balancer id. Empty is equivalent to non-existent tag.
   */
  char *load_balance_tag;
  /*
   * The user identity authenticated by the calls covered by this load
   * report. Empty is equivalent to no known user_id.
   */
  char *user_id;
  /*
   * IP address of the client that sent these requests, serialized in
   * network-byte-order. It may either be an IPv4 or IPv6 address.
   */
  ProtobufCBinaryData client_ip_address;
  /*
   * The number of calls started (since the last report) with the given tag and
   * user_id.
   */
  int64_t num_calls_started;
  /*
   * The following values are counts or totals of call statistics that finished
   * with the given tag and user_id.
   */
  /*
   * Calls with status OK.
   */
  int64_t num_calls_finished_without_error;
  /*
   * Calls with status non-OK.
   */
  int64_t num_calls_finished_with_error;
  /*
   * Calls that finished with a status that maps to HTTP 5XX (see
   * googleapis/google/rpc/code.proto). Note that this is a subset of
   * num_calls_finished_with_error.
   */
  int64_t num_calls_finished_with_server_error;
  /*
   * Totals are from calls that with _and_ without error.
   */
  int64_t total_bytes_sent;
  int64_t total_bytes_received;
  Google__Protobuf__Duration *total_latency;
  /*
   * Optional metrics reported for the call(s). Requires that metric_name is
   * unique.
   */
  size_t n_metric_data;
  Grpc__Lb__V1__CallMetricData **metric_data;
  Grpc__Lb__V1__Load__InProgressReportCase in_progress_report_case;
  union {
    /*
     * The number of calls in progress (instantaneously) per load balancer id.
     */
    int64_t num_calls_in_progress;
  };
  Grpc__Lb__V1__Load__OrphanedLoadCase orphaned_load_case;
  union {
    /*
     * Load_key is the load_key from the initial_request from the originating
     * balancer.
     */
    ProtobufCBinaryData load_key PROTOBUF_C__DEPRECATED;
    /*
     * If true then this load report is for calls that had an invalid token; the
     * user is probably abusing the gRPC protocol.
     * TODO(yankaiz): Rename load_key_unknown.
     */
    protobuf_c_boolean load_key_unknown;
    /*
     * load_key and balancer_id are included in order to identify orphaned load
     * from different origins.
     */
    Grpc__Lb__V1__OrphanedLoadIdentifier *orphaned_load_identifier;
  };
};
#define GRPC__LB__V1__LOAD__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&grpc__lb__v1__load__descriptor) \
    , (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, {0,NULL}, 0, 0, 0, 0, 0, 0, NULL, 0,NULL, GRPC__LB__V1__LOAD__IN_PROGRESS_REPORT__NOT_SET, {0}, GRPC__LB__V1__LOAD__ORPHANED_LOAD__NOT_SET, {0} }


struct  _Grpc__Lb__V1__CallMetricData
{
  ProtobufCMessage base;
  /*
   * Name of the metric; may be empty.
   */
  char *metric_name;
  /*
   * Number of calls that finished and included this metric.
   */
  int64_t num_calls_finished_with_metric;
  /*
   * Sum of metric values across all calls that finished with this metric.
   */
  double total_metric_value;
};
#define GRPC__LB__V1__CALL_METRIC_DATA__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&grpc__lb__v1__call_metric_data__descriptor) \
    , (char *)protobuf_c_empty_string, 0, 0 }


struct  _Grpc__Lb__V1__OrphanedLoadIdentifier
{
  ProtobufCMessage base;
  /*
   * The load_key from the initial_request from the originating balancer.
   */
  ProtobufCBinaryData load_key;
  /*
   * The unique ID generated by LoadReporter to identify balancers. Here it
   * distinguishes orphaned load with a same load_key.
   */
  char *load_balancer_id;
};
#define GRPC__LB__V1__ORPHANED_LOAD_IDENTIFIER__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&grpc__lb__v1__orphaned_load_identifier__descriptor) \
    , {0,NULL}, (char *)protobuf_c_empty_string }


/* Grpc__Lb__V1__LoadReportRequest methods */
void   grpc__lb__v1__load_report_request__init
                     (Grpc__Lb__V1__LoadReportRequest         *message);
size_t grpc__lb__v1__load_report_request__get_packed_size
                     (const Grpc__Lb__V1__LoadReportRequest   *message);
size_t grpc__lb__v1__load_report_request__pack
                     (const Grpc__Lb__V1__LoadReportRequest   *message,
                      uint8_t             *out);
size_t grpc__lb__v1__load_report_request__pack_to_buffer
                     (const Grpc__Lb__V1__LoadReportRequest   *message,
                      ProtobufCBuffer     *buffer);
Grpc__Lb__V1__LoadReportRequest *
       grpc__lb__v1__load_report_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   grpc__lb__v1__load_report_request__free_unpacked
                     (Grpc__Lb__V1__LoadReportRequest *message,
                      ProtobufCAllocator *allocator);
/* Grpc__Lb__V1__InitialLoadReportRequest methods */
void   grpc__lb__v1__initial_load_report_request__init
                     (Grpc__Lb__V1__InitialLoadReportRequest         *message);
size_t grpc__lb__v1__initial_load_report_request__get_packed_size
                     (const Grpc__Lb__V1__InitialLoadReportRequest   *message);
size_t grpc__lb__v1__initial_load_report_request__pack
                     (const Grpc__Lb__V1__InitialLoadReportRequest   *message,
                      uint8_t             *out);
size_t grpc__lb__v1__initial_load_report_request__pack_to_buffer
                     (const Grpc__Lb__V1__InitialLoadReportRequest   *message,
                      ProtobufCBuffer     *buffer);
Grpc__Lb__V1__InitialLoadReportRequest *
       grpc__lb__v1__initial_load_report_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   grpc__lb__v1__initial_load_report_request__free_unpacked
                     (Grpc__Lb__V1__InitialLoadReportRequest *message,
                      ProtobufCAllocator *allocator);
/* Grpc__Lb__V1__LoadReportResponse methods */
void   grpc__lb__v1__load_report_response__init
                     (Grpc__Lb__V1__LoadReportResponse         *message);
size_t grpc__lb__v1__load_report_response__get_packed_size
                     (const Grpc__Lb__V1__LoadReportResponse   *message);
size_t grpc__lb__v1__load_report_response__pack
                     (const Grpc__Lb__V1__LoadReportResponse   *message,
                      uint8_t             *out);
size_t grpc__lb__v1__load_report_response__pack_to_buffer
                     (const Grpc__Lb__V1__LoadReportResponse   *message,
                      ProtobufCBuffer     *buffer);
Grpc__Lb__V1__LoadReportResponse *
       grpc__lb__v1__load_report_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   grpc__lb__v1__load_report_response__free_unpacked
                     (Grpc__Lb__V1__LoadReportResponse *message,
                      ProtobufCAllocator *allocator);
/* Grpc__Lb__V1__InitialLoadReportResponse methods */
void   grpc__lb__v1__initial_load_report_response__init
                     (Grpc__Lb__V1__InitialLoadReportResponse         *message);
size_t grpc__lb__v1__initial_load_report_response__get_packed_size
                     (const Grpc__Lb__V1__InitialLoadReportResponse   *message);
size_t grpc__lb__v1__initial_load_report_response__pack
                     (const Grpc__Lb__V1__InitialLoadReportResponse   *message,
                      uint8_t             *out);
size_t grpc__lb__v1__initial_load_report_response__pack_to_buffer
                     (const Grpc__Lb__V1__InitialLoadReportResponse   *message,
                      ProtobufCBuffer     *buffer);
Grpc__Lb__V1__InitialLoadReportResponse *
       grpc__lb__v1__initial_load_report_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   grpc__lb__v1__initial_load_report_response__free_unpacked
                     (Grpc__Lb__V1__InitialLoadReportResponse *message,
                      ProtobufCAllocator *allocator);
/* Grpc__Lb__V1__LoadBalancingFeedback methods */
void   grpc__lb__v1__load_balancing_feedback__init
                     (Grpc__Lb__V1__LoadBalancingFeedback         *message);
size_t grpc__lb__v1__load_balancing_feedback__get_packed_size
                     (const Grpc__Lb__V1__LoadBalancingFeedback   *message);
size_t grpc__lb__v1__load_balancing_feedback__pack
                     (const Grpc__Lb__V1__LoadBalancingFeedback   *message,
                      uint8_t             *out);
size_t grpc__lb__v1__load_balancing_feedback__pack_to_buffer
                     (const Grpc__Lb__V1__LoadBalancingFeedback   *message,
                      ProtobufCBuffer     *buffer);
Grpc__Lb__V1__LoadBalancingFeedback *
       grpc__lb__v1__load_balancing_feedback__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   grpc__lb__v1__load_balancing_feedback__free_unpacked
                     (Grpc__Lb__V1__LoadBalancingFeedback *message,
                      ProtobufCAllocator *allocator);
/* Grpc__Lb__V1__Load methods */
void   grpc__lb__v1__load__init
                     (Grpc__Lb__V1__Load         *message);
size_t grpc__lb__v1__load__get_packed_size
                     (const Grpc__Lb__V1__Load   *message);
size_t grpc__lb__v1__load__pack
                     (const Grpc__Lb__V1__Load   *message,
                      uint8_t             *out);
size_t grpc__lb__v1__load__pack_to_buffer
                     (const Grpc__Lb__V1__Load   *message,
                      ProtobufCBuffer     *buffer);
Grpc__Lb__V1__Load *
       grpc__lb__v1__load__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   grpc__lb__v1__load__free_unpacked
                     (Grpc__Lb__V1__Load *message,
                      ProtobufCAllocator *allocator);
/* Grpc__Lb__V1__CallMetricData methods */
void   grpc__lb__v1__call_metric_data__init
                     (Grpc__Lb__V1__CallMetricData         *message);
size_t grpc__lb__v1__call_metric_data__get_packed_size
                     (const Grpc__Lb__V1__CallMetricData   *message);
size_t grpc__lb__v1__call_metric_data__pack
                     (const Grpc__Lb__V1__CallMetricData   *message,
                      uint8_t             *out);
size_t grpc__lb__v1__call_metric_data__pack_to_buffer
                     (const Grpc__Lb__V1__CallMetricData   *message,
                      ProtobufCBuffer     *buffer);
Grpc__Lb__V1__CallMetricData *
       grpc__lb__v1__call_metric_data__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   grpc__lb__v1__call_metric_data__free_unpacked
                     (Grpc__Lb__V1__CallMetricData *message,
                      ProtobufCAllocator *allocator);
/* Grpc__Lb__V1__OrphanedLoadIdentifier methods */
void   grpc__lb__v1__orphaned_load_identifier__init
                     (Grpc__Lb__V1__OrphanedLoadIdentifier         *message);
size_t grpc__lb__v1__orphaned_load_identifier__get_packed_size
                     (const Grpc__Lb__V1__OrphanedLoadIdentifier   *message);
size_t grpc__lb__v1__orphaned_load_identifier__pack
                     (const Grpc__Lb__V1__OrphanedLoadIdentifier   *message,
                      uint8_t             *out);
size_t grpc__lb__v1__orphaned_load_identifier__pack_to_buffer
                     (const Grpc__Lb__V1__OrphanedLoadIdentifier   *message,
                      ProtobufCBuffer     *buffer);
Grpc__Lb__V1__OrphanedLoadIdentifier *
       grpc__lb__v1__orphaned_load_identifier__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   grpc__lb__v1__orphaned_load_identifier__free_unpacked
                     (Grpc__Lb__V1__OrphanedLoadIdentifier *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Grpc__Lb__V1__LoadReportRequest_Closure)
                 (const Grpc__Lb__V1__LoadReportRequest *message,
                  void *closure_data);
typedef void (*Grpc__Lb__V1__InitialLoadReportRequest_Closure)
                 (const Grpc__Lb__V1__InitialLoadReportRequest *message,
                  void *closure_data);
typedef void (*Grpc__Lb__V1__LoadReportResponse_Closure)
                 (const Grpc__Lb__V1__LoadReportResponse *message,
                  void *closure_data);
typedef void (*Grpc__Lb__V1__InitialLoadReportResponse_Closure)
                 (const Grpc__Lb__V1__InitialLoadReportResponse *message,
                  void *closure_data);
typedef void (*Grpc__Lb__V1__LoadBalancingFeedback_Closure)
                 (const Grpc__Lb__V1__LoadBalancingFeedback *message,
                  void *closure_data);
typedef void (*Grpc__Lb__V1__Load_Closure)
                 (const Grpc__Lb__V1__Load *message,
                  void *closure_data);
typedef void (*Grpc__Lb__V1__CallMetricData_Closure)
                 (const Grpc__Lb__V1__CallMetricData *message,
                  void *closure_data);
typedef void (*Grpc__Lb__V1__OrphanedLoadIdentifier_Closure)
                 (const Grpc__Lb__V1__OrphanedLoadIdentifier *message,
                  void *closure_data);

/* --- services --- */

typedef struct _Grpc__Lb__V1__LoadReporter_Service Grpc__Lb__V1__LoadReporter_Service;
struct _Grpc__Lb__V1__LoadReporter_Service
{
  ProtobufCService base;
  void (*report_load)(Grpc__Lb__V1__LoadReporter_Service *service,
                      const Grpc__Lb__V1__LoadReportRequest *input,
                      Grpc__Lb__V1__LoadReportResponse_Closure closure,
                      void *closure_data);
};
typedef void (*Grpc__Lb__V1__LoadReporter_ServiceDestroy)(Grpc__Lb__V1__LoadReporter_Service *);
void grpc__lb__v1__load_reporter__init (Grpc__Lb__V1__LoadReporter_Service *service,
                                        Grpc__Lb__V1__LoadReporter_ServiceDestroy destroy);
#define GRPC__LB__V1__LOAD_REPORTER__BASE_INIT \
    { &grpc__lb__v1__load_reporter__descriptor, protobuf_c_service_invoke_internal, NULL }
#define GRPC__LB__V1__LOAD_REPORTER__INIT(function_prefix__) \
    { GRPC__LB__V1__LOAD_REPORTER__BASE_INIT,\
      function_prefix__ ## report_load  }
void grpc__lb__v1__load_reporter__report_load(ProtobufCService *service,
                                              const Grpc__Lb__V1__LoadReportRequest *input,
                                              Grpc__Lb__V1__LoadReportResponse_Closure closure,
                                              void *closure_data);

/* --- descriptors --- */

extern const ProtobufCMessageDescriptor grpc__lb__v1__load_report_request__descriptor;
extern const ProtobufCMessageDescriptor grpc__lb__v1__initial_load_report_request__descriptor;
extern const ProtobufCMessageDescriptor grpc__lb__v1__load_report_response__descriptor;
extern const ProtobufCMessageDescriptor grpc__lb__v1__initial_load_report_response__descriptor;
extern const ProtobufCEnumDescriptor    grpc__lb__v1__initial_load_report_response__implementation_identifier__descriptor;
extern const ProtobufCMessageDescriptor grpc__lb__v1__load_balancing_feedback__descriptor;
extern const ProtobufCMessageDescriptor grpc__lb__v1__load__descriptor;
extern const ProtobufCMessageDescriptor grpc__lb__v1__call_metric_data__descriptor;
extern const ProtobufCMessageDescriptor grpc__lb__v1__orphaned_load_identifier__descriptor;
extern const ProtobufCServiceDescriptor grpc__lb__v1__load_reporter__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_grpc_2flb_2fv1_2fload_5freporter_2eproto__INCLUDED */
