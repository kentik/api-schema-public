# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/label/v202203alpha1/label.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.api import annotations_pb2 as google_dot_api_dot_annotations__pb2
from google.api import client_pb2 as google_dot_api_dot_client__pb2
from google.type import latlng_pb2 as google_dot_type_dot_latlng__pb2
from google.type import postal_address_pb2 as google_dot_type_dot_postal__address__pb2
from protoc_gen_openapiv2.options import annotations_pb2 as protoc__gen__openapiv2_dot_options_dot_annotations__pb2
from kentik.core.v202012alpha1 import annotations_pb2 as kentik_dot_core_dot_v202012alpha1_dot_annotations__pb2
from google.protobuf import timestamp_pb2 as google_dot_protobuf_dot_timestamp__pb2


DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n&kentik/label/v202203alpha1/label.proto\x12\x1akentik.label.v202203alpha1\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x18google/type/latlng.proto\x1a google/type/postal_address.proto\x1a.protoc-gen-openapiv2/options/annotations.proto\x1a+kentik/core/v202012alpha1/annotations.proto\x1a\x1fgoogle/protobuf/timestamp.proto\"\xc7\x01\n\x05Label\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x12\n\x04name\x18\x02 \x01(\tR\x04name\x12 \n\x0b\x64\x65scription\x18\x03 \x01(\tR\x0b\x64\x65scription\x12\x14\n\x05\x63olor\x18\x05 \x01(\tR\x05\x63olor\x12\x30\n\x05\x63\x64\x61te\x18\x06 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\x05\x63\x64\x61te\x12\x30\n\x05\x65\x64\x61te\x18\x07 \x01(\x0b\x32\x1a.google.protobuf.TimestampR\x05\x65\x64\x61te\"\x13\n\x11ListLabelsRequest\"t\n\x12ListLabelsResponse\x12\x39\n\x06labels\x18\x01 \x03(\x0b\x32!.kentik.label.v202203alpha1.LabelR\x06labels\x12#\n\rinvalid_count\x18\x02 \x01(\x05R\x0cinvalidCount\"M\n\x12\x43reateLabelRequest\x12\x37\n\x05label\x18\x01 \x01(\x0b\x32!.kentik.label.v202203alpha1.LabelR\x05label\"N\n\x13\x43reateLabelResponse\x12\x37\n\x05label\x18\x01 \x01(\x0b\x32!.kentik.label.v202203alpha1.LabelR\x05label\"M\n\x12UpdateLabelRequest\x12\x37\n\x05label\x18\x01 \x01(\x0b\x32!.kentik.label.v202203alpha1.LabelR\x05label\"N\n\x13UpdateLabelResponse\x12\x37\n\x05label\x18\x01 \x01(\x0b\x32!.kentik.label.v202203alpha1.LabelR\x05label\"$\n\x12\x44\x65leteLabelRequest\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\"\x15\n\x13\x44\x65leteLabelResponse2\xba\x08\n\x0cLabelService\x12\xf7\x01\n\nListLabels\x12-.kentik.label.v202203alpha1.ListLabelsRequest\x1a..kentik.label.v202203alpha1.ListLabelsResponse\"\x89\x01\x92\x41O\x12\x13\x46\x65tch Search Labels\x1a-Return list of labels matches search critera.*\tListLabel\xf2\xd7\x02\x10\x61\x64min.label:read\x82\xd3\xe4\x93\x02\x1d\x12\x1b/label/v202203alpha1/labels\x12\xfc\x01\n\x0b\x43reateLabel\x12..kentik.label.v202203alpha1.CreateLabelRequest\x1a/.kentik.label.v202203alpha1.CreateLabelResponse\"\x8b\x01\x92\x41M\x12\x0f\x43reate a label.\x1a-Create a label from request. returns created.*\x0bLabelCreate\xf2\xd7\x02\x11\x61\x64min.label:write\x82\xd3\xe4\x93\x02 \"\x1b/label/v202203alpha1/labels:\x01*\x12\x91\x02\n\x0bUpdateLabel\x12..kentik.label.v202203alpha1.UpdateLabelRequest\x1a/.kentik.label.v202203alpha1.UpdateLabelResponse\"\xa0\x01\x92\x41W\x12\x0fUpdate a label.\x1a\x37Replaces the entire label attributes specified with id.*\x0bLabelUpdate\xf2\xd7\x02\x11\x61\x64min.label:write\x82\xd3\xe4\x93\x02+\"&/label/v202203alpha1/labels/{label.id}:\x01*\x12\xf5\x01\n\x0b\x44\x65leteLabel\x12..kentik.label.v202203alpha1.DeleteLabelRequest\x1a/.kentik.label.v202203alpha1.DeleteLabelResponse\"\x84\x01\x92\x41\x44\x12\x0f\x44\x65lete a label.\x1a$Deletes the label specified with id.*\x0bLabelDelete\xf2\xd7\x02\x11\x61\x64min.label:write\x82\xd3\xe4\x93\x02\"* /label/v202203alpha1/labels/{id}\x1a%\xca\x41\x13grpc.api.kentik.com\xea\xd7\x02\x0b\x61\x64min.labelB\xbb\x02ZDgithub.com/kentik/api-schema/gen/go/kentik/label/v202203alpha1;label\x92\x41\xf1\x01\x12\x33\n\tLabel API\"\x18\n\x16Kentik API Engineering2\x0c\x32\x30\x32\x32\x30\x33\x61lpha1*\x01\x02\x32\x10\x61pplication/json:\x10\x61pplication/jsonZD\n\x1e\n\x05\x65mail\x12\x15\x08\x02\x1a\x0fX-CH-Auth-Email \x02\n\"\n\x05token\x12\x19\x08\x02\x1a\x13X-CH-Auth-API-Token \x02\x62\x16\n\t\n\x05\x65mail\x12\x00\n\t\n\x05token\x12\x00r5\n\x16More about Kentik APIs\x12\x1bhttps://docs.kentik.com/apib\x06proto3')



