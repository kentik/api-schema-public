# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/notify/backend/v0/meta.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.api import annotations_pb2 as google_dot_api_dot_annotations__pb2
from google.protobuf import empty_pb2 as google_dot_protobuf_dot_empty__pb2
from kentik.core.v202012alpha1 import annotations_pb2 as kentik_dot_core_dot_v202012alpha1_dot_annotations__pb2


DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n#kentik/notify/backend/v0/meta.proto\x12\x14kentik.api.notify.v0\x1a\x1cgoogle/api/annotations.proto\x1a\x1bgoogle/protobuf/empty.proto\x1a+kentik/core/v202012alpha1/annotations.proto\"\x82\x01\n\x14\x44\x61tabasePoolSettings\x12\x14\n\x0cmaxOpenConns\x18\x01 \x01(\x05\x12\x14\n\x0cmaxIdleConns\x18\x02 \x01(\x05\x12\x1e\n\x16\x63onnMaxLifeTimeSeconds\x18\x03 \x01(\r\x12\x1e\n\x16\x63onnMaxIdleTimeSeconds\x18\x04 \x01(\r\"\xdd\x01\n\rDatabaseStats\x12\x1a\n\x12maxOpenConnections\x18\x01 \x01(\x05\x12\x17\n\x0fopenConnections\x18\x02 \x01(\r\x12\r\n\x05inUse\x18\x03 \x01(\r\x12\x0c\n\x04idle\x18\x04 \x01(\r\x12\x11\n\twaitCount\x18\x05 \x01(\x03\x12\x1a\n\x12waitDurationMillis\x18\x06 \x01(\x04\x12\x15\n\rmaxIdleClosed\x18\x07 \x01(\x03\x12\x19\n\x11maxIdleTimeClosed\x18\x08 \x01(\x03\x12\x19\n\x11maxLifetimeClosed\x18\t \x01(\x03\"&\n\x18GetDBPoolSettingsRequest\x12\n\n\x02id\x18\x01 \x01(\t\"Y\n\x19GetDBPoolSettingsResponse\x12<\n\x08settings\x18\x01 \x01(\x0b\x32*.kentik.api.notify.v0.DatabasePoolSettings\"d\n\x18SetDBPoolSettingsRequest\x12\n\n\x02id\x18\x01 \x01(\t\x12<\n\x08settings\x18\x02 \x01(\x0b\x32*.kentik.api.notify.v0.DatabasePoolSettings\"\x1b\n\x19SetDBPoolSettingsResponse\"\x1f\n\x11GetDBStatsRequest\x12\n\n\x02id\x18\x01 \x01(\t\"H\n\x12GetDBStatsResponse\x12\x32\n\x05stats\x18\x01 \x01(\x0b\x32#.kentik.api.notify.v0.DatabaseStats\"\x8c\x01\n\x0fMetaEnvResponse\x12;\n\x03\x65nv\x18\x01 \x03(\x0b\x32..kentik.api.notify.v0.MetaEnvResponse.EnvEntry\x12\x10\n\x08redacted\x18\x02 \x03(\t\x1a*\n\x08\x45nvEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"#\n\x0fLogLevelRequest\x12\x10\n\x08logLevel\x18\x01 \x01(\t\"=\n\x10LogLevelResponse\x12\x10\n\x08logLevel\x18\x01 \x01(\t\x12\x17\n\x0finitialLogLevel\x18\x02 \x01(\t\"*\n\x12LogJSONModeRequest\x12\x14\n\x08jsonMode\x18\x01 \x01(\x08\x42\x02\x18\x01\"+\n\x13LogJSONModeResponse\x12\x14\n\x08jsonMode\x18\x01 \x01(\x08\x42\x02\x18\x01\x32\x86\t\n\x04Meta\x12\xa6\x01\n\x11GetDBPoolSettings\x12..kentik.api.notify.v0.GetDBPoolSettingsRequest\x1a/.kentik.api.notify.v0.GetDBPoolSettingsResponse\"0\x82\xd3\xe4\x93\x02*\x12(/notify/backend/v0/meta/db/{id}/settings\x12\xa6\x01\n\x11SetDBPoolSettings\x12..kentik.api.notify.v0.SetDBPoolSettingsRequest\x1a/.kentik.api.notify.v0.SetDBPoolSettingsResponse\"0\x82\xd3\xe4\x93\x02*\x12(/notify/backend/v0/meta/db/{id}/settings\x12\x8e\x01\n\nGetDBStats\x12\'.kentik.api.notify.v0.GetDBStatsRequest\x1a(.kentik.api.notify.v0.GetDBStatsResponse\"-\x82\xd3\xe4\x93\x02\'\x12%/notify/backend/v0/meta/db/{id}/stats\x12l\n\x06GetEnv\x12\x16.google.protobuf.Empty\x1a%.kentik.api.notify.v0.MetaEnvResponse\"#\x82\xd3\xe4\x93\x02\x1d\x12\x1b/notify/backend/v0/meta/env\x12x\n\x0bGetLogLevel\x12\x16.google.protobuf.Empty\x1a&.kentik.api.notify.v0.LogLevelResponse\")\x82\xd3\xe4\x93\x02#\x12!/notify/backend/v0/meta/log/level\x12\x91\x01\n\x0bSetLogLevel\x12%.kentik.api.notify.v0.LogLevelRequest\x1a&.kentik.api.notify.v0.LogLevelResponse\"3\x82\xd3\xe4\x93\x02-\x1a!/notify/backend/v0/meta/log/level:\x08logLevel\x12\x80\x01\n\x0eGetLogJSONMode\x12\x16.google.protobuf.Empty\x1a).kentik.api.notify.v0.LogJSONModeResponse\"+\x88\x02\x01\x82\xd3\xe4\x93\x02\"\x12 /notify/backend/v0/meta/log/json\x12\x95\x01\n\x0eSetLogJSONMode\x12(.kentik.api.notify.v0.LogJSONModeRequest\x1a).kentik.api.notify.v0.LogJSONModeResponse\".\x88\x02\x01\x82\xd3\xe4\x93\x02%\x1a /notify/backend/v0/meta/log/json:\x01*\x1a\x04\xf8\xd7\x02\x01\x42!Z\x1fkentik/notify/backend/v0;notifyb\x06proto3')



