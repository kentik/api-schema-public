/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/plan/v202501alpha1/plan.proto */

#ifndef PROTOBUF_C_kentik_2fplan_2fv202501alpha1_2fplan_2eproto__INCLUDED
#define PROTOBUF_C_kentik_2fplan_2fv202501alpha1_2fplan_2eproto__INCLUDED

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
#include "kentik/core/v202303/annotations.pb-c.h"
#include "kentik/plan/v202501alpha1/plan_message.pb-c.h"

typedef struct Kentik__Plan__V202501alpha1__ListPlansRequest Kentik__Plan__V202501alpha1__ListPlansRequest;
typedef struct Kentik__Plan__V202501alpha1__ListPlansResponse Kentik__Plan__V202501alpha1__ListPlansResponse;


/* --- enums --- */


/* --- messages --- */

struct  Kentik__Plan__V202501alpha1__ListPlansRequest
{
  ProtobufCMessage base;
};
#define KENTIK__PLAN__V202501ALPHA1__LIST_PLANS_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__plan__v202501alpha1__list_plans_request__descriptor) \
     }


struct  Kentik__Plan__V202501alpha1__ListPlansResponse
{
  ProtobufCMessage base;
  size_t n_plans;
  Kentik__Plan__V202501alpha1__Plan **plans;
};
#define KENTIK__PLAN__V202501ALPHA1__LIST_PLANS_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__plan__v202501alpha1__list_plans_response__descriptor) \
    , 0,NULL }


/* Kentik__Plan__V202501alpha1__ListPlansRequest methods */
void   kentik__plan__v202501alpha1__list_plans_request__init
                     (Kentik__Plan__V202501alpha1__ListPlansRequest         *message);
size_t kentik__plan__v202501alpha1__list_plans_request__get_packed_size
                     (const Kentik__Plan__V202501alpha1__ListPlansRequest   *message);
size_t kentik__plan__v202501alpha1__list_plans_request__pack
                     (const Kentik__Plan__V202501alpha1__ListPlansRequest   *message,
                      uint8_t             *out);
size_t kentik__plan__v202501alpha1__list_plans_request__pack_to_buffer
                     (const Kentik__Plan__V202501alpha1__ListPlansRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Plan__V202501alpha1__ListPlansRequest *
       kentik__plan__v202501alpha1__list_plans_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__plan__v202501alpha1__list_plans_request__free_unpacked
                     (Kentik__Plan__V202501alpha1__ListPlansRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Plan__V202501alpha1__ListPlansResponse methods */
void   kentik__plan__v202501alpha1__list_plans_response__init
                     (Kentik__Plan__V202501alpha1__ListPlansResponse         *message);
size_t kentik__plan__v202501alpha1__list_plans_response__get_packed_size
                     (const Kentik__Plan__V202501alpha1__ListPlansResponse   *message);
size_t kentik__plan__v202501alpha1__list_plans_response__pack
                     (const Kentik__Plan__V202501alpha1__ListPlansResponse   *message,
                      uint8_t             *out);
size_t kentik__plan__v202501alpha1__list_plans_response__pack_to_buffer
                     (const Kentik__Plan__V202501alpha1__ListPlansResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Plan__V202501alpha1__ListPlansResponse *
       kentik__plan__v202501alpha1__list_plans_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__plan__v202501alpha1__list_plans_response__free_unpacked
                     (Kentik__Plan__V202501alpha1__ListPlansResponse *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Kentik__Plan__V202501alpha1__ListPlansRequest_Closure)
                 (const Kentik__Plan__V202501alpha1__ListPlansRequest *message,
                  void *closure_data);
typedef void (*Kentik__Plan__V202501alpha1__ListPlansResponse_Closure)
                 (const Kentik__Plan__V202501alpha1__ListPlansResponse *message,
                  void *closure_data);

/* --- services --- */

typedef struct Kentik__Plan__V202501alpha1__PlanService_Service Kentik__Plan__V202501alpha1__PlanService_Service;
struct Kentik__Plan__V202501alpha1__PlanService_Service
{
  ProtobufCService base;
  void (*list_plans)(Kentik__Plan__V202501alpha1__PlanService_Service *service,
                     const Kentik__Plan__V202501alpha1__ListPlansRequest *input,
                     Kentik__Plan__V202501alpha1__ListPlansResponse_Closure closure,
                     void *closure_data);
};
typedef void (*Kentik__Plan__V202501alpha1__PlanService_ServiceDestroy)(Kentik__Plan__V202501alpha1__PlanService_Service *);
void kentik__plan__v202501alpha1__plan_service__init (Kentik__Plan__V202501alpha1__PlanService_Service *service,
                                                      Kentik__Plan__V202501alpha1__PlanService_ServiceDestroy destroy);
#define KENTIK__PLAN__V202501ALPHA1__PLAN_SERVICE__BASE_INIT \
    { &kentik__plan__v202501alpha1__plan_service__descriptor, protobuf_c_service_invoke_internal, NULL }
#define KENTIK__PLAN__V202501ALPHA1__PLAN_SERVICE__INIT(function_prefix__) \
    { KENTIK__PLAN__V202501ALPHA1__PLAN_SERVICE__BASE_INIT,\
      function_prefix__ ## list_plans  }
void kentik__plan__v202501alpha1__plan_service__list_plans(ProtobufCService *service,
                                                           const Kentik__Plan__V202501alpha1__ListPlansRequest *input,
                                                           Kentik__Plan__V202501alpha1__ListPlansResponse_Closure closure,
                                                           void *closure_data);

/* --- descriptors --- */

extern const ProtobufCMessageDescriptor kentik__plan__v202501alpha1__list_plans_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__plan__v202501alpha1__list_plans_response__descriptor;
extern const ProtobufCServiceDescriptor kentik__plan__v202501alpha1__plan_service__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_kentik_2fplan_2fv202501alpha1_2fplan_2eproto__INCLUDED */
