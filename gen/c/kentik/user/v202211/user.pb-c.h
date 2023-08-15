/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: kentik/user/v202211/user.proto */

#ifndef PROTOBUF_C_kentik_2fuser_2fv202211_2fuser_2eproto__INCLUDED
#define PROTOBUF_C_kentik_2fuser_2fv202211_2fuser_2eproto__INCLUDED

#include <protobuf-c/protobuf-c.h>

PROTOBUF_C__BEGIN_DECLS

#if PROTOBUF_C_VERSION_NUMBER < 1003000
# error This file was generated by a newer version of protoc-c which is incompatible with your libprotobuf-c headers. Please update your headers.
#elif 1004001 < PROTOBUF_C_MIN_COMPILER_VERSION
# error This file was generated by an older version of protoc-c which is incompatible with your libprotobuf-c headers. Please regenerate this file with a newer version of protoc-c.
#endif

#include "google/api/annotations.pb-c.h"
#include "google/api/client.pb-c.h"
#include "google/api/field_behavior.pb-c.h"
#include "google/protobuf/timestamp.pb-c.h"
#include "protoc-gen-openapiv2/options/annotations.pb-c.h"
#include "kentik/core/v202303/annotations.pb-c.h"

typedef struct Kentik__User__V202211__PermissionEntry Kentik__User__V202211__PermissionEntry;
typedef struct Kentik__User__V202211__User Kentik__User__V202211__User;
typedef struct Kentik__User__V202211__ListUsersRequest Kentik__User__V202211__ListUsersRequest;
typedef struct Kentik__User__V202211__ListUsersResponse Kentik__User__V202211__ListUsersResponse;
typedef struct Kentik__User__V202211__GetUserRequest Kentik__User__V202211__GetUserRequest;
typedef struct Kentik__User__V202211__GetUserResponse Kentik__User__V202211__GetUserResponse;
typedef struct Kentik__User__V202211__CreateUserRequest Kentik__User__V202211__CreateUserRequest;
typedef struct Kentik__User__V202211__CreateUserResponse Kentik__User__V202211__CreateUserResponse;
typedef struct Kentik__User__V202211__UpdateUserRequest Kentik__User__V202211__UpdateUserRequest;
typedef struct Kentik__User__V202211__UpdateUserResponse Kentik__User__V202211__UpdateUserResponse;
typedef struct Kentik__User__V202211__DeleteUserRequest Kentik__User__V202211__DeleteUserRequest;
typedef struct Kentik__User__V202211__DeleteUserResponse Kentik__User__V202211__DeleteUserResponse;
typedef struct Kentik__User__V202211__ResetApiTokenRequest Kentik__User__V202211__ResetApiTokenRequest;
typedef struct Kentik__User__V202211__ResetApiTokenResponse Kentik__User__V202211__ResetApiTokenResponse;
typedef struct Kentik__User__V202211__ResetActiveSessionsRequest Kentik__User__V202211__ResetActiveSessionsRequest;
typedef struct Kentik__User__V202211__ResetActiveSessionsResponse Kentik__User__V202211__ResetActiveSessionsResponse;


/* --- enums --- */

/*
 * {{.Name}}
 */
typedef enum _Kentik__User__V202211__Role {
  /*
   * Invalid value.
   */
  KENTIK__USER__V202211__ROLE__ROLE_UNSPECIFIED = 0,
  /*
   * Member
   */
  KENTIK__USER__V202211__ROLE__ROLE_MEMBER = 1,
  /*
   * Administrator
   */
  KENTIK__USER__V202211__ROLE__ROLE_ADMINISTRATOR = 2,
  /*
   * Super-administrator
   */
  KENTIK__USER__V202211__ROLE__ROLE_SUPER_ADMINISTRATOR = 3
    PROTOBUF_C__FORCE_ENUM_TO_BE_INT_SIZE(KENTIK__USER__V202211__ROLE)
} Kentik__User__V202211__Role;

/* --- messages --- */

