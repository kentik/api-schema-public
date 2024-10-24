# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/connectivity_checker/v202410beta1/connectivity_checker.proto

from google.protobuf.internal import enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.api import annotations_pb2 as google_dot_api_dot_annotations__pb2
from google.api import client_pb2 as google_dot_api_dot_client__pb2
from google.api import field_behavior_pb2 as google_dot_api_dot_field__behavior__pb2
from protoc_gen_openapiv2.options import annotations_pb2 as protoc__gen__openapiv2_dot_options_dot_annotations__pb2
from google.protobuf import timestamp_pb2 as google_dot_protobuf_dot_timestamp__pb2
from kentik.core.v202303 import annotations_pb2 as kentik_dot_core_dot_v202303_dot_annotations__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='kentik/connectivity_checker/v202410beta1/connectivity_checker.proto',
  package='kentik.connectivity_checker.v202410beta1',
  syntax='proto3',
  serialized_options=b'Zhgithub.com/kentik/api-schema-public/gen/go/kentik/connectivity_checker/v202410beta1;connectivity_checker\222A\360\021\022\376\017\n\037Kentik Connectivity Checker API\022\205\017# Overview\nThe Connectivity Checker API provides programmatic access to Kentik\'s Connectivity Checker, which allows the checking and monitoring of forward and return paths between two points on your cloud network, over a specified time range interval, for entities such as Instances, Subnets, and Network Interfaces.### Supported Cloud Providers\nThe functionality and configuration parameters supported by this API differ by cloud provider. The API currently supports the following providers:\n* [Amazon Web Services](https://kb.kentik.com/v0/Bd06.htm) (AWS)\n* [Microsoft Azure](https://kb.kentik.com/v0/Bd08.htm)\n\n### Supported Entity Types\nFor AWS, the API currently support checking connectivity between the following entities:\n* Subnets* Instances* Network Interfaces\nFor Azure, the API currently support checking connectivity between the following entities:\n* Subnets\n### Requirements\nFor Kentik\'s Connectivity Checker API to successfully query the connection between entity resources, aKentik Cloud Export must be configured for a supported Cloud Provider (Aws or Azure)(see [Cloud Exports and Devices] (https://kb.kentik.com/v4/Na00.htm#Na00-Cloud_Exports_and_Devices)).Once a cloud export has been successfully configured, Kentik will pull metadata at regular intervals from the account specified in the cloud export, and the Connectivity Checker will use this metadata to: * Visualize the path for a connection between any two points in your AWS network* Check routing and NACL/SG configuration to quickly highlight where a connection is blocked* Get a direct link to the misconfigured gateway or security policy in the cloud dashboard to quickly fix the issue\n### Frequency of available data\nBecause Connectivity Checker relies upon what\'s discovered during metadata retrieval, query results will be limited to the timeframe of the latest metadata-retrieval fetch.  Currently this is limited to 15-minutes intervals.\"E\n\026Kentik API Engineering\022+https://github.com/kentik/api-schema-public2\014v202410beta1*\001\0022\020application/json:\020application/jsonZD\n\036\n\005email\022\025\010\002\032\017X-CH-Auth-Email \002\n\"\n\005token\022\031\010\002\032\023X-CH-Auth-API-Token \002b\026\n\t\n\005email\022\000\n\t\n\005token\022\000rh\n)Kentik Connectivity Checker documentation\022;https://kb.kentik.com/v4/Na05.htm#Na05-Connectivity_Checker',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\nCkentik/connectivity_checker/v202410beta1/connectivity_checker.proto\x12(kentik.connectivity_checker.v202410beta1\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a.protoc-gen-openapiv2/options/annotations.proto\x1a\x1fgoogle/protobuf/timestamp.proto\x1a%kentik/core/v202303/annotations.proto\"\xe9\x06\n\x1f\x43reateConnectivityReportRequest\x12\x86\x01\n\x0e\x63loud_provider\x18\x01 \x01(\x0e\x32\x37.kentik.connectivity_checker.v202410beta1.CloudProviderB&\x92\x41\x1f\x32\x1d\x43loud provider identification\xe2\x41\x01\x02R\rcloudProvider\x12!\n\x03src\x18\x02 \x01(\tB\x0f\x92\x41\x08\x32\x06Source\xe2\x41\x01\x02R\x03src\x12&\n\x03\x64st\x18\x03 \x01(\tB\x14\x92\x41\r2\x0b\x44\x65stination\xe2\x41\x01\x02R\x03\x64st\x12\x34\n\x08\x64st_port\x18\x04 \x01(\tB\x19\x92\x41\x12\x32\x10\x44\x65stination Port\xe2\x41\x01\x02R\x07\x64stPort\x12-\n\x08protocol\x18\x05 \x01(\tB\x11\x92\x41\n2\x08Protocol\xe2\x41\x01\x02R\x08protocol\x12h\n\x08src_type\x18\x06 \x01(\x0e\x32\x34.kentik.connectivity_checker.v202410beta1.EntityTypeB\x17\x92\x41\x14\x32\x12Source Entity TypeR\x07srcType\x12m\n\x08\x64st_type\x18\x07 \x01(\x0e\x32\x34.kentik.connectivity_checker.v202410beta1.EntityTypeB\x1c\x92\x41\x19\x32\x17\x44\x65stination Entity TypeR\x07\x64stType\x12\x86\x01\n\nstart_time\x18\x08 \x01(\x0b\x32\x1a.google.protobuf.TimestampBK\x92\x41\x44\x32\x42Start Timestamp (UTC) which defines the time range for the report.\xe2\x41\x01\x02R\tstartTime\x12\x80\x01\n\x08\x65nd_time\x18\t \x01(\x0b\x32\x1a.google.protobuf.TimestampBI\x92\x41\x42\x32@End timestamp (UTC) which defines the time range for the report.\xe2\x41\x01\x02R\x07\x65ndTime\x12(\n\x04name\x18\n \x01(\tB\x14\x92\x41\r2\x0bReport Name\xe2\x41\x01\x01R\x04name\"\xd0\x05\n CreateConnectivityReportResponse\x12[\n\treachable\x18\x01 \x01(\x08\x42=\x92\x41\x36\x32\x34\x41ttribute controlling whether the instance is active\xe2\x41\x01\x03R\treachable\x12h\n\x10return_reachable\x18\x02 \x01(\x08\x42=\x92\x41\x36\x32\x34\x41ttribute controlling whether the instance is active\xe2\x41\x01\x03R\x0freturnReachable\x12|\n\x0cquery_status\x18\x03 \x01(\tBY\x92\x41R2PARN of the IAM role granted access to the S3 bucket and describe API end-points.\xe2\x41\x01\x03R\x0bqueryStatus\x12x\n\nreport_url\x18\x04 \x01(\tBY\x92\x41R2PARN of the IAM role granted access to the S3 bucket and describe API end-points.\xe2\x41\x01\x03R\treportUrl\x12o\n\x05paths\x18\x05 \x03(\tBY\x92\x41R2PARN of the IAM role granted access to the S3 bucket and describe API end-points.\xe2\x41\x01\x03R\x05paths\x12|\n\x0creturn_paths\x18\x06 \x03(\tBY\x92\x41R2PARN of the IAM role granted access to the S3 bucket and describe API end-points.\xe2\x41\x01\x03R\x0breturnPaths*a\n\rCloudProvider\x12\x1e\n\x1a\x43LOUD_PROVIDER_UNSPECIFIED\x10\x00\x12\x16\n\x12\x43LOUD_PROVIDER_AWS\x10\x01\x12\x18\n\x14\x43LOUD_PROVIDER_AZURE\x10\x02*~\n\nEntityType\x12\x1b\n\x17\x45NTITY_TYPE_UNSPECIFIED\x10\x00\x12\x16\n\x12\x45NTITY_TYPE_SUBNET\x10\x01\x12\x18\n\x14\x45NTITY_TYPE_INSTANCE\x10\x02\x12!\n\x1d\x45NTITY_TYPE_NETWORK_INTERFACE\x10\x03\x32\x85\x04\n\x1f\x43onnectivityCheckerAdminService\x12\xa7\x03\n\x18\x43reateConnectivityReport\x12I.kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest\x1aJ.kentik.connectivity_checker.v202410beta1.CreateConnectivityReportResponse\"\xf3\x01\x92\x41\x97\x01\x12%Create a Connectivity Checker Report.\x1aTCreate a connectivity checker report based on configuration provided in the request.*\x18\x43reateConnectivityReport\xf2\xd7\x02 admin.connectivity_checker:write\x82\xd3\xe4\x93\x02.\")/connectivity_checker/v202410beta1/create:\x01*\x1a\x38\xca\x41\x13grpc.api.kentik.com\xea\xd7\x02\x1a\x61\x64min.connectivity_checker\x90\xd8\x02\x03\x42\xde\x12Zhgithub.com/kentik/api-schema-public/gen/go/kentik/connectivity_checker/v202410beta1;connectivity_checker\x92\x41\xf0\x11\x12\xfe\x0f\n\x1fKentik Connectivity Checker API\x12\x85\x0f# Overview\nThe Connectivity Checker API provides programmatic access to Kentik\'s Connectivity Checker, which allows the checking and monitoring of forward and return paths between two points on your cloud network, over a specified time range interval, for entities such as Instances, Subnets, and Network Interfaces.### Supported Cloud Providers\nThe functionality and configuration parameters supported by this API differ by cloud provider. The API currently supports the following providers:\n* [Amazon Web Services](https://kb.kentik.com/v0/Bd06.htm) (AWS)\n* [Microsoft Azure](https://kb.kentik.com/v0/Bd08.htm)\n\n### Supported Entity Types\nFor AWS, the API currently support checking connectivity between the following entities:\n* Subnets* Instances* Network Interfaces\nFor Azure, the API currently support checking connectivity between the following entities:\n* Subnets\n### Requirements\nFor Kentik\'s Connectivity Checker API to successfully query the connection between entity resources, aKentik Cloud Export must be configured for a supported Cloud Provider (Aws or Azure)(see [Cloud Exports and Devices] (https://kb.kentik.com/v4/Na00.htm#Na00-Cloud_Exports_and_Devices)).Once a cloud export has been successfully configured, Kentik will pull metadata at regular intervals from the account specified in the cloud export, and the Connectivity Checker will use this metadata to: * Visualize the path for a connection between any two points in your AWS network* Check routing and NACL/SG configuration to quickly highlight where a connection is blocked* Get a direct link to the misconfigured gateway or security policy in the cloud dashboard to quickly fix the issue\n### Frequency of available data\nBecause Connectivity Checker relies upon what\'s discovered during metadata retrieval, query results will be limited to the timeframe of the latest metadata-retrieval fetch.  Currently this is limited to 15-minutes intervals.\"E\n\x16Kentik API Engineering\x12+https://github.com/kentik/api-schema-public2\x0cv202410beta1*\x01\x02\x32\x10\x61pplication/json:\x10\x61pplication/jsonZD\n\x1e\n\x05\x65mail\x12\x15\x08\x02\x1a\x0fX-CH-Auth-Email \x02\n\"\n\x05token\x12\x19\x08\x02\x1a\x13X-CH-Auth-API-Token \x02\x62\x16\n\t\n\x05\x65mail\x12\x00\n\t\n\x05token\x12\x00rh\n)Kentik Connectivity Checker documentation\x12;https://kb.kentik.com/v4/Na05.htm#Na05-Connectivity_Checkerb\x06proto3'
  ,
  dependencies=[google_dot_api_dot_annotations__pb2.DESCRIPTOR,google_dot_api_dot_client__pb2.DESCRIPTOR,google_dot_api_dot_field__behavior__pb2.DESCRIPTOR,protoc__gen__openapiv2_dot_options_dot_annotations__pb2.DESCRIPTOR,google_dot_protobuf_dot_timestamp__pb2.DESCRIPTOR,kentik_dot_core_dot_v202303_dot_annotations__pb2.DESCRIPTOR,])

