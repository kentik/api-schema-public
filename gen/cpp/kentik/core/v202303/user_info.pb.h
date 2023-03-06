// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: kentik/core/v202303/user_info.proto

#ifndef GOOGLE_PROTOBUF_INCLUDED_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto
#define GOOGLE_PROTOBUF_INCLUDED_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto

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
#include <google/protobuf/unknown_field_set.h>
#include "protoc-gen-openapiv2/options/annotations.pb.h"
#include "google/api/field_behavior.pb.h"
// @@protoc_insertion_point(includes)
#include <google/protobuf/port_def.inc>
#define PROTOBUF_INTERNAL_EXPORT_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto
PROTOBUF_NAMESPACE_OPEN
namespace internal {
class AnyMetadata;
}  // namespace internal
PROTOBUF_NAMESPACE_CLOSE

// Internal implementation detail -- do not use these members.
struct TableStruct_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto {
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
extern const ::PROTOBUF_NAMESPACE_ID::internal::DescriptorTable descriptor_table_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto;
namespace kentik {
namespace core {
namespace v202303 {
class UserInfo;
class UserInfoDefaultTypeInternal;
extern UserInfoDefaultTypeInternal _UserInfo_default_instance_;
}  // namespace v202303
}  // namespace core
}  // namespace kentik
PROTOBUF_NAMESPACE_OPEN
template<> ::kentik::core::v202303::UserInfo* Arena::CreateMaybeMessage<::kentik::core::v202303::UserInfo>(Arena*);
PROTOBUF_NAMESPACE_CLOSE
namespace kentik {
namespace core {
namespace v202303 {

// ===================================================================

class UserInfo PROTOBUF_FINAL :
    public ::PROTOBUF_NAMESPACE_ID::Message /* @@protoc_insertion_point(class_definition:kentik.core.v202303.UserInfo) */ {
 public:
  inline UserInfo() : UserInfo(nullptr) {};
  virtual ~UserInfo();

  UserInfo(const UserInfo& from);
  UserInfo(UserInfo&& from) noexcept
    : UserInfo() {
    *this = ::std::move(from);
  }

  inline UserInfo& operator=(const UserInfo& from) {
    CopyFrom(from);
    return *this;
  }
  inline UserInfo& operator=(UserInfo&& from) noexcept {
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
  static const UserInfo& default_instance();

  static void InitAsDefaultInstance();  // FOR INTERNAL USE ONLY
  static inline const UserInfo* internal_default_instance() {
    return reinterpret_cast<const UserInfo*>(
               &_UserInfo_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    0;

  friend void swap(UserInfo& a, UserInfo& b) {
    a.Swap(&b);
  }
  inline void Swap(UserInfo* other) {
    if (other == this) return;
    if (GetArena() == other->GetArena()) {
      InternalSwap(other);
    } else {
      ::PROTOBUF_NAMESPACE_ID::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(UserInfo* other) {
    if (other == this) return;
    GOOGLE_DCHECK(GetArena() == other->GetArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  inline UserInfo* New() const final {
    return CreateMaybeMessage<UserInfo>(nullptr);
  }

  UserInfo* New(::PROTOBUF_NAMESPACE_ID::Arena* arena) const final {
    return CreateMaybeMessage<UserInfo>(arena);
  }
  void CopyFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) final;
  void MergeFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) final;
  void CopyFrom(const UserInfo& from);
  void MergeFrom(const UserInfo& from);
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
  void InternalSwap(UserInfo* other);
  friend class ::PROTOBUF_NAMESPACE_ID::internal::AnyMetadata;
  static ::PROTOBUF_NAMESPACE_ID::StringPiece FullMessageName() {
    return "kentik.core.v202303.UserInfo";
  }
  protected:
  explicit UserInfo(::PROTOBUF_NAMESPACE_ID::Arena* arena);
  private:
  static void ArenaDtor(void* object);
  inline void RegisterArenaDtor(::PROTOBUF_NAMESPACE_ID::Arena* arena);
  public:

  ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadata() const final;
  private:
  static ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadataStatic() {
    ::PROTOBUF_NAMESPACE_ID::internal::AssignDescriptors(&::descriptor_table_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto);
    return ::descriptor_table_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto.file_level_metadata[kIndexInFileMessages];
  }

  public:

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  enum : int {
    kIdFieldNumber = 1,
    kEmailFieldNumber = 2,
    kFullNameFieldNumber = 3,
  };
  // string id = 1[json_name = "id", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_id();
  const std::string& id() const;
  void set_id(const std::string& value);
  void set_id(std::string&& value);
  void set_id(const char* value);
  void set_id(const char* value, size_t size);
  std::string* mutable_id();
  std::string* release_id();
  void set_allocated_id(std::string* id);
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  std::string* unsafe_arena_release_id();
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  void unsafe_arena_set_allocated_id(
      std::string* id);
  private:
  const std::string& _internal_id() const;
  void _internal_set_id(const std::string& value);
  std::string* _internal_mutable_id();
  public:

  // string email = 2[json_name = "email", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_email();
  const std::string& email() const;
  void set_email(const std::string& value);
  void set_email(std::string&& value);
  void set_email(const char* value);
  void set_email(const char* value, size_t size);
  std::string* mutable_email();
  std::string* release_email();
  void set_allocated_email(std::string* email);
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  std::string* unsafe_arena_release_email();
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  void unsafe_arena_set_allocated_email(
      std::string* email);
  private:
  const std::string& _internal_email() const;
  void _internal_set_email(const std::string& value);
  std::string* _internal_mutable_email();
  public:

  // string full_name = 3[json_name = "fullName", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_full_name();
  const std::string& full_name() const;
  void set_full_name(const std::string& value);
  void set_full_name(std::string&& value);
  void set_full_name(const char* value);
  void set_full_name(const char* value, size_t size);
  std::string* mutable_full_name();
  std::string* release_full_name();
  void set_allocated_full_name(std::string* full_name);
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  std::string* unsafe_arena_release_full_name();
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  void unsafe_arena_set_allocated_full_name(
      std::string* full_name);
  private:
  const std::string& _internal_full_name() const;
  void _internal_set_full_name(const std::string& value);
  std::string* _internal_mutable_full_name();
  public:

  // @@protoc_insertion_point(class_scope:kentik.core.v202303.UserInfo)
 private:
  class _Internal;

  template <typename T> friend class ::PROTOBUF_NAMESPACE_ID::Arena::InternalHelper;
  typedef void InternalArenaConstructable_;
  typedef void DestructorSkippable_;
  ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr id_;
  ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr email_;
  ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr full_name_;
  mutable ::PROTOBUF_NAMESPACE_ID::internal::CachedSize _cached_size_;
  friend struct ::TableStruct_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto;
};
// ===================================================================


// ===================================================================

#ifdef __GNUC__
  #pragma GCC diagnostic push
  #pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif  // __GNUC__
// UserInfo

// string id = 1[json_name = "id", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void UserInfo::clear_id() {
  id_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline const std::string& UserInfo::id() const {
  // @@protoc_insertion_point(field_get:kentik.core.v202303.UserInfo.id)
  return _internal_id();
}
inline void UserInfo::set_id(const std::string& value) {
  _internal_set_id(value);
  // @@protoc_insertion_point(field_set:kentik.core.v202303.UserInfo.id)
}
inline std::string* UserInfo::mutable_id() {
  // @@protoc_insertion_point(field_mutable:kentik.core.v202303.UserInfo.id)
  return _internal_mutable_id();
}
inline const std::string& UserInfo::_internal_id() const {
  return id_.Get();
}
inline void UserInfo::_internal_set_id(const std::string& value) {
  
  id_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), value, GetArena());
}
inline void UserInfo::set_id(std::string&& value) {
  
  id_.Set(
    &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::move(value), GetArena());
  // @@protoc_insertion_point(field_set_rvalue:kentik.core.v202303.UserInfo.id)
}
inline void UserInfo::set_id(const char* value) {
  GOOGLE_DCHECK(value != nullptr);
  
  id_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(value),
              GetArena());
  // @@protoc_insertion_point(field_set_char:kentik.core.v202303.UserInfo.id)
}
inline void UserInfo::set_id(const char* value,
    size_t size) {
  
  id_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(
      reinterpret_cast<const char*>(value), size), GetArena());
  // @@protoc_insertion_point(field_set_pointer:kentik.core.v202303.UserInfo.id)
}
inline std::string* UserInfo::_internal_mutable_id() {
  
  return id_.Mutable(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline std::string* UserInfo::release_id() {
  // @@protoc_insertion_point(field_release:kentik.core.v202303.UserInfo.id)
  return id_.Release(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline void UserInfo::set_allocated_id(std::string* id) {
  if (id != nullptr) {
    
  } else {
    
  }
  id_.SetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), id,
      GetArena());
  // @@protoc_insertion_point(field_set_allocated:kentik.core.v202303.UserInfo.id)
}
inline std::string* UserInfo::unsafe_arena_release_id() {
  // @@protoc_insertion_point(field_unsafe_arena_release:kentik.core.v202303.UserInfo.id)
  GOOGLE_DCHECK(GetArena() != nullptr);
  
  return id_.UnsafeArenaRelease(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      GetArena());
}
inline void UserInfo::unsafe_arena_set_allocated_id(
    std::string* id) {
  GOOGLE_DCHECK(GetArena() != nullptr);
  if (id != nullptr) {
    
  } else {
    
  }
  id_.UnsafeArenaSetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      id, GetArena());
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:kentik.core.v202303.UserInfo.id)
}

// string email = 2[json_name = "email", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void UserInfo::clear_email() {
  email_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline const std::string& UserInfo::email() const {
  // @@protoc_insertion_point(field_get:kentik.core.v202303.UserInfo.email)
  return _internal_email();
}
inline void UserInfo::set_email(const std::string& value) {
  _internal_set_email(value);
  // @@protoc_insertion_point(field_set:kentik.core.v202303.UserInfo.email)
}
inline std::string* UserInfo::mutable_email() {
  // @@protoc_insertion_point(field_mutable:kentik.core.v202303.UserInfo.email)
  return _internal_mutable_email();
}
inline const std::string& UserInfo::_internal_email() const {
  return email_.Get();
}
inline void UserInfo::_internal_set_email(const std::string& value) {
  
  email_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), value, GetArena());
}
inline void UserInfo::set_email(std::string&& value) {
  
  email_.Set(
    &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::move(value), GetArena());
  // @@protoc_insertion_point(field_set_rvalue:kentik.core.v202303.UserInfo.email)
}
inline void UserInfo::set_email(const char* value) {
  GOOGLE_DCHECK(value != nullptr);
  
  email_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(value),
              GetArena());
  // @@protoc_insertion_point(field_set_char:kentik.core.v202303.UserInfo.email)
}
inline void UserInfo::set_email(const char* value,
    size_t size) {
  
  email_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(
      reinterpret_cast<const char*>(value), size), GetArena());
  // @@protoc_insertion_point(field_set_pointer:kentik.core.v202303.UserInfo.email)
}
inline std::string* UserInfo::_internal_mutable_email() {
  
  return email_.Mutable(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline std::string* UserInfo::release_email() {
  // @@protoc_insertion_point(field_release:kentik.core.v202303.UserInfo.email)
  return email_.Release(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline void UserInfo::set_allocated_email(std::string* email) {
  if (email != nullptr) {
    
  } else {
    
  }
  email_.SetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), email,
      GetArena());
  // @@protoc_insertion_point(field_set_allocated:kentik.core.v202303.UserInfo.email)
}
inline std::string* UserInfo::unsafe_arena_release_email() {
  // @@protoc_insertion_point(field_unsafe_arena_release:kentik.core.v202303.UserInfo.email)
  GOOGLE_DCHECK(GetArena() != nullptr);
  
  return email_.UnsafeArenaRelease(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      GetArena());
}
inline void UserInfo::unsafe_arena_set_allocated_email(
    std::string* email) {
  GOOGLE_DCHECK(GetArena() != nullptr);
  if (email != nullptr) {
    
  } else {
    
  }
  email_.UnsafeArenaSetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      email, GetArena());
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:kentik.core.v202303.UserInfo.email)
}

// string full_name = 3[json_name = "fullName", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void UserInfo::clear_full_name() {
  full_name_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline const std::string& UserInfo::full_name() const {
  // @@protoc_insertion_point(field_get:kentik.core.v202303.UserInfo.full_name)
  return _internal_full_name();
}
inline void UserInfo::set_full_name(const std::string& value) {
  _internal_set_full_name(value);
  // @@protoc_insertion_point(field_set:kentik.core.v202303.UserInfo.full_name)
}
inline std::string* UserInfo::mutable_full_name() {
  // @@protoc_insertion_point(field_mutable:kentik.core.v202303.UserInfo.full_name)
  return _internal_mutable_full_name();
}
inline const std::string& UserInfo::_internal_full_name() const {
  return full_name_.Get();
}
inline void UserInfo::_internal_set_full_name(const std::string& value) {
  
  full_name_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), value, GetArena());
}
inline void UserInfo::set_full_name(std::string&& value) {
  
  full_name_.Set(
    &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::move(value), GetArena());
  // @@protoc_insertion_point(field_set_rvalue:kentik.core.v202303.UserInfo.full_name)
}
inline void UserInfo::set_full_name(const char* value) {
  GOOGLE_DCHECK(value != nullptr);
  
  full_name_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(value),
              GetArena());
  // @@protoc_insertion_point(field_set_char:kentik.core.v202303.UserInfo.full_name)
}
inline void UserInfo::set_full_name(const char* value,
    size_t size) {
  
  full_name_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(
      reinterpret_cast<const char*>(value), size), GetArena());
  // @@protoc_insertion_point(field_set_pointer:kentik.core.v202303.UserInfo.full_name)
}
inline std::string* UserInfo::_internal_mutable_full_name() {
  
  return full_name_.Mutable(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline std::string* UserInfo::release_full_name() {
  // @@protoc_insertion_point(field_release:kentik.core.v202303.UserInfo.full_name)
  return full_name_.Release(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline void UserInfo::set_allocated_full_name(std::string* full_name) {
  if (full_name != nullptr) {
    
  } else {
    
  }
  full_name_.SetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), full_name,
      GetArena());
  // @@protoc_insertion_point(field_set_allocated:kentik.core.v202303.UserInfo.full_name)
}
inline std::string* UserInfo::unsafe_arena_release_full_name() {
  // @@protoc_insertion_point(field_unsafe_arena_release:kentik.core.v202303.UserInfo.full_name)
  GOOGLE_DCHECK(GetArena() != nullptr);
  
  return full_name_.UnsafeArenaRelease(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      GetArena());
}
inline void UserInfo::unsafe_arena_set_allocated_full_name(
    std::string* full_name) {
  GOOGLE_DCHECK(GetArena() != nullptr);
  if (full_name != nullptr) {
    
  } else {
    
  }
  full_name_.UnsafeArenaSetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      full_name, GetArena());
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:kentik.core.v202303.UserInfo.full_name)
}

#ifdef __GNUC__
  #pragma GCC diagnostic pop
#endif  // __GNUC__

// @@protoc_insertion_point(namespace_scope)

}  // namespace v202303
}  // namespace core
}  // namespace kentik

// @@protoc_insertion_point(global_scope)

#include <google/protobuf/port_undef.inc>
#endif  // GOOGLE_PROTOBUF_INCLUDED_GOOGLE_PROTOBUF_INCLUDED_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto
