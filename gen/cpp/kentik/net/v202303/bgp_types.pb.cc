// Generated by the protocol buffer compiler.  DO NOT EDIT!
// NO CHECKED-IN PROTOBUF GENCODE
// source: kentik/net/v202303/bgp_types.proto
// Protobuf C++ Version: 5.29.3

#include "kentik/net/v202303/bgp_types.pb.h"

#include <algorithm>
#include <type_traits>
#include "google/protobuf/io/coded_stream.h"
#include "google/protobuf/generated_message_tctable_impl.h"
#include "google/protobuf/extension_set.h"
#include "google/protobuf/generated_message_util.h"
#include "google/protobuf/wire_format_lite.h"
#include "google/protobuf/descriptor.h"
#include "google/protobuf/generated_message_reflection.h"
#include "google/protobuf/reflection_ops.h"
#include "google/protobuf/wire_format.h"
// @@protoc_insertion_point(includes)

// Must be included last.
#include "google/protobuf/port_def.inc"
PROTOBUF_PRAGMA_INIT_SEG
namespace _pb = ::google::protobuf;
namespace _pbi = ::google::protobuf::internal;
namespace _fl = ::google::protobuf::internal::field_layout;
namespace kentik {
namespace net {
namespace v202303 {

inline constexpr VantagePoint::Impl_::Impl_(
    ::_pbi::ConstantInitialized) noexcept
      : dataset_(
            &::google::protobuf::internal::fixed_address_empty_string,
            ::_pbi::ConstantInitialized()),
        collector_(
            &::google::protobuf::internal::fixed_address_empty_string,
            ::_pbi::ConstantInitialized()),
        peer_ip_(
            &::google::protobuf::internal::fixed_address_empty_string,
            ::_pbi::ConstantInitialized()),
        peer_asn_{0u},
        _cached_size_{0} {}

template <typename>
PROTOBUF_CONSTEXPR VantagePoint::VantagePoint(::_pbi::ConstantInitialized)
#if defined(PROTOBUF_CUSTOM_VTABLE)
    : ::google::protobuf::Message(_class_data_.base()),
#else   // PROTOBUF_CUSTOM_VTABLE
    : ::google::protobuf::Message(),
#endif  // PROTOBUF_CUSTOM_VTABLE
      _impl_(::_pbi::ConstantInitialized()) {
}
struct VantagePointDefaultTypeInternal {
  PROTOBUF_CONSTEXPR VantagePointDefaultTypeInternal() : _instance(::_pbi::ConstantInitialized{}) {}
  ~VantagePointDefaultTypeInternal() {}
  union {
    VantagePoint _instance;
  };
};

PROTOBUF_ATTRIBUTE_NO_DESTROY PROTOBUF_CONSTINIT
    PROTOBUF_ATTRIBUTE_INIT_PRIORITY1 VantagePointDefaultTypeInternal _VantagePoint_default_instance_;
}  // namespace v202303
}  // namespace net
}  // namespace kentik
static const ::_pb::EnumDescriptor* file_level_enum_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto[3];
static constexpr const ::_pb::ServiceDescriptor**
    file_level_service_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto = nullptr;
const ::uint32_t
    TableStruct_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto::offsets[] ABSL_ATTRIBUTE_SECTION_VARIABLE(
        protodesc_cold) = {
        ~0u,  // no _has_bits_
        PROTOBUF_FIELD_OFFSET(::kentik::net::v202303::VantagePoint, _internal_metadata_),
        ~0u,  // no _extensions_
        ~0u,  // no _oneof_case_
        ~0u,  // no _weak_field_map_
        ~0u,  // no _inlined_string_donated_
        ~0u,  // no _split_
        ~0u,  // no sizeof(Split)
        PROTOBUF_FIELD_OFFSET(::kentik::net::v202303::VantagePoint, _impl_.dataset_),
        PROTOBUF_FIELD_OFFSET(::kentik::net::v202303::VantagePoint, _impl_.collector_),
        PROTOBUF_FIELD_OFFSET(::kentik::net::v202303::VantagePoint, _impl_.peer_asn_),
        PROTOBUF_FIELD_OFFSET(::kentik::net::v202303::VantagePoint, _impl_.peer_ip_),
};

