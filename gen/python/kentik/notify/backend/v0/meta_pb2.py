# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/notify/backend/v0/meta.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.api import annotations_pb2 as google_dot_api_dot_annotations__pb2
from google.protobuf import empty_pb2 as google_dot_protobuf_dot_empty__pb2
from kentik.core.v202012alpha1 import annotations_pb2 as kentik_dot_core_dot_v202012alpha1_dot_annotations__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='kentik/notify/backend/v0/meta.proto',
  package='kentik.api.notify.v0',
  syntax='proto3',
  serialized_options=b'Z\037kentik/notify/backend/v0;notify',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n#kentik/notify/backend/v0/meta.proto\x12\x14kentik.api.notify.v0\x1a\x1cgoogle/api/annotations.proto\x1a\x1bgoogle/protobuf/empty.proto\x1a+kentik/core/v202012alpha1/annotations.proto\"\x82\x01\n\x14\x44\x61tabasePoolSettings\x12\x14\n\x0cmaxOpenConns\x18\x01 \x01(\x05\x12\x14\n\x0cmaxIdleConns\x18\x02 \x01(\x05\x12\x1e\n\x16\x63onnMaxLifeTimeSeconds\x18\x03 \x01(\r\x12\x1e\n\x16\x63onnMaxIdleTimeSeconds\x18\x04 \x01(\r\"\xdd\x01\n\rDatabaseStats\x12\x1a\n\x12maxOpenConnections\x18\x01 \x01(\x05\x12\x17\n\x0fopenConnections\x18\x02 \x01(\r\x12\r\n\x05inUse\x18\x03 \x01(\r\x12\x0c\n\x04idle\x18\x04 \x01(\r\x12\x11\n\twaitCount\x18\x05 \x01(\x03\x12\x1a\n\x12waitDurationMillis\x18\x06 \x01(\x04\x12\x15\n\rmaxIdleClosed\x18\x07 \x01(\x03\x12\x19\n\x11maxIdleTimeClosed\x18\x08 \x01(\x03\x12\x19\n\x11maxLifetimeClosed\x18\t \x01(\x03\"&\n\x18GetDBPoolSettingsRequest\x12\n\n\x02id\x18\x01 \x01(\t\"Y\n\x19GetDBPoolSettingsResponse\x12<\n\x08settings\x18\x01 \x01(\x0b\x32*.kentik.api.notify.v0.DatabasePoolSettings\"d\n\x18SetDBPoolSettingsRequest\x12\n\n\x02id\x18\x01 \x01(\t\x12<\n\x08settings\x18\x02 \x01(\x0b\x32*.kentik.api.notify.v0.DatabasePoolSettings\"\x1b\n\x19SetDBPoolSettingsResponse\"\x1f\n\x11GetDBStatsRequest\x12\n\n\x02id\x18\x01 \x01(\t\"H\n\x12GetDBStatsResponse\x12\x32\n\x05stats\x18\x01 \x01(\x0b\x32#.kentik.api.notify.v0.DatabaseStats\"\x8c\x01\n\x0fMetaEnvResponse\x12;\n\x03\x65nv\x18\x01 \x03(\x0b\x32..kentik.api.notify.v0.MetaEnvResponse.EnvEntry\x12\x10\n\x08redacted\x18\x02 \x03(\t\x1a*\n\x08\x45nvEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\"#\n\x0fLogLevelRequest\x12\x10\n\x08logLevel\x18\x01 \x01(\t\"=\n\x10LogLevelResponse\x12\x10\n\x08logLevel\x18\x01 \x01(\t\x12\x17\n\x0finitialLogLevel\x18\x02 \x01(\t\"*\n\x12LogJSONModeRequest\x12\x14\n\x08jsonMode\x18\x01 \x01(\x08\x42\x02\x18\x01\"+\n\x13LogJSONModeResponse\x12\x14\n\x08jsonMode\x18\x01 \x01(\x08\x42\x02\x18\x01\x32\x86\t\n\x04Meta\x12\xa6\x01\n\x11GetDBPoolSettings\x12..kentik.api.notify.v0.GetDBPoolSettingsRequest\x1a/.kentik.api.notify.v0.GetDBPoolSettingsResponse\"0\x82\xd3\xe4\x93\x02*\x12(/notify/backend/v0/meta/db/{id}/settings\x12\xa6\x01\n\x11SetDBPoolSettings\x12..kentik.api.notify.v0.SetDBPoolSettingsRequest\x1a/.kentik.api.notify.v0.SetDBPoolSettingsResponse\"0\x82\xd3\xe4\x93\x02*\x12(/notify/backend/v0/meta/db/{id}/settings\x12\x8e\x01\n\nGetDBStats\x12\'.kentik.api.notify.v0.GetDBStatsRequest\x1a(.kentik.api.notify.v0.GetDBStatsResponse\"-\x82\xd3\xe4\x93\x02\'\x12%/notify/backend/v0/meta/db/{id}/stats\x12l\n\x06GetEnv\x12\x16.google.protobuf.Empty\x1a%.kentik.api.notify.v0.MetaEnvResponse\"#\x82\xd3\xe4\x93\x02\x1d\x12\x1b/notify/backend/v0/meta/env\x12x\n\x0bGetLogLevel\x12\x16.google.protobuf.Empty\x1a&.kentik.api.notify.v0.LogLevelResponse\")\x82\xd3\xe4\x93\x02#\x12!/notify/backend/v0/meta/log/level\x12\x91\x01\n\x0bSetLogLevel\x12%.kentik.api.notify.v0.LogLevelRequest\x1a&.kentik.api.notify.v0.LogLevelResponse\"3\x82\xd3\xe4\x93\x02-\x1a!/notify/backend/v0/meta/log/level:\x08logLevel\x12\x80\x01\n\x0eGetLogJSONMode\x12\x16.google.protobuf.Empty\x1a).kentik.api.notify.v0.LogJSONModeResponse\"+\x88\x02\x01\x82\xd3\xe4\x93\x02\"\x12 /notify/backend/v0/meta/log/json\x12\x95\x01\n\x0eSetLogJSONMode\x12(.kentik.api.notify.v0.LogJSONModeRequest\x1a).kentik.api.notify.v0.LogJSONModeResponse\".\x88\x02\x01\x82\xd3\xe4\x93\x02%\x1a /notify/backend/v0/meta/log/json:\x01*\x1a\x04\xf8\xd7\x02\x01\x42!Z\x1fkentik/notify/backend/v0;notifyb\x06proto3'
  ,
  dependencies=[google_dot_api_dot_annotations__pb2.DESCRIPTOR,google_dot_protobuf_dot_empty__pb2.DESCRIPTOR,kentik_dot_core_dot_v202012alpha1_dot_annotations__pb2.DESCRIPTOR,])




