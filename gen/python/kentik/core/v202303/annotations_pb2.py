# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/core/v202303/annotations.proto

from google.protobuf.internal import enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.protobuf import descriptor_pb2 as google_dot_protobuf_dot_descriptor__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='kentik/core/v202303/annotations.proto',
  package='kentik.core.v202303',
  syntax='proto3',
  serialized_options=b'ZJgithub.com/kentik/api-schema-public/gen/go/kentik/core/v202303;kentik_core',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n%kentik/core/v202303/annotations.proto\x12\x13kentik.core.v202303\x1a google/protobuf/descriptor.proto*\x95\x01\n\x11ServiceVisibility\x12\x1e\n\x1aSERVICE_VISIBILITY_PRIVATE\x10\x00\x12 \n\x1cSERVICE_VISIBILITY_PROTECTED\x10\x01\x12\x1f\n\x1bSERVICE_VISIBILITY_INTERNAL\x10\x02\x12\x1d\n\x19SERVICE_VISIBILITY_PUBLIC\x10\x03:E\n\rservice_scope\x12\x1f.google.protobuf.ServiceOptions\x18\xfd* \x01(\tR\x0cserviceScope:I\n\x0fprivate_service\x12\x1f.google.protobuf.ServiceOptions\x18\xff* \x01(\x08R\x0eprivateService:h\n\nvisibility\x12\x1f.google.protobuf.ServiceOptions\x18\x82+ \x01(\x0e\x32&.kentik.core.v202303.ServiceVisibilityR\nvisibility:B\n\x0cmethod_scope\x12\x1e.google.protobuf.MethodOptions\x18\xfe* \x01(\tR\x0bmethodScope:F\n\x0eprivate_method\x12\x1e.google.protobuf.MethodOptions\x18\x80+ \x01(\x08R\rprivateMethod:H\n\x0fmethod_category\x12\x1e.google.protobuf.MethodOptions\x18\x81+ \x01(\tR\x0emethodCategory:L\n\x11method_permission\x12\x1e.google.protobuf.MethodOptions\x18\x82+ \x01(\tR\x10methodPermissionBLZJgithub.com/kentik/api-schema-public/gen/go/kentik/core/v202303;kentik_coreb\x06proto3'
  ,
  dependencies=[google_dot_protobuf_dot_descriptor__pb2.DESCRIPTOR,])

_SERVICEVISIBILITY = _descriptor.EnumDescriptor(
  name='ServiceVisibility',
  full_name='kentik.core.v202303.ServiceVisibility',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='SERVICE_VISIBILITY_PRIVATE', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='SERVICE_VISIBILITY_PROTECTED', index=1, number=1,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='SERVICE_VISIBILITY_INTERNAL', index=2, number=2,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='SERVICE_VISIBILITY_PUBLIC', index=3, number=3,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=97,
  serialized_end=246,
)
_sym_db.RegisterEnumDescriptor(_SERVICEVISIBILITY)

ServiceVisibility = enum_type_wrapper.EnumTypeWrapper(_SERVICEVISIBILITY)
SERVICE_VISIBILITY_PRIVATE = 0
SERVICE_VISIBILITY_PROTECTED = 1
SERVICE_VISIBILITY_INTERNAL = 2
SERVICE_VISIBILITY_PUBLIC = 3

SERVICE_SCOPE_FIELD_NUMBER = 5501
service_scope = _descriptor.FieldDescriptor(
  name='service_scope', full_name='kentik.core.v202303.service_scope', index=0,
  number=5501, type=9, cpp_type=9, label=1,
  has_default_value=False, default_value=b"".decode('utf-8'),
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, json_name='serviceScope', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key)
PRIVATE_SERVICE_FIELD_NUMBER = 5503
private_service = _descriptor.FieldDescriptor(
  name='private_service', full_name='kentik.core.v202303.private_service', index=1,
  number=5503, type=8, cpp_type=7, label=1,
  has_default_value=False, default_value=False,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, json_name='privateService', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key)
VISIBILITY_FIELD_NUMBER = 5506
visibility = _descriptor.FieldDescriptor(
  name='visibility', full_name='kentik.core.v202303.visibility', index=2,
  number=5506, type=14, cpp_type=8, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, json_name='visibility', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key)
METHOD_SCOPE_FIELD_NUMBER = 5502
method_scope = _descriptor.FieldDescriptor(
  name='method_scope', full_name='kentik.core.v202303.method_scope', index=3,
  number=5502, type=9, cpp_type=9, label=1,
  has_default_value=False, default_value=b"".decode('utf-8'),
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, json_name='methodScope', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key)
PRIVATE_METHOD_FIELD_NUMBER = 5504
private_method = _descriptor.FieldDescriptor(
  name='private_method', full_name='kentik.core.v202303.private_method', index=4,
  number=5504, type=8, cpp_type=7, label=1,
  has_default_value=False, default_value=False,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, json_name='privateMethod', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key)
METHOD_CATEGORY_FIELD_NUMBER = 5505
method_category = _descriptor.FieldDescriptor(
  name='method_category', full_name='kentik.core.v202303.method_category', index=5,
  number=5505, type=9, cpp_type=9, label=1,
  has_default_value=False, default_value=b"".decode('utf-8'),
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, json_name='methodCategory', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key)
METHOD_PERMISSION_FIELD_NUMBER = 5506
method_permission = _descriptor.FieldDescriptor(
  name='method_permission', full_name='kentik.core.v202303.method_permission', index=6,
  number=5506, type=9, cpp_type=9, label=1,
  has_default_value=False, default_value=b"".decode('utf-8'),
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, json_name='methodPermission', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key)

DESCRIPTOR.enum_types_by_name['ServiceVisibility'] = _SERVICEVISIBILITY
DESCRIPTOR.extensions_by_name['service_scope'] = service_scope
DESCRIPTOR.extensions_by_name['private_service'] = private_service
DESCRIPTOR.extensions_by_name['visibility'] = visibility
DESCRIPTOR.extensions_by_name['method_scope'] = method_scope
DESCRIPTOR.extensions_by_name['private_method'] = private_method
DESCRIPTOR.extensions_by_name['method_category'] = method_category
DESCRIPTOR.extensions_by_name['method_permission'] = method_permission
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

google_dot_protobuf_dot_descriptor__pb2.ServiceOptions.RegisterExtension(service_scope)
google_dot_protobuf_dot_descriptor__pb2.ServiceOptions.RegisterExtension(private_service)
visibility.enum_type = _SERVICEVISIBILITY
google_dot_protobuf_dot_descriptor__pb2.ServiceOptions.RegisterExtension(visibility)
google_dot_protobuf_dot_descriptor__pb2.MethodOptions.RegisterExtension(method_scope)
google_dot_protobuf_dot_descriptor__pb2.MethodOptions.RegisterExtension(private_method)
google_dot_protobuf_dot_descriptor__pb2.MethodOptions.RegisterExtension(method_category)
google_dot_protobuf_dot_descriptor__pb2.MethodOptions.RegisterExtension(method_permission)

DESCRIPTOR._options = None
# @@protoc_insertion_point(module_scope)
