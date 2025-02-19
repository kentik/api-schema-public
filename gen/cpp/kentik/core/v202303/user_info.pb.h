// Generated by the protocol buffer compiler.  DO NOT EDIT!
// NO CHECKED-IN PROTOBUF GENCODE
// source: kentik/core/v202303/user_info.proto
// Protobuf C++ Version: 5.29.3

#ifndef kentik_2fcore_2fv202303_2fuser_5finfo_2eproto_2epb_2eh
#define kentik_2fcore_2fv202303_2fuser_5finfo_2eproto_2epb_2eh

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
#include "protoc-gen-openapiv2/options/annotations.pb.h"
#include "google/api/field_behavior.pb.h"
// @@protoc_insertion_point(includes)

// Must be included last.
#include "google/protobuf/port_def.inc"

#define PROTOBUF_INTERNAL_EXPORT_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto

namespace google {
namespace protobuf {
namespace internal {
template <typename T>
::absl::string_view GetAnyMessageName();
}  // namespace internal
}  // namespace protobuf
}  // namespace google

// Internal implementation detail -- do not use these members.
struct TableStruct_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto {
  static const ::uint32_t offsets[];
};
extern const ::google::protobuf::internal::DescriptorTable
    descriptor_table_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto;
namespace kentik {
namespace core {
namespace v202303 {
class UserInfo;
struct UserInfoDefaultTypeInternal;
extern UserInfoDefaultTypeInternal _UserInfo_default_instance_;
}  // namespace v202303
}  // namespace core
}  // namespace kentik
namespace google {
namespace protobuf {
}  // namespace protobuf
}  // namespace google

