# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/label/v202210/label.proto

from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.api import annotations_pb2 as google_dot_api_dot_annotations__pb2
from google.api import field_behavior_pb2 as google_dot_api_dot_field__behavior__pb2
from google.api import client_pb2 as google_dot_api_dot_client__pb2
from protoc_gen_openapiv2.options import annotations_pb2 as protoc__gen__openapiv2_dot_options_dot_annotations__pb2
from kentik.core.v202012alpha1 import annotations_pb2 as kentik_dot_core_dot_v202012alpha1_dot_annotations__pb2
from google.protobuf import timestamp_pb2 as google_dot_protobuf_dot_timestamp__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='kentik/label/v202210/label.proto',
  package='kentik.label.v202210',
  syntax='proto3',
  serialized_options=b'Z>github.com/kentik/api-schema/gen/go/kentik/label/v202210;label\222A\352\r\022\203\014\n\024Label Management API\022\232\013# Overview\nThe Label API enables programmatic creation and management of labels, which are tags that can be applied to objects such as devices, synthetic tests, and ksynth agents in order to create logical groups. While this API is used to manage labels, the application of a label to a given object is done with the API corresponding to the type of that object (see Applying Labels via API).\n\nBoth gRPC RPCs and REST endpoints are provided.\n\n# Applying Labels via API\nThe Label API does not handle the application of labels to configuration objects. Instead, a label is applied to an object using the management API for that object. The table below lists the APIs for the types of objects to which labels may be applied.\n| Object type  | API for attaching labels |\n|--------------|--------------------------------------|\n| Device | [Device Apply Labels](https://kb.kentik.com/v0/Ec05.htm#Ec05-Device_Apply_Labels) |\n| Synthetic monitoring test | [SyntheticsAdminService API](https://kb.kentik.com/v0/Oa07.htm#Oa07-SyntheticsAdminService_API) |\n| Synthetic monitoring agent | [SyntheticsAdminService API](https://kb.kentik.com/v0/Oa07.htm#Oa07-SyntheticsAdminService_API) |\n| BGP monitor | [BgpMonitoringAdminService API ](https://kb.kentik.com/v0/Oa09.htm#Oa09-BgpMonitoringAdminService_API)|\n\n***Note:*** Device labels can be also managed using the legacy [Device Label API](https://kb.kentik.com/v0/Ec05.htm#Ec05-Device_Label_API).\"E\n\026Kentik API Engineering\022+https://github.com/kentik/api-schema-public2\007v202210*\001\0022\020application/json:\020application/jsonZD\n\036\n\005email\022\025\010\002\032\017X-CH-Auth-Email \002\n\"\n\005token\022\031\010\002\032\023X-CH-Auth-API-Token \002b\026\n\t\n\005email\022\000\n\t\n\005token\022\000r]\n%General information about Kentik APIs\0224https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_Overview',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n kentik/label/v202210/label.proto\x12\x14kentik.label.v202210\x1a\x1cgoogle/api/annotations.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x17google/api/client.proto\x1a.protoc-gen-openapiv2/options/annotations.proto\x1a+kentik/core/v202012alpha1/annotations.proto\x1a\x1fgoogle/protobuf/timestamp.proto\"\xe5\x04\n\x05Label\x12G\n\x02id\x18\x01 \x01(\tB7\x92\x41\x30\x32.Unique system assigned identifier of the label\xe2\x41\x01\x03R\x02id\x12s\n\x04name\x18\x02 \x01(\tB_\x92\x41X2VLabel text visible in listing of configuration of objects to which it has been applied\xe2\x41\x01\x02R\x04name\x12g\n\x0b\x64\x65scription\x18\x03 \x01(\tBE\x92\x41\x42\x32@Optional description of the label, visible only in API responsesR\x0b\x64\x65scription\x12\x81\x01\n\x05\x63olor\x18\x05 \x01(\tBk\x92\x41h2f[Hexadecimal code of the color](https://www.color-hex.com/) of the label text background in the portalR\x05\x63olor\x12S\n\x05\x63\x64\x61te\x18\x06 \x01(\x0b\x32\x1a.google.protobuf.TimestampB!\x92\x41\x1a\x32\x18\x43reation timestamp (UTC)\xe2\x41\x01\x03R\x05\x63\x64\x61te\x12\\\n\x05\x65\x64\x61te\x18\x07 \x01(\x0b\x32\x1a.google.protobuf.TimestampB*\x92\x41#2!Last modification timestamp (UTC)\xe2\x41\x01\x03R\x05\x65\x64\x61te\"\x13\n\x11ListLabelsRequest\"\xe9\x01\n\x12ListLabelsResponse\x12W\n\x06labels\x18\x01 \x03(\x0b\x32\x1b.kentik.label.v202210.LabelB\"\x92\x41\x1b\x32\x19List of configured labels\xe2\x41\x01\x03R\x06labels\x12z\n\rinvalid_count\x18\x02 \x01(\x05\x42U\x92\x41R2PNumber of invalid entries encountered while collecting data (should be always 0)R\x0cinvalidCount\"z\n\x12\x43reateLabelRequest\x12\x64\n\x05label\x18\x01 \x01(\x0b\x32\x1b.kentik.label.v202210.LabelB1\x92\x41*2(Configuration of the label to be created\xe2\x41\x01\x02R\x05label\"z\n\x13\x43reateLabelResponse\x12\x63\n\x05label\x18\x01 \x01(\x0b\x32\x1b.kentik.label.v202210.LabelB0\x92\x41)2\'Configuration of the just created label\xe2\x41\x01\x03R\x05label\"z\n\x12UpdateLabelRequest\x12\x64\n\x05label\x18\x01 \x01(\x0b\x32\x1b.kentik.label.v202210.LabelB1\x92\x41*2(Configuration of the label to be updated\xe2\x41\x01\x02R\x05label\"u\n\x13UpdateLabelResponse\x12^\n\x05label\x18\x01 \x01(\x0b\x32\x1b.kentik.label.v202210.LabelB+\x92\x41$2\"Updated configuration of the label\xe2\x41\x01\x03R\x05label\"L\n\x12\x44\x65leteLabelRequest\x12\x36\n\x02id\x18\x01 \x01(\tB&\x92\x41\x1f\x32\x1dID of the label to be deleted\xe2\x41\x01\x02R\x02id\"\x15\n\x13\x44\x65leteLabelResponse2\x82\x08\n\x0cLabelService\x12\xf5\x01\n\nListLabels\x12\'.kentik.label.v202210.ListLabelsRequest\x1a(.kentik.label.v202210.ListLabelsResponse\"\x93\x01\x92\x41_\x12\x1aList all configured labels\x1a\x35Returns list of all labels configured in the account.*\nListLabels\xf2\xd7\x02\x10\x61\x64min.label:read\x82\xd3\xe4\x93\x02\x17\x12\x15/label/v202210/labels\x12\xf2\x01\n\x0b\x43reateLabel\x12(.kentik.label.v202210.CreateLabelRequest\x1a).kentik.label.v202210.CreateLabelResponse\"\x8d\x01\x92\x41U\x12\x13\x43reate a new label.\x1a\x31\x43reates a new label based on data in the request.*\x0b\x43reateLabel\xf2\xd7\x02\x11\x61\x64min.label:write\x82\xd3\xe4\x93\x02\x1a\"\x15/label/v202210/labels:\x01*\x12\xf3\x01\n\x0bUpdateLabel\x12(.kentik.label.v202210.UpdateLabelRequest\x1a).kentik.label.v202210.UpdateLabelResponse\"\x8e\x01\x92\x41K\x12\x19Update an existing label.\x1a!Updates configuration of a label.*\x0bUpdateLabel\xf2\xd7\x02\x11\x61\x64min.label:write\x82\xd3\xe4\x93\x02%\" /label/v202210/labels/{label.id}:\x01*\x12\xe3\x01\n\x0b\x44\x65leteLabel\x12(.kentik.label.v202210.DeleteLabelRequest\x1a).kentik.label.v202210.DeleteLabelResponse\"\x7f\x92\x41\x45\x12\x0f\x44\x65lete a label.\x1a%Deletes label with specified with id.*\x0b\x44\x65leteLabel\xf2\xd7\x02\x11\x61\x64min.label:write\x82\xd3\xe4\x93\x02\x1c*\x1a/label/v202210/labels/{id}\x1a)\xca\x41\x13grpc.api.kentik.com\xea\xd7\x02\x0b\x61\x64min.label\x90\xd8\x02\x03\x42\xae\x0eZ>github.com/kentik/api-schema/gen/go/kentik/label/v202210;label\x92\x41\xea\r\x12\x83\x0c\n\x14Label Management API\x12\x9a\x0b# Overview\nThe Label API enables programmatic creation and management of labels, which are tags that can be applied to objects such as devices, synthetic tests, and ksynth agents in order to create logical groups. While this API is used to manage labels, the application of a label to a given object is done with the API corresponding to the type of that object (see Applying Labels via API).\n\nBoth gRPC RPCs and REST endpoints are provided.\n\n# Applying Labels via API\nThe Label API does not handle the application of labels to configuration objects. Instead, a label is applied to an object using the management API for that object. The table below lists the APIs for the types of objects to which labels may be applied.\n| Object type  | API for attaching labels |\n|--------------|--------------------------------------|\n| Device | [Device Apply Labels](https://kb.kentik.com/v0/Ec05.htm#Ec05-Device_Apply_Labels) |\n| Synthetic monitoring test | [SyntheticsAdminService API](https://kb.kentik.com/v0/Oa07.htm#Oa07-SyntheticsAdminService_API) |\n| Synthetic monitoring agent | [SyntheticsAdminService API](https://kb.kentik.com/v0/Oa07.htm#Oa07-SyntheticsAdminService_API) |\n| BGP monitor | [BgpMonitoringAdminService API ](https://kb.kentik.com/v0/Oa09.htm#Oa09-BgpMonitoringAdminService_API)|\n\n***Note:*** Device labels can be also managed using the legacy [Device Label API](https://kb.kentik.com/v0/Ec05.htm#Ec05-Device_Label_API).\"E\n\x16Kentik API Engineering\x12+https://github.com/kentik/api-schema-public2\x07v202210*\x01\x02\x32\x10\x61pplication/json:\x10\x61pplication/jsonZD\n\x1e\n\x05\x65mail\x12\x15\x08\x02\x1a\x0fX-CH-Auth-Email \x02\n\"\n\x05token\x12\x19\x08\x02\x1a\x13X-CH-Auth-API-Token \x02\x62\x16\n\t\n\x05\x65mail\x12\x00\n\t\n\x05token\x12\x00r]\n%General information about Kentik APIs\x12\x34https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_Overviewb\x06proto3'
  ,
  dependencies=[google_dot_api_dot_annotations__pb2.DESCRIPTOR,google_dot_api_dot_field__behavior__pb2.DESCRIPTOR,google_dot_api_dot_client__pb2.DESCRIPTOR,protoc__gen__openapiv2_dot_options_dot_annotations__pb2.DESCRIPTOR,kentik_dot_core_dot_v202012alpha1_dot_annotations__pb2.DESCRIPTOR,google_dot_protobuf_dot_timestamp__pb2.DESCRIPTOR,])




