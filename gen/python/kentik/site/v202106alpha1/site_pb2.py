# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kentik/site/v202106alpha1/site.proto

from google.protobuf.internal import enum_type_wrapper
from google.protobuf import descriptor as _descriptor
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
from kentik.core.v202303 import annotations_pb2 as kentik_dot_core_dot_v202303_dot_annotations__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='kentik/site/v202106alpha1/site.proto',
  package='kentik.site.v202106alpha1',
  syntax='proto3',
  serialized_options=b'ZIgithub.com/kentik/api-schema-public/gen/go/kentik/site/v202106alpha1;site\222A\345\002\022\177\n\010Site API\022K--- This API has been deprecated and will be removed in the near future ---\"\030\n\026Kentik API Engineering2\014202106alpha1*\001\0022\020application/json:\020application/jsonZD\n\036\n\005email\022\025\010\002\032\017X-CH-Auth-Email \002\n\"\n\005token\022\031\010\002\032\023X-CH-Auth-API-Token \002b\026\n\t\n\005email\022\000\n\t\n\005token\022\000r]\n%General information about Kentik APIs\0224https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_Overview',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n$kentik/site/v202106alpha1/site.proto\x12\x19kentik.site.v202106alpha1\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x18google/type/latlng.proto\x1a google/type/postal_address.proto\x1a.protoc-gen-openapiv2/options/annotations.proto\x1a%kentik/core/v202303/annotations.proto\"\x9e\x01\n\x14SiteIpClassification\x12\x37\n\x17infrastructure_networks\x18\x01 \x03(\tR\x16infrastructureNetworks\x12\x30\n\x14user_access_networks\x18\x02 \x03(\tR\x12userAccessNetworks\x12\x1b\n\tother_ips\x18\x03 \x03(\tR\x08otherIps\"=\n\x08SubLayer\x12\x12\n\x04name\x18\x01 \x01(\tR\x04name\x12\x1d\n\ndevice_ids\x18\x02 \x03(\tR\tdeviceIds\"K\n\x05Layer\x12\x42\n\nsub_layers\x18\x01 \x03(\x0b\x32#.kentik.site.v202106alpha1.SubLayerR\tsubLayers\"\xf5\x02\n\x04Site\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\x12\x14\n\x05title\x18\x03 \x01(\tR\x05title\x12\x33\n\ncoordinate\x18\x04 \x01(\x0b\x32\x13.google.type.LatLngR\ncoordinate\x12\x34\n\x07\x61\x64\x64ress\x18\x05 \x01(\x0b\x32\x1a.google.type.PostalAddressR\x07\x61\x64\x64ress\x12\x37\n\x04type\x18\x06 \x01(\x0e\x32#.kentik.site.v202106alpha1.SiteTypeR\x04type\x12W\n\x0e\x63lassification\x18\x07 \x01(\x0b\x32/.kentik.site.v202106alpha1.SiteIpClassificationR\x0e\x63lassification\x12\x44\n\x0c\x61rchitecture\x18\x08 \x03(\x0b\x32 .kentik.site.v202106alpha1.LayerR\x0c\x61rchitectureJ\x04\x08\x02\x10\x03\"\x11\n\x0fListSiteRequest\"n\n\x10ListSiteResponse\x12\x35\n\x05sites\x18\x01 \x03(\x0b\x32\x1f.kentik.site.v202106alpha1.SiteR\x05sites\x12#\n\rinvalid_count\x18\x02 \x01(\rR\x0cinvalidCount\" \n\x0eGetSiteRequest\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\"F\n\x0fGetSiteResponse\x12\x33\n\x04site\x18\x01 \x01(\x0b\x32\x1f.kentik.site.v202106alpha1.SiteR\x04site\"H\n\x11\x43reateSiteRequest\x12\x33\n\x04site\x18\x01 \x01(\x0b\x32\x1f.kentik.site.v202106alpha1.SiteR\x04site\"I\n\x12\x43reateSiteResponse\x12\x33\n\x04site\x18\x01 \x01(\x0b\x32\x1f.kentik.site.v202106alpha1.SiteR\x04site\"H\n\x11UpdateSiteRequest\x12\x33\n\x04site\x18\x01 \x01(\x0b\x32\x1f.kentik.site.v202106alpha1.SiteR\x04site\"I\n\x12UpdateSiteResponse\x12\x33\n\x04site\x18\x01 \x01(\x0b\x32\x1f.kentik.site.v202106alpha1.SiteR\x04site\"#\n\x11\x44\x65leteSiteRequest\x12\x0e\n\x02id\x18\x01 \x01(\tR\x02id\"\x14\n\x12\x44\x65leteSiteResponse*\xb4\x01\n\x08SiteType\x12\x19\n\x15SITE_TYPE_UNSPECIFIED\x10\x00\x12\x19\n\x15SITE_TYPE_DATA_CENTER\x10\x01\x12\x13\n\x0fSITE_TYPE_CLOUD\x10\x02\x12\x14\n\x10SITE_TYPE_BRANCH\x10\x03\x12\x1a\n\x16SITE_TYPE_CONNECTIVITY\x10\x04\x12\x16\n\x12SITE_TYPE_CUSTOMER\x10\x05\x12\x13\n\x0fSITE_TYPE_OTHER\x10\x06\x32\xdc\t\n\x0bSiteService\x12\xcd\x01\n\x08ListSite\x12*.kentik.site.v202106alpha1.ListSiteRequest\x1a+.kentik.site.v202106alpha1.ListSiteResponse\"h\x92\x41\x31\x12\x0bList sites.\x1a\x18Returns a list of sites.*\x08SiteList\xf2\xd7\x02\x0f\x61\x64min.site:read\x82\xd3\xe4\x93\x02\x1b\x12\x19/site/v202106alpha1/sites\x12\xea\x01\n\x07GetSite\x12).kentik.site.v202106alpha1.GetSiteRequest\x1a*.kentik.site.v202106alpha1.GetSiteResponse\"\x87\x01\x92\x41K\x12\x0bGet a site.\x1a\x33Returns information about a site specified with ID.*\x07SiteGet\xf2\xd7\x02\x0f\x61\x64min.site:read\x82\xd3\xe4\x93\x02 \x12\x1e/site/v202106alpha1/sites/{id}\x12\xf1\x01\n\nCreateSite\x12,.kentik.site.v202106alpha1.CreateSiteRequest\x1a-.kentik.site.v202106alpha1.CreateSiteResponse\"\x85\x01\x92\x41J\x12\x0e\x43reate a site.\x1a,Create a site from request. returns created.*\nSiteCreate\xf2\xd7\x02\x10\x61\x64min.site:write\x82\xd3\xe4\x93\x02\x1e\"\x19/site/v202106alpha1/sites:\x01*\x12\x85\x02\n\nUpdateSite\x12,.kentik.site.v202106alpha1.UpdateSiteRequest\x1a-.kentik.site.v202106alpha1.UpdateSiteResponse\"\x99\x01\x92\x41T\x12\x0eUpdate a site.\x1a\x36Replaces the entire site attributes specified with id.*\nSiteUpdate\xf2\xd7\x02\x10\x61\x64min.site:write\x82\xd3\xe4\x93\x02(\x1a#/site/v202106alpha1/sites/{site.id}:\x01*\x12\xe9\x01\n\nDeleteSite\x12,.kentik.site.v202106alpha1.DeleteSiteRequest\x1a-.kentik.site.v202106alpha1.DeleteSiteResponse\"~\x92\x41\x41\x12\x0e\x44\x65lete a site.\x1a#Deletes the site specified with id.*\nSiteDelete\xf2\xd7\x02\x10\x61\x64min.site:write\x82\xd3\xe4\x93\x02 *\x1e/site/v202106alpha1/sites/{id}\x1a(\xca\x41\x13grpc.api.kentik.com\xea\xd7\x02\nadmin.site\x90\xd8\x02\x03\x42\xb4\x03ZIgithub.com/kentik/api-schema-public/gen/go/kentik/site/v202106alpha1;site\x92\x41\xe5\x02\x12\x7f\n\x08Site API\x12K--- This API has been deprecated and will be removed in the near future ---\"\x18\n\x16Kentik API Engineering2\x0c\x32\x30\x32\x31\x30\x36\x61lpha1*\x01\x02\x32\x10\x61pplication/json:\x10\x61pplication/jsonZD\n\x1e\n\x05\x65mail\x12\x15\x08\x02\x1a\x0fX-CH-Auth-Email \x02\n\"\n\x05token\x12\x19\x08\x02\x1a\x13X-CH-Auth-API-Token \x02\x62\x16\n\t\n\x05\x65mail\x12\x00\n\t\n\x05token\x12\x00r]\n%General information about Kentik APIs\x12\x34https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_Overviewb\x06proto3'
  ,
  dependencies=[google_dot_api_dot_annotations__pb2.DESCRIPTOR,google_dot_api_dot_client__pb2.DESCRIPTOR,google_dot_type_dot_latlng__pb2.DESCRIPTOR,google_dot_type_dot_postal__address__pb2.DESCRIPTOR,protoc__gen__openapiv2_dot_options_dot_annotations__pb2.DESCRIPTOR,kentik_dot_core_dot_v202303_dot_annotations__pb2.DESCRIPTOR,])

