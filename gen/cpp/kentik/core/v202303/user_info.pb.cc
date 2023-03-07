// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: kentik/core/v202303/user_info.proto

#include "kentik/core/v202303/user_info.pb.h"

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
namespace core {
namespace v202303 {
class UserInfoDefaultTypeInternal {
 public:
  ::PROTOBUF_NAMESPACE_ID::internal::ExplicitlyConstructed<UserInfo> _instance;
} _UserInfo_default_instance_;
}  // namespace v202303
}  // namespace core
}  // namespace kentik
static void InitDefaultsscc_info_UserInfo_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto() {
  GOOGLE_PROTOBUF_VERIFY_VERSION;

  {
    void* ptr = &::kentik::core::v202303::_UserInfo_default_instance_;
    new (ptr) ::kentik::core::v202303::UserInfo();
    ::PROTOBUF_NAMESPACE_ID::internal::OnShutdownDestroyMessage(ptr);
  }
  ::kentik::core::v202303::UserInfo::InitAsDefaultInstance();
}

::PROTOBUF_NAMESPACE_ID::internal::SCCInfo<0> scc_info_UserInfo_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto =
    {{ATOMIC_VAR_INIT(::PROTOBUF_NAMESPACE_ID::internal::SCCInfoBase::kUninitialized), 0, 0, InitDefaultsscc_info_UserInfo_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto}, {}};

static ::PROTOBUF_NAMESPACE_ID::Metadata file_level_metadata_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto[1];
static constexpr ::PROTOBUF_NAMESPACE_ID::EnumDescriptor const** file_level_enum_descriptors_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto = nullptr;
static constexpr ::PROTOBUF_NAMESPACE_ID::ServiceDescriptor const** file_level_service_descriptors_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto = nullptr;

const ::PROTOBUF_NAMESPACE_ID::uint32 TableStruct_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto::offsets[] PROTOBUF_SECTION_VARIABLE(protodesc_cold) = {
  ~0u,  // no _has_bits_
  PROTOBUF_FIELD_OFFSET(::kentik::core::v202303::UserInfo, _internal_metadata_),
  ~0u,  // no _extensions_
  ~0u,  // no _oneof_case_
  ~0u,  // no _weak_field_map_
  PROTOBUF_FIELD_OFFSET(::kentik::core::v202303::UserInfo, id_),
  PROTOBUF_FIELD_OFFSET(::kentik::core::v202303::UserInfo, email_),
  PROTOBUF_FIELD_OFFSET(::kentik::core::v202303::UserInfo, full_name_),
};
static const ::PROTOBUF_NAMESPACE_ID::internal::MigrationSchema schemas[] PROTOBUF_SECTION_VARIABLE(protodesc_cold) = {
  { 0, -1, sizeof(::kentik::core::v202303::UserInfo)},
};

static ::PROTOBUF_NAMESPACE_ID::Message const * const file_default_instances[] = {
  reinterpret_cast<const ::PROTOBUF_NAMESPACE_ID::Message*>(&::kentik::core::v202303::_UserInfo_default_instance_),
};

const char descriptor_table_protodef_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto[] PROTOBUF_SECTION_VARIABLE(protodesc_cold) =
  "\n#kentik/core/v202303/user_info.proto\022\023k"
  "entik.core.v202303\032.protoc-gen-openapiv2"
  "/options/annotations.proto\032\037google/api/f"
  "ield_behavior.proto\"\267\001\n\010UserInfo\0223\n\002id\030\001"
  " \001(\tB#\222A\0342\032Unique system generated ID\342A\001"
  "\003R\002id\0229\n\005email\030\002 \001(\tB#\222A\0342\032E-mail addres"
  "s of the user\342A\001\003R\005email\022;\n\tfull_name\030\003 "
  "\001(\tB\036\222A\0272\025Full name of the user\342A\001\003R\010ful"
  "lNameBHZFgithub.com/kentik/api-schema-pu"
  "blic/go/kentik/core/v202303;kentik_coreb"
  "\006proto3"
  ;
