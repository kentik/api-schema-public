// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: kentik/net/v202303/bgp_types.proto

#include "kentik/net/v202303/bgp_types.pb.h"

#include <algorithm>

#include <google/protobuf/io/coded_stream.h>
#include <google/protobuf/extension_set.h>
#include <google/protobuf/wire_format_lite.h>
#include <google/protobuf/descriptor.h>
#include <google/protobuf/generated_message_reflection.h>
#include <google/protobuf/reflection_ops.h>
#include <google/protobuf/wire_format.h>
// @@protoc_insertion_point(includes)
#include <google/protobuf/port_def.inc>
namespace kentik {
namespace net {
namespace v202303 {
class VantagePointDefaultTypeInternal {
 public:
  ::PROTOBUF_NAMESPACE_ID::internal::ExplicitlyConstructed<VantagePoint> _instance;
} _VantagePoint_default_instance_;
}  // namespace v202303
}  // namespace net
}  // namespace kentik
static void InitDefaultsscc_info_VantagePoint_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto() {
  GOOGLE_PROTOBUF_VERIFY_VERSION;

  {
    void* ptr = &::kentik::net::v202303::_VantagePoint_default_instance_;
    new (ptr) ::kentik::net::v202303::VantagePoint();
    ::PROTOBUF_NAMESPACE_ID::internal::OnShutdownDestroyMessage(ptr);
  }
  ::kentik::net::v202303::VantagePoint::InitAsDefaultInstance();
}

::PROTOBUF_NAMESPACE_ID::internal::SCCInfo<0> scc_info_VantagePoint_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto =
    {{ATOMIC_VAR_INIT(::PROTOBUF_NAMESPACE_ID::internal::SCCInfoBase::kUninitialized), 0, 0, InitDefaultsscc_info_VantagePoint_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto}, {}};

static ::PROTOBUF_NAMESPACE_ID::Metadata file_level_metadata_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto[1];
static const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* file_level_enum_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto[3];
static constexpr ::PROTOBUF_NAMESPACE_ID::ServiceDescriptor const** file_level_service_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto = nullptr;

const ::PROTOBUF_NAMESPACE_ID::uint32 TableStruct_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto::offsets[] PROTOBUF_SECTION_VARIABLE(protodesc_cold) = {
  ~0u,  // no _has_bits_
  PROTOBUF_FIELD_OFFSET(::kentik::net::v202303::VantagePoint, _internal_metadata_),
  ~0u,  // no _extensions_
  ~0u,  // no _oneof_case_
  ~0u,  // no _weak_field_map_
  PROTOBUF_FIELD_OFFSET(::kentik::net::v202303::VantagePoint, dataset_),
  PROTOBUF_FIELD_OFFSET(::kentik::net::v202303::VantagePoint, collector_),
  PROTOBUF_FIELD_OFFSET(::kentik::net::v202303::VantagePoint, peer_asn_),
  PROTOBUF_FIELD_OFFSET(::kentik::net::v202303::VantagePoint, peer_ip_),
};
static const ::PROTOBUF_NAMESPACE_ID::internal::MigrationSchema schemas[] PROTOBUF_SECTION_VARIABLE(protodesc_cold) = {
  { 0, -1, sizeof(::kentik::net::v202303::VantagePoint)},
};

static ::PROTOBUF_NAMESPACE_ID::Message const * const file_default_instances[] = {
  reinterpret_cast<const ::PROTOBUF_NAMESPACE_ID::Message*>(&::kentik::net::v202303::_VantagePoint_default_instance_),
};

