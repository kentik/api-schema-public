# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/network_class/v202109alpha1/network_class.proto

from google.protobuf.internal import enum_type_wrapper
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


DESCRIPTOR = _descriptor.FileDescriptor(
  name='kentik/network_class/v202109alpha1/network_class.proto',
  package='kentik.network_class.v202109alpha1',
  syntax='proto3',
  serialized_options=b'ZTgithub.com/kentik/api-schema/gen/go/kentik/network_class/v202109alpha1;network_class\222A\202\002\022D\n\032Network Classification API\"\030\n\026Kentik API Engineering2\014202109alpha1*\001\0022\020application/json:\020application/jsonZD\n\036\n\005email\022\025\010\002\032\017X-CH-Auth-Email \002\n\"\n\005token\022\031\010\002\032\023X-CH-Auth-API-Token \002b\026\n\t\n\005email\022\000\n\t\n\005token\022\000r5\n\026More about Kentik APIs\022\033https://docs.kentik.com/api',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n6kentik/network_class/v202109alpha1/network_class.proto\x12\"kentik.network_class.v202109alpha1\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a.protoc-gen-openapiv2/options/annotations.proto\x1a+kentik/core/v202012alpha1/annotations.proto\"j\n\x0b\x43loudSubnet\x12\x41\n\x04type\x18\x01 \x01(\x0e\x32-.kentik.network_class.v202109alpha1.CloudTypeR\x04type\x12\x18\n\x07subnets\x18\x02 \x03(\tR\x07subnets\"\x86\x02\n\x0cNetworkClass\x12#\n\rinternal_asns\x18\x01 \x03(\tR\x0cinternalAsns\x12!\n\x0cinternal_ips\x18\x02 \x03(\tR\x0binternalIps\x12(\n\x10use_private_asns\x18\x03 \x01(\x08R\x0eusePrivateAsns\x12.\n\x13use_private_subnets\x18\x04 \x01(\x08R\x11usePrivateSubnets\x12T\n\rcloud_subnets\x18\x05 \x03(\x0b\x32/.kentik.network_class.v202109alpha1.CloudSubnetR\x0c\x63loudSubnets\"\x18\n\x16GetNetworkClassRequest\"p\n\x17GetNetworkClassResponse\x12U\n\rnetwork_class\x18\x01 \x01(\x0b\x32\x30.kentik.network_class.v202109alpha1.NetworkClassR\x0cnetworkClass\"r\n\x19UpdateNetworkClassRequest\x12U\n\rnetwork_class\x18\x01 \x01(\x0b\x32\x30.kentik.network_class.v202109alpha1.NetworkClassR\x0cnetworkClass\"s\n\x1aUpdateNetworkClassResponse\x12U\n\rnetwork_class\x18\x01 \x01(\x0b\x32\x30.kentik.network_class.v202109alpha1.NetworkClassR\x0cnetworkClass*y\n\tCloudType\x12\x1a\n\x16\x43LOUD_TYPE_UNSPECIFIED\x10\x00\x12\x12\n\x0e\x43LOUD_TYPE_AWS\x10\x01\x12\x14\n\x10\x43LOUD_TYPE_AZURE\x10\x02\x12\x12\n\x0e\x43LOUD_TYPE_GCE\x10\x03\x12\x12\n\x0e\x43LOUD_TYPE_IBM\x10\x04\x32\x8a\x06\n\x13NetworkClassService\x12\xd3\x02\n\x0fGetNetworkClass\x12:.kentik.network_class.v202109alpha1.GetNetworkClassRequest\x1a;.kentik.network_class.v202109alpha1.GetNetworkClassResponse\"\xc6\x01\x92\x41u\x12\x1dGet a network classification.\x1a\x43Returns information about a network classification for the company.*\x0fNetworkClassGet\xf2\xd7\x02\x18\x61\x64min.network_class:read\x82\xd3\xe4\x93\x02,\x12*/network_class/v202109alpha1/network_class\x12\xe9\x02\n\x12UpdateNetworkClass\x12=.kentik.network_class.v202109alpha1.UpdateNetworkClassRequest\x1a>.kentik.network_class.v202109alpha1.UpdateNetworkClassResponse\"\xd3\x01\x92\x41~\x12 Update a network classification.\x1a\x46Replaces the entire network classification attributes for the company.*\x12NetworkClassUpdate\xf2\xd7\x02\x19\x61\x64min.network_class:write\x82\xd3\xe4\x93\x02/\"*/network_class/v202109alpha1/network_class:\x01*\x1a\x31\xca\x41\x13grpc.api.kentik.com\xea\xd7\x02\x13\x61\x64min.network_class\x90\xd8\x02\x03\x42\xdc\x02ZTgithub.com/kentik/api-schema/gen/go/kentik/network_class/v202109alpha1;network_class\x92\x41\x82\x02\x12\x44\n\x1aNetwork Classification API\"\x18\n\x16Kentik API Engineering2\x0c\x32\x30\x32\x31\x30\x39\x61lpha1*\x01\x02\x32\x10\x61pplication/json:\x10\x61pplication/jsonZD\n\x1e\n\x05\x65mail\x12\x15\x08\x02\x1a\x0fX-CH-Auth-Email \x02\n\"\n\x05token\x12\x19\x08\x02\x1a\x13X-CH-Auth-API-Token \x02\x62\x16\n\t\n\x05\x65mail\x12\x00\n\t\n\x05token\x12\x00r5\n\x16More about Kentik APIs\x12\x1bhttps://docs.kentik.com/apib\x06proto3'
  ,
  dependencies=[google_dot_api_dot_annotations__pb2.DESCRIPTOR,google_dot_api_dot_client__pb2.DESCRIPTOR,protoc__gen__openapiv2_dot_options_dot_annotations__pb2.DESCRIPTOR,kentik_dot_core_dot_v202012alpha1_dot_annotations__pb2.DESCRIPTOR,])

