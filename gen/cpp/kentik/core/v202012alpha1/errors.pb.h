// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: kentik/core/v202012alpha1/errors.proto

#ifndef GOOGLE_PROTOBUF_INCLUDED_kentik_2fcore_2fv202012alpha1_2ferrors_2eproto
#define GOOGLE_PROTOBUF_INCLUDED_kentik_2fcore_2fv202012alpha1_2ferrors_2eproto

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
#include <google/protobuf/timestamp.pb.h>
#include "protoc-gen-openapiv2/options/annotations.pb.h"
// @@protoc_insertion_point(includes)
#include <google/protobuf/port_def.inc>
#define PROTOBUF_INTERNAL_EXPORT_kentik_2fcore_2fv202012alpha1_2ferrors_2eproto
PROTOBUF_NAMESPACE_OPEN
namespace internal {
class AnyMetadata;
}  // namespace internal
PROTOBUF_NAMESPACE_CLOSE

// Internal implementation detail -- do not use these members.
struct TableStruct_kentik_2fcore_2fv202012alpha1_2ferrors_2eproto {
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
extern const ::PROTOBUF_NAMESPACE_ID::internal::DescriptorTable descriptor_table_kentik_2fcore_2fv202012alpha1_2ferrors_2eproto;
namespace kentik {
namespace core {
namespace v202012alpha1 {
class ErrorInfo;
class ErrorInfoDefaultTypeInternal;
extern ErrorInfoDefaultTypeInternal _ErrorInfo_default_instance_;
}  // namespace v202012alpha1
}  // namespace core
}  // namespace kentik
PROTOBUF_NAMESPACE_OPEN
template<> ::kentik::core::v202012alpha1::ErrorInfo* Arena::CreateMaybeMessage<::kentik::core::v202012alpha1::ErrorInfo>(Arena*);
PROTOBUF_NAMESPACE_CLOSE
namespace kentik {
namespace core {
namespace v202012alpha1 {

// ===================================================================

class ErrorInfo PROTOBUF_FINAL :
    public ::PROTOBUF_NAMESPACE_ID::Message /* @@protoc_insertion_point(class_definition:kentik.core.v202012alpha1.ErrorInfo) */ {
 public:
  inline ErrorInfo() : ErrorInfo(nullptr) {};
  virtual ~ErrorInfo();

  ErrorInfo(const ErrorInfo& from);
  ErrorInfo(ErrorInfo&& from) noexcept
    : ErrorInfo() {
    *this = ::std::move(from);
  }

  inline ErrorInfo& operator=(const ErrorInfo& from) {
    CopyFrom(from);
    return *this;
  }
  inline ErrorInfo& operator=(ErrorInfo&& from) noexcept {
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
  static const ErrorInfo& default_instance();

  static void InitAsDefaultInstance();  // FOR INTERNAL USE ONLY
  static inline const ErrorInfo* internal_default_instance() {
    return reinterpret_cast<const ErrorInfo*>(
               &_ErrorInfo_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    0;

  friend void swap(ErrorInfo& a, ErrorInfo& b) {
    a.Swap(&b);
  }
  inline void Swap(ErrorInfo* other) {
    if (other == this) return;
    if (GetArena() == other->GetArena()) {
      InternalSwap(other);
    } else {
      ::PROTOBUF_NAMESPACE_ID::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(ErrorInfo* other) {
    if (other == this) return;
    GOOGLE_DCHECK(GetArena() == other->GetArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  inline ErrorInfo* New() const final {
    return CreateMaybeMessage<ErrorInfo>(nullptr);
  }

  ErrorInfo* New(::PROTOBUF_NAMESPACE_ID::Arena* arena) const final {
    return CreateMaybeMessage<ErrorInfo>(arena);
  }
  void CopyFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) final;
  void MergeFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) final;
  void CopyFrom(const ErrorInfo& from);
  void MergeFrom(const ErrorInfo& from);
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
  void InternalSwap(ErrorInfo* other);
  friend class ::PROTOBUF_NAMESPACE_ID::internal::AnyMetadata;
  static ::PROTOBUF_NAMESPACE_ID::StringPiece FullMessageName() {
    return "kentik.core.v202012alpha1.ErrorInfo";
  }
  protected:
  explicit ErrorInfo(::PROTOBUF_NAMESPACE_ID::Arena* arena);
  private:
  static void ArenaDtor(void* object);
  inline void RegisterArenaDtor(::PROTOBUF_NAMESPACE_ID::Arena* arena);
  public:

  ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadata() const final;
  private:
  static ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadataStatic() {
    ::PROTOBUF_NAMESPACE_ID::internal::AssignDescriptors(&::descriptor_table_kentik_2fcore_2fv202012alpha1_2ferrors_2eproto);
    return ::descriptor_table_kentik_2fcore_2fv202012alpha1_2ferrors_2eproto.file_level_metadata[kIndexInFileMessages];
  }

  public:

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  enum : int {
    kMessageFieldNumber = 2,
    kCorrelationIdFieldNumber = 3,
    kDocumentationLinkFieldNumber = 5,
    kTimestampFieldNumber = 4,
    kCodeFieldNumber = 1,
  };
  // string message = 2[json_name = "message", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_message();
  const std::string& message() const;
  void set_message(const std::string& value);
  void set_message(std::string&& value);
  void set_message(const char* value);
  void set_message(const char* value, size_t size);
  std::string* mutable_message();
  std::string* release_message();
  void set_allocated_message(std::string* message);
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  std::string* unsafe_arena_release_message();
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  void unsafe_arena_set_allocated_message(
      std::string* message);
  private:
  const std::string& _internal_message() const;
  void _internal_set_message(const std::string& value);
  std::string* _internal_mutable_message();
  public:

  // string correlation_id = 3[json_name = "correlationId", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_correlation_id();
  const std::string& correlation_id() const;
  void set_correlation_id(const std::string& value);
  void set_correlation_id(std::string&& value);
  void set_correlation_id(const char* value);
  void set_correlation_id(const char* value, size_t size);
  std::string* mutable_correlation_id();
  std::string* release_correlation_id();
  void set_allocated_correlation_id(std::string* correlation_id);
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  std::string* unsafe_arena_release_correlation_id();
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  void unsafe_arena_set_allocated_correlation_id(
      std::string* correlation_id);
  private:
  const std::string& _internal_correlation_id() const;
  void _internal_set_correlation_id(const std::string& value);
  std::string* _internal_mutable_correlation_id();
  public:

  // string documentation_link = 5[json_name = "documentationLink", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_documentation_link();
  const std::string& documentation_link() const;
  void set_documentation_link(const std::string& value);
  void set_documentation_link(std::string&& value);
  void set_documentation_link(const char* value);
  void set_documentation_link(const char* value, size_t size);
  std::string* mutable_documentation_link();
  std::string* release_documentation_link();
  void set_allocated_documentation_link(std::string* documentation_link);
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  std::string* unsafe_arena_release_documentation_link();
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  void unsafe_arena_set_allocated_documentation_link(
      std::string* documentation_link);
  private:
  const std::string& _internal_documentation_link() const;
  void _internal_set_documentation_link(const std::string& value);
  std::string* _internal_mutable_documentation_link();
  public:

  // .google.protobuf.Timestamp timestamp = 4[json_name = "timestamp", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  bool has_timestamp() const;
  private:
  bool _internal_has_timestamp() const;
  public:
  void clear_timestamp();
  const PROTOBUF_NAMESPACE_ID::Timestamp& timestamp() const;
  PROTOBUF_NAMESPACE_ID::Timestamp* release_timestamp();
  PROTOBUF_NAMESPACE_ID::Timestamp* mutable_timestamp();
  void set_allocated_timestamp(PROTOBUF_NAMESPACE_ID::Timestamp* timestamp);
  private:
  const PROTOBUF_NAMESPACE_ID::Timestamp& _internal_timestamp() const;
  PROTOBUF_NAMESPACE_ID::Timestamp* _internal_mutable_timestamp();
  public:
  void unsafe_arena_set_allocated_timestamp(
      PROTOBUF_NAMESPACE_ID::Timestamp* timestamp);
  PROTOBUF_NAMESPACE_ID::Timestamp* unsafe_arena_release_timestamp();

  // int32 code = 1[json_name = "code", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_code();
  ::PROTOBUF_NAMESPACE_ID::int32 code() const;
  void set_code(::PROTOBUF_NAMESPACE_ID::int32 value);
  private:
  ::PROTOBUF_NAMESPACE_ID::int32 _internal_code() const;
  void _internal_set_code(::PROTOBUF_NAMESPACE_ID::int32 value);
  public:

  // @@protoc_insertion_point(class_scope:kentik.core.v202012alpha1.ErrorInfo)
 private:
  class _Internal;

  template <typename T> friend class ::PROTOBUF_NAMESPACE_ID::Arena::InternalHelper;
  typedef void InternalArenaConstructable_;
  typedef void DestructorSkippable_;
  ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr message_;
  ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr correlation_id_;
  ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr documentation_link_;
  PROTOBUF_NAMESPACE_ID::Timestamp* timestamp_;
  ::PROTOBUF_NAMESPACE_ID::int32 code_;
  mutable ::PROTOBUF_NAMESPACE_ID::internal::CachedSize _cached_size_;
  friend struct ::TableStruct_kentik_2fcore_2fv202012alpha1_2ferrors_2eproto;
};
// ===================================================================


// ===================================================================

#ifdef __GNUC__
  #pragma GCC diagnostic push
  #pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif  // __GNUC__
// ErrorInfo

// int32 code = 1[json_name = "code", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void ErrorInfo::clear_code() {
  code_ = 0;
}
inline ::PROTOBUF_NAMESPACE_ID::int32 ErrorInfo::_internal_code() const {
  return code_;
}
inline ::PROTOBUF_NAMESPACE_ID::int32 ErrorInfo::code() const {
  // @@protoc_insertion_point(field_get:kentik.core.v202012alpha1.ErrorInfo.code)
  return _internal_code();
}
inline void ErrorInfo::_internal_set_code(::PROTOBUF_NAMESPACE_ID::int32 value) {
  
  code_ = value;
}
inline void ErrorInfo::set_code(::PROTOBUF_NAMESPACE_ID::int32 value) {
  _internal_set_code(value);
  // @@protoc_insertion_point(field_set:kentik.core.v202012alpha1.ErrorInfo.code)
}

// string message = 2[json_name = "message", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void ErrorInfo::clear_message() {
  message_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline const std::string& ErrorInfo::message() const {
  // @@protoc_insertion_point(field_get:kentik.core.v202012alpha1.ErrorInfo.message)
  return _internal_message();
}
inline void ErrorInfo::set_message(const std::string& value) {
  _internal_set_message(value);
  // @@protoc_insertion_point(field_set:kentik.core.v202012alpha1.ErrorInfo.message)
}
inline std::string* ErrorInfo::mutable_message() {
  // @@protoc_insertion_point(field_mutable:kentik.core.v202012alpha1.ErrorInfo.message)
  return _internal_mutable_message();
}
inline const std::string& ErrorInfo::_internal_message() const {
  return message_.Get();
}
inline void ErrorInfo::_internal_set_message(const std::string& value) {
  
  message_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), value, GetArena());
}
inline void ErrorInfo::set_message(std::string&& value) {
  
  message_.Set(
    &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::move(value), GetArena());
  // @@protoc_insertion_point(field_set_rvalue:kentik.core.v202012alpha1.ErrorInfo.message)
}
inline void ErrorInfo::set_message(const char* value) {
  GOOGLE_DCHECK(value != nullptr);
  
  message_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(value),
              GetArena());
  // @@protoc_insertion_point(field_set_char:kentik.core.v202012alpha1.ErrorInfo.message)
}
inline void ErrorInfo::set_message(const char* value,
    size_t size) {
  
  message_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(
      reinterpret_cast<const char*>(value), size), GetArena());
  // @@protoc_insertion_point(field_set_pointer:kentik.core.v202012alpha1.ErrorInfo.message)
}
inline std::string* ErrorInfo::_internal_mutable_message() {
  
  return message_.Mutable(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline std::string* ErrorInfo::release_message() {
  // @@protoc_insertion_point(field_release:kentik.core.v202012alpha1.ErrorInfo.message)
  return message_.Release(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline void ErrorInfo::set_allocated_message(std::string* message) {
  if (message != nullptr) {
    
  } else {
    
  }
  message_.SetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), message,
      GetArena());
  // @@protoc_insertion_point(field_set_allocated:kentik.core.v202012alpha1.ErrorInfo.message)
}
inline std::string* ErrorInfo::unsafe_arena_release_message() {
  // @@protoc_insertion_point(field_unsafe_arena_release:kentik.core.v202012alpha1.ErrorInfo.message)
  GOOGLE_DCHECK(GetArena() != nullptr);
  
  return message_.UnsafeArenaRelease(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      GetArena());
}
inline void ErrorInfo::unsafe_arena_set_allocated_message(
    std::string* message) {
  GOOGLE_DCHECK(GetArena() != nullptr);
  if (message != nullptr) {
    
  } else {
    
  }
  message_.UnsafeArenaSetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      message, GetArena());
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:kentik.core.v202012alpha1.ErrorInfo.message)
}

// string correlation_id = 3[json_name = "correlationId", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void ErrorInfo::clear_correlation_id() {
  correlation_id_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline const std::string& ErrorInfo::correlation_id() const {
  // @@protoc_insertion_point(field_get:kentik.core.v202012alpha1.ErrorInfo.correlation_id)
  return _internal_correlation_id();
}
inline void ErrorInfo::set_correlation_id(const std::string& value) {
  _internal_set_correlation_id(value);
  // @@protoc_insertion_point(field_set:kentik.core.v202012alpha1.ErrorInfo.correlation_id)
}
inline std::string* ErrorInfo::mutable_correlation_id() {
  // @@protoc_insertion_point(field_mutable:kentik.core.v202012alpha1.ErrorInfo.correlation_id)
  return _internal_mutable_correlation_id();
}
inline const std::string& ErrorInfo::_internal_correlation_id() const {
  return correlation_id_.Get();
}
inline void ErrorInfo::_internal_set_correlation_id(const std::string& value) {
  
  correlation_id_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), value, GetArena());
}
inline void ErrorInfo::set_correlation_id(std::string&& value) {
  
  correlation_id_.Set(
    &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::move(value), GetArena());
  // @@protoc_insertion_point(field_set_rvalue:kentik.core.v202012alpha1.ErrorInfo.correlation_id)
}
inline void ErrorInfo::set_correlation_id(const char* value) {
  GOOGLE_DCHECK(value != nullptr);
  
  correlation_id_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(value),
              GetArena());
  // @@protoc_insertion_point(field_set_char:kentik.core.v202012alpha1.ErrorInfo.correlation_id)
}
inline void ErrorInfo::set_correlation_id(const char* value,
    size_t size) {
  
  correlation_id_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(
      reinterpret_cast<const char*>(value), size), GetArena());
  // @@protoc_insertion_point(field_set_pointer:kentik.core.v202012alpha1.ErrorInfo.correlation_id)
}
inline std::string* ErrorInfo::_internal_mutable_correlation_id() {
  
  return correlation_id_.Mutable(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline std::string* ErrorInfo::release_correlation_id() {
  // @@protoc_insertion_point(field_release:kentik.core.v202012alpha1.ErrorInfo.correlation_id)
  return correlation_id_.Release(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline void ErrorInfo::set_allocated_correlation_id(std::string* correlation_id) {
  if (correlation_id != nullptr) {
    
  } else {
    
  }
  correlation_id_.SetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), correlation_id,
      GetArena());
  // @@protoc_insertion_point(field_set_allocated:kentik.core.v202012alpha1.ErrorInfo.correlation_id)
}
inline std::string* ErrorInfo::unsafe_arena_release_correlation_id() {
  // @@protoc_insertion_point(field_unsafe_arena_release:kentik.core.v202012alpha1.ErrorInfo.correlation_id)
  GOOGLE_DCHECK(GetArena() != nullptr);
  
  return correlation_id_.UnsafeArenaRelease(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      GetArena());
}
inline void ErrorInfo::unsafe_arena_set_allocated_correlation_id(
    std::string* correlation_id) {
  GOOGLE_DCHECK(GetArena() != nullptr);
  if (correlation_id != nullptr) {
    
  } else {
    
  }
  correlation_id_.UnsafeArenaSetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      correlation_id, GetArena());
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:kentik.core.v202012alpha1.ErrorInfo.correlation_id)
}