const char descriptor_table_protodef_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto[] PROTOBUF_SECTION_VARIABLE(protodesc_cold) =
  "\n\"kentik/net/v202303/bgp_types.proto\022\022ke"
  "ntik.net.v202303\032\037google/api/field_behav"
  "ior.proto\032.protoc-gen-openapiv2/options/"
  "annotations.proto\"\324\002\n\014VantagePoint\022A\n\007da"
  "taset\030\001 \001(\tB\'\222A 2\036Name of the collector "
  "data set\342A\001\003R\007dataset\022<\n\tcollector\030\002 \001(\t"
  "B\036\222A\0272\025Name of the collector\342A\001\003R\tcollec"
  "tor\022^\n\010peer_asn\030\003 \001(\rBC\222A<2:ASN of the p"
  "eer from which the collector receives BG"
  "P data\342A\001\003R\007peerAsn\022c\n\007peer_ip\030\004 \001(\tBJ\222A"
  "C2AIP address of the peer from which the"
  " collector receives BGP data\342A\001\003R\006peerIp"
  "*4\n\003Afi\022\023\n\017AFI_UNSPECIFIED\020\000\022\013\n\007AFI_IP4\020"
  "\001\022\013\n\007AFI_IP6\020\002*N\n\004Safi\022\024\n\020SAFI_UNSPECIFI"
  "ED\020\000\022\020\n\014SAFI_UNICAST\020\001\022\r\n\tSAFI_MPLS\020\004\022\017\n"
  "\nSAFI_L3VPN\020\200\001*\315\001\n\nRpkiStatus\022\033\n\027RPKI_ST"
  "ATUS_UNSPECIFIED\020\000\022\031\n\025RPKI_STATUS_NOT_FO"
  "UND\020\001\022 \n\034RPKI_STATUS_EXPLICIT_INVALID\020\002\022"
  "\036\n\032RPKI_STATUS_INVALID_PREFIX\020\003\022\027\n\023RPKI_"
  "STATUS_INVALID\020\004\022\025\n\021RPKI_STATUS_VALID\020\005\022"
  "\025\n\021RPKI_STATUS_ERROR\020\010BJZHgithub.com/ken"
  "tik/api-schema-public/gen/go/kentik/net/"
  "v202303;kentik_netb\006proto3"
  ;
static const ::PROTOBUF_NAMESPACE_ID::internal::DescriptorTable*const descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto_deps[2] = {
  &::descriptor_table_google_2fapi_2ffield_5fbehavior_2eproto,
  &::descriptor_table_protoc_2dgen_2dopenapiv2_2foptions_2fannotations_2eproto,
};
static ::PROTOBUF_NAMESPACE_ID::internal::SCCInfoBase*const descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto_sccs[1] = {
  &scc_info_VantagePoint_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto.base,
};
static ::PROTOBUF_NAMESPACE_ID::internal::once_flag descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto_once;
const ::PROTOBUF_NAMESPACE_ID::internal::DescriptorTable descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto = {
  false, false, descriptor_table_protodef_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto, "kentik/net/v202303/bgp_types.proto", 906,
  &descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto_once, descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto_sccs, descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto_deps, 1, 2,
  schemas, file_default_instances, TableStruct_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto::offsets,
  file_level_metadata_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto, 1, file_level_enum_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto, file_level_service_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto,
};

// Force running AddDescriptors() at dynamic initialization time.
static bool dynamic_init_dummy_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto = (static_cast<void>(::PROTOBUF_NAMESPACE_ID::internal::AddDescriptors(&descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto)), true);
namespace kentik {
namespace net {
namespace v202303 {
const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* Afi_descriptor() {
  ::PROTOBUF_NAMESPACE_ID::internal::AssignDescriptors(&descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto);
  return file_level_enum_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto[0];
}
bool Afi_IsValid(int value) {
  switch (value) {
    case 0:
    case 1:
    case 2:
      return true;
    default:
      return false;
  }
}

const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* Safi_descriptor() {
  ::PROTOBUF_NAMESPACE_ID::internal::AssignDescriptors(&descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto);
  return file_level_enum_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto[1];
}
bool Safi_IsValid(int value) {
  switch (value) {
    case 0:
    case 1:
    case 4:
    case 128:
      return true;
    default:
      return false;
  }
}

const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* RpkiStatus_descriptor() {
  ::PROTOBUF_NAMESPACE_ID::internal::AssignDescriptors(&descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto);
  return file_level_enum_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto[2];
}
bool RpkiStatus_IsValid(int value) {
  switch (value) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 8:
      return true;
    default:
      return false;
  }
}


// ===================================================================

void VantagePoint::InitAsDefaultInstance() {
}
class VantagePoint::_Internal {
 public:
};

VantagePoint::VantagePoint(::PROTOBUF_NAMESPACE_ID::Arena* arena)
  : ::PROTOBUF_NAMESPACE_ID::Message(arena) {
  SharedCtor();
  RegisterArenaDtor(arena);
  // @@protoc_insertion_point(arena_constructor:kentik.net.v202303.VantagePoint)
}
VantagePoint::VantagePoint(const VantagePoint& from)
  : ::PROTOBUF_NAMESPACE_ID::Message() {
  _internal_metadata_.MergeFrom<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>(from._internal_metadata_);
  dataset_.UnsafeSetDefault(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  if (!from._internal_dataset().empty()) {
    dataset_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), from._internal_dataset(),
      GetArena());
  }
  collector_.UnsafeSetDefault(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  if (!from._internal_collector().empty()) {
    collector_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), from._internal_collector(),
      GetArena());
  }
  peer_ip_.UnsafeSetDefault(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  if (!from._internal_peer_ip().empty()) {
    peer_ip_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), from._internal_peer_ip(),
      GetArena());
  }
  peer_asn_ = from.peer_asn_;
  // @@protoc_insertion_point(copy_constructor:kentik.net.v202303.VantagePoint)
}

