/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/cost/v202308/cost.proto */

#ifndef PROTOBUF_C_kentik_2fcost_2fv202308_2fcost_2eproto__INCLUDED
#define PROTOBUF_C_kentik_2fcost_2fv202308_2fcost_2eproto__INCLUDED

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
#include "google/protobuf/timestamp.pb-c.h"
#include "protoc-gen-openapiv2/options/annotations.pb-c.h"
#include "kentik/core/v202303/annotations.pb-c.h"

typedef struct Kentik__Cost__V202308__CostProviderSummary Kentik__Cost__V202308__CostProviderSummary;
typedef struct Kentik__Cost__V202308__CostProviderConcise Kentik__Cost__V202308__CostProviderConcise;
typedef struct Kentik__Cost__V202308__ListCostProvidersRequest Kentik__Cost__V202308__ListCostProvidersRequest;
typedef struct Kentik__Cost__V202308__ListCostProvidersResponse Kentik__Cost__V202308__ListCostProvidersResponse;
typedef struct Kentik__Cost__V202308__ListCostProviderSummariesRequest Kentik__Cost__V202308__ListCostProviderSummariesRequest;
typedef struct Kentik__Cost__V202308__ListCostProviderSummariesResponse Kentik__Cost__V202308__ListCostProviderSummariesResponse;
typedef struct Kentik__Cost__V202308__GetCostProviderSummaryRequest Kentik__Cost__V202308__GetCostProviderSummaryRequest;
typedef struct Kentik__Cost__V202308__GetCostProviderSummaryResponse Kentik__Cost__V202308__GetCostProviderSummaryResponse;


/* --- enums --- */

/*
 * {{.Name}}
 */
typedef enum _Kentik__Cost__V202308__Status {
  KENTIK__COST__V202308__STATUS__STATUS_UNSPECIFIED = 0,
  KENTIK__COST__V202308__STATUS__STATUS_INCOMPLETE = 1,
  KENTIK__COST__V202308__STATUS__STATUS_COMPLETE = 2
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__COST__V202308__STATUS)
} Kentik__Cost__V202308__Status;

/* --- messages --- */

/*
 * {{.Name}}
 */
struct  Kentik__Cost__V202308__CostProviderSummary
{
  ProtobufCMessage base;
  char *date;
  Kentik__Cost__V202308__Status status;
  float total_cost;
  char *total_cost_variation;
  float total_cost_group_additional_cost;
  float total_cost_group_additional_interface_cost;
  char *currency;
  float cost_per_mbps;
  char *cost_per_mbps_variation;
  char *provider_name;
  char *cost_group_name;
  char *cost_group_conn_type;
  char *site_name;
  char *site_market;
  float ingress_traffic_mbps;
  char *ingress_traffic_variation;
  float egress_traffic_mbps;
  char *egress_traffic_variation;
};
#define KENTIK__COST__V202308__COST_PROVIDER_SUMMARY__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__cost__v202308__cost_provider_summary__descriptor) \
    , (char *)protobuf_c_empty_string, KENTIK__COST__V202308__STATUS__STATUS_UNSPECIFIED, 0, (char *)protobuf_c_empty_string, 0, 0, (char *)protobuf_c_empty_string, 0, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, 0, (char *)protobuf_c_empty_string, 0, (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  Kentik__Cost__V202308__CostProviderConcise
{
  ProtobufCMessage base;
  char *id;
  char *name;
};
#define KENTIK__COST__V202308__COST_PROVIDER_CONCISE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__cost__v202308__cost_provider_concise__descriptor) \
    , (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  Kentik__Cost__V202308__ListCostProvidersRequest
{
  ProtobufCMessage base;
};
#define KENTIK__COST__V202308__LIST_COST_PROVIDERS_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__cost__v202308__list_cost_providers_request__descriptor) \
     }


/*
 * {{.Name}}
 */
struct  Kentik__Cost__V202308__ListCostProvidersResponse
{
  ProtobufCMessage base;
  size_t n_providers;
  Kentik__Cost__V202308__CostProviderConcise **providers;
  uint32_t invalid_count;
};
#define KENTIK__COST__V202308__LIST_COST_PROVIDERS_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__cost__v202308__list_cost_providers_response__descriptor) \
    , 0,NULL, 0 }


/*
 * {{.Name}}
 */
struct  Kentik__Cost__V202308__ListCostProviderSummariesRequest
{
  ProtobufCMessage base;
  char *date;
};
#define KENTIK__COST__V202308__LIST_COST_PROVIDER_SUMMARIES_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__cost__v202308__list_cost_provider_summaries_request__descriptor) \
    , (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  Kentik__Cost__V202308__ListCostProviderSummariesResponse
{
  ProtobufCMessage base;
  size_t n_providers;
  Kentik__Cost__V202308__CostProviderSummary **providers;
  uint32_t invalid_count;
};
#define KENTIK__COST__V202308__LIST_COST_PROVIDER_SUMMARIES_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__cost__v202308__list_cost_provider_summaries_response__descriptor) \
    , 0,NULL, 0 }


