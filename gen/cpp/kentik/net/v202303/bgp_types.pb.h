// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: kentik/net/v202303/bgp_types.proto

#ifndef GOOGLE_PROTOBUF_INCLUDED_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto
#define GOOGLE_PROTOBUF_INCLUDED_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto

#include <limits>
#include <string>

#include <google/protobuf/port_def.inc>
#if PROTOBUF_VERSION < 3012000
#error This file was generated by a newer version of protoc which is
#error incompatible with your Protocol Buffer headers. Please update
#error your headers.
#endif
#if 3012004 < PROTOBUF_MIN_PROTOC_VERSION
#error This file was generated by an older version of protoc which is
#error incompatible with your Protocol Buffer headers. Please
#error regenerate this file with a newer version of protoc.
#endif

#include <google/protobuf/port_undef.inc>
#include <google/protobuf/io/coded_stream.h>
#include <google/protobuf/arena.h>
#include <google/protobuf/arenastring.h>
#include <google/protobuf/generated_message_table_driven.h>
#include <google/protobuf/generated_message_util.h>
#include <google/protobuf/inlined_string_field.h>
#include <google/protobuf/metadata_lite.h>
#include <google/protobuf/generated_message_reflection.h>
#include <google/protobuf/message.h>
#include <google/protobuf/repeated_field.h>  // IWYU pragma: export
#include <google/protobuf/extension_set.h>  // IWYU pragma: export
#include <google/protobuf/generated_enum_reflection.h>
#include <google/protobuf/unknown_field_set.h>
#include "google/api/field_behavior.pb.h"
#include "protoc-gen-openapiv2/options/annotations.pb.h"
// @@protoc_insertion_point(includes)
#include <google/protobuf/port_def.inc>
#define PROTOBUF_INTERNAL_EXPORT_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto
PROTOBUF_NAMESPACE_OPEN
namespace internal {
class AnyMetadata;
}  // namespace internal
PROTOBUF_NAMESPACE_CLOSE