_CLOUDTYPE = _descriptor.EnumDescriptor(
  name='CloudType',
  full_name='kentik.network_class.v202109alpha1.CloudType',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='CLOUD_TYPE_UNSPECIFIED', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='CLOUD_TYPE_AWS', index=1, number=1,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='CLOUD_TYPE_AZURE', index=2, number=2,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='CLOUD_TYPE_GCE', index=3, number=3,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='CLOUD_TYPE_IBM', index=4, number=4,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=988,
  serialized_end=1109,
)
_sym_db.RegisterEnumDescriptor(_CLOUDTYPE)

CloudType = enum_type_wrapper.EnumTypeWrapper(_CLOUDTYPE)
CLOUD_TYPE_UNSPECIFIED = 0
CLOUD_TYPE_AWS = 1
CLOUD_TYPE_AZURE = 2
CLOUD_TYPE_GCE = 3
CLOUD_TYPE_IBM = 4



_CLOUDSUBNET = _descriptor.Descriptor(
  name='CloudSubnet',
  full_name='kentik.network_class.v202109alpha1.CloudSubnet',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='type', full_name='kentik.network_class.v202109alpha1.CloudSubnet.type', index=0,
      number=1, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='type', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='subnets', full_name='kentik.network_class.v202109alpha1.CloudSubnet.subnets', index=1,
      number=2, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='subnets', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=242,
  serialized_end=348,
)


_NETWORKCLASS = _descriptor.Descriptor(
  name='NetworkClass',
  full_name='kentik.network_class.v202109alpha1.NetworkClass',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='internal_asns', full_name='kentik.network_class.v202109alpha1.NetworkClass.internal_asns', index=0,
      number=1, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='internalAsns', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='internal_ips', full_name='kentik.network_class.v202109alpha1.NetworkClass.internal_ips', index=1,
      number=2, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='internalIps', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='use_private_asns', full_name='kentik.network_class.v202109alpha1.NetworkClass.use_private_asns', index=2,
      number=3, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='usePrivateAsns', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='use_private_subnets', full_name='kentik.network_class.v202109alpha1.NetworkClass.use_private_subnets', index=3,
      number=4, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='usePrivateSubnets', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='cloud_subnets', full_name='kentik.network_class.v202109alpha1.NetworkClass.cloud_subnets', index=4,
      number=5, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='cloudSubnets', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=351,
  serialized_end=613,
)