/*
 * {{.Name}}
 */
struct  Kentik__Cost__V202308__GetCostProviderSummaryRequest
{
  ProtobufCMessage base;
  char *id;
  char *date;
};
#define KENTIK__COST__V202308__GET_COST_PROVIDER_SUMMARY_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__cost__v202308__get_cost_provider_summary_request__descriptor) \
    , (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  Kentik__Cost__V202308__GetCostProviderSummaryResponse
{
  ProtobufCMessage base;
  size_t n_providers;
  Kentik__Cost__V202308__CostProviderSummary **providers;
  uint32_t invalid_count;
};
#define KENTIK__COST__V202308__GET_COST_PROVIDER_SUMMARY_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__cost__v202308__get_cost_provider_summary_response__descriptor) \
    , 0,NULL, 0 }


/* Kentik__Cost__V202308__CostProviderSummary methods */
void   kentik__cost__v202308__cost_provider_summary__init
                     (Kentik__Cost__V202308__CostProviderSummary         *message);
size_t kentik__cost__v202308__cost_provider_summary__get_packed_size
                     (const Kentik__Cost__V202308__CostProviderSummary   *message);
size_t kentik__cost__v202308__cost_provider_summary__pack
                     (const Kentik__Cost__V202308__CostProviderSummary   *message,
                      uint8_t             *out);
