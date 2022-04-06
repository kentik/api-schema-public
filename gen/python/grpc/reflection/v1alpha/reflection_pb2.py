# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: grpc/reflection/v1alpha/reflection.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n(grpc/reflection/v1alpha/reflection.proto\x12\x17grpc.reflection.v1alpha\"\xf8\x02\n\x17ServerReflectionRequest\x12\x12\n\x04host\x18\x01 \x01(\tR\x04host\x12*\n\x10\x66ile_by_filename\x18\x03 \x01(\tH\x00R\x0e\x66ileByFilename\x12\x36\n\x16\x66ile_containing_symbol\x18\x04 \x01(\tH\x00R\x14\x66ileContainingSymbol\x12g\n\x19\x66ile_containing_extension\x18\x05 \x01(\x0b\x32).grpc.reflection.v1alpha.ExtensionRequestH\x00R\x17\x66ileContainingExtension\x12\x42\n\x1d\x61ll_extension_numbers_of_type\x18\x06 \x01(\tH\x00R\x19\x61llExtensionNumbersOfType\x12%\n\rlist_services\x18\x07 \x01(\tH\x00R\x0clistServicesB\x11\n\x0fmessage_request\"f\n\x10\x45xtensionRequest\x12\'\n\x0f\x63ontaining_type\x18\x01 \x01(\tR\x0e\x63ontainingType\x12)\n\x10\x65xtension_number\x18\x02 \x01(\x05R\x0f\x65xtensionNumber\"\xc7\x04\n\x18ServerReflectionResponse\x12\x1d\n\nvalid_host\x18\x01 \x01(\tR\tvalidHost\x12[\n\x10original_request\x18\x02 \x01(\x0b\x32\x30.grpc.reflection.v1alpha.ServerReflectionRequestR\x0foriginalRequest\x12k\n\x18\x66ile_descriptor_response\x18\x04 \x01(\x0b\x32/.grpc.reflection.v1alpha.FileDescriptorResponseH\x00R\x16\x66ileDescriptorResponse\x12w\n\x1e\x61ll_extension_numbers_response\x18\x05 \x01(\x0b\x32\x30.grpc.reflection.v1alpha.ExtensionNumberResponseH\x00R\x1b\x61llExtensionNumbersResponse\x12\x64\n\x16list_services_response\x18\x06 \x01(\x0b\x32,.grpc.reflection.v1alpha.ListServiceResponseH\x00R\x14listServicesResponse\x12O\n\x0e\x65rror_response\x18\x07 \x01(\x0b\x32&.grpc.reflection.v1alpha.ErrorResponseH\x00R\rerrorResponseB\x12\n\x10message_response\"L\n\x16\x46ileDescriptorResponse\x12\x32\n\x15\x66ile_descriptor_proto\x18\x01 \x03(\x0cR\x13\x66ileDescriptorProto\"j\n\x17\x45xtensionNumberResponse\x12$\n\x0e\x62\x61se_type_name\x18\x01 \x01(\tR\x0c\x62\x61seTypeName\x12)\n\x10\x65xtension_number\x18\x02 \x03(\x05R\x0f\x65xtensionNumber\"Y\n\x13ListServiceResponse\x12\x42\n\x07service\x18\x01 \x03(\x0b\x32(.grpc.reflection.v1alpha.ServiceResponseR\x07service\"%\n\x0fServiceResponse\x12\x12\n\x04name\x18\x01 \x01(\tR\x04name\"S\n\rErrorResponse\x12\x1d\n\nerror_code\x18\x01 \x01(\x05R\terrorCode\x12#\n\rerror_message\x18\x02 \x01(\tR\x0c\x65rrorMessage2\x93\x01\n\x10ServerReflection\x12\x7f\n\x14ServerReflectionInfo\x12\x30.grpc.reflection.v1alpha.ServerReflectionRequest\x1a\x31.grpc.reflection.v1alpha.ServerReflectionResponse(\x01\x30\x01\x62\x06proto3')



_SERVERREFLECTIONREQUEST = DESCRIPTOR.message_types_by_name['ServerReflectionRequest']
_EXTENSIONREQUEST = DESCRIPTOR.message_types_by_name['ExtensionRequest']
_SERVERREFLECTIONRESPONSE = DESCRIPTOR.message_types_by_name['ServerReflectionResponse']
_FILEDESCRIPTORRESPONSE = DESCRIPTOR.message_types_by_name['FileDescriptorResponse']
_EXTENSIONNUMBERRESPONSE = DESCRIPTOR.message_types_by_name['ExtensionNumberResponse']
_LISTSERVICERESPONSE = DESCRIPTOR.message_types_by_name['ListServiceResponse']
_SERVICERESPONSE = DESCRIPTOR.message_types_by_name['ServiceResponse']
_ERRORRESPONSE = DESCRIPTOR.message_types_by_name['ErrorResponse']
ServerReflectionRequest = _reflection.GeneratedProtocolMessageType('ServerReflectionRequest', (_message.Message,), {
  'DESCRIPTOR' : _SERVERREFLECTIONREQUEST,
  '__module__' : 'grpc.reflection.v1alpha.reflection_pb2'
  # @@protoc_insertion_point(class_scope:grpc.reflection.v1alpha.ServerReflectionRequest)
  })
