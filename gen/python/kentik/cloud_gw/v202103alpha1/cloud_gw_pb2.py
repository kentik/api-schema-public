# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/cloud_gw/v202103alpha1/cloud_gw.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.api import annotations_pb2 as google_dot_api_dot_annotations__pb2
from google.api import client_pb2 as google_dot_api_dot_client__pb2
from protoc_gen_openapiv2.options import annotations_pb2 as protoc__gen__openapiv2_dot_options_dot_annotations__pb2
from kentik.core.v202012alpha1 import annotations_pb2 as kentik_dot_core_dot_v202012alpha1_dot_annotations__pb2
from grpc.http_over_grpc import http_over_grpc_pb2 as grpc_dot_http__over__grpc_dot_http__over__grpc__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='kentik/cloud_gw/v202103alpha1/cloud_gw.proto',
  package='kentik.cloud_gw.v202103alpha1',
  syntax='proto3',
  serialized_options=b'ZIgithub.com/kentik/api-schema/gen/go/kentik/cloud_gw/v202103alpha1;cloudgw\222A\223\002\022U\n\014CLOUD GW API\"7\n\026Kentik API Engineering\022\035https://github.com/kentik/api2\014202103alpha1*\001\0022\020application/json:\020application/jsonZD\n\036\n\005email\022\025\010\002\032\017X-CH-Auth-Email \002\n\"\n\005token\022\031\010\002\032\023X-CH-Auth-API-Token \002b\026\n\t\n\005email\022\000\n\t\n\005token\022\000r5\n\026More about Kentik APIs\022\033https://docs.kentik.com/api',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n,kentik/cloud_gw/v202103alpha1/cloud_gw.proto\x12\x1dkentik.cloud_gw.v202103alpha1\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a.protoc-gen-openapiv2/options/annotations.proto\x1a+kentik/core/v202012alpha1/annotations.proto\x1a(grpc/http_over_grpc/http_over_grpc.proto\"B\n\x0fLoginAwsRequest\x12\x0e\n\x06region\x18\x01 \x01(\t\x12\x0c\n\x04role\x18\x02 \x01(\t\x12\x11\n\tcaller_id\x18\x03 \x01(\t\"\x12\n\x10LoginAwsResponse\"a\n\x0fProxyAwsRequest\x12\x0e\n\x06region\x18\x01 \x01(\t\x12>\n\x0chttp_request\x18\x03 \x01(\x0b\x32(.grpc.http_over_grpc.HTTPOverGRPCRequest\"Q\n\x10ProxyAwsResponse\x12=\n\rhttp_response\x18\x02 \x01(\x0b\x32&.grpc.http_over_grpc.HTTPOverGRPCReply\"\x15\n\x13ListAwsRolesRequest\"\xe0\x01\n\x14ListAwsRolesResponse\x12\x66\n\x13\x63id_region_to_roles\x18\x01 \x03(\x0b\x32I.kentik.cloud_gw.v202103alpha1.ListAwsRolesResponse.CidRegionToRolesEntry\x1a`\n\x15\x43idRegionToRolesEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\x36\n\x05value\x18\x02 \x01(\x0b\x32\'.kentik.cloud_gw.v202103alpha1.RoleList:\x02\x38\x01\"\x19\n\x08RoleList\x12\r\n\x05roles\x18\x01 \x03(\t\"2\n\rGetAwsRequest\x12\x0e\n\x06region\x18\x01 \x01(\t\x12\x11\n\tcaller_id\x18\x02 \x01(\t\"d\n\x0eGetAwsResponse\x12\x12\n\nrequest_id\x18\x01 \x01(\x03\x12>\n\x0chttp_request\x18\x02 \x01(\x0b\x32(.grpc.http_over_grpc.HTTPOverGRPCRequest\"c\n\x0eSendAwsRequest\x12\x12\n\nrequest_id\x18\x01 \x01(\x03\x12=\n\rhttp_response\x18\x02 \x01(\x0b\x32&.grpc.http_over_grpc.HTTPOverGRPCReply\"\x11\n\x0fSendAwsResponse\"%\n\x06Header\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\x0e\n\x06values\x18\x02 \x03(\t2\xc2\x03\n\x14\x41wsGwInternalService\x12\xba\x01\n\x08ProxyAws\x12..kentik.cloud_gw.v202103alpha1.ProxyAwsRequest\x1a/.kentik.cloud_gw.v202103alpha1.ProxyAwsResponse\"M\xf2\xd7\x02\x14\x61\x64min.cloud_gw:write\x82\xd3\xe4\x93\x02/\"*/cloud_gw/v202103alpha1/proxy_aws/{region}:\x01*\x12\xbe\x01\n\x0cListAwsRoles\x12\x32.kentik.cloud_gw.v202103alpha1.ListAwsRolesRequest\x1a\x33.kentik.cloud_gw.v202103alpha1.ListAwsRolesResponse\"E\xf2\xd7\x02\x13\x61\x64min.cloud_gw:read\x82\xd3\xe4\x93\x02(\x12&/cloud_gw/v202103alpha1/list_aws_roles\x1a,\xca\x41\x17\x63loud_gw.api.kentik.com\xea\xd7\x02\x0e\x61\x64min.cloud_gw2\xca\x04\n\x14\x41wsGwExternalService\x12\xb7\x01\n\x08LoginAws\x12..kentik.cloud_gw.v202103alpha1.LoginAwsRequest\x1a/.kentik.cloud_gw.v202103alpha1.LoginAwsResponse\"J\xf2\xd7\x02\x14\x61\x64min.cloud_gw:write\x82\xd3\xe4\x93\x02,\x12*/cloud_gw/v202103alpha1/login_aws/{region}\x12\xa6\x01\n\x06GetAws\x12,.kentik.cloud_gw.v202103alpha1.GetAwsRequest\x1a-.kentik.cloud_gw.v202103alpha1.GetAwsResponse\"?\xf2\xd7\x02\x14\x61\x64min.cloud_gw:write\x82\xd3\xe4\x93\x02!\x12\x1f/cloud_gw/v202103alpha1/get_aws\x12\xba\x01\n\x07SendAws\x12-.kentik.cloud_gw.v202103alpha1.SendAwsRequest\x1a..kentik.cloud_gw.v202103alpha1.SendAwsResponse\"P\xf2\xd7\x02\x14\x61\x64min.cloud_gw:write\x82\xd3\xe4\x93\x02\x32\"-/cloud_gw/v202103alpha1/send_aws/{request_id}:\x01*\x1a\x12\xea\xd7\x02\x0e\x61\x64min.cloud_gwB\xe2\x02ZIgithub.com/kentik/api-schema/gen/go/kentik/cloud_gw/v202103alpha1;cloudgw\x92\x41\x93\x02\x12U\n\x0c\x43LOUD GW API\"7\n\x16Kentik API Engineering\x12\x1dhttps://github.com/kentik/api2\x0c\x32\x30\x32\x31\x30\x33\x61lpha1*\x01\x02\x32\x10\x61pplication/json:\x10\x61pplication/jsonZD\n\x1e\n\x05\x65mail\x12\x15\x08\x02\x1a\x0fX-CH-Auth-Email \x02\n\"\n\x05token\x12\x19\x08\x02\x1a\x13X-CH-Auth-API-Token \x02\x62\x16\n\t\n\x05\x65mail\x12\x00\n\t\n\x05token\x12\x00r5\n\x16More about Kentik APIs\x12\x1bhttps://docs.kentik.com/apib\x06proto3'
  ,
  dependencies=[google_dot_api_dot_annotations__pb2.DESCRIPTOR,google_dot_api_dot_client__pb2.DESCRIPTOR,protoc__gen__openapiv2_dot_options_dot_annotations__pb2.DESCRIPTOR,kentik_dot_core_dot_v202012alpha1_dot_annotations__pb2.DESCRIPTOR,grpc_dot_http__over__grpc_dot_http__over__grpc__pb2.DESCRIPTOR,])