size_t kentik__cost__v202308__cost_provider_summary__pack_to_buffer
                     (const Kentik__Cost__V202308__CostProviderSummary   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Cost__V202308__CostProviderSummary *
       kentik__cost__v202308__cost_provider_summary__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__cost__v202308__cost_provider_summary__free_unpacked
                     (Kentik__Cost__V202308__CostProviderSummary *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Cost__V202308__CostProviderConcise methods */
void   kentik__cost__v202308__cost_provider_concise__init
                     (Kentik__Cost__V202308__CostProviderConcise         *message);
size_t kentik__cost__v202308__cost_provider_concise__get_packed_size
                     (const Kentik__Cost__V202308__CostProviderConcise   *message);
size_t kentik__cost__v202308__cost_provider_concise__pack
                     (const Kentik__Cost__V202308__CostProviderConcise   *message,
                      uint8_t             *out);
size_t kentik__cost__v202308__cost_provider_concise__pack_to_buffer
                     (const Kentik__Cost__V202308__CostProviderConcise   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Cost__V202308__CostProviderConcise *
       kentik__cost__v202308__cost_provider_concise__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__cost__v202308__cost_provider_concise__free_unpacked
                     (Kentik__Cost__V202308__CostProviderConcise *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Cost__V202308__ListCostProvidersRequest methods */
void   kentik__cost__v202308__list_cost_providers_request__init
                     (Kentik__Cost__V202308__ListCostProvidersRequest         *message);
size_t kentik__cost__v202308__list_cost_providers_request__get_packed_size
                     (const Kentik__Cost__V202308__ListCostProvidersRequest   *message);
size_t kentik__cost__v202308__list_cost_providers_request__pack
                     (const Kentik__Cost__V202308__ListCostProvidersRequest   *message,
                      uint8_t             *out);
size_t kentik__cost__v202308__list_cost_providers_request__pack_to_buffer
                     (const Kentik__Cost__V202308__ListCostProvidersRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Cost__V202308__ListCostProvidersRequest *
       kentik__cost__v202308__list_cost_providers_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__cost__v202308__list_cost_providers_request__free_unpacked
                     (Kentik__Cost__V202308__ListCostProvidersRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Cost__V202308__ListCostProvidersResponse methods */
void   kentik__cost__v202308__list_cost_providers_response__init
                     (Kentik__Cost__V202308__ListCostProvidersResponse         *message);
size_t kentik__cost__v202308__list_cost_providers_response__get_packed_size
                     (const Kentik__Cost__V202308__ListCostProvidersResponse   *message);
size_t kentik__cost__v202308__list_cost_providers_response__pack
                     (const Kentik__Cost__V202308__ListCostProvidersResponse   *message,
                      uint8_t             *out);
size_t kentik__cost__v202308__list_cost_providers_response__pack_to_buffer
                     (const Kentik__Cost__V202308__ListCostProvidersResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Cost__V202308__ListCostProvidersResponse *
       kentik__cost__v202308__list_cost_providers_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__cost__v202308__list_cost_providers_response__free_unpacked
                     (Kentik__Cost__V202308__ListCostProvidersResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Cost__V202308__ListCostProviderSummariesRequest methods */
void   kentik__cost__v202308__list_cost_provider_summaries_request__init
                     (Kentik__Cost__V202308__ListCostProviderSummariesRequest         *message);
size_t kentik__cost__v202308__list_cost_provider_summaries_request__get_packed_size
                     (const Kentik__Cost__V202308__ListCostProviderSummariesRequest   *message);
size_t kentik__cost__v202308__list_cost_provider_summaries_request__pack
                     (const Kentik__Cost__V202308__ListCostProviderSummariesRequest   *message,
                      uint8_t             *out);
size_t kentik__cost__v202308__list_cost_provider_summaries_request__pack_to_buffer
                     (const Kentik__Cost__V202308__ListCostProviderSummariesRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Cost__V202308__ListCostProviderSummariesRequest *
       kentik__cost__v202308__list_cost_provider_summaries_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__cost__v202308__list_cost_provider_summaries_request__free_unpacked
                     (Kentik__Cost__V202308__ListCostProviderSummariesRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Cost__V202308__ListCostProviderSummariesResponse methods */
void   kentik__cost__v202308__list_cost_provider_summaries_response__init
                     (Kentik__Cost__V202308__ListCostProviderSummariesResponse         *message);
size_t kentik__cost__v202308__list_cost_provider_summaries_response__get_packed_size
                     (const Kentik__Cost__V202308__ListCostProviderSummariesResponse   *message);
size_t kentik__cost__v202308__list_cost_provider_summaries_response__pack
                     (const Kentik__Cost__V202308__ListCostProviderSummariesResponse   *message,
                      uint8_t             *out);
size_t kentik__cost__v202308__list_cost_provider_summaries_response__pack_to_buffer
                     (const Kentik__Cost__V202308__ListCostProviderSummariesResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Cost__V202308__ListCostProviderSummariesResponse *
       kentik__cost__v202308__list_cost_provider_summaries_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__cost__v202308__list_cost_provider_summaries_response__free_unpacked
                     (Kentik__Cost__V202308__ListCostProviderSummariesResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Cost__V202308__GetCostProviderSummaryRequest methods */
void   kentik__cost__v202308__get_cost_provider_summary_request__init
                     (Kentik__Cost__V202308__GetCostProviderSummaryRequest         *message);
size_t kentik__cost__v202308__get_cost_provider_summary_request__get_packed_size
                     (const Kentik__Cost__V202308__GetCostProviderSummaryRequest   *message);
size_t kentik__cost__v202308__get_cost_provider_summary_request__pack
                     (const Kentik__Cost__V202308__GetCostProviderSummaryRequest   *message,
                      uint8_t             *out);
size_t kentik__cost__v202308__get_cost_provider_summary_request__pack_to_buffer
                     (const Kentik__Cost__V202308__GetCostProviderSummaryRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Cost__V202308__GetCostProviderSummaryRequest *
       kentik__cost__v202308__get_cost_provider_summary_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__cost__v202308__get_cost_provider_summary_request__free_unpacked
                     (Kentik__Cost__V202308__GetCostProviderSummaryRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Cost__V202308__GetCostProviderSummaryResponse methods */
void   kentik__cost__v202308__get_cost_provider_summary_response__init
                     (Kentik__Cost__V202308__GetCostProviderSummaryResponse         *message);
size_t kentik__cost__v202308__get_cost_provider_summary_response__get_packed_size
                     (const Kentik__Cost__V202308__GetCostProviderSummaryResponse   *message);
size_t kentik__cost__v202308__get_cost_provider_summary_response__pack
                     (const Kentik__Cost__V202308__GetCostProviderSummaryResponse   *message,
                      uint8_t             *out);
size_t kentik__cost__v202308__get_cost_provider_summary_response__pack_to_buffer
                     (const Kentik__Cost__V202308__GetCostProviderSummaryResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Cost__V202308__GetCostProviderSummaryResponse *
       kentik__cost__v202308__get_cost_provider_summary_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__cost__v202308__get_cost_provider_summary_response__free_unpacked
                     (Kentik__Cost__V202308__GetCostProviderSummaryResponse *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Kentik__Cost__V202308__CostProviderSummary_Closure)
                 (const Kentik__Cost__V202308__CostProviderSummary *message,
                  void *closure_data);
typedef void (*Kentik__Cost__V202308__CostProviderConcise_Closure)
                 (const Kentik__Cost__V202308__CostProviderConcise *message,
                  void *closure_data);
typedef void (*Kentik__Cost__V202308__ListCostProvidersRequest_Closure)
                 (const Kentik__Cost__V202308__ListCostProvidersRequest *message,
                  void *closure_data);
typedef void (*Kentik__Cost__V202308__ListCostProvidersResponse_Closure)
                 (const Kentik__Cost__V202308__ListCostProvidersResponse *message,
                  void *closure_data);
typedef void (*Kentik__Cost__V202308__ListCostProviderSummariesRequest_Closure)
                 (const Kentik__Cost__V202308__ListCostProviderSummariesRequest *message,
                  void *closure_data);
typedef void (*Kentik__Cost__V202308__ListCostProviderSummariesResponse_Closure)
                 (const Kentik__Cost__V202308__ListCostProviderSummariesResponse *message,
                  void *closure_data);
typedef void (*Kentik__Cost__V202308__GetCostProviderSummaryRequest_Closure)
                 (const Kentik__Cost__V202308__GetCostProviderSummaryRequest *message,
                  void *closure_data);
typedef void (*Kentik__Cost__V202308__GetCostProviderSummaryResponse_Closure)
                 (const Kentik__Cost__V202308__GetCostProviderSummaryResponse *message,
                  void *closure_data);

/* --- services --- */

typedef struct Kentik__Cost__V202308__CostService_Service Kentik__Cost__V202308__CostService_Service;
struct Kentik__Cost__V202308__CostService_Service
{
  ProtobufCService base;
  void (*list_cost_providers)(Kentik__Cost__V202308__CostService_Service *service,
                              const Kentik__Cost__V202308__ListCostProvidersRequest *input,
                              Kentik__Cost__V202308__ListCostProvidersResponse_Closure closure,
                              void *closure_data);
  void (*list_cost_provider_summaries)(Kentik__Cost__V202308__CostService_Service *service,
                                       const Kentik__Cost__V202308__ListCostProviderSummariesRequest *input,
                                       Kentik__Cost__V202308__ListCostProviderSummariesResponse_Closure closure,
                                       void *closure_data);
  void (*get_cost_provider_summary)(Kentik__Cost__V202308__CostService_Service *service,
                                    const Kentik__Cost__V202308__GetCostProviderSummaryRequest *input,
                                    Kentik__Cost__V202308__GetCostProviderSummaryResponse_Closure closure,
                                    void *closure_data);
};
typedef void (*Kentik__Cost__V202308__CostService_ServiceDestroy)(Kentik__Cost__V202308__CostService_Service *);
void kentik__cost__v202308__cost_service__init (Kentik__Cost__V202308__CostService_Service *service,
                                                Kentik__Cost__V202308__CostService_ServiceDestroy destroy);
#define KENTIK__COST__V202308__COST_SERVICE__BASE_INIT \
    { &kentik__cost__v202308__cost_service__descriptor, protobuf_c_service_invoke_internal, NULL }
#define KENTIK__COST__V202308__COST_SERVICE__INIT(function_prefix__) \
    { KENTIK__COST__V202308__COST_SERVICE__BASE_INIT,\
      function_prefix__ ## list_cost_providers,\
      function_prefix__ ## list_cost_provider_summaries,\
      function_prefix__ ## get_cost_provider_summary  }
void kentik__cost__v202308__cost_service__list_cost_providers(ProtobufCService *service,
                                                              const Kentik__Cost__V202308__ListCostProvidersRequest *input,
                                                              Kentik__Cost__V202308__ListCostProvidersResponse_Closure closure,
                                                              void *closure_data);
void kentik__cost__v202308__cost_service__list_cost_provider_summaries(ProtobufCService *service,
                                                                       const Kentik__Cost__V202308__ListCostProviderSummariesRequest *input,
                                                                       Kentik__Cost__V202308__ListCostProviderSummariesResponse_Closure closure,
                                                                       void *closure_data);
void kentik__cost__v202308__cost_service__get_cost_provider_summary(ProtobufCService *service,
                                                                    const Kentik__Cost__V202308__GetCostProviderSummaryRequest *input,
                                                                    Kentik__Cost__V202308__GetCostProviderSummaryResponse_Closure closure,
                                                                    void *closure_data);

/* --- descriptors --- */

extern const ProtobufCEnumDescriptor    kentik__cost__v202308__status__descriptor;
extern const ProtobufCMessageDescriptor kentik__cost__v202308__cost_provider_summary__descriptor;
extern const ProtobufCMessageDescriptor kentik__cost__v202308__cost_provider_concise__descriptor;
extern const ProtobufCMessageDescriptor kentik__cost__v202308__list_cost_providers_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__cost__v202308__list_cost_providers_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__cost__v202308__list_cost_provider_summaries_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__cost__v202308__list_cost_provider_summaries_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__cost__v202308__get_cost_provider_summary_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__cost__v202308__get_cost_provider_summary_response__descriptor;
extern const ProtobufCServiceDescriptor kentik__cost__v202308__cost_service__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_kentik_2fcost_2fv202308_2fcost_2eproto__INCLUDED */
