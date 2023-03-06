# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/core/v202303/user_info.proto

from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from protoc_gen_openapiv2.options import annotations_pb2 as protoc__gen__openapiv2_dot_options_dot_annotations__pb2
from google.api import field_behavior_pb2 as google_dot_api_dot_field__behavior__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='kentik/core/v202303/user_info.proto',
  package='kentik.core.v202303',
  syntax='proto3',
  serialized_options=b'ZEgithub.com/kentik/api-schema-public/go/kentik/core/v202303;kentik_api',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n#kentik/core/v202303/user_info.proto\x12\x13kentik.core.v202303\x1a.protoc-gen-openapiv2/options/annotations.proto\x1a\x1fgoogle/api/field_behavior.proto\"\xb7\x01\n\x08UserInfo\x12\x33\n\x02id\x18\x01 \x01(\tB#\x92\x41\x1c\x32\x1aUnique system generated ID\xe2\x41\x01\x03R\x02id\x12\x39\n\x05\x65mail\x18\x02 \x01(\tB#\x92\x41\x1c\x32\x1a\x45-mail address of the user\xe2\x41\x01\x03R\x05\x65mail\x12;\n\tfull_name\x18\x03 \x01(\tB\x1e\x92\x41\x17\x32\x15\x46ull name of the user\xe2\x41\x01\x03R\x08\x66ullNameBGZEgithub.com/kentik/api-schema-public/go/kentik/core/v202303;kentik_apib\x06proto3'
  ,
  dependencies=[protoc__gen__openapiv2_dot_options_dot_annotations__pb2.DESCRIPTOR,google_dot_api_dot_field__behavior__pb2.DESCRIPTOR,])




_USERINFO = _descriptor.Descriptor(
  name='UserInfo',
  full_name='kentik.core.v202303.UserInfo',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='kentik.core.v202303.UserInfo.id', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\0342\032Unique system generated ID\342A\001\003', json_name='id', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='email', full_name='kentik.core.v202303.UserInfo.email', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\0342\032E-mail address of the user\342A\001\003', json_name='email', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='full_name', full_name='kentik.core.v202303.UserInfo.full_name', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\0272\025Full name of the user\342A\001\003', json_name='fullName', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=142,
  serialized_end=325,
)

DESCRIPTOR.message_types_by_name['UserInfo'] = _USERINFO
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

UserInfo = _reflection.GeneratedProtocolMessageType('UserInfo', (_message.Message,), {
  'DESCRIPTOR' : _USERINFO,
  '__module__' : 'kentik.core.v202303.user_info_pb2'
  # @@protoc_insertion_point(class_scope:kentik.core.v202303.UserInfo)
  })
_sym_db.RegisterMessage(UserInfo)


DESCRIPTOR._options = None
_USERINFO.fields_by_name['id']._options = None
_USERINFO.fields_by_name['email']._options = None
_USERINFO.fields_by_name['full_name']._options = None
# @@protoc_insertion_point(module_scope)