// .google.protobuf.Timestamp timestamp = 4[json_name = "timestamp", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline bool ErrorInfo::_internal_has_timestamp() const {
  return this != internal_default_instance() && timestamp_ != nullptr;
}
inline bool ErrorInfo::has_timestamp() const {
  return _internal_has_timestamp();
}
inline const PROTOBUF_NAMESPACE_ID::Timestamp& ErrorInfo::_internal_timestamp() const {
  const PROTOBUF_NAMESPACE_ID::Timestamp* p = timestamp_;
  return p != nullptr ? *p : *reinterpret_cast<const PROTOBUF_NAMESPACE_ID::Timestamp*>(
      &PROTOBUF_NAMESPACE_ID::_Timestamp_default_instance_);
}
inline const PROTOBUF_NAMESPACE_ID::Timestamp& ErrorInfo::timestamp() const {
  // @@protoc_insertion_point(field_get:kentik.core.v202012alpha1.ErrorInfo.timestamp)
  return _internal_timestamp();
}
inline void ErrorInfo::unsafe_arena_set_allocated_timestamp(
    PROTOBUF_NAMESPACE_ID::Timestamp* timestamp) {
  if (GetArena() == nullptr) {
    delete reinterpret_cast<::PROTOBUF_NAMESPACE_ID::MessageLite*>(timestamp_);
  }
  timestamp_ = timestamp;
  if (timestamp) {
    
  } else {
    
  }
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:kentik.core.v202012alpha1.ErrorInfo.timestamp)
}
inline PROTOBUF_NAMESPACE_ID::Timestamp* ErrorInfo::release_timestamp() {
  auto temp = unsafe_arena_release_timestamp();
  if (GetArena() != nullptr) {
    temp = ::PROTOBUF_NAMESPACE_ID::internal::DuplicateIfNonNull(temp);
  }
  return temp;
}
inline PROTOBUF_NAMESPACE_ID::Timestamp* ErrorInfo::unsafe_arena_release_timestamp() {
  // @@protoc_insertion_point(field_release:kentik.core.v202012alpha1.ErrorInfo.timestamp)
  
  PROTOBUF_NAMESPACE_ID::Timestamp* temp = timestamp_;
  timestamp_ = nullptr;
  return temp;
}
inline PROTOBUF_NAMESPACE_ID::Timestamp* ErrorInfo::_internal_mutable_timestamp() {
  
  if (timestamp_ == nullptr) {
    auto* p = CreateMaybeMessage<PROTOBUF_NAMESPACE_ID::Timestamp>(GetArena());
    timestamp_ = p;
  }
  return timestamp_;
}
inline PROTOBUF_NAMESPACE_ID::Timestamp* ErrorInfo::mutable_timestamp() {
  // @@protoc_insertion_point(field_mutable:kentik.core.v202012alpha1.ErrorInfo.timestamp)
  return _internal_mutable_timestamp();
}
inline void ErrorInfo::set_allocated_timestamp(PROTOBUF_NAMESPACE_ID::Timestamp* timestamp) {
  ::PROTOBUF_NAMESPACE_ID::Arena* message_arena = GetArena();
  if (message_arena == nullptr) {
    delete reinterpret_cast< ::PROTOBUF_NAMESPACE_ID::MessageLite*>(timestamp_);
  }
  if (timestamp) {
    ::PROTOBUF_NAMESPACE_ID::Arena* submessage_arena =
      reinterpret_cast<::PROTOBUF_NAMESPACE_ID::MessageLite*>(timestamp)->GetArena();
    if (message_arena != submessage_arena) {
      timestamp = ::PROTOBUF_NAMESPACE_ID::internal::GetOwnedMessage(
          message_arena, timestamp, submessage_arena);
    }
    
  } else {
    
  }
  timestamp_ = timestamp;
  // @@protoc_insertion_point(field_set_allocated:kentik.core.v202012alpha1.ErrorInfo.timestamp)
}