_CLOUDPROVIDER = _descriptor.EnumDescriptor(
  name='CloudProvider',
  full_name='kentik.connectivity_checker.v202410beta1.CloudProvider',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='CLOUD_PROVIDER_UNSPECIFIED', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='CLOUD_PROVIDER_AWS', index=1, number=1,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='CLOUD_PROVIDER_AZURE', index=2, number=2,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=1920,
  serialized_end=2017,
)
_sym_db.RegisterEnumDescriptor(_CLOUDPROVIDER)

CloudProvider = enum_type_wrapper.EnumTypeWrapper(_CLOUDPROVIDER)
_ENTITYTYPE = _descriptor.EnumDescriptor(
  name='EntityType',
  full_name='kentik.connectivity_checker.v202410beta1.EntityType',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='ENTITY_TYPE_UNSPECIFIED', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='ENTITY_TYPE_SUBNET', index=1, number=1,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='ENTITY_TYPE_INSTANCE', index=2, number=2,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='ENTITY_TYPE_NETWORK_INTERFACE', index=3, number=3,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=2019,
  serialized_end=2145,
)
_sym_db.RegisterEnumDescriptor(_ENTITYTYPE)

EntityType = enum_type_wrapper.EnumTypeWrapper(_ENTITYTYPE)
CLOUD_PROVIDER_UNSPECIFIED = 0
CLOUD_PROVIDER_AWS = 1
CLOUD_PROVIDER_AZURE = 2
ENTITY_TYPE_UNSPECIFIED = 0
ENTITY_TYPE_SUBNET = 1
ENTITY_TYPE_INSTANCE = 2
ENTITY_TYPE_NETWORK_INTERFACE = 3