_LABEL = DESCRIPTOR.message_types_by_name['Label']
_LISTLABELSREQUEST = DESCRIPTOR.message_types_by_name['ListLabelsRequest']
_LISTLABELSRESPONSE = DESCRIPTOR.message_types_by_name['ListLabelsResponse']
_CREATELABELREQUEST = DESCRIPTOR.message_types_by_name['CreateLabelRequest']
_CREATELABELRESPONSE = DESCRIPTOR.message_types_by_name['CreateLabelResponse']
_UPDATELABELREQUEST = DESCRIPTOR.message_types_by_name['UpdateLabelRequest']
_UPDATELABELRESPONSE = DESCRIPTOR.message_types_by_name['UpdateLabelResponse']
_DELETELABELREQUEST = DESCRIPTOR.message_types_by_name['DeleteLabelRequest']
_DELETELABELRESPONSE = DESCRIPTOR.message_types_by_name['DeleteLabelResponse']
Label = _reflection.GeneratedProtocolMessageType('Label', (_message.Message,), {
  'DESCRIPTOR' : _LABEL,
  '__module__' : 'kentik.label.v202203alpha1.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202203alpha1.Label)
  })
_sym_db.RegisterMessage(Label)

ListLabelsRequest = _reflection.GeneratedProtocolMessageType('ListLabelsRequest', (_message.Message,), {
  'DESCRIPTOR' : _LISTLABELSREQUEST,
  '__module__' : 'kentik.label.v202203alpha1.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202203alpha1.ListLabelsRequest)
  })
_sym_db.RegisterMessage(ListLabelsRequest)

ListLabelsResponse = _reflection.GeneratedProtocolMessageType('ListLabelsResponse', (_message.Message,), {
  'DESCRIPTOR' : _LISTLABELSRESPONSE,
  '__module__' : 'kentik.label.v202203alpha1.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202203alpha1.ListLabelsResponse)
  })
_sym_db.RegisterMessage(ListLabelsResponse)

CreateLabelRequest = _reflection.GeneratedProtocolMessageType('CreateLabelRequest', (_message.Message,), {
  'DESCRIPTOR' : _CREATELABELREQUEST,
  '__module__' : 'kentik.label.v202203alpha1.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202203alpha1.CreateLabelRequest)
  })
_sym_db.RegisterMessage(CreateLabelRequest)

CreateLabelResponse = _reflection.GeneratedProtocolMessageType('CreateLabelResponse', (_message.Message,), {
  'DESCRIPTOR' : _CREATELABELRESPONSE,
  '__module__' : 'kentik.label.v202203alpha1.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202203alpha1.CreateLabelResponse)
  })
_sym_db.RegisterMessage(CreateLabelResponse)

UpdateLabelRequest = _reflection.GeneratedProtocolMessageType('UpdateLabelRequest', (_message.Message,), {
  'DESCRIPTOR' : _UPDATELABELREQUEST,
  '__module__' : 'kentik.label.v202203alpha1.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202203alpha1.UpdateLabelRequest)
  })
_sym_db.RegisterMessage(UpdateLabelRequest)

UpdateLabelResponse = _reflection.GeneratedProtocolMessageType('UpdateLabelResponse', (_message.Message,), {
  'DESCRIPTOR' : _UPDATELABELRESPONSE,
  '__module__' : 'kentik.label.v202203alpha1.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202203alpha1.UpdateLabelResponse)
  })
