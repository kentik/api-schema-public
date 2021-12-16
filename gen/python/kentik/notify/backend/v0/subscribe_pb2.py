# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/notify/backend/v0/subscribe.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='kentik/notify/backend/v0/subscribe.proto',
  package='kentik.api.notify.v0',
  syntax='proto3',
  serialized_options=b'Z\037kentik/notify/backend/v0;notify',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n(kentik/notify/backend/v0/subscribe.proto\x12\x14kentik.api.notify.v0\"\x1a\n\x18\x43reateUserChannelRequest\"\x1b\n\x19\x43reateUserChannelResponse\">\n\x10SubscribeRequest\x12\x13\n\x0binsightName\x18\x01 \x01(\t\x12\x15\n\rinsightFamily\x18\x02 \x01(\t\"\x13\n\x11SubscribeResponseB!Z\x1fkentik/notify/backend/v0;notifyb\x06proto3'
)




_CREATEUSERCHANNELREQUEST = _descriptor.Descriptor(
  name='CreateUserChannelRequest',
  full_name='kentik.api.notify.v0.CreateUserChannelRequest',
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
  serialized_start=66,
  serialized_end=92,
)


_CREATEUSERCHANNELRESPONSE = _descriptor.Descriptor(
  name='CreateUserChannelResponse',
  full_name='kentik.api.notify.v0.CreateUserChannelResponse',
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
  serialized_start=94,
  serialized_end=121,
)


_SUBSCRIBEREQUEST = _descriptor.Descriptor(
  name='SubscribeRequest',
  full_name='kentik.api.notify.v0.SubscribeRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='insightName', full_name='kentik.api.notify.v0.SubscribeRequest.insightName', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='insightFamily', full_name='kentik.api.notify.v0.SubscribeRequest.insightFamily', index=1,
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
  serialized_start=123,
  serialized_end=185,
)


_SUBSCRIBERESPONSE = _descriptor.Descriptor(
  name='SubscribeResponse',
  full_name='kentik.api.notify.v0.SubscribeResponse',
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
  serialized_start=187,
  serialized_end=206,
)

DESCRIPTOR.message_types_by_name['CreateUserChannelRequest'] = _CREATEUSERCHANNELREQUEST
DESCRIPTOR.message_types_by_name['CreateUserChannelResponse'] = _CREATEUSERCHANNELRESPONSE
DESCRIPTOR.message_types_by_name['SubscribeRequest'] = _SUBSCRIBEREQUEST
DESCRIPTOR.message_types_by_name['SubscribeResponse'] = _SUBSCRIBERESPONSE
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

CreateUserChannelRequest = _reflection.GeneratedProtocolMessageType('CreateUserChannelRequest', (_message.Message,), {
  'DESCRIPTOR' : _CREATEUSERCHANNELREQUEST,
  '__module__' : 'kentik.notify.backend.v0.subscribe_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.CreateUserChannelRequest)
  })
_sym_db.RegisterMessage(CreateUserChannelRequest)

CreateUserChannelResponse = _reflection.GeneratedProtocolMessageType('CreateUserChannelResponse', (_message.Message,), {
  'DESCRIPTOR' : _CREATEUSERCHANNELRESPONSE,
  '__module__' : 'kentik.notify.backend.v0.subscribe_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.CreateUserChannelResponse)
  })
_sym_db.RegisterMessage(CreateUserChannelResponse)

SubscribeRequest = _reflection.GeneratedProtocolMessageType('SubscribeRequest', (_message.Message,), {
  'DESCRIPTOR' : _SUBSCRIBEREQUEST,
  '__module__' : 'kentik.notify.backend.v0.subscribe_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.SubscribeRequest)
  })
_sym_db.RegisterMessage(SubscribeRequest)

SubscribeResponse = _reflection.GeneratedProtocolMessageType('SubscribeResponse', (_message.Message,), {
  'DESCRIPTOR' : _SUBSCRIBERESPONSE,
  '__module__' : 'kentik.notify.backend.v0.subscribe_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.SubscribeResponse)
  })
_sym_db.RegisterMessage(SubscribeResponse)


DESCRIPTOR._options = None
# @@protoc_insertion_point(module_scope)