_CREATECONNECTIVITYREPORTREQUEST = _descriptor.Descriptor(
  name='CreateConnectivityReportRequest',
  full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='cloud_provider', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest.cloud_provider', index=0,
      number=1, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\0372\035Cloud provider identification\342A\001\002', json_name='cloudProvider', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='src', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest.src', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\0102\006Source\342A\001\002', json_name='src', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='dst', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest.dst', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\r2\013Destination\342A\001\002', json_name='dst', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='dst_port', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest.dst_port', index=3,
      number=4, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\0222\020Destination Port\342A\001\002', json_name='dstPort', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='protocol', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest.protocol', index=4,
      number=5, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\n2\010Protocol\342A\001\002', json_name='protocol', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='src_type', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest.src_type', index=5,
      number=6, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\0242\022Source Entity Type', json_name='srcType', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='dst_type', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest.dst_type', index=6,
      number=7, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\0312\027Destination Entity Type', json_name='dstType', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='start_time', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest.start_time', index=7,
      number=8, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222AD2BStart Timestamp (UTC) which defines the time range for the report.\342A\001\002', json_name='startTime', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='end_time', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest.end_time', index=8,
      number=9, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222AB2@End timestamp (UTC) which defines the time range for the report.\342A\001\002', json_name='endTime', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='name', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest.name', index=9,
      number=10, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A\r2\013Report Name\342A\001\001', json_name='name', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=322,
  serialized_end=1195,
)