_DATABASEPOOLSETTINGS = DESCRIPTOR.message_types_by_name['DatabasePoolSettings']
_DATABASESTATS = DESCRIPTOR.message_types_by_name['DatabaseStats']
_GETDBPOOLSETTINGSREQUEST = DESCRIPTOR.message_types_by_name['GetDBPoolSettingsRequest']
_GETDBPOOLSETTINGSRESPONSE = DESCRIPTOR.message_types_by_name['GetDBPoolSettingsResponse']
_SETDBPOOLSETTINGSREQUEST = DESCRIPTOR.message_types_by_name['SetDBPoolSettingsRequest']
_SETDBPOOLSETTINGSRESPONSE = DESCRIPTOR.message_types_by_name['SetDBPoolSettingsResponse']
_GETDBSTATSREQUEST = DESCRIPTOR.message_types_by_name['GetDBStatsRequest']
_GETDBSTATSRESPONSE = DESCRIPTOR.message_types_by_name['GetDBStatsResponse']
_METAENVRESPONSE = DESCRIPTOR.message_types_by_name['MetaEnvResponse']
_METAENVRESPONSE_ENVENTRY = _METAENVRESPONSE.nested_types_by_name['EnvEntry']
_LOGLEVELREQUEST = DESCRIPTOR.message_types_by_name['LogLevelRequest']
_LOGLEVELRESPONSE = DESCRIPTOR.message_types_by_name['LogLevelResponse']
_LOGJSONMODEREQUEST = DESCRIPTOR.message_types_by_name['LogJSONModeRequest']
_LOGJSONMODERESPONSE = DESCRIPTOR.message_types_by_name['LogJSONModeResponse']
DatabasePoolSettings = _reflection.GeneratedProtocolMessageType('DatabasePoolSettings', (_message.Message,), {
  'DESCRIPTOR' : _DATABASEPOOLSETTINGS,
  '__module__' : 'kentik.notify.backend.v0.meta_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.DatabasePoolSettings)
  })
_sym_db.RegisterMessage(DatabasePoolSettings)

DatabaseStats = _reflection.GeneratedProtocolMessageType('DatabaseStats', (_message.Message,), {
  'DESCRIPTOR' : _DATABASESTATS,
  '__module__' : 'kentik.notify.backend.v0.meta_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.DatabaseStats)
  })
_sym_db.RegisterMessage(DatabaseStats)

GetDBPoolSettingsRequest = _reflection.GeneratedProtocolMessageType('GetDBPoolSettingsRequest', (_message.Message,), {
  'DESCRIPTOR' : _GETDBPOOLSETTINGSREQUEST,
  '__module__' : 'kentik.notify.backend.v0.meta_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.GetDBPoolSettingsRequest)
  })
