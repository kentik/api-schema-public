# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/core/v202012alpha1/annotations.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.protobuf import descriptor_pb2 as google_dot_protobuf_dot_descriptor__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='kentik/core/v202012alpha1/annotations.proto',
  package='kentik.core.v202012alpha1',
  syntax='proto3',
  serialized_options=b'ZHgithub.com/kentik/api-schema/gen/go/kentik/core/v202012alpha1;kentik_api',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n+kentik/core/v202012alpha1/annotations.proto\x12\x19kentik.core.v202012alpha1\x1a google/protobuf/descriptor.proto:7\n\rservice_scope\x12\x1f.google.protobuf.ServiceOptions\x18\xfd* \x01(\t:5\n\x0cmethod_scope\x12\x1e.google.protobuf.MethodOptions\x18\xfe* \x01(\tBJZHgithub.com/kentik/api-schema/gen/go/kentik/core/v202012alpha1;kentik_apib\x06proto3'
  ,
  dependencies=[google_dot_protobuf_dot_descriptor__pb2.DESCRIPTOR,])


SERVICE_SCOPE_FIELD_NUMBER = 5501
service_scope = _descriptor.FieldDescriptor(
  name='service_scope', full_name='kentik.core.v202012alpha1.service_scope', index=0,
  number=5501, type=9, cpp_type=9, label=1,
  has_default_value=False, default_value=b"".decode('utf-8'),
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key)
METHOD_SCOPE_FIELD_NUMBER = 5502
method_scope = _descriptor.FieldDescriptor(
  name='method_scope', full_name='kentik.core.v202012alpha1.method_scope', index=1,
  number=5502, type=9, cpp_type=9, label=1,
  has_default_value=False, default_value=b"".decode('utf-8'),
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key)

DESCRIPTOR.extensions_by_name['service_scope'] = service_scope
DESCRIPTOR.extensions_by_name['method_scope'] = method_scope
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

google_dot_protobuf_dot_descriptor__pb2.ServiceOptions.RegisterExtension(service_scope)
google_dot_protobuf_dot_descriptor__pb2.MethodOptions.RegisterExtension(method_scope)

DESCRIPTOR._options = None
# @@protoc_insertion_point(module_scope)