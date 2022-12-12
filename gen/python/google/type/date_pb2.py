# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/type/date.proto

from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='google/type/date.proto',
  package='google.type',
  syntax='proto3',
  serialized_options=b'\n\017com.google.typeB\tDateProtoP\001Z4google.golang.org/genproto/googleapis/type/date;date\370\001\001\242\002\003GTP',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n\x16google/type/date.proto\x12\x0bgoogle.type\"B\n\x04\x44\x61te\x12\x12\n\x04year\x18\x01 \x01(\x05R\x04year\x12\x14\n\x05month\x18\x02 \x01(\x05R\x05month\x12\x10\n\x03\x64\x61y\x18\x03 \x01(\x05R\x03\x64\x61yB]\n\x0f\x63om.google.typeB\tDateProtoP\x01Z4google.golang.org/genproto/googleapis/type/date;date\xf8\x01\x01\xa2\x02\x03GTPb\x06proto3'
)




_DATE = _descriptor.Descriptor(
  name='Date',
  full_name='google.type.Date',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='year', full_name='google.type.Date.year', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='year', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='month', full_name='google.type.Date.month', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='month', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='day', full_name='google.type.Date.day', index=2,
      number=3, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='day', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=39,
  serialized_end=105,
)

DESCRIPTOR.message_types_by_name['Date'] = _DATE
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

Date = _reflection.GeneratedProtocolMessageType('Date', (_message.Message,), {
  'DESCRIPTOR' : _DATE,
  '__module__' : 'google.type.date_pb2'
  # @@protoc_insertion_point(class_scope:google.type.Date)
  })
_sym_db.RegisterMessage(Date)


DESCRIPTOR._options = None
# @@protoc_insertion_point(module_scope)
