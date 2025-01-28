# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/diagnostic/v202501/diagnostic.proto

from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.api import client_pb2 as google_dot_api_dot_client__pb2
from kentik.core.v202303 import annotations_pb2 as kentik_dot_core_dot_v202303_dot_annotations__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='kentik/diagnostic/v202501/diagnostic.proto',
  package='kentik.diagnostic.v202501',
  syntax='proto3',
  serialized_options=b'ZOgithub.com/kentik/api-schema-public/gen/go/kentik/diagnostic/v202501;diagnostic',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n*kentik/diagnostic/v202501/diagnostic.proto\x12\x19kentik.diagnostic.v202501\x1a\x17google/api/client.proto\x1a%kentik/core/v202303/annotations.proto\"\'\n\x0b\x45\x63hoRequest\x12\x18\n\x07message\x18\x01 \x01(\tR\x07message\"(\n\x0c\x45\x63hoResponse\x12\x18\n\x07message\x18\x01 \x01(\tR\x07message\"\xd0\x01\n\x0b\x43hatRequest\x12\x1d\n\nmessage_id\x18\x01 \x01(\tR\tmessageId\x12K\n\x0c\x65\x63ho_request\x18\x02 \x01(\x0b\x32&.kentik.diagnostic.v202501.EchoRequestH\x00R\x0b\x65\x63hoRequest\x12N\n\recho_response\x18\x03 \x01(\x0b\x32\'.kentik.diagnostic.v202501.EchoResponseH\x00R\x0c\x65\x63hoResponseB\x05\n\x03msg\"\xd1\x01\n\x0c\x43hatResponse\x12\x1d\n\nmessage_id\x18\x01 \x01(\tR\tmessageId\x12K\n\x0c\x65\x63ho_request\x18\x02 \x01(\x0b\x32&.kentik.diagnostic.v202501.EchoRequestH\x00R\x0b\x65\x63hoRequest\x12N\n\recho_response\x18\x03 \x01(\x0b\x32\'.kentik.diagnostic.v202501.EchoResponseH\x00R\x0c\x65\x63hoResponseB\x05\n\x03msg2\xfd\x01\n\x11\x44iagnosticService\x12\x63\n\x04\x45\x63ho\x12&.kentik.diagnostic.v202501.EchoRequest\x1a\'.kentik.diagnostic.v202501.EchoResponse\"\n\xf2\xd7\x02\x06PUBLIC\x12g\n\x04\x43hat\x12&.kentik.diagnostic.v202501.ChatRequest\x1a\'.kentik.diagnostic.v202501.ChatResponse\"\n\xf2\xd7\x02\x06PUBLIC(\x01\x30\x01\x1a\x1a\xca\x41\x13grpc.api.kentik.com\x90\xd8\x02\x04\x42QZOgithub.com/kentik/api-schema-public/gen/go/kentik/diagnostic/v202501;diagnosticb\x06proto3'
  ,
  dependencies=[google_dot_api_dot_client__pb2.DESCRIPTOR,kentik_dot_core_dot_v202303_dot_annotations__pb2.DESCRIPTOR,])




_ECHOREQUEST = _descriptor.Descriptor(
  name='EchoRequest',
  full_name='kentik.diagnostic.v202501.EchoRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='message', full_name='kentik.diagnostic.v202501.EchoRequest.message', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='message', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=137,
  serialized_end=176,
)


_ECHORESPONSE = _descriptor.Descriptor(
  name='EchoResponse',
  full_name='kentik.diagnostic.v202501.EchoResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='message', full_name='kentik.diagnostic.v202501.EchoResponse.message', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='message', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=178,
  serialized_end=218,
)


_CHATREQUEST = _descriptor.Descriptor(
  name='ChatRequest',
  full_name='kentik.diagnostic.v202501.ChatRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='message_id', full_name='kentik.diagnostic.v202501.ChatRequest.message_id', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='messageId', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='echo_request', full_name='kentik.diagnostic.v202501.ChatRequest.echo_request', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='echoRequest', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='echo_response', full_name='kentik.diagnostic.v202501.ChatRequest.echo_response', index=2,
      number=3, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='echoResponse', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
    _descriptor.OneofDescriptor(
      name='msg', full_name='kentik.diagnostic.v202501.ChatRequest.msg',
      index=0, containing_type=None,
      create_key=_descriptor._internal_create_key,
    fields=[]),
  ],
  serialized_start=221,
  serialized_end=429,
)


_CHATRESPONSE = _descriptor.Descriptor(
  name='ChatResponse',
  full_name='kentik.diagnostic.v202501.ChatResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='message_id', full_name='kentik.diagnostic.v202501.ChatResponse.message_id', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='messageId', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='echo_request', full_name='kentik.diagnostic.v202501.ChatResponse.echo_request', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='echoRequest', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='echo_response', full_name='kentik.diagnostic.v202501.ChatResponse.echo_response', index=2,
      number=3, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='echoResponse', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
    _descriptor.OneofDescriptor(
      name='msg', full_name='kentik.diagnostic.v202501.ChatResponse.msg',
      index=0, containing_type=None,
      create_key=_descriptor._internal_create_key,
    fields=[]),
  ],
  serialized_start=432,
  serialized_end=641,
)