// Internal implementation detail -- do not use these members.
struct TableStruct_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto {
  static const ::PROTOBUF_NAMESPACE_ID::internal::ParseTableField entries[]
    PROTOBUF_SECTION_VARIABLE(protodesc_cold);
  static const ::PROTOBUF_NAMESPACE_ID::internal::AuxillaryParseTableField aux[]
    PROTOBUF_SECTION_VARIABLE(protodesc_cold);
  static const ::PROTOBUF_NAMESPACE_ID::internal::ParseTable schema[1]
    PROTOBUF_SECTION_VARIABLE(protodesc_cold);
  static const ::PROTOBUF_NAMESPACE_ID::internal::FieldMetadata field_metadata[];
  static const ::PROTOBUF_NAMESPACE_ID::internal::SerializationTable serialization_table[];
  static const ::PROTOBUF_NAMESPACE_ID::uint32 offsets[];
};
extern const ::PROTOBUF_NAMESPACE_ID::internal::DescriptorTable descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto;
namespace kentik {
namespace net {
namespace v202303 {
class VantagePoint;
class VantagePointDefaultTypeInternal;
extern VantagePointDefaultTypeInternal _VantagePoint_default_instance_;
}  // namespace v202303
}  // namespace net
}  // namespace kentik
PROTOBUF_NAMESPACE_OPEN
template<> ::kentik::net::v202303::VantagePoint* Arena::CreateMaybeMessage<::kentik::net::v202303::VantagePoint>(Arena*);
PROTOBUF_NAMESPACE_CLOSE
namespace kentik {
namespace net {
namespace v202303 {

enum Afi : int {
  AFI_UNSPECIFIED = 0,
  AFI_IP4 = 1,
  AFI_IP6 = 2,
  Afi_INT_MIN_SENTINEL_DO_NOT_USE_ = std::numeric_limits<::PROTOBUF_NAMESPACE_ID::int32>::min(),
  Afi_INT_MAX_SENTINEL_DO_NOT_USE_ = std::numeric_limits<::PROTOBUF_NAMESPACE_ID::int32>::max()
};
bool Afi_IsValid(int value);
constexpr Afi Afi_MIN = AFI_UNSPECIFIED;
constexpr Afi Afi_MAX = AFI_IP6;
constexpr int Afi_ARRAYSIZE = Afi_MAX + 1;

const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* Afi_descriptor();
template<typename T>
inline const std::string& Afi_Name(T enum_t_value) {
  static_assert(::std::is_same<T, Afi>::value ||
    ::std::is_integral<T>::value,
    "Incorrect type passed to function Afi_Name.");
  return ::PROTOBUF_NAMESPACE_ID::internal::NameOfEnum(
    Afi_descriptor(), enum_t_value);
}
inline bool Afi_Parse(
    const std::string& name, Afi* value) {
  return ::PROTOBUF_NAMESPACE_ID::internal::ParseNamedEnum<Afi>(
    Afi_descriptor(), name, value);
}
enum Safi : int {
  SAFI_UNSPECIFIED = 0,
  SAFI_UNICAST = 1,
  SAFI_MPLS = 4,
  SAFI_L3VPN = 128,
  Safi_INT_MIN_SENTINEL_DO_NOT_USE_ = std::numeric_limits<::PROTOBUF_NAMESPACE_ID::int32>::min(),
  Safi_INT_MAX_SENTINEL_DO_NOT_USE_ = std::numeric_limits<::PROTOBUF_NAMESPACE_ID::int32>::max()
};
bool Safi_IsValid(int value);
constexpr Safi Safi_MIN = SAFI_UNSPECIFIED;
constexpr Safi Safi_MAX = SAFI_L3VPN;
constexpr int Safi_ARRAYSIZE = Safi_MAX + 1;

const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* Safi_descriptor();
template<typename T>
inline const std::string& Safi_Name(T enum_t_value) {
  static_assert(::std::is_same<T, Safi>::value ||
    ::std::is_integral<T>::value,
    "Incorrect type passed to function Safi_Name.");
  return ::PROTOBUF_NAMESPACE_ID::internal::NameOfEnum(
    Safi_descriptor(), enum_t_value);
}
inline bool Safi_Parse(
    const std::string& name, Safi* value) {
  return ::PROTOBUF_NAMESPACE_ID::internal::ParseNamedEnum<Safi>(
    Safi_descriptor(), name, value);
}
enum RpkiStatus : int {
  RPKI_STATUS_UNSPECIFIED = 0,
  RPKI_STATUS_NOT_FOUND = 1,
  RPKI_STATUS_EXPLICIT_INVALID = 2,
  RPKI_STATUS_INVALID_PREFIX = 3,
  RPKI_STATUS_INVALID = 4,
  RPKI_STATUS_VALID = 5,
  RPKI_STATUS_ERROR = 8,
  RpkiStatus_INT_MIN_SENTINEL_DO_NOT_USE_ = std::numeric_limits<::PROTOBUF_NAMESPACE_ID::int32>::min(),
  RpkiStatus_INT_MAX_SENTINEL_DO_NOT_USE_ = std::numeric_limits<::PROTOBUF_NAMESPACE_ID::int32>::max()
};
bool RpkiStatus_IsValid(int value);
constexpr RpkiStatus RpkiStatus_MIN = RPKI_STATUS_UNSPECIFIED;
constexpr RpkiStatus RpkiStatus_MAX = RPKI_STATUS_ERROR;
constexpr int RpkiStatus_ARRAYSIZE = RpkiStatus_MAX + 1;

const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* RpkiStatus_descriptor();
template<typename T>
inline const std::string& RpkiStatus_Name(T enum_t_value) {
  static_assert(::std::is_same<T, RpkiStatus>::value ||
    ::std::is_integral<T>::value,
    "Incorrect type passed to function RpkiStatus_Name.");
  return ::PROTOBUF_NAMESPACE_ID::internal::NameOfEnum(
    RpkiStatus_descriptor(), enum_t_value);
}
inline bool RpkiStatus_Parse(
    const std::string& name, RpkiStatus* value) {
  return ::PROTOBUF_NAMESPACE_ID::internal::ParseNamedEnum<RpkiStatus>(
    RpkiStatus_descriptor(), name, value);
}
// ===================================================================

class VantagePoint PROTOBUF_FINAL :
    public ::PROTOBUF_NAMESPACE_ID::Message /* @@protoc_insertion_point(class_definition:kentik.net.v202303.VantagePoint) */ {
 public:
  inline VantagePoint() : VantagePoint(nullptr) {};
  virtual ~VantagePoint();

  VantagePoint(const VantagePoint& from);
  VantagePoint(VantagePoint&& from) noexcept
    : VantagePoint() {
    *this = ::std::move(from);
  }

  inline VantagePoint& operator=(const VantagePoint& from) {
    CopyFrom(from);
    return *this;
  }
  inline VantagePoint& operator=(VantagePoint&& from) noexcept {
    if (GetArena() == from.GetArena()) {
      if (this != &from) InternalSwap(&from);
    } else {
      CopyFrom(from);
    }
    return *this;
  }

  static const ::PROTOBUF_NAMESPACE_ID::Descriptor* descriptor() {
    return GetDescriptor();
  }
  static const ::PROTOBUF_NAMESPACE_ID::Descriptor* GetDescriptor() {
    return GetMetadataStatic().descriptor;
  }
  static const ::PROTOBUF_NAMESPACE_ID::Reflection* GetReflection() {
    return GetMetadataStatic().reflection;
  }
  static const VantagePoint& default_instance();

  static void InitAsDefaultInstance();  // FOR INTERNAL USE ONLY
  static inline const VantagePoint* internal_default_instance() {
    return reinterpret_cast<const VantagePoint*>(
               &_VantagePoint_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    0;

  friend void swap(VantagePoint& a, VantagePoint& b) {
    a.Swap(&b);
  }
  inline void Swap(VantagePoint* other) {
    if (other == this) return;
    if (GetArena() == other->GetArena()) {
      InternalSwap(other);
    } else {
      ::PROTOBUF_NAMESPACE_ID::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(VantagePoint* other) {
    if (other == this) return;
    GOOGLE_DCHECK(GetArena() == other->GetArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  inline VantagePoint* New() const final {
    return CreateMaybeMessage<VantagePoint>(nullptr);
  }

  VantagePoint* New(::PROTOBUF_NAMESPACE_ID::Arena* arena) const final {
    return CreateMaybeMessage<VantagePoint>(arena);
  }
  void CopyFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) final;
  void MergeFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) final;
  void CopyFrom(const VantagePoint& from);
  void MergeFrom(const VantagePoint& from);
  PROTOBUF_ATTRIBUTE_REINITIALIZES void Clear() final;
  bool IsInitialized() const final;

  size_t ByteSizeLong() const final;
  const char* _InternalParse(const char* ptr, ::PROTOBUF_NAMESPACE_ID::internal::ParseContext* ctx) final;
  ::PROTOBUF_NAMESPACE_ID::uint8* _InternalSerialize(
      ::PROTOBUF_NAMESPACE_ID::uint8* target, ::PROTOBUF_NAMESPACE_ID::io::EpsCopyOutputStream* stream) const final;
  int GetCachedSize() const final { return _cached_size_.Get(); }

  private:
  inline void SharedCtor();
  inline void SharedDtor();
  void SetCachedSize(int size) const final;
  void InternalSwap(VantagePoint* other);
  friend class ::PROTOBUF_NAMESPACE_ID::internal::AnyMetadata;
  static ::PROTOBUF_NAMESPACE_ID::StringPiece FullMessageName() {
    return "kentik.net.v202303.VantagePoint";
  }
  protected:
  explicit VantagePoint(::PROTOBUF_NAMESPACE_ID::Arena* arena);
  private:
  static void ArenaDtor(void* object);
  inline void RegisterArenaDtor(::PROTOBUF_NAMESPACE_ID::Arena* arena);
  public:

  ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadata() const final;
  private:
  static ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadataStatic() {
    ::PROTOBUF_NAMESPACE_ID::internal::AssignDescriptors(&::descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto);
    return ::descriptor_table_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto.file_level_metadata[kIndexInFileMessages];
  }

  public:

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  enum : int {
    kDatasetFieldNumber = 1,
    kCollectorFieldNumber = 2,
    kPeerIpFieldNumber = 4,
    kPeerAsnFieldNumber = 3,
  };
  // string dataset = 1[json_name = "dataset", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_dataset();
  const std::string& dataset() const;
  void set_dataset(const std::string& value);
  void set_dataset(std::string&& value);
  void set_dataset(const char* value);
  void set_dataset(const char* value, size_t size);
  std::string* mutable_dataset();
  std::string* release_dataset();
  void set_allocated_dataset(std::string* dataset);
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  std::string* unsafe_arena_release_dataset();
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  void unsafe_arena_set_allocated_dataset(
      std::string* dataset);
  private:
  const std::string& _internal_dataset() const;
  void _internal_set_dataset(const std::string& value);
  std::string* _internal_mutable_dataset();
  public:

  // string collector = 2[json_name = "collector", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_collector();
  const std::string& collector() const;
  void set_collector(const std::string& value);
  void set_collector(std::string&& value);
  void set_collector(const char* value);
  void set_collector(const char* value, size_t size);
  std::string* mutable_collector();
  std::string* release_collector();
  void set_allocated_collector(std::string* collector);
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  std::string* unsafe_arena_release_collector();
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  void unsafe_arena_set_allocated_collector(
      std::string* collector);
  private:
  const std::string& _internal_collector() const;
  void _internal_set_collector(const std::string& value);
  std::string* _internal_mutable_collector();
  public:

  // string peer_ip = 4[json_name = "peerIp", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_peer_ip();
  const std::string& peer_ip() const;
  void set_peer_ip(const std::string& value);
  void set_peer_ip(std::string&& value);
  void set_peer_ip(const char* value);
  void set_peer_ip(const char* value, size_t size);
  std::string* mutable_peer_ip();
  std::string* release_peer_ip();
  void set_allocated_peer_ip(std::string* peer_ip);
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  std::string* unsafe_arena_release_peer_ip();
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  void unsafe_arena_set_allocated_peer_ip(
      std::string* peer_ip);
  private:
  const std::string& _internal_peer_ip() const;
  void _internal_set_peer_ip(const std::string& value);
  std::string* _internal_mutable_peer_ip();
  public:

  // uint32 peer_asn = 3[json_name = "peerAsn", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_peer_asn();
  ::PROTOBUF_NAMESPACE_ID::uint32 peer_asn() const;
  void set_peer_asn(::PROTOBUF_NAMESPACE_ID::uint32 value);
  private:
  ::PROTOBUF_NAMESPACE_ID::uint32 _internal_peer_asn() const;
  void _internal_set_peer_asn(::PROTOBUF_NAMESPACE_ID::uint32 value);
  public:

  // @@protoc_insertion_point(class_scope:kentik.net.v202303.VantagePoint)
 private:
  class _Internal;

  template <typename T> friend class ::PROTOBUF_NAMESPACE_ID::Arena::InternalHelper;
  typedef void InternalArenaConstructable_;
  typedef void DestructorSkippable_;
  ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr dataset_;
  ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr collector_;
  ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr peer_ip_;
  ::PROTOBUF_NAMESPACE_ID::uint32 peer_asn_;
  mutable ::PROTOBUF_NAMESPACE_ID::internal::CachedSize _cached_size_;
  friend struct ::TableStruct_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto;
};
// ===================================================================


// ===================================================================

#ifdef __GNUC__
  #pragma GCC diagnostic push
  #pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif  // __GNUC__
// VantagePoint

// string dataset = 1[json_name = "dataset", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void VantagePoint::clear_dataset() {
  dataset_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline const std::string& VantagePoint::dataset() const {
  // @@protoc_insertion_point(field_get:kentik.net.v202303.VantagePoint.dataset)
  return _internal_dataset();
}
inline void VantagePoint::set_dataset(const std::string& value) {
  _internal_set_dataset(value);
  // @@protoc_insertion_point(field_set:kentik.net.v202303.VantagePoint.dataset)
}
inline std::string* VantagePoint::mutable_dataset() {
  // @@protoc_insertion_point(field_mutable:kentik.net.v202303.VantagePoint.dataset)
  return _internal_mutable_dataset();
}
inline const std::string& VantagePoint::_internal_dataset() const {
  return dataset_.Get();
}
inline void VantagePoint::_internal_set_dataset(const std::string& value) {
  
  dataset_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), value, GetArena());
}
inline void VantagePoint::set_dataset(std::string&& value) {
  
  dataset_.Set(
    &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::move(value), GetArena());
  // @@protoc_insertion_point(field_set_rvalue:kentik.net.v202303.VantagePoint.dataset)
}
inline void VantagePoint::set_dataset(const char* value) {
  GOOGLE_DCHECK(value != nullptr);
  
  dataset_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(value),
              GetArena());
  // @@protoc_insertion_point(field_set_char:kentik.net.v202303.VantagePoint.dataset)
}
inline void VantagePoint::set_dataset(const char* value,
    size_t size) {
  
  dataset_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(
      reinterpret_cast<const char*>(value), size), GetArena());
  // @@protoc_insertion_point(field_set_pointer:kentik.net.v202303.VantagePoint.dataset)
}
inline std::string* VantagePoint::_internal_mutable_dataset() {
  
  return dataset_.Mutable(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline std::string* VantagePoint::release_dataset() {
  // @@protoc_insertion_point(field_release:kentik.net.v202303.VantagePoint.dataset)
  return dataset_.Release(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline void VantagePoint::set_allocated_dataset(std::string* dataset) {
  if (dataset != nullptr) {
    
  } else {
    
  }
  dataset_.SetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), dataset,
      GetArena());
  // @@protoc_insertion_point(field_set_allocated:kentik.net.v202303.VantagePoint.dataset)
}
inline std::string* VantagePoint::unsafe_arena_release_dataset() {
  // @@protoc_insertion_point(field_unsafe_arena_release:kentik.net.v202303.VantagePoint.dataset)
  GOOGLE_DCHECK(GetArena() != nullptr);
  
  return dataset_.UnsafeArenaRelease(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      GetArena());
}
inline void VantagePoint::unsafe_arena_set_allocated_dataset(
    std::string* dataset) {
  GOOGLE_DCHECK(GetArena() != nullptr);
  if (dataset != nullptr) {
    
  } else {
    
  }
  dataset_.UnsafeArenaSetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      dataset, GetArena());
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:kentik.net.v202303.VantagePoint.dataset)
}

// string collector = 2[json_name = "collector", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void VantagePoint::clear_collector() {
  collector_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline const std::string& VantagePoint::collector() const {
  // @@protoc_insertion_point(field_get:kentik.net.v202303.VantagePoint.collector)
  return _internal_collector();
}
inline void VantagePoint::set_collector(const std::string& value) {
  _internal_set_collector(value);
  // @@protoc_insertion_point(field_set:kentik.net.v202303.VantagePoint.collector)
}
inline std::string* VantagePoint::mutable_collector() {
  // @@protoc_insertion_point(field_mutable:kentik.net.v202303.VantagePoint.collector)
  return _internal_mutable_collector();
}
inline const std::string& VantagePoint::_internal_collector() const {
  return collector_.Get();
}
inline void VantagePoint::_internal_set_collector(const std::string& value) {
  
  collector_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), value, GetArena());
}
inline void VantagePoint::set_collector(std::string&& value) {
  
  collector_.Set(
    &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::move(value), GetArena());
  // @@protoc_insertion_point(field_set_rvalue:kentik.net.v202303.VantagePoint.collector)
}
inline void VantagePoint::set_collector(const char* value) {
  GOOGLE_DCHECK(value != nullptr);
  
  collector_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(value),
              GetArena());
  // @@protoc_insertion_point(field_set_char:kentik.net.v202303.VantagePoint.collector)
}
inline void VantagePoint::set_collector(const char* value,
    size_t size) {
  
  collector_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(
      reinterpret_cast<const char*>(value), size), GetArena());
  // @@protoc_insertion_point(field_set_pointer:kentik.net.v202303.VantagePoint.collector)
}
inline std::string* VantagePoint::_internal_mutable_collector() {
  
  return collector_.Mutable(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline std::string* VantagePoint::release_collector() {
  // @@protoc_insertion_point(field_release:kentik.net.v202303.VantagePoint.collector)
  return collector_.Release(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline void VantagePoint::set_allocated_collector(std::string* collector) {
  if (collector != nullptr) {
    
  } else {
    
  }
  collector_.SetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), collector,
      GetArena());
  // @@protoc_insertion_point(field_set_allocated:kentik.net.v202303.VantagePoint.collector)
}
inline std::string* VantagePoint::unsafe_arena_release_collector() {
  // @@protoc_insertion_point(field_unsafe_arena_release:kentik.net.v202303.VantagePoint.collector)
  GOOGLE_DCHECK(GetArena() != nullptr);
  
  return collector_.UnsafeArenaRelease(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      GetArena());
}
inline void VantagePoint::unsafe_arena_set_allocated_collector(
    std::string* collector) {
  GOOGLE_DCHECK(GetArena() != nullptr);
  if (collector != nullptr) {
    
  } else {
    
  }
  collector_.UnsafeArenaSetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      collector, GetArena());
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:kentik.net.v202303.VantagePoint.collector)
}