static const ::_pbi::MigrationSchema
    schemas[] ABSL_ATTRIBUTE_SECTION_VARIABLE(protodesc_cold) = {
        {0, -1, -1, sizeof(::kentik::net::v202303::VantagePoint)},
};
static const ::_pb::Message* const file_default_instances[] = {
    &::kentik::net::v202303::_VantagePoint_default_instance_._instance,
};
const char descriptor_table_protodef_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto[] ABSL_ATTRIBUTE_SECTION_VARIABLE(
    protodesc_cold) = {
    "\n\"kentik/net/v202303/bgp_types.proto\022\022ke"
    "ntik.net.v202303\032\037google/api/field_behav"
    "ior.proto\032.protoc-gen-openapiv2/options/"
    "annotations.proto\"\320\002\n\014VantagePoint\022@\n\007da"
    "taset\030\001 \001(\tB&\222A 2\036Name of the collector "
    "data set\340A\003R\007dataset\022;\n\tcollector\030\002 \001(\tB"
    "\035\222A\0272\025Name of the collector\340A\003R\tcollecto"
    "r\022]\n\010peer_asn\030\003 \001(\rBB\222A<2:ASN of the pee"
    "r from which the collector receives BGP "
    "data\340A\003R\007peerAsn\022b\n\007peer_ip\030\004 \001(\tBI\222AC2A"
    "IP address of the peer from which the co"
    "llector receives BGP data\340A\003R\006peerIp*4\n\003"
    "Afi\022\023\n\017AFI_UNSPECIFIED\020\000\022\013\n\007AFI_IP4\020\001\022\013\n"
    "\007AFI_IP6\020\002*N\n\004Safi\022\024\n\020SAFI_UNSPECIFIED\020\000"
    "\022\020\n\014SAFI_UNICAST\020\001\022\r\n\tSAFI_MPLS\020\004\022\017\n\nSAF"
    "I_L3VPN\020\200\001*\315\001\n\nRpkiStatus\022\033\n\027RPKI_STATUS"
    "_UNSPECIFIED\020\000\022\031\n\025RPKI_STATUS_NOT_FOUND\020"
    "\001\022 \n\034RPKI_STATUS_EXPLICIT_INVALID\020\002\022\036\n\032R"
    "PKI_STATUS_INVALID_PREFIX\020\003\022\027\n\023RPKI_STAT"
    "US_INVALID\020\004\022\025\n\021RPKI_STATUS_VALID\020\005\022\025\n\021R"
    "PKI_STATUS_ERROR\020\010BJZHgithub.com/kentik/"
    "api-schema-public/gen/go/kentik/net/v202"
    "303;kentik_netb\006proto3"
};
static const ::_pbi::DescriptorTable* const descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto_deps[2] =
    {
        &::descriptor_table_google_2fapi_2ffield_5fbehavior_2eproto,
        &::descriptor_table_protoc_2dgen_2dopenapiv2_2foptions_2fannotations_2eproto,
};
static ::absl::once_flag descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto_once;
PROTOBUF_CONSTINIT const ::_pbi::DescriptorTable descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto = {
    false,
    false,
    902,
    descriptor_table_protodef_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto,
    "kentik/net/v202303/bgp_types.proto",
    &descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto_once,
    descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto_deps,
    2,
    1,
    schemas,
    file_default_instances,
    TableStruct_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto::offsets,
    file_level_enum_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto,
    file_level_service_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto,
};
namespace kentik {
namespace net {
namespace v202303 {
const ::google::protobuf::EnumDescriptor* Afi_descriptor() {
  ::google::protobuf::internal::AssignDescriptors(&descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto);
  return file_level_enum_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto[0];
}
PROTOBUF_CONSTINIT const uint32_t Afi_internal_data_[] = {
    196608u, 0u, };
bool Afi_IsValid(int value) {
  return 0 <= value && value <= 2;
}
const ::google::protobuf::EnumDescriptor* Safi_descriptor() {
  ::google::protobuf::internal::AssignDescriptors(&descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto);
  return file_level_enum_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto[1];
}
PROTOBUF_CONSTINIT const uint32_t Safi_internal_data_[] = {
    131072u, 65568u, 4u, 128u, };
bool Safi_IsValid(int value) {
  return ::_pbi::ValidateEnum(value, Safi_internal_data_);
}
const ::google::protobuf::EnumDescriptor* RpkiStatus_descriptor() {
  ::google::protobuf::internal::AssignDescriptors(&descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto);
  return file_level_enum_descriptors_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto[2];
}
PROTOBUF_CONSTINIT const uint32_t RpkiStatus_internal_data_[] = {
    393216u, 32u, 4u, };
bool RpkiStatus_IsValid(int value) {
  return 0 <= value && value <= 8 && ((319u >> value) & 1) != 0;
}
// ===================================================================

class VantagePoint::_Internal {
 public:
};

VantagePoint::VantagePoint(::google::protobuf::Arena* arena)
#if defined(PROTOBUF_CUSTOM_VTABLE)
    : ::google::protobuf::Message(arena, _class_data_.base()) {
#else   // PROTOBUF_CUSTOM_VTABLE
    : ::google::protobuf::Message(arena) {
#endif  // PROTOBUF_CUSTOM_VTABLE
  SharedCtor(arena);
  // @@protoc_insertion_point(arena_constructor:kentik.net.v202303.VantagePoint)
}
inline PROTOBUF_NDEBUG_INLINE VantagePoint::Impl_::Impl_(
    ::google::protobuf::internal::InternalVisibility visibility, ::google::protobuf::Arena* arena,
    const Impl_& from, const ::kentik::net::v202303::VantagePoint& from_msg)
      : dataset_(arena, from.dataset_),
        collector_(arena, from.collector_),
        peer_ip_(arena, from.peer_ip_),
        _cached_size_{0} {}

VantagePoint::VantagePoint(
    ::google::protobuf::Arena* arena,
    const VantagePoint& from)
#if defined(PROTOBUF_CUSTOM_VTABLE)
    : ::google::protobuf::Message(arena, _class_data_.base()) {
#else   // PROTOBUF_CUSTOM_VTABLE
    : ::google::protobuf::Message(arena) {
#endif  // PROTOBUF_CUSTOM_VTABLE
  VantagePoint* const _this = this;
  (void)_this;
  _internal_metadata_.MergeFrom<::google::protobuf::UnknownFieldSet>(
      from._internal_metadata_);
  new (&_impl_) Impl_(internal_visibility(), arena, from._impl_, from);
  _impl_.peer_asn_ = from._impl_.peer_asn_;

  // @@protoc_insertion_point(copy_constructor:kentik.net.v202303.VantagePoint)
}
inline PROTOBUF_NDEBUG_INLINE VantagePoint::Impl_::Impl_(
    ::google::protobuf::internal::InternalVisibility visibility,
    ::google::protobuf::Arena* arena)
      : dataset_(arena),
        collector_(arena),
        peer_ip_(arena),
        _cached_size_{0} {}

inline void VantagePoint::SharedCtor(::_pb::Arena* arena) {
  new (&_impl_) Impl_(internal_visibility(), arena);
  _impl_.peer_asn_ = {};
}
VantagePoint::~VantagePoint() {
  // @@protoc_insertion_point(destructor:kentik.net.v202303.VantagePoint)
  SharedDtor(*this);
}
inline void VantagePoint::SharedDtor(MessageLite& self) {
  VantagePoint& this_ = static_cast<VantagePoint&>(self);
  this_._internal_metadata_.Delete<::google::protobuf::UnknownFieldSet>();
  ABSL_DCHECK(this_.GetArena() == nullptr);
  this_._impl_.dataset_.Destroy();
  this_._impl_.collector_.Destroy();
  this_._impl_.peer_ip_.Destroy();
  this_._impl_.~Impl_();
}

inline void* VantagePoint::PlacementNew_(const void*, void* mem,
                                        ::google::protobuf::Arena* arena) {
  return ::new (mem) VantagePoint(arena);
}
constexpr auto VantagePoint::InternalNewImpl_() {
  return ::google::protobuf::internal::MessageCreator::CopyInit(sizeof(VantagePoint),
                                            alignof(VantagePoint));
}
PROTOBUF_CONSTINIT
PROTOBUF_ATTRIBUTE_INIT_PRIORITY1
const ::google::protobuf::internal::ClassDataFull VantagePoint::_class_data_ = {
    ::google::protobuf::internal::ClassData{
        &_VantagePoint_default_instance_._instance,
        &_table_.header,
        nullptr,  // OnDemandRegisterArenaDtor
        nullptr,  // IsInitialized
        &VantagePoint::MergeImpl,
        ::google::protobuf::Message::GetNewImpl<VantagePoint>(),
#if defined(PROTOBUF_CUSTOM_VTABLE)
        &VantagePoint::SharedDtor,
        ::google::protobuf::Message::GetClearImpl<VantagePoint>(), &VantagePoint::ByteSizeLong,
            &VantagePoint::_InternalSerialize,
#endif  // PROTOBUF_CUSTOM_VTABLE
        PROTOBUF_FIELD_OFFSET(VantagePoint, _impl_._cached_size_),
        false,
    },
    &VantagePoint::kDescriptorMethods,
    &descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto,
    nullptr,  // tracker
};
const ::google::protobuf::internal::ClassData* VantagePoint::GetClassData() const {
  ::google::protobuf::internal::PrefetchToLocalCache(&_class_data_);
  ::google::protobuf::internal::PrefetchToLocalCache(_class_data_.tc_table);
  return _class_data_.base();
}
PROTOBUF_CONSTINIT PROTOBUF_ATTRIBUTE_INIT_PRIORITY1
const ::_pbi::TcParseTable<2, 4, 0, 63, 2> VantagePoint::_table_ = {
  {
    0,  // no _has_bits_
    0, // no _extensions_
    4, 24,  // max_field_number, fast_idx_mask
    offsetof(decltype(_table_), field_lookup_table),
    4294967280,  // skipmap
    offsetof(decltype(_table_), field_entries),
    4,  // num_field_entries
    0,  // num_aux_entries
    offsetof(decltype(_table_), field_names),  // no aux_entries
    _class_data_.base(),
    nullptr,  // post_loop_handler
    ::_pbi::TcParser::GenericFallback,  // fallback
    #ifdef PROTOBUF_PREFETCH_PARSE_TABLE
    ::_pbi::TcParser::GetTable<::kentik::net::v202303::VantagePoint>(),  // to_prefetch
    #endif  // PROTOBUF_PREFETCH_PARSE_TABLE
  }, {{
    // string peer_ip = 4 [json_name = "peerIp", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
    {::_pbi::TcParser::FastUS1,
     {34, 63, 0, PROTOBUF_FIELD_OFFSET(VantagePoint, _impl_.peer_ip_)}},
    // string dataset = 1 [json_name = "dataset", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
    {::_pbi::TcParser::FastUS1,
     {10, 63, 0, PROTOBUF_FIELD_OFFSET(VantagePoint, _impl_.dataset_)}},
    // string collector = 2 [json_name = "collector", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
    {::_pbi::TcParser::FastUS1,
     {18, 63, 0, PROTOBUF_FIELD_OFFSET(VantagePoint, _impl_.collector_)}},
    // uint32 peer_asn = 3 [json_name = "peerAsn", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
    {::_pbi::TcParser::SingularVarintNoZag1<::uint32_t, offsetof(VantagePoint, _impl_.peer_asn_), 63>(),
     {24, 63, 0, PROTOBUF_FIELD_OFFSET(VantagePoint, _impl_.peer_asn_)}},
  }}, {{
    65535, 65535
  }}, {{
    // string dataset = 1 [json_name = "dataset", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
    {PROTOBUF_FIELD_OFFSET(VantagePoint, _impl_.dataset_), 0, 0,
    (0 | ::_fl::kFcSingular | ::_fl::kUtf8String | ::_fl::kRepAString)},
    // string collector = 2 [json_name = "collector", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
    {PROTOBUF_FIELD_OFFSET(VantagePoint, _impl_.collector_), 0, 0,
    (0 | ::_fl::kFcSingular | ::_fl::kUtf8String | ::_fl::kRepAString)},
    // uint32 peer_asn = 3 [json_name = "peerAsn", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
    {PROTOBUF_FIELD_OFFSET(VantagePoint, _impl_.peer_asn_), 0, 0,
    (0 | ::_fl::kFcSingular | ::_fl::kUInt32)},
    // string peer_ip = 4 [json_name = "peerIp", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
    {PROTOBUF_FIELD_OFFSET(VantagePoint, _impl_.peer_ip_), 0, 0,
    (0 | ::_fl::kFcSingular | ::_fl::kUtf8String | ::_fl::kRepAString)},
  }},
  // no aux_entries
  {{
    "\37\7\11\0\7\0\0\0"
    "kentik.net.v202303.VantagePoint"
    "dataset"
    "collector"
    "peer_ip"
  }},
};

PROTOBUF_NOINLINE void VantagePoint::Clear() {
// @@protoc_insertion_point(message_clear_start:kentik.net.v202303.VantagePoint)
  ::google::protobuf::internal::TSanWrite(&_impl_);
  ::uint32_t cached_has_bits = 0;
  // Prevent compiler warnings about cached_has_bits being unused
  (void) cached_has_bits;

  _impl_.dataset_.ClearToEmpty();
  _impl_.collector_.ClearToEmpty();
  _impl_.peer_ip_.ClearToEmpty();
  _impl_.peer_asn_ = 0u;
  _internal_metadata_.Clear<::google::protobuf::UnknownFieldSet>();
}

#if defined(PROTOBUF_CUSTOM_VTABLE)
        ::uint8_t* VantagePoint::_InternalSerialize(
            const MessageLite& base, ::uint8_t* target,
            ::google::protobuf::io::EpsCopyOutputStream* stream) {
          const VantagePoint& this_ = static_cast<const VantagePoint&>(base);
#else   // PROTOBUF_CUSTOM_VTABLE
        ::uint8_t* VantagePoint::_InternalSerialize(
            ::uint8_t* target,
            ::google::protobuf::io::EpsCopyOutputStream* stream) const {
          const VantagePoint& this_ = *this;
#endif  // PROTOBUF_CUSTOM_VTABLE
          // @@protoc_insertion_point(serialize_to_array_start:kentik.net.v202303.VantagePoint)
          ::uint32_t cached_has_bits = 0;
          (void)cached_has_bits;

          // string dataset = 1 [json_name = "dataset", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
          if (!this_._internal_dataset().empty()) {
            const std::string& _s = this_._internal_dataset();
            ::google::protobuf::internal::WireFormatLite::VerifyUtf8String(
                _s.data(), static_cast<int>(_s.length()), ::google::protobuf::internal::WireFormatLite::SERIALIZE, "kentik.net.v202303.VantagePoint.dataset");
            target = stream->WriteStringMaybeAliased(1, _s, target);
          }

          // string collector = 2 [json_name = "collector", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
          if (!this_._internal_collector().empty()) {
            const std::string& _s = this_._internal_collector();
            ::google::protobuf::internal::WireFormatLite::VerifyUtf8String(
                _s.data(), static_cast<int>(_s.length()), ::google::protobuf::internal::WireFormatLite::SERIALIZE, "kentik.net.v202303.VantagePoint.collector");
            target = stream->WriteStringMaybeAliased(2, _s, target);
          }

          // uint32 peer_asn = 3 [json_name = "peerAsn", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
          if (this_._internal_peer_asn() != 0) {
            target = stream->EnsureSpace(target);
            target = ::_pbi::WireFormatLite::WriteUInt32ToArray(
                3, this_._internal_peer_asn(), target);
          }

          // string peer_ip = 4 [json_name = "peerIp", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
          if (!this_._internal_peer_ip().empty()) {
            const std::string& _s = this_._internal_peer_ip();
            ::google::protobuf::internal::WireFormatLite::VerifyUtf8String(
                _s.data(), static_cast<int>(_s.length()), ::google::protobuf::internal::WireFormatLite::SERIALIZE, "kentik.net.v202303.VantagePoint.peer_ip");
            target = stream->WriteStringMaybeAliased(4, _s, target);
          }

          if (PROTOBUF_PREDICT_FALSE(this_._internal_metadata_.have_unknown_fields())) {
            target =
                ::_pbi::WireFormat::InternalSerializeUnknownFieldsToArray(
                    this_._internal_metadata_.unknown_fields<::google::protobuf::UnknownFieldSet>(::google::protobuf::UnknownFieldSet::default_instance), target, stream);
          }
          // @@protoc_insertion_point(serialize_to_array_end:kentik.net.v202303.VantagePoint)
          return target;
        }

#if defined(PROTOBUF_CUSTOM_VTABLE)
        ::size_t VantagePoint::ByteSizeLong(const MessageLite& base) {
          const VantagePoint& this_ = static_cast<const VantagePoint&>(base);
#else   // PROTOBUF_CUSTOM_VTABLE
        ::size_t VantagePoint::ByteSizeLong() const {
          const VantagePoint& this_ = *this;
#endif  // PROTOBUF_CUSTOM_VTABLE
          // @@protoc_insertion_point(message_byte_size_start:kentik.net.v202303.VantagePoint)
          ::size_t total_size = 0;

          ::uint32_t cached_has_bits = 0;
          // Prevent compiler warnings about cached_has_bits being unused
          (void)cached_has_bits;

          ::_pbi::Prefetch5LinesFrom7Lines(&this_);
           {
            // string dataset = 1 [json_name = "dataset", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
            if (!this_._internal_dataset().empty()) {
              total_size += 1 + ::google::protobuf::internal::WireFormatLite::StringSize(
                                              this_._internal_dataset());
            }
            // string collector = 2 [json_name = "collector", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
            if (!this_._internal_collector().empty()) {
              total_size += 1 + ::google::protobuf::internal::WireFormatLite::StringSize(
                                              this_._internal_collector());
            }
            // string peer_ip = 4 [json_name = "peerIp", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
            if (!this_._internal_peer_ip().empty()) {
              total_size += 1 + ::google::protobuf::internal::WireFormatLite::StringSize(
                                              this_._internal_peer_ip());
            }
            // uint32 peer_asn = 3 [json_name = "peerAsn", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
            if (this_._internal_peer_asn() != 0) {
              total_size += ::_pbi::WireFormatLite::UInt32SizePlusOne(
                  this_._internal_peer_asn());
            }
          }
          return this_.MaybeComputeUnknownFieldsSize(total_size,
                                                     &this_._impl_._cached_size_);
        }

void VantagePoint::MergeImpl(::google::protobuf::MessageLite& to_msg, const ::google::protobuf::MessageLite& from_msg) {
  auto* const _this = static_cast<VantagePoint*>(&to_msg);
  auto& from = static_cast<const VantagePoint&>(from_msg);
  // @@protoc_insertion_point(class_specific_merge_from_start:kentik.net.v202303.VantagePoint)
  ABSL_DCHECK_NE(&from, _this);
  ::uint32_t cached_has_bits = 0;
  (void) cached_has_bits;

  if (!from._internal_dataset().empty()) {
    _this->_internal_set_dataset(from._internal_dataset());
  }
  if (!from._internal_collector().empty()) {
    _this->_internal_set_collector(from._internal_collector());
  }
  if (!from._internal_peer_ip().empty()) {
    _this->_internal_set_peer_ip(from._internal_peer_ip());
  }
  if (from._internal_peer_asn() != 0) {
    _this->_impl_.peer_asn_ = from._impl_.peer_asn_;
  }
  _this->_internal_metadata_.MergeFrom<::google::protobuf::UnknownFieldSet>(from._internal_metadata_);
}

void VantagePoint::CopyFrom(const VantagePoint& from) {
// @@protoc_insertion_point(class_specific_copy_from_start:kentik.net.v202303.VantagePoint)
  if (&from == this) return;
  Clear();
  MergeFrom(from);
}


void VantagePoint::InternalSwap(VantagePoint* PROTOBUF_RESTRICT other) {
  using std::swap;
  auto* arena = GetArena();
  ABSL_DCHECK_EQ(arena, other->GetArena());
  _internal_metadata_.InternalSwap(&other->_internal_metadata_);
  ::_pbi::ArenaStringPtr::InternalSwap(&_impl_.dataset_, &other->_impl_.dataset_, arena);
  ::_pbi::ArenaStringPtr::InternalSwap(&_impl_.collector_, &other->_impl_.collector_, arena);
  ::_pbi::ArenaStringPtr::InternalSwap(&_impl_.peer_ip_, &other->_impl_.peer_ip_, arena);
        swap(_impl_.peer_asn_, other->_impl_.peer_asn_);
}

::google::protobuf::Metadata VantagePoint::GetMetadata() const {
  return ::google::protobuf::Message::GetMetadataImpl(GetClassData()->full());
}
// @@protoc_insertion_point(namespace_scope)
}  // namespace v202303
}  // namespace net
}  // namespace kentik
namespace google {
namespace protobuf {
}  // namespace protobuf
}  // namespace google
// @@protoc_insertion_point(global_scope)
PROTOBUF_ATTRIBUTE_INIT_PRIORITY2 static ::std::false_type
    _static_init2_ PROTOBUF_UNUSED =
        (::_pbi::AddDescriptors(&descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto),
         ::std::false_type{});
#include "google/protobuf/port_undef.inc"
