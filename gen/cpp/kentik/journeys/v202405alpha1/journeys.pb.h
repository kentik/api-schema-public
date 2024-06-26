// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: kentik/journeys/v202405alpha1/journeys.proto

#ifndef GOOGLE_PROTOBUF_INCLUDED_kentik_2fjourneys_2fv202405alpha1_2fjourneys_2eproto
#define GOOGLE_PROTOBUF_INCLUDED_kentik_2fjourneys_2fv202405alpha1_2fjourneys_2eproto

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
#include "google/api/annotations.pb.h"
#include "google/api/client.pb.h"
#include "google/api/field_behavior.pb.h"
#include "protoc-gen-openapiv2/options/annotations.pb.h"
#include "kentik/core/v202303/annotations.pb.h"
// @@protoc_insertion_point(includes)
#include <google/protobuf/port_def.inc>
#define PROTOBUF_INTERNAL_EXPORT_kentik_2fjourneys_2fv202405alpha1_2fjourneys_2eproto
PROTOBUF_NAMESPACE_OPEN
namespace internal {
class AnyMetadata;
}  // namespace internal
PROTOBUF_NAMESPACE_CLOSE

// Internal implementation detail -- do not use these members.
struct TableStruct_kentik_2fjourneys_2fv202405alpha1_2fjourneys_2eproto {
  static const ::PROTOBUF_NAMESPACE_ID::internal::ParseTableField entries[]
    PROTOBUF_SECTION_VARIABLE(protodesc_cold);
  static const ::PROTOBUF_NAMESPACE_ID::internal::AuxillaryParseTableField aux[]
    PROTOBUF_SECTION_VARIABLE(protodesc_cold);
  static const ::PROTOBUF_NAMESPACE_ID::internal::ParseTable schema[2]
    PROTOBUF_SECTION_VARIABLE(protodesc_cold);
  static const ::PROTOBUF_NAMESPACE_ID::internal::FieldMetadata field_metadata[];
  static const ::PROTOBUF_NAMESPACE_ID::internal::SerializationTable serialization_table[];
  static const ::PROTOBUF_NAMESPACE_ID::uint32 offsets[];
};
extern const ::PROTOBUF_NAMESPACE_ID::internal::DescriptorTable descriptor_table_kentik_2fjourneys_2fv202405alpha1_2fjourneys_2eproto;
namespace kentik {
namespace journeys {
namespace v202405alpha1 {
class GetJourneysNlqRequest;
class GetJourneysNlqRequestDefaultTypeInternal;
extern GetJourneysNlqRequestDefaultTypeInternal _GetJourneysNlqRequest_default_instance_;
class GetJourneysNlqResponse;
class GetJourneysNlqResponseDefaultTypeInternal;
extern GetJourneysNlqResponseDefaultTypeInternal _GetJourneysNlqResponse_default_instance_;
}  // namespace v202405alpha1
}  // namespace journeys
}  // namespace kentik
PROTOBUF_NAMESPACE_OPEN
template<> ::kentik::journeys::v202405alpha1::GetJourneysNlqRequest* Arena::CreateMaybeMessage<::kentik::journeys::v202405alpha1::GetJourneysNlqRequest>(Arena*);
template<> ::kentik::journeys::v202405alpha1::GetJourneysNlqResponse* Arena::CreateMaybeMessage<::kentik::journeys::v202405alpha1::GetJourneysNlqResponse>(Arena*);
PROTOBUF_NAMESPACE_CLOSE
namespace kentik {
namespace journeys {
namespace v202405alpha1 {

enum ResultType : int {
  RESULT_TYPE_UNSPECIFIED = 0,
  RESULT_TYPE_ERROR = 1,
  RESULT_TYPE_DE_QUERY_OBJECT = 2,
  RESULT_TYPE_ME_QUERY_OBJECT = 3,
  RESULT_TYPE_KNOWLEDGE_BASE = 4,
  ResultType_INT_MIN_SENTINEL_DO_NOT_USE_ = std::numeric_limits<::PROTOBUF_NAMESPACE_ID::int32>::min(),
  ResultType_INT_MAX_SENTINEL_DO_NOT_USE_ = std::numeric_limits<::PROTOBUF_NAMESPACE_ID::int32>::max()
};
bool ResultType_IsValid(int value);
constexpr ResultType ResultType_MIN = RESULT_TYPE_UNSPECIFIED;
constexpr ResultType ResultType_MAX = RESULT_TYPE_KNOWLEDGE_BASE;
constexpr int ResultType_ARRAYSIZE = ResultType_MAX + 1;

const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* ResultType_descriptor();
template<typename T>
inline const std::string& ResultType_Name(T enum_t_value) {
  static_assert(::std::is_same<T, ResultType>::value ||
    ::std::is_integral<T>::value,
    "Incorrect type passed to function ResultType_Name.");
  return ::PROTOBUF_NAMESPACE_ID::internal::NameOfEnum(
    ResultType_descriptor(), enum_t_value);
}
inline bool ResultType_Parse(
    const std::string& name, ResultType* value) {
  return ::PROTOBUF_NAMESPACE_ID::internal::ParseNamedEnum<ResultType>(
    ResultType_descriptor(), name, value);
}
enum ResultFormat : int {
  RESULT_FORMAT_UNSPECIFIED = 0,
  RESULT_FORMAT_JSON = 1,
  RESULT_FORMAT_MARKDOWN = 2,
  RESULT_FORMAT_PLAIN_TEXT = 3,
  ResultFormat_INT_MIN_SENTINEL_DO_NOT_USE_ = std::numeric_limits<::PROTOBUF_NAMESPACE_ID::int32>::min(),
  ResultFormat_INT_MAX_SENTINEL_DO_NOT_USE_ = std::numeric_limits<::PROTOBUF_NAMESPACE_ID::int32>::max()
};
bool ResultFormat_IsValid(int value);
constexpr ResultFormat ResultFormat_MIN = RESULT_FORMAT_UNSPECIFIED;
constexpr ResultFormat ResultFormat_MAX = RESULT_FORMAT_PLAIN_TEXT;
constexpr int ResultFormat_ARRAYSIZE = ResultFormat_MAX + 1;

const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* ResultFormat_descriptor();
template<typename T>
inline const std::string& ResultFormat_Name(T enum_t_value) {
  static_assert(::std::is_same<T, ResultFormat>::value ||
    ::std::is_integral<T>::value,
    "Incorrect type passed to function ResultFormat_Name.");
  return ::PROTOBUF_NAMESPACE_ID::internal::NameOfEnum(
    ResultFormat_descriptor(), enum_t_value);
}
inline bool ResultFormat_Parse(
    const std::string& name, ResultFormat* value) {
  return ::PROTOBUF_NAMESPACE_ID::internal::ParseNamedEnum<ResultFormat>(
    ResultFormat_descriptor(), name, value);
}
// ===================================================================

class GetJourneysNlqRequest PROTOBUF_FINAL :
    public ::PROTOBUF_NAMESPACE_ID::Message /* @@protoc_insertion_point(class_definition:kentik.journeys.v202405alpha1.GetJourneysNlqRequest) */ {
 public:
  inline GetJourneysNlqRequest() : GetJourneysNlqRequest(nullptr) {};
  virtual ~GetJourneysNlqRequest();

  GetJourneysNlqRequest(const GetJourneysNlqRequest& from);
  GetJourneysNlqRequest(GetJourneysNlqRequest&& from) noexcept
    : GetJourneysNlqRequest() {
    *this = ::std::move(from);
  }

  inline GetJourneysNlqRequest& operator=(const GetJourneysNlqRequest& from) {
    CopyFrom(from);
    return *this;
  }
  inline GetJourneysNlqRequest& operator=(GetJourneysNlqRequest&& from) noexcept {
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
  static const GetJourneysNlqRequest& default_instance();

  static void InitAsDefaultInstance();  // FOR INTERNAL USE ONLY
  static inline const GetJourneysNlqRequest* internal_default_instance() {
    return reinterpret_cast<const GetJourneysNlqRequest*>(
               &_GetJourneysNlqRequest_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    0;

  friend void swap(GetJourneysNlqRequest& a, GetJourneysNlqRequest& b) {
    a.Swap(&b);
  }
  inline void Swap(GetJourneysNlqRequest* other) {
    if (other == this) return;
    if (GetArena() == other->GetArena()) {
      InternalSwap(other);
    } else {
      ::PROTOBUF_NAMESPACE_ID::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(GetJourneysNlqRequest* other) {
    if (other == this) return;
    GOOGLE_DCHECK(GetArena() == other->GetArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  inline GetJourneysNlqRequest* New() const final {
    return CreateMaybeMessage<GetJourneysNlqRequest>(nullptr);
  }

  GetJourneysNlqRequest* New(::PROTOBUF_NAMESPACE_ID::Arena* arena) const final {
    return CreateMaybeMessage<GetJourneysNlqRequest>(arena);
  }
  void CopyFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) final;
  void MergeFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) final;
  void CopyFrom(const GetJourneysNlqRequest& from);
  void MergeFrom(const GetJourneysNlqRequest& from);
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
  void InternalSwap(GetJourneysNlqRequest* other);
  friend class ::PROTOBUF_NAMESPACE_ID::internal::AnyMetadata;
  static ::PROTOBUF_NAMESPACE_ID::StringPiece FullMessageName() {
    return "kentik.journeys.v202405alpha1.GetJourneysNlqRequest";
  }
  protected:
  explicit GetJourneysNlqRequest(::PROTOBUF_NAMESPACE_ID::Arena* arena);
  private:
  static void ArenaDtor(void* object);
  inline void RegisterArenaDtor(::PROTOBUF_NAMESPACE_ID::Arena* arena);
  public:

  ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadata() const final;
  private:
  static ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadataStatic() {
    ::PROTOBUF_NAMESPACE_ID::internal::AssignDescriptors(&::descriptor_table_kentik_2fjourneys_2fv202405alpha1_2fjourneys_2eproto);
    return ::descriptor_table_kentik_2fjourneys_2fv202405alpha1_2fjourneys_2eproto.file_level_metadata[kIndexInFileMessages];
  }

  public:

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  enum : int {
    kPromptFieldNumber = 1,
  };
  // string prompt = 1[json_name = "prompt", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_prompt();
  const std::string& prompt() const;
  void set_prompt(const std::string& value);
  void set_prompt(std::string&& value);
  void set_prompt(const char* value);
  void set_prompt(const char* value, size_t size);
  std::string* mutable_prompt();
  std::string* release_prompt();
  void set_allocated_prompt(std::string* prompt);
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  std::string* unsafe_arena_release_prompt();
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  void unsafe_arena_set_allocated_prompt(
      std::string* prompt);
  private:
  const std::string& _internal_prompt() const;
  void _internal_set_prompt(const std::string& value);
  std::string* _internal_mutable_prompt();
  public:

  // @@protoc_insertion_point(class_scope:kentik.journeys.v202405alpha1.GetJourneysNlqRequest)
 private:
  class _Internal;

  template <typename T> friend class ::PROTOBUF_NAMESPACE_ID::Arena::InternalHelper;
  typedef void InternalArenaConstructable_;
  typedef void DestructorSkippable_;
  ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr prompt_;
  mutable ::PROTOBUF_NAMESPACE_ID::internal::CachedSize _cached_size_;
  friend struct ::TableStruct_kentik_2fjourneys_2fv202405alpha1_2fjourneys_2eproto;
};
// -------------------------------------------------------------------

class GetJourneysNlqResponse PROTOBUF_FINAL :
    public ::PROTOBUF_NAMESPACE_ID::Message /* @@protoc_insertion_point(class_definition:kentik.journeys.v202405alpha1.GetJourneysNlqResponse) */ {
 public:
  inline GetJourneysNlqResponse() : GetJourneysNlqResponse(nullptr) {};
  virtual ~GetJourneysNlqResponse();

  GetJourneysNlqResponse(const GetJourneysNlqResponse& from);
  GetJourneysNlqResponse(GetJourneysNlqResponse&& from) noexcept
    : GetJourneysNlqResponse() {
    *this = ::std::move(from);
  }

  inline GetJourneysNlqResponse& operator=(const GetJourneysNlqResponse& from) {
    CopyFrom(from);
    return *this;
  }
  inline GetJourneysNlqResponse& operator=(GetJourneysNlqResponse&& from) noexcept {
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
  static const GetJourneysNlqResponse& default_instance();

  static void InitAsDefaultInstance();  // FOR INTERNAL USE ONLY
  static inline const GetJourneysNlqResponse* internal_default_instance() {
    return reinterpret_cast<const GetJourneysNlqResponse*>(
               &_GetJourneysNlqResponse_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    1;

  friend void swap(GetJourneysNlqResponse& a, GetJourneysNlqResponse& b) {
    a.Swap(&b);
  }
  inline void Swap(GetJourneysNlqResponse* other) {
    if (other == this) return;
    if (GetArena() == other->GetArena()) {
      InternalSwap(other);
    } else {
      ::PROTOBUF_NAMESPACE_ID::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(GetJourneysNlqResponse* other) {
    if (other == this) return;
    GOOGLE_DCHECK(GetArena() == other->GetArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  inline GetJourneysNlqResponse* New() const final {
    return CreateMaybeMessage<GetJourneysNlqResponse>(nullptr);
  }

  GetJourneysNlqResponse* New(::PROTOBUF_NAMESPACE_ID::Arena* arena) const final {
    return CreateMaybeMessage<GetJourneysNlqResponse>(arena);
  }
  void CopyFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) final;
  void MergeFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) final;
  void CopyFrom(const GetJourneysNlqResponse& from);
  void MergeFrom(const GetJourneysNlqResponse& from);
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
  void InternalSwap(GetJourneysNlqResponse* other);
  friend class ::PROTOBUF_NAMESPACE_ID::internal::AnyMetadata;
  static ::PROTOBUF_NAMESPACE_ID::StringPiece FullMessageName() {
    return "kentik.journeys.v202405alpha1.GetJourneysNlqResponse";
  }
  protected:
  explicit GetJourneysNlqResponse(::PROTOBUF_NAMESPACE_ID::Arena* arena);
  private:
  static void ArenaDtor(void* object);
  inline void RegisterArenaDtor(::PROTOBUF_NAMESPACE_ID::Arena* arena);
  public:

  ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadata() const final;
  private:
  static ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadataStatic() {
    ::PROTOBUF_NAMESPACE_ID::internal::AssignDescriptors(&::descriptor_table_kentik_2fjourneys_2fv202405alpha1_2fjourneys_2eproto);
    return ::descriptor_table_kentik_2fjourneys_2fv202405alpha1_2fjourneys_2eproto.file_level_metadata[kIndexInFileMessages];
  }

  public:

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  enum : int {
    kResultFieldNumber = 1,
    kResultTypeFieldNumber = 2,
    kResultFormatFieldNumber = 3,
  };
  // string result = 1[json_name = "result"];
  void clear_result();
  const std::string& result() const;
  void set_result(const std::string& value);
  void set_result(std::string&& value);
  void set_result(const char* value);
  void set_result(const char* value, size_t size);
  std::string* mutable_result();
  std::string* release_result();
  void set_allocated_result(std::string* result);
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  std::string* unsafe_arena_release_result();
  GOOGLE_PROTOBUF_RUNTIME_DEPRECATED("The unsafe_arena_ accessors for"
  "    string fields are deprecated and will be removed in a"
  "    future release.")
  void unsafe_arena_set_allocated_result(
      std::string* result);
  private:
  const std::string& _internal_result() const;
  void _internal_set_result(const std::string& value);
  std::string* _internal_mutable_result();
  public:

  // .kentik.journeys.v202405alpha1.ResultType result_type = 2[json_name = "resultType"];
  void clear_result_type();
  ::kentik::journeys::v202405alpha1::ResultType result_type() const;
  void set_result_type(::kentik::journeys::v202405alpha1::ResultType value);
  private:
  ::kentik::journeys::v202405alpha1::ResultType _internal_result_type() const;
  void _internal_set_result_type(::kentik::journeys::v202405alpha1::ResultType value);
  public:

  // .kentik.journeys.v202405alpha1.ResultFormat result_format = 3[json_name = "resultFormat"];
  void clear_result_format();
  ::kentik::journeys::v202405alpha1::ResultFormat result_format() const;
  void set_result_format(::kentik::journeys::v202405alpha1::ResultFormat value);
  private:
  ::kentik::journeys::v202405alpha1::ResultFormat _internal_result_format() const;
  void _internal_set_result_format(::kentik::journeys::v202405alpha1::ResultFormat value);
  public:

  // @@protoc_insertion_point(class_scope:kentik.journeys.v202405alpha1.GetJourneysNlqResponse)
 private:
  class _Internal;

  template <typename T> friend class ::PROTOBUF_NAMESPACE_ID::Arena::InternalHelper;
  typedef void InternalArenaConstructable_;
  typedef void DestructorSkippable_;
  ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr result_;
  int result_type_;
  int result_format_;
  mutable ::PROTOBUF_NAMESPACE_ID::internal::CachedSize _cached_size_;
  friend struct ::TableStruct_kentik_2fjourneys_2fv202405alpha1_2fjourneys_2eproto;
};
// ===================================================================


// ===================================================================

#ifdef __GNUC__
  #pragma GCC diagnostic push
  #pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif  // __GNUC__
// GetJourneysNlqRequest

// string prompt = 1[json_name = "prompt", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void GetJourneysNlqRequest::clear_prompt() {
  prompt_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline const std::string& GetJourneysNlqRequest::prompt() const {
  // @@protoc_insertion_point(field_get:kentik.journeys.v202405alpha1.GetJourneysNlqRequest.prompt)
  return _internal_prompt();
}
inline void GetJourneysNlqRequest::set_prompt(const std::string& value) {
  _internal_set_prompt(value);
  // @@protoc_insertion_point(field_set:kentik.journeys.v202405alpha1.GetJourneysNlqRequest.prompt)
}
inline std::string* GetJourneysNlqRequest::mutable_prompt() {
  // @@protoc_insertion_point(field_mutable:kentik.journeys.v202405alpha1.GetJourneysNlqRequest.prompt)
  return _internal_mutable_prompt();
}
inline const std::string& GetJourneysNlqRequest::_internal_prompt() const {
  return prompt_.Get();
}
inline void GetJourneysNlqRequest::_internal_set_prompt(const std::string& value) {
  
  prompt_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), value, GetArena());
}
inline void GetJourneysNlqRequest::set_prompt(std::string&& value) {
  
  prompt_.Set(
    &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::move(value), GetArena());
  // @@protoc_insertion_point(field_set_rvalue:kentik.journeys.v202405alpha1.GetJourneysNlqRequest.prompt)
}
inline void GetJourneysNlqRequest::set_prompt(const char* value) {
  GOOGLE_DCHECK(value != nullptr);
  
  prompt_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(value),
              GetArena());
  // @@protoc_insertion_point(field_set_char:kentik.journeys.v202405alpha1.GetJourneysNlqRequest.prompt)
}
inline void GetJourneysNlqRequest::set_prompt(const char* value,
    size_t size) {
  
  prompt_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(
      reinterpret_cast<const char*>(value), size), GetArena());
  // @@protoc_insertion_point(field_set_pointer:kentik.journeys.v202405alpha1.GetJourneysNlqRequest.prompt)
}
inline std::string* GetJourneysNlqRequest::_internal_mutable_prompt() {
  
  return prompt_.Mutable(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline std::string* GetJourneysNlqRequest::release_prompt() {
  // @@protoc_insertion_point(field_release:kentik.journeys.v202405alpha1.GetJourneysNlqRequest.prompt)
  return prompt_.Release(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline void GetJourneysNlqRequest::set_allocated_prompt(std::string* prompt) {
  if (prompt != nullptr) {
    
  } else {
    
  }
  prompt_.SetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), prompt,
      GetArena());
  // @@protoc_insertion_point(field_set_allocated:kentik.journeys.v202405alpha1.GetJourneysNlqRequest.prompt)
}
inline std::string* GetJourneysNlqRequest::unsafe_arena_release_prompt() {
  // @@protoc_insertion_point(field_unsafe_arena_release:kentik.journeys.v202405alpha1.GetJourneysNlqRequest.prompt)
  GOOGLE_DCHECK(GetArena() != nullptr);
  
  return prompt_.UnsafeArenaRelease(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      GetArena());
}
inline void GetJourneysNlqRequest::unsafe_arena_set_allocated_prompt(
    std::string* prompt) {
  GOOGLE_DCHECK(GetArena() != nullptr);
  if (prompt != nullptr) {
    
  } else {
    
  }
  prompt_.UnsafeArenaSetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      prompt, GetArena());
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:kentik.journeys.v202405alpha1.GetJourneysNlqRequest.prompt)
}

// -------------------------------------------------------------------

// GetJourneysNlqResponse

// string result = 1[json_name = "result"];
inline void GetJourneysNlqResponse::clear_result() {
  result_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline const std::string& GetJourneysNlqResponse::result() const {
  // @@protoc_insertion_point(field_get:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result)
  return _internal_result();
}
inline void GetJourneysNlqResponse::set_result(const std::string& value) {
  _internal_set_result(value);
  // @@protoc_insertion_point(field_set:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result)
}
inline std::string* GetJourneysNlqResponse::mutable_result() {
  // @@protoc_insertion_point(field_mutable:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result)
  return _internal_mutable_result();
}
inline const std::string& GetJourneysNlqResponse::_internal_result() const {
  return result_.Get();
}
inline void GetJourneysNlqResponse::_internal_set_result(const std::string& value) {
  
  result_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), value, GetArena());
}
inline void GetJourneysNlqResponse::set_result(std::string&& value) {
  
  result_.Set(
    &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::move(value), GetArena());
  // @@protoc_insertion_point(field_set_rvalue:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result)
}
inline void GetJourneysNlqResponse::set_result(const char* value) {
  GOOGLE_DCHECK(value != nullptr);
  
  result_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(value),
              GetArena());
  // @@protoc_insertion_point(field_set_char:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result)
}
inline void GetJourneysNlqResponse::set_result(const char* value,
    size_t size) {
  
  result_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), ::std::string(
      reinterpret_cast<const char*>(value), size), GetArena());
  // @@protoc_insertion_point(field_set_pointer:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result)
}
inline std::string* GetJourneysNlqResponse::_internal_mutable_result() {
  
  return result_.Mutable(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline std::string* GetJourneysNlqResponse::release_result() {
  // @@protoc_insertion_point(field_release:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result)
  return result_.Release(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}
inline void GetJourneysNlqResponse::set_allocated_result(std::string* result) {
  if (result != nullptr) {
    
  } else {
    
  }
  result_.SetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), result,
      GetArena());
  // @@protoc_insertion_point(field_set_allocated:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result)
}
inline std::string* GetJourneysNlqResponse::unsafe_arena_release_result() {
  // @@protoc_insertion_point(field_unsafe_arena_release:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result)
  GOOGLE_DCHECK(GetArena() != nullptr);
  
  return result_.UnsafeArenaRelease(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      GetArena());
}
inline void GetJourneysNlqResponse::unsafe_arena_set_allocated_result(
    std::string* result) {
  GOOGLE_DCHECK(GetArena() != nullptr);
  if (result != nullptr) {
    
  } else {
    
  }
  result_.UnsafeArenaSetAllocated(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(),
      result, GetArena());
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result)
}

// .kentik.journeys.v202405alpha1.ResultType result_type = 2[json_name = "resultType"];
inline void GetJourneysNlqResponse::clear_result_type() {
  result_type_ = 0;
}
inline ::kentik::journeys::v202405alpha1::ResultType GetJourneysNlqResponse::_internal_result_type() const {
  return static_cast< ::kentik::journeys::v202405alpha1::ResultType >(result_type_);
}
inline ::kentik::journeys::v202405alpha1::ResultType GetJourneysNlqResponse::result_type() const {
  // @@protoc_insertion_point(field_get:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result_type)
  return _internal_result_type();
}
inline void GetJourneysNlqResponse::_internal_set_result_type(::kentik::journeys::v202405alpha1::ResultType value) {
  
  result_type_ = value;
}
inline void GetJourneysNlqResponse::set_result_type(::kentik::journeys::v202405alpha1::ResultType value) {
  _internal_set_result_type(value);
  // @@protoc_insertion_point(field_set:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result_type)
}

// .kentik.journeys.v202405alpha1.ResultFormat result_format = 3[json_name = "resultFormat"];
inline void GetJourneysNlqResponse::clear_result_format() {
  result_format_ = 0;
}
inline ::kentik::journeys::v202405alpha1::ResultFormat GetJourneysNlqResponse::_internal_result_format() const {
  return static_cast< ::kentik::journeys::v202405alpha1::ResultFormat >(result_format_);
}
inline ::kentik::journeys::v202405alpha1::ResultFormat GetJourneysNlqResponse::result_format() const {
  // @@protoc_insertion_point(field_get:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result_format)
  return _internal_result_format();
}
inline void GetJourneysNlqResponse::_internal_set_result_format(::kentik::journeys::v202405alpha1::ResultFormat value) {
  
  result_format_ = value;
}
inline void GetJourneysNlqResponse::set_result_format(::kentik::journeys::v202405alpha1::ResultFormat value) {
  _internal_set_result_format(value);
  // @@protoc_insertion_point(field_set:kentik.journeys.v202405alpha1.GetJourneysNlqResponse.result_format)
}

#ifdef __GNUC__
  #pragma GCC diagnostic pop
#endif  // __GNUC__
// -------------------------------------------------------------------


// @@protoc_insertion_point(namespace_scope)

}  // namespace v202405alpha1
}  // namespace journeys
}  // namespace kentik

PROTOBUF_NAMESPACE_OPEN

template <> struct is_proto_enum< ::kentik::journeys::v202405alpha1::ResultType> : ::std::true_type {};
template <>
inline const EnumDescriptor* GetEnumDescriptor< ::kentik::journeys::v202405alpha1::ResultType>() {
  return ::kentik::journeys::v202405alpha1::ResultType_descriptor();
}
template <> struct is_proto_enum< ::kentik::journeys::v202405alpha1::ResultFormat> : ::std::true_type {};
template <>
inline const EnumDescriptor* GetEnumDescriptor< ::kentik::journeys::v202405alpha1::ResultFormat>() {
  return ::kentik::journeys::v202405alpha1::ResultFormat_descriptor();
}

PROTOBUF_NAMESPACE_CLOSE

// @@protoc_insertion_point(global_scope)

#include <google/protobuf/port_undef.inc>
#endif  // GOOGLE_PROTOBUF_INCLUDED_GOOGLE_PROTOBUF_INCLUDED_kentik_2fjourneys_2fv202405alpha1_2fjourneys_2eproto