_sym_db.RegisterMessage(ServerReflectionRequest)

ExtensionRequest = _reflection.GeneratedProtocolMessageType('ExtensionRequest', (_message.Message,), {
  'DESCRIPTOR' : _EXTENSIONREQUEST,
  '__module__' : 'grpc.reflection.v1alpha.reflection_pb2'
  # @@protoc_insertion_point(class_scope:grpc.reflection.v1alpha.ExtensionRequest)
  })
_sym_db.RegisterMessage(ExtensionRequest)

ServerReflectionResponse = _reflection.GeneratedProtocolMessageType('ServerReflectionResponse', (_message.Message,), {
  'DESCRIPTOR' : _SERVERREFLECTIONRESPONSE,
  '__module__' : 'grpc.reflection.v1alpha.reflection_pb2'
  # @@protoc_insertion_point(class_scope:grpc.reflection.v1alpha.ServerReflectionResponse)
  })
_sym_db.RegisterMessage(ServerReflectionResponse)

FileDescriptorResponse = _reflection.GeneratedProtocolMessageType('FileDescriptorResponse', (_message.Message,), {
  'DESCRIPTOR' : _FILEDESCRIPTORRESPONSE,
  '__module__' : 'grpc.reflection.v1alpha.reflection_pb2'
  # @@protoc_insertion_point(class_scope:grpc.reflection.v1alpha.FileDescriptorResponse)
  })
_sym_db.RegisterMessage(FileDescriptorResponse)

ExtensionNumberResponse = _reflection.GeneratedProtocolMessageType('ExtensionNumberResponse', (_message.Message,), {
  'DESCRIPTOR' : _EXTENSIONNUMBERRESPONSE,
  '__module__' : 'grpc.reflection.v1alpha.reflection_pb2'
  # @@protoc_insertion_point(class_scope:grpc.reflection.v1alpha.ExtensionNumberResponse)
  })
_sym_db.RegisterMessage(ExtensionNumberResponse)

ListServiceResponse = _reflection.GeneratedProtocolMessageType('ListServiceResponse', (_message.Message,), {
  'DESCRIPTOR' : _LISTSERVICERESPONSE,
  '__module__' : 'grpc.reflection.v1alpha.reflection_pb2'
  # @@protoc_insertion_point(class_scope:grpc.reflection.v1alpha.ListServiceResponse)
  })
_sym_db.RegisterMessage(ListServiceResponse)

ServiceResponse = _reflection.GeneratedProtocolMessageType('ServiceResponse', (_message.Message,), {
  'DESCRIPTOR' : _SERVICERESPONSE,
  '__module__' : 'grpc.reflection.v1alpha.reflection_pb2'
  # @@protoc_insertion_point(class_scope:grpc.reflection.v1alpha.ServiceResponse)
  })
_sym_db.RegisterMessage(ServiceResponse)

ErrorResponse = _reflection.GeneratedProtocolMessageType('ErrorResponse', (_message.Message,), {
  'DESCRIPTOR' : _ERRORRESPONSE,
  '__module__' : 'grpc.reflection.v1alpha.reflection_pb2'
  # @@protoc_insertion_point(class_scope:grpc.reflection.v1alpha.ErrorResponse)
  })
_sym_db.RegisterMessage(ErrorResponse)

_SERVERREFLECTION = DESCRIPTOR.services_by_name['ServerReflection']
if _descriptor._USE_C_DESCRIPTORS == False:

  DESCRIPTOR._options = None
  _SERVERREFLECTIONREQUEST._serialized_start=70
  _SERVERREFLECTIONREQUEST._serialized_end=446
  _EXTENSIONREQUEST._serialized_start=448
  _EXTENSIONREQUEST._serialized_end=550
  _SERVERREFLECTIONRESPONSE._serialized_start=553
  _SERVERREFLECTIONRESPONSE._serialized_end=1136
  _FILEDESCRIPTORRESPONSE._serialized_start=1138
  _FILEDESCRIPTORRESPONSE._serialized_end=1214
  _EXTENSIONNUMBERRESPONSE._serialized_start=1216
  _EXTENSIONNUMBERRESPONSE._serialized_end=1322
  _LISTSERVICERESPONSE._serialized_start=1324
  _LISTSERVICERESPONSE._serialized_end=1413
  _SERVICERESPONSE._serialized_start=1415
  _SERVICERESPONSE._serialized_end=1452
  _ERRORRESPONSE._serialized_start=1454
  _ERRORRESPONSE._serialized_end=1537
  _SERVERREFLECTION._serialized_start=1540
  _SERVERREFLECTION._serialized_end=1687
# @@protoc_insertion_point(module_scope)
