/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/kmi/v202212/kmi.proto */

#ifndef PROTOBUF_C_kentik_2fkmi_2fv202212_2fkmi_2eproto__INCLUDED
#define PROTOBUF_C_kentik_2fkmi_2fv202212_2fkmi_2eproto__INCLUDED

#include <protobuf-c/protobuf-c.h>

PROTOBUF_C__BEGIN_DECLS

#if PROTOBUF_C_VERSION_NUMBER < 1003000
# error This file was generated by a newer version of protoc-c which is incompatible with your libprotobuf-c headers. Please update your headers.
#elif 1003003 < PROTOBUF_C_MIN_COMPILER_VERSION
# error This file was generated by an older version of protoc-c which is incompatible with your libprotobuf-c headers. Please regenerate this file with a newer version of protoc-c.
#endif

#include "google/api/annotations.pb-c.h"
#include "google/api/client.pb-c.h"
#include "google/api/field_behavior.pb-c.h"
#include "protoc-gen-openapiv2/options/annotations.pb-c.h"
#include "kentik/core/v202303/annotations.pb-c.h"

typedef struct _Kentik__Kmi__V202212__Market Kentik__Kmi__V202212__Market;
typedef struct _Kentik__Kmi__V202212__Ranking Kentik__Kmi__V202212__Ranking;
typedef struct _Kentik__Kmi__V202212__CustomerProvider Kentik__Kmi__V202212__CustomerProvider;
typedef struct _Kentik__Kmi__V202212__Peer Kentik__Kmi__V202212__Peer;
typedef struct _Kentik__Kmi__V202212__ASNDetails Kentik__Kmi__V202212__ASNDetails;
typedef struct _Kentik__Kmi__V202212__ListMarketsRequest Kentik__Kmi__V202212__ListMarketsRequest;
typedef struct _Kentik__Kmi__V202212__ListMarketsResponse Kentik__Kmi__V202212__ListMarketsResponse;
typedef struct _Kentik__Kmi__V202212__GetRankingsRequest Kentik__Kmi__V202212__GetRankingsRequest;
typedef struct _Kentik__Kmi__V202212__GetRankingsResponse Kentik__Kmi__V202212__GetRankingsResponse;
typedef struct _Kentik__Kmi__V202212__GetASNDetailsRequest Kentik__Kmi__V202212__GetASNDetailsRequest;
typedef struct _Kentik__Kmi__V202212__GetASNDetailsResponse Kentik__Kmi__V202212__GetASNDetailsResponse;


/* --- enums --- */


/* --- messages --- */

/*
 * {{.Name}}
 */
struct  _Kentik__Kmi__V202212__Market
{
  ProtobufCMessage base;
  char *market_id;
  char *name;
};
#define KENTIK__KMI__V202212__MARKET__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__kmi__v202212__market__descriptor) \
    , (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string }


typedef enum {
  KENTIK__KMI__V202212__RANKING___ASN__NOT_SET = 0,
  KENTIK__KMI__V202212__RANKING___ASN_ASN = 1
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__RANKING___ASN)
} Kentik__Kmi__V202212__Ranking__AsnCase;

typedef enum {
  KENTIK__KMI__V202212__RANKING___RANK__NOT_SET = 0,
  KENTIK__KMI__V202212__RANKING___RANK_RANK = 3
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__RANKING___RANK)
} Kentik__Kmi__V202212__Ranking__RankCase;

typedef enum {
  KENTIK__KMI__V202212__RANKING___RANK_CHANGE__NOT_SET = 0,
  KENTIK__KMI__V202212__RANKING___RANK_CHANGE_RANK_CHANGE = 4
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__RANKING___RANK_CHANGE)
} Kentik__Kmi__V202212__Ranking__RankChangeCase;

typedef enum {
  KENTIK__KMI__V202212__RANKING___SCORE__NOT_SET = 0,
  KENTIK__KMI__V202212__RANKING___SCORE_SCORE = 5
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__RANKING___SCORE)
} Kentik__Kmi__V202212__Ranking__ScoreCase;

typedef enum {
  KENTIK__KMI__V202212__RANKING___SCORE_CHANGE__NOT_SET = 0,
  KENTIK__KMI__V202212__RANKING___SCORE_CHANGE_SCORE_CHANGE = 6
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__RANKING___SCORE_CHANGE)
} Kentik__Kmi__V202212__Ranking__ScoreChangeCase;

