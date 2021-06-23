# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/type/calendar_period.proto
"""Generated protocol buffer code."""
from google.protobuf.internal import enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='google/type/calendar_period.proto',
  package='google.type',
  syntax='proto3',
  serialized_options=b'\n\017com.google.typeB\023CalendarPeriodProtoP\001ZHgoogle.golang.org/genproto/googleapis/type/calendarperiod;calendarperiod\242\002\003GTP',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n!google/type/calendar_period.proto\x12\x0bgoogle.type*\x7f\n\x0e\x43\x61lendarPeriod\x12\x1f\n\x1b\x43\x41LENDAR_PERIOD_UNSPECIFIED\x10\x00\x12\x07\n\x03\x44\x41Y\x10\x01\x12\x08\n\x04WEEK\x10\x02\x12\r\n\tFORTNIGHT\x10\x03\x12\t\n\x05MONTH\x10\x04\x12\x0b\n\x07QUARTER\x10\x05\x12\x08\n\x04HALF\x10\x06\x12\x08\n\x04YEAR\x10\x07\x42x\n\x0f\x63om.google.typeB\x13\x43\x61lendarPeriodProtoP\x01ZHgoogle.golang.org/genproto/googleapis/type/calendarperiod;calendarperiod\xa2\x02\x03GTPb\x06proto3'
)

_CALENDARPERIOD = _descriptor.EnumDescriptor(
  name='CalendarPeriod',
  full_name='google.type.CalendarPeriod',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='CALENDAR_PERIOD_UNSPECIFIED', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='DAY', index=1, number=1,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='WEEK', index=2, number=2,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='FORTNIGHT', index=3, number=3,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='MONTH', index=4, number=4,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='QUARTER', index=5, number=5,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='HALF', index=6, number=6,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='YEAR', index=7, number=7,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=50,
  serialized_end=177,
)
_sym_db.RegisterEnumDescriptor(_CALENDARPERIOD)

CalendarPeriod = enum_type_wrapper.EnumTypeWrapper(_CALENDARPERIOD)
CALENDAR_PERIOD_UNSPECIFIED = 0
DAY = 1
WEEK = 2
FORTNIGHT = 3
MONTH = 4
QUARTER = 5
HALF = 6
YEAR = 7


DESCRIPTOR.enum_types_by_name['CalendarPeriod'] = _CALENDARPERIOD
_sym_db.RegisterFileDescriptor(DESCRIPTOR)


DESCRIPTOR._options = None
# @@protoc_insertion_point(module_scope)
