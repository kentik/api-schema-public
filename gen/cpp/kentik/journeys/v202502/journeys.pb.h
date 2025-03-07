// Generated by the protocol buffer compiler.  DO NOT EDIT!
// NO CHECKED-IN PROTOBUF GENCODE
// source: kentik/journeys/v202502/journeys.proto
// Protobuf C++ Version: 5.29.3

#ifndef kentik_2fjourneys_2fv202502_2fjourneys_2eproto_2epb_2eh
#define kentik_2fjourneys_2fv202502_2fjourneys_2eproto_2epb_2eh

#include <limits>
#include <string>
#include <type_traits>
#include <utility>

#include "google/protobuf/runtime_version.h"
#if PROTOBUF_VERSION != 5029003
#error "Protobuf C++ gencode is built with an incompatible version of"
#error "Protobuf C++ headers/runtime. See"
#error "https://protobuf.dev/support/cross-version-runtime-guarantee/#cpp"
#endif
#include "google/protobuf/io/coded_stream.h"
#include "google/protobuf/arena.h"
#include "google/protobuf/arenastring.h"
#include "google/protobuf/generated_message_tctable_decl.h"
#include "google/protobuf/generated_message_util.h"
#include "google/protobuf/metadata_lite.h"
#include "google/protobuf/generated_message_reflection.h"
#include "google/protobuf/message.h"
#include "google/protobuf/message_lite.h"
#include "google/protobuf/repeated_field.h"  // IWYU pragma: export
#include "google/protobuf/extension_set.h"  // IWYU pragma: export
#include "google/protobuf/unknown_field_set.h"
#include "google/api/annotations.pb.h"
#include "google/api/client.pb.h"
#include "google/api/field_behavior.pb.h"
#include "protoc-gen-openapiv2/options/annotations.pb.h"
#include "kentik/core/v202303/annotations.pb.h"
// @@protoc_insertion_point(includes)

// Must be included last.
#include "google/protobuf/port_def.inc"

#define PROTOBUF_INTERNAL_EXPORT_kentik_2fjourneys_2fv202502_2fjourneys_2eproto

namespace google {
namespace protobuf {
namespace internal {
template <typename T>
::absl::string_view GetAnyMessageName();
}  // namespace internal
}  // namespace protobuf
}  // namespace google

// Internal implementation detail -- do not use these members.
struct TableStruct_kentik_2fjourneys_2fv202502_2fjourneys_2eproto {
  static const ::uint32_t offsets[];
};
extern const ::google::protobuf::internal::DescriptorTable
    descriptor_table_kentik_2fjourneys_2fv202502_2fjourneys_2eproto;
namespace kentik {
namespace journeys {
namespace v202502 {
class JourneysRequest;
struct JourneysRequestDefaultTypeInternal;
extern JourneysRequestDefaultTypeInternal _JourneysRequest_default_instance_;
class JourneysResponse;
struct JourneysResponseDefaultTypeInternal;
extern JourneysResponseDefaultTypeInternal _JourneysResponse_default_instance_;
}  // namespace v202502
}  // namespace journeys
}  // namespace kentik
namespace google {
namespace protobuf {
}  // namespace protobuf
}  // namespace google