_LOGINAWSREQUEST = _descriptor.Descriptor(
  name='LoginAwsRequest',
  full_name='kentik.cloud_gw.v202103alpha1.LoginAwsRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='region', full_name='kentik.cloud_gw.v202103alpha1.LoginAwsRequest.region', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='role', full_name='kentik.cloud_gw.v202103alpha1.LoginAwsRequest.role', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='caller_id', full_name='kentik.cloud_gw.v202103alpha1.LoginAwsRequest.caller_id', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=269,
  serialized_end=335,
)


_LOGINAWSRESPONSE = _descriptor.Descriptor(
  name='LoginAwsResponse',
  full_name='kentik.cloud_gw.v202103alpha1.LoginAwsResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=337,
  serialized_end=355,
)


_PROXYAWSREQUEST = _descriptor.Descriptor(
  name='ProxyAwsRequest',
  full_name='kentik.cloud_gw.v202103alpha1.ProxyAwsRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='region', full_name='kentik.cloud_gw.v202103alpha1.ProxyAwsRequest.region', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='http_request', full_name='kentik.cloud_gw.v202103alpha1.ProxyAwsRequest.http_request', index=1,
      number=3, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=357,
  serialized_end=454,
)


_PROXYAWSRESPONSE = _descriptor.Descriptor(
  name='ProxyAwsResponse',
  full_name='kentik.cloud_gw.v202103alpha1.ProxyAwsResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='http_response', full_name='kentik.cloud_gw.v202103alpha1.ProxyAwsResponse.http_response', index=0,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=456,
  serialized_end=537,
)