void VantagePoint::SharedCtor() {
  ::PROTOBUF_NAMESPACE_ID::internal::InitSCC(&scc_info_VantagePoint_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto.base);
  dataset_.UnsafeSetDefault(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  collector_.UnsafeSetDefault(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  peer_ip_.UnsafeSetDefault(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  peer_asn_ = 0u;
}

VantagePoint::~VantagePoint() {
  // @@protoc_insertion_point(destructor:kentik.net.v202303.VantagePoint)
  SharedDtor();
  _internal_metadata_.Delete<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>();
}

void VantagePoint::SharedDtor() {
  GOOGLE_DCHECK(GetArena() == nullptr);
  dataset_.DestroyNoArena(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  collector_.DestroyNoArena(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  peer_ip_.DestroyNoArena(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
}

void VantagePoint::ArenaDtor(void* object) {
  VantagePoint* _this = reinterpret_cast< VantagePoint* >(object);
  (void)_this;
}
void VantagePoint::RegisterArenaDtor(::PROTOBUF_NAMESPACE_ID::Arena*) {
}
void VantagePoint::SetCachedSize(int size) const {
  _cached_size_.Set(size);
}
const VantagePoint& VantagePoint::default_instance() {
  ::PROTOBUF_NAMESPACE_ID::internal::InitSCC(&::scc_info_VantagePoint_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto.base);
  return *internal_default_instance();
}


void VantagePoint::Clear() {
// @@protoc_insertion_point(message_clear_start:kentik.net.v202303.VantagePoint)
  ::PROTOBUF_NAMESPACE_ID::uint32 cached_has_bits = 0;
  // Prevent compiler warnings about cached_has_bits being unused
  (void) cached_has_bits;

  dataset_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
  collector_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
  peer_ip_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
  peer_asn_ = 0u;
  _internal_metadata_.Clear<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>();
}

const char* VantagePoint::_InternalParse(const char* ptr, ::PROTOBUF_NAMESPACE_ID::internal::ParseContext* ctx) {
#define CHK_(x) if (PROTOBUF_PREDICT_FALSE(!(x))) goto failure
  ::PROTOBUF_NAMESPACE_ID::Arena* arena = GetArena(); (void)arena;
  while (!ctx->Done(&ptr)) {
    ::PROTOBUF_NAMESPACE_ID::uint32 tag;
    ptr = ::PROTOBUF_NAMESPACE_ID::internal::ReadTag(ptr, &tag);
    CHK_(ptr);
    switch (tag >> 3) {
      // string dataset = 1[json_name = "dataset", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
      case 1:
        if (PROTOBUF_PREDICT_TRUE(static_cast<::PROTOBUF_NAMESPACE_ID::uint8>(tag) == 10)) {
          auto str = _internal_mutable_dataset();
          ptr = ::PROTOBUF_NAMESPACE_ID::internal::InlineGreedyStringParser(str, ptr, ctx);
          CHK_(::PROTOBUF_NAMESPACE_ID::internal::VerifyUTF8(str, "kentik.net.v202303.VantagePoint.dataset"));
          CHK_(ptr);
        } else goto handle_unusual;
        continue;
      // string collector = 2[json_name = "collector", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
      case 2:
        if (PROTOBUF_PREDICT_TRUE(static_cast<::PROTOBUF_NAMESPACE_ID::uint8>(tag) == 18)) {
          auto str = _internal_mutable_collector();
          ptr = ::PROTOBUF_NAMESPACE_ID::internal::InlineGreedyStringParser(str, ptr, ctx);
          CHK_(::PROTOBUF_NAMESPACE_ID::internal::VerifyUTF8(str, "kentik.net.v202303.VantagePoint.collector"));
          CHK_(ptr);
        } else goto handle_unusual;
        continue;
      // uint32 peer_asn = 3[json_name = "peerAsn", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
      case 3:
        if (PROTOBUF_PREDICT_TRUE(static_cast<::PROTOBUF_NAMESPACE_ID::uint8>(tag) == 24)) {
          peer_asn_ = ::PROTOBUF_NAMESPACE_ID::internal::ReadVarint32(&ptr);
          CHK_(ptr);
        } else goto handle_unusual;
        continue;
      // string peer_ip = 4[json_name = "peerIp", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
      case 4:
        if (PROTOBUF_PREDICT_TRUE(static_cast<::PROTOBUF_NAMESPACE_ID::uint8>(tag) == 34)) {
          auto str = _internal_mutable_peer_ip();
          ptr = ::PROTOBUF_NAMESPACE_ID::internal::InlineGreedyStringParser(str, ptr, ctx);
          CHK_(::PROTOBUF_NAMESPACE_ID::internal::VerifyUTF8(str, "kentik.net.v202303.VantagePoint.peer_ip"));
          CHK_(ptr);
        } else goto handle_unusual;
        continue;
      default: {
      handle_unusual:
        if ((tag & 7) == 4 || tag == 0) {
          ctx->SetLastTag(tag);
          goto success;
        }
        ptr = UnknownFieldParse(tag,
            _internal_metadata_.mutable_unknown_fields<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>(),
            ptr, ctx);
        CHK_(ptr != nullptr);
        continue;
      }
    }  // switch
  }  // while
success:
  return ptr;
failure:
  ptr = nullptr;
  goto success;
#undef CHK_
}

::PROTOBUF_NAMESPACE_ID::uint8* VantagePoint::_InternalSerialize(
    ::PROTOBUF_NAMESPACE_ID::uint8* target, ::PROTOBUF_NAMESPACE_ID::io::EpsCopyOutputStream* stream) const {
  // @@protoc_insertion_point(serialize_to_array_start:kentik.net.v202303.VantagePoint)
  ::PROTOBUF_NAMESPACE_ID::uint32 cached_has_bits = 0;
  (void) cached_has_bits;

  // string dataset = 1[json_name = "dataset", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->dataset().size() > 0) {
    ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::VerifyUtf8String(
      this->_internal_dataset().data(), static_cast<int>(this->_internal_dataset().length()),
      ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::SERIALIZE,
      "kentik.net.v202303.VantagePoint.dataset");
    target = stream->WriteStringMaybeAliased(
        1, this->_internal_dataset(), target);
  }

  // string collector = 2[json_name = "collector", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->collector().size() > 0) {
    ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::VerifyUtf8String(
      this->_internal_collector().data(), static_cast<int>(this->_internal_collector().length()),
      ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::SERIALIZE,
      "kentik.net.v202303.VantagePoint.collector");
    target = stream->WriteStringMaybeAliased(
        2, this->_internal_collector(), target);
  }

  // uint32 peer_asn = 3[json_name = "peerAsn", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->peer_asn() != 0) {
    target = stream->EnsureSpace(target);
    target = ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::WriteUInt32ToArray(3, this->_internal_peer_asn(), target);
  }

  // string peer_ip = 4[json_name = "peerIp", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->peer_ip().size() > 0) {
    ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::VerifyUtf8String(
      this->_internal_peer_ip().data(), static_cast<int>(this->_internal_peer_ip().length()),
      ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::SERIALIZE,
      "kentik.net.v202303.VantagePoint.peer_ip");
    target = stream->WriteStringMaybeAliased(
        4, this->_internal_peer_ip(), target);
  }

  if (PROTOBUF_PREDICT_FALSE(_internal_metadata_.have_unknown_fields())) {
    target = ::PROTOBUF_NAMESPACE_ID::internal::WireFormat::InternalSerializeUnknownFieldsToArray(
        _internal_metadata_.unknown_fields<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>(::PROTOBUF_NAMESPACE_ID::UnknownFieldSet::default_instance), target, stream);
  }
  // @@protoc_insertion_point(serialize_to_array_end:kentik.net.v202303.VantagePoint)
  return target;
}

size_t VantagePoint::ByteSizeLong() const {
// @@protoc_insertion_point(message_byte_size_start:kentik.net.v202303.VantagePoint)
  size_t total_size = 0;

  ::PROTOBUF_NAMESPACE_ID::uint32 cached_has_bits = 0;
  // Prevent compiler warnings about cached_has_bits being unused
  (void) cached_has_bits;

  // string dataset = 1[json_name = "dataset", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->dataset().size() > 0) {
    total_size += 1 +
      ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::StringSize(
        this->_internal_dataset());
  }

  // string collector = 2[json_name = "collector", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->collector().size() > 0) {
    total_size += 1 +
      ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::StringSize(
        this->_internal_collector());
  }

  // string peer_ip = 4[json_name = "peerIp", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->peer_ip().size() > 0) {
    total_size += 1 +
      ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::StringSize(
        this->_internal_peer_ip());
  }

  // uint32 peer_asn = 3[json_name = "peerAsn", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->peer_asn() != 0) {
    total_size += 1 +
      ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::UInt32Size(
        this->_internal_peer_asn());
  }

  if (PROTOBUF_PREDICT_FALSE(_internal_metadata_.have_unknown_fields())) {
    return ::PROTOBUF_NAMESPACE_ID::internal::ComputeUnknownFieldsSize(
        _internal_metadata_, total_size, &_cached_size_);
  }
  int cached_size = ::PROTOBUF_NAMESPACE_ID::internal::ToCachedSize(total_size);
  SetCachedSize(cached_size);
  return total_size;
}