_SITETYPE = _descriptor.EnumDescriptor(
  name='SiteType',
  full_name='kentik.site.v202106alpha1.SiteType',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='SITE_TYPE_UNSPECIFIED', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='SITE_TYPE_DATA_CENTER', index=1, number=1,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='SITE_TYPE_CLOUD', index=2, number=2,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='SITE_TYPE_BRANCH', index=3, number=3,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='SITE_TYPE_CONNECTIVITY', index=4, number=4,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='SITE_TYPE_CUSTOMER', index=5, number=5,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='SITE_TYPE_OTHER', index=6, number=6,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=1541,
  serialized_end=1721,
)
_sym_db.RegisterEnumDescriptor(_SITETYPE)

SiteType = enum_type_wrapper.EnumTypeWrapper(_SITETYPE)
SITE_TYPE_UNSPECIFIED = 0
SITE_TYPE_DATA_CENTER = 1
SITE_TYPE_CLOUD = 2
SITE_TYPE_BRANCH = 3
SITE_TYPE_CONNECTIVITY = 4
SITE_TYPE_CUSTOMER = 5
SITE_TYPE_OTHER = 6



_SITEIPCLASSIFICATION = _descriptor.Descriptor(
  name='SiteIpClassification',
  full_name='kentik.site.v202106alpha1.SiteIpClassification',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='infrastructure_networks', full_name='kentik.site.v202106alpha1.SiteIpClassification.infrastructure_networks', index=0,
      number=1, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='infrastructureNetworks', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='user_access_networks', full_name='kentik.site.v202106alpha1.SiteIpClassification.user_access_networks', index=1,
      number=2, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='userAccessNetworks', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='other_ips', full_name='kentik.site.v202106alpha1.SiteIpClassification.other_ips', index=2,
      number=3, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='otherIps', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=270,
  serialized_end=428,
)


_SUBLAYER = _descriptor.Descriptor(
  name='SubLayer',
  full_name='kentik.site.v202106alpha1.SubLayer',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='name', full_name='kentik.site.v202106alpha1.SubLayer.name', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='name', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='device_ids', full_name='kentik.site.v202106alpha1.SubLayer.device_ids', index=1,
      number=2, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='deviceIds', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=430,
  serialized_end=491,
)


_LAYER = _descriptor.Descriptor(
  name='Layer',
  full_name='kentik.site.v202106alpha1.Layer',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='sub_layers', full_name='kentik.site.v202106alpha1.Layer.sub_layers', index=0,
      number=1, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='subLayers', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=493,
  serialized_end=568,
)


_SITE = _descriptor.Descriptor(
  name='Site',
  full_name='kentik.site.v202106alpha1.Site',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='kentik.site.v202106alpha1.Site.id', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='id', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='title', full_name='kentik.site.v202106alpha1.Site.title', index=1,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='title', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='coordinate', full_name='kentik.site.v202106alpha1.Site.coordinate', index=2,
      number=4, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='coordinate', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='address', full_name='kentik.site.v202106alpha1.Site.address', index=3,
      number=5, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='address', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='type', full_name='kentik.site.v202106alpha1.Site.type', index=4,
      number=6, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='type', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='classification', full_name='kentik.site.v202106alpha1.Site.classification', index=5,
      number=7, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='classification', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='architecture', full_name='kentik.site.v202106alpha1.Site.architecture', index=6,
      number=8, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='architecture', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=571,
  serialized_end=944,
)