_LISTAWSROLESREQUEST = _descriptor.Descriptor(
  name='ListAwsRolesRequest',
  full_name='kentik.cloud_gw.v202103alpha1.ListAwsRolesRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=539,
  serialized_end=560,
)


_LISTAWSROLESRESPONSE_CIDREGIONTOROLESENTRY = _descriptor.Descriptor(
  name='CidRegionToRolesEntry',
  full_name='kentik.cloud_gw.v202103alpha1.ListAwsRolesResponse.CidRegionToRolesEntry',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='key', full_name='kentik.cloud_gw.v202103alpha1.ListAwsRolesResponse.CidRegionToRolesEntry.key', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='value', full_name='kentik.cloud_gw.v202103alpha1.ListAwsRolesResponse.CidRegionToRolesEntry.value', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=b'8\001',
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=691,
  serialized_end=787,
)

_LISTAWSROLESRESPONSE = _descriptor.Descriptor(
  name='ListAwsRolesResponse',
  full_name='kentik.cloud_gw.v202103alpha1.ListAwsRolesResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='cid_region_to_roles', full_name='kentik.cloud_gw.v202103alpha1.ListAwsRolesResponse.cid_region_to_roles', index=0,
      number=1, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[_LISTAWSROLESRESPONSE_CIDREGIONTOROLESENTRY, ],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=563,
  serialized_end=787,
)


_ROLELIST = _descriptor.Descriptor(
  name='RoleList',
  full_name='kentik.cloud_gw.v202103alpha1.RoleList',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='roles', full_name='kentik.cloud_gw.v202103alpha1.RoleList.roles', index=0,
      number=1, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=789,
  serialized_end=814,
)


_GETAWSREQUEST = _descriptor.Descriptor(
  name='GetAwsRequest',
  full_name='kentik.cloud_gw.v202103alpha1.GetAwsRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='region', full_name='kentik.cloud_gw.v202103alpha1.GetAwsRequest.region', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='caller_id', full_name='kentik.cloud_gw.v202103alpha1.GetAwsRequest.caller_id', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=816,
  serialized_end=866,
)


_GETAWSRESPONSE = _descriptor.Descriptor(
  name='GetAwsResponse',
  full_name='kentik.cloud_gw.v202103alpha1.GetAwsResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='request_id', full_name='kentik.cloud_gw.v202103alpha1.GetAwsResponse.request_id', index=0,
      number=1, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='http_request', full_name='kentik.cloud_gw.v202103alpha1.GetAwsResponse.http_request', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=868,
  serialized_end=968,
)


_SENDAWSREQUEST = _descriptor.Descriptor(
  name='SendAwsRequest',
  full_name='kentik.cloud_gw.v202103alpha1.SendAwsRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='request_id', full_name='kentik.cloud_gw.v202103alpha1.SendAwsRequest.request_id', index=0,
      number=1, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='http_response', full_name='kentik.cloud_gw.v202103alpha1.SendAwsRequest.http_response', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=970,
  serialized_end=1069,
)


_SENDAWSRESPONSE = _descriptor.Descriptor(
  name='SendAwsResponse',
  full_name='kentik.cloud_gw.v202103alpha1.SendAwsResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=1071,
  serialized_end=1088,
)