void VantagePoint::MergeFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) {
// @@protoc_insertion_point(generalized_merge_from_start:kentik.net.v202303.VantagePoint)
  GOOGLE_DCHECK_NE(&from, this);
  const VantagePoint* source =
      ::PROTOBUF_NAMESPACE_ID::DynamicCastToGenerated<VantagePoint>(
          &from);
  if (source == nullptr) {
  // @@protoc_insertion_point(generalized_merge_from_cast_fail:kentik.net.v202303.VantagePoint)
    ::PROTOBUF_NAMESPACE_ID::internal::ReflectionOps::Merge(from, this);
  } else {
  // @@protoc_insertion_point(generalized_merge_from_cast_success:kentik.net.v202303.VantagePoint)
    MergeFrom(*source);
  }
}

void VantagePoint::MergeFrom(const VantagePoint& from) {
// @@protoc_insertion_point(class_specific_merge_from_start:kentik.net.v202303.VantagePoint)
  GOOGLE_DCHECK_NE(&from, this);
  _internal_metadata_.MergeFrom<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>(from._internal_metadata_);
  ::PROTOBUF_NAMESPACE_ID::uint32 cached_has_bits = 0;
  (void) cached_has_bits;

  if (from.dataset().size() > 0) {
    _internal_set_dataset(from._internal_dataset());
  }
  if (from.collector().size() > 0) {
    _internal_set_collector(from._internal_collector());
  }
  if (from.peer_ip().size() > 0) {
    _internal_set_peer_ip(from._internal_peer_ip());
  }
  if (from.peer_asn() != 0) {
    _internal_set_peer_asn(from._internal_peer_asn());
  }
}