static const ::PROTOBUF_NAMESPACE_ID::internal::DescriptorTable*const descriptor_table_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto_deps[2] = {
  &::descriptor_table_google_2fapi_2ffield_5fbehavior_2eproto,
  &::descriptor_table_protoc_2dgen_2dopenapiv2_2foptions_2fannotations_2eproto,
};
static ::PROTOBUF_NAMESPACE_ID::internal::SCCInfoBase*const descriptor_table_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto_sccs[1] = {
  &scc_info_UserInfo_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto.base,
};
static ::PROTOBUF_NAMESPACE_ID::internal::once_flag descriptor_table_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto_once;
const ::PROTOBUF_NAMESPACE_ID::internal::DescriptorTable descriptor_table_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto = {
  false, false, descriptor_table_protodef_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto, "kentik/core/v202303/user_info.proto", 407,
  &descriptor_table_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto_once, descriptor_table_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto_sccs, descriptor_table_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto_deps, 1, 2,
  schemas, file_default_instances, TableStruct_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto::offsets,
  file_level_metadata_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto, 1, file_level_enum_descriptors_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto, file_level_service_descriptors_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto,
};

// Force running AddDescriptors() at dynamic initialization time.
static bool dynamic_init_dummy_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto = (static_cast<void>(::PROTOBUF_NAMESPACE_ID::internal::AddDescriptors(&descriptor_table_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto)), true);
namespace kentik {
namespace core {
namespace v202303 {

// ===================================================================

void UserInfo::InitAsDefaultInstance() {
}
class UserInfo::_Internal {
 public:
};

UserInfo::UserInfo(::PROTOBUF_NAMESPACE_ID::Arena* arena)
  : ::PROTOBUF_NAMESPACE_ID::Message(arena) {
  SharedCtor();
  RegisterArenaDtor(arena);
  // @@protoc_insertion_point(arena_constructor:kentik.core.v202303.UserInfo)
}
UserInfo::UserInfo(const UserInfo& from)
  : ::PROTOBUF_NAMESPACE_ID::Message() {
  _internal_metadata_.MergeFrom<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>(from._internal_metadata_);
  id_.UnsafeSetDefault(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  if (!from._internal_id().empty()) {
    id_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), from._internal_id(),
      GetArena());
  }
  email_.UnsafeSetDefault(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  if (!from._internal_email().empty()) {
    email_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), from._internal_email(),
      GetArena());
  }
  full_name_.UnsafeSetDefault(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  if (!from._internal_full_name().empty()) {
    full_name_.Set(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), from._internal_full_name(),
      GetArena());
  }
  // @@protoc_insertion_point(copy_constructor:kentik.core.v202303.UserInfo)
}

void UserInfo::SharedCtor() {
  ::PROTOBUF_NAMESPACE_ID::internal::InitSCC(&scc_info_UserInfo_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto.base);
  id_.UnsafeSetDefault(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  email_.UnsafeSetDefault(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  full_name_.UnsafeSetDefault(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
}

UserInfo::~UserInfo() {
  // @@protoc_insertion_point(destructor:kentik.core.v202303.UserInfo)
  SharedDtor();
  _internal_metadata_.Delete<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>();
}

void UserInfo::SharedDtor() {
  GOOGLE_DCHECK(GetArena() == nullptr);
  id_.DestroyNoArena(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  email_.DestroyNoArena(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
  full_name_.DestroyNoArena(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited());
}

void UserInfo::ArenaDtor(void* object) {
  UserInfo* _this = reinterpret_cast< UserInfo* >(object);
  (void)_this;
}
void UserInfo::RegisterArenaDtor(::PROTOBUF_NAMESPACE_ID::Arena*) {
}
void UserInfo::SetCachedSize(int size) const {
  _cached_size_.Set(size);
}
const UserInfo& UserInfo::default_instance() {
  ::PROTOBUF_NAMESPACE_ID::internal::InitSCC(&::scc_info_UserInfo_kentik_2fcore_2fv202303_2fuser_5finfo_2eproto.base);
  return *internal_default_instance();
}


void UserInfo::Clear() {
// @@protoc_insertion_point(message_clear_start:kentik.core.v202303.UserInfo)
  ::PROTOBUF_NAMESPACE_ID::uint32 cached_has_bits = 0;
  // Prevent compiler warnings about cached_has_bits being unused
  (void) cached_has_bits;

  id_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
  email_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
  full_name_.ClearToEmpty(&::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
  _internal_metadata_.Clear<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>();
}

const char* UserInfo::_InternalParse(const char* ptr, ::PROTOBUF_NAMESPACE_ID::internal::ParseContext* ctx) {
#define CHK_(x) if (PROTOBUF_PREDICT_FALSE(!(x))) goto failure
  ::PROTOBUF_NAMESPACE_ID::Arena* arena = GetArena(); (void)arena;
  while (!ctx->Done(&ptr)) {
    ::PROTOBUF_NAMESPACE_ID::uint32 tag;
    ptr = ::PROTOBUF_NAMESPACE_ID::internal::ReadTag(ptr, &tag);
    CHK_(ptr);
    switch (tag >> 3) {
      // string id = 1[json_name = "id", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
      case 1:
        if (PROTOBUF_PREDICT_TRUE(static_cast<::PROTOBUF_NAMESPACE_ID::uint8>(tag) == 10)) {
          auto str = _internal_mutable_id();
          ptr = ::PROTOBUF_NAMESPACE_ID::internal::InlineGreedyStringParser(str, ptr, ctx);
          CHK_(::PROTOBUF_NAMESPACE_ID::internal::VerifyUTF8(str, "kentik.core.v202303.UserInfo.id"));
          CHK_(ptr);
        } else goto handle_unusual;
        continue;
      // string email = 2[json_name = "email", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
      case 2:
        if (PROTOBUF_PREDICT_TRUE(static_cast<::PROTOBUF_NAMESPACE_ID::uint8>(tag) == 18)) {
          auto str = _internal_mutable_email();
          ptr = ::PROTOBUF_NAMESPACE_ID::internal::InlineGreedyStringParser(str, ptr, ctx);
          CHK_(::PROTOBUF_NAMESPACE_ID::internal::VerifyUTF8(str, "kentik.core.v202303.UserInfo.email"));
          CHK_(ptr);
        } else goto handle_unusual;
        continue;
      // string full_name = 3[json_name = "fullName", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
      case 3:
        if (PROTOBUF_PREDICT_TRUE(static_cast<::PROTOBUF_NAMESPACE_ID::uint8>(tag) == 26)) {
          auto str = _internal_mutable_full_name();
          ptr = ::PROTOBUF_NAMESPACE_ID::internal::InlineGreedyStringParser(str, ptr, ctx);
          CHK_(::PROTOBUF_NAMESPACE_ID::internal::VerifyUTF8(str, "kentik.core.v202303.UserInfo.full_name"));
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

::PROTOBUF_NAMESPACE_ID::uint8* UserInfo::_InternalSerialize(
    ::PROTOBUF_NAMESPACE_ID::uint8* target, ::PROTOBUF_NAMESPACE_ID::io::EpsCopyOutputStream* stream) const {
  // @@protoc_insertion_point(serialize_to_array_start:kentik.core.v202303.UserInfo)
  ::PROTOBUF_NAMESPACE_ID::uint32 cached_has_bits = 0;
  (void) cached_has_bits;

  // string id = 1[json_name = "id", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->id().size() > 0) {
    ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::VerifyUtf8String(
      this->_internal_id().data(), static_cast<int>(this->_internal_id().length()),
      ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::SERIALIZE,
      "kentik.core.v202303.UserInfo.id");
    target = stream->WriteStringMaybeAliased(
        1, this->_internal_id(), target);
  }

  // string email = 2[json_name = "email", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->email().size() > 0) {
    ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::VerifyUtf8String(
      this->_internal_email().data(), static_cast<int>(this->_internal_email().length()),
      ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::SERIALIZE,
      "kentik.core.v202303.UserInfo.email");
    target = stream->WriteStringMaybeAliased(
        2, this->_internal_email(), target);
  }

  // string full_name = 3[json_name = "fullName", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->full_name().size() > 0) {
    ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::VerifyUtf8String(
      this->_internal_full_name().data(), static_cast<int>(this->_internal_full_name().length()),
      ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::SERIALIZE,
      "kentik.core.v202303.UserInfo.full_name");
    target = stream->WriteStringMaybeAliased(
        3, this->_internal_full_name(), target);
  }

  if (PROTOBUF_PREDICT_FALSE(_internal_metadata_.have_unknown_fields())) {
    target = ::PROTOBUF_NAMESPACE_ID::internal::WireFormat::InternalSerializeUnknownFieldsToArray(
        _internal_metadata_.unknown_fields<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>(::PROTOBUF_NAMESPACE_ID::UnknownFieldSet::default_instance), target, stream);
  }
  // @@protoc_insertion_point(serialize_to_array_end:kentik.core.v202303.UserInfo)
  return target;
}

size_t UserInfo::ByteSizeLong() const {
// @@protoc_insertion_point(message_byte_size_start:kentik.core.v202303.UserInfo)
  size_t total_size = 0;

  ::PROTOBUF_NAMESPACE_ID::uint32 cached_has_bits = 0;
  // Prevent compiler warnings about cached_has_bits being unused
  (void) cached_has_bits;

  // string id = 1[json_name = "id", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->id().size() > 0) {
    total_size += 1 +
      ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::StringSize(
        this->_internal_id());
  }

  // string email = 2[json_name = "email", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->email().size() > 0) {
    total_size += 1 +
      ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::StringSize(
        this->_internal_email());
  }

  // string full_name = 3[json_name = "fullName", (.grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
  if (this->full_name().size() > 0) {
    total_size += 1 +
      ::PROTOBUF_NAMESPACE_ID::internal::WireFormatLite::StringSize(
        this->_internal_full_name());
  }

  if (PROTOBUF_PREDICT_FALSE(_internal_metadata_.have_unknown_fields())) {
    return ::PROTOBUF_NAMESPACE_ID::internal::ComputeUnknownFieldsSize(
        _internal_metadata_, total_size, &_cached_size_);
  }
  int cached_size = ::PROTOBUF_NAMESPACE_ID::internal::ToCachedSize(total_size);
  SetCachedSize(cached_size);
  return total_size;
}

void UserInfo::MergeFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) {
// @@protoc_insertion_point(generalized_merge_from_start:kentik.core.v202303.UserInfo)
  GOOGLE_DCHECK_NE(&from, this);
  const UserInfo* source =
      ::PROTOBUF_NAMESPACE_ID::DynamicCastToGenerated<UserInfo>(
          &from);
  if (source == nullptr) {
  // @@protoc_insertion_point(generalized_merge_from_cast_fail:kentik.core.v202303.UserInfo)
    ::PROTOBUF_NAMESPACE_ID::internal::ReflectionOps::Merge(from, this);
  } else {
  // @@protoc_insertion_point(generalized_merge_from_cast_success:kentik.core.v202303.UserInfo)
    MergeFrom(*source);
  }
}

void UserInfo::MergeFrom(const UserInfo& from) {
// @@protoc_insertion_point(class_specific_merge_from_start:kentik.core.v202303.UserInfo)
  GOOGLE_DCHECK_NE(&from, this);
  _internal_metadata_.MergeFrom<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>(from._internal_metadata_);
  ::PROTOBUF_NAMESPACE_ID::uint32 cached_has_bits = 0;
  (void) cached_has_bits;

  if (from.id().size() > 0) {
    _internal_set_id(from._internal_id());
  }
  if (from.email().size() > 0) {
    _internal_set_email(from._internal_email());
  }
  if (from.full_name().size() > 0) {
    _internal_set_full_name(from._internal_full_name());
  }
}

void UserInfo::CopyFrom(const ::PROTOBUF_NAMESPACE_ID::Message& from) {
// @@protoc_insertion_point(generalized_copy_from_start:kentik.core.v202303.UserInfo)
  if (&from == this) return;
  Clear();
  MergeFrom(from);
}

void UserInfo::CopyFrom(const UserInfo& from) {
// @@protoc_insertion_point(class_specific_copy_from_start:kentik.core.v202303.UserInfo)
  if (&from == this) return;
  Clear();
  MergeFrom(from);
}

bool UserInfo::IsInitialized() const {
  return true;
}

void UserInfo::InternalSwap(UserInfo* other) {
  using std::swap;
  _internal_metadata_.Swap<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>(&other->_internal_metadata_);
  id_.Swap(&other->id_, &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
  email_.Swap(&other->email_, &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
  full_name_.Swap(&other->full_name_, &::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited(), GetArena());
}

::PROTOBUF_NAMESPACE_ID::Metadata UserInfo::GetMetadata() const {
  return GetMetadataStatic();
}


// @@protoc_insertion_point(namespace_scope)
}  // namespace v202303
}  // namespace core
}  // namespace kentik
PROTOBUF_NAMESPACE_OPEN
template<> PROTOBUF_NOINLINE ::kentik::core::v202303::UserInfo* Arena::CreateMaybeMessage< ::kentik::core::v202303::UserInfo >(Arena* arena) {
  return Arena::CreateMessageInternal< ::kentik::core::v202303::UserInfo >(arena);
}
PROTOBUF_NAMESPACE_CLOSE

// @@protoc_insertion_point(global_scope)
#include <google/protobuf/port_undef.inc>