_HEADER = _descriptor.Descriptor(
  name='Header',
  full_name='kentik.cloud_gw.v202103alpha1.Header',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='key', full_name='kentik.cloud_gw.v202103alpha1.Header.key', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='values', full_name='kentik.cloud_gw.v202103alpha1.Header.values', index=1,
      number=2, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=1090,
  serialized_end=1127,
)

_PROXYAWSREQUEST.fields_by_name['http_request'].message_type = grpc_dot_http__over__grpc_dot_http__over__grpc__pb2._HTTPOVERGRPCREQUEST
_PROXYAWSRESPONSE.fields_by_name['http_response'].message_type = grpc_dot_http__over__grpc_dot_http__over__grpc__pb2._HTTPOVERGRPCREPLY
_LISTAWSROLESRESPONSE_CIDREGIONTOROLESENTRY.fields_by_name['value'].message_type = _ROLELIST
_LISTAWSROLESRESPONSE_CIDREGIONTOROLESENTRY.containing_type = _LISTAWSROLESRESPONSE
_LISTAWSROLESRESPONSE.fields_by_name['cid_region_to_roles'].message_type = _LISTAWSROLESRESPONSE_CIDREGIONTOROLESENTRY
_GETAWSRESPONSE.fields_by_name['http_request'].message_type = grpc_dot_http__over__grpc_dot_http__over__grpc__pb2._HTTPOVERGRPCREQUEST
_SENDAWSREQUEST.fields_by_name['http_response'].message_type = grpc_dot_http__over__grpc_dot_http__over__grpc__pb2._HTTPOVERGRPCREPLY
DESCRIPTOR.message_types_by_name['LoginAwsRequest'] = _LOGINAWSREQUEST
DESCRIPTOR.message_types_by_name['LoginAwsResponse'] = _LOGINAWSRESPONSE
DESCRIPTOR.message_types_by_name['ProxyAwsRequest'] = _PROXYAWSREQUEST
DESCRIPTOR.message_types_by_name['ProxyAwsResponse'] = _PROXYAWSRESPONSE
DESCRIPTOR.message_types_by_name['ListAwsRolesRequest'] = _LISTAWSROLESREQUEST
DESCRIPTOR.message_types_by_name['ListAwsRolesResponse'] = _LISTAWSROLESRESPONSE
DESCRIPTOR.message_types_by_name['RoleList'] = _ROLELIST
DESCRIPTOR.message_types_by_name['GetAwsRequest'] = _GETAWSREQUEST
DESCRIPTOR.message_types_by_name['GetAwsResponse'] = _GETAWSRESPONSE
DESCRIPTOR.message_types_by_name['SendAwsRequest'] = _SENDAWSREQUEST
DESCRIPTOR.message_types_by_name['SendAwsResponse'] = _SENDAWSRESPONSE
DESCRIPTOR.message_types_by_name['Header'] = _HEADER
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

LoginAwsRequest = _reflection.GeneratedProtocolMessageType('LoginAwsRequest', (_message.Message,), {
  'DESCRIPTOR' : _LOGINAWSREQUEST,
  '__module__' : 'kentik.cloud_gw.v202103alpha1.cloud_gw_pb2'
  # @@protoc_insertion_point(class_scope:kentik.cloud_gw.v202103alpha1.LoginAwsRequest)
  })
_sym_db.RegisterMessage(LoginAwsRequest)

LoginAwsResponse = _reflection.GeneratedProtocolMessageType('LoginAwsResponse', (_message.Message,), {
  'DESCRIPTOR' : _LOGINAWSRESPONSE,
  '__module__' : 'kentik.cloud_gw.v202103alpha1.cloud_gw_pb2'
  # @@protoc_insertion_point(class_scope:kentik.cloud_gw.v202103alpha1.LoginAwsResponse)
  })
_sym_db.RegisterMessage(LoginAwsResponse)

ProxyAwsRequest = _reflection.GeneratedProtocolMessageType('ProxyAwsRequest', (_message.Message,), {
  'DESCRIPTOR' : _PROXYAWSREQUEST,
  '__module__' : 'kentik.cloud_gw.v202103alpha1.cloud_gw_pb2'
  # @@protoc_insertion_point(class_scope:kentik.cloud_gw.v202103alpha1.ProxyAwsRequest)
  })
_sym_db.RegisterMessage(ProxyAwsRequest)

