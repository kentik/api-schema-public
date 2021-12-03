# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/notify/backend/v1/models-event.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='kentik/notify/backend/v1/models-event.proto',
  package='kentik.api.notify.v0',
  syntax='proto3',
  serialized_options=b'Z\tv0/notify',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n+kentik/notify/backend/v1/models-event.proto\x12\x14kentik.api.notify.v0\"\xf3\x02\n\x11NotificationEvent\x12\x11\n\tcompanyID\x18\x01 \x01(\x03\x12\x36\n\nalarmEvent\x18\x02 \x01(\x0b\x32 .kentik.api.notify.v0.AlarmEventH\x00\x12@\n\x0fmitigationEvent\x18\x03 \x01(\x0b\x32%.kentik.api.notify.v0.MitigationEventH\x00\x12:\n\x0cinsightEvent\x18\x04 \x01(\x0b\x32\".kentik.api.notify.v0.InsightEventH\x00\x12P\n\x17mitigationPlatformEvent\x18\x05 \x01(\x0b\x32-.kentik.api.notify.v0.MitigationPlatformEventH\x00\x12:\n\x0cgenericEvent\x18\x06 \x01(\x0b\x32\".kentik.api.notify.v0.GenericEventH\x00\x42\x07\n\x05\x65vent\"\'\n\x19NotificationEventResponse\x12\n\n\x02ok\x18\x01 \x01(\x08\"\\\n\nAlarmEvent\x12\x0f\n\x07\x61larmID\x18\x01 \x01(\x03\x12\x16\n\x0e\x61larmHistoryID\x18\x02 \x01(\x03\x12\x10\n\x08policyID\x18\x03 \x01(\x03\x12\x13\n\x0bthresholdID\x18\x04 \x01(\x03\"\xa3\x01\n\x0fMitigationEvent\x12\x14\n\x0cmitigationID\x18\x01 \x01(\x03\x12\x19\n\x11mitigationEventID\x18\x02 \x01(\x03\x12\x10\n\x08policyID\x18\x03 \x01(\x03\x12\x13\n\x0bthresholdID\x18\x04 \x01(\x03\x12\x1c\n\x14mitigationPlatformID\x18\x05 \x01(\x03\x12\x1a\n\x12mitigationMethodID\x18\x06 \x01(\x03\"e\n\x0cInsightEvent\x12\x11\n\tinsightID\x18\x01 \x01(\t\x12\x16\n\x0e\x64\x61taSourceType\x18\x02 \x01(\t\x12\x13\n\x0binsightName\x18\x03 \x01(\t\x12\x15\n\rinsightFamily\x18\x04 \x01(\t\"B\n\x17MitigationPlatformEvent\x12\x12\n\nplatformID\x18\x01 \x01(\x03\x12\x13\n\x0b\x64\x65scription\x18\x02 \x01(\t\"\xb9\x01\n\x0cGenericEvent\x12\r\n\x05title\x18\x01 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x02 \x01(\t\x12\x0b\n\x03url\x18\x03 \x01(\t\x12\x38\n\x03kvs\x18\x04 \x03(\x0b\x32+.kentik.api.notify.v0.GenericEvent.KvsEntry\x12\x12\n\nchannelIDs\x18\x05 \x03(\x03\x1a*\n\x08KvsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t:\x02\x38\x01\x42\x0bZ\tv0/notifyb\x06proto3'
)




_NOTIFICATIONEVENT = _descriptor.Descriptor(
  name='NotificationEvent',
  full_name='kentik.api.notify.v0.NotificationEvent',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='companyID', full_name='kentik.api.notify.v0.NotificationEvent.companyID', index=0,
      number=1, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='alarmEvent', full_name='kentik.api.notify.v0.NotificationEvent.alarmEvent', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='mitigationEvent', full_name='kentik.api.notify.v0.NotificationEvent.mitigationEvent', index=2,
      number=3, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='insightEvent', full_name='kentik.api.notify.v0.NotificationEvent.insightEvent', index=3,
      number=4, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='mitigationPlatformEvent', full_name='kentik.api.notify.v0.NotificationEvent.mitigationPlatformEvent', index=4,
      number=5, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='genericEvent', full_name='kentik.api.notify.v0.NotificationEvent.genericEvent', index=5,
      number=6, type=11, cpp_type=10, label=1,
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
    _descriptor.OneofDescriptor(
      name='event', full_name='kentik.api.notify.v0.NotificationEvent.event',
      index=0, containing_type=None,
      create_key=_descriptor._internal_create_key,
    fields=[]),
  ],
  serialized_start=70,
  serialized_end=441,
)


_NOTIFICATIONEVENTRESPONSE = _descriptor.Descriptor(
  name='NotificationEventResponse',
  full_name='kentik.api.notify.v0.NotificationEventResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='ok', full_name='kentik.api.notify.v0.NotificationEventResponse.ok', index=0,
      number=1, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
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
  serialized_start=443,
  serialized_end=482,
)