/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__PermissionEntry
{
  ProtobufCMessage base;
  char *capability;
  protobuf_c_boolean allowed;
};
#define KENTIK__USER__V202211__PERMISSION_ENTRY__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__permission_entry__descriptor) \
    , (char *)protobuf_c_empty_string, 0 }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__User
{
  ProtobufCMessage base;
  char *id;
  char *user_email;
  char *user_full_name;
  Kentik__User__V202211__Role role;
  size_t n_permissions;
  Kentik__User__V202211__PermissionEntry **permissions;
  char *filter;
  Google__Protobuf__Timestamp *last_login;
  Google__Protobuf__Timestamp *cdate;
  Google__Protobuf__Timestamp *edate;
};
#define KENTIK__USER__V202211__USER__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__user__descriptor) \
    , (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, (char *)protobuf_c_empty_string, KENTIK__USER__V202211__ROLE__ROLE_UNSPECIFIED, 0,NULL, (char *)protobuf_c_empty_string, NULL, NULL, NULL }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__ListUsersRequest
{
  ProtobufCMessage base;
};
#define KENTIK__USER__V202211__LIST_USERS_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__list_users_request__descriptor) \
     }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__ListUsersResponse
{
  ProtobufCMessage base;
  size_t n_users;
  Kentik__User__V202211__User **users;
  uint32_t invalid_count;
};
#define KENTIK__USER__V202211__LIST_USERS_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__list_users_response__descriptor) \
    , 0,NULL, 0 }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__GetUserRequest
{
  ProtobufCMessage base;
  char *id;
};
#define KENTIK__USER__V202211__GET_USER_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__get_user_request__descriptor) \
    , (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__GetUserResponse
{
  ProtobufCMessage base;
  Kentik__User__V202211__User *user;
};
#define KENTIK__USER__V202211__GET_USER_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__get_user_response__descriptor) \
    , NULL }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__CreateUserRequest
{
  ProtobufCMessage base;
  Kentik__User__V202211__User *user;
};
#define KENTIK__USER__V202211__CREATE_USER_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__create_user_request__descriptor) \
    , NULL }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__CreateUserResponse
{
  ProtobufCMessage base;
  Kentik__User__V202211__User *user;
};
#define KENTIK__USER__V202211__CREATE_USER_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__create_user_response__descriptor) \
    , NULL }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__UpdateUserRequest
{
  ProtobufCMessage base;
  Kentik__User__V202211__User *user;
};
#define KENTIK__USER__V202211__UPDATE_USER_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__update_user_request__descriptor) \
    , NULL }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__UpdateUserResponse
{
  ProtobufCMessage base;
  Kentik__User__V202211__User *user;
};
#define KENTIK__USER__V202211__UPDATE_USER_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__update_user_response__descriptor) \
    , NULL }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__DeleteUserRequest
{
  ProtobufCMessage base;
  char *id;
};
#define KENTIK__USER__V202211__DELETE_USER_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__delete_user_request__descriptor) \
    , (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__DeleteUserResponse
{
  ProtobufCMessage base;
};
#define KENTIK__USER__V202211__DELETE_USER_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__delete_user_response__descriptor) \
     }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__ResetApiTokenRequest
{
  ProtobufCMessage base;
  char *id;
};
#define KENTIK__USER__V202211__RESET_API_TOKEN_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__reset_api_token_request__descriptor) \
    , (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__ResetApiTokenResponse
{
  ProtobufCMessage base;
};
#define KENTIK__USER__V202211__RESET_API_TOKEN_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__reset_api_token_response__descriptor) \
     }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__ResetActiveSessionsRequest
{
  ProtobufCMessage base;
  char *id;
};
#define KENTIK__USER__V202211__RESET_ACTIVE_SESSIONS_REQUEST__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__reset_active_sessions_request__descriptor) \
    , (char *)protobuf_c_empty_string }


/*
 * {{.Name}}
 */
struct  Kentik__User__V202211__ResetActiveSessionsResponse
{
  ProtobufCMessage base;
};
#define KENTIK__USER__V202211__RESET_ACTIVE_SESSIONS_RESPONSE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&kentik__user__v202211__reset_active_sessions_response__descriptor) \
     }


/* Kentik__User__V202211__PermissionEntry methods */
void   kentik__user__v202211__permission_entry__init
                     (Kentik__User__V202211__PermissionEntry         *message);
size_t kentik__user__v202211__permission_entry__get_packed_size
                     (const Kentik__User__V202211__PermissionEntry   *message);