/*
 * {{.Name}}
 */
struct  _Kentik__Kmi__V202212__Ranking
{
  ProtobufCMessage base;
  char *name;
  Kentik__Kmi__V202212__Ranking__AsnCase _asn_case;
  union {
    uint32_t asn;
  };
  Kentik__Kmi__V202212__Ranking__RankCase _rank_case;
  union {
    uint32_t rank;
  };
  Kentik__Kmi__V202212__Ranking__RankChangeCase _rank_change_case;
  union {
    uint32_t rank_change;
  };
  Kentik__Kmi__V202212__Ranking__ScoreCase _score_case;
  union {
    uint32_t score;
  };
  Kentik__Kmi__V202212__Ranking__ScoreChangeCase _score_change_case;
  union {
    uint32_t score_change;
  };
};
#define KENTIK__KMI__V202212__RANKING__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__kmi__v202212__ranking__descriptor) \
    , (char *)protobuf_c_empty_string, KENTIK__KMI__V202212__RANKING___ASN__NOT_SET, {0}, KENTIK__KMI__V202212__RANKING___RANK__NOT_SET, {0}, KENTIK__KMI__V202212__RANKING___RANK_CHANGE__NOT_SET, {0}, KENTIK__KMI__V202212__RANKING___SCORE__NOT_SET, {0}, KENTIK__KMI__V202212__RANKING___SCORE_CHANGE__NOT_SET, {0} }


typedef enum {
  KENTIK__KMI__V202212__CUSTOMER_PROVIDER___ASN__NOT_SET = 0,
  KENTIK__KMI__V202212__CUSTOMER_PROVIDER___ASN_ASN = 1
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__CUSTOMER_PROVIDER___ASN)
} Kentik__Kmi__V202212__CustomerProvider__AsnCase;

typedef enum {
  KENTIK__KMI__V202212__CUSTOMER_PROVIDER___SCORE__NOT_SET = 0,
  KENTIK__KMI__V202212__CUSTOMER_PROVIDER___SCORE_SCORE = 3
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__CUSTOMER_PROVIDER___SCORE)
} Kentik__Kmi__V202212__CustomerProvider__ScoreCase;

typedef enum {
  KENTIK__KMI__V202212__CUSTOMER_PROVIDER___SINGLEHOMED_CUSTOMER__NOT_SET = 0,
  KENTIK__KMI__V202212__CUSTOMER_PROVIDER___SINGLEHOMED_CUSTOMER_SINGLEHOMED_CUSTOMER = 4
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__CUSTOMER_PROVIDER___SINGLEHOMED_CUSTOMER)
} Kentik__Kmi__V202212__CustomerProvider__SinglehomedCustomerCase;

typedef enum {
  KENTIK__KMI__V202212__CUSTOMER_PROVIDER___MUTUAL_CUSTOMER__NOT_SET = 0,
  KENTIK__KMI__V202212__CUSTOMER_PROVIDER___MUTUAL_CUSTOMER_MUTUAL_CUSTOMER = 5
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__CUSTOMER_PROVIDER___MUTUAL_CUSTOMER)
} Kentik__Kmi__V202212__CustomerProvider__MutualCustomerCase;

typedef enum {
  KENTIK__KMI__V202212__CUSTOMER_PROVIDER___MUTUAL_PROVIDER__NOT_SET = 0,
  KENTIK__KMI__V202212__CUSTOMER_PROVIDER___MUTUAL_PROVIDER_MUTUAL_PROVIDER = 6
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__CUSTOMER_PROVIDER___MUTUAL_PROVIDER)
} Kentik__Kmi__V202212__CustomerProvider__MutualProviderCase;

/*
 * {{.Name}}
 */