_LISTSITEREQUEST = _descriptor.Descriptor(
  name='ListSiteRequest',
  full_name='kentik.site.v202106alpha1.ListSiteRequest',
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
  serialized_start=946,
  serialized_end=963,
)


_LISTSITERESPONSE = _descriptor.Descriptor(
  name='ListSiteResponse',
  full_name='kentik.site.v202106alpha1.ListSiteResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='sites', full_name='kentik.site.v202106alpha1.ListSiteResponse.sites', index=0,
      number=1, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='sites', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='invalid_count', full_name='kentik.site.v202106alpha1.ListSiteResponse.invalid_count', index=1,
      number=2, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='invalidCount', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=965,
  serialized_end=1075,
)


_GETSITEREQUEST = _descriptor.Descriptor(
  name='GetSiteRequest',
  full_name='kentik.site.v202106alpha1.GetSiteRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='kentik.site.v202106alpha1.GetSiteRequest.id', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='id', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1077,
  serialized_end=1109,
)


_GETSITERESPONSE = _descriptor.Descriptor(
  name='GetSiteResponse',
  full_name='kentik.site.v202106alpha1.GetSiteResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='site', full_name='kentik.site.v202106alpha1.GetSiteResponse.site', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='site', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1111,
  serialized_end=1181,
)


_CREATESITEREQUEST = _descriptor.Descriptor(
  name='CreateSiteRequest',
  full_name='kentik.site.v202106alpha1.CreateSiteRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='site', full_name='kentik.site.v202106alpha1.CreateSiteRequest.site', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='site', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1183,
  serialized_end=1255,
)


_CREATESITERESPONSE = _descriptor.Descriptor(
  name='CreateSiteResponse',
  full_name='kentik.site.v202106alpha1.CreateSiteResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='site', full_name='kentik.site.v202106alpha1.CreateSiteResponse.site', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='site', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1257,
  serialized_end=1330,
)


_UPDATESITEREQUEST = _descriptor.Descriptor(
  name='UpdateSiteRequest',
  full_name='kentik.site.v202106alpha1.UpdateSiteRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='site', full_name='kentik.site.v202106alpha1.UpdateSiteRequest.site', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='site', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1332,
  serialized_end=1404,
)


_UPDATESITERESPONSE = _descriptor.Descriptor(
  name='UpdateSiteResponse',
  full_name='kentik.site.v202106alpha1.UpdateSiteResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='site', full_name='kentik.site.v202106alpha1.UpdateSiteResponse.site', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='site', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1406,
  serialized_end=1479,
)


_DELETESITEREQUEST = _descriptor.Descriptor(
  name='DeleteSiteRequest',
  full_name='kentik.site.v202106alpha1.DeleteSiteRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='kentik.site.v202106alpha1.DeleteSiteRequest.id', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, json_name='id', file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
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
  serialized_start=1481,
  serialized_end=1516,
)


_DELETESITERESPONSE = _descriptor.Descriptor(
  name='DeleteSiteResponse',
  full_name='kentik.site.v202106alpha1.DeleteSiteResponse',
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
  serialized_start=1518,
  serialized_end=1538,
)