ProxyAwsResponse = _reflection.GeneratedProtocolMessageType('ProxyAwsResponse', (_message.Message,), {
  'DESCRIPTOR' : _PROXYAWSRESPONSE,
  '__module__' : 'kentik.cloud_gw.v202103alpha1.cloud_gw_pb2'
  # @@protoc_insertion_point(class_scope:kentik.cloud_gw.v202103alpha1.ProxyAwsResponse)
  })
_sym_db.RegisterMessage(ProxyAwsResponse)

ListAwsRolesRequest = _reflection.GeneratedProtocolMessageType('ListAwsRolesRequest', (_message.Message,), {
  'DESCRIPTOR' : _LISTAWSROLESREQUEST,
  '__module__' : 'kentik.cloud_gw.v202103alpha1.cloud_gw_pb2'
  # @@protoc_insertion_point(class_scope:kentik.cloud_gw.v202103alpha1.ListAwsRolesRequest)
  })
_sym_db.RegisterMessage(ListAwsRolesRequest)

ListAwsRolesResponse = _reflection.GeneratedProtocolMessageType('ListAwsRolesResponse', (_message.Message,), {

  'CidRegionToRolesEntry' : _reflection.GeneratedProtocolMessageType('CidRegionToRolesEntry', (_message.Message,), {
    'DESCRIPTOR' : _LISTAWSROLESRESPONSE_CIDREGIONTOROLESENTRY,
    '__module__' : 'kentik.cloud_gw.v202103alpha1.cloud_gw_pb2'
    # @@protoc_insertion_point(class_scope:kentik.cloud_gw.v202103alpha1.ListAwsRolesResponse.CidRegionToRolesEntry)
    })
  ,
  'DESCRIPTOR' : _LISTAWSROLESRESPONSE,
  '__module__' : 'kentik.cloud_gw.v202103alpha1.cloud_gw_pb2'
  # @@protoc_insertion_point(class_scope:kentik.cloud_gw.v202103alpha1.ListAwsRolesResponse)
  })
_sym_db.RegisterMessage(ListAwsRolesResponse)
_sym_db.RegisterMessage(ListAwsRolesResponse.CidRegionToRolesEntry)

RoleList = _reflection.GeneratedProtocolMessageType('RoleList', (_message.Message,), {
  'DESCRIPTOR' : _ROLELIST,
  '__module__' : 'kentik.cloud_gw.v202103alpha1.cloud_gw_pb2'
  # @@protoc_insertion_point(class_scope:kentik.cloud_gw.v202103alpha1.RoleList)
  })
_sym_db.RegisterMessage(RoleList)

GetAwsRequest = _reflection.GeneratedProtocolMessageType('GetAwsRequest', (_message.Message,), {
  'DESCRIPTOR' : _GETAWSREQUEST,
  '__module__' : 'kentik.cloud_gw.v202103alpha1.cloud_gw_pb2'
  # @@protoc_insertion_point(class_scope:kentik.cloud_gw.v202103alpha1.GetAwsRequest)
  })
_sym_db.RegisterMessage(GetAwsRequest)

GetAwsResponse = _reflection.GeneratedProtocolMessageType('GetAwsResponse', (_message.Message,), {
  'DESCRIPTOR' : _GETAWSRESPONSE,
  '__module__' : 'kentik.cloud_gw.v202103alpha1.cloud_gw_pb2'
  # @@protoc_insertion_point(class_scope:kentik.cloud_gw.v202103alpha1.GetAwsResponse)
  })
_sym_db.RegisterMessage(GetAwsResponse)

SendAwsRequest = _reflection.GeneratedProtocolMessageType('SendAwsRequest', (_message.Message,), {
  'DESCRIPTOR' : _SENDAWSREQUEST,
  '__module__' : 'kentik.cloud_gw.v202103alpha1.cloud_gw_pb2'
  # @@protoc_insertion_point(class_scope:kentik.cloud_gw.v202103alpha1.SendAwsRequest)
  })
_sym_db.RegisterMessage(SendAwsRequest)

SendAwsResponse = _reflection.GeneratedProtocolMessageType('SendAwsResponse', (_message.Message,), {
  'DESCRIPTOR' : _SENDAWSRESPONSE,
  '__module__' : 'kentik.cloud_gw.v202103alpha1.cloud_gw_pb2'
  # @@protoc_insertion_point(class_scope:kentik.cloud_gw.v202103alpha1.SendAwsResponse)
  })
_sym_db.RegisterMessage(SendAwsResponse)