struct  _Kentik__Kmi__V202212__CustomerProvider
{
  ProtobufCMessage base;
  char *name;
  Kentik__Kmi__V202212__CustomerProvider__AsnCase _asn_case;
  union {
    uint32_t asn;
  };
  Kentik__Kmi__V202212__CustomerProvider__ScoreCase _score_case;
  union {
    uint32_t score;
  };
  Kentik__Kmi__V202212__CustomerProvider__SinglehomedCustomerCase _singlehomed_customer_case;
  union {
    protobuf_c_boolean singlehomed_customer;
  };
  Kentik__Kmi__V202212__CustomerProvider__MutualCustomerCase _mutual_customer_case;
  union {
    protobuf_c_boolean mutual_customer;
  };
  Kentik__Kmi__V202212__CustomerProvider__MutualProviderCase _mutual_provider_case;
  union {
    protobuf_c_boolean mutual_provider;
  };
};
#define KENTIK__KMI__V202212__CUSTOMER_PROVIDER__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__kmi__v202212__customer_provider__descriptor) \
    , (char *)protobuf_c_empty_string, KENTIK__KMI__V202212__CUSTOMER_PROVIDER___ASN__NOT_SET, {0}, KENTIK__KMI__V202212__CUSTOMER_PROVIDER___SCORE__NOT_SET, {0}, KENTIK__KMI__V202212__CUSTOMER_PROVIDER___SINGLEHOMED_CUSTOMER__NOT_SET, {0}, KENTIK__KMI__V202212__CUSTOMER_PROVIDER___MUTUAL_CUSTOMER__NOT_SET, {0}, KENTIK__KMI__V202212__CUSTOMER_PROVIDER___MUTUAL_PROVIDER__NOT_SET, {0} }


typedef enum {
  KENTIK__KMI__V202212__PEER___ASN__NOT_SET = 0,
  KENTIK__KMI__V202212__PEER___ASN_ASN = 1
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__PEER___ASN)
} Kentik__Kmi__V202212__Peer__AsnCase;

typedef enum {
  KENTIK__KMI__V202212__PEER___PFX_COUNT__NOT_SET = 0,
  KENTIK__KMI__V202212__PEER___PFX_COUNT_PFX_COUNT = 3
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__PEER___PFX_COUNT)
} Kentik__Kmi__V202212__Peer__PfxCountCase;

/*
 * {{.Name}}
 */
struct  _Kentik__Kmi__V202212__Peer
{
  ProtobufCMessage base;
  char *name;
  Kentik__Kmi__V202212__Peer__AsnCase _asn_case;
  union {
    uint32_t asn;
  };
  Kentik__Kmi__V202212__Peer__PfxCountCase _pfx_count_case;
  union {
    uint32_t pfx_count;
  };
};
#define KENTIK__KMI__V202212__PEER__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__kmi__v202212__peer__descriptor) \
    , (char *)protobuf_c_empty_string, KENTIK__KMI__V202212__PEER___ASN__NOT_SET, {0}, KENTIK__KMI__V202212__PEER___PFX_COUNT__NOT_SET, {0} }


typedef enum {
  KENTIK__KMI__V202212__ASNDETAILS___ASN__NOT_SET = 0,
  KENTIK__KMI__V202212__ASNDETAILS___ASN_ASN = 1
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__ASNDETAILS___ASN)
} Kentik__Kmi__V202212__ASNDetails__AsnCase;

/*
 * {{.Name}}
 */
struct  _Kentik__Kmi__V202212__ASNDetails
{
  ProtobufCMessage base;
  char *name;
  char *country_name;
  size_t n_customers;
  Kentik__Kmi__V202212__CustomerProvider **customers;
  size_t n_providers;
  Kentik__Kmi__V202212__CustomerProvider **providers;
  size_t n_peers;
  Kentik__Kmi__V202212__Peer **peers;
  Kentik__Kmi__V202212__ASNDetails__AsnCase _asn_case;
  union {
    uint32_t asn;
  };
};
#define KENTIK__KMI__V202212__ASNDETAILS__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__kmi__v202212__asndetails__descriptor) \
    , (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, 0,NULL, 0,NULL, 0,NULL, KENTIK__KMI__V202212__ASNDETAILS___ASN__NOT_SET, {0} }


/*
 * {{.Name}}
 */
struct  _Kentik__Kmi__V202212__ListMarketsRequest
{
  ProtobufCMessage base;
};
#define KENTIK__KMI__V202212__LIST_MARKETS_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__kmi__v202212__list_markets_request__descriptor) \
     }


/*
 * {{.Name}}
 */
struct  _Kentik__Kmi__V202212__ListMarketsResponse
{
  ProtobufCMessage base;
  size_t n_markets;
  Kentik__Kmi__V202212__Market **markets;
};
#define KENTIK__KMI__V202212__LIST_MARKETS_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__kmi__v202212__list_markets_response__descriptor) \
    , 0,NULL }