_ALARMEVENT = _descriptor.Descriptor(
  name='AlarmEvent',
  full_name='kentik.api.notify.v0.AlarmEvent',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='alarmID', full_name='kentik.api.notify.v0.AlarmEvent.alarmID', index=0,
      number=1, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='alarmHistoryID', full_name='kentik.api.notify.v0.AlarmEvent.alarmHistoryID', index=1,
      number=2, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='policyID', full_name='kentik.api.notify.v0.AlarmEvent.policyID', index=2,
      number=3, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='thresholdID', full_name='kentik.api.notify.v0.AlarmEvent.thresholdID', index=3,
      number=4, type=3, cpp_type=2, label=1,
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
  serialized_start=484,
  serialized_end=576,
)


_MITIGATIONEVENT = _descriptor.Descriptor(
  name='MitigationEvent',
  full_name='kentik.api.notify.v0.MitigationEvent',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='mitigationID', full_name='kentik.api.notify.v0.MitigationEvent.mitigationID', index=0,
      number=1, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='mitigationEventID', full_name='kentik.api.notify.v0.MitigationEvent.mitigationEventID', index=1,
      number=2, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='policyID', full_name='kentik.api.notify.v0.MitigationEvent.policyID', index=2,
      number=3, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='thresholdID', full_name='kentik.api.notify.v0.MitigationEvent.thresholdID', index=3,
      number=4, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='mitigationPlatformID', full_name='kentik.api.notify.v0.MitigationEvent.mitigationPlatformID', index=4,
      number=5, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='mitigationMethodID', full_name='kentik.api.notify.v0.MitigationEvent.mitigationMethodID', index=5,
      number=6, type=3, cpp_type=2, label=1,
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
  serialized_start=579,
  serialized_end=742,
)


_INSIGHTEVENT = _descriptor.Descriptor(
  name='InsightEvent',
  full_name='kentik.api.notify.v0.InsightEvent',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='insightID', full_name='kentik.api.notify.v0.InsightEvent.insightID', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='dataSourceType', full_name='kentik.api.notify.v0.InsightEvent.dataSourceType', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='insightName', full_name='kentik.api.notify.v0.InsightEvent.insightName', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='insightFamily', full_name='kentik.api.notify.v0.InsightEvent.insightFamily', index=3,
      number=4, type=9, cpp_type=9, label=1,
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
  serialized_start=744,
  serialized_end=845,
)


_MITIGATIONPLATFORMEVENT = _descriptor.Descriptor(
  name='MitigationPlatformEvent',
  full_name='kentik.api.notify.v0.MitigationPlatformEvent',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='platformID', full_name='kentik.api.notify.v0.MitigationPlatformEvent.platformID', index=0,
      number=1, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='description', full_name='kentik.api.notify.v0.MitigationPlatformEvent.description', index=1,
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
  serialized_start=847,
  serialized_end=913,
)


_GENERICEVENT_KVSENTRY = _descriptor.Descriptor(
  name='KvsEntry',
  full_name='kentik.api.notify.v0.GenericEvent.KvsEntry',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='key', full_name='kentik.api.notify.v0.GenericEvent.KvsEntry.key', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='value', full_name='kentik.api.notify.v0.GenericEvent.KvsEntry.value', index=1,
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
  serialized_start=1059,
  serialized_end=1101,
)

_GENERICEVENT = _descriptor.Descriptor(
  name='GenericEvent',
  full_name='kentik.api.notify.v0.GenericEvent',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='title', full_name='kentik.api.notify.v0.GenericEvent.title', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='description', full_name='kentik.api.notify.v0.GenericEvent.description', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='url', full_name='kentik.api.notify.v0.GenericEvent.url', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='kvs', full_name='kentik.api.notify.v0.GenericEvent.kvs', index=3,
      number=4, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='channelIDs', full_name='kentik.api.notify.v0.GenericEvent.channelIDs', index=4,
      number=5, type=3, cpp_type=2, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[_GENERICEVENT_KVSENTRY, ],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=916,
  serialized_end=1101,
)

_NOTIFICATIONEVENT.fields_by_name['alarmEvent'].message_type = _ALARMEVENT
_NOTIFICATIONEVENT.fields_by_name['mitigationEvent'].message_type = _MITIGATIONEVENT
_NOTIFICATIONEVENT.fields_by_name['insightEvent'].message_type = _INSIGHTEVENT
_NOTIFICATIONEVENT.fields_by_name['mitigationPlatformEvent'].message_type = _MITIGATIONPLATFORMEVENT
_NOTIFICATIONEVENT.fields_by_name['genericEvent'].message_type = _GENERICEVENT
_NOTIFICATIONEVENT.oneofs_by_name['event'].fields.append(
  _NOTIFICATIONEVENT.fields_by_name['alarmEvent'])
_NOTIFICATIONEVENT.fields_by_name['alarmEvent'].containing_oneof = _NOTIFICATIONEVENT.oneofs_by_name['event']
_NOTIFICATIONEVENT.oneofs_by_name['event'].fields.append(
  _NOTIFICATIONEVENT.fields_by_name['mitigationEvent'])