_DATABASEPOOLSETTINGS = _descriptor.Descriptor(
  name='DatabasePoolSettings',
  full_name='kentik.api.notify.v0.DatabasePoolSettings',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='maxOpenConns', full_name='kentik.api.notify.v0.DatabasePoolSettings.maxOpenConns', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='maxIdleConns', full_name='kentik.api.notify.v0.DatabasePoolSettings.maxIdleConns', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='connMaxLifeTimeSeconds', full_name='kentik.api.notify.v0.DatabasePoolSettings.connMaxLifeTimeSeconds', index=2,
      number=3, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='connMaxIdleTimeSeconds', full_name='kentik.api.notify.v0.DatabasePoolSettings.connMaxIdleTimeSeconds', index=3,
      number=4, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
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
  serialized_start=166,
  serialized_end=296,
)


_DATABASESTATS = _descriptor.Descriptor(
  name='DatabaseStats',
  full_name='kentik.api.notify.v0.DatabaseStats',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='maxOpenConnections', full_name='kentik.api.notify.v0.DatabaseStats.maxOpenConnections', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='openConnections', full_name='kentik.api.notify.v0.DatabaseStats.openConnections', index=1,
      number=2, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='inUse', full_name='kentik.api.notify.v0.DatabaseStats.inUse', index=2,
      number=3, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='idle', full_name='kentik.api.notify.v0.DatabaseStats.idle', index=3,
      number=4, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='waitCount', full_name='kentik.api.notify.v0.DatabaseStats.waitCount', index=4,
      number=5, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='waitDurationMillis', full_name='kentik.api.notify.v0.DatabaseStats.waitDurationMillis', index=5,
      number=6, type=4, cpp_type=4, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='maxIdleClosed', full_name='kentik.api.notify.v0.DatabaseStats.maxIdleClosed', index=6,
      number=7, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='maxIdleTimeClosed', full_name='kentik.api.notify.v0.DatabaseStats.maxIdleTimeClosed', index=7,
      number=8, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='maxLifetimeClosed', full_name='kentik.api.notify.v0.DatabaseStats.maxLifetimeClosed', index=8,
      number=9, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
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
  serialized_start=299,
  serialized_end=520,
)