_LAYER.fields_by_name['sub_layers'].message_type = _SUBLAYER
_SITE.fields_by_name['coordinate'].message_type = google_dot_type_dot_latlng__pb2._LATLNG
_SITE.fields_by_name['address'].message_type = google_dot_type_dot_postal__address__pb2._POSTALADDRESS
_SITE.fields_by_name['type'].enum_type = _SITETYPE
_SITE.fields_by_name['classification'].message_type = _SITEIPCLASSIFICATION
_SITE.fields_by_name['architecture'].message_type = _LAYER
_LISTSITERESPONSE.fields_by_name['sites'].message_type = _SITE
_GETSITERESPONSE.fields_by_name['site'].message_type = _SITE
_CREATESITEREQUEST.fields_by_name['site'].message_type = _SITE
_CREATESITERESPONSE.fields_by_name['site'].message_type = _SITE
_UPDATESITEREQUEST.fields_by_name['site'].message_type = _SITE
_UPDATESITERESPONSE.fields_by_name['site'].message_type = _SITE
DESCRIPTOR.message_types_by_name['SiteIpClassification'] = _SITEIPCLASSIFICATION
DESCRIPTOR.message_types_by_name['SubLayer'] = _SUBLAYER
DESCRIPTOR.message_types_by_name['Layer'] = _LAYER
DESCRIPTOR.message_types_by_name['Site'] = _SITE
DESCRIPTOR.message_types_by_name['ListSiteRequest'] = _LISTSITEREQUEST
DESCRIPTOR.message_types_by_name['ListSiteResponse'] = _LISTSITERESPONSE
DESCRIPTOR.message_types_by_name['GetSiteRequest'] = _GETSITEREQUEST
DESCRIPTOR.message_types_by_name['GetSiteResponse'] = _GETSITERESPONSE
DESCRIPTOR.message_types_by_name['CreateSiteRequest'] = _CREATESITEREQUEST
DESCRIPTOR.message_types_by_name['CreateSiteResponse'] = _CREATESITERESPONSE
DESCRIPTOR.message_types_by_name['UpdateSiteRequest'] = _UPDATESITEREQUEST
DESCRIPTOR.message_types_by_name['UpdateSiteResponse'] = _UPDATESITERESPONSE
DESCRIPTOR.message_types_by_name['DeleteSiteRequest'] = _DELETESITEREQUEST
DESCRIPTOR.message_types_by_name['DeleteSiteResponse'] = _DELETESITERESPONSE
DESCRIPTOR.enum_types_by_name['SiteType'] = _SITETYPE
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

SiteIpClassification = _reflection.GeneratedProtocolMessageType('SiteIpClassification', (_message.Message,), {
  'DESCRIPTOR' : _SITEIPCLASSIFICATION,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.SiteIpClassification)
  })
_sym_db.RegisterMessage(SiteIpClassification)

SubLayer = _reflection.GeneratedProtocolMessageType('SubLayer', (_message.Message,), {
  'DESCRIPTOR' : _SUBLAYER,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.SubLayer)
  })
_sym_db.RegisterMessage(SubLayer)

Layer = _reflection.GeneratedProtocolMessageType('Layer', (_message.Message,), {
  'DESCRIPTOR' : _LAYER,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.Layer)
  })
_sym_db.RegisterMessage(Layer)

Site = _reflection.GeneratedProtocolMessageType('Site', (_message.Message,), {
  'DESCRIPTOR' : _SITE,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.Site)
  })
_sym_db.RegisterMessage(Site)

ListSiteRequest = _reflection.GeneratedProtocolMessageType('ListSiteRequest', (_message.Message,), {
  'DESCRIPTOR' : _LISTSITEREQUEST,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.ListSiteRequest)
  })
_sym_db.RegisterMessage(ListSiteRequest)

ListSiteResponse = _reflection.GeneratedProtocolMessageType('ListSiteResponse', (_message.Message,), {
  'DESCRIPTOR' : _LISTSITERESPONSE,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.ListSiteResponse)
  })
_sym_db.RegisterMessage(ListSiteResponse)

GetSiteRequest = _reflection.GeneratedProtocolMessageType('GetSiteRequest', (_message.Message,), {
  'DESCRIPTOR' : _GETSITEREQUEST,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.GetSiteRequest)
  })
_sym_db.RegisterMessage(GetSiteRequest)

GetSiteResponse = _reflection.GeneratedProtocolMessageType('GetSiteResponse', (_message.Message,), {
  'DESCRIPTOR' : _GETSITERESPONSE,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.GetSiteResponse)
  })
_sym_db.RegisterMessage(GetSiteResponse)

CreateSiteRequest = _reflection.GeneratedProtocolMessageType('CreateSiteRequest', (_message.Message,), {
  'DESCRIPTOR' : _CREATESITEREQUEST,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.CreateSiteRequest)
  })
_sym_db.RegisterMessage(CreateSiteRequest)

CreateSiteResponse = _reflection.GeneratedProtocolMessageType('CreateSiteResponse', (_message.Message,), {
  'DESCRIPTOR' : _CREATESITERESPONSE,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.CreateSiteResponse)
  })
_sym_db.RegisterMessage(CreateSiteResponse)

UpdateSiteRequest = _reflection.GeneratedProtocolMessageType('UpdateSiteRequest', (_message.Message,), {
  'DESCRIPTOR' : _UPDATESITEREQUEST,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.UpdateSiteRequest)
  })