Header = _reflection.GeneratedProtocolMessageType('Header', (_message.Message,), {
  'DESCRIPTOR' : _HEADER,
  '__module__' : 'kentik.cloud_gw.v202103alpha1.cloud_gw_pb2'
  # @@protoc_insertion_point(class_scope:kentik.cloud_gw.v202103alpha1.Header)
  })
_sym_db.RegisterMessage(Header)


DESCRIPTOR._options = None
_LISTAWSROLESRESPONSE_CIDREGIONTOROLESENTRY._options = None

_AWSGWINTERNALSERVICE = _descriptor.ServiceDescriptor(
  name='AwsGwInternalService',
  full_name='kentik.cloud_gw.v202103alpha1.AwsGwInternalService',
  file=DESCRIPTOR,
  index=0,
  serialized_options=b'\312A\027cloud_gw.api.kentik.com\352\327\002\016admin.cloud_gw',
  create_key=_descriptor._internal_create_key,
  serialized_start=1130,
  serialized_end=1580,
  methods=[
  _descriptor.MethodDescriptor(
    name='ProxyAws',
    full_name='kentik.cloud_gw.v202103alpha1.AwsGwInternalService.ProxyAws',
    index=0,
    containing_service=None,
    input_type=_PROXYAWSREQUEST,
    output_type=_PROXYAWSRESPONSE,
    serialized_options=b'\362\327\002\024admin.cloud_gw:write\202\323\344\223\002/\"*/cloud_gw/v202103alpha1/proxy_aws/{region}:\001*',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='ListAwsRoles',
    full_name='kentik.cloud_gw.v202103alpha1.AwsGwInternalService.ListAwsRoles',
    index=1,
    containing_service=None,
    input_type=_LISTAWSROLESREQUEST,
    output_type=_LISTAWSROLESRESPONSE,
    serialized_options=b'\362\327\002\023admin.cloud_gw:read\202\323\344\223\002(\022&/cloud_gw/v202103alpha1/list_aws_roles',
    create_key=_descriptor._internal_create_key,
  ),
])
_sym_db.RegisterServiceDescriptor(_AWSGWINTERNALSERVICE)

DESCRIPTOR.services_by_name['AwsGwInternalService'] = _AWSGWINTERNALSERVICE


_AWSGWEXTERNALSERVICE = _descriptor.ServiceDescriptor(
  name='AwsGwExternalService',
  full_name='kentik.cloud_gw.v202103alpha1.AwsGwExternalService',
  file=DESCRIPTOR,
  index=1,
  serialized_options=b'\352\327\002\016admin.cloud_gw',
  create_key=_descriptor._internal_create_key,
  serialized_start=1583,
  serialized_end=2169,
  methods=[
  _descriptor.MethodDescriptor(
    name='LoginAws',
    full_name='kentik.cloud_gw.v202103alpha1.AwsGwExternalService.LoginAws',
    index=0,
    containing_service=None,
    input_type=_LOGINAWSREQUEST,
    output_type=_LOGINAWSRESPONSE,
    serialized_options=b'\362\327\002\024admin.cloud_gw:write\202\323\344\223\002,\022*/cloud_gw/v202103alpha1/login_aws/{region}',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='GetAws',
    full_name='kentik.cloud_gw.v202103alpha1.AwsGwExternalService.GetAws',
    index=1,
    containing_service=None,
    input_type=_GETAWSREQUEST,
    output_type=_GETAWSRESPONSE,
    serialized_options=b'\362\327\002\024admin.cloud_gw:write\202\323\344\223\002!\022\037/cloud_gw/v202103alpha1/get_aws',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='SendAws',
    full_name='kentik.cloud_gw.v202103alpha1.AwsGwExternalService.SendAws',
    index=2,
    containing_service=None,
    input_type=_SENDAWSREQUEST,
    output_type=_SENDAWSRESPONSE,
    serialized_options=b'\362\327\002\024admin.cloud_gw:write\202\323\344\223\0022\"-/cloud_gw/v202103alpha1/send_aws/{request_id}:\001*',
    create_key=_descriptor._internal_create_key,
  ),
])
_sym_db.RegisterServiceDescriptor(_AWSGWEXTERNALSERVICE)

DESCRIPTOR.services_by_name['AwsGwExternalService'] = _AWSGWEXTERNALSERVICE

# @@protoc_insertion_point(module_scope)