_CREATECONNECTIVITYREPORTRESPONSE = _descriptor.Descriptor(
  name='CreateConnectivityReportResponse',
  full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='reachable', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportResponse.reachable', index=0,
      number=1, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A624Attribute controlling whether the instance is active\342A\001\003', json_name='reachable', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='return_reachable', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportResponse.return_reachable', index=1,
      number=2, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222A624Attribute controlling whether the instance is active\342A\001\003', json_name='returnReachable', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='query_status', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportResponse.query_status', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222AR2PARN of the IAM role granted access to the S3 bucket and describe API end-points.\342A\001\003', json_name='queryStatus', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='report_url', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportResponse.report_url', index=3,
      number=4, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222AR2PARN of the IAM role granted access to the S3 bucket and describe API end-points.\342A\001\003', json_name='reportUrl', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='paths', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportResponse.paths', index=4,
      number=5, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222AR2PARN of the IAM role granted access to the S3 bucket and describe API end-points.\342A\001\003', json_name='paths', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='return_paths', full_name='kentik.connectivity_checker.v202410beta1.CreateConnectivityReportResponse.return_paths', index=5,
      number=6, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=b'\222AR2PARN of the IAM role granted access to the S3 bucket and describe API end-points.\342A\001\003', json_name='returnPaths', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1198,
  serialized_end=1918,
)