_sym_db.RegisterMessage(GetDBPoolSettingsRequest)

GetDBPoolSettingsResponse = _reflection.GeneratedProtocolMessageType('GetDBPoolSettingsResponse', (_message.Message,), {
  'DESCRIPTOR' : _GETDBPOOLSETTINGSRESPONSE,
  '__module__' : 'kentik.notify.backend.v0.meta_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.GetDBPoolSettingsResponse)
  })
_sym_db.RegisterMessage(GetDBPoolSettingsResponse)

SetDBPoolSettingsRequest = _reflection.GeneratedProtocolMessageType('SetDBPoolSettingsRequest', (_message.Message,), {
  'DESCRIPTOR' : _SETDBPOOLSETTINGSREQUEST,
  '__module__' : 'kentik.notify.backend.v0.meta_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.SetDBPoolSettingsRequest)
  })
_sym_db.RegisterMessage(SetDBPoolSettingsRequest)

SetDBPoolSettingsResponse = _reflection.GeneratedProtocolMessageType('SetDBPoolSettingsResponse', (_message.Message,), {
  'DESCRIPTOR' : _SETDBPOOLSETTINGSRESPONSE,
  '__module__' : 'kentik.notify.backend.v0.meta_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.SetDBPoolSettingsResponse)
  })
_sym_db.RegisterMessage(SetDBPoolSettingsResponse)

GetDBStatsRequest = _reflection.GeneratedProtocolMessageType('GetDBStatsRequest', (_message.Message,), {
  'DESCRIPTOR' : _GETDBSTATSREQUEST,
  '__module__' : 'kentik.notify.backend.v0.meta_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.GetDBStatsRequest)
  })
_sym_db.RegisterMessage(GetDBStatsRequest)

GetDBStatsResponse = _reflection.GeneratedProtocolMessageType('GetDBStatsResponse', (_message.Message,), {
  'DESCRIPTOR' : _GETDBSTATSRESPONSE,
  '__module__' : 'kentik.notify.backend.v0.meta_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.GetDBStatsResponse)
  })
_sym_db.RegisterMessage(GetDBStatsResponse)

MetaEnvResponse = _reflection.GeneratedProtocolMessageType('MetaEnvResponse', (_message.Message,), {

  'EnvEntry' : _reflection.GeneratedProtocolMessageType('EnvEntry', (_message.Message,), {
    'DESCRIPTOR' : _METAENVRESPONSE_ENVENTRY,
    '__module__' : 'kentik.notify.backend.v0.meta_pb2'
    # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.MetaEnvResponse.EnvEntry)
    })
  ,
  'DESCRIPTOR' : _METAENVRESPONSE,
  '__module__' : 'kentik.notify.backend.v0.meta_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.MetaEnvResponse)
  })
_sym_db.RegisterMessage(MetaEnvResponse)
_sym_db.RegisterMessage(MetaEnvResponse.EnvEntry)

LogLevelRequest = _reflection.GeneratedProtocolMessageType('LogLevelRequest', (_message.Message,), {
  'DESCRIPTOR' : _LOGLEVELREQUEST,
  '__module__' : 'kentik.notify.backend.v0.meta_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.LogLevelRequest)
  })
_sym_db.RegisterMessage(LogLevelRequest)

LogLevelResponse = _reflection.GeneratedProtocolMessageType('LogLevelResponse', (_message.Message,), {
  'DESCRIPTOR' : _LOGLEVELRESPONSE,
  '__module__' : 'kentik.notify.backend.v0.meta_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.LogLevelResponse)
  })
_sym_db.RegisterMessage(LogLevelResponse)

LogJSONModeRequest = _reflection.GeneratedProtocolMessageType('LogJSONModeRequest', (_message.Message,), {
  'DESCRIPTOR' : _LOGJSONMODEREQUEST,
  '__module__' : 'kentik.notify.backend.v0.meta_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.LogJSONModeRequest)
  })
_sym_db.RegisterMessage(LogJSONModeRequest)

LogJSONModeResponse = _reflection.GeneratedProtocolMessageType('LogJSONModeResponse', (_message.Message,), {
  'DESCRIPTOR' : _LOGJSONMODERESPONSE,
  '__module__' : 'kentik.notify.backend.v0.meta_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.LogJSONModeResponse)
  })
_sym_db.RegisterMessage(LogJSONModeResponse)