_GETDBPOOLSETTINGSREQUEST = _descriptor.Descriptor(
  name='GetDBPoolSettingsRequest',
  full_name='kentik.api.notify.v0.GetDBPoolSettingsRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='kentik.api.notify.v0.GetDBPoolSettingsRequest.id', index=0,
      number=1, type=9, cpp_type=9, label=1,
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
  serialized_start=522,
  serialized_end=560,
)


_GETDBPOOLSETTINGSRESPONSE = _descriptor.Descriptor(
  name='GetDBPoolSettingsResponse',
  full_name='kentik.api.notify.v0.GetDBPoolSettingsResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='settings', full_name='kentik.api.notify.v0.GetDBPoolSettingsResponse.settings', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
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
  serialized_start=562,
  serialized_end=651,
)


_SETDBPOOLSETTINGSREQUEST = _descriptor.Descriptor(
  name='SetDBPoolSettingsRequest',
  full_name='kentik.api.notify.v0.SetDBPoolSettingsRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='kentik.api.notify.v0.SetDBPoolSettingsRequest.id', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='settings', full_name='kentik.api.notify.v0.SetDBPoolSettingsRequest.settings', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
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
  serialized_start=653,
  serialized_end=753,
)


_SETDBPOOLSETTINGSRESPONSE = _descriptor.Descriptor(
  name='SetDBPoolSettingsResponse',
  full_name='kentik.api.notify.v0.SetDBPoolSettingsResponse',
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
  serialized_start=755,
  serialized_end=782,
)


_GETDBSTATSREQUEST = _descriptor.Descriptor(
  name='GetDBStatsRequest',
  full_name='kentik.api.notify.v0.GetDBStatsRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='kentik.api.notify.v0.GetDBStatsRequest.id', index=0,
      number=1, type=9, cpp_type=9, label=1,
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
  serialized_start=784,
  serialized_end=815,
)


_GETDBSTATSRESPONSE = _descriptor.Descriptor(
  name='GetDBStatsResponse',
  full_name='kentik.api.notify.v0.GetDBStatsResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='stats', full_name='kentik.api.notify.v0.GetDBStatsResponse.stats', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
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
  serialized_start=817,
  serialized_end=889,
)


_METAENVRESPONSE_ENVENTRY = _descriptor.Descriptor(
  name='EnvEntry',
  full_name='kentik.api.notify.v0.MetaEnvResponse.EnvEntry',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='key', full_name='kentik.api.notify.v0.MetaEnvResponse.EnvEntry.key', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='value', full_name='kentik.api.notify.v0.MetaEnvResponse.EnvEntry.value', index=1,
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
  serialized_options=b'8\001',
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=990,
  serialized_end=1032,
)