namespace kentik {
namespace journeys {
namespace v202502 {

// ===================================================================


// -------------------------------------------------------------------

class JourneysResponse final : public ::google::protobuf::Message
/* @@protoc_insertion_point(class_definition:kentik.journeys.v202502.JourneysResponse) */ {
 public:
  inline JourneysResponse() : JourneysResponse(nullptr) {}
  ~JourneysResponse() PROTOBUF_FINAL;

#if defined(PROTOBUF_CUSTOM_VTABLE)
  void operator delete(JourneysResponse* msg, std::destroying_delete_t) {
    SharedDtor(*msg);
    ::google::protobuf::internal::SizedDelete(msg, sizeof(JourneysResponse));
  }
#endif

  template <typename = void>
  explicit PROTOBUF_CONSTEXPR JourneysResponse(
      ::google::protobuf::internal::ConstantInitialized);

  inline JourneysResponse(const JourneysResponse& from) : JourneysResponse(nullptr, from) {}
  inline JourneysResponse(JourneysResponse&& from) noexcept
      : JourneysResponse(nullptr, std::move(from)) {}
  inline JourneysResponse& operator=(const JourneysResponse& from) {
    CopyFrom(from);
    return *this;
  }
  inline JourneysResponse& operator=(JourneysResponse&& from) noexcept {
    if (this == &from) return *this;
    if (::google::protobuf::internal::CanMoveWithInternalSwap(GetArena(), from.GetArena())) {
      InternalSwap(&from);
    } else {
      CopyFrom(from);
    }
    return *this;
  }

  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const
      ABSL_ATTRIBUTE_LIFETIME_BOUND {
    return _internal_metadata_.unknown_fields<::google::protobuf::UnknownFieldSet>(::google::protobuf::UnknownFieldSet::default_instance);
  }
  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields()
      ABSL_ATTRIBUTE_LIFETIME_BOUND {
    return _internal_metadata_.mutable_unknown_fields<::google::protobuf::UnknownFieldSet>();
  }

  static const ::google::protobuf::Descriptor* descriptor() {
    return GetDescriptor();
  }
  static const ::google::protobuf::Descriptor* GetDescriptor() {
    return default_instance().GetMetadata().descriptor;
  }
  static const ::google::protobuf::Reflection* GetReflection() {
    return default_instance().GetMetadata().reflection;
  }
  static const JourneysResponse& default_instance() {
    return *internal_default_instance();
  }
  static inline const JourneysResponse* internal_default_instance() {
    return reinterpret_cast<const JourneysResponse*>(
        &_JourneysResponse_default_instance_);
  }
  static constexpr int kIndexInFileMessages = 1;
  friend void swap(JourneysResponse& a, JourneysResponse& b) { a.Swap(&b); }
  inline void Swap(JourneysResponse* other) {
    if (other == this) return;
    if (::google::protobuf::internal::CanUseInternalSwap(GetArena(), other->GetArena())) {
      InternalSwap(other);
    } else {
      ::google::protobuf::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(JourneysResponse* other) {
    if (other == this) return;
    ABSL_DCHECK(GetArena() == other->GetArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  JourneysResponse* New(::google::protobuf::Arena* arena = nullptr) const {
    return ::google::protobuf::Message::DefaultConstruct<JourneysResponse>(arena);
  }
  using ::google::protobuf::Message::CopyFrom;
  void CopyFrom(const JourneysResponse& from);
  using ::google::protobuf::Message::MergeFrom;
  void MergeFrom(const JourneysResponse& from) { JourneysResponse::MergeImpl(*this, from); }

  private:
  static void MergeImpl(
      ::google::protobuf::MessageLite& to_msg,
      const ::google::protobuf::MessageLite& from_msg);

  public:
  bool IsInitialized() const {
    return true;
  }
  ABSL_ATTRIBUTE_REINITIALIZES void Clear() PROTOBUF_FINAL;
  #if defined(PROTOBUF_CUSTOM_VTABLE)
  private:
  static ::size_t ByteSizeLong(const ::google::protobuf::MessageLite& msg);
  static ::uint8_t* _InternalSerialize(
      const MessageLite& msg, ::uint8_t* target,
      ::google::protobuf::io::EpsCopyOutputStream* stream);

  public:
  ::size_t ByteSizeLong() const { return ByteSizeLong(*this); }
  ::uint8_t* _InternalSerialize(
      ::uint8_t* target,
      ::google::protobuf::io::EpsCopyOutputStream* stream) const {
    return _InternalSerialize(*this, target, stream);
  }
  #else   // PROTOBUF_CUSTOM_VTABLE
  ::size_t ByteSizeLong() const final;
  ::uint8_t* _InternalSerialize(
      ::uint8_t* target,
      ::google::protobuf::io::EpsCopyOutputStream* stream) const final;
  #endif  // PROTOBUF_CUSTOM_VTABLE
  int GetCachedSize() const { return _impl_._cached_size_.Get(); }

  private:
  void SharedCtor(::google::protobuf::Arena* arena);
  static void SharedDtor(MessageLite& self);
  void InternalSwap(JourneysResponse* other);
 private:
  template <typename T>
  friend ::absl::string_view(
      ::google::protobuf::internal::GetAnyMessageName)();
  static ::absl::string_view FullMessageName() { return "kentik.journeys.v202502.JourneysResponse"; }

 protected:
  explicit JourneysResponse(::google::protobuf::Arena* arena);
  JourneysResponse(::google::protobuf::Arena* arena, const JourneysResponse& from);
  JourneysResponse(::google::protobuf::Arena* arena, JourneysResponse&& from) noexcept
      : JourneysResponse(arena) {
    *this = ::std::move(from);
  }
  const ::google::protobuf::internal::ClassData* GetClassData() const PROTOBUF_FINAL;
  static void* PlacementNew_(const void*, void* mem,
                             ::google::protobuf::Arena* arena);
  static constexpr auto InternalNewImpl_();
  static const ::google::protobuf::internal::ClassDataFull _class_data_;

 public:
  ::google::protobuf::Metadata GetMetadata() const;
  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------
  enum : int {
    kSummaryFieldNumber = 1,
    kDataFieldNumber = 2,
  };
  // string summary = 1 [json_name = "summary"];
  void clear_summary() ;
  const std::string& summary() const;
  template <typename Arg_ = const std::string&, typename... Args_>
  void set_summary(Arg_&& arg, Args_... args);
  std::string* mutable_summary();
  PROTOBUF_NODISCARD std::string* release_summary();
  void set_allocated_summary(std::string* value);

  private:
  const std::string& _internal_summary() const;
  inline PROTOBUF_ALWAYS_INLINE void _internal_set_summary(
      const std::string& value);
  std::string* _internal_mutable_summary();

  public:
  // optional string data = 2 [json_name = "data"];
  bool has_data() const;
  void clear_data() ;
  const std::string& data() const;
  template <typename Arg_ = const std::string&, typename... Args_>
  void set_data(Arg_&& arg, Args_... args);
  std::string* mutable_data();
  PROTOBUF_NODISCARD std::string* release_data();
  void set_allocated_data(std::string* value);

  private:
  const std::string& _internal_data() const;
  inline PROTOBUF_ALWAYS_INLINE void _internal_set_data(
      const std::string& value);
  std::string* _internal_mutable_data();

  public:
  // @@protoc_insertion_point(class_scope:kentik.journeys.v202502.JourneysResponse)
 private:
  class _Internal;
  friend class ::google::protobuf::internal::TcParser;
  static const ::google::protobuf::internal::TcParseTable<
      1, 2, 0,
      60, 2>
      _table_;

  friend class ::google::protobuf::MessageLite;
  friend class ::google::protobuf::Arena;
  template <typename T>
  friend class ::google::protobuf::Arena::InternalHelper;
  using InternalArenaConstructable_ = void;
  using DestructorSkippable_ = void;
  struct Impl_ {
    inline explicit constexpr Impl_(
        ::google::protobuf::internal::ConstantInitialized) noexcept;
    inline explicit Impl_(::google::protobuf::internal::InternalVisibility visibility,
                          ::google::protobuf::Arena* arena);
    inline explicit Impl_(::google::protobuf::internal::InternalVisibility visibility,
                          ::google::protobuf::Arena* arena, const Impl_& from,
                          const JourneysResponse& from_msg);
    ::google::protobuf::internal::HasBits<1> _has_bits_;
    ::google::protobuf::internal::CachedSize _cached_size_;
    ::google::protobuf::internal::ArenaStringPtr summary_;
    ::google::protobuf::internal::ArenaStringPtr data_;
    PROTOBUF_TSAN_DECLARE_MEMBER
  };
  union { Impl_ _impl_; };
  friend struct ::TableStruct_kentik_2fjourneys_2fv202502_2fjourneys_2eproto;
};
// -------------------------------------------------------------------

class JourneysRequest final : public ::google::protobuf::Message
/* @@protoc_insertion_point(class_definition:kentik.journeys.v202502.JourneysRequest) */ {
 public:
  inline JourneysRequest() : JourneysRequest(nullptr) {}
  ~JourneysRequest() PROTOBUF_FINAL;

#if defined(PROTOBUF_CUSTOM_VTABLE)
  void operator delete(JourneysRequest* msg, std::destroying_delete_t) {
    SharedDtor(*msg);
    ::google::protobuf::internal::SizedDelete(msg, sizeof(JourneysRequest));
  }
#endif

  template <typename = void>
  explicit PROTOBUF_CONSTEXPR JourneysRequest(
      ::google::protobuf::internal::ConstantInitialized);

  inline JourneysRequest(const JourneysRequest& from) : JourneysRequest(nullptr, from) {}
  inline JourneysRequest(JourneysRequest&& from) noexcept
      : JourneysRequest(nullptr, std::move(from)) {}
  inline JourneysRequest& operator=(const JourneysRequest& from) {
    CopyFrom(from);
    return *this;
  }
  inline JourneysRequest& operator=(JourneysRequest&& from) noexcept {
    if (this == &from) return *this;
    if (::google::protobuf::internal::CanMoveWithInternalSwap(GetArena(), from.GetArena())) {
      InternalSwap(&from);
    } else {
      CopyFrom(from);
    }
    return *this;
  }

  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const
      ABSL_ATTRIBUTE_LIFETIME_BOUND {
    return _internal_metadata_.unknown_fields<::google::protobuf::UnknownFieldSet>(::google::protobuf::UnknownFieldSet::default_instance);
  }
  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields()
      ABSL_ATTRIBUTE_LIFETIME_BOUND {
    return _internal_metadata_.mutable_unknown_fields<::google::protobuf::UnknownFieldSet>();
  }

  static const ::google::protobuf::Descriptor* descriptor() {
    return GetDescriptor();
  }
  static const ::google::protobuf::Descriptor* GetDescriptor() {
    return default_instance().GetMetadata().descriptor;
  }
  static const ::google::protobuf::Reflection* GetReflection() {
    return default_instance().GetMetadata().reflection;
  }
  static const JourneysRequest& default_instance() {
    return *internal_default_instance();
  }
  static inline const JourneysRequest* internal_default_instance() {
    return reinterpret_cast<const JourneysRequest*>(
        &_JourneysRequest_default_instance_);
  }
  static constexpr int kIndexInFileMessages = 0;
  friend void swap(JourneysRequest& a, JourneysRequest& b) { a.Swap(&b); }
  inline void Swap(JourneysRequest* other) {
    if (other == this) return;
    if (::google::protobuf::internal::CanUseInternalSwap(GetArena(), other->GetArena())) {
      InternalSwap(other);
    } else {
      ::google::protobuf::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(JourneysRequest* other) {
    if (other == this) return;
    ABSL_DCHECK(GetArena() == other->GetArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  JourneysRequest* New(::google::protobuf::Arena* arena = nullptr) const {
    return ::google::protobuf::Message::DefaultConstruct<JourneysRequest>(arena);
  }
  using ::google::protobuf::Message::CopyFrom;
  void CopyFrom(const JourneysRequest& from);
  using ::google::protobuf::Message::MergeFrom;
  void MergeFrom(const JourneysRequest& from) { JourneysRequest::MergeImpl(*this, from); }

  private:
  static void MergeImpl(
      ::google::protobuf::MessageLite& to_msg,
      const ::google::protobuf::MessageLite& from_msg);

  public:
  bool IsInitialized() const {
    return true;
  }
  ABSL_ATTRIBUTE_REINITIALIZES void Clear() PROTOBUF_FINAL;
  #if defined(PROTOBUF_CUSTOM_VTABLE)
  private:
  static ::size_t ByteSizeLong(const ::google::protobuf::MessageLite& msg);
  static ::uint8_t* _InternalSerialize(
      const MessageLite& msg, ::uint8_t* target,
      ::google::protobuf::io::EpsCopyOutputStream* stream);

  public:
  ::size_t ByteSizeLong() const { return ByteSizeLong(*this); }
  ::uint8_t* _InternalSerialize(
      ::uint8_t* target,
      ::google::protobuf::io::EpsCopyOutputStream* stream) const {
    return _InternalSerialize(*this, target, stream);
  }
  #else   // PROTOBUF_CUSTOM_VTABLE
  ::size_t ByteSizeLong() const final;
  ::uint8_t* _InternalSerialize(
      ::uint8_t* target,
      ::google::protobuf::io::EpsCopyOutputStream* stream) const final;
  #endif  // PROTOBUF_CUSTOM_VTABLE
  int GetCachedSize() const { return _impl_._cached_size_.Get(); }

  private:
  void SharedCtor(::google::protobuf::Arena* arena);
  static void SharedDtor(MessageLite& self);
  void InternalSwap(JourneysRequest* other);
 private:
  template <typename T>
  friend ::absl::string_view(
      ::google::protobuf::internal::GetAnyMessageName)();
  static ::absl::string_view FullMessageName() { return "kentik.journeys.v202502.JourneysRequest"; }

 protected:
  explicit JourneysRequest(::google::protobuf::Arena* arena);
  JourneysRequest(::google::protobuf::Arena* arena, const JourneysRequest& from);
  JourneysRequest(::google::protobuf::Arena* arena, JourneysRequest&& from) noexcept
      : JourneysRequest(arena) {
    *this = ::std::move(from);
  }
  const ::google::protobuf::internal::ClassData* GetClassData() const PROTOBUF_FINAL;
  static void* PlacementNew_(const void*, void* mem,
                             ::google::protobuf::Arena* arena);
  static constexpr auto InternalNewImpl_();
  static const ::google::protobuf::internal::ClassDataFull _class_data_;

 public:
  ::google::protobuf::Metadata GetMetadata() const;
  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------
  enum : int {
    kPromptFieldNumber = 1,
  };
  // string prompt = 1 [json_name = "prompt", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_prompt() ;
  const std::string& prompt() const;
  template <typename Arg_ = const std::string&, typename... Args_>
  void set_prompt(Arg_&& arg, Args_... args);
  std::string* mutable_prompt();
  PROTOBUF_NODISCARD std::string* release_prompt();
  void set_allocated_prompt(std::string* value);

  private:
  const std::string& _internal_prompt() const;
  inline PROTOBUF_ALWAYS_INLINE void _internal_set_prompt(
      const std::string& value);
  std::string* _internal_mutable_prompt();

  public:
  // @@protoc_insertion_point(class_scope:kentik.journeys.v202502.JourneysRequest)
 private:
  class _Internal;
  friend class ::google::protobuf::internal::TcParser;
  static const ::google::protobuf::internal::TcParseTable<
      0, 1, 0,
      54, 2>
      _table_;

  friend class ::google::protobuf::MessageLite;
  friend class ::google::protobuf::Arena;
  template <typename T>
  friend class ::google::protobuf::Arena::InternalHelper;
  using InternalArenaConstructable_ = void;
  using DestructorSkippable_ = void;
  struct Impl_ {
    inline explicit constexpr Impl_(
        ::google::protobuf::internal::ConstantInitialized) noexcept;
    inline explicit Impl_(::google::protobuf::internal::InternalVisibility visibility,
                          ::google::protobuf::Arena* arena);
    inline explicit Impl_(::google::protobuf::internal::InternalVisibility visibility,
                          ::google::protobuf::Arena* arena, const Impl_& from,
                          const JourneysRequest& from_msg);
    ::google::protobuf::internal::ArenaStringPtr prompt_;
    ::google::protobuf::internal::CachedSize _cached_size_;
    PROTOBUF_TSAN_DECLARE_MEMBER
  };
  union { Impl_ _impl_; };
  friend struct ::TableStruct_kentik_2fjourneys_2fv202502_2fjourneys_2eproto;
};

// ===================================================================




// ===================================================================


#ifdef __GNUC__
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif  // __GNUC__
// -------------------------------------------------------------------

// JourneysRequest

// string prompt = 1 [json_name = "prompt", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void JourneysRequest::clear_prompt() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.prompt_.ClearToEmpty();
}
inline const std::string& JourneysRequest::prompt() const
    ABSL_ATTRIBUTE_LIFETIME_BOUND {
  // @@protoc_insertion_point(field_get:kentik.journeys.v202502.JourneysRequest.prompt)
  return _internal_prompt();
}
template <typename Arg_, typename... Args_>
inline PROTOBUF_ALWAYS_INLINE void JourneysRequest::set_prompt(Arg_&& arg,
                                                     Args_... args) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.prompt_.Set(static_cast<Arg_&&>(arg), args..., GetArena());
  // @@protoc_insertion_point(field_set:kentik.journeys.v202502.JourneysRequest.prompt)
}
inline std::string* JourneysRequest::mutable_prompt() ABSL_ATTRIBUTE_LIFETIME_BOUND {
  std::string* _s = _internal_mutable_prompt();
  // @@protoc_insertion_point(field_mutable:kentik.journeys.v202502.JourneysRequest.prompt)
  return _s;
}
inline const std::string& JourneysRequest::_internal_prompt() const {
  ::google::protobuf::internal::TSanRead(&_impl_);
  return _impl_.prompt_.Get();
}
inline void JourneysRequest::_internal_set_prompt(const std::string& value) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.prompt_.Set(value, GetArena());
}
inline std::string* JourneysRequest::_internal_mutable_prompt() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  return _impl_.prompt_.Mutable( GetArena());
}
inline std::string* JourneysRequest::release_prompt() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  // @@protoc_insertion_point(field_release:kentik.journeys.v202502.JourneysRequest.prompt)
  return _impl_.prompt_.Release();
}
inline void JourneysRequest::set_allocated_prompt(std::string* value) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.prompt_.SetAllocated(value, GetArena());
  if (::google::protobuf::internal::DebugHardenForceCopyDefaultString() && _impl_.prompt_.IsDefault()) {
    _impl_.prompt_.Set("", GetArena());
  }
  // @@protoc_insertion_point(field_set_allocated:kentik.journeys.v202502.JourneysRequest.prompt)
}

// -------------------------------------------------------------------

// JourneysResponse

// string summary = 1 [json_name = "summary"];
inline void JourneysResponse::clear_summary() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.summary_.ClearToEmpty();
}
inline const std::string& JourneysResponse::summary() const
    ABSL_ATTRIBUTE_LIFETIME_BOUND {
  // @@protoc_insertion_point(field_get:kentik.journeys.v202502.JourneysResponse.summary)
  return _internal_summary();
}
template <typename Arg_, typename... Args_>
inline PROTOBUF_ALWAYS_INLINE void JourneysResponse::set_summary(Arg_&& arg,
                                                     Args_... args) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.summary_.Set(static_cast<Arg_&&>(arg), args..., GetArena());
  // @@protoc_insertion_point(field_set:kentik.journeys.v202502.JourneysResponse.summary)
}
inline std::string* JourneysResponse::mutable_summary() ABSL_ATTRIBUTE_LIFETIME_BOUND {
  std::string* _s = _internal_mutable_summary();
  // @@protoc_insertion_point(field_mutable:kentik.journeys.v202502.JourneysResponse.summary)
  return _s;
}
inline const std::string& JourneysResponse::_internal_summary() const {
  ::google::protobuf::internal::TSanRead(&_impl_);
  return _impl_.summary_.Get();
}
inline void JourneysResponse::_internal_set_summary(const std::string& value) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.summary_.Set(value, GetArena());
}
inline std::string* JourneysResponse::_internal_mutable_summary() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  return _impl_.summary_.Mutable( GetArena());
}
inline std::string* JourneysResponse::release_summary() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  // @@protoc_insertion_point(field_release:kentik.journeys.v202502.JourneysResponse.summary)
  return _impl_.summary_.Release();
}
inline void JourneysResponse::set_allocated_summary(std::string* value) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.summary_.SetAllocated(value, GetArena());
  if (::google::protobuf::internal::DebugHardenForceCopyDefaultString() && _impl_.summary_.IsDefault()) {
    _impl_.summary_.Set("", GetArena());
  }
  // @@protoc_insertion_point(field_set_allocated:kentik.journeys.v202502.JourneysResponse.summary)
}