void VantagePoint::CopyFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) {
// @@protoc_insertion_point(generalized_copy_from_start:kentik.net.v202303.VantagePoint)
  if (&from == this) return;
  Clear();
  MergeFrom(from);
}

void VantagePoint::CopyFrom(const VantagePoint& from) {
// @@protoc_insertion_point(class_specific_copy_from_start:kentik.net.v202303.VantagePoint)
  if (&from == this) return;
  Clear();
  MergeFrom(from);
}

bool VantagePoint::IsInitialized() const {
  return true;
}

void VantagePoint::InternalSwap(VantagePoint* other) {
  using std::swap;
  _internal_metadata_.Swap<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>(&other->_internal_metadata_);
  dataset_.Swap(&other->dataset_, &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
  collector_.Swap(&other->collector_, &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
  peer_ip_.Swap(&other->peer_ip_, &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
  swap(peer_asn_, other->peer_asn_);
}

::PROTOBUF_NAMESPACE_ID::Metadata VantagePoint::GetMetadata() const {
  return GetMetadataStatic();
}


// @@protoc_insertion_point(namespace_scope)
}  // namespace v202303
}  // namespace net
}  // namespace kentik
PROTOBUF_NAMESPACE_OPEN
template<> PROTOBUF_NOINLINE ::kentik::net::v202303::VantagePoint* Arena::CreateMaybeMessage< ::kentik::net::v202303::VantagePoint >(Arena* arena) {
  return Arena::CreateMessageInternal< ::kentik::net::v202303::VantagePoint >(arena);
}
PROTOBUF_NAMESPACE_CLOSE

// @@protoc_insertion_point(global_scope)
#include <google/protobuf/port_undef.inc>