typedef enum {
  KENTIK__KMI__V202212__GET_RANKINGS_REQUEST___LIMIT__NOT_SET = 0,
  KENTIK__KMI__V202212__GET_RANKINGS_REQUEST___LIMIT_LIMIT = 4
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__KMI__V202212__GET_RANKINGS_REQUEST___LIMIT)
} Kentik__Kmi__V202212__GetRankingsRequest__LimitCase;

/*
 * {{.Name}}
 */
struct  _Kentik__Kmi__V202212__GetRankingsRequest
{
  ProtobufCMessage base;
  char *market_id;
  char *rank_type;
  char *ip;
  Kentik__Kmi__V202212__GetRankingsRequest__LimitCase _limit_case;
  union {
    uint32_t limit;
  };
};
#define KENTIK__KMI__V202212__GET_RANKINGS_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__kmi__v202212__get_rankings_request__descriptor) \
    , (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, KENTIK__KMI__V202212__GET_RANKINGS_REQUEST___LIMIT__NOT_SET, {0} }


/*
 * {{.Name}}
 */
struct  _Kentik__Kmi__V202212__GetRankingsResponse
{
  ProtobufCMessage base;
  size_t n_rankings;
  Kentik__Kmi__V202212__Ranking **rankings;
  uint32_t invalid_count;
};
#define KENTIK__KMI__V202212__GET_RANKINGS_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__kmi__v202212__get_rankings_response__descriptor) \
    , 0,NULL, 0 }


/*
 * {{.Name}}
 */
struct  _Kentik__Kmi__V202212__GetASNDetailsRequest
{
  ProtobufCMessage base;
  char *market_id;
  char *asn;
  char *ip;
  char *type;
  char *mutual_provider;
  char *mutual_customer;
  char *singlehomed_customer;
};
#define KENTIK__KMI__V202212__GET_ASNDETAILS_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__kmi__v202212__get_asndetails_request__descriptor) \
    , (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  _Kentik__Kmi__V202212__GetASNDetailsResponse
{
  ProtobufCMessage base;
  Kentik__Kmi__V202212__ASNDetails *asn_details;
};
#define KENTIK__KMI__V202212__GET_ASNDETAILS_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__kmi__v202212__get_asndetails_response__descriptor) \
    , NULL }


/* Kentik__Kmi__V202212__Market methods */
void   kentik__kmi__v202212__market__init
                     (Kentik__Kmi__V202212__Market         *message);
size_t kentik__kmi__v202212__market__get_packed_size
                     (const Kentik__Kmi__V202212__Market   *message);
size_t kentik__kmi__v202212__market__pack
                     (const Kentik__Kmi__V202212__Market   *message,
                      uint8_t             *out);
