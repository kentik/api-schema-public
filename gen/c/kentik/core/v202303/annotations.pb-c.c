/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/core/v202303/annotations.proto */

/* Do not generate deprecated warnings for self */
#ifndef PROTOBUF_C__NO_DEPRECATED
#define PROTOBUF_C__NO_DEPRECATED
#endif

#include "kentik/core/v202303/annotations.pb-c.h"
static const ProtobufCEnumValue kentik__core__v202303__service_visibility__enum_values_by_number[4] =
{
  { "SERVICE_VISIBILITY_PRIVATE", "KENTIK__CORE__V202303__SERVICE_VISIBILITY__SERVICE_VISIBILITY_PRIVATE", 0 },
  { "SERVICE_VISIBILITY_PROTECTED", "KENTIK__CORE__V202303__SERVICE_VISIBILITY__SERVICE_VISIBILITY_PROTECTED", 1 },
  { "SERVICE_VISIBILITY_INTERNAL", "KENTIK__CORE__V202303__SERVICE_VISIBILITY__SERVICE_VISIBILITY_INTERNAL", 2 },
  { "SERVICE_VISIBILITY_PUBLIC", "KENTIK__CORE__V202303__SERVICE_VISIBILITY__SERVICE_VISIBILITY_PUBLIC", 3 },
};
static const ProtobufCIntRange kentik__core__v202303__service_visibility__value_ranges[] = {
{0, 0},{0, 4}
};
static const ProtobufCEnumValueIndex kentik__core__v202303__service_visibility__enum_values_by_name[4] =
{
  { "SERVICE_VISIBILITY_INTERNAL", 2 },
  { "SERVICE_VISIBILITY_PRIVATE", 0 },
  { "SERVICE_VISIBILITY_PROTECTED", 1 },
  { "SERVICE_VISIBILITY_PUBLIC", 3 },
};
const ProtobufCEnumDescriptor kentik__core__v202303__service_visibility__descriptor =
{
  PROTOBUF_C__ENUM_DESCRIPTOR_MAGIC,
  "kentik.core.v202303.ServiceVisibility",
  "ServiceVisibility",
  "Kentik__Core__V202303__ServiceVisibility",
  "kentik.core.v202303",
  4,
  kentik__core__v202303__service_visibility__enum_values_by_number,
  4,
  kentik__core__v202303__service_visibility__enum_values_by_name,
  1,
  kentik__core__v202303__service_visibility__value_ranges,
  NULL,NULL,NULL,NULL   /* reserved[1234] */
};
static const ProtobufCEnumValue kentik__core__v202303__method_visibility__enum_values_by_number[5] =
{
  { "METHOD_VISIBILITY_UNSPECIFIED", "KENTIK__CORE__V202303__METHOD_VISIBILITY__METHOD_VISIBILITY_UNSPECIFIED", 0 },
  { "METHOD_VISIBILITY_PRIVATE", "KENTIK__CORE__V202303__METHOD_VISIBILITY__METHOD_VISIBILITY_PRIVATE", 1 },
  { "METHOD_VISIBILITY_PROTECTED", "KENTIK__CORE__V202303__METHOD_VISIBILITY__METHOD_VISIBILITY_PROTECTED", 2 },
  { "METHOD_VISIBILITY_INTERNAL", "KENTIK__CORE__V202303__METHOD_VISIBILITY__METHOD_VISIBILITY_INTERNAL", 3 },
  { "METHOD_VISIBILITY_PUBLIC", "KENTIK__CORE__V202303__METHOD_VISIBILITY__METHOD_VISIBILITY_PUBLIC", 4 },
};
static const ProtobufCIntRange kentik__core__v202303__method_visibility__value_ranges[] = {
{0, 0},{0, 5}
};
static const ProtobufCEnumValueIndex kentik__core__v202303__method_visibility__enum_values_by_name[5] =
{
  { "METHOD_VISIBILITY_INTERNAL", 3 },
  { "METHOD_VISIBILITY_PRIVATE", 1 },
  { "METHOD_VISIBILITY_PROTECTED", 2 },
  { "METHOD_VISIBILITY_PUBLIC", 4 },
  { "METHOD_VISIBILITY_UNSPECIFIED", 0 },
};
const ProtobufCEnumDescriptor kentik__core__v202303__method_visibility__descriptor =
{
  PROTOBUF_C__ENUM_DESCRIPTOR_MAGIC,
  "kentik.core.v202303.MethodVisibility",
  "MethodVisibility",
  "Kentik__Core__V202303__MethodVisibility",
  "kentik.core.v202303",
  5,
  kentik__core__v202303__method_visibility__enum_values_by_number,
  5,
  kentik__core__v202303__method_visibility__enum_values_by_name,
  1,
  kentik__core__v202303__method_visibility__value_ranges,
  NULL,NULL,NULL,NULL   /* reserved[1234] */
};