_NOTIFICATIONEVENT.fields_by_name['mitigationEvent'].containing_oneof = _NOTIFICATIONEVENT.oneofs_by_name['event']
_NOTIFICATIONEVENT.oneofs_by_name['event'].fields.append(
  _NOTIFICATIONEVENT.fields_by_name['insightEvent'])
_NOTIFICATIONEVENT.fields_by_name['insightEvent'].containing_oneof = _NOTIFICATIONEVENT.oneofs_by_name['event']
_NOTIFICATIONEVENT.oneofs_by_name['event'].fields.append(
  _NOTIFICATIONEVENT.fields_by_name['mitigationPlatformEvent'])
_NOTIFICATIONEVENT.fields_by_name['mitigationPlatformEvent'].containing_oneof = _NOTIFICATIONEVENT.oneofs_by_name['event']
_NOTIFICATIONEVENT.oneofs_by_name['event'].fields.append(
  _NOTIFICATIONEVENT.fields_by_name['genericEvent'])
_NOTIFICATIONEVENT.fields_by_name['genericEvent'].containing_oneof = _NOTIFICATIONEVENT.oneofs_by_name['event']
_GENERICEVENT_KVSENTRY.containing_type = _GENERICEVENT
_GENERICEVENT.fields_by_name['kvs'].message_type = _GENERICEVENT_KVSENTRY
DESCRIPTOR.message_types_by_name['NotificationEvent'] = _NOTIFICATIONEVENT
DESCRIPTOR.message_types_by_name['NotificationEventResponse'] = _NOTIFICATIONEVENTRESPONSE
DESCRIPTOR.message_types_by_name['AlarmEvent'] = _ALARMEVENT
DESCRIPTOR.message_types_by_name['MitigationEvent'] = _MITIGATIONEVENT
DESCRIPTOR.message_types_by_name['InsightEvent'] = _INSIGHTEVENT
DESCRIPTOR.message_types_by_name['MitigationPlatformEvent'] = _MITIGATIONPLATFORMEVENT
DESCRIPTOR.message_types_by_name['GenericEvent'] = _GENERICEVENT
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

NotificationEvent = _reflection.GeneratedProtocolMessageType('NotificationEvent', (_message.Message,), {
  'DESCRIPTOR' : _NOTIFICATIONEVENT,
  '__module__' : 'kentik.notify.backend.v1.models_event_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.NotificationEvent)
  })
_sym_db.RegisterMessage(NotificationEvent)

NotificationEventResponse = _reflection.GeneratedProtocolMessageType('NotificationEventResponse', (_message.Message,), {
  'DESCRIPTOR' : _NOTIFICATIONEVENTRESPONSE,
  '__module__' : 'kentik.notify.backend.v1.models_event_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.NotificationEventResponse)
  })
_sym_db.RegisterMessage(NotificationEventResponse)

AlarmEvent = _reflection.GeneratedProtocolMessageType('AlarmEvent', (_message.Message,), {
  'DESCRIPTOR' : _ALARMEVENT,
  '__module__' : 'kentik.notify.backend.v1.models_event_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.AlarmEvent)
  })
_sym_db.RegisterMessage(AlarmEvent)

MitigationEvent = _reflection.GeneratedProtocolMessageType('MitigationEvent', (_message.Message,), {
  'DESCRIPTOR' : _MITIGATIONEVENT,
  '__module__' : 'kentik.notify.backend.v1.models_event_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.MitigationEvent)
  })
_sym_db.RegisterMessage(MitigationEvent)

InsightEvent = _reflection.GeneratedProtocolMessageType('InsightEvent', (_message.Message,), {
  'DESCRIPTOR' : _INSIGHTEVENT,
  '__module__' : 'kentik.notify.backend.v1.models_event_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.InsightEvent)
  })
_sym_db.RegisterMessage(InsightEvent)

MitigationPlatformEvent = _reflection.GeneratedProtocolMessageType('MitigationPlatformEvent', (_message.Message,), {
  'DESCRIPTOR' : _MITIGATIONPLATFORMEVENT,
  '__module__' : 'kentik.notify.backend.v1.models_event_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.MitigationPlatformEvent)
  })
_sym_db.RegisterMessage(MitigationPlatformEvent)

GenericEvent = _reflection.GeneratedProtocolMessageType('GenericEvent', (_message.Message,), {

  'KvsEntry' : _reflection.GeneratedProtocolMessageType('KvsEntry', (_message.Message,), {
    'DESCRIPTOR' : _GENERICEVENT_KVSENTRY,
    '__module__' : 'kentik.notify.backend.v1.models_event_pb2'
    # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.GenericEvent.KvsEntry)
    })
  ,
  'DESCRIPTOR' : _GENERICEVENT,
  '__module__' : 'kentik.notify.backend.v1.models_event_pb2'
  # @@protoc_insertion_point(class_scope:kentik.api.notify.v0.GenericEvent)
  })
_sym_db.RegisterMessage(GenericEvent)
_sym_db.RegisterMessage(GenericEvent.KvsEntry)


DESCRIPTOR._options = None
_GENERICEVENT_KVSENTRY._options = None
# @@protoc_insertion_point(module_scope)