namespace kentik {
namespace core {
namespace v202303 {

// ===================================================================


// -------------------------------------------------------------------

class UserInfo final : public ::google::protobuf::Message
/* @@protoc_insertion_point(class_definition:kentik.core.v202303.UserInfo) */ {
 public:
  inline UserInfo() : UserInfo(nullptr) {}
  ~UserInfo() PROTOBUF_FINAL;

#if defined(PROTOBUF_CUSTOM_VTABLE)
  void operator delete(UserInfo* msg, std::destroying_delete_t) {
    SharedDtor(*msg);
    ::google::protobuf::internal::SizedDelete(msg, sizeof(UserInfo));
  }
#endif

  template <typename = void>
  explicit PROTOBUF_CONSTEXPR UserInfo(
      ::google::protobuf::internal::ConstantInitialized);

  inline UserInfo(const UserInfo& from) : UserInfo(nullptr, from) {}
  inline UserInfo(UserInfo&& from) noexcept
      : UserInfo(nullptr, std::move(from)) {}
  inline UserInfo& operator=(const UserInfo& from) {
    CopyFrom(from);
    return *this;
  }
  inline UserInfo& operator=(UserInfo&& from) noexcept {
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
  static const UserInfo& default_instance() {
    return *internal_default_instance();
  }
  static inline const UserInfo* internal_default_instance() {
    return reinterpret_cast<const UserInfo*>(
        &_UserInfo_default_instance_);
  }
  static constexpr int kIndexInFileMessages = 0;
  friend void swap(UserInfo& a, UserInfo& b) { a.Swap(&b); }
  inline void Swap(UserInfo* other) {
    if (other == this) return;
    if (::google::protobuf::internal::CanUseInternalSwap(GetArena(), other->GetArena())) {
      InternalSwap(other);
    } else {
      ::google::protobuf::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(UserInfo* other) {
    if (other == this) return;
    ABSL_DCHECK(GetArena() == other->GetArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  UserInfo* New(::google::protobuf::Arena* arena = nullptr) const {
    return ::google::protobuf::Message::DefaultConstruct<UserInfo>(arena);
  }
  using ::google::protobuf::Message::CopyFrom;
  void CopyFrom(const UserInfo& from);
  using ::google::protobuf::Message::MergeFrom;
  void MergeFrom(const UserInfo& from) { UserInfo::MergeImpl(*this, from); }

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
  void InternalSwap(UserInfo* other);
 private:
  template <typename T>
  friend ::absl::string_view(
      ::google::protobuf::internal::GetAnyMessageName)();
  static ::absl::string_view FullMessageName() { return "kentik.core.v202303.UserInfo"; }

 protected:
  explicit UserInfo(::google::protobuf::Arena* arena);
  UserInfo(::google::protobuf::Arena* arena, const UserInfo& from);
  UserInfo(::google::protobuf::Arena* arena, UserInfo&& from) noexcept
      : UserInfo(arena) {
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
    kIdFieldNumber = 1,
    kEmailFieldNumber = 2,
    kFullNameFieldNumber = 3,
  };
  // string id = 1 [json_name = "id", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_id() ;
  const std::string& id() const;
  template <typename Arg_ = const std::string&, typename... Args_>
  void set_id(Arg_&& arg, Args_... args);
  std::string* mutable_id();
  PROTOBUF_NODISCARD std::string* release_id();
  void set_allocated_id(std::string* value);

  private:
  const std::string& _internal_id() const;
  inline PROTOBUF_ALWAYS_INLINE void _internal_set_id(
      const std::string& value);
  std::string* _internal_mutable_id();

  public:
  // string email = 2 [json_name = "email", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_email() ;
  const std::string& email() const;
  template <typename Arg_ = const std::string&, typename... Args_>
  void set_email(Arg_&& arg, Args_... args);
  std::string* mutable_email();
  PROTOBUF_NODISCARD std::string* release_email();
  void set_allocated_email(std::string* value);

  private:
  const std::string& _internal_email() const;
  inline PROTOBUF_ALWAYS_INLINE void _internal_set_email(
      const std::string& value);
  std::string* _internal_mutable_email();

  public:
  // string full_name = 3 [json_name = "fullName", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  void clear_full_name() ;
  const std::string& full_name() const;
  template <typename Arg_ = const std::string&, typename... Args_>
  void set_full_name(Arg_&& arg, Args_... args);
  std::string* mutable_full_name();
  PROTOBUF_NODISCARD std::string* release_full_name();
  void set_allocated_full_name(std::string* value);

  private:
  const std::string& _internal_full_name() const;
  inline PROTOBUF_ALWAYS_INLINE void _internal_set_full_name(
      const std::string& value);
  std::string* _internal_mutable_full_name();

  public:
  // @@protoc_insertion_point(class_scope:kentik.core.v202303.UserInfo)
 private:
  class _Internal;
  friend class ::google::protobuf::internal::TcParser;
  static const ::google::protobuf::internal::TcParseTable<
      2, 3, 0,
      53, 2>
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
                          const UserInfo& from_msg);
    ::google::protobuf::internal::ArenaStringPtr id_;
    ::google::protobuf::internal::ArenaStringPtr email_;
    ::google::protobuf::internal::ArenaStringPtr full_name_;
    ::google::protobuf::internal::CachedSize _cached_size_;
    PROTOBUF_TSAN_DECLARE_MEMBER
  };
  union { Impl_ _impl_; };
  friend struct ::TableStruct_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto;
};

// ===================================================================




// ===================================================================


#ifdef __GNUC__
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif  // __GNUC__
// -------------------------------------------------------------------

// UserInfo

// string id = 1 [json_name = "id", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void UserInfo::clear_id() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.id_.ClearToEmpty();
}
inline const std::string& UserInfo::id() const
    ABSL_ATTRIBUTE_LIFETIME_BOUND {
  // @@protoc_insertion_point(field_get:kentik.core.v202303.UserInfo.id)
  return _internal_id();
}
template <typename Arg_, typename... Args_>
inline PROTOBUF_ALWAYS_INLINE void UserInfo::set_id(Arg_&& arg,
                                                     Args_... args) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.id_.Set(static_cast<Arg_&&>(arg), args..., GetArena());
  // @@protoc_insertion_point(field_set:kentik.core.v202303.UserInfo.id)
}
inline std::string* UserInfo::mutable_id() ABSL_ATTRIBUTE_LIFETIME_BOUND {
  std::string* _s = _internal_mutable_id();
  // @@protoc_insertion_point(field_mutable:kentik.core.v202303.UserInfo.id)
  return _s;
}
inline const std::string& UserInfo::_internal_id() const {
  ::google::protobuf::internal::TSanRead(&_impl_);
  return _impl_.id_.Get();
}
inline void UserInfo::_internal_set_id(const std::string& value) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.id_.Set(value, GetArena());
}
inline std::string* UserInfo::_internal_mutable_id() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  return _impl_.id_.Mutable( GetArena());
}
inline std::string* UserInfo::release_id() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  // @@protoc_insertion_point(field_release:kentik.core.v202303.UserInfo.id)
  return _impl_.id_.Release();
}
inline void UserInfo::set_allocated_id(std::string* value) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.id_.SetAllocated(value, GetArena());
  if (::google::protobuf::internal::DebugHardenForceCopyDefaultString() && _impl_.id_.IsDefault()) {
    _impl_.id_.Set("", GetArena());
  }
  // @@protoc_insertion_point(field_set_allocated:kentik.core.v202303.UserInfo.id)
}