_CHATREQUEST.fields_by_name['echo_request'].message_type = _ECHOREQUEST
_CHATREQUEST.fields_by_name['echo_response'].message_type = _ECHORESPONSE
_CHATREQUEST.oneofs_by_name['msg'].fields.append(
  _CHATREQUEST.fields_by_name['echo_request'])
_CHATREQUEST.fields_by_name['echo_request'].containing_oneof = _CHATREQUEST.oneofs_by_name['msg']
_CHATREQUEST.oneofs_by_name['msg'].fields.append(
  _CHATREQUEST.fields_by_name['echo_response'])
_CHATREQUEST.fields_by_name['echo_response'].containing_oneof = _CHATREQUEST.oneofs_by_name['msg']
_CHATRESPONSE.fields_by_name['echo_request'].message_type = _ECHOREQUEST
_CHATRESPONSE.fields_by_name['echo_response'].message_type = _ECHORESPONSE
_CHATRESPONSE.oneofs_by_name['msg'].fields.append(
  _CHATRESPONSE.fields_by_name['echo_request'])
_CHATRESPONSE.fields_by_name['echo_request'].containing_oneof = _CHATRESPONSE.oneofs_by_name['msg']
_CHATRESPONSE.oneofs_by_name['msg'].fields.append(
  _CHATRESPONSE.fields_by_name['echo_response'])
_CHATRESPONSE.fields_by_name['echo_response'].containing_oneof = _CHATRESPONSE.oneofs_by_name['msg']
DESCRIPTOR.message_types_by_name['EchoRequest'] = _ECHOREQUEST
DESCRIPTOR.message_types_by_name['EchoResponse'] = _ECHORESPONSE
DESCRIPTOR.message_types_by_name['ChatRequest'] = _CHATREQUEST
DESCRIPTOR.message_types_by_name['ChatResponse'] = _CHATRESPONSE
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

EchoRequest = _reflection.GeneratedProtocolMessageType('EchoRequest', (_message.Message,), {
  'DESCRIPTOR' : _ECHOREQUEST,
  '__module__' : 'kentik.diagnostic.v202501.diagnostic_pb2'
  # @@protoc_insertion_point(class_scope:kentik.diagnostic.v202501.EchoRequest)
  })
_sym_db.RegisterMessage(EchoRequest)

EchoResponse = _reflection.GeneratedProtocolMessageType('EchoResponse', (_message.Message,), {
  'DESCRIPTOR' : _ECHORESPONSE,
  '__module__' : 'kentik.diagnostic.v202501.diagnostic_pb2'
  # @@protoc_insertion_point(class_scope:kentik.diagnostic.v202501.EchoResponse)
  })
_sym_db.RegisterMessage(EchoResponse)

ChatRequest = _reflection.GeneratedProtocolMessageType('ChatRequest', (_message.Message,), {
  'DESCRIPTOR' : _CHATREQUEST,
  '__module__' : 'kentik.diagnostic.v202501.diagnostic_pb2'
  # @@protoc_insertion_point(class_scope:kentik.diagnostic.v202501.ChatRequest)
  })
_sym_db.RegisterMessage(ChatRequest)

ChatResponse = _reflection.GeneratedProtocolMessageType('ChatResponse', (_message.Message,), {
  'DESCRIPTOR' : _CHATRESPONSE,
  '__module__' : 'kentik.diagnostic.v202501.diagnostic_pb2'
  # @@protoc_insertion_point(class_scope:kentik.diagnostic.v202501.ChatResponse)
  })
_sym_db.RegisterMessage(ChatResponse)


DESCRIPTOR._options = None

_DIAGNOSTICSERVICE = _descriptor.ServiceDescriptor(
  name='DiagnosticService',
  full_name='kentik.diagnostic.v202501.DiagnosticService',
  file=DESCRIPTOR,
  index=0,
  serialized_options=b'\312A\023grpc.api.kentik.com\220\330\002\004',
  create_key=_descriptor._internal_create_key,
  serialized_start=644,
  serialized_end=897,
  methods=[
  _descriptor.MethodDescriptor(
    name='Echo',
    full_name='kentik.diagnostic.v202501.DiagnosticService.Echo',
    index=0,
    containing_service=None,
    input_type=_ECHOREQUEST,
    output_type=_ECHORESPONSE,
    serialized_options=b'\362\327\002\006PUBLIC',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='Chat',
    full_name='kentik.diagnostic.v202501.DiagnosticService.Chat',
    index=1,
    containing_service=None,
    input_type=_CHATREQUEST,
    output_type=_CHATRESPONSE,
    serialized_options=b'\362\327\002\006PUBLIC',
    create_key=_descriptor._internal_create_key,
  ),
])
_sym_db.RegisterServiceDescriptor(_DIAGNOSTICSERVICE)

DESCRIPTOR.services_by_name['DiagnosticService'] = _DIAGNOSTICSERVICE

# @@protoc_insertion_point(module_scope)