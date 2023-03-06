/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/site/v202106alpha1/site.proto */

#ifndef PROTOBUF_C_kentik_2fsite_2fv202106alpha1_2fsite_2eproto__INCLUDED
#define PROTOBUF_C_kentik_2fsite_2fv202106alpha1_2fsite_2eproto__INCLUDED

#include <protobuf-c/protobuf-c.h>

PROTOBUF_C__BEGIN_DECLS

#if PROTOBUF_C_VERSION_NUMBER < 1003000
# error This file was generated by a newer version of protoc-c which is incompatible with your libprotobuf-c headers. Please update your headers.
#elif 1003003 < PROTOBUF_C_MIN_COMPILER_VERSION
# error This file was generated by an older version of protoc-c which is incompatible with your libprotobuf-c headers. Please regenerate this file with a newer version of protoc-c.
#endif

#include "google/api/annotations.pb-c.h"
#include "google/api/client.pb-c.h"
#include "google/type/latlng.pb-c.h"
#include "google/type/postal_address.pb-c.h"
#include "protoc-gen-openapiv2/options/annotations.pb-c.h"
#include "kentik/core/v202303/annotations.pb-c.h"

typedef struct _Kentik__Site__V202106alpha1__SiteIpClassification Kentik__Site__V202106alpha1__SiteIpClassification;
typedef struct _Kentik__Site__V202106alpha1__SubLayer Kentik__Site__V202106alpha1__SubLayer;
typedef struct _Kentik__Site__V202106alpha1__Layer Kentik__Site__V202106alpha1__Layer;
typedef struct _Kentik__Site__V202106alpha1__Site Kentik__Site__V202106alpha1__Site;
typedef struct _Kentik__Site__V202106alpha1__ListSiteRequest Kentik__Site__V202106alpha1__ListSiteRequest;
typedef struct _Kentik__Site__V202106alpha1__ListSiteResponse Kentik__Site__V202106alpha1__ListSiteResponse;
typedef struct _Kentik__Site__V202106alpha1__GetSiteRequest Kentik__Site__V202106alpha1__GetSiteRequest;
typedef struct _Kentik__Site__V202106alpha1__GetSiteResponse Kentik__Site__V202106alpha1__GetSiteResponse;
typedef struct _Kentik__Site__V202106alpha1__CreateSiteRequest Kentik__Site__V202106alpha1__CreateSiteRequest;
typedef struct _Kentik__Site__V202106alpha1__CreateSiteResponse Kentik__Site__V202106alpha1__CreateSiteResponse;
typedef struct _Kentik__Site__V202106alpha1__UpdateSiteRequest Kentik__Site__V202106alpha1__UpdateSiteRequest;
typedef struct _Kentik__Site__V202106alpha1__UpdateSiteResponse Kentik__Site__V202106alpha1__UpdateSiteResponse;
typedef struct _Kentik__Site__V202106alpha1__DeleteSiteRequest Kentik__Site__V202106alpha1__DeleteSiteRequest;
typedef struct _Kentik__Site__V202106alpha1__DeleteSiteResponse Kentik__Site__V202106alpha1__DeleteSiteResponse;


/* --- enums --- */

typedef enum _Kentik__Site__V202106alpha1__SiteType {
  KENTIK__SITE__V202106ALPHA1__SITE_TYPE__SITE_TYPE_UNSPECIFIED = 0,
  KENTIK__SITE__V202106ALPHA1__SITE_TYPE__SITE_TYPE_DATA_CENTER = 1,
  KENTIK__SITE__V202106ALPHA1__SITE_TYPE__SITE_TYPE_CLOUD = 2,
  KENTIK__SITE__V202106ALPHA1__SITE_TYPE__SITE_TYPE_BRANCH = 3,
  KENTIK__SITE__V202106ALPHA1__SITE_TYPE__SITE_TYPE_CONNECTIVITY = 4,
  KENTIK__SITE__V202106ALPHA1__SITE_TYPE__SITE_TYPE_CUSTOMER = 5,
  KENTIK__SITE__V202106ALPHA1__SITE_TYPE__SITE_TYPE_OTHER = 6
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__SITE__V202106ALPHA1__SITE_TYPE)
} Kentik__Site__V202106alpha1__SiteType;

/* --- messages --- */

/*
 * Site IP Classification
 */