_GETNETWORKCLASSREQUEST = _descriptor.Descriptor(
  name='GetNetworkClassRequest',
  full_name='kentik.network_class.v202109alpha1.GetNetworkClassRequest',
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
  serialized_start=615,
  serialized_end=639,
)


_GETNETWORKCLASSRESPONSE = _descriptor.Descriptor(
  name='GetNetworkClassResponse',
  full_name='kentik.network_class.v202109alpha1.GetNetworkClassResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='network_class', full_name='kentik.network_class.v202109alpha1.GetNetworkClassResponse.network_class', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='networkClass', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=641,
  serialized_end=753,
)


_UPDATENETWORKCLASSREQUEST = _descriptor.Descriptor(
  name='UpdateNetworkClassRequest',
  full_name='kentik.network_class.v202109alpha1.UpdateNetworkClassRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='network_class', full_name='kentik.network_class.v202109alpha1.UpdateNetworkClassRequest.network_class', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='networkClass', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=755,
  serialized_end=869,
)


_UPDATENETWORKCLASSRESPONSE = _descriptor.Descriptor(
  name='UpdateNetworkClassResponse',
  full_name='kentik.network_class.v202109alpha1.UpdateNetworkClassResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='network_class', full_name='kentik.network_class.v202109alpha1.UpdateNetworkClassResponse.network_class', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='networkClass', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=871,
  serialized_end=986,
)

_CLOUDSUBNET.fields_by_name['type'].enum_type = _CLOUDTYPE
_NETWORKCLASS.fields_by_name['cloud_subnets'].message_type = _CLOUDSUBNET
_GETNETWORKCLASSRESPONSE.fields_by_name['network_class'].message_type = _NETWORKCLASS
_UPDATENETWORKCLASSREQUEST.fields_by_name['network_class'].message_type = _NETWORKCLASS
_UPDATENETWORKCLASSRESPONSE.fields_by_name['network_class'].message_type = _NETWORKCLASS
DESCRIPTOR.message_types_by_name['CloudSubnet'] = _CLOUDSUBNET
DESCRIPTOR.message_types_by_name['NetworkClass'] = _NETWORKCLASS
DESCRIPTOR.message_types_by_name['GetNetworkClassRequest'] = _GETNETWORKCLASSREQUEST
DESCRIPTOR.message_types_by_name['GetNetworkClassResponse'] = _GETNETWORKCLASSRESPONSE
DESCRIPTOR.message_types_by_name['UpdateNetworkClassRequest'] = _UPDATENETWORKCLASSREQUEST
DESCRIPTOR.message_types_by_name['UpdateNetworkClassResponse'] = _UPDATENETWORKCLASSRESPONSE
DESCRIPTOR.enum_types_by_name['CloudType'] = _CLOUDTYPE
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

CloudSubnet = _reflection.GeneratedProtocolMessageType('CloudSubnet', (_message.Message,), {
  'DESCRIPTOR' : _CLOUDSUBNET,
  '__module__' : 'kentik.network_class.v202109alpha1.network_class_pb2'
  # @@protoc_insertion_point(class_scope:kentik.network_class.v202109alpha1.CloudSubnet)
  })
_sym_db.RegisterMessage(CloudSubnet)

NetworkClass = _reflection.GeneratedProtocolMessageType('NetworkClass', (_message.Message,), {
  'DESCRIPTOR' : _NETWORKCLASS,
  '__module__' : 'kentik.network_class.v202109alpha1.network_class_pb2'
  # @@protoc_insertion_point(class_scope:kentik.network_class.v202109alpha1.NetworkClass)
  })
_sym_db.RegisterMessage(NetworkClass)