size_t kentik__kmi__v202212__market__pack_to_buffer
                     (const Kentik__Kmi__V202212__Market   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Kmi__V202212__Market *
       kentik__kmi__v202212__market__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__kmi__v202212__market__free_unpacked
                     (Kentik__Kmi__V202212__Market *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Kmi__V202212__Ranking methods */
void   kentik__kmi__v202212__ranking__init
                     (Kentik__Kmi__V202212__Ranking         *message);
size_t kentik__kmi__v202212__ranking__get_packed_size
                     (const Kentik__Kmi__V202212__Ranking   *message);
size_t kentik__kmi__v202212__ranking__pack
                     (const Kentik__Kmi__V202212__Ranking   *message,
                      uint8_t             *out);
size_t kentik__kmi__v202212__ranking__pack_to_buffer
                     (const Kentik__Kmi__V202212__Ranking   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Kmi__V202212__Ranking *
       kentik__kmi__v202212__ranking__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__kmi__v202212__ranking__free_unpacked
                     (Kentik__Kmi__V202212__Ranking *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Kmi__V202212__CustomerProvider methods */
void   kentik__kmi__v202212__customer_provider__init
                     (Kentik__Kmi__V202212__CustomerProvider         *message);
size_t kentik__kmi__v202212__customer_provider__get_packed_size
                     (const Kentik__Kmi__V202212__CustomerProvider   *message);
size_t kentik__kmi__v202212__customer_provider__pack
                     (const Kentik__Kmi__V202212__CustomerProvider   *message,
                      uint8_t             *out);
size_t kentik__kmi__v202212__customer_provider__pack_to_buffer
                     (const Kentik__Kmi__V202212__CustomerProvider   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Kmi__V202212__CustomerProvider *
       kentik__kmi__v202212__customer_provider__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__kmi__v202212__customer_provider__free_unpacked
                     (Kentik__Kmi__V202212__CustomerProvider *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Kmi__V202212__Peer methods */
void   kentik__kmi__v202212__peer__init
                     (Kentik__Kmi__V202212__Peer         *message);
size_t kentik__kmi__v202212__peer__get_packed_size
                     (const Kentik__Kmi__V202212__Peer   *message);
size_t kentik__kmi__v202212__peer__pack
                     (const Kentik__Kmi__V202212__Peer   *message,
                      uint8_t             *out);
size_t kentik__kmi__v202212__peer__pack_to_buffer
                     (const Kentik__Kmi__V202212__Peer   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Kmi__V202212__Peer *
       kentik__kmi__v202212__peer__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__kmi__v202212__peer__free_unpacked
                     (Kentik__Kmi__V202212__Peer *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Kmi__V202212__ASNDetails methods */
void   kentik__kmi__v202212__asndetails__init
                     (Kentik__Kmi__V202212__ASNDetails         *message);
size_t kentik__kmi__v202212__asndetails__get_packed_size
                     (const Kentik__Kmi__V202212__ASNDetails   *message);
size_t kentik__kmi__v202212__asndetails__pack
                     (const Kentik__Kmi__V202212__ASNDetails   *message,
                      uint8_t             *out);
size_t kentik__kmi__v202212__asndetails__pack_to_buffer
                     (const Kentik__Kmi__V202212__ASNDetails   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Kmi__V202212__ASNDetails *
       kentik__kmi__v202212__asndetails__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__kmi__v202212__asndetails__free_unpacked
                     (Kentik__Kmi__V202212__ASNDetails *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Kmi__V202212__ListMarketsRequest methods */
void   kentik__kmi__v202212__list_markets_request__init
                     (Kentik__Kmi__V202212__ListMarketsRequest         *message);
size_t kentik__kmi__v202212__list_markets_request__get_packed_size
                     (const Kentik__Kmi__V202212__ListMarketsRequest   *message);
size_t kentik__kmi__v202212__list_markets_request__pack
                     (const Kentik__Kmi__V202212__ListMarketsRequest   *message,
                      uint8_t             *out);
size_t kentik__kmi__v202212__list_markets_request__pack_to_buffer
                     (const Kentik__Kmi__V202212__ListMarketsRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Kmi__V202212__ListMarketsRequest *
       kentik__kmi__v202212__list_markets_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__kmi__v202212__list_markets_request__free_unpacked
                     (Kentik__Kmi__V202212__ListMarketsRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Kmi__V202212__ListMarketsResponse methods */
void   kentik__kmi__v202212__list_markets_response__init
                     (Kentik__Kmi__V202212__ListMarketsResponse         *message);
size_t kentik__kmi__v202212__list_markets_response__get_packed_size
                     (const Kentik__Kmi__V202212__ListMarketsResponse   *message);
size_t kentik__kmi__v202212__list_markets_response__pack
                     (const Kentik__Kmi__V202212__ListMarketsResponse   *message,
                      uint8_t             *out);
size_t kentik__kmi__v202212__list_markets_response__pack_to_buffer
                     (const Kentik__Kmi__V202212__ListMarketsResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Kmi__V202212__ListMarketsResponse *
       kentik__kmi__v202212__list_markets_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__kmi__v202212__list_markets_response__free_unpacked
                     (Kentik__Kmi__V202212__ListMarketsResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Kmi__V202212__GetRankingsRequest methods */
void   kentik__kmi__v202212__get_rankings_request__init
                     (Kentik__Kmi__V202212__GetRankingsRequest         *message);
size_t kentik__kmi__v202212__get_rankings_request__get_packed_size
                     (const Kentik__Kmi__V202212__GetRankingsRequest   *message);
size_t kentik__kmi__v202212__get_rankings_request__pack
                     (const Kentik__Kmi__V202212__GetRankingsRequest   *message,
                      uint8_t             *out);
size_t kentik__kmi__v202212__get_rankings_request__pack_to_buffer
                     (const Kentik__Kmi__V202212__GetRankingsRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Kmi__V202212__GetRankingsRequest *
       kentik__kmi__v202212__get_rankings_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__kmi__v202212__get_rankings_request__free_unpacked
                     (Kentik__Kmi__V202212__GetRankingsRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Kmi__V202212__GetRankingsResponse methods */
void   kentik__kmi__v202212__get_rankings_response__init
                     (Kentik__Kmi__V202212__GetRankingsResponse         *message);
size_t kentik__kmi__v202212__get_rankings_response__get_packed_size
                     (const Kentik__Kmi__V202212__GetRankingsResponse   *message);
size_t kentik__kmi__v202212__get_rankings_response__pack
                     (const Kentik__Kmi__V202212__GetRankingsResponse   *message,
                      uint8_t             *out);
size_t kentik__kmi__v202212__get_rankings_response__pack_to_buffer
                     (const Kentik__Kmi__V202212__GetRankingsResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Kmi__V202212__GetRankingsResponse *
       kentik__kmi__v202212__get_rankings_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__kmi__v202212__get_rankings_response__free_unpacked
                     (Kentik__Kmi__V202212__GetRankingsResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Kmi__V202212__GetASNDetailsRequest methods */
void   kentik__kmi__v202212__get_asndetails_request__init
                     (Kentik__Kmi__V202212__GetASNDetailsRequest         *message);
size_t kentik__kmi__v202212__get_asndetails_request__get_packed_size
                     (const Kentik__Kmi__V202212__GetASNDetailsRequest   *message);
size_t kentik__kmi__v202212__get_asndetails_request__pack
                     (const Kentik__Kmi__V202212__GetASNDetailsRequest   *message,
                      uint8_t             *out);
size_t kentik__kmi__v202212__get_asndetails_request__pack_to_buffer
                     (const Kentik__Kmi__V202212__GetASNDetailsRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Kmi__V202212__GetASNDetailsRequest *
       kentik__kmi__v202212__get_asndetails_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__kmi__v202212__get_asndetails_request__free_unpacked
                     (Kentik__Kmi__V202212__GetASNDetailsRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__Kmi__V202212__GetASNDetailsResponse methods */
void   kentik__kmi__v202212__get_asndetails_response__init
                     (Kentik__Kmi__V202212__GetASNDetailsResponse         *message);
size_t kentik__kmi__v202212__get_asndetails_response__get_packed_size
                     (const Kentik__Kmi__V202212__GetASNDetailsResponse   *message);
size_t kentik__kmi__v202212__get_asndetails_response__pack
                     (const Kentik__Kmi__V202212__GetASNDetailsResponse   *message,
                      uint8_t             *out);
size_t kentik__kmi__v202212__get_asndetails_response__pack_to_buffer
                     (const Kentik__Kmi__V202212__GetASNDetailsResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__Kmi__V202212__GetASNDetailsResponse *
       kentik__kmi__v202212__get_asndetails_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__kmi__v202212__get_asndetails_response__free_unpacked
                     (Kentik__Kmi__V202212__GetASNDetailsResponse *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Kentik__Kmi__V202212__Market_Closure)
                 (const Kentik__Kmi__V202212__Market *message,
                  void *closure_data);
typedef void (*Kentik__Kmi__V202212__Ranking_Closure)
                 (const Kentik__Kmi__V202212__Ranking *message,
                  void *closure_data);
typedef void (*Kentik__Kmi__V202212__CustomerProvider_Closure)
                 (const Kentik__Kmi__V202212__CustomerProvider *message,
                  void *closure_data);
typedef void (*Kentik__Kmi__V202212__Peer_Closure)
                 (const Kentik__Kmi__V202212__Peer *message,
                  void *closure_data);
typedef void (*Kentik__Kmi__V202212__ASNDetails_Closure)
                 (const Kentik__Kmi__V202212__ASNDetails *message,
                  void *closure_data);
typedef void (*Kentik__Kmi__V202212__ListMarketsRequest_Closure)
                 (const Kentik__Kmi__V202212__ListMarketsRequest *message,
                  void *closure_data);
typedef void (*Kentik__Kmi__V202212__ListMarketsResponse_Closure)
                 (const Kentik__Kmi__V202212__ListMarketsResponse *message,
                  void *closure_data);
typedef void (*Kentik__Kmi__V202212__GetRankingsRequest_Closure)
                 (const Kentik__Kmi__V202212__GetRankingsRequest *message,
                  void *closure_data);
typedef void (*Kentik__Kmi__V202212__GetRankingsResponse_Closure)
                 (const Kentik__Kmi__V202212__GetRankingsResponse *message,
                  void *closure_data);
typedef void (*Kentik__Kmi__V202212__GetASNDetailsRequest_Closure)
                 (const Kentik__Kmi__V202212__GetASNDetailsRequest *message,
                  void *closure_data);
typedef void (*Kentik__Kmi__V202212__GetASNDetailsResponse_Closure)
                 (const Kentik__Kmi__V202212__GetASNDetailsResponse *message,
                  void *closure_data);

/* --- services --- */

typedef struct _Kentik__Kmi__V202212__KmiService_Service Kentik__Kmi__V202212__KmiService_Service;
struct _Kentik__Kmi__V202212__KmiService_Service
{
  ProtobufCService base;
  void (*list_markets)(Kentik__Kmi__V202212__KmiService_Service *service,
                       const Kentik__Kmi__V202212__ListMarketsRequest *input,
                       Kentik__Kmi__V202212__ListMarketsResponse_Closure closure,
                       void *closure_data);
  void (*get_rankings)(Kentik__Kmi__V202212__KmiService_Service *service,
                       const Kentik__Kmi__V202212__GetRankingsRequest *input,
                       Kentik__Kmi__V202212__GetRankingsResponse_Closure closure,
                       void *closure_data);
  void (*get_asndetails)(Kentik__Kmi__V202212__KmiService_Service *service,
                         const Kentik__Kmi__V202212__GetASNDetailsRequest *input,
                         Kentik__Kmi__V202212__GetASNDetailsResponse_Closure closure,
                         void *closure_data);
};
typedef void (*Kentik__Kmi__V202212__KmiService_ServiceDestroy)(Kentik__Kmi__V202212__KmiService_Service *);
void kentik__kmi__v202212__kmi_service__init (Kentik__Kmi__V202212__KmiService_Service *service,
                                              Kentik__Kmi__V202212__KmiService_ServiceDestroy destroy);
#define KENTIK__KMI__V202212__KMI_SERVICE__BASE_INIT \
    { &kentik__kmi__v202212__kmi_service__descriptor, protobuf_c_service_invoke_internal, NULL }
#define KENTIK__KMI__V202212__KMI_SERVICE__INIT(function_prefix__) \
    { KENTIK__KMI__V202212__KMI_SERVICE__BASE_INIT,\
      function_prefix__ ## list_markets,\
      function_prefix__ ## get_rankings,\
      function_prefix__ ## get_asndetails  }
void kentik__kmi__v202212__kmi_service__list_markets(ProtobufCService *service,
                                                     const Kentik__Kmi__V202212__ListMarketsRequest *input,
                                                     Kentik__Kmi__V202212__ListMarketsResponse_Closure closure,
                                                     void *closure_data);
void kentik__kmi__v202212__kmi_service__get_rankings(ProtobufCService *service,
                                                     const Kentik__Kmi__V202212__GetRankingsRequest *input,
                                                     Kentik__Kmi__V202212__GetRankingsResponse_Closure closure,
                                                     void *closure_data);
void kentik__kmi__v202212__kmi_service__get_asndetails(ProtobufCService *service,
                                                       const Kentik__Kmi__V202212__GetASNDetailsRequest *input,
                                                       Kentik__Kmi__V202212__GetASNDetailsResponse_Closure closure,
                                                       void *closure_data);

/* --- descriptors --- */

extern const ProtobufCMessageDescriptor kentik__kmi__v202212__market__descriptor;
extern const ProtobufCMessageDescriptor kentik__kmi__v202212__ranking__descriptor;
extern const ProtobufCMessageDescriptor kentik__kmi__v202212__customer_provider__descriptor;
extern const ProtobufCMessageDescriptor kentik__kmi__v202212__peer__descriptor;
extern const ProtobufCMessageDescriptor kentik__kmi__v202212__asndetails__descriptor;
extern const ProtobufCMessageDescriptor kentik__kmi__v202212__list_markets_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__kmi__v202212__list_markets_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__kmi__v202212__get_rankings_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__kmi__v202212__get_rankings_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__kmi__v202212__get_asndetails_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__kmi__v202212__get_asndetails_response__descriptor;
extern const ProtobufCServiceDescriptor kentik__kmi__v202212__kmi_service__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_kentik_2fkmi_2fv202212_2fkmi_2eproto__INCLUDED */