size_t kentik__user__v202211__permission_entry__pack
                     (const Kentik__User__V202211__PermissionEntry   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__permission_entry__pack_to_buffer
                     (const Kentik__User__V202211__PermissionEntry   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__PermissionEntry *
       kentik__user__v202211__permission_entry__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__permission_entry__free_unpacked
                     (Kentik__User__V202211__PermissionEntry *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__User methods */
void   kentik__user__v202211__user__init
                     (Kentik__User__V202211__User         *message);
size_t kentik__user__v202211__user__get_packed_size
                     (const Kentik__User__V202211__User   *message);
size_t kentik__user__v202211__user__pack
                     (const Kentik__User__V202211__User   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__user__pack_to_buffer
                     (const Kentik__User__V202211__User   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__User *
       kentik__user__v202211__user__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__user__free_unpacked
                     (Kentik__User__V202211__User *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__ListUsersRequest methods */
void   kentik__user__v202211__list_users_request__init
                     (Kentik__User__V202211__ListUsersRequest         *message);
size_t kentik__user__v202211__list_users_request__get_packed_size
                     (const Kentik__User__V202211__ListUsersRequest   *message);
size_t kentik__user__v202211__list_users_request__pack
                     (const Kentik__User__V202211__ListUsersRequest   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__list_users_request__pack_to_buffer
                     (const Kentik__User__V202211__ListUsersRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__ListUsersRequest *
       kentik__user__v202211__list_users_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__list_users_request__free_unpacked
                     (Kentik__User__V202211__ListUsersRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__ListUsersResponse methods */
void   kentik__user__v202211__list_users_response__init
                     (Kentik__User__V202211__ListUsersResponse         *message);
size_t kentik__user__v202211__list_users_response__get_packed_size
                     (const Kentik__User__V202211__ListUsersResponse   *message);
size_t kentik__user__v202211__list_users_response__pack
                     (const Kentik__User__V202211__ListUsersResponse   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__list_users_response__pack_to_buffer
                     (const Kentik__User__V202211__ListUsersResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__ListUsersResponse *
       kentik__user__v202211__list_users_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__list_users_response__free_unpacked
                     (Kentik__User__V202211__ListUsersResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__GetUserRequest methods */
void   kentik__user__v202211__get_user_request__init
                     (Kentik__User__V202211__GetUserRequest         *message);
size_t kentik__user__v202211__get_user_request__get_packed_size
                     (const Kentik__User__V202211__GetUserRequest   *message);
size_t kentik__user__v202211__get_user_request__pack
                     (const Kentik__User__V202211__GetUserRequest   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__get_user_request__pack_to_buffer
                     (const Kentik__User__V202211__GetUserRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__GetUserRequest *
       kentik__user__v202211__get_user_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__get_user_request__free_unpacked
                     (Kentik__User__V202211__GetUserRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__GetUserResponse methods */
void   kentik__user__v202211__get_user_response__init
                     (Kentik__User__V202211__GetUserResponse         *message);
size_t kentik__user__v202211__get_user_response__get_packed_size
                     (const Kentik__User__V202211__GetUserResponse   *message);
size_t kentik__user__v202211__get_user_response__pack
                     (const Kentik__User__V202211__GetUserResponse   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__get_user_response__pack_to_buffer
                     (const Kentik__User__V202211__GetUserResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__GetUserResponse *
       kentik__user__v202211__get_user_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__get_user_response__free_unpacked
                     (Kentik__User__V202211__GetUserResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__CreateUserRequest methods */
void   kentik__user__v202211__create_user_request__init
                     (Kentik__User__V202211__CreateUserRequest         *message);
size_t kentik__user__v202211__create_user_request__get_packed_size
                     (const Kentik__User__V202211__CreateUserRequest   *message);
size_t kentik__user__v202211__create_user_request__pack
                     (const Kentik__User__V202211__CreateUserRequest   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__create_user_request__pack_to_buffer
                     (const Kentik__User__V202211__CreateUserRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__CreateUserRequest *
       kentik__user__v202211__create_user_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__create_user_request__free_unpacked
                     (Kentik__User__V202211__CreateUserRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__CreateUserResponse methods */
void   kentik__user__v202211__create_user_response__init
                     (Kentik__User__V202211__CreateUserResponse         *message);
size_t kentik__user__v202211__create_user_response__get_packed_size
                     (const Kentik__User__V202211__CreateUserResponse   *message);
size_t kentik__user__v202211__create_user_response__pack
                     (const Kentik__User__V202211__CreateUserResponse   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__create_user_response__pack_to_buffer
                     (const Kentik__User__V202211__CreateUserResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__CreateUserResponse *
       kentik__user__v202211__create_user_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__create_user_response__free_unpacked
                     (Kentik__User__V202211__CreateUserResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__UpdateUserRequest methods */
void   kentik__user__v202211__update_user_request__init
                     (Kentik__User__V202211__UpdateUserRequest         *message);
size_t kentik__user__v202211__update_user_request__get_packed_size
                     (const Kentik__User__V202211__UpdateUserRequest   *message);
size_t kentik__user__v202211__update_user_request__pack
                     (const Kentik__User__V202211__UpdateUserRequest   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__update_user_request__pack_to_buffer
                     (const Kentik__User__V202211__UpdateUserRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__UpdateUserRequest *
       kentik__user__v202211__update_user_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__update_user_request__free_unpacked
                     (Kentik__User__V202211__UpdateUserRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__UpdateUserResponse methods */
void   kentik__user__v202211__update_user_response__init
                     (Kentik__User__V202211__UpdateUserResponse         *message);
size_t kentik__user__v202211__update_user_response__get_packed_size
                     (const Kentik__User__V202211__UpdateUserResponse   *message);
size_t kentik__user__v202211__update_user_response__pack
                     (const Kentik__User__V202211__UpdateUserResponse   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__update_user_response__pack_to_buffer
                     (const Kentik__User__V202211__UpdateUserResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__UpdateUserResponse *
       kentik__user__v202211__update_user_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__update_user_response__free_unpacked
                     (Kentik__User__V202211__UpdateUserResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__DeleteUserRequest methods */
void   kentik__user__v202211__delete_user_request__init
                     (Kentik__User__V202211__DeleteUserRequest         *message);
size_t kentik__user__v202211__delete_user_request__get_packed_size
                     (const Kentik__User__V202211__DeleteUserRequest   *message);
size_t kentik__user__v202211__delete_user_request__pack
                     (const Kentik__User__V202211__DeleteUserRequest   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__delete_user_request__pack_to_buffer
                     (const Kentik__User__V202211__DeleteUserRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__DeleteUserRequest *
       kentik__user__v202211__delete_user_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__delete_user_request__free_unpacked
                     (Kentik__User__V202211__DeleteUserRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__DeleteUserResponse methods */
void   kentik__user__v202211__delete_user_response__init
                     (Kentik__User__V202211__DeleteUserResponse         *message);
size_t kentik__user__v202211__delete_user_response__get_packed_size
                     (const Kentik__User__V202211__DeleteUserResponse   *message);
size_t kentik__user__v202211__delete_user_response__pack
                     (const Kentik__User__V202211__DeleteUserResponse   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__delete_user_response__pack_to_buffer
                     (const Kentik__User__V202211__DeleteUserResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__DeleteUserResponse *
       kentik__user__v202211__delete_user_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__delete_user_response__free_unpacked
                     (Kentik__User__V202211__DeleteUserResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__ResetApiTokenRequest methods */
void   kentik__user__v202211__reset_api_token_request__init
                     (Kentik__User__V202211__ResetApiTokenRequest         *message);
size_t kentik__user__v202211__reset_api_token_request__get_packed_size
                     (const Kentik__User__V202211__ResetApiTokenRequest   *message);
size_t kentik__user__v202211__reset_api_token_request__pack
                     (const Kentik__User__V202211__ResetApiTokenRequest   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__reset_api_token_request__pack_to_buffer
                     (const Kentik__User__V202211__ResetApiTokenRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__ResetApiTokenRequest *
       kentik__user__v202211__reset_api_token_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__reset_api_token_request__free_unpacked
                     (Kentik__User__V202211__ResetApiTokenRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__ResetApiTokenResponse methods */
void   kentik__user__v202211__reset_api_token_response__init
                     (Kentik__User__V202211__ResetApiTokenResponse         *message);
size_t kentik__user__v202211__reset_api_token_response__get_packed_size
                     (const Kentik__User__V202211__ResetApiTokenResponse   *message);
size_t kentik__user__v202211__reset_api_token_response__pack
                     (const Kentik__User__V202211__ResetApiTokenResponse   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__reset_api_token_response__pack_to_buffer
                     (const Kentik__User__V202211__ResetApiTokenResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__ResetApiTokenResponse *
       kentik__user__v202211__reset_api_token_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__reset_api_token_response__free_unpacked
                     (Kentik__User__V202211__ResetApiTokenResponse *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__ResetActiveSessionsRequest methods */
void   kentik__user__v202211__reset_active_sessions_request__init
                     (Kentik__User__V202211__ResetActiveSessionsRequest         *message);
size_t kentik__user__v202211__reset_active_sessions_request__get_packed_size
                     (const Kentik__User__V202211__ResetActiveSessionsRequest   *message);
size_t kentik__user__v202211__reset_active_sessions_request__pack
                     (const Kentik__User__V202211__ResetActiveSessionsRequest   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__reset_active_sessions_request__pack_to_buffer
                     (const Kentik__User__V202211__ResetActiveSessionsRequest   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__ResetActiveSessionsRequest *
       kentik__user__v202211__reset_active_sessions_request__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__reset_active_sessions_request__free_unpacked
                     (Kentik__User__V202211__ResetActiveSessionsRequest *message,
                      ProtobufCAllocator *allocator);
/* Kentik__User__V202211__ResetActiveSessionsResponse methods */
void   kentik__user__v202211__reset_active_sessions_response__init
                     (Kentik__User__V202211__ResetActiveSessionsResponse         *message);
size_t kentik__user__v202211__reset_active_sessions_response__get_packed_size
                     (const Kentik__User__V202211__ResetActiveSessionsResponse   *message);
size_t kentik__user__v202211__reset_active_sessions_response__pack
                     (const Kentik__User__V202211__ResetActiveSessionsResponse   *message,
                      uint8_t             *out);
size_t kentik__user__v202211__reset_active_sessions_response__pack_to_buffer
                     (const Kentik__User__V202211__ResetActiveSessionsResponse   *message,
                      ProtobufCBuffer     *buffer);
Kentik__User__V202211__ResetActiveSessionsResponse *
       kentik__user__v202211__reset_active_sessions_response__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   kentik__user__v202211__reset_active_sessions_response__free_unpacked
                     (Kentik__User__V202211__ResetActiveSessionsResponse *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Kentik__User__V202211__PermissionEntry_Closure)
                 (const Kentik__User__V202211__PermissionEntry *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__User_Closure)
                 (const Kentik__User__V202211__User *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__ListUsersRequest_Closure)
                 (const Kentik__User__V202211__ListUsersRequest *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__ListUsersResponse_Closure)
                 (const Kentik__User__V202211__ListUsersResponse *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__GetUserRequest_Closure)
                 (const Kentik__User__V202211__GetUserRequest *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__GetUserResponse_Closure)
                 (const Kentik__User__V202211__GetUserResponse *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__CreateUserRequest_Closure)
                 (const Kentik__User__V202211__CreateUserRequest *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__CreateUserResponse_Closure)
                 (const Kentik__User__V202211__CreateUserResponse *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__UpdateUserRequest_Closure)
                 (const Kentik__User__V202211__UpdateUserRequest *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__UpdateUserResponse_Closure)
                 (const Kentik__User__V202211__UpdateUserResponse *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__DeleteUserRequest_Closure)
                 (const Kentik__User__V202211__DeleteUserRequest *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__DeleteUserResponse_Closure)
                 (const Kentik__User__V202211__DeleteUserResponse *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__ResetApiTokenRequest_Closure)
                 (const Kentik__User__V202211__ResetApiTokenRequest *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__ResetApiTokenResponse_Closure)
                 (const Kentik__User__V202211__ResetApiTokenResponse *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__ResetActiveSessionsRequest_Closure)
                 (const Kentik__User__V202211__ResetActiveSessionsRequest *message,
                  void *closure_data);
typedef void (*Kentik__User__V202211__ResetActiveSessionsResponse_Closure)
                 (const Kentik__User__V202211__ResetActiveSessionsResponse *message,
                  void *closure_data);

/* --- services --- */

typedef struct Kentik__User__V202211__UserService_Service Kentik__User__V202211__UserService_Service;
struct Kentik__User__V202211__UserService_Service
{
  ProtobufCService base;
  void (*list_users)(Kentik__User__V202211__UserService_Service *service,
                     const Kentik__User__V202211__ListUsersRequest *input,
                     Kentik__User__V202211__ListUsersResponse_Closure closure,
                     void *closure_data);
  void (*get_user)(Kentik__User__V202211__UserService_Service *service,
                   const Kentik__User__V202211__GetUserRequest *input,
                   Kentik__User__V202211__GetUserResponse_Closure closure,
                   void *closure_data);
  void (*create_user)(Kentik__User__V202211__UserService_Service *service,
                      const Kentik__User__V202211__CreateUserRequest *input,
                      Kentik__User__V202211__CreateUserResponse_Closure closure,
                      void *closure_data);
  void (*update_user)(Kentik__User__V202211__UserService_Service *service,
                      const Kentik__User__V202211__UpdateUserRequest *input,
                      Kentik__User__V202211__UpdateUserResponse_Closure closure,
                      void *closure_data);
  void (*delete_user)(Kentik__User__V202211__UserService_Service *service,
                      const Kentik__User__V202211__DeleteUserRequest *input,
                      Kentik__User__V202211__DeleteUserResponse_Closure closure,
                      void *closure_data);
  void (*reset_api_token)(Kentik__User__V202211__UserService_Service *service,
                          const Kentik__User__V202211__ResetApiTokenRequest *input,
                          Kentik__User__V202211__ResetApiTokenResponse_Closure closure,
                          void *closure_data);
  void (*reset_active_sessions)(Kentik__User__V202211__UserService_Service *service,
                                const Kentik__User__V202211__ResetActiveSessionsRequest *input,
                                Kentik__User__V202211__ResetActiveSessionsResponse_Closure closure,
                                void *closure_data);
};
typedef void (*Kentik__User__V202211__UserService_ServiceDestroy)(Kentik__User__V202211__UserService_Service *);
void kentik__user__v202211__user_service__init (Kentik__User__V202211__UserService_Service *service,
                                                Kentik__User__V202211__UserService_ServiceDestroy destroy);
#define KENTIK__USER__V202211__USER_SERVICE__BASE_INIT \
    { &kentik__user__v202211__user_service__descriptor, protobuf_c_service_invoke_internal, NULL }
#define KENTIK__USER__V202211__USER_SERVICE__INIT(function_prefix__) \
    { KENTIK__USER__V202211__USER_SERVICE__BASE_INIT,\
      function_prefix__ ## list_users,\
      function_prefix__ ## get_user,\
      function_prefix__ ## create_user,\
      function_prefix__ ## update_user,\
      function_prefix__ ## delete_user,\
      function_prefix__ ## reset_api_token,\
      function_prefix__ ## reset_active_sessions  }
void kentik__user__v202211__user_service__list_users(ProtobufCService *service,
                                                     const Kentik__User__V202211__ListUsersRequest *input,
                                                     Kentik__User__V202211__ListUsersResponse_Closure closure,
                                                     void *closure_data);
void kentik__user__v202211__user_service__get_user(ProtobufCService *service,
                                                   const Kentik__User__V202211__GetUserRequest *input,
                                                   Kentik__User__V202211__GetUserResponse_Closure closure,
                                                   void *closure_data);
void kentik__user__v202211__user_service__create_user(ProtobufCService *service,
                                                      const Kentik__User__V202211__CreateUserRequest *input,
                                                      Kentik__User__V202211__CreateUserResponse_Closure closure,
                                                      void *closure_data);
void kentik__user__v202211__user_service__update_user(ProtobufCService *service,
                                                      const Kentik__User__V202211__UpdateUserRequest *input,
                                                      Kentik__User__V202211__UpdateUserResponse_Closure closure,
                                                      void *closure_data);
void kentik__user__v202211__user_service__delete_user(ProtobufCService *service,
                                                      const Kentik__User__V202211__DeleteUserRequest *input,
                                                      Kentik__User__V202211__DeleteUserResponse_Closure closure,
                                                      void *closure_data);
void kentik__user__v202211__user_service__reset_api_token(ProtobufCService *service,
                                                          const Kentik__User__V202211__ResetApiTokenRequest *input,
                                                          Kentik__User__V202211__ResetApiTokenResponse_Closure closure,
                                                          void *closure_data);
void kentik__user__v202211__user_service__reset_active_sessions(ProtobufCService *service,
                                                                const Kentik__User__V202211__ResetActiveSessionsRequest *input,
                                                                Kentik__User__V202211__ResetActiveSessionsResponse_Closure closure,
                                                                void *closure_data);

/* --- descriptors --- */

extern const ProtobufCEnumDescriptor    kentik__user__v202211__role__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__permission_entry__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__user__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__list_users_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__list_users_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__get_user_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__get_user_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__create_user_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__create_user_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__update_user_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__update_user_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__delete_user_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__delete_user_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__reset_api_token_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__reset_api_token_response__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__reset_active_sessions_request__descriptor;
extern const ProtobufCMessageDescriptor kentik__user__v202211__reset_active_sessions_response__descriptor;
extern const ProtobufCServiceDescriptor kentik__user__v202211__user_service__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_kentik_2fuser_2fv202211_2fuser_2eproto__INCLUDED */