struct  _Kentik__Site__V202106alpha1__SiteIpClassification
{
  ProtobufCMessage base;
  size_t n_infrastructure_networks;
  char **infrastructure_networks;
  size_t n_user_access_networks;
  char **user_access_networks;
  size_t n_other_ips;
  char **other_ips;
};
#define KENTIK__SITE__V202106ALPHA1__SITE_IP_CLASSIFICATION__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__site_ip_classification__descriptor) \
    , 0,NULL, 0,NULL, 0,NULL }


struct  _Kentik__Site__V202106alpha1__SubLayer
{
  ProtobufCMessage base;
  char *name;
  size_t n_device_ids;
  char **device_ids;
};
#define KENTIK__SITE__V202106ALPHA1__SUB_LAYER__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__sub_layer__descriptor) \
    , (char *)protobuf_c_empty_string, 0,NULL }


struct  _Kentik__Site__V202106alpha1__Layer
{
  ProtobufCMessage base;
  size_t n_sub_layers;
  Kentik__Site__V202106alpha1__SubLayer **sub_layers;
};
#define KENTIK__SITE__V202106ALPHA1__LAYER__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__layer__descriptor) \
    , 0,NULL }


struct  _Kentik__Site__V202106alpha1__Site
{
  ProtobufCMessage base;
  char *id;
  char *title;
  Google__Type__LatLng *coordinate;
  Google__Type__PostalAddress *address;
  Kentik__Site__V202106alpha1__SiteType type;
  Kentik__Site__V202106alpha1__SiteIpClassification *classification;
  size_t n_architecture;
  Kentik__Site__V202106alpha1__Layer **architecture;
};
#define KENTIK__SITE__V202106ALPHA1__SITE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__site__descriptor) \
    , (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, NULL, NULL, KENTIK__SITE__V202106ALPHA1__SITE_TYPE__SITE_TYPE_UNSPECIFIED, NULL, 0,NULL }


struct  _Kentik__Site__V202106alpha1__ListSiteRequest
{
  ProtobufCMessage base;
};
#define KENTIK__SITE__V202106ALPHA1__LIST_SITE_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__list_site_request__descriptor) \
     }


struct  _Kentik__Site__V202106alpha1__ListSiteResponse
{
  ProtobufCMessage base;
  size_t n_sites;
  Kentik__Site__V202106alpha1__Site **sites;
  uint32_t invalid_count;
};
#define KENTIK__SITE__V202106ALPHA1__LIST_SITE_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__list_site_response__descriptor) \
    , 0,NULL, 0 }


struct  _Kentik__Site__V202106alpha1__GetSiteRequest
{
  ProtobufCMessage base;
  char *id;
};
#define KENTIK__SITE__V202106ALPHA1__GET_SITE_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__get_site_request__descriptor) \
    , (char *)protobuf_c_empty_string }


struct  _Kentik__Site__V202106alpha1__GetSiteResponse
{
  ProtobufCMessage base;
  Kentik__Site__V202106alpha1__Site *site;
};
#define KENTIK__SITE__V202106ALPHA1__GET_SITE_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__get_site_response__descriptor) \
    , NULL }


struct  _Kentik__Site__V202106alpha1__CreateSiteRequest
{
  ProtobufCMessage base;
  Kentik__Site__V202106alpha1__Site *site;
};
#define KENTIK__SITE__V202106ALPHA1__CREATE_SITE_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__create_site_request__descriptor) \
    , NULL }


struct  _Kentik__Site__V202106alpha1__CreateSiteResponse
{
  ProtobufCMessage base;
  Kentik__Site__V202106alpha1__Site *site;
};
#define KENTIK__SITE__V202106ALPHA1__CREATE_SITE_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__create_site_response__descriptor) \
    , NULL }


struct  _Kentik__Site__V202106alpha1__UpdateSiteRequest
{
  ProtobufCMessage base;
  Kentik__Site__V202106alpha1__Site *site;
};
#define KENTIK__SITE__V202106ALPHA1__UPDATE_SITE_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__update_site_request__descriptor) \
    , NULL }


struct  _Kentik__Site__V202106alpha1__UpdateSiteResponse
{
  ProtobufCMessage base;
  Kentik__Site__V202106alpha1__Site *site;
};
#define KENTIK__SITE__V202106ALPHA1__UPDATE_SITE_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__update_site_response__descriptor) \
    , NULL }


struct  _Kentik__Site__V202106alpha1__DeleteSiteRequest
{
  ProtobufCMessage base;
  char *id;
};
#define KENTIK__SITE__V202106ALPHA1__DELETE_SITE_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__delete_site_request__descriptor) \
    , (char *)protobuf_c_empty_string }