// uint32 peer_asn = 3[json_name = "peerAsn", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void VantagePoint::clear_peer_asn() {
  peer_asn_ = 0u;
}
inline ::PROTOBUF_NAMESPACE_ID::uint32 VantagePoint::_internal_peer_asn() const {
  return peer_asn_;
}
inline ::PROTOBUF_NAMESPACE_ID::uint32 VantagePoint::peer_asn() const {
  // @@protoc_insertion_point(field_get:kentik.net.v202303.VantagePoint.peer_asn)
  return _internal_peer_asn();
}
inline void VantagePoint::_internal_set_peer_asn(::PROTOBUF_NAMESPACE_ID::uint32 value) {
  
  peer_asn_ = value;
}
inline void VantagePoint::set_peer_asn(::PROTOBUF_NAMESPACE_ID::uint32 value) {
  _internal_set_peer_asn(value);
  // @@protoc_insertion_point(field_set:kentik.net.v202303.VantagePoint.peer_asn)
}

// string peer_ip = 4[json_name = "peerIp", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void VantagePoint::clear_peer_ip() {
  peer_ip_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline const std::string& VantagePoint::peer_ip() const {
  // @@protoc_insertion_point(field_get:kentik.net.v202303.VantagePoint.peer_ip)
  return _internal_peer_ip();
}
inline void VantagePoint::set_peer_ip(const std::string& value) {
  _internal_set_peer_ip(value);
  // @@protoc_insertion_point(field_set:kentik.net.v202303.VantagePoint.peer_ip)
}
inline std::string* VantagePoint::mutable_peer_ip() {
  // @@protoc_insertion_point(field_mutable:kentik.net.v202303.VantagePoint.peer_ip)
  return _internal_mutable_peer_ip();
}
inline const std::string& VantagePoint::_internal_peer_ip() const {
  return peer_ip_.Get();
}
inline void VantagePoint::_internal_set_peer_ip(const std::string& value) {
  
  peer_ip_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), value, GetArena());
}
inline void VantagePoint::set_peer_ip(std::string&& value) {
  
  peer_ip_.Set(
    &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::move(value), GetArena());
  // @@protoc_insertion_point(field_set_rvalue:kentik.net.v202303.VantagePoint.peer_ip)
}
inline void VantagePoint::set_peer_ip(const char* value) {
  GOOGLE_DCHECK(value != nullptr);
  
  peer_ip_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(value),
              GetArena());
  // @@protoc_insertion_point(field_set_char:kentik.net.v202303.VantagePoint.peer_ip)
}
inline void VantagePoint::set_peer_ip(const char* value,
    size_t size) {
  
  peer_ip_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(
      reinterpret_cast<const char*>(value), size), GetArena());
  // @@protoc_insertion_point(field_set_pointer:kentik.net.v202303.VantagePoint.peer_ip)
}
inline std::string* VantagePoint::_internal_mutable_peer_ip() {
  
  return peer_ip_.Mutable(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline std::string* VantagePoint::release_peer_ip() {
  // @@protoc_insertion_point(field_release:kentik.net.v202303.VantagePoint.peer_ip)
  return peer_ip_.Release(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline void VantagePoint::set_allocated_peer_ip(std::string* peer_ip) {
  if (peer_ip != nullptr) {
    
  } else {
    
  }
  peer_ip_.SetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), peer_ip,
      GetArena());
  // @@protoc_insertion_point(field_set_allocated:kentik.net.v202303.VantagePoint.peer_ip)
}
inline std::string* VantagePoint::unsafe_arena_release_peer_ip() {
  // @@protoc_insertion_point(field_unsafe_arena_release:kentik.net.v202303.VantagePoint.peer_ip)
  GOOGLE_DCHECK(GetArena() != nullptr);
  
  return peer_ip_.UnsafeArenaRelease(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      GetArena());
}
inline void VantagePoint::unsafe_arena_set_allocated_peer_ip(
    std::string* peer_ip) {
  GOOGLE_DCHECK(GetArena() != nullptr);
  if (peer_ip != nullptr) {
    
  } else {
    
  }
  peer_ip_.UnsafeArenaSetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      peer_ip, GetArena());
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:kentik.net.v202303.VantagePoint.peer_ip)
}