_sym_db.RegisterMessage(UpdateSiteRequest)

UpdateSiteResponse = _reflection.GeneratedProtocolMessageType('UpdateSiteResponse', (_message.Message,), {
  'DESCRIPTOR' : _UPDATESITERESPONSE,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.UpdateSiteResponse)
  })
_sym_db.RegisterMessage(UpdateSiteResponse)

DeleteSiteRequest = _reflection.GeneratedProtocolMessageType('DeleteSiteRequest', (_message.Message,), {
  'DESCRIPTOR' : _DELETESITEREQUEST,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.DeleteSiteRequest)
  })
_sym_db.RegisterMessage(DeleteSiteRequest)

DeleteSiteResponse = _reflection.GeneratedProtocolMessageType('DeleteSiteResponse', (_message.Message,), {
  'DESCRIPTOR' : _DELETESITERESPONSE,
  '__module__' : 'kentik.site.v202106alpha1.site_pb2'
  # @@protoc_insertion_point(class_scope:kentik.site.v202106alpha1.DeleteSiteResponse)
  })
_sym_db.RegisterMessage(DeleteSiteResponse)


DESCRIPTOR._options = None

_SITESERVICE = _descriptor.ServiceDescriptor(
  name='SiteService',
  full_name='kentik.site.v202106alpha1.SiteService',
  file=DESCRIPTOR,
  index=0,
  serialized_options=b'\312A\023grpc.api.kentik.com\352\327\002\nadmin.site\220\330\002\003',
  create_key=_descriptor._internal_create_key,
  serialized_start=1724,
  serialized_end=2968,
  methods=[
  _descriptor.MethodDescriptor(
    name='ListSite',
    full_name='kentik.site.v202106alpha1.SiteService.ListSite',
    index=0,
    containing_service=None,
    input_type=_LISTSITEREQUEST,
    output_type=_LISTSITERESPONSE,
    serialized_options=b'\222A1\022\013List sites.\032\030Returns a list of sites.*\010SiteList\362\327\002\017admin.site:read\202\323\344\223\002\033\022\031/site/v202106alpha1/sites',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='GetSite',
    full_name='kentik.site.v202106alpha1.SiteService.GetSite',
    index=1,
    containing_service=None,
    input_type=_GETSITEREQUEST,
    output_type=_GETSITERESPONSE,
    serialized_options=b'\222AK\022\013Get a site.\0323Returns information about a site specified with ID.*\007SiteGet\362\327\002\017admin.site:read\202\323\344\223\002 \022\036/site/v202106alpha1/sites/{id}',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='CreateSite',
    full_name='kentik.site.v202106alpha1.SiteService.CreateSite',
    index=2,
    containing_service=None,
    input_type=_CREATESITEREQUEST,
    output_type=_CREATESITERESPONSE,
    serialized_options=b'\222AJ\022\016Create a site.\032,Create a site from request. returns created.*\nSiteCreate\362\327\002\020admin.site:write\202\323\344\223\002\036\"\031/site/v202106alpha1/sites:\001*',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='UpdateSite',
    full_name='kentik.site.v202106alpha1.SiteService.UpdateSite',
    index=3,
    containing_service=None,
    input_type=_UPDATESITEREQUEST,
    output_type=_UPDATESITERESPONSE,
    serialized_options=b'\222AT\022\016Update a site.\0326Replaces the entire site attributes specified with id.*\nSiteUpdate\362\327\002\020admin.site:write\202\323\344\223\002(\032#/site/v202106alpha1/sites/{site.id}:\001*',
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='DeleteSite',
    full_name='kentik.site.v202106alpha1.SiteService.DeleteSite',
    index=4,
    containing_service=None,
    input_type=_DELETESITEREQUEST,
    output_type=_DELETESITERESPONSE,
    serialized_options=b'\222AA\022\016Delete a site.\032#Deletes the site specified with id.*\nSiteDelete\362\327\002\020admin.site:write\202\323\344\223\002 *\036/site/v202106alpha1/sites/{id}',
    create_key=_descriptor._internal_create_key,
  ),
])
_sym_db.RegisterServiceDescriptor(_SITESERVICE)

DESCRIPTOR.services_by_name['SiteService'] = _SITESERVICE

# @@protoc_insertion_point(module_scope)