// string email = 2 [json_name = "email", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void UserInfo::clear_email() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.email_.ClearToEmpty();
}
inline const std::string& UserInfo::email() const
    ABSL_ATTRIBUTE_LIFETIME_BOUND {
  // @@protoc_insertion_point(field_get:kentik.core.v202303.UserInfo.email)
  return _internal_email();
}
template <typename Arg_, typename... Args_>
inline PROTOBUF_ALWAYS_INLINE void UserInfo::set_email(Arg_&& arg,
                                                     Args_... args) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.email_.Set(static_cast<Arg_&&>(arg), args..., GetArena());
  // @@protoc_insertion_point(field_set:kentik.core.v202303.UserInfo.email)
}
inline std::string* UserInfo::mutable_email() ABSL_ATTRIBUTE_LIFETIME_BOUND {
  std::string* _s = _internal_mutable_email();
  // @@protoc_insertion_point(field_mutable:kentik.core.v202303.UserInfo.email)
  return _s;
}
inline const std::string& UserInfo::_internal_email() const {
  ::google::protobuf::internal::TSanRead(&_impl_);
  return _impl_.email_.Get();
}
inline void UserInfo::_internal_set_email(const std::string& value) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.email_.Set(value, GetArena());
}
inline std::string* UserInfo::_internal_mutable_email() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  return _impl_.email_.Mutable( GetArena());
}
inline std::string* UserInfo::release_email() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  // @@protoc_insertion_point(field_release:kentik.core.v202303.UserInfo.email)
  return _impl_.email_.Release();
}
inline void UserInfo::set_allocated_email(std::string* value) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.email_.SetAllocated(value, GetArena());
  if (::google::protobuf::internal::DebugHardenForceCopyDefaultString() && _impl_.email_.IsDefault()) {
    _impl_.email_.Set("", GetArena());
  }
  // @@protoc_insertion_point(field_set_allocated:kentik.core.v202303.UserInfo.email)
}

// string full_name = 3 [json_name = "fullName", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
inline void UserInfo::clear_full_name() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.full_name_.ClearToEmpty();
}
inline const std::string& UserInfo::full_name() const
    ABSL_ATTRIBUTE_LIFETIME_BOUND {
  // @@protoc_insertion_point(field_get:kentik.core.v202303.UserInfo.full_name)
  return _internal_full_name();
}
template <typename Arg_, typename... Args_>
inline PROTOBUF_ALWAYS_INLINE void UserInfo::set_full_name(Arg_&& arg,
                                                     Args_... args) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.full_name_.Set(static_cast<Arg_&&>(arg), args..., GetArena());
  // @@protoc_insertion_point(field_set:kentik.core.v202303.UserInfo.full_name)
}
inline std::string* UserInfo::mutable_full_name() ABSL_ATTRIBUTE_LIFETIME_BOUND {
  std::string* _s = _internal_mutable_full_name();
  // @@protoc_insertion_point(field_mutable:kentik.core.v202303.UserInfo.full_name)
  return _s;
}
inline const std::string& UserInfo::_internal_full_name() const {
  ::google::protobuf::internal::TSanRead(&_impl_);
  return _impl_.full_name_.Get();
}
inline void UserInfo::_internal_set_full_name(const std::string& value) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.full_name_.Set(value, GetArena());
}
inline std::string* UserInfo::_internal_mutable_full_name() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  return _impl_.full_name_.Mutable( GetArena());
}
inline std::string* UserInfo::release_full_name() {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  // @@protoc_insertion_point(field_release:kentik.core.v202303.UserInfo.full_name)
  return _impl_.full_name_.Release();
}
inline void UserInfo::set_allocated_full_name(std::string* value) {
  ::google::protobuf::internal::TSanWrite(&_impl_);
  _impl_.full_name_.SetAllocated(value, GetArena());
  if (::google::protobuf::internal::DebugHardenForceCopyDefaultString() && _impl_.full_name_.IsDefault()) {
    _impl_.full_name_.Set("", GetArena());
  }
  // @@protoc_insertion_point(field_set_allocated:kentik.core.v202303.UserInfo.full_name)
}

#ifdef __GNUC__
#pragma GCC diagnostic pop
#endif  // __GNUC__

// @@protoc_insertion_point(namespace_scope)
}  // namespace v202303
}  // namespace core
}  // namespace kentik


// @@protoc_insertion_point(global_scope)

#include "google/protobuf/port_undef.inc"

#endif  // kentik_2fcore_2fv202303_2fuser_5finfo_2eproto_2epb_2eh