GetNetworkClassRequest = _reflection.GeneratedProtocolMessageType('GetNetworkClassRequest', (_message.Message,), {
  'DESCRIPTOR' : _GETNETWORKCLASSREQUEST,
  '__module__' : 'kentik.network_class.v202109alpha1.network_class_pb2'
  # @@protoc_insertion_point(class_scope:kentik.network_class.v202109alpha1.GetNetworkClassRequest)
  })
_sym_db.RegisterMessage(GetNetworkClassRequest)

GetNetworkClassResponse = _reflection.GeneratedProtocolMessageType('GetNetworkClassResponse', (_message.Message,), {
  'DESCRIPTOR' : _GETNETWORKCLASSRESPONSE,
  '__module__' : 'kentik.network_class.v202109alpha1.network_class_pb2'
  # @@protoc_insertion_point(class_scope:kentik.network_class.v202109alpha1.GetNetworkClassResponse)
  })
_sym_db.RegisterMessage(GetNetworkClassResponse)

UpdateNetworkClassRequest = _reflection.GeneratedProtocolMessageType('UpdateNetworkClassRequest', (_message.Message,), {
  'DESCRIPTOR' : _UPDATENETWORKCLASSREQUEST,
  '__module__' : 'kentik.network_class.v202109alpha1.network_class_pb2'
  # @@protoc_insertion_point(class_scope:kentik.network_class.v202109alpha1.UpdateNetworkClassRequest)
  })
_sym_db.RegisterMessage(UpdateNetworkClassRequest)

UpdateNetworkClassResponse = _reflection.GeneratedProtocolMessageType('UpdateNetworkClassResponse', (_message.Message,), {
  'DESCRIPTOR' : _UPDATENETWORKCLASSRESPONSE,
  '__module__' : 'kentik.network_class.v202109alpha1.network_class_pb2'
  # @@protoc_insertion_point(class_scope:kentik.network_class.v202109alpha1.UpdateNetworkClassResponse)
  })
_sym_db.RegisterMessage(UpdateNetworkClassResponse)


DESCRIPTOR._options = None

_NETWORKCLASSSERVICE = _descriptor.ServiceDescriptor(
  name='NetworkClassService',
  full_name='kentik.network_class.v202109alpha1.NetworkClassService',
  file=DESCRIPTOR,
  index=0,
  serialized_options=b'\312A\023grpc.api.kentik.com\352\327\002\023admin.network_class\220\330\002\003',
  create_key=_descriptor._internal_create_key,
  serialized_start=1112,
  serialized_end=1890,
  methods=[
  _descriptor.MethodDescriptor(
    name='GetNetworkClass',
    full_name='kentik.network_class.v202109alpha1.NetworkClassService.GetNetworkClass',
    index=0,
    containing_service=None,
    input_type=_GETNETWORKCLASSREQUEST,
    output_type=_GETNETWORKCLASSRESPONSE,
    serialized_options=b'\222Au\022\035Get a network classification.\032CReturns information about a network classification for the company.*\017NetworkClassGet\362\327\002\030admin.network_class:read\202\323\344\223\002,\022*/network_class/v202109alpha1/network_class',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='UpdateNetworkClass',
    full_name='kentik.network_class.v202109alpha1.NetworkClassService.UpdateNetworkClass',
    index=1,
    containing_service=None,
    input_type=_UPDATENETWORKCLASSREQUEST,
    output_type=_UPDATENETWORKCLASSRESPONSE,
    serialized_options=b'\222A~\022 Update a network classification.\032FReplaces the entire network classification attributes for the company.*\022NetworkClassUpdate\362\327\002\031admin.network_class:write\202\323\344\223\002/\"*/network_class/v202109alpha1/network_class:\001*',
    create_key=_descriptor._internal_create_key,
  ),
])
_sym_db.RegisterServiceDescriptor(_NETWORKCLASSSERVICE)

DESCRIPTOR.services_by_name['NetworkClassService'] = _NETWORKCLASSSERVICE

# @@protoc_insertion_point(module_scope)