#ifdef __GNUC__
  #pragma GCC diagnostic pop
#endif  // __GNUC__

// @@protoc_insertion_point(namespace_scope)

}  // namespace v202303
}  // namespace net
}  // namespace kentik

PROTOBUF_NAMESPACE_OPEN

template <> struct is_proto_enum< ::kentik::net::v202303::Afi> : ::std::true_type {};
template <>
inline const EnumDescriptor* GetEnumDescriptor< ::kentik::net::v202303::Afi>() {
  return ::kentik::net::v202303::Afi_descriptor();
}
template <> struct is_proto_enum< ::kentik::net::v202303::Safi> : ::std::true_type {};
template <>
inline const EnumDescriptor* GetEnumDescriptor< ::kentik::net::v202303::Safi>() {
  return ::kentik::net::v202303::Safi_descriptor();
}
template <> struct is_proto_enum< ::kentik::net::v202303::RpkiStatus> : ::std::true_type {};
template <>
inline const EnumDescriptor* GetEnumDescriptor< ::kentik::net::v202303::RpkiStatus>() {
  return ::kentik::net::v202303::RpkiStatus_descriptor();
}

PROTOBUF_NAMESPACE_CLOSE

// @@protoc_insertion_point(global_scope)

#include <google/protobuf/port_undef.inc>
#endif  // GOOGLE_PROTOBUF_INCLUDED_GOOGLE_PROTOBUF_INCLUDED_kentik_2fnet_2fv202303_2fbgp_5ftypes_2eproto