// optional string data = 2 [json_name = "data"];
inline bool JourneysResponse::has_data() const {
  bool value = (_impl_._has_bits_[0] & 0x00000001u) != 0;
  return value;
}
inline void JourneysResponse::clear_data() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.data_.ClearToEmpty();
  _impl_._has_bits_[0] &= ~0x00000001u;
}
inline const std::string& JourneysResponse::data() const
    ABSL_ATTRIBUTE_LIFETIME_BOUND {
  // @@protoc_insertion_point(field_get:kentik.journeys.v202502.JourneysResponse.data)
  return _internal_data();
}
template <typename Arg_, typename... Args_>
inline PROTOBUF_ALWAYS_INLINE void JourneysResponse::set_data(Arg_&& arg,
                                                     Args_... args) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_._has_bits_[0] |= 0x00000001u;
  _impl_.data_.Set(static_cast<Arg_&&>(arg), args..., GetArena());
  // @@protoc_insertion_point(field_set:kentik.journeys.v202502.JourneysResponse.data)
}
inline std::string* JourneysResponse::mutable_data() ABSL_ATTRIBUTE_LIFETIME_BOUND {
  std::string* _s = _internal_mutable_data();
  // @@protoc_insertion_point(field_mutable:kentik.journeys.v202502.JourneysResponse.data)
  return _s;
}
inline const std::string& JourneysResponse::_internal_data() const {
  ::google::protobuf::internal::TSanRead(&_impl_);
  return _impl_.data_.Get();
}
inline void JourneysResponse::_internal_set_data(const std::string& value) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_._has_bits_[0] |= 0x00000001u;
  _impl_.data_.Set(value, GetArena());
}
inline std::string* JourneysResponse::_internal_mutable_data() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_._has_bits_[0] |= 0x00000001u;
  return _impl_.data_.Mutable( GetArena());
}
inline std::string* JourneysResponse::release_data() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  // @@protoc_insertion_point(field_release:kentik.journeys.v202502.JourneysResponse.data)
  if ((_impl_._has_bits_[0] & 0x00000001u) == 0) {
    return nullptr;
  }
  _impl_._has_bits_[0] &= ~0x00000001u;
  auto* released = _impl_.data_.Release();
  if (::google::protobuf::internal::DebugHardenForceCopyDefaultString()) {
    _impl_.data_.Set("", GetArena());
  }
  return released;
}
inline void JourneysResponse::set_allocated_data(std::string* value) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  if (value != nullptr) {
    _impl_._has_bits_[0] |= 0x00000001u;
  } else {
    _impl_._has_bits_[0] &= ~0x00000001u;
  }
  _impl_.data_.SetAllocated(value, GetArena());
  if (::google::protobuf::internal::DebugHardenForceCopyDefaultString() && _impl_.data_.IsDefault()) {
    _impl_.data_.Set("", GetArena());
  }
  // @@protoc_insertion_point(field_set_allocated:kentik.journeys.v202502.JourneysResponse.data)
}

#ifdef __GNUC__
#pragma GCC diagnostic pop
#endif  // __GNUC__

// @@protoc_insertion_point(namespace_scope)
}  // namespace v202502
}  // namespace journeys
}  // namespace kentik


// @@protoc_insertion_point(global_scope)

#include "google/protobuf/port_undef.inc"

#endif  // kentik_2fjourneys_2fv202502_2fjourneys_2eproto_2epb_2eh