_META = DESCRIPTOR.services_by_name['Meta']
if _descriptor._USE_C_DESCRIPTORS == False:

  DESCRIPTOR._options = None
  DESCRIPTOR._serialized_options = b'Z\037kentik/notify/backend/v0;notify'
  _METAENVRESPONSE_ENVENTRY._options = None
  _METAENVRESPONSE_ENVENTRY._serialized_options = b'8\001'
  _LOGJSONMODEREQUEST.fields_by_name['jsonMode']._options = None
  _LOGJSONMODEREQUEST.fields_by_name['jsonMode']._serialized_options = b'\030\001'
  _LOGJSONMODERESPONSE.fields_by_name['jsonMode']._options = None
  _LOGJSONMODERESPONSE.fields_by_name['jsonMode']._serialized_options = b'\030\001'
  _META._options = None
  _META._serialized_options = b'\370\327\002\001'
  _META.methods_by_name['GetDBPoolSettings']._options = None
  _META.methods_by_name['GetDBPoolSettings']._serialized_options = b'\202\323\344\223\002*\022(/notify/backend/v0/meta/db/{id}/settings'
  _META.methods_by_name['SetDBPoolSettings']._options = None
  _META.methods_by_name['SetDBPoolSettings']._serialized_options = b'\202\323\344\223\002*\022(/notify/backend/v0/meta/db/{id}/settings'
  _META.methods_by_name['GetDBStats']._options = None
  _META.methods_by_name['GetDBStats']._serialized_options = b'\202\323\344\223\002\'\022%/notify/backend/v0/meta/db/{id}/stats'
  _META.methods_by_name['GetEnv']._options = None
  _META.methods_by_name['GetEnv']._serialized_options = b'\202\323\344\223\002\035\022\033/notify/backend/v0/meta/env'
  _META.methods_by_name['GetLogLevel']._options = None
  _META.methods_by_name['GetLogLevel']._serialized_options = b'\202\323\344\223\002#\022!/notify/backend/v0/meta/log/level'
  _META.methods_by_name['SetLogLevel']._options = None
  _META.methods_by_name['SetLogLevel']._serialized_options = b'\202\323\344\223\002-\032!/notify/backend/v0/meta/log/level:\010logLevel'
  _META.methods_by_name['GetLogJSONMode']._options = None
  _META.methods_by_name['GetLogJSONMode']._serialized_options = b'\210\002\001\202\323\344\223\002\"\022 /notify/backend/v0/meta/log/json'
  _META.methods_by_name['SetLogJSONMode']._options = None
  _META.methods_by_name['SetLogJSONMode']._serialized_options = b'\210\002\001\202\323\344\223\002%\032 /notify/backend/v0/meta/log/json:\001*'
  _DATABASEPOOLSETTINGS._serialized_start=166
  _DATABASEPOOLSETTINGS._serialized_end=296
  _DATABASESTATS._serialized_start=299
  _DATABASESTATS._serialized_end=520
  _GETDBPOOLSETTINGSREQUEST._serialized_start=522
  _GETDBPOOLSETTINGSREQUEST._serialized_end=560
  _GETDBPOOLSETTINGSRESPONSE._serialized_start=562
  _GETDBPOOLSETTINGSRESPONSE._serialized_end=651
  _SETDBPOOLSETTINGSREQUEST._serialized_start=653
  _SETDBPOOLSETTINGSREQUEST._serialized_end=753
  _SETDBPOOLSETTINGSRESPONSE._serialized_start=755
  _SETDBPOOLSETTINGSRESPONSE._serialized_end=782
  _GETDBSTATSREQUEST._serialized_start=784
  _GETDBSTATSREQUEST._serialized_end=815
  _GETDBSTATSRESPONSE._serialized_start=817
  _GETDBSTATSRESPONSE._serialized_end=889
  _METAENVRESPONSE._serialized_start=892
  _METAENVRESPONSE._serialized_end=1032
  _METAENVRESPONSE_ENVENTRY._serialized_start=990
  _METAENVRESPONSE_ENVENTRY._serialized_end=1032
  _LOGLEVELREQUEST._serialized_start=1034
  _LOGLEVELREQUEST._serialized_end=1069
  _LOGLEVELRESPONSE._serialized_start=1071
  _LOGLEVELRESPONSE._serialized_end=1132
  _LOGJSONMODEREQUEST._serialized_start=1134
  _LOGJSONMODEREQUEST._serialized_end=1176
  _LOGJSONMODERESPONSE._serialized_start=1178
  _LOGJSONMODERESPONSE._serialized_end=1221
  _META._serialized_start=1224
  _META._serialized_end=2382
# @@protoc_insertion_point(module_scope)