// string documentation_link = 5[json_name = "documentationLink", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void ErrorInfo::clear_documentation_link() {
  documentation_link_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline const std::string& ErrorInfo::documentation_link() const {
  // @@protoc_insertion_point(field_get:kentik.core.v202012alpha1.ErrorInfo.documentation_link)
  return _internal_documentation_link();
}
inline void ErrorInfo::set_documentation_link(const std::string& value) {
  _internal_set_documentation_link(value);
  // @@protoc_insertion_point(field_set:kentik.core.v202012alpha1.ErrorInfo.documentation_link)
}
inline std::string* ErrorInfo::mutable_documentation_link() {
  // @@protoc_insertion_point(field_mutable:kentik.core.v202012alpha1.ErrorInfo.documentation_link)
  return _internal_mutable_documentation_link();
}
inline const std::string& ErrorInfo::_internal_documentation_link() const {
  return documentation_link_.Get();
}
inline void ErrorInfo::_internal_set_documentation_link(const std::string& value) {
  
  documentation_link_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), value, GetArena());
}
inline void ErrorInfo::set_documentation_link(std::string&& value) {
  
  documentation_link_.Set(
    &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::move(value), GetArena());
  // @@protoc_insertion_point(field_set_rvalue:kentik.core.v202012alpha1.ErrorInfo.documentation_link)
}
inline void ErrorInfo::set_documentation_link(const char* value) {
  GOOGLE_DCHECK(value != nullptr);
  
  documentation_link_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(value),
              GetArena());
  // @@protoc_insertion_point(field_set_char:kentik.core.v202012alpha1.ErrorInfo.documentation_link)
}
inline void ErrorInfo::set_documentation_link(const char* value,
    size_t size) {
  
  documentation_link_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(
      reinterpret_cast<const char*>(value), size), GetArena());
  // @@protoc_insertion_point(field_set_pointer:kentik.core.v202012alpha1.ErrorInfo.documentation_link)
}
inline std::string* ErrorInfo::_internal_mutable_documentation_link() {
  
  return documentation_link_.Mutable(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline std::string* ErrorInfo::release_documentation_link() {
  // @@protoc_insertion_point(field_release:kentik.core.v202012alpha1.ErrorInfo.documentation_link)
  return documentation_link_.Release(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline void ErrorInfo::set_allocated_documentation_link(std::string* documentation_link) {
  if (documentation_link != nullptr) {
    
  } else {
    
  }
  documentation_link_.SetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), documentation_link,
      GetArena());
  // @@protoc_insertion_point(field_set_allocated:kentik.core.v202012alpha1.ErrorInfo.documentation_link)
}
inline std::string* ErrorInfo::unsafe_arena_release_documentation_link() {
  // @@protoc_insertion_point(field_unsafe_arena_release:kentik.core.v202012alpha1.ErrorInfo.documentation_link)
  GOOGLE_DCHECK(GetArena() != nullptr);
  
  return documentation_link_.UnsafeArenaRelease(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      GetArena());
}
inline void ErrorInfo::unsafe_arena_set_allocated_documentation_link(
    std::string* documentation_link) {
  GOOGLE_DCHECK(GetArena() != nullptr);
  if (documentation_link != nullptr) {
    
  } else {
    
  }
  documentation_link_.UnsafeArenaSetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      documentation_link, GetArena());
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:kentik.core.v202012alpha1.ErrorInfo.documentation_link)
}

#ifdef __GNUC__
  #pragma GCC diagnostic pop
#endif  // __GNUC__

// @@protoc_insertion_point(namespace_scope)

}  // namespace v202012alpha1
}  // namespace core
}  // namespace kentik

// @@protoc_insertion_point(global_scope)

#include <google/protobuf/port_undef.inc>
#endif  // GOOGLE_PROTOBUF_INCLUDED_GOOGLE_PROTOBUF_INCLUDED_kentik_2fcore_2fv202012alpha1_2ferrors_2eproto