_METAENVRESPONSE = _descriptor.Descriptor(
  name='MetaEnvResponse',
  full_name='kentik.api.notify.v0.MetaEnvResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='env', full_name='kentik.api.notify.v0.MetaEnvResponse.env', index=0,
      number=1, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='redacted', full_name='kentik.api.notify.v0.MetaEnvResponse.redacted', index=1,
      number=2, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[_METAENVRESPONSE_ENVENTRY, ],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=892,
  serialized_end=1032,
)


_LOGLEVELREQUEST = _descriptor.Descriptor(
  name='LogLevelRequest',
  full_name='kentik.api.notify.v0.LogLevelRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='logLevel', full_name='kentik.api.notify.v0.LogLevelRequest.logLevel', index=0,
      number=1, type=9, cpp_type=9, label=1,
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
  serialized_start=1034,
  serialized_end=1069,
)


_LOGLEVELRESPONSE = _descriptor.Descriptor(
  name='LogLevelResponse',
  full_name='kentik.api.notify.v0.LogLevelResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='logLevel', full_name='kentik.api.notify.v0.LogLevelResponse.logLevel', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='initialLogLevel', full_name='kentik.api.notify.v0.LogLevelResponse.initialLogLevel', index=1,
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
  serialized_start=1071,
  serialized_end=1132,
)


_LOGJSONMODEREQUEST = _descriptor.Descriptor(
  name='LogJSONModeRequest',
  full_name='kentik.api.notify.v0.LogJSONModeRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='jsonMode', full_name='kentik.api.notify.v0.LogJSONModeRequest.jsonMode', index=0,
      number=1, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\030\001', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1134,
  serialized_end=1176,
)


_LOGJSONMODERESPONSE = _descriptor.Descriptor(
  name='LogJSONModeResponse',
  full_name='kentik.api.notify.v0.LogJSONModeResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='jsonMode', full_name='kentik.api.notify.v0.LogJSONModeResponse.jsonMode', index=0,
      number=1, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\030\001', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1178,
  serialized_end=1221,
)

_GETDBPOOLSETTINGSRESPONSE.fields_by_name['settings'].message_type = _DATABASEPOOLSETTINGS
_SETDBPOOLSETTINGSREQUEST.fields_by_name['settings'].message_type = _DATABASEPOOLSETTINGS
_GETDBSTATSRESPONSE.fields_by_name['stats'].message_type = _DATABASESTATS
_METAENVRESPONSE_ENVENTRY.containing_type = _METAENVRESPONSE
_METAENVRESPONSE.fields_by_name['env'].message_type = _METAENVRESPONSE_ENVENTRY
DESCRIPTOR.message_types_by_name['DatabasePoolSettings'] = _DATABASEPOOLSETTINGS
DESCRIPTOR.message_types_by_name['DatabaseStats'] = _DATABASESTATS
DESCRIPTOR.message_types_by_name['GetDBPoolSettingsRequest'] = _GETDBPOOLSETTINGSREQUEST
DESCRIPTOR.message_types_by_name['GetDBPoolSettingsResponse'] = _GETDBPOOLSETTINGSRESPONSE
DESCRIPTOR.message_types_by_name['SetDBPoolSettingsRequest'] = _SETDBPOOLSETTINGSREQUEST
DESCRIPTOR.message_types_by_name['SetDBPoolSettingsResponse'] = _SETDBPOOLSETTINGSRESPONSE
DESCRIPTOR.message_types_by_name['GetDBStatsRequest'] = _GETDBSTATSREQUEST
DESCRIPTOR.message_types_by_name['GetDBStatsResponse'] = _GETDBSTATSRESPONSE
DESCRIPTOR.message_types_by_name['MetaEnvResponse'] = _METAENVRESPONSE
DESCRIPTOR.message_types_by_name['LogLevelRequest'] = _LOGLEVELREQUEST
DESCRIPTOR.message_types_by_name['LogLevelResponse'] = _LOGLEVELRESPONSE
DESCRIPTOR.message_types_by_name['LogJSONModeRequest'] = _LOGJSONMODEREQUEST
DESCRIPTOR.message_types_by_name['LogJSONModeResponse'] = _LOGJSONMODERESPONSE
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

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


DESCRIPTOR._options = None
_METAENVRESPONSE_ENVENTRY._options = None
_LOGJSONMODEREQUEST.fields_by_name['jsonMode']._options = None
_LOGJSONMODERESPONSE.fields_by_name['jsonMode']._options = None

_META = _descriptor.ServiceDescriptor(
  name='Meta',
  full_name='kentik.api.notify.v0.Meta',
  file=DESCRIPTOR,
  index=0,
  serialized_options=b'\370\327\002\001',
  create_key=_descriptor._internal_create_key,
  serialized_start=1224,
  serialized_end=2382,
  methods=[
  _descriptor.MethodDescriptor(
    name='GetDBPoolSettings',
    full_name='kentik.api.notify.v0.Meta.GetDBPoolSettings',
    index=0,
    containing_service=None,
    input_type=_GETDBPOOLSETTINGSREQUEST,
    output_type=_GETDBPOOLSETTINGSRESPONSE,
    serialized_options=b'\202\323\344\223\002*\022(/notify/backend/v0/meta/db/{id}/settings',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='SetDBPoolSettings',
    full_name='kentik.api.notify.v0.Meta.SetDBPoolSettings',
    index=1,
    containing_service=None,
    input_type=_SETDBPOOLSETTINGSREQUEST,
    output_type=_SETDBPOOLSETTINGSRESPONSE,
    serialized_options=b'\202\323\344\223\002*\022(/notify/backend/v0/meta/db/{id}/settings',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='GetDBStats',
    full_name='kentik.api.notify.v0.Meta.GetDBStats',
    index=2,
    containing_service=None,
    input_type=_GETDBSTATSREQUEST,
    output_type=_GETDBSTATSRESPONSE,
    serialized_options=b'\202\323\344\223\002\'\022%/notify/backend/v0/meta/db/{id}/stats',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='GetEnv',
    full_name='kentik.api.notify.v0.Meta.GetEnv',
    index=3,
    containing_service=None,
    input_type=google_dot_protobuf_dot_empty__pb2._EMPTY,
    output_type=_METAENVRESPONSE,
    serialized_options=b'\202\323\344\223\002\035\022\033/notify/backend/v0/meta/env',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='GetLogLevel',
    full_name='kentik.api.notify.v0.Meta.GetLogLevel',
    index=4,
    containing_service=None,
    input_type=google_dot_protobuf_dot_empty__pb2._EMPTY,
    output_type=_LOGLEVELRESPONSE,
    serialized_options=b'\202\323\344\223\002#\022!/notify/backend/v0/meta/log/level',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='SetLogLevel',
    full_name='kentik.api.notify.v0.Meta.SetLogLevel',
    index=5,
    containing_service=None,
    input_type=_LOGLEVELREQUEST,
    output_type=_LOGLEVELRESPONSE,
    serialized_options=b'\202\323\344\223\002-\032!/notify/backend/v0/meta/log/level:\010logLevel',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='GetLogJSONMode',
    full_name='kentik.api.notify.v0.Meta.GetLogJSONMode',
    index=6,
    containing_service=None,
    input_type=google_dot_protobuf_dot_empty__pb2._EMPTY,
    output_type=_LOGJSONMODERESPONSE,
    serialized_options=b'\210\002\001\202\323\344\223\002\"\022 /notify/backend/v0/meta/log/json',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='SetLogJSONMode',
    full_name='kentik.api.notify.v0.Meta.SetLogJSONMode',
    index=7,
    containing_service=None,
    input_type=_LOGJSONMODEREQUEST,
    output_type=_LOGJSONMODERESPONSE,
    serialized_options=b'\210\002\001\202\323\344\223\002%\032 /notify/backend/v0/meta/log/json:\001*',
    create_key=_descriptor._internal_create_key,
  ),
])
_sym_db.RegisterServiceDescriptor(_META)

DESCRIPTOR.services_by_name['Meta'] = _META

# @@protoc_insertion_point(module_scope)