struct  _Kentik__Site__V202106alpha1__DeleteSiteResponse
{
  ProtobufCMessage base;
};
#define KENTIK__SITE__V202106ALPHA1__DELETE_SITE_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__site__v202106alpha1__delete_site_response__descriptor) \
     }


/* Kentik__Site__V202106alpha1__SiteIpClassification methods */
void   kentik__site__v202106alpha1__site_ip_classification__init
                     (Kentik__Site__V202106alpha1__SiteIpClassification         *message);
size_t kentik__site__v202106alpha1__site_ip_classification__get_packed_size
                     (const Kentik__Site__V202106alpha1__SiteIpClassification   *message);
size_t kentik__site__v202106alpha1__site_ip_classification__pack
                     (const Kentik__Site__V202106alpha1__SiteIpClassification   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__site_ip_classification__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__SiteIpClassification   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__SiteIpClassification *
       kentik__site__v202106alpha1__site_ip_classification__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__site_ip_classification__free_unpacked
                     (Kentik__Site__V202106alpha1__SiteIpClassification *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Site__V202106alpha1__SubLayer methods */
void   kentik__site__v202106alpha1__sub_layer__init
                     (Kentik__Site__V202106alpha1__SubLayer         *message);
size_t kentik__site__v202106alpha1__sub_layer__get_packed_size
                     (const Kentik__Site__V202106alpha1__SubLayer   *message);
size_t kentik__site__v202106alpha1__sub_layer__pack
                     (const Kentik__Site__V202106alpha1__SubLayer   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__sub_layer__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__SubLayer   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__SubLayer *
       kentik__site__v202106alpha1__sub_layer__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__sub_layer__free_unpacked
                     (Kentik__Site__V202106alpha1__SubLayer *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Site__V202106alpha1__Layer methods */
void   kentik__site__v202106alpha1__layer__init
                     (Kentik__Site__V202106alpha1__Layer         *message);
size_t kentik__site__v202106alpha1__layer__get_packed_size
                     (const Kentik__Site__V202106alpha1__Layer   *message);
size_t kentik__site__v202106alpha1__layer__pack
                     (const Kentik__Site__V202106alpha1__Layer   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__layer__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__Layer   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__Layer *
       kentik__site__v202106alpha1__layer__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__layer__free_unpacked
                     (Kentik__Site__V202106alpha1__Layer *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Site__V202106alpha1__Site methods */
void   kentik__site__v202106alpha1__site__init
                     (Kentik__Site__V202106alpha1__Site         *message);
size_t kentik__site__v202106alpha1__site__get_packed_size
                     (const Kentik__Site__V202106alpha1__Site   *message);
size_t kentik__site__v202106alpha1__site__pack
                     (const Kentik__Site__V202106alpha1__Site   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__site__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__Site   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__Site *
       kentik__site__v202106alpha1__site__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__site__free_unpacked
                     (Kentik__Site__V202106alpha1__Site *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Site__V202106alpha1__ListSiteRequest methods */
void   kentik__site__v202106alpha1__list_site_request__init
                     (Kentik__Site__V202106alpha1__ListSiteRequest         *message);
size_t kentik__site__v202106alpha1__list_site_request__get_packed_size
                     (const Kentik__Site__V202106alpha1__ListSiteRequest   *message);
size_t kentik__site__v202106alpha1__list_site_request__pack
                     (const Kentik__Site__V202106alpha1__ListSiteRequest   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__list_site_request__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__ListSiteRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__ListSiteRequest *
       kentik__site__v202106alpha1__list_site_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__list_site_request__free_unpacked
                     (Kentik__Site__V202106alpha1__ListSiteRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Site__V202106alpha1__ListSiteResponse methods */
void   kentik__site__v202106alpha1__list_site_response__init
                     (Kentik__Site__V202106alpha1__ListSiteResponse         *message);
size_t kentik__site__v202106alpha1__list_site_response__get_packed_size
                     (const Kentik__Site__V202106alpha1__ListSiteResponse   *message);
size_t kentik__site__v202106alpha1__list_site_response__pack
                     (const Kentik__Site__V202106alpha1__ListSiteResponse   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__list_site_response__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__ListSiteResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__ListSiteResponse *
       kentik__site__v202106alpha1__list_site_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__list_site_response__free_unpacked
                     (Kentik__Site__V202106alpha1__ListSiteResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Site__V202106alpha1__GetSiteRequest methods */
void   kentik__site__v202106alpha1__get_site_request__init
                     (Kentik__Site__V202106alpha1__GetSiteRequest         *message);
size_t kentik__site__v202106alpha1__get_site_request__get_packed_size
                     (const Kentik__Site__V202106alpha1__GetSiteRequest   *message);
size_t kentik__site__v202106alpha1__get_site_request__pack
                     (const Kentik__Site__V202106alpha1__GetSiteRequest   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__get_site_request__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__GetSiteRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__GetSiteRequest *
       kentik__site__v202106alpha1__get_site_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__get_site_request__free_unpacked
                     (Kentik__Site__V202106alpha1__GetSiteRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Site__V202106alpha1__GetSiteResponse methods */
void   kentik__site__v202106alpha1__get_site_response__init
                     (Kentik__Site__V202106alpha1__GetSiteResponse         *message);
size_t kentik__site__v202106alpha1__get_site_response__get_packed_size
                     (const Kentik__Site__V202106alpha1__GetSiteResponse   *message);
size_t kentik__site__v202106alpha1__get_site_response__pack
                     (const Kentik__Site__V202106alpha1__GetSiteResponse   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__get_site_response__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__GetSiteResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__GetSiteResponse *
       kentik__site__v202106alpha1__get_site_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__get_site_response__free_unpacked
                     (Kentik__Site__V202106alpha1__GetSiteResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Site__V202106alpha1__CreateSiteRequest methods */
void   kentik__site__v202106alpha1__create_site_request__init
                     (Kentik__Site__V202106alpha1__CreateSiteRequest         *message);
size_t kentik__site__v202106alpha1__create_site_request__get_packed_size
                     (const Kentik__Site__V202106alpha1__CreateSiteRequest   *message);
size_t kentik__site__v202106alpha1__create_site_request__pack
                     (const Kentik__Site__V202106alpha1__CreateSiteRequest   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__create_site_request__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__CreateSiteRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__CreateSiteRequest *
       kentik__site__v202106alpha1__create_site_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__create_site_request__free_unpacked
                     (Kentik__Site__V202106alpha1__CreateSiteRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Site__V202106alpha1__CreateSiteResponse methods */
void   kentik__site__v202106alpha1__create_site_response__init
                     (Kentik__Site__V202106alpha1__CreateSiteResponse         *message);
size_t kentik__site__v202106alpha1__create_site_response__get_packed_size
                     (const Kentik__Site__V202106alpha1__CreateSiteResponse   *message);
size_t kentik__site__v202106alpha1__create_site_response__pack
                     (const Kentik__Site__V202106alpha1__CreateSiteResponse   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__create_site_response__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__CreateSiteResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__CreateSiteResponse *
       kentik__site__v202106alpha1__create_site_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__create_site_response__free_unpacked
                     (Kentik__Site__V202106alpha1__CreateSiteResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Site__V202106alpha1__UpdateSiteRequest methods */
void   kentik__site__v202106alpha1__update_site_request__init
                     (Kentik__Site__V202106alpha1__UpdateSiteRequest         *message);
size_t kentik__site__v202106alpha1__update_site_request__get_packed_size
                     (const Kentik__Site__V202106alpha1__UpdateSiteRequest   *message);
size_t kentik__site__v202106alpha1__update_site_request__pack
                     (const Kentik__Site__V202106alpha1__UpdateSiteRequest   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__update_site_request__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__UpdateSiteRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__UpdateSiteRequest *
       kentik__site__v202106alpha1__update_site_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__update_site_request__free_unpacked
                     (Kentik__Site__V202106alpha1__UpdateSiteRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Site__V202106alpha1__UpdateSiteResponse methods */
void   kentik__site__v202106alpha1__update_site_response__init
                     (Kentik__Site__V202106alpha1__UpdateSiteResponse         *message);
size_t kentik__site__v202106alpha1__update_site_response__get_packed_size
                     (const Kentik__Site__V202106alpha1__UpdateSiteResponse   *message);
size_t kentik__site__v202106alpha1__update_site_response__pack
                     (const Kentik__Site__V202106alpha1__UpdateSiteResponse   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__update_site_response__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__UpdateSiteResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__UpdateSiteResponse *
       kentik__site__v202106alpha1__update_site_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__update_site_response__free_unpacked
                     (Kentik__Site__V202106alpha1__UpdateSiteResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Site__V202106alpha1__DeleteSiteRequest methods */
void   kentik__site__v202106alpha1__delete_site_request__init
                     (Kentik__Site__V202106alpha1__DeleteSiteRequest         *message);
size_t kentik__site__v202106alpha1__delete_site_request__get_packed_size
                     (const Kentik__Site__V202106alpha1__DeleteSiteRequest   *message);
size_t kentik__site__v202106alpha1__delete_site_request__pack
                     (const Kentik__Site__V202106alpha1__DeleteSiteRequest   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__delete_site_request__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__DeleteSiteRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__DeleteSiteRequest *
       kentik__site__v202106alpha1__delete_site_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__delete_site_request__free_unpacked
                     (Kentik__Site__V202106alpha1__DeleteSiteRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Site__V202106alpha1__DeleteSiteResponse methods */
void   kentik__site__v202106alpha1__delete_site_response__init
                     (Kentik__Site__V202106alpha1__DeleteSiteResponse         *message);
size_t kentik__site__v202106alpha1__delete_site_response__get_packed_size
                     (const Kentik__Site__V202106alpha1__DeleteSiteResponse   *message);
size_t kentik__site__v202106alpha1__delete_site_response__pack
                     (const Kentik__Site__V202106alpha1__DeleteSiteResponse   *message,
                      uint8_t             *out);
size_t kentik__site__v202106alpha1__delete_site_response__pack_to_buffer
                     (const Kentik__Site__V202106alpha1__DeleteSiteResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Site__V202106alpha1__DeleteSiteResponse *
       kentik__site__v202106alpha1__delete_site_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__site__v202106alpha1__delete_site_response__free_unpacked
                     (Kentik__Site__V202106alpha1__DeleteSiteResponse *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Kentik__Site__V202106alpha1__SiteIpClassification_Closure)
                 (const Kentik__Site__V202106alpha1__SiteIpClassification *message,
                  void *closure_data);
typedef void (*Kentik__Site__V202106alpha1__SubLayer_Closure)
                 (const Kentik__Site__V202106alpha1__SubLayer *message,
                  void *closure_data);
typedef void (*Kentik__Site__V202106alpha1__Layer_Closure)
                 (const Kentik__Site__V202106alpha1__Layer *message,
                  void *closure_data);
typedef void (*Kentik__Site__V202106alpha1__Site_Closure)
                 (const Kentik__Site__V202106alpha1__Site *message,
                  void *closure_data);
typedef void (*Kentik__Site__V202106alpha1__ListSiteRequest_Closure)
                 (const Kentik__Site__V202106alpha1__ListSiteRequest *message,
                  void *closure_data);
typedef void (*Kentik__Site__V202106alpha1__ListSiteResponse_Closure)
                 (const Kentik__Site__V202106alpha1__ListSiteResponse *message,
                  void *closure_data);
typedef void (*Kentik__Site__V202106alpha1__GetSiteRequest_Closure)
                 (const Kentik__Site__V202106alpha1__GetSiteRequest *message,
                  void *closure_data);
typedef void (*Kentik__Site__V202106alpha1__GetSiteResponse_Closure)
                 (const Kentik__Site__V202106alpha1__GetSiteResponse *message,
                  void *closure_data);
typedef void (*Kentik__Site__V202106alpha1__CreateSiteRequest_Closure)
                 (const Kentik__Site__V202106alpha1__CreateSiteRequest *message,
                  void *closure_data);
typedef void (*Kentik__Site__V202106alpha1__CreateSiteResponse_Closure)
                 (const Kentik__Site__V202106alpha1__CreateSiteResponse *message,
                  void *closure_data);
typedef void (*Kentik__Site__V202106alpha1__UpdateSiteRequest_Closure)
                 (const Kentik__Site__V202106alpha1__UpdateSiteRequest *message,
                  void *closure_data);
typedef void (*Kentik__Site__V202106alpha1__UpdateSiteResponse_Closure)
                 (const Kentik__Site__V202106alpha1__UpdateSiteResponse *message,
                  void *closure_data);
typedef void (*Kentik__Site__V202106alpha1__DeleteSiteRequest_Closure)
                 (const Kentik__Site__V202106alpha1__DeleteSiteRequest *message,
                  void *closure_data);
typedef void (*Kentik__Site__V202106alpha1__DeleteSiteResponse_Closure)
                 (const Kentik__Site__V202106alpha1__DeleteSiteResponse *message,
                  void *closure_data);

/* --- services --- */

typedef struct _Kentik__Site__V202106alpha1__SiteService_Service Kentik__Site__V202106alpha1__SiteService_Service;
struct _Kentik__Site__V202106alpha1__SiteService_Service
{
  ProtobufCService base;
  void (*list_site)(Kentik__Site__V202106alpha1__SiteService_Service *service,
                    const Kentik__Site__V202106alpha1__ListSiteRequest *input,
                    Kentik__Site__V202106alpha1__ListSiteResponse_Closure closure,
                    void *closure_data);
  void (*get_site)(Kentik__Site__V202106alpha1__SiteService_Service *service,
                   const Kentik__Site__V202106alpha1__GetSiteRequest *input,
                   Kentik__Site__V202106alpha1__GetSiteResponse_Closure closure,
                   void *closure_data);
  void (*create_site)(Kentik__Site__V202106alpha1__SiteService_Service *service,
                      const Kentik__Site__V202106alpha1__CreateSiteRequest *input,
                      Kentik__Site__V202106alpha1__CreateSiteResponse_Closure closure,
                      void *closure_data);
  void (*update_site)(Kentik__Site__V202106alpha1__SiteService_Service *service,
                      const Kentik__Site__V202106alpha1__UpdateSiteRequest *input,
                      Kentik__Site__V202106alpha1__UpdateSiteResponse_Closure closure,
                      void *closure_data);
  void (*delete_site)(Kentik__Site__V202106alpha1__SiteService_Service *service,
                      const Kentik__Site__V202106alpha1__DeleteSiteRequest *input,
                      Kentik__Site__V202106alpha1__DeleteSiteResponse_Closure closure,
                      void *closure_data);
};
typedef void (*Kentik__Site__V202106alpha1__SiteService_ServiceDestroy)(Kentik__Site__V202106alpha1__SiteService_Service *);
void kentik__site__v202106alpha1__site_service__init (Kentik__Site__V202106alpha1__SiteService_Service *service,
                                                      Kentik__Site__V202106alpha1__SiteService_ServiceDestroy destroy);
#define KENTIK__SITE__V202106ALPHA1__SITE_SERVICE__BASE_INIT \
    { &kentik__site__v202106alpha1__site_service__descriptor, protobuf_c_service_invoke_internal, NULL }
#define KENTIK__SITE__V202106ALPHA1__SITE_SERVICE__INIT(function_prefix__) \
    { KENTIK__SITE__V202106ALPHA1__SITE_SERVICE__BASE_INIT,\
      function_prefix__ ## list_site,\
      function_prefix__ ## get_site,\
      function_prefix__ ## create_site,\
      function_prefix__ ## update_site,\
      function_prefix__ ## delete_site  }
void kentik__site__v202106alpha1__site_service__list_site(ProtobufCService *service,
                                                          const Kentik__Site__V202106alpha1__ListSiteRequest *input,
                                                          Kentik__Site__V202106alpha1__ListSiteResponse_Closure closure,
                                                          void *closure_data);
void kentik__site__v202106alpha1__site_service__get_site(ProtobufCService *service,
                                                         const Kentik__Site__V202106alpha1__GetSiteRequest *input,
                                                         Kentik__Site__V202106alpha1__GetSiteResponse_Closure closure,
                                                         void *closure_data);
void kentik__site__v202106alpha1__site_service__create_site(ProtobufCService *service,
                                                            const Kentik__Site__V202106alpha1__CreateSiteRequest *input,
                                                            Kentik__Site__V202106alpha1__CreateSiteResponse_Closure closure,
                                                            void *closure_data);
void kentik__site__v202106alpha1__site_service__update_site(ProtobufCService *service,
                                                            const Kentik__Site__V202106alpha1__UpdateSiteRequest *input,
                                                            Kentik__Site__V202106alpha1__UpdateSiteResponse_Closure closure,
                                                            void *closure_data);
void kentik__site__v202106alpha1__site_service__delete_site(ProtobufCService *service,
                                                            const Kentik__Site__V202106alpha1__DeleteSiteRequest *input,
                                                            Kentik__Site__V202106alpha1__DeleteSiteResponse_Closure closure,
                                                            void *closure_data);

/* --- descriptors --- */

extern const ProtobufCEnumDescriptor    kentik__site__v202106alpha1__site_type__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__site_ip_classification__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__sub_layer__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__layer__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__site__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__list_site_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__list_site_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__get_site_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__get_site_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__create_site_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__create_site_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__update_site_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__update_site_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__delete_site_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__site__v202106alpha1__delete_site_response__descriptor;
extern const ProtobufCServiceDescriptor kentik__site__v202106alpha1__site_service__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_kentik_2fsite_2fv202106alpha1_2fsite_2eproto__INCLUDED */