_sym_db.RegisterMessage(UpdateLabelResponse)

DeleteLabelRequest = _reflection.GeneratedProtocolMessageType('DeleteLabelRequest', (_message.Message,), {
  'DESCRIPTOR' : _DELETELABELREQUEST,
  '__module__' : 'kentik.label.v202203alpha1.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202203alpha1.DeleteLabelRequest)
  })
_sym_db.RegisterMessage(DeleteLabelRequest)

DeleteLabelResponse = _reflection.GeneratedProtocolMessageType('DeleteLabelResponse', (_message.Message,), {
  'DESCRIPTOR' : _DELETELABELRESPONSE,
  '__module__' : 'kentik.label.v202203alpha1.label_pb2'
  # @@protoc_insertion_point(class_scope:kentik.label.v202203alpha1.DeleteLabelResponse)
  })
_sym_db.RegisterMessage(DeleteLabelResponse)

_LABELSERVICE = DESCRIPTOR.services_by_name['LabelService']
if _descriptor._USE_C_DESCRIPTORS == False:

  DESCRIPTOR._options = None
  DESCRIPTOR._serialized_options = b'ZDgithub.com/kentik/api-schema/gen/go/kentik/label/v202203alpha1;label\222A\361\001\0223\n\tLabel API\"\030\n\026Kentik API Engineering2\014202203alpha1*\001\0022\020application/json:\020application/jsonZD\n\036\n\005email\022\025\010\002\032\017X-CH-Auth-Email \002\n\"\n\005token\022\031\010\002\032\023X-CH-Auth-API-Token \002b\026\n\t\n\005email\022\000\n\t\n\005token\022\000r5\n\026More about Kentik APIs\022\033https://docs.kentik.com/api'
  _LABELSERVICE._options = None
  _LABELSERVICE._serialized_options = b'\312A\023grpc.api.kentik.com\352\327\002\013admin.label'
  _LABELSERVICE.methods_by_name['ListLabels']._options = None
  _LABELSERVICE.methods_by_name['ListLabels']._serialized_options = b'\222AO\022\023Fetch Search Labels\032-Return list of labels matches search critera.*\tListLabel\362\327\002\020admin.label:read\202\323\344\223\002\035\022\033/label/v202203alpha1/labels'
  _LABELSERVICE.methods_by_name['CreateLabel']._options = None
  _LABELSERVICE.methods_by_name['CreateLabel']._serialized_options = b'\222AM\022\017Create a label.\032-Create a label from request. returns created.*\013LabelCreate\362\327\002\021admin.label:write\202\323\344\223\002 \"\033/label/v202203alpha1/labels:\001*'
  _LABELSERVICE.methods_by_name['UpdateLabel']._options = None
  _LABELSERVICE.methods_by_name['UpdateLabel']._serialized_options = b'\222AW\022\017Update a label.\0327Replaces the entire label attributes specified with id.*\013LabelUpdate\362\327\002\021admin.label:write\202\323\344\223\002+\"&/label/v202203alpha1/labels/{label.id}:\001*'
  _LABELSERVICE.methods_by_name['DeleteLabel']._options = None
  _LABELSERVICE.methods_by_name['DeleteLabel']._serialized_options = b'\222AD\022\017Delete a label.\032$Deletes the label specified with id.*\013LabelDelete\362\327\002\021admin.label:write\202\323\344\223\002\"* /label/v202203alpha1/labels/{id}'
  _LABEL._serialized_start=312
  _LABEL._serialized_end=511
  _LISTLABELSREQUEST._serialized_start=513
  _LISTLABELSREQUEST._serialized_end=532
  _LISTLABELSRESPONSE._serialized_start=534
  _LISTLABELSRESPONSE._serialized_end=650
  _CREATELABELREQUEST._serialized_start=652
  _CREATELABELREQUEST._serialized_end=729
  _CREATELABELRESPONSE._serialized_start=731
  _CREATELABELRESPONSE._serialized_end=809
  _UPDATELABELREQUEST._serialized_start=811
  _UPDATELABELREQUEST._serialized_end=888
  _UPDATELABELRESPONSE._serialized_start=890
  _UPDATELABELRESPONSE._serialized_end=968
  _DELETELABELREQUEST._serialized_start=970
  _DELETELABELREQUEST._serialized_end=1006
  _DELETELABELRESPONSE._serialized_start=1008
  _DELETELABELRESPONSE._serialized_end=1029
  _LABELSERVICE._serialized_start=1032
  _LABELSERVICE._serialized_end=2114
# @@protoc_insertion_point(module_scope)