_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['cloud_provider'].enum_type = _CLOUDPROVIDER
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['src_type'].enum_type = _ENTITYTYPE
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['dst_type'].enum_type = _ENTITYTYPE
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['start_time'].message_type = google_dot_protobuf_dot_timestamp__pb2._TIMESTAMP
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['end_time'].message_type = google_dot_protobuf_dot_timestamp__pb2._TIMESTAMP
DESCRIPTOR.message_types_by_name['CreateConnectivityReportRequest'] = _CREATECONNECTIVITYREPORTREQUEST
DESCRIPTOR.message_types_by_name['CreateConnectivityReportResponse'] = _CREATECONNECTIVITYREPORTRESPONSE
DESCRIPTOR.enum_types_by_name['CloudProvider'] = _CLOUDPROVIDER
DESCRIPTOR.enum_types_by_name['EntityType'] = _ENTITYTYPE
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

CreateConnectivityReportRequest = _reflection.GeneratedProtocolMessageType('CreateConnectivityReportRequest', (_message.Message,), {
  'DESCRIPTOR' : _CREATECONNECTIVITYREPORTREQUEST,
  '__module__' : 'kentik.connectivity_checker.v202410beta1.connectivity_checker_pb2'
  # @@protoc_insertion_point(class_scope:kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequest)
  })
_sym_db.RegisterMessage(CreateConnectivityReportRequest)

CreateConnectivityReportResponse = _reflection.GeneratedProtocolMessageType('CreateConnectivityReportResponse', (_message.Message,), {
  'DESCRIPTOR' : _CREATECONNECTIVITYREPORTRESPONSE,
  '__module__' : 'kentik.connectivity_checker.v202410beta1.connectivity_checker_pb2'
  # @@protoc_insertion_point(class_scope:kentik.connectivity_checker.v202410beta1.CreateConnectivityReportResponse)
  })
_sym_db.RegisterMessage(CreateConnectivityReportResponse)


DESCRIPTOR._options = None
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['cloud_provider']._options = None
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['src']._options = None
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['dst']._options = None
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['dst_port']._options = None
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['protocol']._options = None
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['src_type']._options = None
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['dst_type']._options = None
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['start_time']._options = None
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['end_time']._options = None
_CREATECONNECTIVITYREPORTREQUEST.fields_by_name['name']._options = None
_CREATECONNECTIVITYREPORTRESPONSE.fields_by_name['reachable']._options = None
_CREATECONNECTIVITYREPORTRESPONSE.fields_by_name['return_reachable']._options = None
_CREATECONNECTIVITYREPORTRESPONSE.fields_by_name['query_status']._options = None
_CREATECONNECTIVITYREPORTRESPONSE.fields_by_name['report_url']._options = None
_CREATECONNECTIVITYREPORTRESPONSE.fields_by_name['paths']._options = None
_CREATECONNECTIVITYREPORTRESPONSE.fields_by_name['return_paths']._options = None

_CONNECTIVITYCHECKERADMINSERVICE = _descriptor.ServiceDescriptor(
  name='ConnectivityCheckerAdminService',
  full_name='kentik.connectivity_checker.v202410beta1.ConnectivityCheckerAdminService',
  file=DESCRIPTOR,
  index=0,
  serialized_options=b'\312A\023grpc.api.kentik.com\352\327\002\032admin.connectivity_checker\220\330\002\003',
  create_key=_descriptor._internal_create_key,
  serialized_start=2148,
  serialized_end=2665,
  methods=[
  _descriptor.MethodDescriptor(
    name='CreateConnectivityReport',
    full_name='kentik.connectivity_checker.v202410beta1.ConnectivityCheckerAdminService.CreateConnectivityReport',
    index=0,
    containing_service=None,
    input_type=_CREATECONNECTIVITYREPORTREQUEST,
    output_type=_CREATECONNECTIVITYREPORTRESPONSE,
    serialized_options=b'\222A\227\001\022%Create a Connectivity Checker Report.\032TCreate a connectivity checker report based on configuration provided in the request.*\030CreateConnectivityReport\362\327\002 admin.connectivity_checker:write\202\323\344\223\002.\")/connectivity_checker/v202410beta1/create:\001*',
    create_key=_descriptor._internal_create_key,
  ),
])
_sym_db.RegisterServiceDescriptor(_CONNECTIVITYCHECKERADMINSERVICE)

DESCRIPTOR.services_by_name['ConnectivityCheckerAdminService'] = _CONNECTIVITYCHECKERADMINSERVICE

# @@protoc_insertion_point(module_scope)