_LABEL = _descriptor.Descriptor(
  name='Label',
  full_name='kentik.label.v202210.Label',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='kentik.label.v202210.Label.id', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A02.Unique system assigned identifier of the label\342A\001\003', json_name='id', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='name', full_name='kentik.label.v202210.Label.name', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222AX2VLabel text visible in listing of configuration of objects to which it has been applied\342A\001\002', json_name='name', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='description', full_name='kentik.label.v202210.Label.description', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222AB2@Optional description of the label, visible only in API responses', json_name='description', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='color', full_name='kentik.label.v202210.Label.color', index=3,
      number=5, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222Ah2f[Hexadecimal code of the color](https://www.color-hex.com/) of the label text background in the portal', json_name='color', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='cdate', full_name='kentik.label.v202210.Label.cdate', index=4,
      number=6, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\0322\030Creation timestamp (UTC)\342A\001\003', json_name='cdate', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='edate', full_name='kentik.label.v202210.Label.edate', index=5,
      number=7, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A#2!Last modification timestamp (UTC)\342A\001\003', json_name='edate', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=273,
  serialized_end=886,
)


_LISTLABELSREQUEST = _descriptor.Descriptor(
  name='ListLabelsRequest',
  full_name='kentik.label.v202210.ListLabelsRequest',
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
  serialized_start=888,
  serialized_end=907,
)


_LISTLABELSRESPONSE = _descriptor.Descriptor(
  name='ListLabelsResponse',
  full_name='kentik.label.v202210.ListLabelsResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='labels', full_name='kentik.label.v202210.ListLabelsResponse.labels', index=0,
      number=1, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\0332\031List of configured labels\342A\001\003', json_name='labels', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='invalid_count', full_name='kentik.label.v202210.ListLabelsResponse.invalid_count', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222AR2PNumber of invalid entries encountered while collecting data (should be always 0)', json_name='invalidCount', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=910,
  serialized_end=1143,
)


_CREATELABELREQUEST = _descriptor.Descriptor(
  name='CreateLabelRequest',
  full_name='kentik.label.v202210.CreateLabelRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='label', full_name='kentik.label.v202210.CreateLabelRequest.label', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A*2(Configuration of the label to be created\342A\001\002', json_name='label', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1145,
  serialized_end=1267,
)


_CREATELABELRESPONSE = _descriptor.Descriptor(
  name='CreateLabelResponse',
  full_name='kentik.label.v202210.CreateLabelResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='label', full_name='kentik.label.v202210.CreateLabelResponse.label', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A)2\'Configuration of the just created label\342A\001\003', json_name='label', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1269,
  serialized_end=1391,
)


_UPDATELABELREQUEST = _descriptor.Descriptor(
  name='UpdateLabelRequest',
  full_name='kentik.label.v202210.UpdateLabelRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='label', full_name='kentik.label.v202210.UpdateLabelRequest.label', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A*2(Configuration of the label to be updated\342A\001\002', json_name='label', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1393,
  serialized_end=1515,
)


_UPDATELABELRESPONSE = _descriptor.Descriptor(
  name='UpdateLabelResponse',
  full_name='kentik.label.v202210.UpdateLabelResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='label', full_name='kentik.label.v202210.UpdateLabelResponse.label', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A$2\"Updated configuration of the label\342A\001\003', json_name='label', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1517,
  serialized_end=1634,
)


_DELETELABELREQUEST = _descriptor.Descriptor(
  name='DeleteLabelRequest',
  full_name='kentik.label.v202210.DeleteLabelRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='kentik.label.v202210.DeleteLabelRequest.id', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\0372\035ID of the label to be deleted\342A\001\002', json_name='id', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1636,
  serialized_end=1712,
)


_DELETELABELRESPONSE = _descriptor.Descriptor(
  name='DeleteLabelResponse',
  full_name='kentik.label.v202210.DeleteLabelResponse',
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
  serialized_start=1714,
  serialized_end=1735,
)

_LABEL.fields_by_name['cdate'].message_type = google_dot_protobuf_dot_timestamp__pb2._TIMESTAMP
_LABEL.fields_by_name['edate'].message_type = google_dot_protobuf_dot_timestamp__pb2._TIMESTAMP
_LISTLABELSRESPONSE.fields_by_name['labels'].message_type = _LABEL
_CREATELABELREQUEST.fields_by_name['label'].message_type = _LABEL
_CREATELABELRESPONSE.fields_by_name['label'].message_type = _LABEL
_UPDATELABELREQUEST.fields_by_name['label'].message_type = _LABEL
_UPDATELABELRESPONSE.fields_by_name['label'].message_type = _LABEL
DESCRIPTOR.message_types_by_name['Label'] = _LABEL
DESCRIPTOR.message_types_by_name['ListLabelsRequest'] = _LISTLABELSREQUEST
DESCRIPTOR.message_types_by_name['ListLabelsResponse'] = _LISTLABELSRESPONSE
DESCRIPTOR.message_types_by_name['CreateLabelRequest'] = _CREATELABELREQUEST
DESCRIPTOR.message_types_by_name['CreateLabelResponse'] = _CREATELABELRESPONSE
DESCRIPTOR.message_types_by_name['UpdateLabelRequest'] = _UPDATELABELREQUEST
DESCRIPTOR.message_types_by_name['UpdateLabelResponse'] = _UPDATELABELRESPONSE
DESCRIPTOR.message_types_by_name['DeleteLabelRequest'] = _DELETELABELREQUEST
DESCRIPTOR.message_types_by_name['DeleteLabelResponse'] = _DELETELABELRESPONSE
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

Label = _reflection.GeneratedProtocolMessageType('Label', (_message.Message,), {
  'DESCRIPTOR' : _LABEL,
  '__module__' : 'kentik.label.v202210.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202210.Label)
  })
_sym_db.RegisterMessage(Label)

ListLabelsRequest = _reflection.GeneratedProtocolMessageType('ListLabelsRequest', (_message.Message,), {
  'DESCRIPTOR' : _LISTLABELSREQUEST,
  '__module__' : 'kentik.label.v202210.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202210.ListLabelsRequest)
  })
_sym_db.RegisterMessage(ListLabelsRequest)

ListLabelsResponse = _reflection.GeneratedProtocolMessageType('ListLabelsResponse', (_message.Message,), {
  'DESCRIPTOR' : _LISTLABELSRESPONSE,
  '__module__' : 'kentik.label.v202210.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202210.ListLabelsResponse)
  })
_sym_db.RegisterMessage(ListLabelsResponse)

CreateLabelRequest = _reflection.GeneratedProtocolMessageType('CreateLabelRequest', (_message.Message,), {
  'DESCRIPTOR' : _CREATELABELREQUEST,
  '__module__' : 'kentik.label.v202210.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202210.CreateLabelRequest)
  })
_sym_db.RegisterMessage(CreateLabelRequest)

CreateLabelResponse = _reflection.GeneratedProtocolMessageType('CreateLabelResponse', (_message.Message,), {
  'DESCRIPTOR' : _CREATELABELRESPONSE,
  '__module__' : 'kentik.label.v202210.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202210.CreateLabelResponse)
  })
_sym_db.RegisterMessage(CreateLabelResponse)

UpdateLabelRequest = _reflection.GeneratedProtocolMessageType('UpdateLabelRequest', (_message.Message,), {
  'DESCRIPTOR' : _UPDATELABELREQUEST,
  '__module__' : 'kentik.label.v202210.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202210.UpdateLabelRequest)
  })
_sym_db.RegisterMessage(UpdateLabelRequest)

UpdateLabelResponse = _reflection.GeneratedProtocolMessageType('UpdateLabelResponse', (_message.Message,), {
  'DESCRIPTOR' : _UPDATELABELRESPONSE,
  '__module__' : 'kentik.label.v202210.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202210.UpdateLabelResponse)
  })
_sym_db.RegisterMessage(UpdateLabelResponse)

DeleteLabelRequest = _reflection.GeneratedProtocolMessageType('DeleteLabelRequest', (_message.Message,), {
  'DESCRIPTOR' : _DELETELABELREQUEST,
  '__module__' : 'kentik.label.v202210.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202210.DeleteLabelRequest)
  })
_sym_db.RegisterMessage(DeleteLabelRequest)

DeleteLabelResponse = _reflection.GeneratedProtocolMessageType('DeleteLabelResponse', (_message.Message,), {
  'DESCRIPTOR' : _DELETELABELRESPONSE,
  '__module__' : 'kentik.label.v202210.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202210.DeleteLabelResponse)
  })
_sym_db.RegisterMessage(DeleteLabelResponse)


DESCRIPTOR._options = None
_LABEL.fields_by_name['id']._options = None
_LABEL.fields_by_name['name']._options = None
_LABEL.fields_by_name['description']._options = None
_LABEL.fields_by_name['color']._options = None
_LABEL.fields_by_name['cdate']._options = None
_LABEL.fields_by_name['edate']._options = None
_LISTLABELSRESPONSE.fields_by_name['labels']._options = None
_LISTLABELSRESPONSE.fields_by_name['invalid_count']._options = None
_CREATELABELREQUEST.fields_by_name['label']._options = None
_CREATELABELRESPONSE.fields_by_name['label']._options = None
_UPDATELABELREQUEST.fields_by_name['label']._options = None
_UPDATELABELRESPONSE.fields_by_name['label']._options = None
_DELETELABELREQUEST.fields_by_name['id']._options = None

_LABELSERVICE = _descriptor.ServiceDescriptor(
  name='LabelService',
  full_name='kentik.label.v202210.LabelService',
  file=DESCRIPTOR,
  index=0,
  serialized_options=b'\312A\023grpc.api.kentik.com\352\327\002\013admin.label\220\330\002\003',
  create_key=_descriptor._internal_create_key,
  serialized_start=1738,
  serialized_end=2764,
  methods=[
  _descriptor.MethodDescriptor(
    name='ListLabels',
    full_name='kentik.label.v202210.LabelService.ListLabels',
    index=0,
    containing_service=None,
    input_type=_LISTLABELSREQUEST,
    output_type=_LISTLABELSRESPONSE,
    serialized_options=b'\222A_\022\032List all configured labels\0325Returns list of all labels configured in the account.*\nListLabels\362\327\002\020admin.label:read\202\323\344\223\002\027\022\025/label/v202210/labels',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='CreateLabel',
    full_name='kentik.label.v202210.LabelService.CreateLabel',
    index=1,
    containing_service=None,
    input_type=_CREATELABELREQUEST,
    output_type=_CREATELABELRESPONSE,
    serialized_options=b'\222AU\022\023Create a new label.\0321Creates a new label based on data in the request.*\013CreateLabel\362\327\002\021admin.label:write\202\323\344\223\002\032\"\025/label/v202210/labels:\001*',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='UpdateLabel',
    full_name='kentik.label.v202210.LabelService.UpdateLabel',
    index=2,
    containing_service=None,
    input_type=_UPDATELABELREQUEST,
    output_type=_UPDATELABELRESPONSE,
    serialized_options=b'\222AK\022\031Update an existing label.\032!Updates configuration of a label.*\013UpdateLabel\362\327\002\021admin.label:write\202\323\344\223\002%\" /label/v202210/labels/{label.id}:\001*',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='DeleteLabel',
    full_name='kentik.label.v202210.LabelService.DeleteLabel',
    index=3,
    containing_service=None,
    input_type=_DELETELABELREQUEST,
    output_type=_DELETELABELRESPONSE,
    serialized_options=b'\222AE\022\017Delete a label.\032%Deletes label with specified with id.*\013DeleteLabel\362\327\002\021admin.label:write\202\323\344\223\002\034*\032/label/v202210/labels/{id}',
    create_key=_descriptor._internal_create_key,
  ),
])
_sym_db.RegisterServiceDescriptor(_LABELSERVICE)

DESCRIPTOR.services_by_name['LabelService'] = _LABELSERVICE

# @@protoc_insertion_point(module_scope)