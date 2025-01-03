
�x
google/api/http.proto
google.api"y
Http*
rules (2.google.api.HttpRuleRrulesE
fully_decode_reserved_expansion (RfullyDecodeReservedExpansion"�
HttpRule
selector (	Rselector
get (	H Rget
put (	H Rput
post (	H Rpost
delete (	H Rdelete
patch (	H Rpatch7
custom (2.google.api.CustomHttpPatternH Rcustom
body (	Rbody#
response_body (	RresponseBodyE
additional_bindings (2.google.api.HttpRuleRadditionalBindingsB	
pattern";
CustomHttpPattern
kind (	Rkind
path (	RpathBj
com.google.apiB	HttpProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations��GAPIJ�s
 �
�
 2� Copyright 2023 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 

 
	
 

 X
	
 X

 "
	

 "

 *
	
 *

 '
	
 '

 "
	
$ "
�
  )� Defines the HTTP configuration for an API service. It contains a list of
 [HttpRule][google.api.HttpRule], each specifying the mapping of an RPC method
 to one or more HTTP REST API methods.



 
�
   � A list of HTTP configuration rules that apply to individual API methods.

 **NOTE:** All service configuration rules follow "last one wins" order.


   


   

   

   
�
 (+� When set to true, URL path parameters will be fully URI-decoded except in
 cases of single segment matches in reserved expansion, where "%2F" will be
 left encoded.

 The default behavior is to not decode RFC 6570 reserved characters in multi
 segment matches.


 (

 (&

 ()*
�S
� ��S # gRPC Transcoding

 gRPC Transcoding is a feature for mapping between a gRPC method and one or
 more HTTP REST endpoints. It allows developers to build a single API service
 that supports both gRPC APIs and REST APIs. Many systems, including [Google
 APIs](https://github.com/googleapis/googleapis),
 [Cloud Endpoints](https://cloud.google.com/endpoints), [gRPC
 Gateway](https://github.com/grpc-ecosystem/grpc-gateway),
 and [Envoy](https://github.com/envoyproxy/envoy) proxy support this feature
 and use it for large scale production services.

 `HttpRule` defines the schema of the gRPC/REST mapping. The mapping specifies
 how different portions of the gRPC request message are mapped to the URL
 path, URL query parameters, and HTTP request body. It also controls how the
 gRPC response message is mapped to the HTTP response body. `HttpRule` is
 typically specified as an `google.api.http` annotation on the gRPC method.

 Each mapping specifies a URL path template and an HTTP method. The path
 template may refer to one or more fields in the gRPC request message, as long
 as each field is a non-repeated field with a primitive (non-message) type.
 The path template controls how fields of the request message are mapped to
 the URL path.

 Example:

     service Messaging {
       rpc GetMessage(GetMessageRequest) returns (Message) {
         option (google.api.http) = {
             get: "/v1/{name=messages/*}"
         };
       }
     }
     message GetMessageRequest {
       string name = 1; // Mapped to URL path.
     }
     message Message {
       string text = 1; // The resource content.
     }

 This enables an HTTP REST to gRPC mapping as below:

 HTTP | gRPC
 -----|-----
 `GET /v1/messages/123456`  | `GetMessage(name: "messages/123456")`

 Any fields in the request message which are not bound by the path template
 automatically become HTTP query parameters if there is no HTTP request body.
 For example:

     service Messaging {
       rpc GetMessage(GetMessageRequest) returns (Message) {
         option (google.api.http) = {
             get:"/v1/messages/{message_id}"
         };
       }
     }
     message GetMessageRequest {
       message SubMessage {
         string subfield = 1;
       }
       string message_id = 1; // Mapped to URL path.
       int64 revision = 2;    // Mapped to URL query parameter `revision`.
       SubMessage sub = 3;    // Mapped to URL query parameter `sub.subfield`.
     }

 This enables a HTTP JSON to RPC mapping as below:

 HTTP | gRPC
 -----|-----
 `GET /v1/messages/123456?revision=2&sub.subfield=foo` |
 `GetMessage(message_id: "123456" revision: 2 sub: SubMessage(subfield:
 "foo"))`

 Note that fields which are mapped to URL query parameters must have a
 primitive type or a repeated primitive type or a non-repeated message type.
 In the case of a repeated type, the parameter can be repeated in the URL
 as `...?param=A&param=B`. In the case of a message type, each field of the
 message is mapped to a separate parameter, such as
 `...?foo.a=A&foo.b=B&foo.c=C`.

 For HTTP methods that allow a request body, the `body` field
 specifies the mapping. Consider a REST update method on the
 message resource collection:

     service Messaging {
       rpc UpdateMessage(UpdateMessageRequest) returns (Message) {
         option (google.api.http) = {
           patch: "/v1/messages/{message_id}"
           body: "message"
         };
       }
     }
     message UpdateMessageRequest {
       string message_id = 1; // mapped to the URL
       Message message = 2;   // mapped to the body
     }

 The following HTTP JSON to RPC mapping is enabled, where the
 representation of the JSON in the request body is determined by
 protos JSON encoding:

 HTTP | gRPC
 -----|-----
 `PATCH /v1/messages/123456 { "text": "Hi!" }` | `UpdateMessage(message_id:
 "123456" message { text: "Hi!" })`

 The special name `*` can be used in the body mapping to define that
 every field not bound by the path template should be mapped to the
 request body.  This enables the following alternative definition of
 the update method:

     service Messaging {
       rpc UpdateMessage(Message) returns (Message) {
         option (google.api.http) = {
           patch: "/v1/messages/{message_id}"
           body: "*"
         };
       }
     }
     message Message {
       string message_id = 1;
       string text = 2;
     }


 The following HTTP JSON to RPC mapping is enabled:

 HTTP | gRPC
 -----|-----
 `PATCH /v1/messages/123456 { "text": "Hi!" }` | `UpdateMessage(message_id:
 "123456" text: "Hi!")`

 Note that when using `*` in the body mapping, it is not possible to
 have HTTP parameters, as all fields not bound by the path end in
 the body. This makes this option more rarely used in practice when
 defining REST APIs. The common usage of `*` is in custom methods
 which don't use the URL at all for transferring data.

 It is possible to define multiple HTTP methods for one RPC by using
 the `additional_bindings` option. Example:

     service Messaging {
       rpc GetMessage(GetMessageRequest) returns (Message) {
         option (google.api.http) = {
           get: "/v1/messages/{message_id}"
           additional_bindings {
             get: "/v1/users/{user_id}/messages/{message_id}"
           }
         };
       }
     }
     message GetMessageRequest {
       string message_id = 1;
       string user_id = 2;
     }

 This enables the following two alternative HTTP JSON to RPC mappings:

 HTTP | gRPC
 -----|-----
 `GET /v1/messages/123456` | `GetMessage(message_id: "123456")`
 `GET /v1/users/me/messages/123456` | `GetMessage(user_id: "me" message_id:
 "123456")`

 ## Rules for HTTP mapping

 1. Leaf request fields (recursive expansion nested messages in the request
    message) are classified into three categories:
    - Fields referred by the path template. They are passed via the URL path.
    - Fields referred by the [HttpRule.body][google.api.HttpRule.body]. They
    are passed via the HTTP
      request body.
    - All other fields are passed via the URL query parameters, and the
      parameter name is the field path in the request message. A repeated
      field can be represented as multiple query parameters under the same
      name.
  2. If [HttpRule.body][google.api.HttpRule.body] is "*", there is no URL
  query parameter, all fields
     are passed via URL path and HTTP request body.
  3. If [HttpRule.body][google.api.HttpRule.body] is omitted, there is no HTTP
  request body, all
     fields are passed via URL path and URL query parameters.

 ### Path template syntax

     Template = "/" Segments [ Verb ] ;
     Segments = Segment { "/" Segment } ;
     Segment  = "*" | "**" | LITERAL | Variable ;
     Variable = "{" FieldPath [ "=" Segments ] "}" ;
     FieldPath = IDENT { "." IDENT } ;
     Verb     = ":" LITERAL ;

 The syntax `*` matches a single URL path segment. The syntax `**` matches
 zero or more URL path segments, which must be the last part of the URL path
 except the `Verb`.

 The syntax `Variable` matches part of the URL path as specified by its
 template. A variable template must not contain other variables. If a variable
 matches a single path segment, its template may be omitted, e.g. `{var}`
 is equivalent to `{var=*}`.

 The syntax `LITERAL` matches literal text in the URL path. If the `LITERAL`
 contains any reserved character, such characters should be percent-encoded
 before the matching.

 If a variable contains exactly one path segment, such as `"{var}"` or
 `"{var=*}"`, when such a variable is expanded into a URL path on the client
 side, all characters except `[-_.~0-9a-zA-Z]` are percent-encoded. The
 server side does the reverse decoding. Such variables show up in the
 [Discovery
 Document](https://developers.google.com/discovery/v1/reference/apis) as
 `{var}`.

 If a variable contains multiple path segments, such as `"{var=foo/*}"`
 or `"{var=**}"`, when such a variable is expanded into a URL path on the
 client side, all characters except `[-_.~/0-9a-zA-Z]` are percent-encoded.
 The server side does the reverse decoding, except "%2F" and "%2f" are left
 unchanged. Such variables show up in the
 [Discovery
 Document](https://developers.google.com/discovery/v1/reference/apis) as
 `{+var}`.

 ## Using gRPC API Service Configuration

 gRPC API Service Configuration (service config) is a configuration language
 for configuring a gRPC service to become a user-facing product. The
 service config is simply the YAML representation of the `google.api.Service`
 proto message.

 As an alternative to annotating your proto file, you can configure gRPC
 transcoding in your service config YAML files. You do this by specifying a
 `HttpRule` that maps the gRPC method to a REST endpoint, achieving the same
 effect as the proto annotation. This can be particularly useful if you
 have a proto that is reused in multiple services. Note that any transcoding
 specified in the service config will override any matching transcoding
 configuration in the proto.

 Example:

     http:
       rules:
         # Selects a gRPC method and applies HttpRule to it.
         - selector: example.v1.Messaging.GetMessage
           get: /v1/messages/{message_id}/{sub.subfield}

 ## Special notes

 When gRPC Transcoding is used to map a gRPC to JSON REST endpoints, the
 proto to JSON conversion must follow the [proto3
 specification](https://developers.google.com/protocol-buffers/docs/proto3#json).

 While the single segment variable follows the semantics of
 [RFC 6570](https://tools.ietf.org/html/rfc6570) Section 3.2.2 Simple String
 Expansion, the multi segment variable **does not** follow RFC 6570 Section
 3.2.3 Reserved Expansion. The reason is that the Reserved Expansion
 does not expand special characters like `?` and `#`, which would lead
 to invalid URLs. As the result, gRPC Transcoding uses a custom encoding
 for multi segment variables.

 The path variables **must not** refer to any repeated or mapped field,
 because client libraries are not capable of handling such variable expansion.

 The path variables **must not** capture the leading "/" character. The reason
 is that the most common use case "{var}" does not capture the leading "/"
 character. For consistency, all path variables must share the same behavior.

 Repeated message fields must not be mapped to URL query parameters, because
 no client library can support such complicated mapping.

 If an API needs to use a JSON array for request or response body, it can map
 the request or response body to a repeated field. However, some gRPC
 Transcoding implementations may not support this feature.


�
�
 �� Selects a method to which this rule applies.

 Refer to [selector][google.api.DocumentationRule.selector] for syntax
 details.


 �

 �	

 �
�
 ��� Determines the URL pattern is matched by this rules. This pattern can be
 used with any of the {get|put|post|delete|patch} methods. A custom method
 can be defined using the 'custom' field.


 �
\
�N Maps to HTTP GET. Used for listing and getting information about
 resources.


�


�

�
@
�2 Maps to HTTP PUT. Used for replacing a resource.


�


�

�
X
�J Maps to HTTP POST. Used for creating a resource or performing an action.


�


�

�
B
�4 Maps to HTTP DELETE. Used for deleting a resource.


�


�

�
A
�3 Maps to HTTP PATCH. Used for updating a resource.


�


�

�
�
�!� The custom pattern is used for specifying an HTTP method that is not
 included in the `pattern` field, such as HEAD, or "*" to leave the
 HTTP method unspecified for this rule. The wild-card rule is useful
 for services that provide content to Web (HTML) clients.


�

�

� 
�
�� The name of the request field whose value is mapped to the HTTP request
 body, or `*` for mapping all request fields not captured by the path
 pattern to the HTTP body, or omitted for not having any HTTP request body.

 NOTE: the referred field must be present at the top-level of the request
 message type.


�

�	

�
�
�� Optional. The name of the response field whose value is mapped to the HTTP
 response body. When omitted, the entire response message will be used
 as the HTTP response body.

 NOTE: The referred field must be present at the top-level of the response
 message type.


�

�	

�
�
	�-� Additional HTTP bindings for the selector. Nested bindings must
 not contain an `additional_bindings` field themselves (that is,
 the nesting may only be one level deep).


	�


	�

	�'

	�*,
G
� �9 A custom pattern is used for defining custom HTTP verb.


�
2
 �$ The name of this custom HTTP verb.


 �

 �	

 �
5
�' The path matched by this custom verb.


�

�	

�bproto3�� 
��
 google/protobuf/descriptor.protogoogle.protobuf"M
FileDescriptorSet8
file (2$.google.protobuf.FileDescriptorProtoRfile"�
FileDescriptorProto
name (	Rname
package (	Rpackage

dependency (	R
dependency+
public_dependency
 (RpublicDependency'
weak_dependency (RweakDependencyC
message_type (2 .google.protobuf.DescriptorProtoRmessageTypeA
	enum_type (2$.google.protobuf.EnumDescriptorProtoRenumTypeA
service (2'.google.protobuf.ServiceDescriptorProtoRserviceC
	extension (2%.google.protobuf.FieldDescriptorProtoR	extension6
options (2.google.protobuf.FileOptionsRoptionsI
source_code_info	 (2.google.protobuf.SourceCodeInfoRsourceCodeInfo
syntax (	Rsyntax
edition (	Redition"�
DescriptorProto
name (	Rname;
field (2%.google.protobuf.FieldDescriptorProtoRfieldC
	extension (2%.google.protobuf.FieldDescriptorProtoR	extensionA
nested_type (2 .google.protobuf.DescriptorProtoR
nestedTypeA
	enum_type (2$.google.protobuf.EnumDescriptorProtoRenumTypeX
extension_range (2/.google.protobuf.DescriptorProto.ExtensionRangeRextensionRangeD

oneof_decl (2%.google.protobuf.OneofDescriptorProtoR	oneofDecl9
options (2.google.protobuf.MessageOptionsRoptionsU
reserved_range	 (2..google.protobuf.DescriptorProto.ReservedRangeRreservedRange#
reserved_name
 (	RreservedNamez
ExtensionRange
start (Rstart
end (Rend@
options (2&.google.protobuf.ExtensionRangeOptionsRoptions7
ReservedRange
start (Rstart
end (Rend"�
ExtensionRangeOptionsX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOptionY
declaration (22.google.protobuf.ExtensionRangeOptions.DeclarationB�Rdeclaration�
Declaration
number (Rnumber
	full_name (	RfullName
type (	Rtype
is_repeated (R
isRepeated
reserved (Rreserved*	�����"�
FieldDescriptorProto
name (	Rname
number (RnumberA
label (2+.google.protobuf.FieldDescriptorProto.LabelRlabel>
type (2*.google.protobuf.FieldDescriptorProto.TypeRtype
	type_name (	RtypeName
extendee (	Rextendee#
default_value (	RdefaultValue
oneof_index	 (R
oneofIndex
	json_name
 (	RjsonName7
options (2.google.protobuf.FieldOptionsRoptions'
proto3_optional (Rproto3Optional"�
Type
TYPE_DOUBLE

TYPE_FLOAT

TYPE_INT64
TYPE_UINT64

TYPE_INT32
TYPE_FIXED64
TYPE_FIXED32
	TYPE_BOOL
TYPE_STRING	

TYPE_GROUP

TYPE_MESSAGE

TYPE_BYTES
TYPE_UINT32
	TYPE_ENUM
TYPE_SFIXED32
TYPE_SFIXED64
TYPE_SINT32
TYPE_SINT64"C
Label
LABEL_OPTIONAL
LABEL_REQUIRED
LABEL_REPEATED"c
OneofDescriptorProto
name (	Rname7
options (2.google.protobuf.OneofOptionsRoptions"�
EnumDescriptorProto
name (	Rname?
value (2).google.protobuf.EnumValueDescriptorProtoRvalue6
options (2.google.protobuf.EnumOptionsRoptions]
reserved_range (26.google.protobuf.EnumDescriptorProto.EnumReservedRangeRreservedRange#
reserved_name (	RreservedName;
EnumReservedRange
start (Rstart
end (Rend"�
EnumValueDescriptorProto
name (	Rname
number (Rnumber;
options (2!.google.protobuf.EnumValueOptionsRoptions"�
ServiceDescriptorProto
name (	Rname>
method (2&.google.protobuf.MethodDescriptorProtoRmethod9
options (2.google.protobuf.ServiceOptionsRoptions"�
MethodDescriptorProto
name (	Rname

input_type (	R	inputType
output_type (	R
outputType8
options (2.google.protobuf.MethodOptionsRoptions0
client_streaming (:falseRclientStreaming0
server_streaming (:falseRserverStreaming"�	
FileOptions!
java_package (	RjavaPackage0
java_outer_classname (	RjavaOuterClassname5
java_multiple_files
 (:falseRjavaMultipleFilesD
java_generate_equals_and_hash (BRjavaGenerateEqualsAndHash:
java_string_check_utf8 (:falseRjavaStringCheckUtf8S
optimize_for	 (2).google.protobuf.FileOptions.OptimizeMode:SPEEDRoptimizeFor

go_package (	R	goPackage5
cc_generic_services (:falseRccGenericServices9
java_generic_services (:falseRjavaGenericServices5
py_generic_services (:falseRpyGenericServices7
php_generic_services* (:falseRphpGenericServices%

deprecated (:falseR
deprecated.
cc_enable_arenas (:trueRccEnableArenas*
objc_class_prefix$ (	RobjcClassPrefix)
csharp_namespace% (	RcsharpNamespace!
swift_prefix' (	RswiftPrefix(
php_class_prefix( (	RphpClassPrefix#
php_namespace) (	RphpNamespace4
php_metadata_namespace, (	RphpMetadataNamespace!
ruby_package- (	RrubyPackageX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption":
OptimizeMode	
SPEED
	CODE_SIZE
LITE_RUNTIME*	�����J&'"�
MessageOptions<
message_set_wire_format (:falseRmessageSetWireFormatL
no_standard_descriptor_accessor (:falseRnoStandardDescriptorAccessor%

deprecated (:falseR
deprecated
	map_entry (RmapEntryV
&deprecated_legacy_json_field_conflicts (BR"deprecatedLegacyJsonFieldConflictsX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����JJJJ	J	
"�	
FieldOptionsA
ctype (2#.google.protobuf.FieldOptions.CType:STRINGRctype
packed (RpackedG
jstype (2$.google.protobuf.FieldOptions.JSType:	JS_NORMALRjstype
lazy (:falseRlazy.
unverified_lazy (:falseRunverifiedLazy%

deprecated (:falseR
deprecated
weak
 (:falseRweak(
debug_redact (:falseRdebugRedactK
	retention (2-.google.protobuf.FieldOptions.OptionRetentionR	retentionJ
target (2..google.protobuf.FieldOptions.OptionTargetTypeBRtargetH
targets (2..google.protobuf.FieldOptions.OptionTargetTypeRtargetsX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption"/
CType

STRING 
CORD
STRING_PIECE"5
JSType
	JS_NORMAL 
	JS_STRING
	JS_NUMBER"U
OptionRetention
RETENTION_UNKNOWN 
RETENTION_RUNTIME
RETENTION_SOURCE"�
OptionTargetType
TARGET_TYPE_UNKNOWN 
TARGET_TYPE_FILE
TARGET_TYPE_EXTENSION_RANGE
TARGET_TYPE_MESSAGE
TARGET_TYPE_FIELD
TARGET_TYPE_ONEOF
TARGET_TYPE_ENUM
TARGET_TYPE_ENUM_ENTRY
TARGET_TYPE_SERVICE
TARGET_TYPE_METHOD	*	�����J"s
OneofOptionsX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����"�
EnumOptions
allow_alias (R
allowAlias%

deprecated (:falseR
deprecatedV
&deprecated_legacy_json_field_conflicts (BR"deprecatedLegacyJsonFieldConflictsX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����J"�
EnumValueOptions%

deprecated (:falseR
deprecatedX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����"�
ServiceOptions%

deprecated! (:falseR
deprecatedX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����"�
MethodOptions%

deprecated! (:falseR
deprecatedq
idempotency_level" (2/.google.protobuf.MethodOptions.IdempotencyLevel:IDEMPOTENCY_UNKNOWNRidempotencyLevelX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption"P
IdempotencyLevel
IDEMPOTENCY_UNKNOWN 
NO_SIDE_EFFECTS

IDEMPOTENT*	�����"�
UninterpretedOptionA
name (2-.google.protobuf.UninterpretedOption.NamePartRname)
identifier_value (	RidentifierValue,
positive_int_value (RpositiveIntValue,
negative_int_value (RnegativeIntValue!
double_value (RdoubleValue!
string_value (RstringValue'
aggregate_value (	RaggregateValueJ
NamePart
	name_part (	RnamePart!
is_extension (RisExtension"�
SourceCodeInfoD
location (2(.google.protobuf.SourceCodeInfo.LocationRlocation�
Location
path (BRpath
span (BRspan)
leading_comments (	RleadingComments+
trailing_comments (	RtrailingComments:
leading_detached_comments (	RleadingDetachedComments"�
GeneratedCodeInfoM

annotation (2-.google.protobuf.GeneratedCodeInfo.AnnotationR
annotation�

Annotation
path (BRpath
source_file (	R
sourceFile
begin (Rbegin
end (RendR
semantic (26.google.protobuf.GeneratedCodeInfo.Annotation.SemanticRsemantic"(
Semantic
NONE 
SET	
ALIASB~
com.google.protobufBDescriptorProtosHZ-google.golang.org/protobuf/types/descriptorpb��GPB�Google.Protobuf.ReflectionJ��
& �
�
& 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
2� Author: kenton@google.com (Kenton Varda)
  Based on original Protocol Buffers design by
  Sanjay Ghemawat, Jeff Dean, and others.

 The messages in this file describe the definitions found in .proto files.
 A valid .proto file can be translated directly to a FileDescriptorProto
 without any other information (e.g. without reading its imports).


( 

* D
	
* D

+ ,
	
+ ,

, 1
	
, 1

- 7
	
%- 7

. !
	
$. !

/ 
	
/ 

3 

	3 t descriptor.proto must be optimized for speed because reflection-based
 algorithms don't work during bootstrapping.

j
 7 9^ The protocol compiler can output a FileDescriptorSet containing the .proto
 files it parses.



 7

  8(

  8


  8

  8#

  8&'
/
< ^# Describes a complete .proto file.



<
9
 =", file name, relative to root of source tree


 =


 =

 =

 =
*
>" e.g. "foo", "foo.bar", etc.


>


>

>

>
4
A!' Names of files imported by this file.


A


A

A

A 
Q
C(D Indexes of the public imported files in the dependency list above.


C


C

C"

C%'
z
F&m Indexes of the weak imported files in the dependency list.
 For Google-internal migration only. Do not use.


F


F

F 

F#%
6
I,) All top-level definitions in this file.


I


I

I'

I*+

J-

J


J

J(

J+,

K.

K


K!

K")

K,-

L.

L


L

L )

L,-

	N#

	N


	N

	N

	N!"
�

T/� This field contains optional information about the original source code.
 You may safely remove this entire field without harming runtime
 functionality of the descriptors -- the information is needed only by
 development tools.



T



T


T*


T-.
�
Z� The syntax of the proto file.
 The supported values are "proto2", "proto3", and "editions".

 If `edition` is present, this value must be "editions".


Z


Z

Z

Z
H
]; The edition of the proto file, which is an opaque string.


]


]

]

]
(
a � Describes a message type.



a

 b

 b


 b

 b

 b

d*

d


d

d %

d()

e.

e


e

e )

e,-

g+

g


g

g&

g)*

h-

h


h

h(

h+,

 jo

 j


  k" Inclusive.


  k

  k

  k

  k

 l" Exclusive.


 l

 l

 l

 l

 n/

 n

 n"

 n#*

 n-.

p.

p


p

p)

p,-

r/

r


r

r *

r-.

t&

t


t

t!

t$%
�
y|� Range of reserved tag numbers. Reserved tag numbers may not be used by
 fields or extension ranges in the same message. Reserved ranges may
 not overlap.


y


 z" Inclusive.


 z

 z

 z

 z

{" Exclusive.


{

{

{

{

},

}


}

}'

}*+
�
	�%u Reserved field names, which may not be used by fields in the same message.
 A given name may only be reserved once.


	�


	�

	�

	�"$

� �

�
O
 �:A The parser stores options it doesn't recognize here. See above.


 �


 �

 �3

 �69

 ��

 �

K
  �; The extension number declared within the extension range.


  �

  �

  �

  �
z
 �"j The fully-qualified name of the extension field. There must be a leading
 dot in front of the full name.


 �

 �

 �

 � !
�
 �� The fully-qualified type name of the extension field. Unlike
 Metadata.type, Declaration.type must have a leading dot for messages
 and enums.


 �

 �

 �

 �
�
 �"z If true, indicates that the extension must be defined as repeated.
 Otherwise the extension must be defined as optional.


 �

 �

 �

 � !
�
 �� If true, indicates that the number is reserved in the extension range,
 and any extension field with the number will fail to compile. Set this
 when a declared extension field is deleted.


 �

 �

 �

 �
�
�F� go/protobuf-stripping-extension-declarations
 Like Metadata, but we use a repeated field to hold all extension
 declarations. This should avoid the size increases of transforming a large
 extension range into small ranges in generated binaries.


�


�

�"

�%&

�'E

�(D
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �
3
� �% Describes a field within a message.


�

 ��

 �
S
  �C 0 is reserved for errors.
 Order is weird for historical reasons.


  �

  �

 �

 �

 �
w
 �g Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT64 if
 negative values are likely.


 �

 �

 �

 �

 �
w
 �g Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT32 if
 negative values are likely.


 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �
�
 	�� Tag-delimited aggregate.
 Group type is deprecated and not supported in proto3. However, Proto3
 implementations should still be able to parse the group wire format and
 treat group fields as unknown fields.


 	�

 	�
-
 
�" Length-delimited aggregate.


 
�

 
�
#
 � New in version 2.


 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �
'
 �" Uses ZigZag encoding.


 �

 �
'
 �" Uses ZigZag encoding.


 �

 �

��

�
*
 � 0 is reserved for errors


 �

 �

�

�

�

�

�

�

 �

 �


 �

 �

 �

�

�


�

�

�

�

�


�

�

�
�
�� If type_name is set, this need not be set.  If both this and type_name
 are set, this must be one of TYPE_ENUM, TYPE_MESSAGE or TYPE_GROUP.


�


�

�

�
�
� � For message and enum types, this is the name of the type.  If the name
 starts with a '.', it is fully-qualified.  Otherwise, C++-like scoping
 rules are used to find the type (i.e. first the nested types within this
 message are searched, then within the parent, on up to the root
 namespace).


�


�

�

�
~
�p For extensions, this is the name of the type being extended.  It is
 resolved in the same manner as type_name.


�


�

�

�
�
�$� For numeric types, contains the original text representation of the value.
 For booleans, "true" or "false".
 For strings, contains the default text contents (not escaped in any way).
 For bytes, contains the C escaped value.  All bytes >= 128 are escaped.


�


�

�

�"#
�
�!v If set, gives the index of a oneof in the containing type's oneof_decl
 list.  This field is a member of that oneof.


�


�

�

� 
�
�!� JSON name of this field. The value is set by protocol compiler. If the
 user has set a "json_name" option on this field, that option's value
 will be used. Otherwise, it's deduced from the field's name by converting
 it to camelCase.


�


�

�

� 

	�$

	�


	�

	�

	�"#
�	

�%�	 If true, this is a proto3 "optional". When a proto3 field is optional, it
 tracks presence regardless of field type.

 When proto3_optional is true, this field must be belong to a oneof to
 signal to old proto3 clients that presence is tracked for this field. This
 oneof is known as a "synthetic" oneof, and this field must be its sole
 member (each proto3 optional field gets its own synthetic oneof). Synthetic
 oneofs exist in the descriptor only, and do not generate any API. Synthetic
 oneofs must be ordered after all "real" oneofs.

 For message fields, proto3_optional doesn't create any semantic change,
 since non-repeated message fields always track presence. However it still
 indicates the semantic detail of whether the user wrote "optional" or not.
 This can be useful for round-tripping the .proto file. For consistency we
 give message fields a synthetic oneof also, even though it is not required
 to track presence. This is especially important because the parser can't
 tell if a field is a message or an enum, so it must always create a
 synthetic oneof.

 Proto2 optional fields do not set this flag, because they already indicate
 optional with `LABEL_OPTIONAL`.



�



�


�


�"$
"
� � Describes a oneof.


�

 �

 �


 �

 �

 �

�$

�


�

�

�"#
'
� � Describes an enum type.


�

 �

 �


 �

 �

 �

�.

�


�#

�$)

�,-

�#

�


�

�

�!"
�
 ��� Range of reserved numeric values. Reserved values may not be used by
 entries in the same enum. Reserved ranges may not overlap.

 Note that this is distinct from DescriptorProto.ReservedRange in that it
 is inclusive such that it can appropriately represent the entire int32
 domain.


 �


  �" Inclusive.


  �

  �

  �

  �

 �" Inclusive.


 �

 �

 �

 �
�
�0� Range of reserved numeric values. Reserved numeric values may not be used
 by enum values in the same enum declaration. Reserved ranges may not
 overlap.


�


�

�+

�./
l
�$^ Reserved enum value names, which may not be reused. A given name may only
 be reserved once.


�


�

�

�"#
1
� �# Describes a value within an enum.


� 

 �

 �


 �

 �

 �

�

�


�

�

�

�(

�


�

�#

�&'
$
� � Describes a service.


�

 �

 �


 �

 �

 �

�,

�


� 

�!'

�*+

�&

�


�

�!

�$%
0
	� �" Describes a method of a service.


	�

	 �

	 �


	 �

	 �

	 �
�
	�!� Input and output type names.  These are resolved in the same way as
 FieldDescriptorProto.type_name, but must refer to a message type.


	�


	�

	�

	� 

	�"

	�


	�

	�

	� !

	�%

	�


	�

	� 

	�#$
E
	�77 Identifies if client streams multiple client messages


	�


	�

	� 

	�#$

	�%6

	�&5
E
	�77 Identifies if server streams multiple server messages


	�


	�

	� 

	�#$

	�%6

	�&5
�

� �2N ===================================================================
 Options
2� Each of the definitions above may have "options" attached.  These are
 just annotations which may cause code to be generated slightly differently
 or may contain hints for code that manipulates protocol messages.

 Clients may define custom options as extensions of the *Options messages.
 These extensions may not yet be known at parsing time, so the parser cannot
 store the values in them.  Instead it stores them in a field in the *Options
 message called uninterpreted_option. This field must have the same name
 across all *Options messages. We then use this field to populate the
 extensions when we build a descriptor, at which point all protos have been
 parsed and so all extensions are known.

 Extension numbers for custom options may be chosen as follows:
 * For options which will only be used within a single application or
   organization, or for experimental options, use field numbers 50000
   through 99999.  It is up to you to ensure that you do not use the
   same number for multiple options.
 * For options which will be published and used publicly by multiple
   independent entities, e-mail protobuf-global-extension-registry@google.com
   to reserve extension numbers. Simply provide your project name (e.g.
   Objective-C plugin) and your project website (if available) -- there's no
   need to explain how you intend to use them. Usually you only need one
   extension number. You can declare multiple options with only one extension
   number by putting them in a sub-message. See the Custom Options section of
   the docs for examples:
   https://developers.google.com/protocol-buffers/docs/proto#options
   If this turns out to be popular, a web service will be set up
   to automatically assign option numbers.



�
�

 �#� Sets the Java package where classes generated from this .proto will be
 placed.  By default, the proto package is used, but this is often
 inappropriate because proto packages do not normally start with backwards
 domain names.



 �



 �


 �


 �!"
�

�+� Controls the name of the wrapper Java class generated for the .proto file.
 That class will always contain the .proto file's getDescriptor() method as
 well as any top-level extensions defined in the .proto file.
 If java_multiple_files is disabled, then all the other classes from the
 .proto file will be nested inside the single wrapper outer class.



�



�


�&


�)*
�

�;� If enabled, then the Java code generator will generate a separate .java
 file for each top-level message, enum, and service defined in the .proto
 file.  Thus, these types will *not* be nested inside the wrapper class
 named by java_outer_classname.  However, the wrapper class will still be
 generated to contain the file's getDescriptor() method as well as any
 top-level extensions defined in the file.



�



�


�#


�&(


�):


�*9
)

�E This option does nothing.



�



�


�-


�02


�3D


�4C
�

�>� If set true, then the Java2 code generator will generate code that
 throws an exception whenever an attempt is made to assign a non-UTF-8
 byte sequence to a string field.
 Message reflection will do the same.
 However, an extension field still accepts non-UTF-8 byte sequences.
 This option has no effect on when used with the lite runtime.



�



�


�&


�)+


�,=


�-<
L

 ��< Generated classes can be optimized for speed or code size.



 �
D

  �"4 Generate complete code for parsing, serialization,



  �	


  �
G

 � etc.
"/ Use ReflectionOps to implement these methods.



 �


 �
G

 �"7 Generate code using MessageLite and the lite runtime.



 �


 �


�;


�



�


�$


�'(


�):


�*9
�

�"� Sets the Go package where structs generated from this .proto will be
 placed. If omitted, the Go package will be derived from the following:
   - The basename of the package import path, if provided.
   - Otherwise, the package statement in the .proto file, if present.
   - Otherwise, the basename of the .proto file, without extension.



�



�


�


�!
�

�;� Should generic services be generated in each language?  "Generic" services
 are not specific to any particular RPC system.  They are generated by the
 main code generators in each language (without additional plugins).
 Generic services were the only kind of service generation supported by
 early versions of google.protobuf.

 Generic services are now considered deprecated in favor of using plugins
 that generate code specific to your particular RPC system.  Therefore,
 these default to false.  Old code which depends on generic services should
 explicitly set them to true.



�



�


�#


�&(


�):


�*9


�=


�



�


�%


�(*


�+<


�,;


	�;


	�



	�


	�#


	�&(


	�):


	�*9



�<



�




�



�$



�')



�*;



�+:
�

�2� Is this file deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for everything in the file, or it will be completely ignored; in the very
 least, this is a formalization for deprecating files.



�



�


�


�


� 1


�!0


�7q Enables the use of arenas for the proto messages in this file. This applies
 only to generated classes for C++.



�



�


� 


�#%


�&6


�'5
�

�)� Sets the objective c class prefix which is prepended to all objective c
 generated classes from this .proto. There is no default.



�



�


�#


�&(
I

�(; Namespace for generated classes; defaults to the package.



�



�


�"


�%'
�

�$� By default Swift generators will take the proto package and CamelCase it
 replacing '.' with underscore and use that to prefix the types/symbols
 defined. When this options is provided, they will use this value instead
 to prefix the types/symbols defined.



�



�


�


�!#
~

�(p Sets the php class prefix which is prepended to all php generated classes
 from this .proto. Default is empty.



�



�


�"


�%'
�

�%� Use this option to change the namespace of php generated classes. Default
 is empty. When this option is empty, the package name will be used for
 determining the namespace.



�



�


�


�"$
�

�.� Use this option to change the namespace of php generated metadata classes.
 Default is empty. When this option is empty, the proto file name will be
 used for determining the namespace.



�



�


�(


�+-
�

�$� Use this option to change the package of ruby generated classes. Default
 is empty. When this option is not set, the package name will be used for
 determining the ruby package.



�



�


�


�!#
|

�:n The parser stores options it doesn't recognize here.
 See the documentation for the "Options" section above.



�



�


�3


�69
�

�z Clients can define custom options in extensions of this message.
 See the documentation for the "Options" section above.



 �


 �


 �


	�


	 �


	 �

� �

�
�
 �>� Set true to use the old proto1 MessageSet wire format for extensions.
 This is provided for backwards-compatibility with the MessageSet wire
 format.  You should not use this for any other reason:  It's less
 efficient, has fewer features, and is more complicated.

 The message must be defined exactly as follows:
   message Foo {
     option message_set_wire_format = true;
     extensions 4 to max;
   }
 Note that the message cannot have any defined fields; MessageSets only
 have extensions.

 All extensions of your type must be singular messages; e.g. they cannot
 be int32s, enums, or repeated messages.

 Because this is an option, the above two restrictions are not enforced by
 the protocol compiler.


 �


 �

 �'

 �*+

 �,=

 �-<
�
�F� Disables the generation of the standard "descriptor()" accessor, which can
 conflict with a field of the same name.  This is meant to make migration
 from proto1 easier; new code should avoid fields named "descriptor".


�


�

�/

�23

�4E

�5D
�
�1� Is this message deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the message, or it will be completely ignored; in the very least,
 this is a formalization for deprecating messages.


�


�

�

�

�0

� /

	�

	 �

	 �

	�

	�

	�

	�
�
�� NOTE: Do not set the option in .proto files. Always use the maps syntax
 instead. The option should only be implicitly set by the proto compiler
 parser.

 Whether the message is an automatically generated map entry type for the
 maps field.

 For maps fields:
     map<KeyType, ValueType> map_field = 1;
 The parsed descriptor looks like:
     message MapFieldEntry {
         option map_entry = true;
         optional KeyType key = 1;
         optional ValueType value = 2;
     }
     repeated MapFieldEntry map_field = 1;

 Implementations may choose not to generate the map_entry=true message, but
 use a native map in the target language to hold the keys and values.
 The reflection APIs in such implementations still need to work as
 if the field is a repeated message field.


�


�

�

�
$
	�" javalite_serializable


	�

	�

	�" javanano_as_lite


	�

	�
�
�P� Enable the legacy handling of JSON field name conflicts.  This lowercases
 and strips underscored from the fields before comparison in proto3 only.
 The new behavior takes `json_name` into account and applies to proto2 as
 well.

 This should only be used as a temporary measure against broken builds due
 to the change in behavior for JSON field name conflicts.

 TODO(b/261750190) This is legacy behavior we plan to remove once downstream
 teams have had time to migrate.


�


�

�6

�9;

�<O

�=N
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
�
 �.� The ctype option instructs the C++ code generator to use a different
 representation of the field than it normally would.  See the specific
 options below.  This option is only implemented to support use of
 [ctype=CORD] and [ctype=STRING] (the default) on non-repeated fields of
 type "bytes" in the open source release -- sorry, we'll try to include
 other types in a future version!


 �


 �

 �

 �

 �-

 �,

 ��

 �

  � Default mode.


  �


  �
�
 �� The option [ctype=CORD] may be applied to a non-repeated field of type
 "bytes". It indicates that in C++, the data should be stored in a Cord
 instead of a string.  For very large strings, this may reduce memory
 fragmentation. It may also allow better performance when parsing from a
 Cord, or when parsing with aliasing enabled, as the parsed Cord may then
 alias the original buffer.


 �

 �

 �

 �

 �
�
�� The packed option can be enabled for repeated primitive fields to enable
 a more efficient representation on the wire. Rather than repeatedly
 writing the tag and type for each element, the entire array is encoded as
 a single length-delimited blob. In proto3, only explicit setting it to
 false will avoid using packed encoding.


�


�

�

�
�
�3� The jstype option determines the JavaScript type used for values of the
 field.  The option is permitted only for 64 bit integral and fixed types
 (int64, uint64, sint64, fixed64, sfixed64).  A field with jstype JS_STRING
 is represented as JavaScript string, which avoids loss of precision that
 can happen when a large value is converted to a floating point JavaScript.
 Specifying JS_NUMBER for the jstype causes the generated JavaScript code to
 use the JavaScript "number" type.  The behavior of the default option
 JS_NORMAL is implementation dependent.

 This option is an enum to permit additional types to be added, e.g.
 goog.math.Integer.


�


�

�

�

�2

�1

��

�
'
 � Use the default type.


 �

 �
)
� Use JavaScript strings.


�

�
)
� Use JavaScript numbers.


�

�
�
�+� Should this field be parsed lazily?  Lazy applies only to message-type
 fields.  It means that when the outer message is initially parsed, the
 inner message's contents will not be parsed but instead stored in encoded
 form.  The inner message will actually be parsed when it is first accessed.

 This is only a hint.  Implementations are free to choose whether to use
 eager or lazy parsing regardless of the value of this option.  However,
 setting this option true suggests that the protocol author believes that
 using lazy parsing on this field is worth the additional bookkeeping
 overhead typically needed to implement it.

 This option does not affect the public interface of any generated code;
 all method signatures remain the same.  Furthermore, thread-safety of the
 interface is not affected by this option; const methods remain safe to
 call from multiple threads concurrently, while non-const methods continue
 to require exclusive access.

 Note that implementations may choose not to check required fields within
 a lazy sub-message.  That is, calling IsInitialized() on the outer message
 may return true even if the inner message has missing required fields.
 This is necessary because otherwise the inner message would have to be
 parsed in order to perform the check, defeating the purpose of lazy
 parsing.  An implementation which chooses not to check required fields
 must be consistent about it.  That is, for any particular sub-message, the
 implementation must either *always* check its required fields, or *never*
 check its required fields, regardless of whether or not the message has
 been parsed.

 As of May 2022, lazy verifies the contents of the byte stream during
 parsing.  An invalid byte stream will cause the overall parsing to fail.


�


�

�

�

�*

�)
�
�7� unverified_lazy does no correctness checks on the byte stream. This should
 only be used where lazy with verification is prohibitive for performance
 reasons.


�


�

�

�"$

�%6

�&5
�
�1� Is this field deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for accessors, or it will be completely ignored; in the very least, this
 is a formalization for deprecating fields.


�


�

�

�

�0

� /
?
�,1 For Google-internal migration only. Do not use.


�


�

�

�

�+

�*
�
�4� Indicate that the field value should not be printed out when using debug
 formats, e.g. when the field contains sensitive credentials.


�


�

�

�!

�"3

�#2
�
��� If set to RETENTION_SOURCE, the option will be omitted from the binary.
 Note: as of January 2023, support for this is in progress and does not yet
 have an effect (b/264593489).


�

 �

 �

 �

�

�

�

�

�

�

�*

�


�

�$

�')
�
��� This indicates the types of entities that the field may apply to when used
 as an option. If it is unset, then the field may be freely used as an
 option on any kind of entity. Note: as of January 2023, support for this is
 in progress and does not yet have an effect (b/264593489).


�

 �

 �

 �

�

�

�

�$

�

�"#

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

	�

	�

	�

	�<

	�


	�

	�"

	�%'

	�(;

	�):


�)


�



�


�#


�&(
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

	�" removed jtype


	 �

	 �

� �

�
O
 �:A The parser stores options it doesn't recognize here. See above.


 �


 �

 �3

 �69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
`
 � R Set this option to true to allow mapping different tag names to the same
 value.


 �


 �

 �

 �
�
�1� Is this enum deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the enum, or it will be completely ignored; in the very least, this
 is a formalization for deprecating enums.


�


�

�

�

�0

� /

	�" javanano_as_lite


	 �

	 �
�
�O� Enable the legacy handling of JSON field name conflicts.  This lowercases
 and strips underscored from the fields before comparison in proto3 only.
 The new behavior takes `json_name` into account and applies to proto2 as
 well.
 TODO(b/261750190) Remove this legacy behavior once downstream teams have
 had time to migrate.


�


�

�6

�9:

�;N

�<M
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
�
 �1� Is this enum value deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the enum value, or it will be completely ignored; in the very least,
 this is a formalization for deprecating enum values.


 �


 �

 �

 �

 �0

 � /
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
�
 �2� Is this service deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the service, or it will be completely ignored; in the very least,
 this is a formalization for deprecating services.
2� Note:  Field numbers 1 through 32 are reserved for Google's internal RPC
   framework.  We apologize for hoarding these numbers to ourselves, but
   we were already using them long before we decided to release Protocol
   Buffers.


 �


 �

 �

 �

 � 1

 �!0
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
�
 �2� Is this method deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the method, or it will be completely ignored; in the very least,
 this is a formalization for deprecating methods.
2� Note:  Field numbers 1 through 32 are reserved for Google's internal RPC
   framework.  We apologize for hoarding these numbers to ourselves, but
   we were already using them long before we decided to release Protocol
   Buffers.


 �


 �

 �

 �

 � 1

 �!0
�
 ��� Is this method side-effect-free (or safe in HTTP parlance), or idempotent,
 or neither? HTTP based RPC implementation may choose GET verb for safe
 methods, and PUT verb for idempotent methods instead of the default POST.


 �

  �

  �

  �
$
 �" implies idempotent


 �

 �
7
 �"' idempotent, but may have side effects


 �

 �

��&

�


�

�-

�02

�%

�$
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �
�
� �� A message representing a option the parser does not recognize. This only
 appears in options protos created by the compiler::Parser class.
 DescriptorPool resolves these when building Descriptor objects. Therefore,
 options protos in descriptor objects (e.g. returned by Descriptor::options(),
 or produced by Descriptor::CopyTo()) will never have UninterpretedOptions
 in them.


�
�
 ��� The name of the uninterpreted option.  Each string represents a segment in
 a dot-separated name.  is_extension is true iff a segment represents an
 extension (denoted with parentheses in options specs in .proto files).
 E.g.,{ ["foo", false], ["bar.baz", true], ["moo", false] } represents
 "foo.(bar.baz).moo".


 �


  �"

  �

  �

  �

  � !

 �#

 �

 �

 �

 �!"

 �

 �


 �

 �

 �
�
�'� The value of the uninterpreted option, in whatever type the tokenizer
 identified it as during parsing. Exactly one of these should be set.


�


�

�"

�%&

�)

�


�

�$

�'(

�(

�


�

�#

�&'

�#

�


�

�

�!"

�"

�


�

�

� !

�&

�


�

�!

�$%
�
� �j Encapsulates information about the original source file from which a
 FileDescriptorProto was generated.
2` ===================================================================
 Optional source code info


�
�
 �!� A Location identifies a piece of source code in a .proto file which
 corresponds to a particular definition.  This information is intended
 to be useful to IDEs, code indexers, documentation generators, and similar
 tools.

 For example, say we have a file like:
   message Foo {
     optional string foo = 1;
   }
 Let's look at just the field definition:
   optional string foo = 1;
   ^       ^^     ^^  ^  ^^^
   a       bc     de  f  ghi
 We have the following locations:
   span   path               represents
   [a,i)  [ 4, 0, 2, 0 ]     The whole field definition.
   [a,b)  [ 4, 0, 2, 0, 4 ]  The label (optional).
   [c,d)  [ 4, 0, 2, 0, 5 ]  The type (string).
   [e,f)  [ 4, 0, 2, 0, 1 ]  The name (foo).
   [g,h)  [ 4, 0, 2, 0, 3 ]  The number (1).

 Notes:
 - A location may refer to a repeated field itself (i.e. not to any
   particular index within it).  This is used whenever a set of elements are
   logically enclosed in a single code segment.  For example, an entire
   extend block (possibly containing multiple extension definitions) will
   have an outer location whose path refers to the "extensions" repeated
   field without an index.
 - Multiple locations may have the same path.  This happens when a single
   logical declaration is spread out across multiple places.  The most
   obvious example is the "extend" block again -- there may be multiple
   extend blocks in the same scope, each of which will have the same path.
 - A location's span is not always a subset of its parent's span.  For
   example, the "extendee" of an extension declaration appears at the
   beginning of the "extend" block and is shared by all extensions within
   the block.
 - Just because a location's span is a subset of some other location's span
   does not mean that it is a descendant.  For example, a "group" defines
   both a type and a field in a single declaration.  Thus, the locations
   corresponding to the type and field and their components will overlap.
 - Code which tries to interpret locations should probably be designed to
   ignore those that it doesn't understand, as more types of locations could
   be recorded in the future.


 �


 �

 �

 � 

 ��

 �

�
  �,� Identifies which part of the FileDescriptorProto was defined at this
 location.

 Each element is a field number or an index.  They form a path from
 the root FileDescriptorProto to the place where the definition occurs.
 For example, this path:
   [ 4, 3, 2, 7, 1 ]
 refers to:
   file.message_type(3)  // 4, 3
       .field(7)         // 2, 7
       .name()           // 1
 This is because FileDescriptorProto.message_type has field number 4:
   repeated DescriptorProto message_type = 4;
 and DescriptorProto.field has field number 2:
   repeated FieldDescriptorProto field = 2;
 and FieldDescriptorProto.name has field number 1:
   optional string name = 1;

 Thus, the above path gives the location of a field name.  If we removed
 the last element:
   [ 4, 3, 2, 7 ]
 this path refers to the whole field declaration (from the beginning
 of the label to the terminating semicolon).


  �

  �

  �

  �

  �+

  �*
�
 �,� Always has exactly three or four elements: start line, start column,
 end line (optional, otherwise assumed same as start line), end column.
 These are packed into a single field for efficiency.  Note that line
 and column numbers are zero-based -- typically you will want to add
 1 to each before displaying to a user.


 �

 �

 �

 �

 �+

 �*
�
 �)� If this SourceCodeInfo represents a complete declaration, these are any
 comments appearing before and after the declaration which appear to be
 attached to the declaration.

 A series of line comments appearing on consecutive lines, with no other
 tokens appearing on those lines, will be treated as a single comment.

 leading_detached_comments will keep paragraphs of comments that appear
 before (but not connected to) the current element. Each paragraph,
 separated by empty lines, will be one comment element in the repeated
 field.

 Only the comment content is provided; comment markers (e.g. //) are
 stripped out.  For block comments, leading whitespace and an asterisk
 will be stripped from the beginning of each line other than the first.
 Newlines are included in the output.

 Examples:

   optional int32 foo = 1;  // Comment attached to foo.
   // Comment attached to bar.
   optional int32 bar = 2;

   optional string baz = 3;
   // Comment attached to baz.
   // Another line attached to baz.

   // Comment attached to moo.
   //
   // Another line attached to moo.
   optional double moo = 4;

   // Detached comment for corge. This is not leading or trailing comments
   // to moo or corge because there are blank lines separating it from
   // both.

   // Detached comment for corge paragraph 2.

   optional string corge = 5;
   /* Block comment attached
    * to corge.  Leading asterisks
    * will be removed. */
   /* Block comment attached to
    * grault. */
   optional int32 grault = 6;

   // ignored detached comments.


 �

 �

 �$

 �'(

 �*

 �

 �

 �%

 �()

 �2

 �

 �

 �-

 �01
�
� �� Describes the relationship between generated code and its original source
 file. A GeneratedCodeInfo message is associated with only one generated
 source file, but may contain references to different source .proto files.


�
x
 �%j An Annotation connects some span of text in generated code to an element
 of its generating .proto file.


 �


 �

 � 

 �#$

 ��

 �

�
  �, Identifies the element in the original source .proto file. This field
 is formatted the same as SourceCodeInfo.Location.path.


  �

  �

  �

  �

  �+

  �*
O
 �$? Identifies the filesystem path to the original source .proto.


 �

 �

 �

 �"#
w
 �g Identifies the starting offset in bytes in the generated code
 that relates to the identified object.


 �

 �

 �

 �
�
 �� Identifies the ending offset in bytes in the generated code that
 relates to the identified object. The end offset should be one past
 the last relevant byte (so the length of the text = end - begin).


 �

 �

 �

 �
j
  ��X Represents the identified object's effect on the element in the original
 .proto file.


  �	
F
   �4 There is no effect or the effect is indescribable.


	   �


	   �
<
  �* The element is set or otherwise mutated.


	  �	

	  �
8
  �& An alias to the element is returned.


	  �

	  �

 �#

 �

 �

 �

 �!"�� 
�
google/api/annotations.proto
google.apigoogle/api/http.proto google/protobuf/descriptor.proto:K
http.google.protobuf.MethodOptions�ʼ" (2.google.api.HttpRuleRhttpBn
com.google.apiBAnnotationsProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations�GAPIJ�
 
�
 2� Copyright 2015 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 
	
  
	
 *

 X
	
 X

 "
	

 "

 1
	
 1

 '
	
 '

 "
	
$ "
	
 

  See `HttpRule`.



 $


 



 


 bproto3�� 
�
google/api/launch_stage.proto
google.api*�
LaunchStage
LAUNCH_STAGE_UNSPECIFIED 
UNIMPLEMENTED
	PRELAUNCH
EARLY_ACCESS	
ALPHA
BETA
GA

DEPRECATEDBZ
com.google.apiBLaunchStageProtoPZ-google.golang.org/genproto/googleapis/api;api�GAPIJ�
 G
�
 2� Copyright 2023 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 

 D
	
 D

 "
	

 "

 1
	
 1

 '
	
 '

 "
	
$ "
�
  Gv The launch stage as defined by [Google Cloud Platform
 Launch Stages](https://cloud.google.com/terms/launch-stages).



 
-
    Do not use this default value.


  

  
H
 ; The feature is not yet implemented. Users can not use it.


 

 
X
 "K Prelaunch features are hidden from users and are only visible internally.


 "

 "
�
 )� Early Access features are limited to a closed group of testers. To use
 these features, you must sign up in advance and sign a Trusted Tester
 agreement (which includes confidentiality provisions). These features may
 be unstable, changed in backward-incompatible ways, and are not
 guaranteed to be released.


 )

 )
�
 4� Alpha is a limited availability test for releases before they are cleared
 for widespread use. By Alpha, all significant design issues are resolved
 and we are in the process of verifying functionality. Alpha customers
 need to apply for access, agree to applicable terms, and have their
 projects allowlisted. Alpha releases don't have to be feature complete,
 no SLAs are provided, and there are no technical support obligations, but
 they will be far enough along that customers can actually use them in
 test environments or for limited-use tests -- just like they would in
 normal production cases.


 4

 4

�
 ;� Beta is the point at which we are ready to open a release for any
 customer to use. There are no SLA or technical support obligations in a
 Beta release. Products will be complete from a feature perspective, but
 may have some open outstanding issues. Beta releases are suitable for
 limited production use cases.


 ;

 ;	

x
 ?	k GA features are open to all developers and are considered stable and
 fully qualified for production use.


 ?

 ?
�
 F� Deprecated features are scheduled to be shut down and removed. For more
 information, see the "Deprecation Policy" section of our [Terms of
 Service](https://cloud.google.com/terms/)
 and the [Google Cloud Platform Subject to the Deprecation
 Policy](https://cloud.google.com/terms/deprecation) documentation.


 F

 Fbproto3�� 
�%
google/protobuf/duration.protogoogle.protobuf":
Duration
seconds (Rseconds
nanos (RnanosB�
com.google.protobufBDurationProtoPZ1google.golang.org/protobuf/types/known/durationpb��GPB�Google.Protobuf.WellKnownTypesJ�#
 r
�
 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" 
	
" 

# H
	
# H

$ ,
	
$ ,

% .
	
% .

& "
	

& "

' !
	
$' !

( ;
	
%( ;
�
 e r� A Duration represents a signed, fixed-length span of time represented
 as a count of seconds and fractions of seconds at nanosecond
 resolution. It is independent of any calendar and concepts like "day"
 or "month". It is related to Timestamp in that the difference between
 two Timestamp values is a Duration and it can be added or subtracted
 from a Timestamp. Range is approximately +-10,000 years.

 # Examples

 Example 1: Compute Duration from two Timestamps in pseudo code.

     Timestamp start = ...;
     Timestamp end = ...;
     Duration duration = ...;

     duration.seconds = end.seconds - start.seconds;
     duration.nanos = end.nanos - start.nanos;

     if (duration.seconds < 0 && duration.nanos > 0) {
       duration.seconds += 1;
       duration.nanos -= 1000000000;
     } else if (duration.seconds > 0 && duration.nanos < 0) {
       duration.seconds -= 1;
       duration.nanos += 1000000000;
     }

 Example 2: Compute Timestamp from Timestamp + Duration in pseudo code.

     Timestamp start = ...;
     Duration duration = ...;
     Timestamp end = ...;

     end.seconds = start.seconds + duration.seconds;
     end.nanos = start.nanos + duration.nanos;

     if (end.nanos < 0) {
       end.seconds -= 1;
       end.nanos += 1000000000;
     } else if (end.nanos >= 1000000000) {
       end.seconds += 1;
       end.nanos -= 1000000000;
     }

 Example 3: Compute Duration from datetime.timedelta in Python.

     td = datetime.timedelta(days=3, minutes=10)
     duration = Duration()
     duration.FromTimedelta(td)

 # JSON Mapping

 In JSON format, the Duration type is encoded as a string rather than an
 object, where the string ends in the suffix "s" (indicating seconds) and
 is preceded by the number of seconds, with nanoseconds expressed as
 fractional seconds. For example, 3 seconds with 0 nanoseconds should be
 encoded in JSON format as "3s", while 3 seconds and 1 nanosecond should
 be expressed in JSON format as "3.000000001s", and 3 seconds and 1
 microsecond should be expressed in JSON format as "3.000001s".




 e
�
  i� Signed seconds of the span of time. Must be from -315,576,000,000
 to +315,576,000,000 inclusive. Note: these bounds are computed from:
 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years


  i

  i

  i
�
 q� Signed fractions of a second at nanosecond resolution of the span
 of time. Durations less than one second are represented with a 0
 `seconds` field and a positive or negative `nanos` field. For durations
 of one second or more, a non-zero value for the `nanos` field must be
 of the same sign as the `seconds` field. Must be from -999,999,999
 to +999,999,999 inclusive.


 q

 q

 qbproto3�� 
��
google/api/client.proto
google.apigoogle/api/launch_stage.proto google/protobuf/descriptor.protogoogle/protobuf/duration.proto"�
CommonLanguageSettings0
reference_docs_uri (	BRreferenceDocsUriH
destinations (2$.google.api.ClientLibraryDestinationRdestinations"�
ClientLibrarySettings
version (	Rversion:
launch_stage (2.google.api.LaunchStageRlaunchStage,
rest_numeric_enums (RrestNumericEnums=
java_settings (2.google.api.JavaSettingsRjavaSettings:
cpp_settings (2.google.api.CppSettingsRcppSettings:
php_settings (2.google.api.PhpSettingsRphpSettingsC
python_settings (2.google.api.PythonSettingsRpythonSettings=
node_settings (2.google.api.NodeSettingsRnodeSettingsC
dotnet_settings (2.google.api.DotnetSettingsRdotnetSettings=
ruby_settings (2.google.api.RubySettingsRrubySettings7
go_settings (2.google.api.GoSettingsR
goSettings"�

PublishingC
method_settings (2.google.api.MethodSettingsRmethodSettings"
new_issue_urie (	RnewIssueUri+
documentation_urif (	RdocumentationUri$
api_short_nameg (	RapiShortName!
github_labelh (	RgithubLabel4
codeowner_github_teamsi (	RcodeownerGithubTeams$
doc_tag_prefixj (	RdocTagPrefixI
organizationk (2%.google.api.ClientLibraryOrganizationRorganizationL
library_settingsm (2!.google.api.ClientLibrarySettingsRlibrarySettingsI
!proto_reference_documentation_urin (	RprotoReferenceDocumentationUri"�
JavaSettings'
library_package (	RlibraryPackage_
service_class_names (2/.google.api.JavaSettings.ServiceClassNamesEntryRserviceClassNames:
common (2".google.api.CommonLanguageSettingsRcommonD
ServiceClassNamesEntry
key (	Rkey
value (	Rvalue:8"I
CppSettings:
common (2".google.api.CommonLanguageSettingsRcommon"I
PhpSettings:
common (2".google.api.CommonLanguageSettingsRcommon"L
PythonSettings:
common (2".google.api.CommonLanguageSettingsRcommon"J
NodeSettings:
common (2".google.api.CommonLanguageSettingsRcommon"�
DotnetSettings:
common (2".google.api.CommonLanguageSettingsRcommonZ
renamed_services (2/.google.api.DotnetSettings.RenamedServicesEntryRrenamedServices]
renamed_resources (20.google.api.DotnetSettings.RenamedResourcesEntryRrenamedResources+
ignored_resources (	RignoredResources8
forced_namespace_aliases (	RforcedNamespaceAliases5
handwritten_signatures (	RhandwrittenSignaturesB
RenamedServicesEntry
key (	Rkey
value (	Rvalue:8C
RenamedResourcesEntry
key (	Rkey
value (	Rvalue:8"J
RubySettings:
common (2".google.api.CommonLanguageSettingsRcommon"H

GoSettings:
common (2".google.api.CommonLanguageSettingsRcommon"�
MethodSettings
selector (	RselectorI
long_running (2&.google.api.MethodSettings.LongRunningRlongRunning�
LongRunningG
initial_poll_delay (2.google.protobuf.DurationRinitialPollDelay2
poll_delay_multiplier (RpollDelayMultiplier?
max_poll_delay (2.google.protobuf.DurationRmaxPollDelayG
total_poll_timeout (2.google.protobuf.DurationRtotalPollTimeout*y
ClientLibraryOrganization+
'CLIENT_LIBRARY_ORGANIZATION_UNSPECIFIED 	
CLOUD
ADS

PHOTOS
STREET_VIEW*g
ClientLibraryDestination*
&CLIENT_LIBRARY_DESTINATION_UNSPECIFIED 

GITHUB

PACKAGE_MANAGER:J
method_signature.google.protobuf.MethodOptions� (	RmethodSignature:C
default_host.google.protobuf.ServiceOptions� (	RdefaultHost:C
oauth_scopes.google.protobuf.ServiceOptions� (	RoauthScopesBi
com.google.apiBClientProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations�GAPIJ�h
 �
�
 2� Copyright 2023 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 
	
  '
	
 *
	
 (

 X
	
 X

 "
	

 "

 ,
	
 ,

 '
	
 '

 "
	
$ "
	
 A
�
 @*�
 A definition of a client library method signature.

 In client libraries, each proto RPC corresponds to one or more methods
 which the end user is able to call, and calls the underlying RPC.
 Normally, this method receives a single argument (a struct or instance
 corresponding to the RPC request object). Defining this field will
 add one or more overloads providing flattened or simpler method signatures
 in some languages.

 The fields on the method signature are provided as a comma-separated
 string.

 For example, the proto RPC and annotation:

   rpc CreateSubscription(CreateSubscriptionRequest)
       returns (Subscription) {
     option (google.api.method_signature) = "name,topic";
   }

 Would add the following Java overload (in addition to the method accepting
 the request object):

   public final Subscription createSubscription(String name, String topic)

 The following backwards-compatibility guidelines apply:

   * Adding this annotation to an unannotated method is backwards
     compatible.
   * Adding this annotation to a method which already has existing
     method signature annotations is backwards compatible if and only if
     the new method signature annotation is last in the sequence.
   * Modifying or removing an existing method signature annotation is
     a breaking change.
   * Re-ordering existing method signature annotations is a breaking
     change.



 $


 @



 @


 @"


 @%)
	
C d
�
M� The hostname for this service.
 This should be specified with no prefix or protocol.

 Example:

   service Foo {
     option (google.api.default_host) = "foo.googleapi.com";
     ...
   }



C%


M


M	


M
�
c� OAuth scopes needed for the client.

 Example:

   service Foo {
     option (google.api.oauth_scopes) = \
       "https://www.googleapis.com/auth/cloud-platform";
     ...
   }

 If there is more than one scope, use a comma-separated string:

 Example:

   service Foo {
     option (google.api.oauth_scopes) = \
       "https://www.googleapis.com/auth/cloud-platform,"
       "https://www.googleapis.com/auth/monitoring";
     ...
   }



C%


c


c	


c
6
 g n* Required information for every language.



 g
�
  j4� Link to automatically generated reference documentation.  Example:
 https://cloud.google.com/nodejs/docs/reference/asset/latest


  j

  j	

  j

  j 3

  j!2
X
 m5K The destination where API teams want this client library to be published.


 m


 m#

 m$0

 m34
G
q �: Details about how and where to publish client libraries.



q
�
 u� Version of the API to apply these settings to. This is the full protobuf
 package for the API, ending in the version element.
 Examples: "google.cloud.speech.v1" and "google.spanner.admin.database.v1".


 u

 u	

 u
7
x* Launch stage of this version of the API.


x

x

x
o
|b When using transport=rest, the client request will encode enums as
 numbers rather than strings.


|

|

|
P
"C Settings for legacy Java features, supported in the Service YAML.






!
2
� $ Settings for C++ client libraries.


�

�

�
2
� $ Settings for PHP client libraries.


�

�

�
5
�&' Settings for Python client libraries.


�

� 

�#%
3
�"% Settings for Node client libraries.


�

�

�!
3
�&% Settings for .NET client libraries.


�

� 

�#%
3
	�"% Settings for Ruby client libraries.


	�

	�

	�!
1

�# Settings for Go client libraries.



�


�


�
�
� �� This message configures the settings for publishing [Google Cloud Client
 libraries](https://cloud.google.com/apis/docs/cloud-client-libraries)
 generated from the service config.


�
z
 �.l A list of API method settings, e.g. the behavior for methods that use the
 long-running operation pattern.


 �


 �

 �)

 �,-
�
�� Link to a place that API users can report issues.  Example:
 https://issuetracker.google.com/issues/new?component=190865&template=1161103


�

�	

�
l
�!^ Link to product home page.  Example:
 https://cloud.google.com/asset-inventory/docs/overview


�

�	

� 
�
�� Used as a tracking tag when collecting data about the APIs developer
 relations artifacts like docs, packages delivered to package managers,
 etc.  Example: "speech".


�

�	

�
V
�H GitHub label to apply to issues and pull requests opened for this API.


�

�	

�
�
�/� GitHub teams to be added to CODEOWNERS in the directory in GitHub
 containing source code for the client libraries for this API.


�


�

�(

�+.
e
�W A prefix used in sample code when demarking regions to be included in
 documentation.


�

�	

�
?
�/1 For whom the client library is being published.


�

�(

�+.
�
�8� Client library settings.  If the same version string appears multiple
 times in this list, then the last one wins.  Settings from earlier
 settings with the same version string are discarded.


�


� 

�!1

�47
�
	�1t Optional link to proto reference documentation.  Example:
 https://cloud.google.com/pubsub/lite/docs/reference/rpc


	�

	�	*

	�-0
3
� �% Settings for Java client libraries.


�
�
 �� The package name to use in Java. Clobbers the java_package option
 set in the protobuf. This should be used **only** by APIs
 who have already set the language_settings.java.package_name" field
 in gapic.yaml. API teams should use the protobuf java_package option
 where possible.

 Example of a YAML configuration::

  publishing:
    java_settings:
      library_package: com.google.cloud.pubsub.v1


 �

 �	

 �
�
�.� Configure the Java class name to use instead of the service's for its
 corresponding generated GAPIC client. Keys are fully-qualified
 service names as they appear in the protobuf (including the full
 the language_settings.java.interface_names" field in gapic.yaml. API
 teams should otherwise use the service name as it appears in the
 protobuf.

 Example of a YAML configuration::

  publishing:
    java_settings:
      service_class_names:
        - google.pubsub.v1.Publisher: TopicAdmin
        - google.pubsub.v1.Subscriber: SubscriptionAdmin


�

�)

�,-

�$ Some settings.


�

�

�"#
2
� �$ Settings for C++ client libraries.


�

 �$ Some settings.


 �

 �

 �"#
2
� �$ Settings for Php client libraries.


�

 �$ Some settings.


 �

 �

 �"#
5
� �' Settings for Python client libraries.


�

 �$ Some settings.


 �

 �

 �"#
3
� �% Settings for Node client libraries.


�

 �$ Some settings.


 �

 �

 �"#
5
� �' Settings for Dotnet client libraries.


�

 �$ Some settings.


 �

 �

 �"#
�
�+� Map from original service names to renamed versions.
 This is used when the default generated types
 would cause a naming conflict. (Neither name is
 fully-qualified.)
 Example: Subscriber to SubscriberServiceApi.


�

�&

�)*
�
�,� Map from full resource types to the effective short name
 for the resource. This is used when otherwise resource
 named from different services would cause naming collisions.
 Example entry:
 "datalabeling.googleapis.com/Dataset": "DataLabelingDataset"


�

�'

�*+
�
�(� List of full resource types to ignore during generation.
 This is typically used for API-specific Location resources,
 which should be handled by the generator as if they were actually
 the common Location resources.
 Example entry: "documentai.googleapis.com/Location"


�


�

�#

�&'
}
�/o Namespaces which must be aliased in snippets due to
 a known (but non-generator-predictable) naming collision


�


�

�*

�-.
�
�-� Method signatures (in the form "service.method(signature)")
 which are provided separately, so shouldn't be generated.
 Snippets *calling* these methods are still generated, however.


�


�

�(

�+,
3
	� �% Settings for Ruby client libraries.


	�

	 �$ Some settings.


	 �

	 �

	 �"#
1

� �# Settings for Go client libraries.



�


 �$ Some settings.



 �


 �


 �"#
C
� �5 Describes the generator configuration for a method.


�
�
 ��� Describes settings to use when generating API methods that use the
 long-running operation pattern.
 All default values below are from those used in the client library
 generators (e.g.
 [Java](https://github.com/googleapis/gapic-generator-java/blob/04c2faa191a9b5a10b92392fe8482279c4404803/src/main/java/com/google/api/generator/gapic/composer/common/RetrySettingsComposer.java)).


 �

k
  �4[ Initial delay after which the first poll request will be made.
 Default value: 5 seconds.


  �

  �/

  �23
�
 �$x Multiplier to gradually increase delay between subsequent polls until it
 reaches max_poll_delay.
 Default value: 1.5.


 �	

 �


 �"#
`
 �0P Maximum time between two subsequent poll requests.
 Default value: 45 seconds.


 �

 �+

 �./
C
 �43 Total polling timeout.
 Default value: 5 minutes.


 �

 �/

 �23
�
 �� The fully qualified name of the method, for which the options below apply.
 This is used to find the method to apply the options.


 �

 �	

 �
�
�� Describes settings to use for long-running operations when generating
 API methods for RPCs. Complements RPCs that use the annotations in
 google/longrunning/operations.proto.

 Example of a YAML configuration::

  publishing:
    method_settings:
      - selector: google.cloud.speech.v2.Speech.BatchRecognize
        long_running:
          initial_poll_delay:
            seconds: 60 # 1 minute
          poll_delay_multiplier: 1.5
          max_poll_delay:
            seconds: 360 # 6 minutes
          total_poll_timeout:
             seconds: 54000 # 90 minutes


�

�

�
�
 � �� The organization for which the client libraries are being published.
 Affects the url where generated docs are published, etc.


 �

  �. Not useful.


  �)

  �,-
*
 � Google Cloud Platform Org.


 �

 �

&
 �
 Ads (Advertising) Org.


 �

 �	

 � Photos Org.


 �

 �
 
 � Street View Org.


 �

 �
>
� �0 To where should client libraries be published?


�
^
 �-P Client libraries will neither be generated nor published to package
 managers.


 �(

 �+,
}
�o Generate the client library in a repo under github.com/googleapis,
 but don't publish it to package managers.


�

�
U
�G Publish the library to package managers like nuget.org and npmjs.com.


�

�bproto3�� 
�
google/api/field_behavior.proto
google.api google/protobuf/descriptor.proto*�
FieldBehavior
FIELD_BEHAVIOR_UNSPECIFIED 
OPTIONAL
REQUIRED
OUTPUT_ONLY

INPUT_ONLY
	IMMUTABLE
UNORDERED_LIST
NON_EMPTY_DEFAULT:`
field_behavior.google.protobuf.FieldOptions� (2.google.api.FieldBehaviorRfieldBehaviorBp
com.google.apiBFieldBehaviorProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations�GAPIJ�
 Y
�
 2� Copyright 2023 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 
	
  *

 X
	
 X

 "
	

 "

 3
	
 3

 '
	
 '

 "
	
$ "
	
 (
�
 ':� A designation of a specific field behavior (required, output only, etc.)
 in protobuf messages.

 Examples:

   string name = 1 [(google.api.field_behavior) = REQUIRED];
   State state = 1 [(google.api.field_behavior) = OUTPUT_ONLY];
   google.protobuf.Duration ttl = 1
     [(google.api.field_behavior) = INPUT_ONLY];
   google.protobuf.Timestamp expire_time = 1
     [(google.api.field_behavior) = OUTPUT_ONLY,
      (google.api.field_behavior) = IMMUTABLE];



 #


 '



 '#


 '$2


 '59
�
 0 Y� An indicator of the behavior of a given field (for example, that a field
 is required in requests, or given as output but ignored as input).
 This **does not** change the behavior in protocol buffers itself; it only
 denotes the behavior and may affect how API tooling handles the field.

 Note: This enum **may** receive new values in the future.



 0
?
  2!2 Conventional default for enums. Do not use this.


  2

  2 
�
 7� Specifically denotes a field as optional.
 While all fields in protocol buffers are optional, this may be specified
 for emphasis if appropriate.


 7


 7
�
 <� Denotes a field as required.
 This indicates that the field **must** be provided as part of the request,
 and failure to do so will cause an error (usually `INVALID_ARGUMENT`).


 <


 <
�
 B� Denotes a field as output only.
 This indicates that the field is provided in responses, but including the
 field in a request does nothing (the server *must* ignore it and
 *must not* throw an error as a result of the field's presence).


 B

 B
�
 G� Denotes a field as input only.
 This indicates that the field is provided in requests, and the
 corresponding field is not included in output.


 G

 G
�
 L� Denotes a field as immutable.
 This indicates that the field may be set once in a request to create a
 resource, but may not be changed thereafter.


 L

 L
�
 R� Denotes that a (repeated) field is an unordered list.
 This indicates that the service may provide the elements of the list
 in any arbitrary  order, rather than the order the user originally
 provided. Additionally, the list's order may or may not be stable.


 R

 R
�
 X� Denotes that this field returns a non-empty default value if not set.
 This indicates that if the user provides the empty value in a request,
 a non-empty value will be returned. The user will not be aware of what
 non-empty value to expect.


 X

 Xbproto3�� 
�1
google/protobuf/timestamp.protogoogle.protobuf";
	Timestamp
seconds (Rseconds
nanos (RnanosB�
com.google.protobufBTimestampProtoPZ2google.golang.org/protobuf/types/known/timestamppb��GPB�Google.Protobuf.WellKnownTypesJ�/
 �
�
 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" 
	
" 

# I
	
# I

$ ,
	
$ ,

% /
	
% /

& "
	

& "

' !
	
$' !

( ;
	
%( ;
�
 � �� A Timestamp represents a point in time independent of any time zone or local
 calendar, encoded as a count of seconds and fractions of seconds at
 nanosecond resolution. The count is relative to an epoch at UTC midnight on
 January 1, 1970, in the proleptic Gregorian calendar which extends the
 Gregorian calendar backwards to year one.

 All minutes are 60 seconds long. Leap seconds are "smeared" so that no leap
 second table is needed for interpretation, using a [24-hour linear
 smear](https://developers.google.com/time/smear).

 The range is from 0001-01-01T00:00:00Z to 9999-12-31T23:59:59.999999999Z. By
 restricting to that range, we ensure that we can convert to and from [RFC
 3339](https://www.ietf.org/rfc/rfc3339.txt) date strings.

 # Examples

 Example 1: Compute Timestamp from POSIX `time()`.

     Timestamp timestamp;
     timestamp.set_seconds(time(NULL));
     timestamp.set_nanos(0);

 Example 2: Compute Timestamp from POSIX `gettimeofday()`.

     struct timeval tv;
     gettimeofday(&tv, NULL);

     Timestamp timestamp;
     timestamp.set_seconds(tv.tv_sec);
     timestamp.set_nanos(tv.tv_usec * 1000);

 Example 3: Compute Timestamp from Win32 `GetSystemTimeAsFileTime()`.

     FILETIME ft;
     GetSystemTimeAsFileTime(&ft);
     UINT64 ticks = (((UINT64)ft.dwHighDateTime) << 32) | ft.dwLowDateTime;

     // A Windows tick is 100 nanoseconds. Windows epoch 1601-01-01T00:00:00Z
     // is 11644473600 seconds before Unix epoch 1970-01-01T00:00:00Z.
     Timestamp timestamp;
     timestamp.set_seconds((INT64) ((ticks / 10000000) - 11644473600LL));
     timestamp.set_nanos((INT32) ((ticks % 10000000) * 100));

 Example 4: Compute Timestamp from Java `System.currentTimeMillis()`.

     long millis = System.currentTimeMillis();

     Timestamp timestamp = Timestamp.newBuilder().setSeconds(millis / 1000)
         .setNanos((int) ((millis % 1000) * 1000000)).build();

 Example 5: Compute Timestamp from Java `Instant.now()`.

     Instant now = Instant.now();

     Timestamp timestamp =
         Timestamp.newBuilder().setSeconds(now.getEpochSecond())
             .setNanos(now.getNano()).build();

 Example 6: Compute Timestamp from current time in Python.

     timestamp = Timestamp()
     timestamp.GetCurrentTime()

 # JSON Mapping

 In JSON format, the Timestamp type is encoded as a string in the
 [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format. That is, the
 format is "{year}-{month}-{day}T{hour}:{min}:{sec}[.{frac_sec}]Z"
 where {year} is always expressed using four digits while {month}, {day},
 {hour}, {min}, and {sec} are zero-padded to two digits each. The fractional
 seconds, which can go up to 9 digits (i.e. up to 1 nanosecond resolution),
 are optional. The "Z" suffix indicates the timezone ("UTC"); the timezone
 is required. A proto3 JSON serializer should always use UTC (as indicated by
 "Z") when printing the Timestamp type and a proto3 JSON parser should be
 able to accept both UTC and other timezones (as indicated by an offset).

 For example, "2017-01-15T01:30:15.01Z" encodes 15.01 seconds past
 01:30 UTC on January 15, 2017.

 In JavaScript, one can convert a Date object to this format using the
 standard
 [toISOString()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toISOString)
 method. In Python, a standard `datetime.datetime` object can be converted
 to this format using
 [`strftime`](https://docs.python.org/2/library/time.html#time.strftime) with
 the time format spec '%Y-%m-%dT%H:%M:%S.%fZ'. Likewise, in Java, one can use
 the Joda Time's [`ISODateTimeFormat.dateTime()`](
 http://joda-time.sourceforge.net/apidocs/org/joda/time/format/ISODateTimeFormat.html#dateTime()
 ) to obtain a formatter capable of generating timestamps in this format.



 �
�
  �� Represents seconds of UTC time since Unix epoch
 1970-01-01T00:00:00Z. Must be from 0001-01-01T00:00:00Z to
 9999-12-31T23:59:59Z inclusive.


  �

  �

  �
�
 �� Non-negative fractions of a second at nanosecond resolution. Negative
 second values with fractions must still have non-negative nanos values
 that count forward in time. Must be from 0 to 999,999,999
 inclusive.


 �

 �

 �bproto3�� 
�#
google/protobuf/struct.protogoogle.protobuf"�
Struct;
fields (2#.google.protobuf.Struct.FieldsEntryRfieldsQ
FieldsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"�
Value;

null_value (2.google.protobuf.NullValueH R	nullValue#
number_value (H RnumberValue#
string_value (	H RstringValue

bool_value (H R	boolValue<
struct_value (2.google.protobuf.StructH RstructValue;

list_value (2.google.protobuf.ListValueH R	listValueB
kind";
	ListValue.
values (2.google.protobuf.ValueRvalues*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpb��GPB�Google.Protobuf.WellKnownTypesJ�
 ^
�
 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" 
	
" 

# F
	
# F

$ ,
	
$ ,

% ,
	
% ,

& "
	

& "

' !
	
$' !

( ;
	
%( ;
�
 2 5� `Struct` represents a structured data value, consisting of fields
 which map to dynamically typed values. In some languages, `Struct`
 might be supported by a native representation. For example, in
 scripting languages like JS a struct is represented as an
 object. The details of that representation are described together
 with the proto support for the language.

 The JSON representation for `Struct` is JSON object.



 2
9
  4 , Unordered map of dynamically typed values.


  4

  4

  4
�
= M� `Value` represents a dynamically typed value which can be either
 null, a number, a string, a boolean, a recursive struct value, or a
 list of values. A producer of value is expected to set one of these
 variants. Absence of any variant indicates an error.

 The JSON representation for `Value` is JSON value.



=
"
 ?L The kind of value.


 ?
'
 A Represents a null value.


 A

 A

 A
)
C Represents a double value.


C


C

C
)
E Represents a string value.


E


E

E
*
G Represents a boolean value.


G

G	

G
-
I  Represents a structured value.


I


I

I
-
K  Represents a repeated `Value`.


K

K

K
�
 S V� `NullValue` is a singleton enumeration to represent the null value for the
 `Value` type union.

 The JSON representation for `NullValue` is JSON `null`.



 S

  U Null value.


  U

  U
�
[ ^v `ListValue` is a wrapper around a repeated field of values.

 The JSON representation for `ListValue` is JSON array.



[
:
 ]- Repeated field of dynamically typed values.


 ]


 ]

 ]

 ]bproto3�� 
��
,protoc-gen-openapiv2/options/openapiv2.proto)grpc.gateway.protoc_gen_openapiv2.optionsgoogle/protobuf/struct.proto"�
Swagger
swagger (	RswaggerC
info (2/.grpc.gateway.protoc_gen_openapiv2.options.InfoRinfo
host (	Rhost
	base_path (	RbasePathK
schemes (21.grpc.gateway.protoc_gen_openapiv2.options.SchemeRschemes
consumes (	Rconsumes
produces (	Rproduces_
	responses
 (2A.grpc.gateway.protoc_gen_openapiv2.options.Swagger.ResponsesEntryR	responsesq
security_definitions (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityDefinitionsRsecurityDefinitionsZ
security (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirementRsecurityB
tags (2..grpc.gateway.protoc_gen_openapiv2.options.TagRtagse
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocsb

extensions (2B.grpc.gateway.protoc_gen_openapiv2.options.Swagger.ExtensionsEntryR
extensionsq
ResponsesEntry
key (	RkeyI
value (23.grpc.gateway.protoc_gen_openapiv2.options.ResponseRvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8J	J	
"�
	Operation
tags (	Rtags
summary (	Rsummary 
description (	Rdescriptione
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocs!
operation_id (	RoperationId
consumes (	Rconsumes
produces (	Rproducesa
	responses	 (2C.grpc.gateway.protoc_gen_openapiv2.options.Operation.ResponsesEntryR	responsesK
schemes
 (21.grpc.gateway.protoc_gen_openapiv2.options.SchemeRschemes

deprecated (R
deprecatedZ
security (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirementRsecurityd

extensions (2D.grpc.gateway.protoc_gen_openapiv2.options.Operation.ExtensionsEntryR
extensionsU

parameters (25.grpc.gateway.protoc_gen_openapiv2.options.ParametersR
parametersq
ResponsesEntry
key (	RkeyI
value (23.grpc.gateway.protoc_gen_openapiv2.options.ResponseRvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8J	"b

ParametersT
headers (2:.grpc.gateway.protoc_gen_openapiv2.options.HeaderParameterRheaders"�
HeaderParameter
name (	Rname 
description (	RdescriptionS
type (2?.grpc.gateway.protoc_gen_openapiv2.options.HeaderParameter.TypeRtype
format (	Rformat
required (Rrequired"E
Type
UNKNOWN 

STRING

NUMBER
INTEGER
BOOLEANJJ"�
Header 
description (	Rdescription
type (	Rtype
format (	Rformat
default (	Rdefault
pattern (	RpatternJJJJ	J	
J
JJJJJJJ"�
Response 
description (	RdescriptionI
schema (21.grpc.gateway.protoc_gen_openapiv2.options.SchemaRschemaZ
headers (2@.grpc.gateway.protoc_gen_openapiv2.options.Response.HeadersEntryRheaders]
examples (2A.grpc.gateway.protoc_gen_openapiv2.options.Response.ExamplesEntryRexamplesc

extensions (2C.grpc.gateway.protoc_gen_openapiv2.options.Response.ExtensionsEntryR
extensionsm
HeadersEntry
key (	RkeyG
value (21.grpc.gateway.protoc_gen_openapiv2.options.HeaderRvalue:8;
ExamplesEntry
key (	Rkey
value (	Rvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"�
Info
title (	Rtitle 
description (	Rdescription(
terms_of_service (	RtermsOfServiceL
contact (22.grpc.gateway.protoc_gen_openapiv2.options.ContactRcontactL
license (22.grpc.gateway.protoc_gen_openapiv2.options.LicenseRlicense
version (	Rversion_

extensions (2?.grpc.gateway.protoc_gen_openapiv2.options.Info.ExtensionsEntryR
extensionsU
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"E
Contact
name (	Rname
url (	Rurl
email (	Remail"/
License
name (	Rname
url (	Rurl"K
ExternalDocumentation 
description (	Rdescription
url (	Rurl"�
SchemaV
json_schema (25.grpc.gateway.protoc_gen_openapiv2.options.JSONSchemaR
jsonSchema$
discriminator (	Rdiscriminator
	read_only (RreadOnlye
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocs
example (	RexampleJ"�


JSONSchema
ref (	Rref
title (	Rtitle 
description (	Rdescription
default (	Rdefault
	read_only (RreadOnly
example	 (	Rexample
multiple_of
 (R
multipleOf
maximum (Rmaximum+
exclusive_maximum (RexclusiveMaximum
minimum (Rminimum+
exclusive_minimum (RexclusiveMinimum

max_length (R	maxLength

min_length (R	minLength
pattern (	Rpattern
	max_items (RmaxItems
	min_items (RminItems!
unique_items (RuniqueItems%
max_properties (RmaxProperties%
min_properties (RminProperties
required (	Rrequired
array" (	Rarray_
type# (2K.grpc.gateway.protoc_gen_openapiv2.options.JSONSchema.JSONSchemaSimpleTypesRtype
format$ (	Rformat
enum. (	Renumz
field_configuration� (2H.grpc.gateway.protoc_gen_openapiv2.options.JSONSchema.FieldConfigurationRfieldConfiguratione

extensions0 (2E.grpc.gateway.protoc_gen_openapiv2.options.JSONSchema.ExtensionsEntryR
extensions<
FieldConfiguration&
path_param_name/ (	RpathParamNameU
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"w
JSONSchemaSimpleTypes
UNKNOWN 	
ARRAY
BOOLEAN
INTEGER
NULL

NUMBER

OBJECT

STRINGJJJJJJJJJJ"J%*J*+J+."�
Tag
name (	Rname 
description (	Rdescriptione
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocs^

extensions (2>.grpc.gateway.protoc_gen_openapiv2.options.Tag.ExtensionsEntryR
extensionsU
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"�
SecurityDefinitionsh
security (2L.grpc.gateway.protoc_gen_openapiv2.options.SecurityDefinitions.SecurityEntryRsecurityv
SecurityEntry
key (	RkeyO
value (29.grpc.gateway.protoc_gen_openapiv2.options.SecuritySchemeRvalue:8"�
SecuritySchemeR
type (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.TypeRtype 
description (	Rdescription
name (	RnameL
in (2<.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.InRinR
flow (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.FlowRflow+
authorization_url (	RauthorizationUrl
	token_url (	RtokenUrlI
scopes (21.grpc.gateway.protoc_gen_openapiv2.options.ScopesRscopesi

extensions	 (2I.grpc.gateway.protoc_gen_openapiv2.options.SecurityScheme.ExtensionsEntryR
extensionsU
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"K
Type
TYPE_INVALID 

TYPE_BASIC
TYPE_API_KEY
TYPE_OAUTH2"1
In

IN_INVALID 
IN_QUERY
	IN_HEADER"j
Flow
FLOW_INVALID 
FLOW_IMPLICIT
FLOW_PASSWORD
FLOW_APPLICATION
FLOW_ACCESS_CODE"�
SecurityRequirement�
security_requirement (2W.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirement.SecurityRequirementEntryRsecurityRequirement0
SecurityRequirementValue
scope (	Rscope�
SecurityRequirementEntry
key (	Rkeym
value (2W.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirement.SecurityRequirementValueRvalue:8"�
ScopesR
scope (2<.grpc.gateway.protoc_gen_openapiv2.options.Scopes.ScopeEntryRscope8

ScopeEntry
key (	Rkey
value (	Rvalue:8*;
Scheme
UNKNOWN 
HTTP	
HTTPS
WS
WSSBHZFgithub.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/optionsJ��
  �

  

 2
	
  &

 ]
	
 ]
c
 
 W Scheme describes the schemes supported by the OpenAPI Swagger
 and Operation objects.



 


  

  	

  

 

 

 	


 

 

 


 	

 

 

 


 

 	
�
 , g� `Swagger` is a representation of OpenAPI v2 specification's Swagger object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#swaggerObject

 Example:

  option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
    info: {
      title: "Echo API";
      version: "1.0";
      description: "";
      contact: {
        name: "gRPC-Gateway project";
        url: "https://github.com/grpc-ecosystem/grpc-gateway";
        email: "none@example.com";
      };
      license: {
        name: "BSD 3-Clause License";
        url: "https://github.com/grpc-ecosystem/grpc-gateway/blob/main/LICENSE.txt";
      };
    };
    schemes: HTTPS;
    consumes: "application/json";
    produces: "application/json";
  };




 ,
�
  0� Specifies the OpenAPI Specification version being used. It can be
 used by the OpenAPI UI and other clients to interpret the API listing. The
 value MUST be "2.0".


  0

  0	

  0
c
 3V Provides metadata about the API. The metadata can be used by the
 clients if needed.


 3

 3

 3
�
 8� The host (name or ip) serving the API. This MUST be the host only and does
 not include the scheme nor sub-paths. It MAY include a port. If the host is
 not included, the host serving the documentation is to be used (including
 the port). The host does not support path templating.


 8

 8	

 8
�
 B� The base path on which the API is served, which is relative to the host. If
 it is not included, the API is served directly under the host. The value
 MUST start with a leading slash (/). The basePath does not support path
 templating.
 Note that using `base_path` does not change the endpoint paths that are
 generated in the resulting OpenAPI file. If you wish to use `base_path`
 with relatively generated OpenAPI paths, the `base_path` prefix must be
 manually removed from your `google.api.http` paths and your code changed to
 serve the API from the `base_path`.


 B

 B	

 B
�
 F� The transfer protocol of the API. Values MUST be from the list: "http",
 "https", "ws", "wss". If the schemes is not included, the default scheme to
 be used is the one used to access the OpenAPI definition itself.


 F


 F

 F

 F
�
 J� A list of MIME types the APIs can consume. This is global to all APIs but
 can be overridden on specific API calls. Value MUST be as described under
 Mime Types.


 J


 J

 J

 J
�
 N� A list of MIME types the APIs can produce. This is global to all APIs but
 can be overridden on specific API calls. Value MUST be as described under
 Mime Types.


 N


 N

 N

 N
.
 	P" field 8 is reserved for 'paths'.


 	 P

 	 P
�
 	Sw field 9 is reserved for 'definitions', which at this time are already
 exposed as and customizable as proto messages.


 	S

 	S
�
 V'� An object to hold responses that can be used across operations. This
 property does not define global responses for all operations.


 V

 V!

 V$&
U
 X0H Security scheme definitions that can be used across the specification.


 X

 X*

 X-/
�
 	]-� A declaration of which security schemes are applied for the API as a whole.
 The list of values describes alternative security schemes that can be used
 (that is, there is a logical OR between the security requirements).
 Individual operations can override this definition.


 	]


 	]

 	]'

 	]*,
�
 
`� A list of tags for API documentation control. Tags can be used for logical
 grouping of operations by resources or any other qualifier.


 
`


 
`

 
`

 
`
1
 b+$ Additional external documentation.


 b

 b%

 b(*
�
 f5� Custom properties that start with "x-" such as "x-foo" used to describe
 extra functionality that is not covered by the standard OpenAPI Specification.
 See: https://swagger.io/docs/specification/2-0/swagger-extensions/


 f$

 f%/

 f24
�
� �� `Operation` is a representation of OpenAPI v2 specification's Operation object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#operationObject

 Example:

  service EchoService {
    rpc Echo(SimpleMessage) returns (SimpleMessage) {
      option (google.api.http) = {
        get: "/v1/example/echo/{id}"
      };

      option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_operation) = {
        summary: "Get a message.";
        operation_id: "getMessage";
        tags: "echo";
        responses: {
          key: "200"
            value: {
            description: "OK";
          }
        }
      };
    }
  }


�
�
 �� A list of tags for API documentation control. Tags can be used for logical
 grouping of operations by resources or any other qualifier.


 �


 �

 �

 �
�
�� A short summary of what the operation does. For maximum readability in the
 swagger-ui, this field SHOULD be less than 120 characters.


�

�	

�
v
�h A verbose explanation of the operation behavior. GFM syntax can be used for
 rich text representation.


�

�	

�
E
�*7 Additional external documentation for this operation.


�

�%

�()
�
�� Unique string used to identify the operation. The id MUST be unique among
 all operations described in the API. Tools and libraries MAY use the
 operationId to uniquely identify an operation, therefore, it is recommended
 to follow common programming naming conventions.


�

�	

�
�
�� A list of MIME types the operation can consume. This overrides the consumes
 definition at the OpenAPI Object. An empty value MAY be used to clear the
 global definition. Value MUST be as described under Mime Types.


�


�

�

�
�
�� A list of MIME types the operation can produce. This overrides the produces
 definition at the OpenAPI Object. An empty value MAY be used to clear the
 global definition. Value MUST be as described under Mime Types.


�


�

�

�
4
	�' field 8 is reserved for 'parameters'.


	 �

	 �
c
�&U The list of possible responses as they are returned from executing this
 operation.


�

�!

�$%
�
�� The transfer protocol for the operation. Values MUST be from the list:
 "http", "https", "ws", "wss". The value overrides the OpenAPI Object
 schemes definition.


�


�

�

�
�
	�y Declares this operation to be deprecated. Usage of the declared operation
 should be refrained. Default value is false.


	�

	�

	�
�

�-� A declaration of which security schemes are applied for this operation. The
 list of values describes alternative security schemes that can be used
 (that is, there is a logical OR between the security requirements). This
 definition overrides any declared top-level security. To remove a top-level
 security declaration, an empty array can be used.



�



�


�'


�*,
�
�5� Custom properties that start with "x-" such as "x-foo" used to describe
 extra functionality that is not covered by the standard OpenAPI Specification.
 See: https://swagger.io/docs/specification/2-0/swagger-extensions/


�$

�%/

�24
�
�� Custom parameters such as HTTP request headers.
 See: https://swagger.io/docs/specification/2-0/describing-parameters/
 and https://swagger.io/specification/v2/#parameter-object.


�

�

�
�
� �� `Parameters` is a representation of OpenAPI v2 specification's parameters object.
 Note: This technically breaks compatibility with the OpenAPI 2 definition structure as we only
 allow header parameters to be set here since we do not want users specifying custom non-header
 parameters beyond those inferred from the Protobuf schema.
 See: https://swagger.io/specification/v2/#parameter-object


�
�
 �'� `Headers` is one or more HTTP header parameter.
 See: https://swagger.io/docs/specification/2-0/describing-parameters/#header-parameters


 �


 �

 �"

 �%&
v
� �h `HeaderParameter` a HTTP header parameter.
 See: https://swagger.io/specification/v2/#parameter-object


�
t
 ��d `Type` is a a supported HTTP header type.
 See https://swagger.io/specification/v2/#parameterType.


 �

  �

  �

  �

 �

 �


 �

 �

 �


 �

 �

 �

 �

 �

 �

 �
*
 � `Name` is the header name.


 �

 �	

 �
C
�5 `Description` is a short description of the header.


�

�	

�
�
�� `Type` is the type of the object. The value MUST be one of "string", "number", "integer", or "boolean". The "array" type is not supported.
 See: https://swagger.io/specification/v2/#parameterType.


�

�

�
P
�B `Format` The extending format for the previously mentioned type.


�

�	

�
>
�0 `Required` indicates if the header is optional


�

�

�
L
	�? field 6 is reserved for 'items', but in OpenAPI-specific way.


	 �

	 �
q
	�d field 7 is reserved `Collection Format`. Determines the format of the array if type array is used.


	�

	�
�
� �� `Header` is a representation of OpenAPI v2 specification's Header object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#headerObject



�
C
 �5 `Description` is a short description of the header.


 �

 �	

 �
�
�� The type of the object. The value MUST be one of "string", "number", "integer", or "boolean". The "array" type is not supported.


�

�	

�
P
�B `Format` The extending format for the previously mentioned type.


�

�	

�
L
	�? field 4 is reserved for 'items', but in OpenAPI-specific way.


	 �

	 �
p
	�c field 5 is reserved `Collection Format` Determines the format of the array if type array is used.


	�

	�
�
�� `Default` Declares the value of the header that the server will use if none is provided.
 See: https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-6.2.
 Unlike JSON Schema this value MUST conform to the defined type for the header.


�

�	

�
1
	�$ field 7 is reserved for 'maximum'.


	�

	�
:
	�- field 8 is reserved for 'exclusiveMaximum'.


	�

	�
1
	�$ field 9 is reserved for 'minimum'.


	�

	�
;
	�. field 10 is reserved for 'exclusiveMinimum'.


	�

	�
4
	�' field 11 is reserved for 'maxLength'.


	�

	�
4
	�' field 12 is reserved for 'minLength'.


	�

	�
l
�^ 'Pattern' See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.2.3.


�

�	

�
3
	�& field 14 is reserved for 'maxItems'.


	�

	�
3
	�& field 15 is reserved for 'minItems'.


		�

		�
6
	�) field 16 is reserved for 'uniqueItems'.


	
�

	
�
/
	�" field 17 is reserved for 'enum'.


	�

	�
5
	�( field 18 is reserved for 'multipleOf'.


	�

	�
�
� �� `Response` is a representation of OpenAPI v2 specification's Response object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#responseObject



�
{
 �m `Description` is a short description of the response.
 GFM syntax can be used for rich text representation.


 �

 �	

 �
�
�� `Schema` optionally defines the structure of the response.
 If `Schema` is not provided, it means there is no content to the response.


�

�	

�
�
�"� `Headers` A list of headers that are sent with the response.
 `Header` name is expected to be a string in the canonical format of the MIME header key
 See: https://golang.org/pkg/net/textproto/#CanonicalMIMEHeaderKey


�

�

� !
�
�#� `Examples` gives per-mimetype response examples.
 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#example-object


�

�

�!"
�
�4� Custom properties that start with "x-" such as "x-foo" used to describe
 extra functionality that is not covered by the standard OpenAPI Specification.
 See: https://swagger.io/docs/specification/2-0/swagger-extensions/


�$

�%/

�23
�
� �� `Info` is a representation of OpenAPI v2 specification's Info object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#infoObject

 Example:

  option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
    info: {
      title: "Echo API";
      version: "1.0";
      description: "";
      contact: {
        name: "gRPC-Gateway project";
        url: "https://github.com/grpc-ecosystem/grpc-gateway";
        email: "none@example.com";
      };
      license: {
        name: "BSD 3-Clause License";
        url: "https://github.com/grpc-ecosystem/grpc-gateway/blob/main/LICENSE.txt";
      };
    };
    ...
  };



�
-
 � The title of the application.


 �

 �	

 �
m
�_ A short description of the application. GFM syntax can be used for rich
 text representation.


�

�	

�
1
�# The Terms of Service for the API.


�

�	

�
<
�. The contact information for the exposed API.


�	

�


�
<
�. The license information for the exposed API.


�	

�


�
q
�c Provides the version of the application API (not to be confused
 with the specification version).


�

�	

�
�
�4� Custom properties that start with "x-" such as "x-foo" used to describe
 extra functionality that is not covered by the standard OpenAPI Specification.
 See: https://swagger.io/docs/specification/2-0/swagger-extensions/


�$

�%/

�23
�
� �� `Contact` is a representation of OpenAPI v2 specification's Contact object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#contactObject

 Example:

  option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
    info: {
      ...
      contact: {
        name: "gRPC-Gateway project";
        url: "https://github.com/grpc-ecosystem/grpc-gateway";
        email: "none@example.com";
      };
      ...
    };
    ...
  };



�
H
 �: The identifying name of the contact person/organization.


 �

 �	

 �
]
�O The URL pointing to the contact information. MUST be in the format of a
 URL.


�

�	

�
q
�c The email address of the contact person/organization. MUST be in the format
 of an email address.


�

�	

�
�
� �� `License` is a representation of OpenAPI v2 specification's License object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#licenseObject

 Example:

  option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
    info: {
      ...
      license: {
        name: "BSD 3-Clause License";
        url: "https://github.com/grpc-ecosystem/grpc-gateway/blob/main/LICENSE.txt";
      };
      ...
    };
    ...
  };



�
2
 �$ The license name used for the API.


 �

 �	

 �
V
�H A URL to the license used for the API. MUST be in the format of a URL.


�

�	

�
�
	� �� `ExternalDocumentation` is a representation of OpenAPI v2 specification's
 ExternalDocumentation object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#externalDocumentationObject

 Example:

  option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
    ...
    external_docs: {
      description: "More about gRPC-Gateway";
      url: "https://github.com/grpc-ecosystem/grpc-gateway";
    }
    ...
  };



	�
v
	 �h A short description of the target documentation. GFM syntax can be used for
 rich text representation.


	 �

	 �	

	 �
\
	�N The URL for the target documentation. Value MUST be in the format
 of a URL.


	�

	�	

	�
�

� �� `Schema` is a representation of OpenAPI v2 specification's Schema object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject




�


 �


 �


 �


 �
�

�� Adds support for polymorphism. The discriminator is the schema property
 name that is used to differentiate between other schema that inherit this
 schema. The property name used MUST be defined at this schema and it MUST
 be in the required property list. When used, the value MUST be the name of
 this schema or any schema that inherits it.



�


�	


�
�

�� Relevant only for Schema "properties" definitions. Declares the property as
 "read only". This means that it MAY be sent as part of a response but MUST
 NOT be sent as part of the request. Properties marked as readOnly being
 true SHOULD NOT be in the required list of the defined schema. Default
 value is false.



�


�


�
-

	�  field 4 is reserved for 'xml'.



	 �


	 �
B

�*4 Additional external documentation for this schema.



�


�%


�()
�

�| A free-form property to include an example of an instance for this schema in JSON.
 This is copied verbatim to the output.



�


�	


�
�
� �� `JSONSchema` represents properties from JSON Schema taken, and as used, in
 the OpenAPI v2 spec.

 This includes changes made by OpenAPI v2.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject

 See also: https://cswr.github.io/JsonSchema/spec/basic_types/,
 https://github.com/json-schema-org/json-schema-spec/blob/master/schema.json

 Example:

  message SimpleMessage {
    option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_schema) = {
      json_schema: {
        title: "SimpleMessage"
        description: "A simple message."
        required: ["id"]
      }
    };

    // Id represents the message identifier.
    string id = 1; [
        (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_field) = {
          description: "The unique identifier of the simple message."
        }];
  }



�
F
	�9 field 1 is reserved for '$id', omitted from OpenAPI v2.


	 �

	 �
J
	�= field 2 is reserved for '$schema', omitted from OpenAPI v2.


	�

	�
�
 �� Ref is used to define an external reference to include in the message.
 This could be a fully qualified proto message reference, and that type must
 be imported into the protofile. If no message is identified, the Ref will
 be used verbatim in the output.
 For example:
  `ref: ".google.protobuf.Timestamp"`.


 �

 �	

 �
K
	�> field 4 is reserved for '$comment', omitted from OpenAPI v2.


	�

	�
(
� The title of the schema.


�

�	

�
2
�$ A short description of the schema.


�

�	

�

�

�

�	

�

�

�

�

�
�
�� A free-form property to include a JSON example of this field. This is copied
 verbatim to the output swagger.json. Quotes must be escaped.
 This property is the same for 2.0 and 3.0.0 https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/3.0.0.md#schemaObject  https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject


�

�	

�

�

�

�	

�
s
�e Maximum represents an inclusive upper limit for a numeric instance. The
 value of MUST be a number,


�

�	

�

�

�

�

�
s
	�e minimum represents an inclusive lower limit for a numeric instance. The
 value of MUST be a number,


	�

	�	

	�


�


�


�


�

�

�

�	

�

�

�

�	

�

�

�

�	

�
S
	�F field 18 is reserved for 'additionalItems', omitted from OpenAPI v2.


	�

	�
j
	�] field 19 is reserved for 'items', but in OpenAPI-specific way.
 TODO(ivucica): add 'items'?


	�

	�

�

�

�	

�

�

�

�	

�

�

�

�

�
L
	�? field 23 is reserved for 'contains', omitted from OpenAPI v2.


	�

	�

�

�

�	

�

�

�

�	

�

� 

�


�

�

�
�
	�{ field 27 is reserved for 'additionalProperties', but in OpenAPI-specific
 way. TODO(ivucica): add 'additionalProperties'?


	�

	�
O
	�B field 28 is reserved for 'definitions', omitted from OpenAPI v2.


	�

	�
~
	�q field 29 is reserved for 'properties', but in OpenAPI-specific way.
 TODO(ivucica): add 'additionalProperties'?


	�

	�
�
	�� following fields are reserved, as the properties have been omitted from
 OpenAPI v2:
 patternProperties, dependencies, propertyNames, const


		�

		�

		�
0
�" Items in 'array' must be unique.


�


�

�

�

 ��

 �

  �

  �

  �

 �

 �	

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �


 �

 �

 �


 �

 �

 �


 �

�+

�


� 

�!%

�(*

�
 `Format`


�

�	

�
�
	�� following fields are reserved, as the properties have been omitted from
 OpenAPI v2: contentMediaType, contentEncoding, if, then, else


	
�

	
�

	
�
j
	�] field 42 is reserved for 'allOf', but in OpenAPI-specific way.
 TODO(ivucica): add 'allOf'?


	�

	�
v
	�i following fields are reserved, as the properties have been omitted from
 OpenAPI v2:
 anyOf, oneOf, not


	�

	�

	�
|
�n Items in `enum` must be unique https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.5.1


�


�

�

�
[
�0M Additional field level properties used when generating the OpenAPI v2 file.


�

�(

�+/
�
 ��� 'FieldConfiguration' provides additional field level properties used when generating the OpenAPI v2 file.
 These properties are not defined by OpenAPIv2, but they are used to control the generation.


 �

�
  � � Alternative parameter name when used as path parameter. If set, this will
 be used as the complete parameter name when this field is used as a path
 parameter. Use this to avoid having auto generated path parameter names
 for overlapping paths.


  �


  �

  �
�
�5� Custom properties that start with "x-" such as "x-foo" used to describe
 extra functionality that is not covered by the standard OpenAPI Specification.
 See: https://swagger.io/docs/specification/2-0/swagger-extensions/


�$

�%/

�24
�
� �� `Tag` is a representation of OpenAPI v2 specification's Tag object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#tagObject



�
�
 �� The name of the tag. Use it to allow override of the name of a
 global Tag object, then use that name to reference the tag throughout the
 OpenAPI file.


 �

 �	

 �
f
�X A short description for the tag. GFM syntax can be used for rich text
 representation.


�

�	

�
?
�*1 Additional external documentation for this tag.


�

�%

�()
�
�4� Custom properties that start with "x-" such as "x-foo" used to describe
 extra functionality that is not covered by the standard OpenAPI Specification.
 See: https://swagger.io/docs/specification/2-0/swagger-extensions/


�$

�%/

�23
�
� �� `SecurityDefinitions` is a representation of OpenAPI v2 specification's
 Security Definitions object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securityDefinitionsObject

 A declaration of the security schemes available to be used in the
 specification. This does not enforce the security schemes on the operations
 and only serves to provide the relevant details for each scheme.


�
`
 �+R A single security scheme definition, mapping a "name" to the scheme it
 defines.


 �

 �&

 �)*
�
� �� `SecurityScheme` is a representation of OpenAPI v2 specification's
 Security Scheme object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securitySchemeObject

 Allows the definition of a security scheme that can be used by the
 operations. Supported schemes are basic authentication, an API key (either as
 a header or as a query parameter) and OAuth2's common flows (implicit,
 password, application and access code).


�
c
 ��S The type of the security scheme. Valid values are "basic",
 "apiKey" or "oauth2".


 �

  �

  �

  �

 �

 �

 �

 �

 �

 �

 �

 �

 �
T
��D The location of the API key. Valid values are "query" or "header".


�	

 �

 �

 �

�

�

�

�

�

�
�
��w The flow used by the OAuth2 security scheme. Valid values are
 "implicit", "password", "application" or "accessCode".


�

 �

 �

 �

�

�

�

�

�

�

�

�

�

�

�

�
a
 �S The type of the security scheme. Valid values are "basic",
 "apiKey" or "oauth2".


 �

 �

 �
8
�* A short description for security scheme.


�

�	

�
X
�J The name of the header or query parameter to be used.
 Valid for apiKey.


�

�	

�
f
�X The location of the API key. Valid values are "query" or
 "header".
 Valid for apiKey.


�

�

�

�
�� The flow used by the OAuth2 security scheme. Valid values are
 "implicit", "password", "application" or "accessCode".
 Valid for oauth2.


�

�

�
�
�� The authorization URL to be used for this flow. This SHOULD be in
 the form of a URL.
 Valid for oauth2/implicit and oauth2/accessCode.


�

�	

�
�
�� The token URL to be used for this flow. This SHOULD be in the
 form of a URL.
 Valid for oauth2/password, oauth2/application and oauth2/accessCode.


�

�	

�
W
�I The available scopes for the OAuth2 security scheme.
 Valid for oauth2.


�

�	

�
�
�4� Custom properties that start with "x-" such as "x-foo" used to describe
 extra functionality that is not covered by the standard OpenAPI Specification.
 See: https://swagger.io/docs/specification/2-0/swagger-extensions/


�$

�%/

�23
�
� �� `SecurityRequirement` is a representation of OpenAPI v2 specification's
 Security Requirement object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securityRequirementObject

 Lists the required security schemes to execute this operation. The object can
 have multiple security schemes declared in it which are all required (that
 is, there is a logical AND between the schemes).

 The name used for each property MUST correspond to a security scheme
 declared in the Security Definitions.


�
�
 ��� If the security scheme is of type "oauth2", then the value is a list of
 scope names required for the execution. For other security scheme types,
 the array MUST be empty.


 �
"

  �

  �

  �

  �

  �
�
 �A� Each name must correspond to a security scheme which is declared in
 the Security Definitions. If the security scheme is of type "oauth2",
 then the value is a list of scope names required for the execution.
 For other security scheme types, the array MUST be empty.


 �'

 �(<

 �?@
�
� �� `Scopes` is a representation of OpenAPI v2 specification's Scopes object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#scopesObject

 Lists the available scopes for an OAuth2 security scheme.


�
l
 � ^ Maps between a name of a scope to a short description of it (as the value
 of the property).


 �

 �

 �bproto3�� 
�
.protoc-gen-openapiv2/options/annotations.proto)grpc.gateway.protoc_gen_openapiv2.options google/protobuf/descriptor.proto,protoc-gen-openapiv2/options/openapiv2.proto:~
openapiv2_swagger.google.protobuf.FileOptions� (22.grpc.gateway.protoc_gen_openapiv2.options.SwaggerRopenapiv2Swagger:�
openapiv2_operation.google.protobuf.MethodOptions� (24.grpc.gateway.protoc_gen_openapiv2.options.OperationRopenapiv2Operation:~
openapiv2_schema.google.protobuf.MessageOptions� (21.grpc.gateway.protoc_gen_openapiv2.options.SchemaRopenapiv2Schema:u
openapiv2_tag.google.protobuf.ServiceOptions� (2..grpc.gateway.protoc_gen_openapiv2.options.TagRopenapiv2Tag:~
openapiv2_field.google.protobuf.FieldOptions� (25.grpc.gateway.protoc_gen_openapiv2.options.JSONSchemaRopenapiv2FieldBHZFgithub.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/optionsJ�
  +

  

 2
	
  *
	
 6

 ]
	
 ]
	
	 
�
 #� ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



 	"


 	


 



 "
	
 
�
'� ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



$








"&
	
 
�
!� ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



%





	


 
	
 $
�
#� ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



%


#


#


#
	
% +
�
*$� ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



%#


*


*


*#bproto3�� 
�
%kentik/core/v202303/annotations.protokentik.core.v202303 google/protobuf/descriptor.proto*�
ServiceVisibility
SERVICE_VISIBILITY_PRIVATE  
SERVICE_VISIBILITY_PROTECTED
SERVICE_VISIBILITY_INTERNAL
SERVICE_VISIBILITY_PUBLIC$
 SERVICE_VISIBILITY_PUBLIC_KENTIK*�
MethodVisibility!
METHOD_VISIBILITY_UNSPECIFIED 
METHOD_VISIBILITY_PRIVATE
METHOD_VISIBILITY_PROTECTED
METHOD_VISIBILITY_INTERNAL
METHOD_VISIBILITY_PUBLIC#
METHOD_VISIBILITY_PUBLIC_KENTIK:E
service_scope.google.protobuf.ServiceOptions�* (	RserviceScope:I
private_service.google.protobuf.ServiceOptions�* (RprivateService:h

visibility.google.protobuf.ServiceOptions�+ (2&.kentik.core.v202303.ServiceVisibilityR
visibility:B
method_scope.google.protobuf.MethodOptions�* (	RmethodScope:F
private_method.google.protobuf.MethodOptions�+ (RprivateMethod:H
method_category.google.protobuf.MethodOptions�+ (	RmethodCategory:L
method_permission.google.protobuf.MethodOptions�+ (	RmethodPermission:s
method_visibility.google.protobuf.MethodOptions�+ (2%.kentik.core.v202303.MethodVisibilityRmethodVisibilityBLZJgithub.com/kentik/api-schema-public/gen/go/kentik/core/v202303;kentik_coreJ�
 <

 2 Error information


 

 a
	
 a
	
  *

 
  {{.Name}}



 

9
  !, private services not served by API gateway


  

   
8
 #+ non-public services served by API gateway


 

 !"
C
 "6 internal services (not accessible from the internet)


 

  !
.
  ! public customer facing services


 

 
L
 '? public facing endpoints that are only used by kentik services


 "

 %&

 % {{.Name}}




C
 $6 when unspecified, method will use service visibility


 

 "#
9
 , private services not served by API gateway





8
"+ non-public services served by API gateway




 !
C
 !6 internal services (not accessible from the internet)


 

  
.
"! public customer facing services


"

"
L
$&? public facing endpoints that are only used by kentik services


$!

$$%
	
' .
(
 ) auth scope for this service



 '%


 )


 )	


 )
f
+[ private_service indicates that the service is not handled by the API gateway (deprecated)



'%


+


+


+
v
-&k visibility provides label allowing to guid publishing of schemas and placement of service on API gateways



'%


-


-


-!%
	
0 <
(
2 auth scope for this service



0$


2


2	


2
P
4E private_method indicates that this method is not publicly available



0$


4


4


4
]
6 R method classification to identify areas of functionality (used for metrics etc.)



0$


6


6	


6
�
9"� method permission string used by the RBAC system
 API user must posses permission covering the method permission in order to be authorized to invoke the method



0$


9


9	


9!
u
;,j method_visibility provides label allowing api owners optionally define a different visibility for an rpc



0$


;


;$


;'+bproto3��  
�A
&kentik/as_group/v202212/as_group.protokentik.as_group.v202212google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"8
AutonomousSystem
asn (Rasn
name (	Rname"�
ASGroupConcise;
id (	B+�A$2"System generated unique identifier�ARid6
name (	B"�A2User selected unique name�ARname#
asn (	B�A2List of ASNsRasn`
created_date (2.google.protobuf.TimestampB!�A2Creation timestamp (UTC)�ARcreatedDatei
updated_date (2.google.protobuf.TimestampB*�A#2!Last modification timestamp (UTC)�ARupdatedDate"�
ASGroupDetailed;
id (	B+�A$2"System generated unique identifier�ARid6
name (	B"�A2User selected unique name�ARnameN
asn (2).kentik.as_group.v202212.AutonomousSystemB�A2List of ASNsRasn`
created_date (2.google.protobuf.TimestampB!�A2Creation timestamp (UTC)�ARcreatedDatei
updated_date (2.google.protobuf.TimestampB*�A#2!Last modification timestamp (UTC)�ARupdatedDate"
ListASGroupsRequest"�
ListASGroupsResponsey
	as_groups (2(.kentik.as_group.v202212.ASGroupDetailedB2�A/2-List of configurations of requested AS groupsRasGroupse
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"J
GetASGroupRequest5
id (	B%�A2ID of the requested AS group�ARid"�
GetASGroupResponseq
as_group (2(.kentik.as_group.v202212.ASGroupDetailedB,�A)2'Configuration of the requested AS groupRasGroup"�
CreateASGroupRequestn
as_group (2'.kentik.as_group.v202212.ASGroupConciseB*�A#2!Configuration of the new AS group�ARasGroup"�
CreateASGroupResponseu
as_group (2(.kentik.as_group.v202212.ASGroupDetailedB0�A-2+Configuration of the newly created AS groupRasGroup"�
UpdateASGroupRequest�
as_group (2'.kentik.as_group.v202212.ASGroupConciseBD�A=2;New configuration attributes for the AS group to be updated�ARasGroup"�
UpdateASGroupResponseo
as_group (2(.kentik.as_group.v202212.ASGroupDetailedB*�A'2%Updated configuration of the AS groupRasGroup"Q
DeleteASGroupRequest9
id (	B)�A"2 ID of the AS group to be deleted�ARid"
DeleteASGroupResponse2�
ASGroupService�
ListASGroups,.kentik.as_group.v202212.ListASGroupsRequest-.kentik.as_group.v202212.ListASGroupsResponse"��AJList all AS groups.%Returns list of configured AS groups.*ListASGroups��admin.as_group:read���/as_group/v202212/as_group�

GetASGroup*.kentik.as_group.v202212.GetASGroupRequest+.kentik.as_group.v202212.GetASGroupResponse"��Ai%Retrieve configuration of a AS group.4Returns configuration of a AS group specified by ID.*
GetASGroup��admin.as_group:read���!/as_group/v202212/as_group/{id}�
CreateASGroup-.kentik.as_group.v202212.CreateASGroupRequest..kentik.as_group.v202212.CreateASGroupResponse"��A}Configure a new AS group.QCreate configuration for a new AS group. Returns the newly created configuration.*CreateASGroup��admin.as_group:write���"/as_group/v202212/as_group:*�
UpdateASGroup-.kentik.as_group.v202212.UpdateASGroupRequest..kentik.as_group.v202212.UpdateASGroupResponse"��A�$Updates configuration of a AS group.gReplaces configuration of a AS group with attributes in the request. Returns the updated configuration.*UpdateASGroup��admin.as_group:write���-(/as_group/v202212/as_group/{as_group.id}:*�
DeleteASGroup-.kentik.as_group.v202212.DeleteASGroupRequest..kentik.as_group.v202212.DeleteASGroupResponse"��Ak#Delete configuration of a AS group.5Deletes configuration of a AS group with specific ID.*DeleteASGroup��admin.as_group:write���!*/as_group/v202212/as_group/{id},�Agrpc.api.kentik.com��admin.as_group��B�ZKgithub.com/kentik/api-schema-public/gen/go/kentik/as_group/v202212;as_group�A��
AS Group Configuration API�# Overview
The AS Group Configuration API provides programmatic access to configuration of AS Groups:

* **AS Group**: ASNs can be logically grouped into an AS group."E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202212*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�
  �

  

  

 b
	
 b
	
  &
	
 !
	
 )
	
 )
	
	 8
	

 /
	
 ;

� ;
`
 A D {{.Name}}
2G ASGroup CRUD
 -------------------------------------------------------



 A

  B

  B

  B	

  B

 C

 C

 C	

 C

G e {{.Name}}



G

 HM

 H

 H	

 H

 HM

 � I-

 �JL

NS

N

N	

N

NS

�OQ

� R*

TX

T


T

T

T

TX

�UW

Y^

Y

Y(

Y+,

Y-^

� Z-

�[]

_d

_

_(

_+,

_-d

� `-

�ac

h � {{.Name}}



h

 in

 i

 i	

 i

 in

 � j-

 �km

ot

o

o	

o

ot

�pr

� s*

uy

u


u

u

u"#

u%y

�vx

z

z

z(

z+,

z-

� {-

�|~

��

�

�(

�+,

�-�

� �-

���

�  {{.Name}}


�

� � {{.Name}}


�

 ��

 �


 �

 �$

 �'(

 �)�

 ���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

 � �*

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

 � �*

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

	� � {{.Name}}


	�

	 ��

	 �

	 �

	 �

	 ��

	 ���

	 � �*


� � {{.Name}}



�


 ��


 �


 �


 �


 ��


 ���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

 � �*

�   {{.Name}}


�
Z
 � �2L services and RPCs
 -------------------------------------------------------


 �

 �;

 ��;

 �F

 �+�F

 �@

 �*�@
#
  ��2 --- AS Groups ---


  �

  �&

  �1E

  �F

  �*�F

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �"

 �-?

 �F

 �*�F

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �G

 �*�G

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �G

 �*�G

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �G

 �*�G

 ��

	 �ʼ"��

 ��

 ���bproto3��  
�
#kentik/core/v202303/user_info.protokentik.core.v202303.protoc-gen-openapiv2/options/annotations.protogoogle/api/field_behavior.proto"�
UserInfo3
id (	B#�A2Unique system generated ID�ARid9
email (	B#�A2E-mail address of the user�ARemail;
	full_name (	B�A2Full name of the user�ARfullNameBLZJgithub.com/kentik/api-schema-public/gen/go/kentik/core/v202303;kentik_coreJ�
 
,
 2" Kentik User identity information


 

 a
	
 a
	
  8
	
 )

   {{.Name}}



 

  

  

  	

  

  

  � -

  �

 

 

 	

 

 

 � -

 �

 

 

 	

 

 

 � -

 �bproto3��  
�
"kentik/net/v202303/bgp_types.protokentik.net.v202303google/api/field_behavior.proto.protoc-gen-openapiv2/options/annotations.proto"�
VantagePointA
dataset (	B'�A 2Name of the collector data set�ARdataset<
	collector (	B�A2Name of the collector�AR	collector^
peer_asn (BC�A<2:ASN of the peer from which the collector receives BGP data�ARpeerAsnc
peer_ip (	BJ�AC2AIP address of the peer from which the collector receives BGP data�ARpeerIp*4
Afi
AFI_UNSPECIFIED 
AFI_IP4
AFI_IP6*N
Safi
SAFI_UNSPECIFIED 
SAFI_UNICAST
	SAFI_MPLS

SAFI_L3VPN�*�

RpkiStatus
RPKI_STATUS_UNSPECIFIED 
RPKI_STATUS_NOT_FOUND 
RPKI_STATUS_EXPLICIT_INVALID
RPKI_STATUS_INVALID_PREFIX
RPKI_STATUS_INVALID
RPKI_STATUS_VALID
RPKI_STATUS_ERRORBJZHgithub.com/kentik/api-schema-public/gen/go/kentik/net/v202303;kentik_netJ�
 E
!
 2 Common BGP data types


 

 _
	
 _
	
  )
	
 8

   {{.Name}}



 

  

  

  

 

 	

 

 

 	

 

  {{.Name}}



	

 

 

 



















 ) {{.Name}}





  Invalid value.


 

 
5
( No matching ROAs found for the prefix.





5
 #( Explicitly invalid prefix matching ROA


 

 !"
8
"!+ Prefix format not suitable for validation


"

" 
<
$/ Prefix origin does not match any matching ROA


$

$
+
& Prefix origin matches an ROA


&

&
&
( Error during validation


(

(

 , E {{.Name}}



 ,

  -2

  -

  -	

  -

  -2

  �.0

  � 1-

 38

 3

 3	

 3

 38

 �46

 � 7-

 9>

 9

 9	

 9

 9>

 �:<

 � =-

 ?D

 ?

 ?	

 ?

 ?D

 �@B

 � C-bproto3��  
�n
7kentik/bgp_monitoring/v202205beta1/bgp_monitoring.proto"kentik.bgp_monitoring.v202205beta1google/api/annotations.protogoogle/api/client.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto#kentik/core/v202303/user_info.proto"kentik/net/v202303/bgp_types.proto"�
Nlri)
afi (2.kentik.net.v202303.AfiRafi,
safi (2.kentik.net.v202303.SafiRsafi
prefix (	H RprefixB
type"{
BgpHealthSettings1
reachability_warning (RreachabilityWarning3
reachability_critical (RreachabilityCritical"�
BgpMonitorSettings!
allowed_asns (RallowedAsnsB
targets (2(.kentik.bgp_monitoring.v202205beta1.NlriRtargets

check_rpki (R	checkRpki8
include_covered_prefixes (RincludeCoveredPrefixes^
health_settings (25.kentik.bgp_monitoring.v202205beta1.BgpHealthSettingsRhealthSettings3
notification_channels (	RnotificationChannels"�

BgpMonitor
id (	Rid
name (	RnameL
status (24.kentik.bgp_monitoring.v202205beta1.BgpMonitorStatusRstatusR
settings (26.kentik.bgp_monitoring.v202205beta1.BgpMonitorSettingsRsettings0
cdate (2.google.protobuf.TimestampRcdate0
edate (2.google.protobuf.TimestampRedate<

created_by (2.kentik.core.v202303.UserInfoR	createdByE
last_updated_by (2.kentik.core.v202303.UserInfoRlastUpdatedBy
labels	 (	Rlabels"�
	RouteInfo<
nlri (2(.kentik.bgp_monitoring.v202205beta1.NlriRnlriU

origin_asn (B6�A321The autonomous system number originating the NLRIR	originAsnP
as_path (	B7�A422AS path observed at the vantage point for the NLRIRasPath
vantage_point (2 .kentik.net.v202303.VantagePointB8�A523Name of the vantage point providing the observationRvantagePoint?
rpki_status (2.kentik.net.v202303.RpkiStatusR
rpkiStatus
nexthop (	Rnexthop"�
	BgpMetric8
	timestamp (2.google.protobuf.TimestampR	timestamp<
nlri (2(.kentik.bgp_monitoring.v202205beta1.NlriRnlri$
reachability (H Rreachability#
path_changes (H RpathChangesB
type"
ListMonitorsRequest"�
ListMonitorsResponseJ
monitors (2..kentik.bgp_monitoring.v202205beta1.BgpMonitorRmonitors#
invalid_count (RinvalidCount"`
CreateMonitorRequestH
monitor (2..kentik.bgp_monitoring.v202205beta1.BgpMonitorRmonitor"a
CreateMonitorResponseH
monitor (2..kentik.bgp_monitoring.v202205beta1.BgpMonitorRmonitor"#
GetMonitorRequest
id (	Rid"^
GetMonitorResponseH
monitor (2..kentik.bgp_monitoring.v202205beta1.BgpMonitorRmonitor"`
UpdateMonitorRequestH
monitor (2..kentik.bgp_monitoring.v202205beta1.BgpMonitorRmonitor"a
UpdateMonitorResponseH
monitor (2..kentik.bgp_monitoring.v202205beta1.BgpMonitorRmonitor"&
DeleteMonitorRequest
id (	Rid"
DeleteMonitorResponse"w
SetMonitorStatusRequest
id (	RidL
status (24.kentik.bgp_monitoring.v202205beta1.BgpMonitorStatusRstatus"
SetMonitorStatusResponse"�
GetMetricsForTargetRequest9

start_time (2.google.protobuf.TimestampR	startTime5
end_time (2.google.protobuf.TimestampRendTime@
target (2(.kentik.bgp_monitoring.v202205beta1.NlriRtarget'
include_covered (RincludeCoveredK
metrics (21.kentik.bgp_monitoring.v202205beta1.BgpMetricTypeRmetrics"f
GetMetricsForTargetResponseG
metrics (2-.kentik.bgp_monitoring.v202205beta1.BgpMetricRmetrics"�
GetRoutesForTargetRequest.
time (2.google.protobuf.TimestampRtime@
target (2(.kentik.bgp_monitoring.v202205beta1.NlriRtarget'
include_covered (RincludeCovered

check_rpki (R	checkRpki"�
GetRoutesForTargetResponseE
routes (2-.kentik.bgp_monitoring.v202205beta1.RouteInfoRroutesf
as_names (2K.kentik.bgp_monitoring.v202205beta1.GetRoutesForTargetResponse.AsNamesEntryRasNames:
AsNamesEntry
key (Rkey
value (	Rvalue:8*�
BgpMonitorStatus"
BGP_MONITOR_STATUS_UNSPECIFIED 
BGP_MONITOR_STATUS_ACTIVE
BGP_MONITOR_STATUS_PAUSED
BGP_MONITOR_STATUS_DELETED*t
BgpMetricType
BGP_METRIC_TYPE_UNSPECIFIED  
BGP_METRIC_TYPE_REACHABILITY 
BGP_METRIC_TYPE_PATH_CHANGES2�
BgpMonitoringAdminService�
ListMonitors7.kentik.bgp_monitoring.v202205beta1.ListMonitorsRequest8.kentik.bgp_monitoring.v202205beta1.ListMonitorsResponse"��ACList BGP Monitors.Returns a list of BGP monitors.*MonitorsList��admin.synthetics:read���'%/bgp_monitoring/v202205beta1/monitors�
CreateMonitor8.kentik.bgp_monitoring.v202205beta1.CreateMonitorRequest9.kentik.bgp_monitoring.v202205beta1.CreateMonitorResponse"J��admin.synthetics:write���*"%/bgp_monitoring/v202205beta1/monitors:*�

GetMonitor5.kentik.bgp_monitoring.v202205beta1.GetMonitorRequest6.kentik.bgp_monitoring.v202205beta1.GetMonitorResponse"��AcGet BGP Monitor configuration.5Return configuration of BGP monitor with specific ID.*
MonitorGet��admin.synthetics:read���,*/bgp_monitoring/v202205beta1/monitors/{id}�
UpdateMonitor8.kentik.bgp_monitoring.v202205beta1.UpdateMonitorRequest9.kentik.bgp_monitoring.v202205beta1.UpdateMonitorResponse"��A�!Update BGP Monitor configuration.\Update configuration of BGP monitor with specific ID. Returns updated monitor configuration.*MonitorUpdate��admin.synthetics:write���72/bgp_monitoring/v202205beta1/monitors/{monitor.id}:*�
DeleteMonitor8.kentik.bgp_monitoring.v202205beta1.DeleteMonitorRequest9.kentik.bgp_monitoring.v202205beta1.DeleteMonitorResponse"��APDelete BGP Monitor.*Delete BGP monitor with  with specific ID.*MonitorDelete��admin.synthetics:write���,**/bgp_monitoring/v202205beta1/monitors/{id}�
SetMonitorStatus;.kentik.bgp_monitoring.v202205beta1.SetMonitorStatusRequest<.kentik.bgp_monitoring.v202205beta1.SetMonitorStatusResponse"��A_Set status of BGP monitor./Set the status of BGP monitor with specific ID.*SetMonitorStatus��admin.synthetics:write���61/bgp_monitoring/v202205beta1/monitors/{id}/status:*.�Agrpc.api.kentik.com��admin.synthetics��2�
BgpMonitoringDataService�
GetMetricsForTarget>.kentik.bgp_monitoring.v202205beta1.GetMetricsForTargetRequest?.kentik.bgp_monitoring.v202205beta1.GetMetricsForTargetResponse"��A�-Get metrics for a single BGP target (prefix).FRetrieve metric data for single BGP target (prefix) and time interval.*GetMetricsForTarget��synthetics:read���)"$/bgp_monitoring/v202205beta1/metrics:*�
GetRoutesForTarget=.kentik.bgp_monitoring.v202205beta1.GetRoutesForTargetRequest>.kentik.bgp_monitoring.v202205beta1.GetRoutesForTargetResponse"��A�*Get routes for single BGP target (prefix).HRetrieve route information for signle BGP target (prefix) and timestamp.*GetRoutesForTarget��synthetics:read���("#/bgp_monitoring/v202205beta1/routes:*(�Agrpc.api.kentik.com��
synthetics��B�Z\github.com/kentik/api-schema-public/gen/go/kentik/bgp_monitoring/v202205beta1;bgp_monitoring�A��
BGP Monitoring APIK--- This API has been deprecated and will be removed in the near future ---"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202205beta1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�4
  �

  

 +

 s
	
 s
	
  &
	
 !
	
 )
	
 8
	

 /
	
 -
	
 ,
	
 ;

� ;
v
 B G2 models
2` === BGP monitor config and status ===
 -------------------------------------------------------



 B

  C'" Invalid value.


  C"

  C%&
!
 D"" Monitor is active.


 D

 D !
!
 E"" Monitor is paused.


 E

 E !
E
 F#"8 Monitor is deleted. Not settable via SetMonitorStatus.


 F

 F!"


 I O


 I

  J!

  J

  J

  J 

 K#

 K

 K

 K!"

  LN

  L

 M

 M

 M

 M


Q T


Q

 R!

 R

 R

 R 

S"

S

S

S !


V ]


V

 W#

 W


 W

 W

 W!"

X

X


X

X

X

Y

Y

Y

Y

Z$

Z

Z

Z"#

[(

[

[#

[&'

\,

\


\

\'

\*+


_ i


_

 `

 `


 `

 `

a

a


a

a

b 

b

b

b

c$

c

c

c"#

d(

d

d#

d&'

e(

e

e#

e&'

f0

f 

f!+

f./

g5

g 

g!0

g34

h

h

h

h

h
e
n r2Y === BGP monitoring results ===
 -------------------------------------------------------



n

 o"" Invalid value.


 o

 o !

p#

p

p!"

q#

q

q!"


t ~


t

 u

 u

 u

 u

vy

v

v	

v

vy

�vx

z�

z


z

z

z

z�

�z�

{�

{!

{"/

{23

{4�

�{5�

|0

|

| +

|./

}

}

}	

}

� �

�

 �,

 �

 �'

 �*+

�

�

�	

�

 ��

 �

K
�= percentage of vantage points reporting the prefix reachable


�

�

�
m
�_ number of AS path changes for the prefix across all vantage points in the queried time period


�

�

�
:
�  Admin Service
2 === BGP monitoring services


�

� �

�

 �%

 �

 �

 � 

 �#$

�

�


�

�

� �

�

 �

 �

 �

 �

	� �

	�

	 �

	 �

	 �

	 �


� �


�


 �


 �



 �


 �

� �

�

 �

 �

 �

 �

� �

�

 �

 �

 �

 �

� �

�

 �

 �

 �

 �

� �

�

 �

 �


 �

 �


�  

�

� �

�

 �

 �


 �

 �

� 

�

�

�


� #

� 

 � �

 �!

 �=

 ��=

 �H

 �+�H

 �D

 �*�D

  ��2
 Monitors


  �

  �(

  �3G

  �J

  �*�J

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �*

 �5J

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 �

 �$

 �/A

 �J

 �*�J

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �*

 �5J

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �*

 �5J

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �0

 �;S

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���

� �2 Data service


�"
:
 �-, Start of the time interval for this query.


 �

 �(

 �+,
8
�+* End of the time interval for this query.


�

�&

�)*

�

�

�	

�

�

�

�	

�
.
�'"  list of metric types to return


�

�

�"

�%&

� �

�#

 �#

 �

 �

 �

 �!"

� �

�!
=
 �%"/ reference time for route information snapshot


 �

 � 

 �#$

�

�

�

�

�

�

�

�

�

�

�

�

� �

�"

 � 

 �


 �

 �

 �
>
�#"0 lookaside map of AS number -> AS name mappings


�

�

�!"

� �

� 

�=

��=

�H

�+�H

�>

�*�>

 ��

 �

 �7

 �B]

 �D

 �*�D

 ��

	 �ʼ"��

 ��

 ���

��

�

�5

�@Z

�D

�*�D

��

	�ʼ"��

��

���bproto3��  
��
2kentik/bgp_monitoring/v202210/bgp_monitoring.protokentik.bgp_monitoring.v202210google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto#kentik/core/v202303/user_info.proto"kentik/net/v202303/bgp_types.proto"�
NlriM
afi (2.kentik.net.v202303.AfiB"�A2Address Family Identifier�ARafi[
safi (2.kentik.net.v202303.SafiB-�A&2$Subsequent Address Family Identifier�ARsafiM
prefix (	B3�A,2*Actual prefix data (format depends on AFI)�AH RprefixB
type"�
BgpHealthSettingsr
reachability_warning (B?�A<2:Threshold (in percents) for triggering warning level alertRreachabilityWarningu
reachability_critical (B@�A=2;Threshold (in percents) for triggering critical level alertRreachabilityCritical"�
BgpMonitorSettingse
allowed_asns (BB�A?2=List of ASNs that are valid originators of monitored prefixesRallowedAsnsc
targets (2#.kentik.bgp_monitoring.v202210.NlriB$�A2List of prefixes to monitor�ARtargets�

check_rpki (Ba�A^2\Enable verification of validity of advertisements of monitored prefixes with respect to RPKIR	checkRpki~
include_covered_prefixes (BD�AA2?Include advertised subnets (sub-prefixes) of monitored prefixesRincludeCoveredPrefixes�
health_settings (20.kentik.bgp_monitoring.v202210.BgpHealthSettingsB(�A%2#Parameters for triggering of alertsRhealthSettingsu
notification_channels (	B@�A=2;List of IDs of notification channels for delivery of alertsRnotificationChannelsB
notes (	B,�A)2'Free form notes documenting the monitorRnotesp
allowed_upstreams (BC�A@2>List of ASNs that are expected to propagate monitored prefixesRallowedUpstreams"�

BgpMonitor;
id (	B+�A$2"System generated unique identifier�ARid>
name (	B*�A#2!User selected name of the monitor�ARnamer
status (2/.kentik.bgp_monitoring.v202210.BgpMonitorStatusB)�A&2$Administrative status of the monitorRstatusl
settings (21.kentik.bgp_monitoring.v202210.BgpMonitorSettingsB�A2Configuration parametersRsettingsS
cdate (2.google.protobuf.TimestampB!�A2Creation timestamp (UTC)�ARcdate\
edate (2.google.protobuf.TimestampB*�A#2!Last modification timestamp (UTC)�ARedateb

created_by (2.kentik.core.v202303.UserInfoB$�A2Identity of monitor creator�AR	createdBy�
last_updated_by (2.kentik.core.v202303.UserInfoB<�A523Identity of user that has modified the monitor last�ARlastUpdatedBy
labels	 (	Rlabels"�
	RouteInfo^
nlri (2#.kentik.bgp_monitoring.v202210.NlriB%�A2Prefix (target of the route)�ARnlriY

origin_asn (B:�A321The autonomous system number originating the NLRI�AR	originAsnP
as_path (	B7�A422AS path observed at the vantage point for the NLRIRasPath�
vantage_point (2 .kentik.net.v202303.VantagePointB<�A523Name of the vantage point providing the observation�ARvantagePointv
rpki_status (2.kentik.net.v202303.RpkiStatusB5�A.2,Validation status of prefix's advertisements�AR
rpkiStatusm
nexthop (	BS�AL2JIP address of the first route hop from the vantage point toward the target�ARnexthop"�
	BgpMetric^
	timestamp (2.google.protobuf.TimestampB$�A2UTC time of the observation�AR	timestampO
nlri (2#.kentik.bgp_monitoring.v202210.NlriB�A2Target prefix�ARnlrij
reachability (BD�A=2;Percentage of vantage points reporting the prefix reachable�AH Rreachability�
path_changes (Bh�Aa2_Number of AS path changes for the prefix across all vantage points in the queried time interval�AH RpathChangesB
type"
ListMonitorsRequest"�
ListMonitorsResponse~
monitors (2).kentik.bgp_monitoring.v202210.BgpMonitorB7�A02.List of BGP monitors configured in the account�ARmonitors_
invalid_count (B:�A321Number of invalid objects (should be always zero)�ARinvalidCount"�
CreateMonitorRequest|
monitor (2).kentik.bgp_monitoring.v202210.BgpMonitorB7�A02.Configuration of the BGP monitor to be created�ARmonitor"�
CreateMonitorResponse|
monitor (2).kentik.bgp_monitoring.v202210.BgpMonitorB7�A02.Configuration of the newly created BGP monitor�ARmonitor"S
GetMonitorRequest>
id (	B.�A'2%ID of the BGP monitor to be retrieved�ARid"�
GetMonitorResponsex
monitor (2).kentik.bgp_monitoring.v202210.BgpMonitorB3�A,2*Configuration of the requested BGP monitor�ARmonitor"�
UpdateMonitorRequest�
monitor (2).kentik.bgp_monitoring.v202210.BgpMonitorB;�A422New configuration of the BGP monitor to be updated�ARmonitor"�
UpdateMonitorResponsev
monitor (2).kentik.bgp_monitoring.v202210.BgpMonitorB1�A*2(Configuration of the updated BGP monitor�ARmonitor"T
DeleteMonitorRequest<
id (	B,�A%2#ID of the BGP monitor to be deleted�ARid"
DeleteMonitorResponse"�
SetMonitorStatusRequestM
id (	B=�A624ID of the BGP monitor whose status is to be modified�ARid~
status (2/.kentik.bgp_monitoring.v202210.BgpMonitorStatusB5�A.2,Desired administrative status of the monitor�ARstatus"
SetMonitorStatusResponse"�
GetMetricsForTargetRequestv

start_time (2.google.protobuf.TimestampB;�A422UTC timestamp of the beginning of queried interval�AR	startTimel
end_time (2.google.protobuf.TimestampB5�A.2,UTC timestamp of the end of queried interval�ARendTime`
target (2#.kentik.bgp_monitoring.v202210.NlriB#�A2Target prefix of the query�ARtarget}
include_covered (BT�AQ2OReturn metrics for subnets (sub-prefixes) of the target prefix (default: false)RincludeCovered
metrics (2,.kentik.bgp_monitoring.v202210.BgpMetricTypeB7�A02.List of one or more BGP metric types to return�ARmetrics"�
GetMetricsForTargetResponseq
metrics (2(.kentik.bgp_monitoring.v202210.BgpMetricB-�A&2$List of observations (metric values)�ARmetrics"�
GetRoutesForTargetRequestn
time (2.google.protobuf.TimestampB>�A725Reference UTC time for the route information snapshot�ARtimeS
target (2#.kentik.bgp_monitoring.v202210.NlriB�A2Target prefix�ARtarget|
include_covered (BS�AP2NReturn routes for subnets (sub-prefixes) of the target prefix (default: false)RincludeCovered�

check_rpki (Be�Ab2`Return information about validity of prefix advertisements with respect to RPKI (default: false)R	checkRpki"�
GetRoutesForTargetResponseY
routes (2(.kentik.bgp_monitoring.v202210.RouteInfoB�A2List of routes�ARroutes�
as_names (2F.kentik.bgp_monitoring.v202210.GetRoutesForTargetResponse.AsNamesEntryB.�A'2%look-aside map AS names keyed by ASNs�ARasNames:
AsNamesEntry
key (Rkey
value (	Rvalue:8*�
BgpMonitorStatus"
BGP_MONITOR_STATUS_UNSPECIFIED 
BGP_MONITOR_STATUS_ACTIVE
BGP_MONITOR_STATUS_PAUSED
BGP_MONITOR_STATUS_DELETED*t
BgpMetricType
BGP_METRIC_TYPE_UNSPECIFIED  
BGP_METRIC_TYPE_REACHABILITY 
BGP_METRIC_TYPE_PATH_CHANGES2�
BgpMonitoringAdminService�
ListMonitors2.kentik.bgp_monitoring.v202210.ListMonitorsRequest3.kentik.bgp_monitoring.v202210.ListMonitorsResponse"��A\List BGP Monitors.8Returns list of all BGP monitors present in the account.*ListMonitors��admin.synthetics:read���" /bgp_monitoring/v202210/monitors�
CreateMonitor3.kentik.bgp_monitoring.v202210.CreateMonitorRequest4.kentik.bgp_monitoring.v202210.CreateMonitorResponse"��Aw Create new BGP Monitor instance.DCreates new BGP Monitor and if successful returns its configuration.*CreateMonitor��admin.synthetics:write���%" /bgp_monitoring/v202210/monitors:*�

GetMonitor0.kentik.bgp_monitoring.v202210.GetMonitorRequest1.kentik.bgp_monitoring.v202210.GetMonitorResponse"��AmGet BGP Monitor configuration.?Returns configuration of existing BGP monitor with specific ID.*
GetMonitor��admin.synthetics:read���'%/bgp_monitoring/v202210/monitors/{id}�
UpdateMonitor3.kentik.bgp_monitoring.v202210.UpdateMonitorRequest4.kentik.bgp_monitoring.v202210.UpdateMonitorResponse"��A�&Update configuration of a BGP monitor.YUpdates configuration of BGP monitor with specific ID and returns updated  configuration.*UpdateMonitor��admin.synthetics:write���2-/bgp_monitoring/v202210/monitors/{monitor.id}:*�
DeleteMonitor3.kentik.bgp_monitoring.v202210.DeleteMonitorRequest4.kentik.bgp_monitoring.v202210.DeleteMonitorResponse"��AXDelete existing BGP Monitor.)Delete BGP monitor with with specific ID.*DeleteMonitor��admin.synthetics:write���'*%/bgp_monitoring/v202210/monitors/{id}�
SetMonitorStatus6.kentik.bgp_monitoring.v202210.SetMonitorStatusRequest7.kentik.bgp_monitoring.v202210.SetMonitorStatusResponse"��A},Sets administrative status of a BGP monitor.;Sets administrative status of BGP monitor with specific ID.*SetMonitorStatus��admin.synthetics:write���1,/bgp_monitoring/v202210/monitors/{id}/status:*.�Agrpc.api.kentik.com��admin.synthetics��2�
BgpMonitoringDataService�
GetMetricsForTarget9.kentik.bgp_monitoring.v202210.GetMetricsForTargetRequest:.kentik.bgp_monitoring.v202210.GetMetricsForTargetResponse"��AsGet metrics for a BGP prefix.=Retrieve metric data for single BGP prefix and time interval.*GetMetricsForTarget��synthetics:read���$"/bgp_monitoring/v202210/metrics:*�
GetRoutesForTarget8.kentik.bgp_monitoring.v202210.GetRoutesForTargetRequest9.kentik.bgp_monitoring.v202210.GetRoutesForTargetResponse"��A�Get routes for a BGP prefix.NRetrieve snapshot of route information for single BGP prefix at specific time.*GetRoutesForTarget��synthetics:read���#"/bgp_monitoring/v202210/routes:*(�Agrpc.api.kentik.com��
synthetics��B�ZWgithub.com/kentik/api-schema-public/gen/go/kentik/bgp_monitoring/v202210;bgp_monitoring�A��
BGP Monitoring API�# Overview
The BGP Monitoring API provides programmatic access to Kentik's BGP monitoring system. The APIs handle two distinct functions:
* **Admin service**: manages monitoring of advertised BGP prefixes as collected from global vantage points.
* **Data service**: handles retrieval of two classes of data for any IP prefix:
    - metrics for reachability and path changes, which provide a time series for a specified interval;
    - routes, which provide a snapshot of routing information for particular timestamp.

The services described above use the following endpoints:
| Endpoint | Purpose |
|-----------|---------|
| BgpMonitoringAdminService | CRUD operations for BGP monitors |
| BgpMonitoringDataService  | Retrieval of BGP monitoring data |

Both REST endpoints and gRPC RPCs are provided.
### Known Limitations
The API currently does not support retrieval of BGP event history.
# BGP Monitoring Data

Kentik's BGP monitoring API provides the following information about network prefixes:
* **Reachability**: expressed as the percentage of vantage points reporting the prefix
* **Path changes**: the number of changes in a given time range
* **Routes**: AS Path, next hop
### Data Retrieval Limitations

The following considerations apply to data retrieval using these APIs:
* BGP metrics and routes can be retrieved for any prefix with prefix length greater than 14 and any time interval. Prefixes with smaller length must be split into subnets (sub-prefixes) and requested individually.
* Requests for BGP metrics can can specify one or more metric types to be retrieved for a single prefix. Observed data are returned as a sequence of messages, one for each metric type and observation time.
* Route requests retrieve snapshot of information for specified prefix and time. Responses contain also mapping of ASNs to AS names for convenience.
# Working with BGP Monitoring

The topics below cover important information related to using Kentik's BGP monitoring APIs.
### BGP Prefixes

These APIs represent BGP prefixes using NLRI (Network Layer Reachability Information) objects. While NLRI objects allow representation of any type of network address, the system currently supports only IPv4 and IPv6 unicast in standard textual representation:
* **IPv4**: dotted-decimal notation
* **IPv6**: [RFC 5952](https://www.rfc-editor.org/rfc/rfc5952) syntax
### BGP Monitor Tests

BGP Monitors enable the generation of alerts for group network prefixes (IPv4 or IPv6) based on the following factors:
* Visibility/reachability of prefixes
* Mismatch of originating ASNs with a specified list of valid originators
* Validity of advertisements with respect to RPKI (Resource Public Key Infrastructure)

### Configuration Limitations 

The following considerations apply when configuring a BGP monitor test:
* Each BGP monitor instance can monitor up to 10 prefixes.
* The length of each monitored (IPv4 or IPv6) prefix must be greater than 14. Prefixes with smaller length must be split into subnets (sub-prefixes)."E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202210*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token rc
 More about Kentik BGP monitoring?https://kb.kentik.com/v4/Ma03.htm#Ma03-BGP_Monitor_Details_PageJ�K
  �

  

 &

 n
	
 n
	
  &
	
 !
	
 )
	
 )
	
	 8
	
 /
	
 -
	
 ,
	
 s

� s
�
 { � {{.Name}}
2 models
2` === BGP monitor config and status ===
 -------------------------------------------------------



 {

  }% Invalid value.


  } 

  }#$
!
   Monitor is active.


 

 
"
 �  Monitor is paused.


 �

 �
5
 �!' Monitor is deleted. Not user settable


 �

 � 

 � � {{.Name}}


 �

  ��

  �

  �

  � 

  �!�

  ���

  � �*

 ��

 �

 �

 �!"

 �#�

 ���

 � �*

  ��

  �

 ��


 �

 �

 �

 ��	

 ��
�

 � �
0

� � {{.Name}}


�

 ��

 �

 �

 � 

 �!�

 ���

��

�

�

� !

�!�

���

� � {{.Name}}


�

 ��

 �


 �

 �

 �!"

 �#�

 ���

��

�


�

�

�

��

���

� �*

��

�

�

�

��

���

��

�

�

�"#

�%�

���

��

�

�#

�&'

�(�

���

��

�


�

�'

�*+

�,�

���

��

�

�	

�

��

���

��

�


�

�#

�&'

�(�

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

���

� �*

��

�

�

�

��

���

��

�

�

� !

�#�

���

��

�

�!

�$%

�&�

� �-

���

��

�

�!

�$%

�&�

� �-

���

��

�

�)

�,-

�.�

� �-

���

��

�

�.

�12

�4�

� �-

���

�

�


�

�

�
t
� � {{.Name}}
2Y === BGP monitoring results ===
 -------------------------------------------------------


�

 �" Invalid value.


 �

 � !
/
�#! Reachability metric in percents


�

�!"
9
�#+ Number of path changes over time interval


�

�!"

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 � �-

 ���

��

�

�	

�

��

� �-

���

��

�


�

�

�

��

���H

��

�!

�"/

�23

�4�

� �-

���

��

�

� +

�./

�1�

� �-

���

��

�

�	

�

��

� �-

���

� � {{.Name}}


�

 ��

 �

 �'

 �*+

 �,�

 � �/

 ���

��

�

�	

�

��

� �/

���

 ��

 �


��

�

�

�

��

� �1

���	

��

�

�

�

��

� �1

���	
6
�  {{.Name}}
2 === BGP monitoring services


�

� � {{.Name}}


�

 ��

 �

 �

 � 

 �#$

 �%�

 � �/

 ���

��

�


�

�

��

� �/

���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

 � �,

	� � {{.Name}}


	�

	 ��

	 �

	 �

	 �

	 ��

	 � �/

	 ���


� � {{.Name}}



�


 ��


 �



 �


 �


 ��


 ���


 � �,

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 � �/

 ���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

 � �,

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 � �/

 ���

� � {{.Name}}


�

 ��

 �


 �

 �

 ��

 ���

 � �,

�   {{.Name}}


�

� � {{.Name}}


�

 ��

 �


 �

 �

 ��

 ���

 � �,

��

�

�

�

�!�

���

� �,

� # {{.Name}}


� 

 � �

 �!

 �=

 ��=

 �H

 �+�H

 �D

 �*�D

  ��2
 Monitors


  �

  �(

  �3G

  �J

  �*�J

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �*

 �5J

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �$

 �/A

 �J

 �*�J

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �*

 �5J

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �*

 �5J

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �0

 �;S

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���
)
� � {{.Name}}
2 Data service


�"

 ��

 �

 �(

 �+,

 �-�

 ���

 � �,
:
��* End of the time interval for this query.


�

�&

�)*

�+�

���

� �,

��

�

�	

�

��

���

� �,

��

�

�	

�

��

���

��

�

�

�"

�%&

�(�

���

� �,

� � {{.Name}}


�#

 ��

 �

 �

 �

 �!"

 �#�

 � �/

 ���

� � {{.Name}}


�!

 ��

 �

 � 

 �#$

 �%�

 ���

 � �*

��

�

�

�

��

���

� �*

��

�

�

�

��

���

��

�

�

�

��

���

� � {{.Name}}


�"

 ��

 �


 �

 �

 �

 � �

 � �-

 ���

��

�

�

�!"

�#�

� �-

���

� �

� 

�=

��=

�H

�+�H

�>

�*�>

 ��

 �

 �7

 �B]

 �D

 �*�D

 ��

	 �ʼ"��

 ��

 ���

��

�

�5

�@Z

�D

�*�D

��

	�ʼ"��

��

���bproto3��  
��
0kentik/capacity_plan/v202212/capacity_plan.protokentik.capacity_plan.v202212google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"�
Configh
runout (21.kentik.capacity_plan.v202212.Config.RunoutConfigB�A2Runout configuration�ARrunoutu
utilization (2/.kentik.capacity_plan.v202212.Config.UtilConfigB"�A2Utilization configuration�ARutilization�
RunoutConfig8
strategy (	B�A2Strategy for runout�ARstrategyD
warn_qty (B$�A2Warning quantity for runout�AH RwarnQty�E
crit_qty (B%�A2Critical quantity for runout�AHRcritQty�B
	_warn_qtyB
	_crit_qty�

UtilConfig@
	aggregate (	B"�A2Aggregate for utilization�AR	aggregateK
warn_pct (B+�A$2"Warning percentage for utilization�AH RwarnPct�L
crit_pct (B,�A%2#Critical percentage for utilization�AHRcritPct�B
	_warn_pctB
	_crit_pct"�
SummaryStatush
runout (28.kentik.capacity_plan.v202212.SummaryStatus.RunoutStatusB�A2Runout status�ARrunoutu
utilization (26.kentik.capacity_plan.v202212.SummaryStatus.UtilStatusB�A2Utilization status�ARutilization�
RunoutStatus1
status (	B�A2Status of runout�ARstatusG
earliest_date (B�A2Earliest runout date�AH RearliestDate�B
_earliest_date�

UtilStatus6
status (	B�A2Status of utilization�ARstatusM
highest_pct (B'�A 2Highest utilization percentage�AH R
highestPct�B
_highest_pct"�

CapacitySummary,
id (	B�A2ID of capacity plan�ARid2
name (	B�A2Name of capacity plan�ARnameG
description (	B%�A2Description of capacity plan�ARdescription8
status (	B �A2Status of capacity plan�ARstatusz

interfaces (2>.kentik.capacity_plan.v202212.CapacitySummary.InterfacesDetailB�A2Interfaces detail�AR
interfacese
config (2$.kentik.capacity_plan.v202212.ConfigB'�A 2Configuration of capacity plan�ARconfig|
summary_status (2+.kentik.capacity_plan.v202212.SummaryStatusB(�A!2Summary status of capacity plan�ARsummaryStatus�
InterfacesDetailI
total_count (B#�A2Total number of interfaces�AH R
totalCount�Q
total_capacity_bps (B�A2Total capacity in bps�AHRtotalCapacityBps��
healthy (2K.kentik.capacity_plan.v202212.CapacitySummary.InterfacesDetail.StatusDetailB�A2Healthy interfaces�ARhealthy�
warning (2K.kentik.capacity_plan.v202212.CapacitySummary.InterfacesDetail.StatusDetailB�A2Warning interfaces�ARwarning�
critical (2K.kentik.capacity_plan.v202212.CapacitySummary.InterfacesDetail.StatusDetailB�A2Critical interfaces�ARcritical�
StatusDetail0
bps (B�A2Bandwidth in bps�AH Rbps�8
count (B�A2Number of interfaces�AHRcount�B
_bpsB
_countB
_total_countB
_total_capacity_bps"�
CapacityPlan,
id (	B�A2ID of capacity plan�ARid2
name (	B�A2Name of capacity plan�ARnameG
description (	B%�A2Description of capacity plan�ARdescription8
status (	B �A2Status of capacity plan�ARstatusw

interfaces (2:.kentik.capacity_plan.v202212.CapacityPlan.InterfaceDetailB�A2List of interfaces�AR
interfacese
config (2$.kentik.capacity_plan.v202212.ConfigB'�A 2Configuration of capacity plan�ARconfig|
summary_status (2+.kentik.capacity_plan.v202212.SummaryStatusB(�A!2Summary status of capacity plan�ARsummaryStatus�
InterfaceDetail5
device_name (	B�A2Device name�AR
deviceName4
	intf_name (	B�A2Interface name�ARintfNameI
intf_description (	B�A2Interface description�ARintfDescription@
intf_capacity (	B�A2Interface capacity�ARintfCapacityD
network_boundary (	B�A2Network boundary�ARnetworkBoundary7
	conn_type (	B�A2Connectivity type�ARconnType-
provider (	B�A
2Provider�ARprovider<
util_status (	B�A2Utilization status�AR
utilStatusA
util_out_mbps	 (	B�A2Utilization out mbps�ARutilOutMbpsE
util_out_pct
 (	B#�A2Utilization out percentage�AR
utilOutPct>
util_in_mbps (	B�A2Utilization in mbps�AR
utilInMbpsB
util_in_pct (	B"�A2Utilization in percentage�AR	utilInPct;
runout_status (	B�A2Runout status�ARrunoutStatus=
runout_in_date (	B�A2Runout in date�ARrunoutInDateL
runout_in_variation (	B�A2Runout in variation�ARrunoutInVariation@
runout_out_date (	B�A2Runout out date�ARrunoutOutDateO
runout_out_variation (	B�A2Runout out variation�ARrunoutOutVariation"
ListCapacitySummariesRequest"�
ListCapacitySummariesResponseo
capacity (2-.kentik.capacity_plan.v202212.CapacitySummaryB$�A!2List of capacity plan summariesRcapacitye
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"_
GetCapacitySummaryRequestB
id (	B2�A+2)ID of the requested capacity plan summary�ARid"�
GetCapacitySummaryResponse�
capacity (2-.kentik.capacity_plan.v202212.CapacitySummaryB9�A624Configuration of the requested capacity plan summaryRcapacity"
ListCapacityPlansRequest"�
ListCapacityPlansResponsec
capacity (2*.kentik.capacity_plan.v202212.CapacityPlanB�A2List of capacity plansRcapacitye
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"T
GetCapacityPlanRequest:
id (	B*�A#2!ID of the requested capacity plan�ARid"�
GetCapacityPlanResponsey
capacity (2*.kentik.capacity_plan.v202212.CapacityPlanB1�A.2,Configuration of the requested capacity planRcapacity2�

CapacityPlanService�
ListCapacitySummaries:.kentik.capacity_plan.v202212.ListCapacitySummariesRequest;.kentik.capacity_plan.v202212.ListCapacitySummariesResponse"��AZList all capacity summaries.#Returns list of capacity summaries.*ListCapacitySummaries��admin.capacity_plan:read���.,/capacity_plan/v202212/capacity_plan/summary�
GetCapacitySummary7.kentik.capacity_plan.v202212.GetCapacitySummaryRequest8.kentik.capacity_plan.v202212.GetCapacitySummaryResponse"��AeRetrieve capacity plan summary..Returns capacity plan summary specified by ID.*GetCapacitySummary��admin.capacity_plan:read���31/capacity_plan/v202212/capacity_plan/{id}/summary�
ListCapacityPlans6.kentik.capacity_plan.v202212.ListCapacityPlansRequest7.kentik.capacity_plan.v202212.ListCapacityPlansResponse"��ANList all capacity plans.Returns list of capacity plans.*ListCapacityPlans��admin.capacity_plan:read���&$/capacity_plan/v202212/capacity_plan�
GetCapacityPlan4.kentik.capacity_plan.v202212.GetCapacityPlanRequest5.kentik.capacity_plan.v202212.GetCapacityPlanResponse"��ARRetrieve capacity plan.&Returns capacity plan specified by ID.*GetCapacityPlan��admin.capacity_plan:read���+)/capacity_plan/v202212/capacity_plan/{id}1�Agrpc.api.kentik.com��admin.capacity_plan��B�ZUgithub.com/kentik/api-schema-public/gen/go/kentik/capacity_plan/v202212;capacity_plan�A��
Capacity Plan APIW# Overview
The Capacity Plan API provides read-only access to configured capacity plans"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202212*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�H
  �

  

 %

 l
	
 l
	
  &
	
 !
	
 )
	
 8
	
	 /
	
 9

� 9
a
 ? v {{.Name}}
2H Capacity Plan
 -------------------------------------------------------



 ?

  AT {{.Name}}


  A


   BG

   B


   B

   B

   BG


   � C/

	   �DF

  HM

  H

  H

  H

  H 

  H!M


  � I/

	  �JL

  NS

  N

  N

  N

  N 

  N!S


  � O/

	  �PR

 Vi {{.Name}}


 V


  W\

  W


  W

  W

  W\


  � X/

	  �Y[

 ]b

 ]

 ]

 ]

 ] 

 ]!b


 � ^/

	 �_a

 ch

 c

 c

 c

 c 

 c!h


 � d/

	 �eg

  jo

  j

  j

  j

  jo

  � k-

  �ln

 pu

 p

 p

 p

 pu

 � q-

 �rt

x � {{.Name}}



x

 z� {{.Name}}


 z


  {�

  {


  {

  {

  {�


  � |/

	  �}

 ��

 �

 �

 �!

 �$%

 �&�


 � �/

	 ���

�� {{.Name}}


�


 ��

 �


 �

 �

 ��


 � �/

	 ���

��

�

�

�

�"#

�$�


� �/

	���

 ��

 �

 �

 �

 ��

 � �-

 ���

��

�

�

�

��

� �-

���

� � {{.Name}}


�

 �� {{.Name}}


 �


  �� {{.Name}}


  �

   ��

	   �

	   �

	   �

	   �

	   ��

   � �1

   ���	

  ��

	  �

	  �

	  �

	  �

	  � �

  � �1

  ���	

  ��

  �

  �

  �

  �"#

  �$�


  � �/

	  ���

 ��

 �

 �

 �&

 �)*

 �+�


 � �/

	 ���

 ��

 �

 �

 �

 ��


 � �/

	 ���

 ��

 �

 �

 �

 ��


 � �/

	 ���

 ��

 �

 �

 �

 ��


 � �/

	 ���

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�

� !

�"�

� �-

���

��

�

�	

�

��

� �-

���

��

�

�

�!"

�#�

� �-

���

� � {{.Name}}


�

 �� {{.Name}}


 �


  ��

  �


  �

  �

  ��


  � �/

	  ���

 ��

 �


 �

 �

 ��


 � �/

	 ���

 ��

 �


 �

 �

 � �


 � �/

	 ���

 ��

 �


 �

 �

 ��


 � �/

	 ���

 ��

 �


 �

 �

 � �


 � �/

	 ���

 ��

 �


 �

 �

 ��


 � �/

	 ���

 ��

 �


 �

 �

 ��


 � �/

	 ���

 ��

 �


 �

 �

 ��


 � �/

	 ���

 ��

 �


 �

 �

 ��


 � �/

	 ���

 	��

 	�


 	�

 	�

 	��


 	� �/

	 	���

 
��

 
�


 
�

 
�

 
��


 
� �/

	 
���

 ��

 �


 �

 �

 ��


 � �/

	 ���

 ��

 �


 �

 �

 ��


 � �/

	 ���

 ��

 �


 �

 �

 ��


 � �/

	 ���

 ��

 �


 �

 �!#

 �$�


 � �/

	 ���

 ��

 �


 �

 �

 � �


 � �/

	 ���

 ��

 �


 �

 �"$

 �%�


 � �/

	 ���

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�


�

�%

�()

�*�

� �-

���

��

�

�	

�

��

� �-

���

��

�

�

�!"

�#�

� �-

���

� ' {{.Name}}


�$

� � {{.Name}}


�%

 ��

 �


 �

 �#

 �&'

 �(�

 ���

��

�

�	

�

��

���

� � {{.Name}}


�!

 ��

 �

 �	

 �

 ��

 ���

 � �*

� � {{.Name}}


�"

 ��

 �

 �

 �

 ��

 ���

� # {{.Name}}


� 

	� � {{.Name}}


	�!

	 ��

	 �


	 �

	 � 

	 �#$

	 �%�

	 ���

	��

	�

	�	

	�

	��

	���


� � {{.Name}}



�


 ��


 �


 �	


 �


 ��


 ���


 � �*

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���
Z
 � �2L services and RPCs
 -------------------------------------------------------


 �

 �;

 ��;

 �F

 �+�F

 �E

 �*�E
'
  ��2 --- Capacity Plan ---


  �

  �8

  �C`

  �K

  �*�K

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �2

 �=W

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �0

 �;T

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �,

 �7N

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���bproto3��  
�#
google/protobuf/wrappers.protogoogle.protobuf"#
DoubleValue
value (Rvalue""

FloatValue
value (Rvalue""

Int64Value
value (Rvalue"#
UInt64Value
value (Rvalue""

Int32Value
value (Rvalue"#
UInt32Value
value (Rvalue"!
	BoolValue
value (Rvalue"#
StringValue
value (	Rvalue""

BytesValue
value (RvalueB�
com.google.protobufBWrappersProtoPZ1google.golang.org/protobuf/types/known/wrapperspb��GPB�Google.Protobuf.WellKnownTypesJ�
( z
�
( 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

 Wrappers for primitive (non-message) types. These types are useful
 for embedding primitives in the `google.protobuf.Any` type and for places
 where we need to distinguish between the absence of a primitive
 typed field and its default value.

 These wrappers have no meaningful use within repeated fields as they lack
 the ability to detect presence on individual elements.
 These wrappers have no meaningful use within a map or a oneof since
 individual entries of a map or fields of a oneof can already detect presence.


* 

, 
	
, 

- H
	
- H

. ,
	
. ,

/ .
	
/ .

0 "
	

0 "

1 !
	
$1 !

2 ;
	
%2 ;
g
 7 :[ Wrapper message for `double`.

 The JSON representation for `DoubleValue` is JSON number.



 7
 
  9 The double value.


  9

  9	

  9
e
? BY Wrapper message for `float`.

 The JSON representation for `FloatValue` is JSON number.



?

 A The float value.


 A

 A

 A
e
G JY Wrapper message for `int64`.

 The JSON representation for `Int64Value` is JSON string.



G

 I The int64 value.


 I

 I

 I
g
O R[ Wrapper message for `uint64`.

 The JSON representation for `UInt64Value` is JSON string.



O
 
 Q The uint64 value.


 Q

 Q	

 Q
e
W ZY Wrapper message for `int32`.

 The JSON representation for `Int32Value` is JSON number.



W

 Y The int32 value.


 Y

 Y

 Y
g
_ b[ Wrapper message for `uint32`.

 The JSON representation for `UInt32Value` is JSON number.



_
 
 a The uint32 value.


 a

 a	

 a
o
g jc Wrapper message for `bool`.

 The JSON representation for `BoolValue` is JSON `true` and `false`.



g

 i The bool value.


 i

 i

 i
g
o r[ Wrapper message for `string`.

 The JSON representation for `StringValue` is JSON string.



o
 
 q The string value.


 q

 q	

 q
e
w zY Wrapper message for `bytes`.

 The JSON representation for `BytesValue` is JSON string.



w

 y The bytes value.


 y

 y

 ybproto3�� 
�=
 google/protobuf/field_mask.protogoogle.protobuf"!
	FieldMask
paths (	RpathsB�
com.google.protobufBFieldMaskProtoPZ2google.golang.org/protobuf/types/known/fieldmaskpb��GPB�Google.Protobuf.WellKnownTypesJ�;
 �
�
 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ,
	
" ,

# /
	
# /

$ "
	

$ "

% !
	
$% !

& ;
	
%& ;

' I
	
' I

( 
	
( 
�,
 � ��, `FieldMask` represents a set of symbolic field paths, for example:

     paths: "f.a"
     paths: "f.b.d"

 Here `f` represents a field in some root message, `a` and `b`
 fields in the message found in `f`, and `d` a field found in the
 message in `f.b`.

 Field masks are used to specify a subset of fields that should be
 returned by a get operation or modified by an update operation.
 Field masks also have a custom JSON encoding (see below).

 # Field Masks in Projections

 When used in the context of a projection, a response message or
 sub-message is filtered by the API to only contain those fields as
 specified in the mask. For example, if the mask in the previous
 example is applied to a response message as follows:

     f {
       a : 22
       b {
         d : 1
         x : 2
       }
       y : 13
     }
     z: 8

 The result will not contain specific values for fields x,y and z
 (their value will be set to the default, and omitted in proto text
 output):


     f {
       a : 22
       b {
         d : 1
       }
     }

 A repeated field is not allowed except at the last position of a
 paths string.

 If a FieldMask object is not present in a get operation, the
 operation applies to all fields (as if a FieldMask of all fields
 had been specified).

 Note that a field mask does not necessarily apply to the
 top-level response message. In case of a REST get operation, the
 field mask applies directly to the response, but in case of a REST
 list operation, the mask instead applies to each individual message
 in the returned resource list. In case of a REST custom method,
 other definitions may be used. Where the mask applies will be
 clearly documented together with its declaration in the API.  In
 any case, the effect on the returned resource/resources is required
 behavior for APIs.

 # Field Masks in Update Operations

 A field mask in update operations specifies which fields of the
 targeted resource are going to be updated. The API is required
 to only change the values of the fields as specified in the mask
 and leave the others untouched. If a resource is passed in to
 describe the updated values, the API ignores the values of all
 fields not covered by the mask.

 If a repeated field is specified for an update operation, new values will
 be appended to the existing repeated field in the target resource. Note that
 a repeated field is only allowed in the last position of a `paths` string.

 If a sub-message is specified in the last position of the field mask for an
 update operation, then new value will be merged into the existing sub-message
 in the target resource.

 For example, given the target message:

     f {
       b {
         d: 1
         x: 2
       }
       c: [1]
     }

 And an update message:

     f {
       b {
         d: 10
       }
       c: [2]
     }

 then if the field mask is:

  paths: ["f.b", "f.c"]

 then the result will be:

     f {
       b {
         d: 10
         x: 2
       }
       c: [1, 2]
     }

 An implementation may provide options to override this default behavior for
 repeated and message fields.

 In order to reset a field's value to the default, the field must
 be in the mask and set to the default value in the provided resource.
 Hence, in order to reset all fields of a resource, provide a default
 instance of the resource and set all fields in the mask, or do
 not provide a mask as described below.

 If a field mask is not present on update, the operation applies to
 all fields (as if a field mask of all fields has been specified).
 Note that in the presence of schema evolution, this may mean that
 fields the client does not know and has therefore not filled into
 the request will be reset to their default. If this is unwanted
 behavior, a specific service may require a client to always specify
 a field mask, producing an error if not.

 As with get operations, the location of the resource which
 describes the updated values in the request message depends on the
 operation kind. In any case, the effect of the field mask is
 required to be honored by the API.

 ## Considerations for HTTP REST

 The HTTP kind of an update operation which uses a field mask must
 be set to PATCH instead of PUT in order to satisfy HTTP semantics
 (PUT must only be used for full updates).

 # JSON Encoding of Field Masks

 In JSON, a field mask is encoded as a single string where paths are
 separated by a comma. Fields name in each path are converted
 to/from lower-camel naming conventions.

 As an example, consider the following message declarations:

     message Profile {
       User user = 1;
       Photo photo = 2;
     }
     message User {
       string display_name = 1;
       string address = 2;
     }

 In proto a field mask for `Profile` may look as such:

     mask {
       paths: "user.display_name"
       paths: "photo"
     }

 In JSON, the same mask is represented as below:

     {
       mask: "user.displayName,photo"
     }

 # Field Masks and Oneof Fields

 Field masks treat fields in oneofs just as regular fields. Consider the
 following message:

     message SampleMessage {
       oneof test_oneof {
         string name = 4;
         SubMessage sub_message = 9;
       }
     }

 The field mask can be:

     mask {
       paths: "name"
     }

 Or:

     mask {
       paths: "sub_message"
     }

 Note that oneof type names ("test_oneof" in this case) cannot be used in
 paths.

 ## Field Mask Verification

 The implementation of any API method which has a FieldMask type field in the
 request should verify the included field paths, and return an
 `INVALID_ARGUMENT` error if any path is unmappable.


 �
,
  � The set of field mask paths.


  �


  �

  �

  �bproto3�� 
�a
3kentik/cloud_export/v202101beta1/cloud_export.proto kentik.cloud_export.v202101beta1google/protobuf/wrappers.protogoogle/api/annotations.protogoogle/api/client.proto google/protobuf/field_mask.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"�
CloudExport
id (	RidE
type (21.kentik.cloud_export.v202101beta1.CloudExportTypeRtype
enabled (Renabled
name (	Rname 
description (	Rdescription
api_root (	RapiRoot
	flow_dest (	RflowDest
plan_id (	RplanId%
cloud_provider (	RcloudProviderC
aws	 (2/.kentik.cloud_export.v202101beta1.AwsPropertiesH RawsI
azure
 (21.kentik.cloud_export.v202101beta1.AzurePropertiesH RazureC
gce (2/.kentik.cloud_export.v202101beta1.GcePropertiesH RgceC
ibm (2/.kentik.cloud_export.v202101beta1.IbmPropertiesH RibmA
bgp (2/.kentik.cloud_export.v202101beta1.BgpPropertiesRbgpO
current_status (2(.kentik.cloud_export.v202101beta1.StatusRcurrentStatusB

properties"
BgpProperties
	apply_bgp (RapplyBgp)
use_bgp_device_id (	RuseBgpDeviceId&
device_bgp_type (	RdeviceBgpType"�
AwsProperties
bucket (	Rbucket 
iam_role_arn (	R
iamRoleArn
region (	Rregion*
delete_after_read (RdeleteAfterRead)
multiple_buckets (RmultipleBuckets"�
AzureProperties
location (	Rlocation%
resource_group (	RresourceGroup'
storage_account (	RstorageAccount'
subscription_id (	RsubscriptionId<
security_principal_enabled (RsecurityPrincipalEnabled"M
GceProperties
project (	Rproject"
subscription (	Rsubscription"'
IbmProperties
bucket (	Rbucket"�
Status
status (	Rstatus#
error_message (	RerrorMessage9

flow_found (2.google.protobuf.BoolValueR	flowFound9

api_access (2.google.protobuf.BoolValueR	apiAccessP
storage_account_access (2.google.protobuf.BoolValueRstorageAccountAccess"a
CreateCloudExportRequestE
export (2-.kentik.cloud_export.v202101beta1.CloudExportRexport"b
CreateCloudExportResponseE
export (2-.kentik.cloud_export.v202101beta1.CloudExportRexport"
ListCloudExportRequest"�
ListCloudExportResponseG
exports (2-.kentik.cloud_export.v202101beta1.CloudExportRexports2
invalid_exports_count (RinvalidExportsCount"'
GetCloudExportRequest
id (	Rid"_
GetCloudExportResponseE
export (2-.kentik.cloud_export.v202101beta1.CloudExportRexport"�
PatchCloudExportRequestE
export (2-.kentik.cloud_export.v202101beta1.CloudExportRexport.
mask (2.google.protobuf.FieldMaskRmask"a
PatchCloudExportResponseE
export (2-.kentik.cloud_export.v202101beta1.CloudExportRexport"a
UpdateCloudExportRequestE
export (2-.kentik.cloud_export.v202101beta1.CloudExportRexport"b
UpdateCloudExportResponseE
export (2-.kentik.cloud_export.v202101beta1.CloudExportRexport"*
DeleteCloudExportRequest
id (	Rid"
DeleteCloudExportResponse*�
CloudExportType!
CLOUD_EXPORT_TYPE_UNSPECIFIED $
 CLOUD_EXPORT_TYPE_KENTIK_MANAGED&
"CLOUD_EXPORT_TYPE_CUSTOMER_MANAGED2�
CloudExportAdminService�
CreateCloudExport:.kentik.cloud_export.v202101beta1.CreateCloudExportRequest;.kentik.cloud_export.v202101beta1.CreateCloudExportResponse"��A_Create Cloud Export.9Create cloud export from request. Returns created export.*ExportCreate��admin.cloud_export:write���'""/cloud_export/v202101beta1/exports:*�
ListCloudExport8.kentik.cloud_export.v202101beta1.ListCloudExportRequest9.kentik.cloud_export.v202101beta1.ListCloudExportResponse"��AAList Cloud Export.Returns a list of cloud export.*
ExportList��admin.cloud_export:read���$"/cloud_export/v202101beta1/exports�
GetCloudExport7.kentik.cloud_export.v202101beta1.GetCloudExportRequest8.kentik.cloud_export.v202101beta1.GetCloudExportResponse"��Ai Get information about an export.:Returns information about export specified with export ID.*	ExportGet��admin.cloud_export:read���)'/cloud_export/v202101beta1/exports/{id}�
PatchCloudExport9.kentik.cloud_export.v202101beta1.PatchCloudExportRequest:.kentik.cloud_export.v202101beta1.PatchCloudExportResponse"��AuPatch an export.TPartially Updates the attributes of export specified with id and update_mask fields.*ExportPatch��admin.cloud_export:write���32./cloud_export/v202101beta1/exports/{export.id}:*�
UpdateCloudExport:.kentik.cloud_export.v202101beta1.UpdateCloudExportRequest;.kentik.cloud_export.v202101beta1.UpdateCloudExportResponse"��A[Update an export.8Replaces the entire export attributes specified with id.*ExportUpdate��admin.cloud_export:write���3./cloud_export/v202101beta1/exports/{export.id}:*�
DeleteCloudExport:.kentik.cloud_export.v202101beta1.DeleteCloudExportRequest;.kentik.cloud_export.v202101beta1.DeleteCloudExportResponse"��AHDelete an export.%Deletes the export specified with id.*ExportDelete��admin.cloud_export:write���)*'/cloud_export/v202101beta1/exports/{id}8�Acloud_export.api.kentik.com��admin.cloud_export��B�ZXgithub.com/kentik/api-schema-public/gen/go/kentik/cloud_export/v202101beta1;cloud_export�A��
Cloud Export Admin APIK--- This API has been deprecated and will be removed in the near future ---"7
Kentik API Engineeringhttps://github.com/kentik/api2202101beta1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�5
 �
$
 2 Cloud exports management


 )

 o
	
 o
	
  (
	
 &
	
	 !
	

 *
	
 8
	
 /
	
 <

� <
�
 B K2z =======================================================
 models
 =======================================================



 B
-
  D$  Invalid or incomplete exports.


  D

  D"#
8
 G'+ Cloud exports that are managed by Kentik.


 G"

 G%&
U
 J)H Exports that are managed by Kentik customers (eg. by running an agent)


 J$

 J'(
A
 N w5 The CloudExport message defines a cloud export task



 N
^
  PQ The internal cloud export identifier. This is Read-only and assigned by Kentik.


  P

  P	

  P
&
 S The kind of export task


 S

 S

 S
M
 V@ Whether this task is enabled and intended to run, or disabled.


 V

 V

 V
,
 Y A short name for this export.


 Y

 Y	

 Y
/
 \" An optional, longer description.


 \

 \	

 \
y
 _l Hostname of the Kentik deployment where the API calls related to this export should go, eg. api.kentik.com


 _

 _	

 _
w
 bj Hostname of the Kentik deployment where the data generated by this export should go, eg. flow.kentik.com


 b

 b	

 b
K
 e> The identifier of the Kentik plan associated with this task.


 e

 e	

 e
W
 hJ The cloud provider targeted by this export (eg. aws, azure, gce, ibm...)


 h

 h	

 h
@
  kp2 Properties specific to the cloud provider above.


  k

 	l

 	l

 	l

 	l

 
m

 
m

 
m

 
m

 n

 n

 n

 n

 o

 o

 o

 o
%
 s Optional BGP settings.


 s

 s

 s
D
 v7 The most current status Kentik has about this export.


 v

 v	

 v
-
z �  Optional BGP related settings.



z
b
 |U If true, apply BGP data discovered via another device to the flow from this export.


 |

 |

 |
6
) Which other device to get BGP data from




	


C
�5 FIXME: unclear. "device", "other_device" or "none"?


�

�	

�
R
� �D Properties specific to Amazon Web Services "vpc flow logs" exports


�
<
 �. Source S3 bucket to fetch vpc flow logs from


 �

 �	

 �
e
�W ARN for the IAM role to assume when fetching data or making AWS calls for this export


�

�	

�
K
�= AWS region where this bucket resides (FIXME is that right?)


�

�	

�
^
�P If true, attempt to delete vpc flow log chunks from S3 after they've been read


�

�

�

� FIXME


�

�

�
4
� �& Properties specific to Azure exports


�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

�

�

�	

�

�&

�

�!

�$%
:
� �, Properties specific to Google Cloud export


�

 �

 �

 �	

 �

�

�

�	

�
8
� �* Properties specific to IBM Cloud exports


�

 �

 �

 �	

 �
"
� � Export task status


�

 � FIXME


 �

 �	

 �
/
�! If not empty, the current error


�

�	

�
+
�+ If true, we found flow logs


�

�&

�)*

�+

�

�&

�)*

�7

�

�2

�56
�
� �2| =======================================================
 services
 =======================================================


� 

 �

 �

 �

 �

� �

�!

 �

 �

 �

 �

	� �

	�


� �


�


 �#


 �



 �


 �


 �!"


�#


�


�	


�!"

� �

�

 �

 �

 �	

 �

� �

�

 �

 �

 �

 �

� �

�

 �

 �

 �

 �
~
�%p CSV values of fields follow the path of Export object with dot notation (ie. "export.name,export.description")


�

� 

�#$

� �

� 

 �

 �

 �

 �

� �

� 

 �

 �

 �

 �

� �

�!

 �

 �

 �

 �

� �

� 

 �

 �

 �	

 �

� �

�!

 � �

 �

 �C

 ��C

 �F

 �+�F

 �D

 �*�D

  ��

  �

  �0

  �;T

  �K

  �*�K

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �,

 �7N

 �J

 �*�J

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �*

 �5K

 �J

 �*�J

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �.

 �9Q

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �0

 �;T

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �0

 �;T

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���bproto3��  
ɑ
.kentik/cloud_export/v202210/cloud_export.protokentik.cloud_export.v202210google/api/annotations.protogoogle/api/client.proto.protoc-gen-openapiv2/options/annotations.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.proto%kentik/core/v202303/annotations.proto"�	
CloudExport:
id (	B*�A#2!Unique identifier of the instance�ARidr
type (2,.kentik.cloud_export.v202210.CloudExportTypeB0�A-2+Ownership of the cloud export process/agentRtypeW
enabled (B=�A624Attribute controlling whether the instance is active�ARenabled?
name (	B+�A$2"User selected name of the instance�ARnameB
description (	B �A2Description of the instanceRdescriptionQ
plan_id (	B8�A12/Identifier of the billing plan for the instance�ARplanIdy
cloud_provider (2*.kentik.cloud_export.v202210.CloudProviderB&�A2Cloud provider identification�ARcloudProvider>
aws (2*.kentik.cloud_export.v202210.AwsPropertiesH RawsD
azure	 (2,.kentik.cloud_export.v202210.AzurePropertiesH Razure>
gce
 (2*.kentik.cloud_export.v202210.GcePropertiesH Rgce>
ibm (2*.kentik.cloud_export.v202210.IbmPropertiesH Ribm�
current_status (2..kentik.cloud_export.v202210.CloudExportStatusB-�A&2$Runtime status of the export process�ARcurrentStatusS
cdate (2.google.protobuf.TimestampB!�A2Creation timestamp (UTC)�ARcdate\
edate (2.google.protobuf.TimestampB*�A#2!Last modification timestamp (UTC)�ARedateB
cloud_specific_properties"�	
AwsPropertiesW
bucket (	B?�A<2:Name of S3 bucket from which flow logs are to be exported.Rbucket{
iam_role_arn (	BY�AR2PARN of the IAM role granted access to the S3 bucket and describe API end-points.�AR
iamRoleArnS
region (	B;�A422Name of AWS region from which to export flow logs.�ARregionr
delete_after_read (BF�AC2ADelete from logs from the S3 bucket after export (default false).RdeleteAfterReada
metadata_only (B<�A927Import only metadata without any flows (default false).RmetadataOnlyh
aws_iam_role_arn_is_org (B3�A02.Iam role is organization role (default false).RawsIamRoleArnIsOrgv
secondary_aws_accounts (	B@�A=2;Accounts ids granted access to the describe API end-points.RsecondaryAwsAccounts�
secondary_aws_blocked_accounts (	Ba�A^2\Accounts ids that should be filtered from organization when running describe API end-points.RsecondaryAwsBlockedAccountsc
secondary_aws_regions	 (	B/�A,2*Regions that secondary accounts to scrape.RsecondaryAwsRegions�
secondary_aws_suffix
 (	Br�Ao2mUsed to generate secondary account ARN based on template arn:aws:iam::<<aws_account_id>>:role/<<role_suffix>>RsecondaryAwsSuffix"�
AzurePropertiesZ
location (	B>�A725Azure region/location from which to export flow logs.�ARlocationg
resource_group (	B@�A927Resource group containing the NSG generating flow logs.�ARresourceGroupk
storage_account (	BB�A;29Storage account from which flow logs are to be extracted.�ARstorageAccounto
subscription_id (	BF�A?2=ID of Azure account from which flows logs are to be exported.�ARsubscriptionId�
security_principal_enabled (Bf�Ac2aIndication whether security principal for the Kentik flow export application has been authorized.RsecurityPrincipalEnabled"�
GcePropertiesV
project (	B<�A523Name of the project from which to export flow logs.�ARprojectZ
subscription (	B6�A/2-GCP Pub/Sub subscription providing flow logs.�ARsubscription"f
IbmPropertiesU
bucket (	B=�A:28Storage bucket from which flow logs are to be extracted.Rbucket"�
CloudExportStatus;
status (	B#�A2Status of the export task.�ARstatuse
error_message (	B@�A927Text of the last error message (empty if status is OK).�ARerrorMessageW

flow_found (B8�A12/Indication whether any flow data were exported.�AR	flowFoundj

api_access (BK�AD2BIndication whether the export process is able to access cloud API.�AR	apiAccess�
storage_account_access (Bf�A_2]Indication whether the export process is able to access storage account containing flow logs.�ARstorageAccountAccess"~
CreateCloudExportRequestb
export (2(.kentik.cloud_export.v202210.CloudExportB �A2Cloud export configuration.Rexport"�
CreateCloudExportResponsec
export (2(.kentik.cloud_export.v202210.CloudExportB!�A2Created cloud export object.Rexport"
ListCloudExportsRequest"�
ListCloudExportsResponsef
exports (2(.kentik.cloud_export.v202210.CloudExportB"�A2List of cloud export objects.Rexports�
invalid_exports_count (BR�AO2MNumber of objects with invalid data (which are not returned in the response).RinvalidExportsCount"U
GetCloudExportRequest<
id (	B,�A)2'ID of the cloud export to be retrieved.Rid"u
GetCloudExportResponse[
export (2(.kentik.cloud_export.v202210.CloudExportB�A2Cloud export object.Rexport"~
UpdateCloudExportRequestb
export (2(.kentik.cloud_export.v202210.CloudExportB �A2Cloud export configuration.Rexport"�
UpdateCloudExportResponsec
export (2(.kentik.cloud_export.v202210.CloudExportB!�A2Updated cloud export object.Rexport"V
DeleteCloudExportRequest:
id (	B*�A'2%ID of the cloud export to be deleted.Rid"
DeleteCloudExportResponse*�
CloudExportType!
CLOUD_EXPORT_TYPE_UNSPECIFIED $
 CLOUD_EXPORT_TYPE_KENTIK_MANAGED&
"CLOUD_EXPORT_TYPE_CUSTOMER_MANAGED*�
CloudProvider
CLOUD_PROVIDER_UNSPECIFIED 
CLOUD_PROVIDER_AWS
CLOUD_PROVIDER_AZURE
CLOUD_PROVIDER_GCE
CLOUD_PROVIDER_IBM2�
CloudExportAdminService�
CreateCloudExport5.kentik.cloud_export.v202210.CreateCloudExportRequest6.kentik.cloud_export.v202210.CreateCloudExportResponse"��AiCreate Cloud Export.>Create new cloud export based on configuration in the request.*CreateCloudExport��admin.cloud_export:write���""/cloud_export/v202210/exports:*�
ListCloudExports4.kentik.cloud_export.v202210.ListCloudExportsRequest5.kentik.cloud_export.v202210.ListCloudExportsResponse"��A\List cloud exports.3Returns a list of all cloud exports in the account.*ListCloudExports��admin.cloud_export:read���/cloud_export/v202210/exports�
GetCloudExport2.kentik.cloud_export.v202210.GetCloudExportRequest3.kentik.cloud_export.v202210.GetCloudExportResponse"��A�*Get cloud export configuration and status.CReturns configuration and status of cloud export with specified ID.*GetCloudExport��admin.cloud_export:read���$"/cloud_export/v202210/exports/{id}�
UpdateCloudExport5.kentik.cloud_export.v202210.UpdateCloudExportRequest6.kentik.cloud_export.v202210.UpdateCloudExportResponse"��A�%Update configuration of cloud export.JReplace complete configuration of a cloud export with data in the request.*UpdateCloudExport��admin.cloud_export:write���.)/cloud_export/v202210/exports/{export.id}:*�
DeleteCloudExport5.kentik.cloud_export.v202210.DeleteCloudExportRequest6.kentik.cloud_export.v202210.DeleteCloudExportResponse"��ASDelete a cloud export.&Delete cloud export with specified ID.*DeleteCloudExport��admin.cloud_export:write���$*"/cloud_export/v202210/exports/{id}0�Agrpc.api.kentik.com��admin.cloud_export��B�ZSgithub.com/kentik/api-schema-public/gen/go/kentik/cloud_export/v202210;cloud_export�A��
Cloud Export Configuration API�# Overview
In Kentik, a "cloud export" is an object whose properties are the values that Kentik needs to access network flow logs from a given set of resources in a given cloud provider (see [Cloud Exports and Devices](https://kb.kentik.com/v4/Na00.htm#Na00-Cloud_Exports_and_Devices)). The Cloud Export API enables programmatic management of cloud exports, serving two primary functions:
* Configuration of the Kentik resources required to export network flow logs and metadata from [public clouds](https://kb.kentik.com/v4/Na00.htm).
* Basic status information on active export processes.

### Supported Cloud Providers
The functionality and configuration parameters supported by this API differ by cloud provider. The API currently supports the following providers:
* [Amazon Web Services](https://kb.kentik.com/v0/Bd06.htm) (AWS)
* [Microsoft Azure](https://kb.kentik.com/v0/Bd08.htm)
* [Google Cloud](https://kb.kentik.com/v0/Bd07.htm) (GCP)
* [IBM Cloud](https://kb.kentik.com/v0/Bd09.htm)

### Additional Public Resources
The following additional resources are available for working with this API:
* Kentik community [Python](https://github.com/kentik/community_sdk_python) and [Go](https://github.com/kentik/community_sdk_golang) SDKs provide language-specific support for using this and other Kentik APIs. These SDKs can be also used as example code for development.
* A [Terraform provider](https://registry.terraform.io/providers/kentik/kentik-cloudexport) is available for configuring `cloud_export` instances in Kentik. Terraform modules are available for [AWS](https://github.com/kentik/config-snippets-cloud/tree/master/cloud_AWS/terraform/module), [Azure](https://github.com/kentik/config-snippets-cloud/tree/master/cloud_Azure/terraform/module) 
and [GCP](https://github.com/kentik/config-snippets-cloud/tree/master/cloud_GCP/terraform/module).
These modules support onboarding and ongoing management of all resources (in public clouds and in Kentik) required to export flow logs to Kentik.

# Anatomy of a Cloud Export
Configuration and status of a `cloud_export` instance is represented by the `CloudExport` object, which contains three categories of attributes:
* Common Configuration Attributes
* Cloud Provider Configuration Attributes
* Metadata and Status Attributes

### Common Configuration Attributes
The configuration attributes in the table below are common to `CloudExport` objects for all cloud providers.
| Attribute | Required | Default |
|-----------|----------| ------- |
| enabled | No | False |
| name | Yes |   |
| description | No | <empty string> |
| type | Yes | |
| cloud_provider | Yes | |
| plan_id | Yes | |

### Cloud Provider Specific Attributes
The attributes listed in the table below are objects whose parameters are specific to each cloud provider.
| Cloud Provider | Attribute | Object Name |
|-----------|----------| ------- |
| AWS | aws | AwsProperties |
| Azure | azure | AzureProperties |
| Google Cloud | gce | GceProperties |
| IBM Cloud | ibm | IbmProperties |

### Metadata and Status Attributes
The attributes in the table below provide read-only metadata and status for a `cloud_export` instance.
| Attribute | Purpose |
|-----------|---------|
| id | System-generated unique identifier of the instance |
| cdate | Creation timestamp |
| edate | Last-modification timestamp |
| current_status | Runtime status of the flow and metadata collection process |

"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202210*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token rE
 Kentik support for public clouds!https://kb.kentik.com/v4/Na00.htmJ�:
 �
$
 2 Cloud exports management


 $

 j
	
 j
	
  &
	
 !
	
	 8
	

 )
	
 )
	
 /
	
 |

� |
�
 � � {{.Name}}
2z =======================================================
 models
 =======================================================


 �

  �$ Invalid value.


  �

  �"#
9
 �'+ Cloud export process is managed by Kentik


 �"

 �%&
;
 �)- Cloud export process is managed by customer


 �$

 �'(

� � {{.Name}}


�

 �! Invalid value.


 �

 � 
#
� Amazon Web Services


�

�

� Microsoft Azure


�

�

� Google Cloud


�

�
Q
�-C IBM Cloud
 Deprecated: IBM Cloud exports are no longer supported.


�

�

�,

�+

 � � {{.Name}}


 �

  ��

  �

  �	

  �

  ��

  � �-

  ���

 ��

 �

 �

 �

 ��

 ���

 ��

 �

 �

 �

 ��

 � �*

 ���

 ��

 �

 �	

 �

 ��

 � �*

 ���

 ��

 �

 �	

 �

 ��

 ���

 ��

 �

 �	

 �

 ��

 � �*

 ���

 ��

 �

 �

 �!"

 �#�

 � �*

 ���
<
  ��, Properties specific to the cloud provider.


  �!

 �

 �

 �

 �

 �

 �

 �

 �

 	�

 	�

 	�

 	�

 
�

 
�

 
�

 
�

 ��

 �

 �"

 �%'

 �(�

 � �-

 ���

 ��

 �

 �!

 �$&

 �'�

 � �-

 ���

 ��

 �

 �!

 �$&

 �'�

 � �-

 ���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

� �*

���

��

�

�	

�

��

� �*

���

��

�

�

�

��

���

��

�

�

�

��

���

��

�

�

�!"

�#�

���

��

�


�

�(

�+,

�-�

���

��

�


�

�0

�34

�5�

���

��

�


�

�'

�*+

�,�

���

	��

	�

	�	

	� "

	�#�

	���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 � �*

 ���

��

�

�	

�

��

� �*

���

��

�

�	

�

��

� �*

���

��

�

�	

�

��

� �*

���

��

�

�!

�$%

�&�

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 � �*

 ���

��

�

�	

�

��

� �*

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

� �-

���

��

�

�

�

��

� �-

���

��

�

�

�

��

� �-

���

��

�

�

� !

�"�

� �-

���
�
� � {{.Name}}
2| =======================================================
 services
 =======================================================


� 

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�!

 ��

 �

 �

 �

 ��

 ���

� " {{.Name}}


�

	� � {{.Name}}


	� 

	 ��

	 �


	 �

	 �

	 �!"

	 �#�

	 ���

	��

	�

	�	

	�!"

	�#�

	���


� � {{.Name}}



�


 ��


 �


 �	


 �


 ��


 ���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


� 

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�!

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


� 

 ��

 �

 �	

 �

 ��

 ���

� $ {{.Name}}


�!

 � �

 �

 �;

 ��;

 �F

 �+�F

 �D

 �*�D

  ��

  �

  �0

  �;T

  �K

  �*�K

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �.

 �9Q

 �J

 �*�J

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �*

 �5K

 �J

 �*�J

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �0

 �;T

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �0

 �;T

 �K

 �*�K

 ��

	 �ʼ"��

 ��

 ���bproto3��  
�=
Ckentik/connectivity_checker/v202410beta1/connectivity_checker.proto(kentik.connectivity_checker.v202410beta1google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.proto.protoc-gen-openapiv2/options/annotations.protogoogle/protobuf/timestamp.proto%kentik/core/v202303/annotations.proto"�
CreateConnectivityReportRequest�
cloud_provider (27.kentik.connectivity_checker.v202410beta1.CloudProviderB&�A2Cloud provider identification�ARcloudProvider!
src (	B�A2Source�ARsrc&
dst (	B�A2Destination�ARdst4
dst_port (	B�A2Destination Port�ARdstPort-
protocol (	B�A
2Protocol�ARprotocolh
src_type (24.kentik.connectivity_checker.v202410beta1.EntityTypeB�A2Source Entity TypeRsrcTypem
dst_type (24.kentik.connectivity_checker.v202410beta1.EntityTypeB�A2Destination Entity TypeRdstType�

start_time (2.google.protobuf.TimestampBK�AD2BStart Timestamp (UTC) which defines the time range for the report.�AR	startTime�
end_time	 (2.google.protobuf.TimestampBI�AB2@End timestamp (UTC) which defines the time range for the report.�ARendTime(
name
 (	B�A2Report Name�ARname"�
 CreateConnectivityReportResponse[
	reachable (B=�A624Attribute controlling whether the instance is active�AR	reachableh
return_reachable (B=�A624Attribute controlling whether the instance is active�ARreturnReachable|
query_status (	BY�AR2PARN of the IAM role granted access to the S3 bucket and describe API end-points.�ARqueryStatusx

report_url (	BY�AR2PARN of the IAM role granted access to the S3 bucket and describe API end-points.�AR	reportUrlo
paths (	BY�AR2PARN of the IAM role granted access to the S3 bucket and describe API end-points.�ARpaths|
return_paths (	BY�AR2PARN of the IAM role granted access to the S3 bucket and describe API end-points.�ARreturnPaths*a
CloudProvider
CLOUD_PROVIDER_UNSPECIFIED 
CLOUD_PROVIDER_AWS
CLOUD_PROVIDER_AZURE*~

EntityType
ENTITY_TYPE_UNSPECIFIED 
ENTITY_TYPE_SUBNET
ENTITY_TYPE_INSTANCE!
ENTITY_TYPE_NETWORK_INTERFACE2�
ConnectivityCheckerAdminService�
CreateConnectivityReportI.kentik.connectivity_checker.v202410beta1.CreateConnectivityReportRequestJ.kentik.connectivity_checker.v202410beta1.CreateConnectivityReportResponse"��A�%Create a Connectivity Checker Report.TCreate a connectivity checker report based on configuration provided in the request.*CreateConnectivityReport�� admin.connectivity_checker:write���.")/connectivity_checker/v202410beta1/create:*8�Agrpc.api.kentik.com��admin.connectivity_checker��B�Zhgithub.com/kentik/api-schema-public/gen/go/kentik/connectivity_checker/v202410beta1;connectivity_checker�A��
Kentik Connectivity Checker API�# Overview
The Connectivity Checker API provides programmatic access to Kentik's Connectivity Checker, which allows the checking and monitoring of forward and return paths between two points on your cloud network, over a specified time range interval, for entities such as Instances, Subnets, and Network Interfaces.### Supported Cloud Providers
The functionality and configuration parameters supported by this API differ by cloud provider. The API currently supports the following providers:
* [Amazon Web Services](https://kb.kentik.com/v0/Bd06.htm) (AWS)
* [Microsoft Azure](https://kb.kentik.com/v0/Bd08.htm)

### Supported Entity Types
For AWS, the API currently support checking connectivity between the following entities:
* Subnets* Instances* Network Interfaces
For Azure, the API currently support checking connectivity between the following entities:
* Subnets
### Requirements
For Kentik's Connectivity Checker API to successfully query the connection between entity resources, aKentik Cloud Export must be configured for a supported Cloud Provider (Aws or Azure)(see [Cloud Exports and Devices] (https://kb.kentik.com/v4/Na00.htm#Na00-Cloud_Exports_and_Devices)).Once a cloud export has been successfully configured, Kentik will pull metadata at regular intervals from the account specified in the cloud export, and the Connectivity Checker will use this metadata to: * Visualize the path for a connection between any two points in your AWS network* Check routing and NACL/SG configuration to quickly highlight where a connection is blocked* Get a direct link to the misconfigured gateway or security policy in the cloud dashboard to quickly fix the issue
### Frequency of available data
Because Connectivity Checker relies upon what's discovered during metadata retrieval, query results will be limited to the timeframe of the latest metadata-retrieval fetch.  Currently this is limited to 15-minutes intervals."E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202410beta1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token rh
)Kentik Connectivity Checker documentation;https://kb.kentik.com/v4/Na05.htm#Na05-Connectivity_CheckerJ�
  �

  

 1

 
	
 
	
  &
	
 !
	
 )
	
 8
	
	 )
	
 /
	
 Y

� Y

 \ c {{.Name}}



 \

  ^! Invalid value.


  ^

  ^ 
"
 ` Amazon Web Services


 `

 `

 b Microsoft Azure


 b

 b

g p {{.Name}}



g

 i Invalid value.


 i

 i

k Subnet


k

k

m
 Instance


m

m
!
o$ Network Interfaces


o

o"#

 s � {{.Name}}



 s'

  ty

  t

  t

  t!"

  t#y

  � u*

  �vx

 z

 z

 z	

 z

 z

 �{}

 � ~*

 ��

 �

 �	

 �

 ��

 ���

 � �*

 ��

 �

 �	

 �

 ��

 ���

 � �*

 ��

 �

 �	

 �

 ��

 ���

 � �*

 ��

 �

 �

 �

 ��

 ���

 ��

 �

 �

 �

 ��

 ���

 ��

 �

 �&

 �)*

 �+�

 � �*

 ���

 ��

 �

 �$

 �'(

 �)�

 � �*

 ���

 	��

 	�

 	�	

 	�

 	��

 	���

 	� �*

� � {{.Name}}


�(

 ��

 �

 �

 �

 ��

 � �-

 ���

��

�

�

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�


�

�

�

��

� �-

���

��

�


�

�

�!"

�#�

� �-

���

 � �

 �'

 �;

 ��;

 �F

 �+�F

 �L

 �*�L

  ��

  �

  �>

  �Ii

  �S

  �*�S

  ��

	  �ʼ"��

  ��

  ���bproto3��  
�I
kentik/cost/v202308/cost.protokentik.cost.v202308google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"�
CostProviderSummaryD
date (	B0�A-2+Date of the cost provider summary (YYYY-MM)Rdate�
status (2.kentik.cost.v202308.StatusB��A�2�Status of the billing cycle for the cost provider. Billing cycle is complete if a month has passed since the billing cycle start dateRstatusC

total_cost (B$�A!2Total cost of the cost providerR	totalCost�
total_cost_variation (	Ba�A^2\Total cost percent variation of the cost provider (percentage changed vs the previous month)RtotalCostVariation�
 total_cost_group_additional_cost (B:�A725Total cost group additional cost of the cost providerRtotalCostGroupAdditionalCost�
*total_cost_group_additional_interface_cost (BD�AA2?Total cost group additional interface cost of the cost providerR%totalCostGroupAdditionalInterfaceCost^
currency (	BB�A?2=Currency (ISO 4217) used for cost values of the cost providerRcurrencye
cost_per_mbps (BA�A>2<Cost per mbps (million bits per second) of the cost providerRcostPerMbps�
cost_per_mbps_variation	 (	Bd�Aa2_Cost per mbps percent variation of the cost provider (percentage changed vs the previous month)RcostPerMbpsVariationL
provider_name
 (	B'�A$2"Provider name of the cost providerRproviderNameQ
cost_group_name (	B)�A&2$Cost group name of the cost providerRcostGroupNamee
cost_group_conn_type (	B4�A12/Cost group connection type of the cost providerRcostGroupConnType@
	site_name (	B#�A 2Site name of the cost providerRsiteNameF
site_market (	B%�A"2 Site market of the cost providerR
siteMarketz
ingress_traffic_mbps (BH�AE2CIngress traffic mbps (million bits per second) of the cost providerRingressTrafficMbps�
ingress_traffic_variation (	Bf�Ac2aIngress traffic percent variation of the cost provider (percentage changed vs the previous month)RingressTrafficVariationw
egress_traffic_mbps (BG�AD2BEgress traffic mbps (million bits per second) of the cost providerRegressTrafficMbps�
egress_traffic_variation (	Be�Ab2`Egress traffic percent variation of the cost provider (percentage changed vs the previous month)RegressTrafficVariation"
CostProviderConcise0
id (	B �A2ID of the cost provider�ARid6
name (	B"�A2Name of the cost provider�ARname"
ListCostProvidersRequest"�
ListCostProvidersResponse
	providers (2(.kentik.cost.v202308.CostProviderConciseB7�A422List of configurations of requested cost providersR	providerse
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"h
 ListCostProviderSummariesRequestD
date (	B0�A-2+Date of the cost provider summary (YYYY-MM)Rdate"�
!ListCostProviderSummariesResponsez
	providers (2(.kentik.cost.v202308.CostProviderSummaryB2�A/2-List of summaries of requested cost providersR	providerse
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"�
GetCostProviderSummaryRequestW
id (	BG�AD2BID of the cost provider (can be found using ListCostProviders RPC)RidD
date (	B0�A-2+Date of the cost provider summary (YYYY-MM)Rdate"�
GetCostProviderSummaryResponsez
	providers (2(.kentik.cost.v202308.CostProviderSummaryB2�A/2-List of summaries of requested cost providersR	providerse
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount*L
Status
STATUS_UNSPECIFIED 
STATUS_INCOMPLETE
STATUS_COMPLETE2�
CostService�
ListCostProviders-.kentik.cost.v202308.ListCostProvidersRequest..kentik.cost.v202308.ListCostProvidersResponse"��AYList all cost providers.*Returns list of configured cost providers.*ListCostProviders��admin.cost:read���/cost/v202308/cost/providers�
ListCostProviderSummaries5.kentik.cost.v202308.ListCostProviderSummariesRequest6.kentik.cost.v202308.ListCostProviderSummariesResponse"��Aw!List all cost provider summaries.7Returns list of summaries of configured cost providers.*ListCostProviderSummaries��admin.cost:read���/cost/v202308/cost/summary�
GetCostProviderSummary2.kentik.cost.v202308.GetCostProviderSummaryRequest3.kentik.cost.v202308.GetCostProviderSummaryResponse"��AbGet cost provider summary.,Returns summary of configured cost provider.*GetCostProviderSummary��admin.cost:read���!/cost/v202308/cost/summary/{id}(�Agrpc.api.kentik.com��
admin.cost��B�ZCgithub.com/kentik/api-schema-public/gen/go/kentik/cost/v202308;cost�A��
#Connectivity Cost Configuration APIv# Overview
The Connectivity Cost Configuration API provides programmatic access to configuration of Connectivity Costs"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202308*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ� 
  �

  

 

 Z
	
 Z
	
  &
	
 !
	
 )
	
 )
	
	 8
	

 /
	
 :

� :
R
 ? C {{.Name}}
29 -------------------------------------------------------



 ?

  @

  @

  @

 A

 A

 A

 B

 B

 B

 F � {{.Name}}



 F

  GK

  G

  G	

  G

  GK

  �HJ

 LP

 L

 L	

 L

 LP

 �MO

 QU

 Q

 Q

 Q

 QU

 �RT

 VZ

 V

 V	

 V !

 V"Z

 �WY

 [_

 [

 [(

 [+,

 [-_

 �\^

 `d

 `

 `2

 `56

 `7d

 �ac

 ei

 e

 e	

 e

 ei

 �fh

 jn

 j

 j

 j

 jn

 �km

 os

 o

 o	 

 o#$

 o%s

 �pr

 	tx

 	t

 	t	

 	t

 	tx

 	�uw

 
y}

 
y

 
y	

 
y

 
y}

 
�z|

 ~�

 ~

 ~	

 ~ "

 ~#�

 ��

 ��

 �

 �	

 �

 ��

 ���

 ��

 �

 �	

 �

 ��

 ���

 ��

 �

 �

 �!

 �"�

 ���

 ��

 �

 �	"

 �%'

 �(�

 ���

 ��

 �

 �

 � 

 �!�

 ���

 ��

 �

 �	!

 �$&

 �'�

 ���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

���

� �*

� # {{.Name}}


� 

� � {{.Name}}


�!

 ��

 �


 �

 �(

 �+,

 �-�

 ���

��

�

�	

�

��

���

� � {{.Name}}


�(

 ��

 �

 �	

 �

 ��

 ���

� � {{.Name}}


�)

 ��

 �


 �

 �(

 �+,

 �-�

 ���

��

�

�	

�

��

���

� � {{.Name}}


�%

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

� � {{.Name}}


�&

 ��

 �


 �

 �(

 �+,

 �-�

 ���

��

�

�	

�

��

���
Z
 � �2L services and RPCs
 -------------------------------------------------------


 �

 �;

 ��;

 �F

 �+�F

 �<

 �*�<
,
  ��2 --- Connectivity Costs ---


  �

  �0

  �;T

  �B

  �*�B

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 � @

 �Kl

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �:

 �Ec

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���bproto3��   
�c
kentik/user/v202211/user.protokentik.user.v202211google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"�
PermissionEntry`

capability (	B@�A927String identifying capability that is granted of denied�AR
capabilityO
allowed (B5�A.2,Flag indicating whether operation is allowed�ARallowed"�
User;
id (	B+�A$2"System generated unique identifier�ARidU

user_email (	B6�A/2-User e-mail address (serves also as username)�AR	userEmail8
user_full_name (	B�A2	Full name�ARuserFullNameY
role (2.kentik.user.v202211.RoleB*�A#2!User role (in Kentik application)�ARrole}
permissions (2$.kentik.user.v202211.PermissionEntryB5�A220Optional list of permissions granted to the userRpermissionsa
filter (	BI�AF2DOptional JSON string defining filter for objects visible to the userRfiltern

last_login (2.google.protobuf.TimestampB3�A,2*UTC Timestamp of user's last login session�AR	lastLoginS
cdate	 (2.google.protobuf.TimestampB!�A2Creation timestamp (UTC)�ARcdate\
edate
 (2.google.protobuf.TimestampB*�A#2!Last modification timestamp (UTC)�ARedate"
ListUsersRequest"�
ListUsersResponseV
users (2.kentik.user.v202211.UserB%�A2Last of users in the account�ARuserse
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"C
GetUserRequest1
id (	B!�A2ID of the requested user�ARid"k
GetUserResponseX
user (2.kentik.user.v202211.UserB)�A&2$Information about the requested userRuser"z
CreateUserRequeste
user (2.kentik.user.v202211.UserB6�A/2-Attributes for the user account to be created�ARuser"w
CreateUserResponsea
user (2.kentik.user.v202211.UserB2�A/2-Attributes for the newly created user accountRuser"p
UpdateUserRequest[
user (2.kentik.user.v202211.UserB,�A%2#New attributes for the user account�ARuser"i
UpdateUserResponseS
user (2.kentik.user.v202211.UserB$�A!2Updated user account attributesRuser"V
DeleteUserRequestA
id (	B1�A*2(ID of the the user account to be deleted�ARid"
DeleteUserResponse"c
ResetApiTokenRequestK
id (	B;�A422ID of the the user whose API token should be reset�ARid"
ResetApiTokenResponse"h
ResetActiveSessionsRequestJ
id (	B:�A321ID of the the user whose sessions should be reset�ARid"
ResetActiveSessionsResponse*c
Role
ROLE_UNSPECIFIED 
ROLE_MEMBER
ROLE_ADMINISTRATOR
ROLE_SUPER_ADMINISTRATOR2�
UserService�
	ListUsers%.kentik.user.v202211.ListUsersRequest&.kentik.user.v202211.ListUsersResponse"��AQList all users.3Returns a list of all user accounts in the company.*	ListUsers��admin.user:read���/user/v202211/users�
GetUser#.kentik.user.v202211.GetUserRequest$.kentik.user.v202211.GetUserResponse"��Ac!Get attributes of a user account.5Returns attributes of a user account specified by ID.*GetUser��admin.user:read���/user/v202211/users/{id}�

CreateUser&.kentik.user.v202211.CreateUserRequest'.kentik.user.v202211.CreateUserResponse"��A�Create new user account.mCreates new user account based on attributes in the request. Returns attributes of the newly created account.*
CreateUser��admin.user:write���"/user/v202211/users:*�

UpdateUser&.kentik.user.v202211.UpdateUserRequest'.kentik.user.v202211.UpdateUserResponse"��A�$Update attributes of a user account.uReplaces all attributes of a user account specified by ID with attributes in the request. Returns updated attributes.*
UpdateUser��admin.user:write���"/user/v202211/users/{user.id}:*�

DeleteUser&.kentik.user.v202211.DeleteUserRequest'.kentik.user.v202211.DeleteUserResponse"��AKDelete a user account.%Deletes user account specified by ID.*
DeleteUser��admin.user:write���*/user/v202211/users/{id}�
ResetApiToken).kentik.user.v202211.ResetApiTokenRequest*.kentik.user.v202211.ResetApiTokenResponse"��AZReset API token for a user.,Resets API token for a user specified by ID.*ResetApiToken��admin.user:write���*(/user/v202211/users/{id}/reset_api_token�
ResetActiveSessions/.kentik.user.v202211.ResetActiveSessionsRequest0.kentik.user.v202211.ResetActiveSessionsResponse"��Am"Resets active sessions for a user.2Resets active sessions for a user specified by ID.*ResetActiveSessions��admin.user:write���0./user/v202211/users/{id}/reset_active_sessions(�Agrpc.api.kentik.com��
admin.user��B�ZCgithub.com/kentik/api-schema-public/gen/go/kentik/user/v202211;user�A��
User Management API�# Overview
The User Management API enables programmatic administration of users within your organization. The API may be used to grant permissions to users at two levels: 
* **User role**: Permissions based on the level assigned to the Kentik user, either Member, Administrator, or Super Administrator (see [About Users](https://kb.kentik.com/v4/Cb02.htm#Cb02-About_Users)).
* **User permissions**: Permissions granting access to specific capabilities of the Kentik platform (see [User Permissions](https://kb.kentik.com/v4/Cb02.htm#Cb02-User_Permissions)).

Both REST endpoint and gRPC RPCs are provided.

***Note:*** The legacy REST-only [User API](https://kb.kentik.com/v0/Ec06.htm#Ec06-User_API) provides a subset of the functionality of this API.

# User Permission Identifiers

Individual user permissions are represented in this API by string-based identifiers. The table below shows the identifier used in the API for each permission that can be enabled/disabled with the checkboxes on the Permissions tab of the Edit User dialog in the Kentik portal's Manage Users module (Settings » Manage Users).
| Portal setting  | API identifier |
|-----------------|----------------|
| Cancel Queries in Forensic Viewer | forensic_viewer.cancel_queries |
| Synthetics Permissions: Create tests | synthetics.tests.create |
| Synthetics Permissions: Edit tests | synthetics.tests.edit |
| Synthetics Permissions: Delete tests | synthetics.tests.delete |
| Synthetics Permissions: Create agents | synthetics.agents.create |
| Synthetics Permissions: Edit agents | synthetics.agents.edit |
| Synthetics Permissions: Delete agents | synthetics.agents.delete |
| Connectivity Costs Permissions: View Costs | connectivity_costs.read |
| Connectivity Costs Permissions: Configure Costs | connectivity_costs.edit |

**_Note:_** The API returns an error if the same permission is both granted and denied in the same request.

### Default Permissions

The permissions above that are enabled/disabled by default depend on the role (level) of the user:
* **Member**: All permissions in the table above are denied by default.
* **Administrator** or **Super Administrator**: All permissions are granted. 

# User Filter Attribute

User filters enable Administrators to apply filters that restrict the data that can be returned from queries by a given user (see [User Filters](https://kb.kentik.com/v4/Cb02.htm#Cb02-User_Filters)). In the Kentik portal these filters are set on the Filters tab of the Edit User dialog in the Manage Users module. In this API the filters are set in the `user` object with the `filter` attribute, whose type is string. The value of the attribute is given in JSON notation. The recommended way to construct the JSON string is to configure the desired filter for one user in the Kentik portal and then copy the value of the `user.filter` attribute returned for that user by the `GetUser` RPC."E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202211*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�%
  �

  

 

 Z
	
 Z
	
  &
	
 !
	
 )
	
 )
	
	 8
	

 /
	
 g

� g

 j s {{.Name}}



 j	

  l Invalid value.


  l

  l

 n Member


 n

 n

 p Administrator


 p

 p
"
 r Super-administrator


 r

 r

 v � {{.Name}}



 v

  w|

  w

  w	

  w

  w|

  �xz

  � {*

 }�

 }

 }

 }

 }�

 �~�

 � �*

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

���

� �*

��

�

�	

�

��

���

� �*

��

�

�

�

��

���

� �*

��

�


�

�&

�)*

�+�

���

��

�

�	

�

��

���

��

�

�&

�)*

�+�

� �-

���

��

�

�!

�$%

�&�

� �-

���

��

�

�!

�$&

�'�

� �-

���

�  {{.Name}}


�

� � {{.Name}}


�

 ��

 �


 �

 �

 �

 ��

 � �-

 ���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

 � �*

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

 � �*

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

 � �*

	� � {{.Name}}


	�

	 ��

	 �

	 �

	 �

	 ��

	 ���


� � {{.Name}}



�


 ��


 �


 �	


 �


 ��


 ���


 � �*

�  {{.Name}}


�

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

 � �*

�   {{.Name}}


�

� � {{.Name}}


�"

 ��

 �

 �	

 �

 ��

 ���

 � �*

� & {{.Name}}


�#

 � �

 �

 �;

 ��;

 �F

 �+�F

 �<

 �*�<

  ��

  �

  � 

  �+<

  �B

  �*�B

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �

 �'6

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �"

 �-?

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �"

 �-?

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �"

 �-?

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �4

 �?Z

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���bproto3��  
�%
&kentik/vault/v202312alpha1/vault.protokentik.vault.v202312alpha1google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"�
Secret.
name (	B�A2The secret's name�ARname8
value (	B"�A2The secret's actual value�ARvalue7
version (B�A2The secret's version�ARversion=
description (	B�A2Purpose of this secretRdescriptionR
type (2&.kentik.vault.v202312alpha1.SecretTypeB�A2The secret's typeRtype0
id (	B �A2The secret's identifier�ARid"B
GetSecretRequest.
name (	B�A2The secret's name�ARname"`
GetSecretResponseK
secret (2".kentik.vault.v202312alpha1.SecretB�A2Secret�ARsecret"E
ListSecretRequest0
names (	B�A2The secret's name�ARnames"�
ListSecretResponseV
secrets (2".kentik.vault.v202312alpha1.SecretB�A2List of secrets�ARsecrets�
invalid_credential_count (BR�AO2MNumber of objects with invalid data (which are not returned in the response).RinvalidCredentialCount*�

SecretType
SECRET_TYPE_UNSPECIFIED 
SECRET_TYPE_BASIC_AUTH
SECRET_TYPE_SNMP_V1
SECRET_TYPE_SNMP_V2C
SECRET_TYPE_SNMP_V3#
SECRET_TYPE_STREAMING_TELEMETRY
SECRET_TYPE_BGP_MD5
SECRET_TYPE_API_TOKEN
SECRET_TYPE_OTHER2�
VaultService�
	GetSecret,.kentik.vault.v202312alpha1.GetSecretRequest-.kentik.vault.v202312alpha1.GetSecretResponse"��ARGet a secret by name..Returns a secret value stored in Kentik vault.*	GetSecret��
vault:read���%#/vault/v202312alpha1/secrets/{name}�

ListSecret-.kentik.vault.v202312alpha1.ListSecretRequest..kentik.vault.v202312alpha1.ListSecretResponse"��ARList secrets.5Returns list of secret values stored in Kentik vault.*
ListSecret��
vault:read���/vault/v202312alpha1/secrets�Agrpc.api.kentik.com���� B�ZKgithub.com/kentik/api-schema-public/gen/go/kentik/vault/v202312alpha1;vault�A��
	Vault API]# Overview
The Vault API enables programmatic access to secrets stored in your Kentik vault.
"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202312alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�
  �

  

 #

 b
	
 b
	
  &
	
 !
	
 )
	
 )
	
	 8
	

 /
	
 :

� :

 = G {{.Name}}



 =

  >

  >

  >

 ?

 ?

 ?

 @

 @

 @

 A

 A

 A

 B

 B

 B

 C&

 C!

 C$%

 D

 D

 D

 E

 E

 E

 F

 F

 F

 J m {{.Name}}



 J

  KP

  K

  K	

  K

  KP

  �LN

  � O*

 QV

 Q

 Q	

 Q

 QV

 �RT

 � U*

 W\

 W

 W	

 W

 W\

 �XZ

 � [*

 ]a

 ]

 ]	

 ]

 ]a

 �^`

 bf

 b

 b

 b

 bf

 �ce

 gl

 g

 g	

 g

 gl

 �hj

 � k*

p w {{.Name}}



p

 qv

 q

 q	

 q

 qv

 �rt

 � u*

z � {{.Name}}



z

 {�

 {

 {	

 {

 {�

 �|~

 � *

� � {{.Name}}


�

 ��

 �


 �

 �

 �

 ��

 ���

 � �*

� �

�

 ��

 �


 �

 �

 �

 ��

 ���

 � �*

��

�

�	!

�$%

�&�

���

 � �

 �

 �;

 ��;

 �G

 �+�G

 �6

 �*�6

  ��

  �

  � 

  �+<

  �=

  �*�=

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �"

 �-?

 �=

 �*�=

 ��

	 �ʼ"��

 ��

 ���bproto3��   
� 
0kentik/credential/v202407alpha1/credential.protokentik.credential.v202407alpha1google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.protokentik/user/v202211/user.proto&kentik/vault/v202312alpha1/vault.proto"�
CredentialGroup
id (	Rid
name (	Rname7
version (B�A2The secret's version�ARversion=
description (	B�A2Purpose of this secretRdescriptionR
type (2&.kentik.vault.v202312alpha1.SecretTypeB�A2The secret's typeRtype0
cdate (2.google.protobuf.TimestampRcdate0
edate (2.google.protobuf.TimestampRedate8

created_by (2.kentik.user.v202211.UserR	createdByD
credentials	 (2".kentik.vault.v202312alpha1.SecretRcredentials
labels
 (	Rlabels"+
GetCredentialGroupRequest
id (	Rid"d
GetCredentialGroupResponseF
group (20.kentik.credential.v202407alpha1.CredentialGroupRgroup"
ListCredentialGroupRequest"�
ListCredentialGroupResponseH
groups (20.kentik.credential.v202407alpha1.CredentialGroupRgroups#
invalid_count (RinvalidCount2�
CredentialService�
GetCredentialGroup:.kentik.credential.v202407alpha1.GetCredentialGroupRequest;.kentik.credential.v202407alpha1.GetCredentialGroupResponse"��AsGet a credential group by id.>Returns specific credential group information in Kentik vault.*GetCredentialGroup��admin.credential:read���&$/credential/v202407alpha1/group/{id}�
ListCredentialGroup;.kentik.credential.v202407alpha1.ListCredentialGroupRequest<.kentik.credential.v202407alpha1.ListCredentialGroupResponse"��AmList credential groups.=Returns list of credential group information in Kentik vault.*ListCredentialGroup��admin.credential:read���!/credential/v202407alpha1/group.�Agrpc.api.kentik.com��admin.credential��B�ZUgithub.com/kentik/api-schema-public/gen/go/kentik/credential/v202407alpha1;credential�A��
Credentials Vault APIw# Overview
The Credentials Vault API enables programmatic access to credential information in Kentik Credential Vault.
"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202407alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�
  �

  

 (

 l
	
 l
	
  &
	
 !
	
 )
	
 )
	
	 8
	

 /
	
 (
	
 0
	
 <

� <


 > V


 >

  ?

  ?

  ?	

  ?

 @

 @

 @	

 @

 AF

 A

 A	

 A

 AF

 �BD

 � E*

 GK

 G

 G	

 G

 GK

 �HJ

 LP

 L'

 L(,

 L/0

 L1P

 �MO

 Q&

 Q

 Q!

 Q$%

 R&

 R

 R!

 R$%

 S*

 S

 S%

 S()

 T=

 T


 T,

 T-8

 T;<

 	U

 	U


 	U

 	U

 	U

Y [ {{.Name}}



Y!

 Z

 Z

 Z	

 Z

^ ` {{.Name}}



^"

 _

 _

 _

 _

d e {{.Name}}



d"

h k {{.Name}}



h#

 i&

 i


 i

 i!

 i$%

j

j

j	

j

 m �


 m


 n;

 �n;


 oF

 �+oF


 pB

 �*pB

  s}

  s

  s2

  s>X

  tH

  �*tH

  uw

	  �ʼ"uw

  x|

  �x|

 ��

 �

 �4

 �@[

 �H

 �*�H

 ��

	 �ʼ"��

 ��

 ���bproto3��  
��
<kentik/custom_dimension/v202411alpha1/custom_dimension.proto%kentik.custom_dimension.v202411alpha1google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.protokentik/user/v202211/user.proto"�
CustomDimensionD
id (B4�A-2+Unique identifier for the custom dimension.�ARid�
name (	B��A�2�The name of the custom dimension. Must start with 'c_'. Valid characters: alphanumeric dashes and underscores. Length: min=1, max=20.�ARname^
type (	BJ�AC2AType of the custom dimension (valid values: 'string' or 'uint32')�ARtype�
description (	B��A�2�The name to be displayed of the custom dimension. Valid characters: alphanumeric spaces, dashes and underscores. Length: min=2, max=30.�ARdescription�

populators (20.kentik.custom_dimension.v202411alpha1.PopulatorB:�A321Populators associated with this custom dimension.�AR
populatorsO

company_id (B0�A)2'The system-assigned ID of the customer.�AR	companyIdp
created_date (2.google.protobuf.TimestampB1�A*2(Date-time of populator creation, in UTC.�ARcreatedDatex
updated_date (2.google.protobuf.TimestampB9�A220Date-time of most-recent populator edit, in UTC.�ARupdatedDate"�%
	Populator=
id (B-�A&2$Unique identifier for the populator.�ARid�
value (	B��A�2�The value of the dimension. When the custom dimension's type is 'string' - Valid characters: alphanumeric, spaces, dashes and underscores. Length: min=1, max=128. When the custom dimension's type is 'uint32' - Valid values: min=0, max=4294967295.Rvaluek
	direction (	BM�AJ2HThe direction of the populator. Valid values: 'src', 'dst', or 'either'.R	direction�
device_name (	B��A�2�Device names, IPs, or regular expressions. A match results when any specified device name matches the device name or IP address associated with a device sending flow data.R
deviceName�
device_type (	B��A�2�Device types or regular expressions. A match results when any specified device type matches the device_type associated with a device sending flow data.R
deviceType�
site (	B��A�2�Site names or regular expressions. A match results when any specified site matches the site associated with a device sending flow data.Rsite�
interface_name (	B��A�2�Interface names or regular expressions. A match results when any specified interface name matches the name or description of an interface sending flow data.RinterfaceName�
addr (	B��A�2�IP addresses in IP/CIDR format. A match results when any specified IP address corresponds to a range of IP addresses in incoming flow. It allows IPv6 CIDRs. 'short form' (e.g. 1::2/127) is allowed. If no CIDRs are specified in a tag, the tag will be matched against both incoming IPv4 and v6 flows. If CIDRs are given, the tag will only be matched against the given type of flow; in particular, if you only give IPv4 CIDRs, the tag will not match any IPv6 flows, and vice versa.Raddr�
port	 (Bq�An2lPorts (between 0 and 65535). A match results when any specified port matches a port number in incoming flow.Rport�
	tcp_flags
 (B��A�2�TCP flag: Numbers between 0 and 255 representing an 8-bit binary bit pattern corresponding to TCP flags. A match will result if the value in both the flow bit pattern and the bitmask is 1 at any of the eight places.RtcpFlags�
protocol (B��A�2�Protocol numbers (between 0 and 255). A match results when any specified protocol number is the same as the protocol of the traffic represented by the flow.Rprotocol�
asn (B��A�2�Last-hop (origin) ASN: ASNs (between 1 and 2^32-1=4294967295). A match results when any specified ASN is the same as the last ASN in the path in the routing table for either the source (SRC IP) or destination (DST IP).Rasn�
lasthop_as_name (	B��A�2�Last-hop (origin) AS Name: AS Names or regular expressions. A match results when any specified AS Name represents the name corresponding to the last ASN in the path in the routing table for either the source (SRC IP) or destination (DST IP).RlasthopAsName�
nexthop_asn (By�Av2tNext-hop ASN. A match results when any specified ASN is the same as the ASN of the next hop router based on AS path.R
nexthopAsn�
nexthop_as_name (	B��A�2�Next-hop AS Name: AS Names or regular expressions. A match results when any specified ASN represents the name corresponding to the ASN of the next hop router based on AS path.RnexthopAsName�
nexthop (	B��A�2�Next-hop IP: IPv4 and/or IPv6 CIDRs. A match results when any specified IP is within a range of specified IPv4 and/or IPv6 CIDRs.Rnexthop�

bgp_aspath (	B��A�2�BGP AS path: Numbers representing bgp aspath. A match results when any specified value is the same as the BGP AS-PATH in the route. Example: '^3737 1212,_7801_,2906$' would look for any of those 3 combinations in the AS path. Permitted characters []*:_^$.0123456789()+?,space-R	bgpAspath�
bgp_community (	B��A�2�BGP community: Numbers or regular expression representing BGP community (i.e. 2096:2212). A match results when any specified value is the same as the BGP community of the BGP route associated with incoming flow data. Permitted characters []*:_^$.0123456789()+?,space-RbgpCommunity�
mac (	Bw�At2rMAC Addresses. A match results when any specified MAC Address matches source or destination Ethernet (L2) address.Rmac�
country (	B��A�2�Country: Two-character country codes. A match results when any specified country code matches source or destination country of the flow.RcountryV
vlans (	B@�A=2;VLAN(s): Integers or ranges of integers between 0 and 4095.RvlansZ
user (	BF�A?2=The system-assigned ID of the user who created the populator.�ARuserp
created_date (2.google.protobuf.TimestampB1�A*2(Date-time of populator creation, in UTC.�ARcreatedDatex
updated_date (2.google.protobuf.TimestampB9�A220Date-time of most-recent populator edit, in UTC.�ARupdatedDate"
ListCustomDimensionsRequest"v
ListCustomDimensionsResponseV

dimensions (26.kentik.custom_dimension.v202411alpha1.CustomDimensionR
dimensions"O
GetCustomDimensionInfoRequest.
custom_dimension_id (RcustomDimensionId"v
GetCustomDimensionInfoResponseT
	dimension (26.kentik.custom_dimension.v202411alpha1.CustomDimensionR	dimension"t
CreateCustomDimensionRequestT
	dimension (26.kentik.custom_dimension.v202411alpha1.CustomDimensionR	dimension"u
CreateCustomDimensionResponseT
	dimension (26.kentik.custom_dimension.v202411alpha1.CustomDimensionR	dimension"�
UpdateCustomDimensionRequest.
custom_dimension_id (RcustomDimensionIdT
	dimension (26.kentik.custom_dimension.v202411alpha1.CustomDimensionR	dimension"u
UpdateCustomDimensionResponseT
	dimension (26.kentik.custom_dimension.v202411alpha1.CustomDimensionR	dimension"N
DeleteCustomDimensionRequest.
custom_dimension_id (RcustomDimensionId"
DeleteCustomDimensionResponse"�
CreatePopulatorRequest.
custom_dimension_id (RcustomDimensionIdN
	populator (20.kentik.custom_dimension.v202411alpha1.PopulatorR	populator"i
CreatePopulatorResponseN
	populator (20.kentik.custom_dimension.v202411alpha1.PopulatorR	populator"�
UpdatePopulatorRequest.
custom_dimension_id (RcustomDimensionId!
populator_id (RpopulatorIdN
	populator (20.kentik.custom_dimension.v202411alpha1.PopulatorR	populator"i
UpdatePopulatorResponseN
	populator (20.kentik.custom_dimension.v202411alpha1.PopulatorR	populator"k
DeletePopulatorRequest.
custom_dimension_id (RcustomDimensionId!
populator_id (RpopulatorId"
DeletePopulatorResponse2�
CustomDimensionService�
ListCustomDimensionsB.kentik.custom_dimension.v202411alpha1.ListCustomDimensionsRequestC.kentik.custom_dimension.v202411alpha1.ListCustomDimensionsResponse"��A�List Custom DimensionspReturns an array of custom dimension objects that each contain information about an individual custom dimension.*ListCustomDimensions���" /custom_dimensions/v202411alpha1�
GetCustomDimensionInfoD.kentik.custom_dimension.v202411alpha1.GetCustomDimensionInfoRequestE.kentik.custom_dimension.v202411alpha1.GetCustomDimensionInfoResponse"��A�Custom Dimension Info^Returns a custom dimension object containing information about an individual custom dimension.*GetCustomDimensionInfo���86/custom_dimensions/v202411alpha1/{custom_dimension_id}�
CreateCustomDimensionC.kentik.custom_dimension.v202411alpha1.CreateCustomDimensionRequestD.kentik.custom_dimension.v202411alpha1.CreateCustomDimensionResponse"��A�Create Custom DimensioniCreates and returns a custom dimension object containing information about an individual custom dimension*CreateCustomDimension��� "/v1/customdimension:	dimension�
UpdateCustomDimensionC.kentik.custom_dimension.v202411alpha1.UpdateCustomDimensionRequestD.kentik.custom_dimension.v202411alpha1.UpdateCustomDimensionResponse"��A�Update Custom Dimension�Updates and returns a custom dimension object containing information about an individual custom dimension (see About Custom Dimensions). Populators are not sent back in the response body. To get them use 'Custom Dimension info' API instead.*UpdateCustomDimension���C6/custom_dimensions/v202411alpha1/{custom_dimension_id}:	dimension�
DeleteCustomDimensionC.kentik.custom_dimension.v202411alpha1.DeleteCustomDimensionRequestD.kentik.custom_dimension.v202411alpha1.DeleteCustomDimensionResponse"��AMDelete Custom DimensionDeletes a custom dimension.*DeleteCustomDimension���8*6/custom_dimensions/v202411alpha1/{custom_dimension_id}�
CreatePopulator=.kentik.custom_dimension.v202411alpha1.CreatePopulatorRequest>.kentik.custom_dimension.v202411alpha1.CreatePopulatorResponse"��A�Create Populator\Creates and returns a populator object containing information about an individual populator.*CreatePopulator���M"@/custom_dimensions/v202411alpha1/{custom_dimension_id}/populator:	populator�
UpdatePopulator=.kentik.custom_dimension.v202411alpha1.UpdatePopulatorRequest>.kentik.custom_dimension.v202411alpha1.UpdatePopulatorResponse"��A�Update Populator\Updates and returns a populator object containing information about an individual populator.*UpdatePopulator���\O/custom_dimensions/v202411alpha1/{custom_dimension_id}/populator/{populator_id}:	populator�
DeletePopulator=.kentik.custom_dimension.v202411alpha1.DeletePopulatorRequest>.kentik.custom_dimension.v202411alpha1.DeletePopulatorResponse"��A9Delete PopulatorDeletes a populator.*DeletePopulator���Q*O/custom_dimensions/v202411alpha1/{custom_dimension_id}/populator/{populator_id}4�Agrpc.api.kentik.com��admin.custom_dimension��B�Zagithub.com/kentik/api-schema-public/gen/go/kentik/custom_dimension/v202411alpha1;custom_dimension�A��
Custom Dimensions API{# Overview
The Custom Dimensions API enables programmatic access to information on Custom Dimensions and their Populators.
"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202411alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r�
[Knowledge base article outlining the purpose and usage of Custom Dimensions and Populators.'https://kb.kentik.com/proto/v4/Cb06.htmJ�2
  �

  

 .

 x
	
 x
	
  &
	
 !
	
 )
	
 )
	
	 8
	

 /
	
 (
	
 ;

� ;


 > x


 >

  ?D

  ?

  ?	

  ?

  ?D

  �@B

  � C-

 FK

 F

 F	

 F

 FK

 �GI

 � J*
9
 NS+ should be an enum instead? but also YAGNI


 N

 N	

 N

 NS

 �OQ

 � R*

 UZ

 U

 U	

 U

 UZ

 �VX

 � Y*

 \a

 \


 \

 \

 \"#

 \#a

 �]_

 � `-

 ch

 c

 c	

 c

 ch

 �df

 � g-

 jo

 j

 j(

 j+,

 j,o

 �km

 � n-

 qv

 q

 q(

 q+,

 q,v

 �rt

 � u-

z �


z

 {�

 {

 {	

 {

 {�

 �|~

 � -

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�


�

�

� !

�"�

���

��

�


�

�

� !

�"�

���

��

�


�

�

�

��

���

��

�


�

� 

�#$

�%�

���

��

�


�

�

�

��

���

��

�


�

�

�

��

���

	��

	�

	�	

	�

	��

	���


��


�



�


�


�


� �


���

��

�


�

�

�

��

���

��

�


�

�!

�$&

�'�

���

��

�


�

�

� "

�#�

���

��

�


�

�!

�$&

�'�

���

��

�


�

�

�

��

���

��

�


�

�

�!

�"�

���

��

�


�

�

�"$

�%�

���

��

�


�

�

�

��

���

��

�


�

�

�

��

���

��

�


�

�

�

��

���

��

�

�	

�

��

���

� �-

��

�

�(

�+-

�-�

���

� �-

��

�

�(

�+-

�-�

���

� �-

� � {{.Name}}


�#

� �

�$

 �*

 �


 �

 �%

 �()

� � {{.Name}}


�%

 �!

 �

 �	

 � 

� �

�&

 � 

 �

 �

 �

� �

�$

 � 

 �

 �

 �

� �

�%

 � 

 �

 �

 �

� �

�$

 �!

 �

 �	

 � 

� 

�

�

�

	� �

	�%

	 � 

	 �

	 �

	 �


� �


�$


 �!


 �


 �	


 � 

� �

�%

� �

�

 �!

 �

 �	

 � 

�

�

�

�

� �

�

 �

 �

 �

 �

� �

�

 �!

 �

 �	

 � 

�

�

�	

�

�

�

�

�

� �

�

 �

 �

 �

 �

� �

�

 �!

 �

 �	

 � 

�

�

�	

�

� �

�

 � �

 �

 �;

 ��;

 �F

 �+�F

 �H

 �*�H

  ��

  �

  �6

  �B^

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �:

 �Ec

 �a

	 �ʼ"�a

 ��

 ���

 ��

 �

 �8

 �C`

 �Q

	 �ʼ"�Q

 ��

 ���

 ��

 �

 �8

 �C`

 �s

	 �ʼ"�s

 ��

 ���

 ��

 �

 �8

 �C`

 �d

	 �ʼ"�d

 ��

 ���

 ��

 �

 �,

 �7N

 �~

	 �ʼ"�~

 ��

 ���

 ��

 �

 �,

 �7N

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �,

 �7N

 �}

	 �ʼ"�}

 ��

 ���bproto3��   
�
'kentik/device/v202308beta1/device.protokentik.device.v202308beta1google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.protogoogle/protobuf/duration.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"�
DeviceSnmpV3Conf�
username (	B��A�2�UserName (username) - the user name to use to authenticate via SNMP v3. ** UserName is required when device_snmp_v3_conf is not nullRusername�
authentication_protocol (	B]�AZ2XAuthentication Protocol (authentication_protocol) - the auth protocol to use via SNMP v3RauthenticationProtocol�
authentication_passphrase (	B��A�2�Authentication Passphrase (authentication_passphrase) - the passphrase to use for SNMP v3 authentication protocol (required when AuthenticationProtocol not NoAuth)RauthenticationPassphrase�
privacy_protocol (	Bb�A_2]Privacy Protocol (privacy_protocol) - the privacy protocol to use to authenticate via SNMP v3RprivacyProtocol�
privacy_passphrase (	B��A�2�Privacy Passphrase (privacy_passphrase) - the passphrase to use for SNMP v3 privacy protocol (required when PrivacyProtocol not NoPriv)RprivacyPassphrase"�
DeviceNmsConfigO
agent_id (	B4�A12/ID of the agent that is monitoring this device.RagentIdD

ip_address (	B%�A"2 Local IP address of this device.R	ipAddress�
snmp (2/.kentik.device.v202308beta1.DeviceNmsSnmpConfigB~�A{2yConfiguration if metrics will be collected over SNMP. Not including this configuration will make this a ping-only device.Rsnmp�
st (2-.kentik.device.v202308beta1.DeviceNmsStConfigBI�AF2DConfiguration if metrics will be collected over Streaming Telemetry.Rst"�
DeviceNmsSnmpConfige
credential_name (	B<�A927Name of the SNMP credentials from the credential vault.RcredentialName?
port (B+�A(2&SNMP port, to override default of 161.Rport]
timeout (2.google.protobuf.DurationB(�A%2#Timeout, to override default of 2s.Rtimeout"�
DeviceNmsStConfigc
credential_name (	B:�A725Name of the ST credentials from the credential vault.RcredentialName>
port (B*�A'2%ST port, to override default of 6030.Rport]
timeout (2.google.protobuf.DurationB(�A%2#Timeout, to override default of 2s.Rtimeout?
secure (B'�A$2"Use SSL to connect to this device.Rsecure"�)
DeviceConcise7
id (	B'�A$2"System generated unique identifierRid�
device_name (	B�A|2zDevice name (device_name) - The name of the device. Valid characters: alphanumeric and underscores. Length: min=4, max=60.R
deviceNamea
device_subtype (	B:�A725Device subtype (device_subtype) - The device subtype.RdeviceSubtype�
cdn_attr (	B��A�2�CDN attributes (cdn_attr) - If this is a DNS server, you can contribute its queries to Kentik's CDN attribution database. Valid values: "Y" or "N". ** cdn_attr is required when the device subtype's parent type is "host-nprobe-dns-www"RcdnAttr�
device_description (	Bg�Ad2bDescription (device_description) - The device description. Valid characters: any. Length: max=128.RdeviceDescription�
sending_ips (	B��A�2�Device ip (sending_ips) - Array containing one or more IP address(es), from which the device is sending flow. ** sending_ips is required when the device subtype's parent type is "router"R
sendingIps�
device_sample_rate (B��A�2�Sample rate (device_sample_rate) - The rate at which the device is sampling flows. Valid values: integer bigger than 1. Recommended rate varies depending on flow volume; see https://kb.kentik.com/Ab02.htm#Ab02-Flow_Sampling. ** device_sample_rate is required when the device subtype's parent type is "router"RdeviceSampleRate�
plan_id (B��A�2�Plan (plan_id) - The ID of the plan to which this device is assigned. Available plan(s) can be found via the Plans API. Valid value: integer.RplanId�
site_id	 (B��A�2�Site (site_id) - The ID of the site (if any) to which this device is assigned. Site IDs are system generated when a site is created. Valid value: integer.RsiteId�
minimize_snmp
 (B��A�2�SNMP polling (minimize_snmp) - The interval at which SNMP will be polled. If "false" (Standard), interface counter will be polled every 10 minutes and interface description every 30 minutes. If "true" (Minimum) (Minimum), interface counter won't be polled and interface description will be polled every 6 hours. ** minimize_snmp is required when the device subtype's parent type is "router"H RminimizeSnmp��
device_snmp_ip (	B��A�2�Device SNMP IP (device_snmp_ip) - The SNMP IP to use when polling the device. device_snmp_ip is ignored unless the device subtype's parent type is "router"RdeviceSnmpIp�
device_snmp_community (	B��A�2�SNMP community (device_snmp_community) - The SNMP community to use when polling the device. device_snmp_community is ignored unless the device subtype's parent type is "router"RdeviceSnmpCommunity�
device_snmp_v3_conf (2,.kentik.device.v202308beta1.DeviceSnmpV3ConfB��A�2�SNMP v3 configuration (device_snmp_v3_conf) - SNMP v3 configuration. device_snmp_v3_conf is ignored unless the device subtype's parent type is "router"RdeviceSnmpV3Conf�
device_bgp_type (	B��A�2�BGP (device_bgp_type) - Device bgp type. Valid values: "none" (use generic IP/ASN mapping), "device" (peer with the device itself), "other_device" (share routing table of existing peered device)RdeviceBgpType�
device_bgp_neighbor_ip (	B��A�2�Your IPv4 peering address (device_bgp_neighbor_ip) - A valid IPv4 address to use for peering with the device. ** An IPv4 and/or IPv6 peering address is required when device_bgp_type is set to "device"RdeviceBgpNeighborIp�
device_bgp_neighbor_ip6 (	B��A�2�Your IPv6 peering address (device_bgp_neighbor_ip6) - A valid IPv6 address to use for peering with the device. ** An IPv4 and/or IPv6 peering address is required when device_bgp_type is set to "device"RdeviceBgpNeighborIp6�
device_bgp_neighbor_asn (	B��A�2�Your ASN (device_bgp_neighbor_asn) - The valid AS number (ASN) of the autonomous system that this device belongs to. ** device_bgp_neighbor_asn is required when device_bgp_type is set to "device"RdeviceBgpNeighborAsn�
device_bgp_password (	B��A�2�BGP md5 password (device_bgp_password) - Optional BGP MD5 password (shared authentication password for BGP peering). Valid characters: alphanumeric. Length: 32. device_bgp_password is optional when device_bgp_type is set to "device"RdeviceBgpPassword�
use_bgp_device_id (B��A�2�Select master BGP device (use_bgp_device_id) - The ID of the device whose BGP table should be shared with this device. ** use_bgp_device_id is required when device_bgp_type is set to "other_device"). Valid value: a system-generated device_idRuseBgpDeviceId�
device_bgp_flowspec (Be�Ab2`BGP Flowspec Compatibility (device_bgp_flowspec) - Toggle BGP Flowspec Compatibility for device.RdeviceBgpFlowspecz
nms (2+.kentik.device.v202308beta1.DeviceNmsConfigB;�A826Configuration if this device will be monitored by NMS.Rnms�
device_bgp_credential_name (	B��A�2�BGP Credential Name (device_bgp_credential_name) - Optional Credential Name (Credential for BGP peering). Valid characters: alphanumeric. Length: 32.RdeviceBgpCredentialName�
flow_snmp_credential_name (	B��A�2�Snmp Credential Name (flow_snmp_credential_name) - Optional Credential Name (Credential for Flow Snmp peering). Valid characters: alphanumeric. Length: 32.RflowSnmpCredentialName�
monitoring_template_id (BU�AR2PMonitoring template - The ID of the monitoring template assigned to this device.RmonitoringTemplateIdB
_minimize_snmp"�
Site
id (	B�A	2Site IDRid+
	site_name (	B�A2	Site nameRsiteName$
lat (B�A2Site latitudeRlat%
lon (B�A2Site longitudeRlon.

company_id (	B�A2
Company IDR	companyId"H
Plan
id (	B�A	2Plan IDRid"
name (	B�A2	Plan nameRname"�
Label
id (	B�A
2Label IDRid#
name (	B�A2
Label nameRname8
description (	B�A2Label descriptionRdescriptionK
edate (2.google.protobuf.TimestampB�A2Label end date (UTC)RedateP
cdate (2.google.protobuf.TimestampB�A2Label creation date (UTC)Rcdate%
user_id (	B�A	2User IDRuserId.

company_id (	B�A2
Company IDR	companyId&
color (	B�A2Label colorRcolor&
order	 (	B�A2Label orderRorder<
pivot_device_id
 (	B�A2Pivot device IDRpivotDeviceId9
pivot_label_id (	B�A2Pivot label IDRpivotLabelId"�
	InterfaceO
interface_description (	B�A2Interface descriptionRinterfaceDescriptionE
initial_snmp_speed (	B�A2Initial SNMP speedRinitialSnmpSpeed+
	device_id (	B�A2	Device IDRdeviceId.

snmp_speed (	B�A2
SNMP speedR	snmpSpeed.

snmp_alias (	B�A2
SNMP aliasR	snmpAlias%
snmp_id (	B�A	2SNMP IDRsnmpIdC
connectivity_type (	B�A2Connectivity typeRconnectivityType@
network_boundary (	B�A2Network boundaryRnetworkBoundary)
provider	 (	B�A
2ProviderRprovider"�
CustomColumnData+
	device_id (	B�A2	Device IDRdeviceId(
field_id (	B�A
2Field IDRfieldId+
col_name (	B�A2Column nameRcolName2
description (	B�A2DescriptionRdescription+
col_type (	B�A2Column typeRcolType1
device_type (	B�A2Device typeR
deviceType"H

GnmiV1Conf:
dialout_server (	B�A2Dialout serverRdialoutServer"�'
DeviceDetailed;
id (	B+�A$2"System generated unique identifier�ARid.

company_id (	B�A2
Company IDR	companyId1
device_name (	B�A2Device nameR
deviceName4
device_alias (	B�A2Device aliasRdeviceAlias1
device_type (	B�A2Device typeR
deviceTypeF
device_description (	B�A2Device descriptionRdeviceDescription?
site (2 .kentik.device.v202308beta1.SiteB	�A2SiteRsite?
plan (2 .kentik.device.v202308beta1.PlanB	�A2PlanRplanN
labels	 (2!.kentik.device.v202308beta1.LabelB�A2List of labelsRlabelse
all_interfaces
 (2%.kentik.device.v202308beta1.InterfaceB�A2List of interfacesRallInterfaces?
device_flow_type (	B�A2Device flow typeRdeviceFlowTypeE
device_sample_rate (	B�A2Device sample rateRdeviceSampleRate9
sending_ips (	B�A2List of sending IPsR
sendingIps9
device_snmp_ip (	B�A2Device SNMP IPRdeviceSnmpIpN
device_snmp_community (	B�A2Device SNMP communityRdeviceSnmpCommunity<
minimize_snmp (B�A2Minimize SNMPH RminimizeSnmp�<
device_bgp_type (	B�A2Device BGP typeRdeviceBgpTypeP
device_bgp_neighbor_ip (	B�A2Device BGP neighbor IPRdeviceBgpNeighborIpS
device_bgp_neighbor_ip6 (	B�A2Device BGP neighbor IP6RdeviceBgpNeighborIp6S
device_bgp_neighbor_asn (	B�A2Device BGP neighbor ASNRdeviceBgpNeighborAsnH
device_bgp_flowspec (B�A2Device BGP flowspecRdeviceBgpFlowspecH
device_bgp_password (	B�A2Device BGP passwordRdeviceBgpPasswordV
device_bgp_label_unicast (B�A2Device BGP label unicastRdeviceBgpLabelUnicastH
bgp_lookup_strategy (	B�A2BGP lookup strategyRbgpLookupStrategy7
device_status (	B�A2Device statusRdeviceStatusA
use_bgp_device_id (	B�A2Use BGP device IDRuseBgpDeviceId:
custom_columns (	B�A2Custom columnsRcustomColumnss
custom_column_data (2,.kentik.device.v202308beta1.CustomColumnDataB�A2Custom column dataRcustomColumnDataP
device_chf_client_port (	B�A2Device CHF client portRdeviceChfClientPort\
device_chf_client_protocol (	B�A2Device CHF client protocolRdeviceChfClientProtocolK
device_chf_interface (	B�A2Device CHF interfaceRdeviceChfInterfaceB
device_agent_type  (	B�A2Device agent typeRdeviceAgentType6
max_flow_rate! (B�A2Max flow rateRmaxFlowRateA
max_big_flow_rate" (B�A2Max big flow rateRmaxBigFlowRate?
device_proxy_bgp# (	B�A2Device proxy BGPRdeviceProxyBgpB
device_proxy_bgp6$ (	B�A2Device proxy BGP6RdeviceProxyBgp6\
created_date% (2.google.protobuf.TimestampB�A2Creation timestamp (UTC)RcreatedDatee
updated_date& (2.google.protobuf.TimestampB&�A#2!Last modification timestamp (UTC)RupdatedDateg
device_snmp_v3_conf_enabled' (B)�A&2$Device SNMP v3 configuration enabledRdeviceSnmpV3ConfEnabled~
device_snmp_v3_conf( (2,.kentik.device.v202308beta1.DeviceSnmpV3ConfB!�A2Device SNMP v3 configurationRdeviceSnmpV3Conf.
cdn_attr) (	B�A2CDN attributesRcdnAttr3
bgp_peer_ip4* (	B�A2BGP peer IP4R
bgpPeerIp43
bgp_peer_ip6+ (	B�A2BGP peer IP6R
bgpPeerIp6:
device_subtype, (	B�A2Device subtypeRdeviceSubtypeE
device_vendor_type- (	B�A2Device vendor typeRdeviceVendorTypeB
device_model_type. (	B�A2Device model typeRdeviceModelType<
cloud_export_id/ (	B�A2Cloud export IDRcloudExportId7
device_kproxy0 (	B�A2Device KProxyRdeviceKproxy4
snmp_enabled1 (	B�A2SNMP enabledRsnmpEnabledK
snmp_disabled_reason2 (	B�A2SNMP disabled reasonRsnmpDisabledReason\
snmp_disabled_reason_other3 (	B�A2SNMP disabled reason otherRsnmpDisabledReasonOtherH
bgp_disabled_reason4 (	B�A2BGP disabled reasonRbgpDisabledReasonY
bgp_disabled_reason_other5 (	B�A2BGP disabled reason otherRbgpDisabledReasonOtherI
device_manufacturer6 (	B�A2Device manufacturerRdeviceManufacturer4
device_alert7 (	B�A2Device alertRdeviceAlert
role8 (	B	�A2RoleRrolex
device_gnmi_v1_conf9 (2&.kentik.device.v202308beta1.GnmiV1ConfB!�A2Device GNMI v1 configurationRdeviceGnmiV1ConfA
use_asn_from_flow: (B�A2Use ASN from flowRuseAsnFromFlow7
max_interface; (B�A2Max interfaceRmaxInterfaceH
max_interface_check< (B�A2Max interface checkRmaxInterfaceChecku
nms= (2+.kentik.device.v202308beta1.DeviceNmsConfigB6�A321Configuration if this device is monitored by NMS.Rnms�
device_bgp_credential_name> (	B��A�2�BGP Credential Name (device_bgp_credential_name) - Optional Credential Name (Credential for BGP peering). Valid characters: alphanumeric. Length: 32.RdeviceBgpCredentialName�
flow_snmp_credential_name? (	B��A�2�Snmp Credential Name (flow_snmp_credential_name) - Optional Credential Name (Credential for Flow Snmp peering). Valid characters: alphanumeric. Length: 32.RflowSnmpCredentialName�
monitoring_template_id@ (BU�AR2PMonitoring template - The ID of the monitoring template assigned to this device.RmonitoringTemplateIdB
_minimize_snmp"-
LabelConcise
id (B�A
2Label IDRid"
ListDevicesRequest"�
ListDevicesResponsel
devices (2*.kentik.device.v202308beta1.DeviceDetailedB&�A#2!List of configurations of devicesRdevicese
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"G
GetDeviceRequest3
id (	B#�A2ID of the requested device�ARid"�
GetDeviceResponsen
device (2*.kentik.device.v202308beta1.DeviceDetailedB*�A'2%Configuration of the requested deviceRdevice"�
CreateDeviceRequestk
device (2).kentik.device.v202308beta1.DeviceConciseB(�A!2Configuration of the new device�ARdevice"�
CreateDeviceResponser
device (2*.kentik.device.v202308beta1.DeviceDetailedB.�A+2)Configuration of the newly created deviceRdevice"�
CreateDevicesRequest}
devices (2).kentik.device.v202308beta1.DeviceConciseB8�A12/List of configurations of devices to be created�ARdevices"�
CreateDevicesResponsez
devices (2*.kentik.device.v202308beta1.DeviceDetailedB4�A12/List of configurations of newly created devicesRdevices^
failed_devices (	B7�A422List of names of devices that failed to be createdRfailedDevices"�
UpdateDeviceRequest�
device (2).kentik.device.v202308beta1.DeviceConciseBB�A;29New configuration attributes for the device to be updated�ARdevice"�
UpdateDeviceResponsel
device (2*.kentik.device.v202308beta1.DeviceDetailedB(�A%2#Updated configuration of the deviceRdevice"�
UpdateDevicesRequest}
devices (2).kentik.device.v202308beta1.DeviceConciseB8�A12/List of configurations of devices to be updated�ARdevices"�
UpdateDevicesResponset
devices (2*.kentik.device.v202308beta1.DeviceDetailedB.�A+2)List of configurations of updated devicesRdevices\
failed_devices (	B5�A220List of IDs of devices that failed to be updatedRfailedDevices"�
UpdateDeviceLabelsRequest7
id (	B'�A 2ID of the device to be updated�ARids
labels (2(.kentik.device.v202308beta1.LabelConciseB1�A*2(List of labels to be added to the device�ARlabels"�
UpdateDeviceLabelsResponsel
device (2*.kentik.device.v202308beta1.DeviceDetailedB(�A%2#Updated configuration of the deviceRdevice"N
DeleteDeviceRequest7
id (	B'�A 2ID of the device to be deleted�ARid"
DeleteDeviceResponse"W
DeleteDevicesRequest?
ids (	B-�A&2$List of IDs of devices to be deleted�ARids"u
DeleteDevicesResponse\
failed_devices (	B5�A220List of IDs of devices that failed to be deletedRfailedDevices2�
DeviceService�
ListDevices..kentik.device.v202308beta1.ListDevicesRequest/.kentik.device.v202308beta1.ListDevicesResponse"��A~List all devices.\Returns list of configured devices (see [About Devices](https://kb.kentik.com/v4/Cb01.htm)).*ListDevices��admin.device:read���/device/v202308beta1/device�
	GetDevice,.kentik.device.v202308beta1.GetDeviceRequest-.kentik.device.v202308beta1.GetDeviceResponse"��A�#Retrieve configuration of a device.kReturns configuration of a device specified by ID (see [About Devices](https://kb.kentik.com/v4/Cb01.htm)).*	GetDevice��admin.device:read���" /device/v202308beta1/device/{id}�
CreateDevice/.kentik.device.v202308beta1.CreateDeviceRequest0.kentik.device.v202308beta1.CreateDeviceResponse"��A�Configure a new device.�Create configuration for a new device. Returns the newly created configuration (see [About Devices](https://kb.kentik.com/v4/Cb01.htm)).*CreateDevice��admin.device:write��� "/device/v202308beta1/device:*�
CreateDevices0.kentik.device.v202308beta1.CreateDevicesRequest1.kentik.device.v202308beta1.CreateDevicesResponse"��A�%Configure multiple devices (max 100).�Create configuration for multiple devices. Returns the newly created configurations (see [About Devices](https://kb.kentik.com/v4/Cb01.htm)).*CreateDevices��admin.device:write���&"!/device/v202308beta1/device/batch:*�
UpdateDevice/.kentik.device.v202308beta1.UpdateDeviceRequest0.kentik.device.v202308beta1.UpdateDeviceResponse"��A�"Updates configuration of a device.�Replaces configuration of a device with attributes in the request. Returns the updated configuration (see [About Devices](https://kb.kentik.com/v4/Cb01.htm)).*UpdateDevice��admin.device:write���,'/device/v202308beta1/device/{device.id}:*�
UpdateDevices0.kentik.device.v202308beta1.UpdateDevicesRequest1.kentik.device.v202308beta1.UpdateDevicesResponse"��A�4Updates configuration of multiple devices (max 100).�Replaces configuration of multiple devices with attributes in the request. Returns the updated configurations (see [About Devices](https://kb.kentik.com/v4/Cb01.htm)).*UpdateDevices��admin.device:write���&!/device/v202308beta1/device/batch:*�
UpdateDeviceLabels5.kentik.device.v202308beta1.UpdateDeviceLabelsRequest6.kentik.device.v202308beta1.UpdateDeviceLabelsResponse"��A�Updates labels of a device.�Removes all existing labels from the device and applies the device labels (see [About Device Labels](https://kb.kentik.com/v4/Cb16.htm)) specified by id. Returns the updated configuration.*UpdateDeviceLabels��admin.device:write���,'/device/v202308beta1/device/{id}/labels:*�
DeleteDevice/.kentik.device.v202308beta1.DeleteDeviceRequest0.kentik.device.v202308beta1.DeleteDeviceResponse"��A�!Delete configuration of a device.lDeletes configuration of a device with specific ID (see [About Devices](https://kb.kentik.com/v4/Cb01.htm)).*DeleteDevice��admin.device:write���"* /device/v202308beta1/device/{id}�
DeleteDevices0.kentik.device.v202308beta1.DeleteDevicesRequest1.kentik.device.v202308beta1.DeleteDevicesResponse"��A�)Delete configuration of multiple devices.uDeletes configuration of multiple devices with specific IDs (see [About Devices](https://kb.kentik.com/v4/Cb01.htm)).*DeleteDevices��admin.device:write���&"!/device/v202308beta1/device/batch:**�Agrpc.api.kentik.com��admin.device��B�ZLgithub.com/kentik/api-schema-public/gen/go/kentik/device/v202308beta1;device�A��

Device APIR# Overview
The Device API provides programmatic access to configuration of devices"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202308beta1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ��
  �

  

 #

 c
	
 c
	
  &
	
 !
	
 )
	
 )
	
	 (
	

 8
	
 /
	
 ;

� ;
`
 A [ {{.Name}}
2G Devices CRUD
 -------------------------------------------------------



 A

  BF

  B

  B	

  B

  BF

  �CE

 GK

 G

 G	 

 G#$

 G%K

 �HJ

 LP

 L

 L	"

 L%&

 L'P

 �MO

 QU

 Q

 Q	

 Q

 QU

 �RT

 VZ

 V

 V	

 V

 V Z

 �WY

^ s {{.Name}}



^

 _c

 _

 _	

 _

 _c

 �`b

dh

d

d	

d

dh

�eg

im

i

i

i

im

�jl

nr

n

n

n

nr

�oq

v � {{.Name}}



v

 w{

 w

 w	

 w

 w{

 �xz

|�

|

|	

|

|�

�}

��

�

�"

�%&

�'�

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�"

�%&

�'�

���

��

�

�

�

��

���

� � {{.Name}}


�

 �� id


 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

� �

���

��

�


�

�

� !

�"�

���

��

�

�	

�

� �

���

��

�

�	

�

��

���

��

�

�	

�

��

���

	��

	�


	�

	�

	� "

	�#�

	���


��


�


�	


�


��


���

��

�

�	

�!#

�$�

���

��

�

�&

�)+

�,�

���

��

�

�	

�

��

���

��

�

�	

�"$

�%�

���

��

�

�	 

�#%

�&�

���

��

�

�	 

�#%

�&�

���

��

�

�	

�!

�"�

���

��

�

�	

�

� �

���

��

�

�

�

� �

���

��

�

�

�

��

���

��

�

�	#

�&(

�)�

���

��

�

�	"

�%'

�(�

���

��

�

�	

�"$

�%�

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�!

�$%

�&�

���

��

�

�!

�$%

�&�

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

	��

	�

	�	

	�

	��

	���


��


�


�	


�


��


���

� � {{.Name}}


�

 ��

 �

 �	

 �!"

 �#�

 ���

��

�

�	

�

� �

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

	� � {{.Name}}


	�

	 ��

	 �

	 �	

	 �

	 ��

	 ���

	��

	�

	�	

	�

	��

	���

	��

	�

	�	

	�

	��

	���

	��

	�

	�	

	�

	��

	���

	��

	�

	�	

	�

	��

	���

	��

	�

	�	

	�

	��

	���


� � {{.Name}}



�


 ��


 �


 �	


 �


 ��


 ���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

� �

���

��

�

�

�

��

���

��

�

�

�

��

���

��

�


�

�

�

��

���

	��

	�


	�

	�#

	�&(

	�)�

	���


��


�


�	


�


��


���

��

�

�	

� 

�!�

���

��

�


�

�

� "

�#�

���

��

�

�	

�

��

���
s
��c Keeping these tokens so we can give the user a useful error.  They are removed from DeviceRequest


�

�	

�!#

�$�

���

��

�


�

�

� "

�#�

���

��

�

�	

�

��

���

��

�

�	

�"$

�%�

���

��

�

�	 

�#%

�&�

���

��

�

�	 

�#%

�&�

���

��

�

�

�

� �

���
s
��c Keeping these tokens so we can give the user a useful error.  They are removed from DeviceRequest


�

�	

�!

�"�

���

��

�

�

�"$

�%�

���

��

�

�	

�!

�"�

���

��

�

�	

�

��

���

��

�

�	

�

� �

���

��

�

�	

�

��

���

��

�


�

�.

�13

�4�

���

��

�

�	

�"$

�%�

���

��

�

�	#

�&(

�)�

���

��

�

�	

� "

�#�

���

��

�

�	

�

� �

���

 ��

 �

 �	

 �

 ��

 ���

!��

!�

!�	

!�

!� �

!���

"��

"�

"�	

"�

"��

"���

#��

#�

#�	

#�

#� �

#���

$��

$�

$�(

$�+-

$�.�

$���

%��

%�

%�(

%�+-

%�.�

%���

&��

&�

&�"

&�%'

&�(�

&���
s
'��c Keeping these tokens so we can give the user a useful error.  They are removed from DeviceRequest


'�

'�&

'�)+

'�,�

'���

(��

(�

(�	

(�

(��

(���

)��

)�

)�	

)�

)��

)���

*��

*�

*�	

*�

*��

*���

+��

+�

+�	

+�

+��

+���

,��

,�

,�	

,� 

,�!�

,���

-��

-�

-�	

-�

-� �

-���

.��

.�

.�	

.�

.��

.���

/��

/�

/�	

/�

/��

/���

0��

0�

0�	

0�

0��

0���

1��

1�

1�	

1� "

1�#�

1���

2��

2�

2�	#

2�&(

2�)�

2���

3��

3�

3�	

3�!

3�"�

3���

4��

4�

4�	"

4�%'

4�(�

4���

5��

5�

5�	

5�!

5�"�

5���

6��

6�

6�	

6�

6��

6���

7��

7�

7�	

7�

7��

7���

8��

8�

8� 

8�#%

8�&�

8���

9��

9�

9�

9�

9��

9���

:��

:�

:�	

:�

:��

:���

;��

;�

;�	

;�!

;�"�

;���

<��

<�

<�

<�

<��

<���

=��

=�

=�	#

=�&(

=�)�

=���

>��

>�

>�	"

>�%'

>�(�

>���

?��

?�

?�	

?�"$

?�%�

?���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

�  {{.Name}}


�

� � {{.Name}}


�

 ��

 �


 �

 �!

 �$%

 �&�

 ���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

 � �*

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

 � �*

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �


 �

 � 

 �#$

 �%�

 ���

 � �*

� � {{.Name}}


�

 ��

 �


 �

 �!

 �$%

 �&�

 ���

��

�


�

� 

�#$

�%�

���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

 � �*

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �


 �

 � 

 �#$

 �%�

 ���

 � �*

� � {{.Name}}


�

 ��

 �


 �

 �!

 �$%

 �&�

 ���

��

�


�

� 

�#$

�%�

���

� � {{.Name}}


�!

 ��

 �

 �	

 �

 ��

 ���

 � �*

��

�


�

�

�!"

�#�

���

� �*

� � {{.Name}}


�"

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

 � �*

�  {{.Name}}


�

� � {{.Name}}


�

 ��

 �


 �

 �

 �

 ��

 ���

 � �*

� � {{.Name}}


�

 ��

 �


 �

 � 

 �#$

 �%�

 ���
Z
 � �2L services and RPCs
 -------------------------------------------------------


 �

 �;

 ��;

 �F

 �+�F

 �>

 �*�>
!
  ��2 --- Devices ---


  �

  �$

  �/B

  �D

  �*�D

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 � 

 �+<

 �D

 �*�D

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �&

 �1E

 �E

 �*�E

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �E

 �*�E

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �&

 �1E

 �E

 �*�E

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �E

 �*�E

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �2

 �=W

 �E

 �*�E

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �&

 �1E

 �E

 �*�E

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �E

 �*�E

 ��

	 �ʼ"��

 ��

 ���bproto3��  
�m
,kentik/flow_tag/v202404alpha1/flow_tag.protokentik.flow_tag.v202404alpha1google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"E
Model<
type (2(.kentik.flow_tag.v202404alpha1.ModelTypeRtype"�

OrderField@
field (2*.kentik.flow_tag.v202404alpha1.LookupFieldRfieldK
	direction (2-.kentik.flow_tag.v202404alpha1.OrderDirectionR	direction"�
FlowTagSearch
limit (Rlimit
offset (RoffsetO
lookup_fields (2*.kentik.flow_tag.v202404alpha1.LookupFieldRlookupFields#
lookup_values (	RlookupValuesD
order_by (2).kentik.flow_tag.v202404alpha1.OrderFieldRorderBy
field_limit (R
fieldLimit"L
AddressInfo
	addresses (	R	addresses
total_count (R
totalCount"�
FlowTagJ
id (	B:�A321Unique system assigned identifier of the flow tag�ARidZ
name (	BF�A?2=This will appear in places where selecting a tag is necessary�ARnameC
	edited_by (	B&�A2User who last edited this tag�AReditedByA

created_by (	B"�A2User who created this tag�AR	createdByb
cdate (2.google.protobuf.TimestampB0�A)2'Date and time when this tag was created�ARcdateg
edate (2.google.protobuf.TimestampB5�A.2,Date and time when this tag was last updated�ARedateh
ip (2*.kentik.flow_tag.v202404alpha1.AddressInfoB,�A)2'IP address associated with the flow tagRipA
port (	B-�A*2(Port number associated with the flow tagRportH
	tcp_flags	 (B+�A(2&TCP flags associated with the flow tagRtcpFlagsN
protocol
 (B2�A/2-Protocol numbers associated with the flow tagRprotocolU
device_name (	B4�A12/Name of the device associated with the flow tagR
deviceNameU
device_type (	B4�A12/Type of the device associated with the flow tagR
deviceTypeV
site (	BB�A?2=Site where the device associated with the flow tag is locatedRsite^
interface_name (	B7�A422Name of the interface associated with the flow tagRinterfaceNameR
asn (	B@�A=2;Autonomous System Number (ASN) associated with the flow tagRasnw
lasthop_as_name (	BO�AL2JName of the last hop's Autonomous System (AS) associated with the flow tagRlasthopAsNameq
nexthop_asn (	BP�AM2KAutonomous System Number (ASN) of the next hop associated with the flow tagR
nexthopAsnw
nexthop_as_name (	BO�AL2JName of the next hop's Autonomous System (AS) associated with the flow tagRnexthopAsNameD
nexthop (	B*�A'2%Next hop associated with the flow tagRnexthopL

bgp_aspath (	B-�A*2(BGP AS path associated with the flow tagR	bgpAspathT
bgp_community (	B/�A,2*BGP community associated with the flow tagRbgpCommunityk
mac (2*.kentik.flow_tag.v202404alpha1.AddressInfoB-�A*2(MAC address associated with the flow tagRmacC
country (	B)�A&2$Country associated with the flow tagRcountry=
vlans (	B'�A$2"VLANs associated with the flow tagRvlans"#
GetFlowTagRequest
id (	Rid"W
GetFlowTagResponseA
flow_tag (2&.kentik.flow_tag.v202404alpha1.FlowTagRflowTag"\
SearchFlowTagRequestD
search (2,.kentik.flow_tag.v202404alpha1.FlowTagSearchRsearch"�
SearchFlowTagResponseC
	flow_tags (2&.kentik.flow_tag.v202404alpha1.FlowTagRflowTags
total_count (R
totalCount#
invalid_count (RinvalidCount"Y
CreateFlowTagRequestA
flow_tag (2&.kentik.flow_tag.v202404alpha1.FlowTagRflowTag"Z
CreateFlowTagResponseA
flow_tag (2&.kentik.flow_tag.v202404alpha1.FlowTagRflowTag"Y
UpdateFlowTagRequestA
flow_tag (2&.kentik.flow_tag.v202404alpha1.FlowTagRflowTag"Z
UpdateFlowTagResponseA
flow_tag (2&.kentik.flow_tag.v202404alpha1.FlowTagRflowTag"&
DeleteFlowTagRequest
id (	Rid"
DeleteFlowTagResponse*t
	ModelType
MODEL_TYPE_UNSPECIFIED 
MODEL_TYPE_POPULATORS
MODEL_TYPE_TAGS
MODEL_TYPE_IP_ADDRESSES*C
LookupField
LOOKUP_FIELD_UNSPECIFIED 
LOOKUP_FIELD_VALUE*d
OrderDirection
ORDER_DIRECTION_UNSPECIFIED 
ORDER_DIRECTION_ASC
ORDER_DIRECTION_DESC2�
FlowTagService�

GetFlowTag0.kentik.flow_tag.v202404alpha1.GetFlowTagRequest1.kentik.flow_tag.v202404alpha1.GetFlowTagResponse"��A_Get flow tag configuration.4Returns configuration of flow tag with specified ID.*
GetFlowTag��admin.flow_tag:read���" /flow_tag/v202404alpha1/tag/{id}�
SearchFlowTag3.kentik.flow_tag.v202404alpha1.SearchFlowTagRequest4.kentik.flow_tag.v202404alpha1.SearchFlowTagResponse"��AjSearch flow tag configuration.9Returns configuration of flow tag with search parameters.*SearchFlowTag��admin.flow_tag:read���/flow_tag/v202404alpha1/tag�
CreateFlowTag3.kentik.flow_tag.v202404alpha1.CreateFlowTagRequest4.kentik.flow_tag.v202404alpha1.CreateFlowTagResponse"��AQCreate flow tag configuration. Create a flow tag configuration.*CreateFlowTag��admin.flow_tag:write��� "/flow_tag/v202404alpha1/tag:*�
UpdateFlowTag3.kentik.flow_tag.v202404alpha1.UpdateFlowTagRequest4.kentik.flow_tag.v202404alpha1.UpdateFlowTagResponse"��AQUpdate flow tag configuration. Update a flow tag configuration.*UpdateFlowTag��admin.flow_tag:write���.)/flow_tag/v202404alpha1/tag/{flow_tag.id}:*�
DeleteFlowTag3.kentik.flow_tag.v202404alpha1.DeleteFlowTagRequest4.kentik.flow_tag.v202404alpha1.DeleteFlowTagResponse"��AYDelete flow tag configuration.(Delete a flow tag configuration with id.*DeleteFlowTag��admin.flow_tag:write���"* /flow_tag/v202404alpha1/tag/{id},�Agrpc.api.kentik.com��admin.flow_tag��B�ZQgithub.com/kentik/api-schema-public/gen/go/kentik/flow_tag/v202404alpha1;flow_tag�A��

Flow Tag API�	# Overview
The Flow Tag API enables programmatic creation and management of flow tags. * In addition to tag name, at least one other field must be specified to create a tag.
 * All specified tag fields are ANDed for evaluation.
 * Except for Tag Name, any field may contain multiple comma-separated values, which will be ORed for evaluation.
 * A tag will be applied to a flow only when all of the fields specified for that tag are matched. Source and Destination flows are each evaluated independently for matches.
 * Source and Destination flows are each evaluated independently for matches.
 * A match results in the addition of the tag name to a delimited list of tags in the src_flow_tags and/or dst_flow_tags column of each specified devices KDE main table.
 * Tags in a KDE table can be searched as part of a query. Tag searches are substring-based. Query results vary depending on how tags are named; [see Queries Using Tags](https://kb.kentik.com/v0/Eb02.htm#Eb02-Queries_Using_Tags).
 * Additional information on the values of individual fields may be found in [Tag Field Definitions](https://kb.kentik.com/v4/Cb04.htm#Cb04-Tag_Field_Definitions) in the Kentik Knowledge Base.

"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202404alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�4
  �

  

 &

 h
	
 h
	
  &
	
 !
	
 )
	
 )
	
	 8
	

 /
	
 C

� C

 F P {{.Name}}



 F

  H Invalid value


  H

  H

 J
 Not used


 J

 J
$
 L Default flow tag type


 L

 L

 N
 Not used


 N

 N

S X {{.Name}}



S

 U Invalid value


 U

 U
$
W Lookup by name of tag


W

W

[ b {{.Name}}



[

 ]" Invalid value


 ]

 ] !
#
_ Ascending sort order


_

_
$
a Descending sort order


a

a

 e h {{.Name}}



 e
+
  g type of model (default Tags)


  g

  g

  g

k p {{.Name}}



k

 m Sort by field


 m

 m

 m
 
o Sort by direction


o

o

o

s � {{.Name}}



s
0
 u# Limit the number of rows to fetch


 u

 u

 u
7
w* The number rows to skip before returning


w

w

w
$
y) List of lookup fields


y


y

y$

y'(
$
{$ List of lookup values


{


{

{

{"#

}# Sort order


}


}

}

}!"
E
8 Limit the number of record to return for nested fields








� � {{.Name}}


�
3
 � % List of returning mac or ip address


 �


 �

 �

 �
3
�% Total number of addresses available


�

�

�

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�!

�$%

�&�

� �-

���

��

�

�!

�$%

�&�

� �-

���

��

�

�

�

��

���

��

�


�

�

�

��

���

��

�

�	

�

��

���

	��

	�


	�

	�

	�

	� �

	���


��


�



�


�


� "


�#�


���

��

�


�

�

� "

�#�

���

��

�


�

�

�

��

���

��

�


�

� 

�#%

�&�

���

��

�


�

�

�

��

���

��

�


�

�!

�$&

�'�

���

��

�


�

�

� "

�#�

���

��

�


�

�!

�$&

�'�

���

��

�


�

�

�

��

���

��

�


�

�

�!

�"�

���

��

�


�

�

�"$

�%�

���

��

�

�

�

��

���

��

�


�

�

�

��

���

��

�


�

�

�

��

���

� � {{.Name}}


�

 �

 �

 �	

 �

� � {{.Name}}


�

 �

 �	

 �


 �

� � {{.Name}}


�

 �

 �

 �

 �

� � {{.Name}}


�

 �!

 �


 �

 �

 � 

�

�

�	

�

�

�

�	

�

	� � {{.Name}}


	�

	 �

	 �	

	 �


	 �


� � {{.Name}}



�


 �


 �	


 �



 �

� � {{.Name}}


�

 �

 �	

 �


 �

� � {{.Name}}


�

 �

 �	

 �


 �

� � {{.Name}}


�

 �

 �

 �	

 �

�   {{.Name}}


�
Z
 � �2L services and RPCs
 -------------------------------------------------------


 �

 �;

 ��;

 �F

 �+�F

 �@

 �*�@

  ��

  �

  �"

  �-?

  �F

  �*�F

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �(

 �3H

 �F

 �*�F

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �G

 �*�G

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �G

 �*�G

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �G

 �*�G

 ��

	 �ʼ"��

 ��

 ���bproto3��  
��
.kentik/interface/v202108alpha1/interface.protokentik.interface.v202108alpha1google/api/annotations.protogoogle/api/client.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.protogoogle/protobuf/timestamp.proto"�
	Interface
id (	Rid
	device_id (	RdeviceId
snmp_id (	RsnmpId

snmp_speed (R	snmpSpeed
	snmp_type (RsnmpType

snmp_alias (	R	snmpAlias!
interface_ip (	RinterfaceIp3
interface_description (	RinterfaceDescription0
cdate	 (2.google.protobuf.TimestampRcdate0
edate
 (2.google.protobuf.TimestampRedate0
interface_ip_netmask (	RinterfaceIpNetmask]
connectivity_type (20.kentik.interface.v202108alpha1.ConnectivityTypeRconnectivityTypeZ
network_boundary (2/.kentik.interface.v202108alpha1.NetworkBoundaryRnetworkBoundary(
top_nexthop_asns (RtopNexthopAsns
provider (	Rprovider"�
InterfaceClassification

classified (R
classified]
connectivity_type (20.kentik.interface.v202108alpha1.ConnectivityTypeRconnectivityTypeZ
network_boundary (2/.kentik.interface.v202108alpha1.NetworkBoundaryRnetworkBoundary"�
ClassifyCounter
count (Rcount%
external_count (RexternalCount$
free_pni_count (RfreePniCount
ix_count (RixCount%
provider_count (RproviderCount#
transit_count (RtransitCount"�	
InterfaceClassifyInfo
	device_id (	RdeviceId
snmp_id (	RsnmpId

snmp_alias (	R	snmpAlias!
interface_ip (	RinterfaceIp(
interface_ip_asn (	RinterfaceIpAsn$
is_internal_ip (RisInternalIp&
is_internal_asn (RisInternalAsn(
top_nexthop_asns (	RtopNexthopAsns&
pdb_global_name	 (	RpdbGlobalNameh
auto_classification
 (27.kentik.interface.v202108alpha1.InterfaceClassificationRautoClassificationp
previous_classification (27.kentik.interface.v202108alpha1.InterfaceClassificationRpreviousClassification
provider (	Rprovider>
network_boundary_confidence (RnetworkBoundaryConfidence@
connectivity_type_confidence (RconnectivityTypeConfidence/
provider_confidence (RproviderConfidence8
auto_classified_provider (RautoClassifiedProviderD
previously_classified_provider (	RpreviouslyClassifiedProviderD
previously_classified_external (RpreviouslyClassifiedExternal$
ip_asn_matched (RipAsnMatched

ix_matched (R	ixMatched'
nexthop_matched (RnexthopMatched:
connectivity_type_matched (RconnectivityTypeMatched)
provider_matched (RproviderMatched5
changed_classification (RchangedClassification"�
DeviceClassifyInfo
	device_id (	RdeviceId)
total_interfaces (RtotalInterfacess
previously_classified_counter (2/.kentik.interface.v202108alpha1.ClassifyCounterRpreviouslyClassifiedCounterg
auto_classified_counter (2/.kentik.interface.v202108alpha1.ClassifyCounterRautoClassifiedCounter@
changed_classification_count (RchangedClassificationCount/
ip_asn_matched_count (RipAsnMatchedCount(
ix_matched_count (RixMatchedCount2
nexthop_matched_count (RnexthopMatchedCountE
connectivity_type_matched_count (RconnectivityTypeMatchedCount4
provider_matched_count (RproviderMatchedCountU

interfaces (25.kentik.interface.v202108alpha1.InterfaceClassifyInfoR
interfaces"�
InterfaceFilter
text (	Rtext

device_ids (	R	deviceIds_
connectivity_types (20.kentik.interface.v202108alpha1.ConnectivityTypeRconnectivityTypes^
network_boundaries (2/.kentik.interface.v202108alpha1.NetworkBoundaryRnetworkBoundaries
	providers (	R	providers
snmp_speeds (R
snmpSpeedsC
ip_types (2(.kentik.interface.v202108alpha1.IpFilterRipTypes"
AutoClassifyRequest"�
AutoClassifyResponse0
perc_auto_classified (RpercAutoClassified.
net_changed_transit (RnetChangedTransit$
net_changed_ix (RnetChangedIx0
net_changed_provider (RnetChangedProviderK
"total_changed_classification_count (RtotalChangedClassificationCount9
total_auto_classify_count (RtotalAutoClassifyCountn
total_auto_classify_counter (2/.kentik.interface.v202108alpha1.ClassifyCounterRtotalAutoClassifyCountere
total_previous_counter (2/.kentik.interface.v202108alpha1.ClassifyCounterRtotalPreviousCounter)
total_interfaces (RtotalInterfacesL
devices (22.kentik.interface.v202108alpha1.DeviceClassifyInfoRdevices"�
ManualClassifyRequest#
interface_ids (	RinterfaceIds]
connectivity_type (20.kentik.interface.v202108alpha1.ConnectivityTypeRconnectivityTypeZ
network_boundary (2/.kentik.interface.v202108alpha1.NetworkBoundaryRnetworkBoundary
provider (	Rprovider"7
ManualClassifyResponse

device_ids (	R	deviceIds"a
ListInterfaceRequestI
filters (2/.kentik.interface.v202108alpha1.InterfaceFilterRfilters"�
ListInterfaceResponseI

interfaces (2).kentik.interface.v202108alpha1.InterfaceR
interfaces
total_count (R
totalCount#
invalid_count (RinvalidCount"%
GetInterfaceRequest
id (	Rid"_
GetInterfaceResponseG
	interface (2).kentik.interface.v202108alpha1.InterfaceR	interface"a
CreateInterfaceRequestG
	interface (2).kentik.interface.v202108alpha1.InterfaceR	interface"b
CreateInterfaceResponseG
	interface (2).kentik.interface.v202108alpha1.InterfaceR	interface"a
UpdateInterfaceRequestG
	interface (2).kentik.interface.v202108alpha1.InterfaceR	interface"b
UpdateInterfaceResponseG
	interface (2).kentik.interface.v202108alpha1.InterfaceR	interface"(
DeleteInterfaceRequest
id (	Rid"
DeleteInterfaceResponse"�
MatchW
match_attribute (2..kentik.interface.v202108alpha1.MatchAttributeRmatchAttributeO
match_operator (2(.kentik.interface.v202108alpha1.OperatorRmatchOperator
pattern (	Rpattern"�
Actiond
set_connectivity_type (20.kentik.interface.v202108alpha1.ConnectivityTypeRsetConnectivityTypea
set_network_boundary (2/.kentik.interface.v202108alpha1.NetworkBoundaryRsetNetworkBoundary,
set_connected_asns (	RsetConnectedAsns!
set_provider (	RsetProvider"�
DeviceFilter
all_devices (R
allDevices
device_name (	R
deviceName#
device_labels (	RdeviceLabels!
device_rules (	RdeviceRules!
device_types (	RdeviceTypes"�
Rule
id (	Rid
enabled (Renabled
rank (RrankH
match_clause (2%.kentik.interface.v202108alpha1.MatchRmatchClauseE

action_set (2&.kentik.interface.v202108alpha1.ActionR	actionSet0
cdate (2.google.protobuf.TimestampRcdate0
edate (2.google.protobuf.TimestampRedateW
included_devices (2,.kentik.interface.v202108alpha1.DeviceFilterRincludedDevicesW
excluded_devices	 (2,.kentik.interface.v202108alpha1.DeviceFilterRexcludedDevices*�
ConnectivityType!
CONNECTIVITY_TYPE_UNSPECIFIED .
*CONNECTIVITY_TYPE_AGGREGATION_INTERCONNECT
CONNECTIVITY_TYPE_AVAILABLE
CONNECTIVITY_TYPE_BACKBONE(
$CONNECTIVITY_TYPE_CLOUD_INTERCONNECT
CONNECTIVITY_TYPE_CUSTOMER'
#CONNECTIVITY_TYPE_DATACENTER_FABRIC-
)CONNECTIVITY_TYPE_DATACENTER_INTERCONNECT$
 CONNECTIVITY_TYPE_EMBEDDED_CACHE
CONNECTIVITY_TYPE_FREE_PNI	
CONNECTIVITY_TYPE_HOST

CONNECTIVITY_TYPE_IX
CONNECTIVITY_TYPE_OTHER
CONNECTIVITY_TYPE_PAID_PNI
CONNECTIVITY_TYPE_RESERVED
CONNECTIVITY_TYPE_TRANSIT+
'CONNECTIVITY_TYPE_VIRTUAL_CROSS_CONNECT&
"CONNECTIVITY_TYPE_IPX_INTERCONNECT&
"CONNECTIVITY_TYPE_SIP_INTERCONNECT*�
NetworkBoundary 
NETWORK_BOUNDARY_UNSPECIFIED 
NETWORK_BOUNDARY_AUTO
NETWORK_BOUNDARY_INTERNAL
NETWORK_BOUNDARY_EXTERNAL
NETWORK_BOUNDARY_NONE*g
IpFilter
IP_FILTER_UNSPECIFIED 
IP_FILTER_PRIVATE
IP_FILTER_PUBLIC
IP_FILTER_UNSET*�
MatchAttribute
MATCH_ATTRIBUTE_UNSPECIFIED )
%MATCH_ATTRIBUTE_INTERFACE_DESCRIPTION
MATCH_ATTRIBUTE_SNMP_ALIAS 
MATCH_ATTRIBUTE_INTERFACE_IP*�
Operator
OPERATOR_UNSPECIFIED 
OPERATOR_EQUALS
OPERATOR_CONTAINS
OPERATOR_REGEX 
OPERATOR_CONTAINED_IN_SUBNET
OPERATOR_IS_PUBLIC_IP
OPERATOR_IS_PRIVATE_IP
OPERATOR_NO_IP2�
InterfaceService�
ManualClassify5.kentik.interface.v202108alpha1.ManualClassifyRequest6.kentik.interface.v202108alpha1.ManualClassifyResponse"��AVManual Classify Interface)Manually set interface(s) classification.*ManualClassify��admin.interface:write���-"(/interface/v202108alpha1/manual_classify:*�
ListInterface4.kentik.interface.v202108alpha1.ListInterfaceRequest5.kentik.interface.v202108alpha1.ListInterfaceResponse"��A[Fetch Search Interfaces1Return list of interfaces matches search critera.*ListInterface��admin.interface:read���%#/interface/v202108alpha1/interfaces�
GetInterface3.kentik.interface.v202108alpha1.GetInterfaceRequest4.kentik.interface.v202108alpha1.GetInterfaceResponse"��AZGet a interface.8Returns information about a interface specified with ID.*InterfaceGet��admin.interface:read���*(/interface/v202108alpha1/interfaces/{id}�
CreateInterface6.kentik.interface.v202108alpha1.CreateInterfaceRequest7.kentik.interface.v202108alpha1.CreateInterfaceResponse"��AYCreate a interface.1Create a interface from request. returns created.*InterfaceCreate��admin.interface:write���("#/interface/v202108alpha1/interfaces:*�
UpdateInterface6.kentik.interface.v202108alpha1.UpdateInterfaceRequest7.kentik.interface.v202108alpha1.UpdateInterfaceResponse"��AcUpdate a interface.;Replaces the entire interface attributes specified with id.*InterfaceUpdate��admin.interface:write���72/interface/v202108alpha1/interfaces/{interface.id}:*�
DeleteInterface6.kentik.interface.v202108alpha1.DeleteInterfaceRequest7.kentik.interface.v202108alpha1.DeleteInterfaceResponse"��APDelete a interface.(Deletes the interface specified with id.*InterfaceDelete��admin.interface:write���**(/interface/v202108alpha1/interfaces/{id}-�Agrpc.api.kentik.com��admin.interface��B�ZOgithub.com/kentik/api-schema-public/gen/go/kentik/interface/v202108alpha1;iface�A�7
Interface API"
Kentik API Engineering2202108alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ�d
  �

  

 '

 f
	
 f
	
  &
	
 !
	
 8
	
 /
	
	 )
	
 6

� 6


 8 L


 8

  9$

  9

  9"#

 :1

 :,

 :/0

 ;"

 ;

 ; !

 <!

 <

 < 

 =+

 =&

 =)*

 >!

 >

 > 

 ?*

 ?%

 ?()

 @0

 @+

 @./

 A'

 A"

 A%&

 	B!

 	B

 	B 

 
C

 
C

 
C

 D

 D

 D

 E

 E

 E

 F"

 F

 F!

 G"

 G

 G!

 H!

 H

 H 

 I/

 I)

 I,.

 J*

 J$

 J')

 K*

 K$

 K')


N T


N

 O#

 O

 O!"

P

P

P

Q 

Q

Q

R 

R

R

S

S

S


 W v


 W

  Y ID of interface.


  Y

  Y	

  Y
0
 [# ID of device with this interface.


 [

 [	

 [

 ]
 SNMP ID.


 ]

 ]	

 ]
%
 _ Network speed in Mbps.


 _

 _

 _

 a Snmp Type.


 a

 a

 a

 c Interface alias.


 c

 c	

 c

 e IP of interface.


 e

 e	

 e
8
 g#+ Readable string description of interface.


 g

 g	

 g!"
 
 i& Create timestamp.


 i

 i!

 i$%
 
 	k' Update Timestamp.


 	k

 	k!

 	k$&

 
m# Subnet mask.


 
m

 
m	

 
m "
1
 o*$ Type of network connectivity type.


 o

 o$

 o')
(
 q( Type of network boundary.


 q

 q"

 q%'

 s' Top asn hops.


 s


 s

 s!

 s$&
 
 u Network provider.


 u

 u	

 u


y }


y

 z

 z

 z

 z

{)

{

{$

{'(

|'

|

|"

|%&

 �




 �

 �

 �

 �

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

� �

�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�

�

�

�

�

�

�'

�


�

�"

�%&

�

�

�	

�
&
	�3 current classification


	�

	�-

	�02
'

�7 previous classification



�


�1


�46

�

�

�	

�

�)

�

�#

�&(

�*

�

�$

�')

�!

�

�

� 

�%

�

�

�"$

�-

�

�	'

�*,

�+

�

�%

�(*

�

�

�

�

�

�

�

�

�

�

�

�

�&

�

� 

�#%

�

�

�

�

�#

�

�

� "

� �

�

 � ID of device.


 �

 �	

 �
;
�- Total number of interfaces for this device.


�

�

�
.
�4  previously_classified_ counts.


�

�/

�23
(
�. auto_classified_ counts.


�

�)

�,-

�*

�

�$

�')

�"

�

�

�!

�

�

�

�

�#

�

�

� "

�-

�

�'

�*,

	�$

	�

	�

	�!#
#

�1 List of interfaces.



�



� 


�!+


�.0

� �

�

 �

 �

 �

�

�

�

�

�

�

�

�

�
k
� �] Supports multiple search criteria. Fields are combined to AND statements to perform search.


�
E
 �7 Search text match in interface description and alias.


 �

 �	

 �
$
�! Search by device ID.


�


�

�

� 
9
�3+ Search by type of interface connectivity.


�


�

�.

�12
3
�2% Search by type of network boundary.


�


�

�-

�01
"
�  Search by provider


�


�

�

�
"
�! SNMP speed in Mbps


�


�

�

� 
%
�! Search by ip address.


�


�

�

� 
.
� �"  uses company_id from auth user


�

� �

�
C
 �"5 Percent of all interfaces taht are auto calssified.


 �

 �	

 � !

� 

�

�

�

�

�

�

�

�!

�

�

� 

�/

�

�*

�-.

�&

�

�!

�$%
,
�2 total_auto_classify_ counts.


�

�-

�01
'
�- total_previous_ counts.


�

�(

�+,
+
� Total number of interfaces.


�

�

�
 
	�+ List of devices.


	�


	�

	�%

	�(*
a
� �S Set connection type, network boundary, and provider of interface id(s) specified.


�
4
 �$& Interface ids to set the properties.


 �


 �

 �

 �"#
%
�) Connection type enum.


�

�$

�'(
&
�' Network boundary enum.


�

�"

�%&
!
� Network provider.


�

�	

�

	� �

	�

	 �!

	 �


	 �

	 �

	 � 


� �


�


 �


 �


 �


 �

� �

�

 �$

 �


 �

 �

 �"#

�

�

�

�

�

�

�

�

� �

�
 
 � ID of interface.


 �

 �	

 �

� �

�

 �

 �

 �

 �

� �

�

 �

 �

 �

 �

� �

�

 �

 �

 �

 �

� �

�

 �

 �

 �

 �

� �

�

 �

 �

 �

 �

� �

�
 
 � ID of interface.


 �

 �	

 �


� "

�

 � �

 �

 �;

 ��;

 �F

 �+�F

 �A

 �*�A
�
  ��2� Comment out for now until we need auto classification.
 rpc AutoClassify(AutoClassifyRequest) returns (AutoClassifyResponse) {
   option (kentik.core.v202303.method_scope) = "admin.interface:write";
   option (google.api.http) = {
     get: "/interface/v202108alpha1/auto_classify"
   };
   option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_operation) = {
     operation_id: "AutoClassify"
     summary: "Auto Classify Interface"
     description: "Classify devices and interface base on rules."
   };
 }


  �

  �*

  �5K

  �H

  �*�H

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �(

 �3H

 �G

 �*�G

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �&

 �1E

 �G

 �*�G

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �,

 �7N

 �H

 �*�H

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �,

 �7N

 �H

 �*�H

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �,

 �7N

 �H

 �*�H

 ��

	 �ʼ"��

 ��

 ���

� �

�

 �"

 �

 � !

�,

�'

�*+

�!

�

� 

�#

�

�!"

� �

�

 �

 �

 �

�

�

�

�

�

�

�

�

�

�#

�

�!"

�

�

�

�

�

�

�

�

�

� �

�
#
 �% Attribute to match.


 �

 � 

 �#$
 
� Match operation.


�


�

�
"
� Value to match by.


�

�	

�
�
� �~ Set the values of the interface property base on match rule defintion. Requires explicit input value, empty string is allow.


�
'
 �- Set type of connection.


 �

 �(

 �+,
%
�+ Set network boundary.


�

�&

�)*

�  Set ASNs.


�

�	

�
,
� List of providers available.


�

�	

�

� �

�

 �

 �

 �

 �

�"

�


�

�

� !

�$

�


�

�

�"#

�#

�


�

�

�!"

�#

�


�

�

�!"

� �

�
%
 � ID of interface rule.


 �

 �	

 �
$
� Is this rule enable.


�

�

�
3
�% Rank order for apply list of rules.


�

�

�
$
� Rule match criteria.


�

�

�
&
� Action for match rule.


�

�	

�
!
�& Create timestamp.


�

�!

�$%
!
�& Update timestamp.


�

�!

�$%
)
�$ Device inclusive filters.


�

�

�"#
)
�$ Device exclusive filters.


�

�

�"#bproto3��  
�
,kentik/journeys/v202405alpha1/journeys.protokentik.journeys.v202405alpha1google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"s
GetJourneysNlqRequestZ
prompt (	BB�A;29The text prompt to be converted to a Journeys NLQ result.�ARprompt"�
GetJourneysNlqResponse
result (	RresultJ
result_type (2).kentik.journeys.v202405alpha1.ResultTypeR
resultTypeP
result_format (2+.kentik.journeys.v202405alpha1.ResultFormatRresultFormat*�

ResultType
RESULT_TYPE_UNSPECIFIED 
RESULT_TYPE_ERROR
RESULT_TYPE_DE_QUERY_OBJECT
RESULT_TYPE_ME_QUERY_OBJECT
RESULT_TYPE_KNOWLEDGE_BASE*
ResultFormat
RESULT_FORMAT_UNSPECIFIED 
RESULT_FORMAT_JSON
RESULT_FORMAT_MARKDOWN
RESULT_FORMAT_PLAIN_TEXT2�
JourneysDataService�
GetJourneysNlq4.kentik.journeys.v202405alpha1.GetJourneysNlqRequest5.kentik.journeys.v202405alpha1.GetJourneysNlqResponse"��AeJourneys AI NLQ Service:Perform Natural Language (NLQ) to query object translation*GetJourneysNlq��journeys:read���(&/journeys/v202405alpha1/GetJourneysNlq&�Agrpc.api.kentik.com��journeys��B�ZQgithub.com/kentik/api-schema-public/gen/go/kentik/journeys/v202405alpha1;journeys�A��
Journeys AI NLQ APIW# Overview
Journeys AI API provides programmatic access to Natural Language Query (NLQ)"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202405alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�
  l

  

 &

 h
	
 h
	
  &
	
 !
	
 )
	
 8
	

 /
	
 :

� :


 < B


 <

  =

  =

  =

 >

 >

 >

 ?"

 ?

 ? !

 @"

 @

 @ !

 A!

 A

 A 


D I


D

 E 

 E

 E

F

F

F

G

G

G

H

H

H

 L S {{.Name}}



 L

  MR

  M

  M	

  M

  MR

  �NP

  � Q*

V Z {{.Name}}



V

 W

 W

 W	

 W

X

X

X

X

Y!

Y

Y

Y 


 \ l


 \


 ];

 �];


 ^F

 �+^F


 _:

 �*_:

  ak

  a

  a*

  a5K

  b@

  �*b@

  ce

	  �ʼ"ce

  fj

  �fjbproto3��  
�
&kentik/journeys/v202406/journeys.protokentik.journeys.v202406google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"s
GetJourneysNlqRequestZ
prompt (	BB�A;29The text prompt to be converted to a Journeys NLQ result.�ARprompt"�
GetJourneysNlqResponse
result (	RresultD
result_type (2#.kentik.journeys.v202406.ResultTypeR
resultTypeJ
result_format (2%.kentik.journeys.v202406.ResultFormatRresultFormat*�

ResultType
RESULT_TYPE_UNSPECIFIED 
RESULT_TYPE_ERROR
RESULT_TYPE_DE_QUERY_OBJECT
RESULT_TYPE_ME_QUERY_OBJECT
RESULT_TYPE_KNOWLEDGE_BASE
RESULT_TYPE_DDOS_ALERTS*
ResultFormat
RESULT_FORMAT_UNSPECIFIED 
RESULT_FORMAT_JSON
RESULT_FORMAT_MARKDOWN
RESULT_FORMAT_PLAIN_TEXT2�
JourneysDataService�
GetJourneysNlq..kentik.journeys.v202406.GetJourneysNlqRequest/.kentik.journeys.v202406.GetJourneysNlqResponse"��AeJourneys AI NLQ Service:Perform Natural Language (NLQ) to query object translation*GetJourneysNlq��journeys:read���" /journeys/v202406/GetJourneysNlq&�Agrpc.api.kentik.com��journeys��B�ZKgithub.com/kentik/api-schema-public/gen/go/kentik/journeys/v202406;journeys�A��
Journeys AI NLQ APIW# Overview
Journeys AI API provides programmatic access to Natural Language Query (NLQ)"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202406*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�	
  m

  

  

 b
	
 b
	
  &
	
 !
	
 )
	
 8
	

 /
	
 :

� :


 < C


 <

  =

  =

  =

 >

 >

 >

 ?"

 ?

 ? !

 @"

 @

 @ !

 A!

 A

 A 

 B

 B

 B


E J


E

 F 

 F

 F

G

G

G

H

H

H

I

I

I

 M T {{.Name}}



 M

  NS

  N

  N	

  N

  NS

  �OQ

  � R*

W [ {{.Name}}



W

 X

 X

 X	

 X

Y

Y

Y

Y

Z!

Z

Z

Z 


 ] m


 ]


 ^;

 �^;


 _F

 �+_F


 `:

 �*`:

  bl

  b

  b*

  b5K

  c@

  �*c@

  df

	  �ʼ"df

  gk

  �gkbproto3��  
�b
kentik/kmi/v202212/kmi.protokentik.kmi.v202212google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"z
MarketB
	market_id (	B%�A2Unique Geo Market identifier�ARmarketId,
name (	B�A2Geo Market Name�ARname"�
Ranking>
asn (B'�A 2Autonomous System Number (ASN)�AH Rasn�:
name (	B&�A2Name of the Autonomous System�ARname?
rank (B&�A2Rank of the Autonomous System�AHRrank�S
rank_change (B-�A&2$Rank Change of the Autonomous System�AHR
rankChange�B
score (B'�A 2Score of the Autonomous System�AHRscore�V
score_change (B.�A'2%Score Change of the Autonomous System�AHRscoreChange�B
_asnB
_rankB
_rank_changeB
_scoreB
_score_change"�
CustomerProvider>
asn (B'�A 2Autonomous System Number (ASN)�AH Rasn�:
name (	B&�A2Name of the Autonomous System�ARnameB
score (B'�A 2Score of the Autonomous System�AHRscore��
singlehomed_customer (BJ�AC2ASinglehomed customer (only one upstream provider to the internet)�AHRsinglehomedCustomer�F
mutual_customer (B�A2Mutual customer�AHRmutualCustomer�F
mutual_provider (B�A2Mutual provider�AHRmutualProvider�B
_asnB
_scoreB
_singlehomed_customerB
_mutual_customerB
_mutual_provider"�
Peer>
asn (B'�A 2Autonomous System Number (ASN)�AH Rasn�:
name (	B&�A2Name of the Autonomous System�ARnamen
	pfx_count (BL�AE2CPrefix Count (number of distinct IP address blocks announced by AS)�AHRpfxCount�B
_asnB

_pfx_count"�

ASNDetails>
asn (B'�A 2Autonomous System Number (ASN)�AH Rasn�:
name (	B&�A2Name of the Autonomous System�ARnameQ
country_name (	B.�A'2%Country Name of the Autonomous System�ARcountryName^
	customers (2$.kentik.kmi.v202212.CustomerProviderB�A2List of Customers�AR	customers^
	providers (2$.kentik.kmi.v202212.CustomerProviderB�A2List of Providers�AR	providersF
peers (2.kentik.kmi.v202212.PeerB�A2List of Peers�ARpeersB
_asn"
ListMarketsRequest"]
ListMarketsResponseF
markets (2.kentik.kmi.v202212.MarketB�A	2Markets�ARmarkets"�
GetRankingsRequestc
	market_id (	BF�AC2AUnique Geo Market identifier (as provided by the ListMarkets RPC)RmarketId�
	rank_type (	B��A�2�Type of the requested ranking ('customer_base', 'customer_base_retail', 'customer_base_wholesome', 'customer_base_backbone', 'customer_growth', 'peering_base'). Defaults to 'customer_base'.RrankType]
ip (	BM�AJ2HIP Address Family ('v4' or 'v6') of requested ranking. Defaults to 'v4'.RipS
limit (B8�A523Maximum number of entries returned. (Default: 600).H Rlimit�B
_limit"�
GetRankingsResponseN
rankings (2.kentik.kmi.v202212.RankingB�A2List of rankingsRrankingse
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"�
GetASNDetailsRequestc
	market_id (	BF�AC2AUnique Geo Market identifier (as provided by the ListMarkets RPC)RmarketId5
asn (	B#�A 2Autonomous System Number (ASN)RasnH
ip (	B8�A523IP Address Family ('v4' or 'v6'). Defaults to 'v4'.Ripo
type (	B[�AX2VType of the requested ASN ('all', 'customer', 'provider', 'peers'). Defaults to 'all'.Rtypev
mutual_provider (	BM�AJ2HFilter by mutual provider ('all', 'only', 'exclude'). Defaults to 'all'.RmutualProviderv
mutual_customer (	BM�AJ2HFilter by mutual customer ('all', 'only', 'exclude'). Defaults to 'all'.RmutualCustomer�
singlehomed_customer (	BR�AO2MFilter by singlehomed customer ('all', 'only', 'exclude'). Defaults to 'all'.RsinglehomedCustomer"�
GetASNDetailsResponse�
asn_details (2.kentik.kmi.v202212.ASNDetailsBR�AO2MMetadata and list of customers, providers, and peers for an Autonomous SystemR
asnDetails2�

KmiService�
ListMarkets&.kentik.kmi.v202212.ListMarketsRequest'.kentik.kmi.v202212.ListMarketsResponse"��ARList all geo markets for KMI.$Returns list of geo markets for KMI.*ListMarkets��admin.kmi:read���/kmi/v202212/markets�
GetRankings&.kentik.kmi.v202212.GetRankingsRequest'.kentik.kmi.v202212.GetRankingsResponse"��A\.List KMI rankings by geo market and rank type.Returns list of KMI rankings.*GetRankings��admin.kmi:read���9"4/kmi/v202212/market/{market_id}/rankings/{rank_type}:*�
GetASNDetails(.kentik.kmi.v202212.GetASNDetailsRequest).kentik.kmi.v202212.GetASNDetailsResponse"��A�SList metadata and list of customers, providers, and peers for an Autonomous System.VReturns metadata and list of customers, providers, and peers for an Autonomous System.*GetASNDetails��admin.kmi:read���9"4/kmi/v202212/market/{market_id}/network/{asn}/{type}:*'�Agrpc.api.kentik.com��	admin.kmi��B�ZAgithub.com/kentik/api-schema-public/gen/go/kentik/kmi/v202212;kmi�A��
$Kentik Market Intelligence (KMI) API�# Overview
The Kentik Market Intelligence (KMI) API provides programmatic access to information related to KMI rankings, KMI markets, and the customers, providers, and peers of individual Autonomous Systems (ASes). This information is derived from analysis of the global routing table, which enables us to classify the peering and transit relationships between ASes and to identify the providers, peers, and customers of a given AS in any geography (market). KMI estimates the volume of IP space transited by ASes in different geographies and produces rankings based on that volume, thereby enabling users to compare ASes in various markets.

# KMI Ranking Types

The following types of rankings are shown:
- **Customer Base**: Ranked by the size of the overall customer base, estimated by determining how much IP address space a given AS transits relative to other ASes:
    - Retail networks  provide services (e.g. originate content) or have end-users that are consumers of services (e.g. ISPs or "eyeball" networks).
    - Wholesale networks  connect retail networks to backbone networks.
    - Backbone networks carry high volumes of traffic between wholesale networks.
- **Customer Growth**: Ranked by the change in overall customer base (gain/loss of prefixes) over the last 20 days.
- **Peering**: Ranked by the amount of IP address space sent to the AS over a settlement-free peering session.

Both REST endpoint and gRPC RPCs are provided.

**_Note:_** More information about KMI can be found at [Kentik Market Intelligence](https://kb.kentik.com/v4/Ha04.htm)."E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202212*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�,
  �

  

 

 X
	
 X
	
  &
	
 !
	
 )
	
 8
	
	 /
	
 G

� G

 J W {{.Name}}



 J

  KP

  K

  K	

  K

  KP

  � L-

  �MO

 QV

 Q

 Q	

 Q

 QV

 � R-

 �SU

Z  {{.Name}}



Z

 [`

 [


 [

 [

 [

 [`

 � \-

 �]_

af

a

a	

a

af

� b-

�ce

gl

g


g

g

g

gl

� h-

�ik

mr

m


m

m

m !

m"r

� n-

�oq

sx

s


s

s

s

sx

� t-

�uw

y~

y


y

y

y!"

y#~

� z-

�{}

� � {{.Name}}


�

 ��

 �


 �

 �

 �

 ��

 � �-

 ���

��

�

�	

�

��

� �-

���

��

�


�

�

�

��

� �-

���

��

�


�

�$

�'(

�)�

� �-

���

��

�


�

�

�"#

�$�

� �-

���

��

�


�

�

�"#

�$�

� �-

���

� � {{.Name}}


�

 ��

 �


 �

 �

 �

 ��

 � �-

 ���

��

�

�	

�

��

� �-

���

��

�


�

�

�

� �

� �-

���

� � {{.Name}}


�

 ��

 �


 �

 �

 �

 ��

 � �-

 ���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�


�

�%

�()

�*�

� �-

���

��

�


�

�%

�()

�*�

� �-

���

��

�


�

�

�

��

� �-

���
W
�  {{.Name}}
2> KMI
 -------------------------------------------------------


�

� � {{.Name}}


�

 ��

 �


 �

 �

 �

 ��

 � �-

 ���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�


�

�

�

��

���

� � {{.Name}}


�

 ��

 �


 �

 �

 �

 � �

 ���

��

�

�	

�

��

���

	� � {{.Name}}


	�

	 ��

	 �

	 �	

	 �

	 ��

	 ���

	��

	�

	�	

	�

	��

	���

	��

	�

	�	

	�

	��

	���

	��

	�

	�	

	�

	��

	���

	��

	�

	�	

	�

	��

	���

	��

	�

	�	

	�

	��

	���

	��

	�

	�	

	� !

	�"�

	���


� � {{.Name}}



�


 ��


 �


 �


 �


 ��


 ���
Z
 � �2L services and RPCs
 -------------------------------------------------------


 �

 �;

 ��;

 �F

 �+�F

 �;

 �*�;

  ��2 --- KMI ---


  �

  �$

  �/B

  �A

  �*�A

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �$

 �/B

 �A

 �*�A

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �A

 �*�A

 ��

	 �ʼ"��

 ��

 ���bproto3��  
�"
&kentik/label/v202203alpha1/label.protokentik.label.v202203alpha1google/api/annotations.protogoogle/api/client.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.protogoogle/protobuf/timestamp.proto"�
Label
id (	Rid
name (	Rname 
description (	Rdescription
color (	Rcolor0
cdate (2.google.protobuf.TimestampRcdate0
edate (2.google.protobuf.TimestampRedate"
ListLabelsRequest"t
ListLabelsResponse9
labels (2!.kentik.label.v202203alpha1.LabelRlabels#
invalid_count (RinvalidCount"M
CreateLabelRequest7
label (2!.kentik.label.v202203alpha1.LabelRlabel"N
CreateLabelResponse7
label (2!.kentik.label.v202203alpha1.LabelRlabel"M
UpdateLabelRequest7
label (2!.kentik.label.v202203alpha1.LabelRlabel"N
UpdateLabelResponse7
label (2!.kentik.label.v202203alpha1.LabelRlabel"$
DeleteLabelRequest
id (	Rid"
DeleteLabelResponse2�
LabelService�

ListLabels-.kentik.label.v202203alpha1.ListLabelsRequest..kentik.label.v202203alpha1.ListLabelsResponse"��APFetch Search Labels.Return list of labels matches search criteria.*	ListLabel��admin.label:read���/label/v202203alpha1/labels�
CreateLabel..kentik.label.v202203alpha1.CreateLabelRequest/.kentik.label.v202203alpha1.CreateLabelResponse"��AMCreate a label.-Create a label from request. returns created.*LabelCreate��admin.label:write��� "/label/v202203alpha1/labels:*�
UpdateLabel..kentik.label.v202203alpha1.UpdateLabelRequest/.kentik.label.v202203alpha1.UpdateLabelResponse"��AWUpdate a label.7Replaces the entire label attributes specified with id.*LabelUpdate��admin.label:write���+"&/label/v202203alpha1/labels/{label.id}:*�
DeleteLabel..kentik.label.v202203alpha1.DeleteLabelRequest/.kentik.label.v202203alpha1.DeleteLabelResponse"��ADDelete a label.$Deletes the label specified with id.*LabelDelete��admin.label:write���"* /label/v202203alpha1/labels/{id})�Agrpc.api.kentik.com��admin.label��B�ZKgithub.com/kentik/api-schema-public/gen/go/kentik/label/v202203alpha1;label�A��
	Label APIK--- This API has been deprecated and will be removed in the near future ---"
Kentik API Engineering2202203alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�
  �

  

 #

 b
	
 b
	
  &
	
 !
	
 8
	
 /
	
	 )
	
 8

� 8


 : D


 :

  ;

  ;

  ;	

  ;

 <

 <

 <	

 <

 =

 =

 =	

 =
#
 ? hex color code value


 ?

 ?	

 ?
 
 A& Create timestamp.


 A

 A!

 A$%
 
 C& Update timestamp.


 C

 C!

 C$%


F G


F


H K


H

 I

 I


 I

 I

 I

J

J

J

J


M O


M

 N

 N

 N

 N


P R


P

 Q

 Q

 Q

 Q


T V


T

 U

 U

 U

 U


W Y


W

 X

 X

 X

 X


[ ^


[

 ] ID of label.


 ]

 ]	

 ]
	
_ 


_

 b �


 b


 c;

 �c;


 dF

 �+dF


 e=

 �*e=

  hr

  h

  h"

  h-?

  iC

  �*iC

  jl

	  �ʼ"jl

  mq

  �mq

 t

 t

 t$

 t/B

 uD

 �*uD

 vy

	 �ʼ"vy

 z~

 �z~

 ��

 �

 �$

 �/B

 �D

 �*�D

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �$

 �/B

 �D

 �*�D

 ��

	 �ʼ"��

 ��

 ���bproto3��  
�9
 kentik/label/v202210/label.protokentik.label.v202210google/api/annotations.protogoogle/api/field_behavior.protogoogle/api/client.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.protogoogle/protobuf/timestamp.proto"�
LabelG
id (	B7�A02.Unique system assigned identifier of the label�ARids
name (	B_�AX2VLabel text visible in listing of configuration of objects to which it has been applied�ARnameg
description (	BE�AB2@Optional description of the label, visible only in API responsesRdescription�
color (	Bk�Ah2f[Hexadecimal code of the color](https://www.color-hex.com/) of the label text background in the portalRcolorS
cdate (2.google.protobuf.TimestampB!�A2Creation timestamp (UTC)�ARcdate\
edate (2.google.protobuf.TimestampB*�A#2!Last modification timestamp (UTC)�ARedate"
ListLabelsRequest"�
ListLabelsResponseW
labels (2.kentik.label.v202210.LabelB"�A2List of configured labels�ARlabelsz
invalid_count (BU�AR2PNumber of invalid entries encountered while collecting data (should be always 0)RinvalidCount"z
CreateLabelRequestd
label (2.kentik.label.v202210.LabelB1�A*2(Configuration of the label to be created�ARlabel"z
CreateLabelResponsec
label (2.kentik.label.v202210.LabelB0�A)2'Configuration of the just created label�ARlabel"z
UpdateLabelRequestd
label (2.kentik.label.v202210.LabelB1�A*2(Configuration of the label to be updated�ARlabel"u
UpdateLabelResponse^
label (2.kentik.label.v202210.LabelB+�A$2"Updated configuration of the label�ARlabel"L
DeleteLabelRequest6
id (	B&�A2ID of the label to be deleted�ARid"
DeleteLabelResponse2�
LabelService�

ListLabels'.kentik.label.v202210.ListLabelsRequest(.kentik.label.v202210.ListLabelsResponse"��A_List all configured labels5Returns list of all labels configured in the account.*
ListLabels��admin.label:read���/label/v202210/labels�
CreateLabel(.kentik.label.v202210.CreateLabelRequest).kentik.label.v202210.CreateLabelResponse"��AUCreate a new label.1Creates a new label based on data in the request.*CreateLabel��admin.label:write���"/label/v202210/labels:*�
UpdateLabel(.kentik.label.v202210.UpdateLabelRequest).kentik.label.v202210.UpdateLabelResponse"��AKUpdate an existing label.!Updates configuration of a label.*UpdateLabel��admin.label:write���%" /label/v202210/labels/{label.id}:*�
DeleteLabel(.kentik.label.v202210.DeleteLabelRequest).kentik.label.v202210.DeleteLabelResponse"�AEDelete a label.%Deletes label with specified with id.*DeleteLabel��admin.label:write���*/label/v202210/labels/{id})�Agrpc.api.kentik.com��admin.label��B�ZEgithub.com/kentik/api-schema-public/gen/go/kentik/label/v202210;label�A��
Label Management API�# Overview
The Label API enables programmatic creation and management of labels, which are tags that can be applied to objects such as devices, synthetic tests, and ksynth agents in order to create logical groups. While this API is used to manage labels, the application of a label to a given object is done with the API corresponding to the type of that object (see Applying Labels via API).

Both gRPC RPCs and REST endpoints are provided.

# Applying Labels via API
The Label API does not handle the application of labels to configuration objects. Instead, a label is applied to an object using the management API for that object. The table below lists the APIs for the types of objects to which labels may be applied.
| Object type  | API for attaching labels |
|--------------|--------------------------------------|
| Device | [Device Apply Labels](https://kb.kentik.com/v0/Ec05.htm#Ec05-Device_Apply_Labels) |
| Synthetic monitoring test | [SyntheticsAdminService API](https://kb.kentik.com/v0/Oa07.htm#Oa07-SyntheticsAdminService_API) |
| Synthetic monitoring agent | [SyntheticsAdminService API](https://kb.kentik.com/v0/Oa07.htm#Oa07-SyntheticsAdminService_API) |
| BGP monitor | [BgpMonitoringAdminService API ](https://kb.kentik.com/v0/Oa09.htm#Oa09-BgpMonitoringAdminService_API)|

***Note:*** Device labels can be also managed using the legacy [Device Label API](https://kb.kentik.com/v0/Ec05.htm#Ec05-Device_Label_API)."E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202210*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�
  �

  

 

 \
	
 \
	
  &
	
 )
	
 !
	
 8
	
	 /
	

 )
	
 M

� M

 P s {{.Name}}



 P

  QV

  Q

  Q	

  Q

  QV

  � R-

  �SU

 W\

 W

 W	

 W

 W\

 �XZ

 � [*

 ]a

 ]

 ]	

 ]

 ]a

 �^`

 bf

 b

 b	

 b

 bf

 �ce

 gl

 g

 g!

 g$%

 g&l

 � h-

 �ik

 mr

 m

 m!

 m$%

 m&r

 � n-

 �oq

v  {{.Name}}



v

y � {{.Name}}



y

 z

 z


 z

 z

 z

 z

 � {-

 �|~

��

�

�

�

��

���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

 � �*

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 � �-

 ���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

 � �*

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 � �-

 ���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

 � �*

�  {{.Name}}


�
Z
 � �2L services and RPCs
 -------------------------------------------------------


 �

 �;

 ��;

 �F

 �+�F

 �=

 �*�=

  ��

  �

  �"

  �-?

  �C

  �*�C

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �$

 �/B

 �D

 �*�D

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �$

 �/B

 �D

 �*�D

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �$

 �/B

 �D

 �*�D

 ��

	 �ʼ"��

 ��

 ���bproto3��  
�
"kentik/mkp/v202102alpha1/mkp.protokentik.mkp.v202102alpha1google/api/annotations.protogoogle/api/client.proto google/protobuf/field_mask.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"�
Alert
saved (Rsaved
	policy_id (RpolicyIdC

thresholds (2#.kentik.mkp.v202102alpha1.ThresholdR
thresholds%
primary_metric (	RprimaryMetric+
secondary_metrics (	RsecondaryMetrics
is_template (R
isTemplate!
subpolicy_id (	RsubpolicyId"�
Asset@
reports (2&.kentik.mkp.v202102alpha1.Asset.ReportRreportsM
default_report (2&.kentik.mkp.v202102alpha1.Asset.ReportRdefaultReport,
Report
id (Rid
type (	Rtype"�
	Threshold
id (Rid>
activate (2".kentik.mkp.v202102alpha1.ActivateRactivate
severity (	RseverityC

conditions (2#.kentik.mkp.v202102alpha1.ConditionR
conditionsF
mitigations (2$.kentik.mkp.v202102alpha1.MitigationRmitigationsb
notification_channels (2-.kentik.mkp.v202102alpha1.NotificationChannelRnotificationChannels4
threshold_ack_required (RthresholdAckRequired>
enable_tenant_notifications (RenableTenantNotificationsD
receive_landlord_notifications	 (RreceiveLandlordNotifications"�
Activate
times (Rtimes
operator (	Roperator
	time_unit (	RtimeUnit
time_window (R
timeWindow!
grace_period (RgracePeriod"�
	Condition
type (	Rtype
value (Rvalue
metric (	Rmetric
operator (	Roperator

value_type (	R	valueType!
value_select (	RvalueSelect"�

Mitigation
id (Rid
status (	Rstatus

company_id (R	companyId

pairing_id (R	pairingId!
threshold_id (RthresholdId2
is_method_overridable (RisMethodOverridable2
mitigation_apply_type (	RmitigationApplyType2
mitigation_clear_type (	RmitigationClearType4
mitigation_apply_timer (RmitigationApplyTimer4
mitigation_clear_timer	 (RmitigationClearTimer6
is_platform_overridable
 (RisPlatformOverridable
cdate (	Rcdate
edate (	Redate"%
NotificationChannel
id (Rid"�
User
id (Rid

company_id (R	companyId

user_email (	R	userEmail
	user_name (	RuserName$
user_full_name (	RuserFullName"
user_group_id (RuserGroupId

last_login (	R	lastLogin1
permission_overrides (RpermissionOverrides
role	 (	Rrole

user_level
 (R	userLevel"w

TenantLink
id (Rid*
pivot_template_id (RpivotTemplateId-
pivot_user_group_id (RpivotUserGroupId"�
Package
id (Rid

company_id (R	companyId
name (	Rname 
description (	Rdescription
icon (	Ricon
color (	Rcolor7
alerts (2.kentik.mkp.v202102alpha1.AlertRalerts7
assets (2.kentik.mkp.v202102alpha1.AssetRassets

is_default	 (R	isDefault>
tenants
 (2$.kentik.mkp.v202102alpha1.TenantLinkRtenants"M
CustomDimension
	dimension (	R	dimension
	populator (	R	populator"�
Device
all_devices (R
allDevices!
device_types (	RdeviceTypes#
device_labels (RdeviceLabels!
device_sites (RdeviceSites
device_name (	R
deviceName"o
FilterField!
filter_field (	RfilterField
operator (	Roperator!
filter_value (	RfilterValue"�
Filter
name (	Rname
named (Rnamed
	connector (	R	connector
not (Rnot

auto_added (	R	autoAdded#
saved_filters (	RsavedFilters?
filters (2%.kentik.mkp.v202102alpha1.FilterFieldRfiltersE
filter_groups (2 .kentik.mkp.v202102alpha1.FilterRfilterGroups
metric	 (	Rmetric"�
Tenant
id (Rid

company_id (R	companyId
name (	Rname 
description (	Rdescription
type (	Rtype
enabled (Renabled7
alerts (2.kentik.mkp.v202102alpha1.AlertRalerts7
assets (2.kentik.mkp.v202102alpha1.AssetRassets
asn (	Rasn
cidr	 (	RcidrV
custom_dimensions
 (2).kentik.mkp.v202102alpha1.CustomDimensionRcustomDimensions:
devices (2 .kentik.mkp.v202102alpha1.DeviceRdevices:
filters (2 .kentik.mkp.v202102alpha1.FilterRfilters%
interface_name (	RinterfaceName

snmp_alias (	R	snmpAlias=
packages (2!.kentik.mkp.v202102alpha1.PackageRpackages4
users (2.kentik.mkp.v202102alpha1.UserRusers
template_id (R
templateId"
ListPackageRequest"y
ListPackageResponse=
packages (2!.kentik.mkp.v202102alpha1.PackageRpackages#
invalid_count (RinvalidCount"#
GetPackageRequest
id (Rid"Q
GetPackageResponse;
package (2!.kentik.mkp.v202102alpha1.PackageRpackage"S
CreatePackageRequest;
package (2!.kentik.mkp.v202102alpha1.PackageRpackage"T
CreatePackageResponse;
package (2!.kentik.mkp.v202102alpha1.PackageRpackage"S
UpdatePackageRequest;
package (2!.kentik.mkp.v202102alpha1.PackageRpackage"T
UpdatePackageResponse;
package (2!.kentik.mkp.v202102alpha1.PackageRpackage"�
PatchPackageRequest;
package (2!.kentik.mkp.v202102alpha1.PackageRpackage.
mask (2.google.protobuf.FieldMaskRmask"S
PatchPackageResponse;
package (2!.kentik.mkp.v202102alpha1.PackageRpackage"&
DeletePackageRequest
id (Rid"
DeletePackageResponse"
ListTenantRequest"u
ListTenantResponse:
tenants (2 .kentik.mkp.v202102alpha1.TenantRtenants#
invalid_count (RinvalidCount""
GetTenantRequest
id (Rid"M
GetTenantResponse8
tenant (2 .kentik.mkp.v202102alpha1.TenantRtenant"O
CreateTenantRequest8
tenant (2 .kentik.mkp.v202102alpha1.TenantRtenant"P
CreateTenantResponse8
tenant (2 .kentik.mkp.v202102alpha1.TenantRtenant"O
UpdateTenantRequest8
tenant (2 .kentik.mkp.v202102alpha1.TenantRtenant"P
UpdateTenantResponse8
tenant (2 .kentik.mkp.v202102alpha1.TenantRtenant"~
PatchTenantRequest8
tenant (2 .kentik.mkp.v202102alpha1.TenantRtenant.
mask (2.google.protobuf.FieldMaskRmask"O
PatchTenantResponse8
tenant (2 .kentik.mkp.v202102alpha1.TenantRtenant"%
DeleteTenantRequest
id (Rid"
DeleteTenantResponse2�
PackageService�
ListPackage,.kentik.mkp.v202102alpha1.ListPackageRequest-.kentik.mkp.v202102alpha1.ListPackageResponse"z�ABList MKP packages.Returns a list of MKP packages.*PackageList��admin.mkp:read���/mkp/v202102alpha1/packages�

GetPackage+.kentik.mkp.v202102alpha1.GetPackageRequest,.kentik.mkp.v202102alpha1.GetPackageResponse"��Ae!Get information aboout a package.4Returns information about package specified with ID.*
PackageGet��admin.mkp:read���" /mkp/v202102alpha1/packages/{id}�
CreatePackage..kentik.mkp.v202102alpha1.CreatePackageRequest/.kentik.mkp.v202102alpha1.CreatePackageResponse"��AbCreate a package template.5Create package from request. returns created package.*PackageCreate��admin.mkp:write��� "/mkp/v202102alpha1/packages:*�
UpdatePackage..kentik.mkp.v202102alpha1.UpdatePackageRequest/.kentik.mkp.v202102alpha1.UpdatePackageResponse"��A]Update a package.9Replaces the entire package attributes specified with id.*PackageUpdate��admin.mkp:write���-(/mkp/v202102alpha1/packages/{package.id}:*�
PatchPackage-.kentik.mkp.v202102alpha1.PatchPackageRequest..kentik.mkp.v202102alpha1.PatchPackageResponse"��ApPatch a package.NPartially Updates the attributes of package specified with id and mask fields.*PackagePatch��admin.mkp:write���-2(/mkp/v202102alpha1/packages/{package.id}:*�
DeletePackage..kentik.mkp.v202102alpha1.DeletePackageRequest/.kentik.mkp.v202102alpha1.DeletePackageResponse"��AJDelete a package.&Deletes the package specified with id.*PackageDelete��admin.mkp:write���"* /mkp/v202102alpha1/packages/{id}&�Amkp.api.kentik.com��	admin.mkp��2�
TenantService�

ListTenant+.kentik.mkp.v202102alpha1.ListTenantRequest,.kentik.mkp.v202102alpha1.ListTenantResponse"v�A?List MKP tenants.Returns a list of MKP tenants.*
TenantList��admin.mkp:read���/mkp/v202102alpha1/tenants�
	GetTenant*.kentik.mkp.v202102alpha1.GetTenantRequest+.kentik.mkp.v202102alpha1.GetTenantResponse"��Ac Get information aboout a tenant.4Returns information about package specified with ID.*	TenantGet��admin.mkp:read���!/mkp/v202102alpha1/tenants/{id}�
CreateTenant-.kentik.mkp.v202102alpha1.CreateTenantRequest..kentik.mkp.v202102alpha1.CreateTenantResponse"��AUCreate a tenant.3Create tenant from request. returns created tenant.*TenantCreate��admin.mkp:write���"/mkp/v202102alpha1/tenants:*�
UpdateTenant-.kentik.mkp.v202102alpha1.UpdateTenantRequest..kentik.mkp.v202102alpha1.UpdateTenantResponse"��AZUpdate a tenant.8Replaces the entire tenant attributes specified with id.*TenantUpdate��admin.mkp:write���+&/mkp/v202102alpha1/tenants/{tenant.id}:*�
PatchTenant,.kentik.mkp.v202102alpha1.PatchTenantRequest-.kentik.mkp.v202102alpha1.PatchTenantResponse"��AmPatch a tenant.MPartially Updates the attributes of tenant specified with id and mask fields.*TenantPatch��admin.mkp:write���+2&/mkp/v202102alpha1/tenants/{tenant.id}:*�
DeleteTenant-.kentik.mkp.v202102alpha1.DeleteTenantRequest..kentik.mkp.v202102alpha1.DeleteTenantResponse"��AGDelete a tenant.%Deletes the tenant specified with id.*TenantDelete��admin.mkp:write���!*/mkp/v202102alpha1/tenants/{id}&�Amkp.api.kentik.com��	admin.mkp��B�ZGgithub.com/kentik/api-schema-public/gen/go/kentik/mkp/v202102alpha1;mkp�A�P
MKP API"7
Kentik API Engineeringhttps://github.com/kentik/api2202102alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ�^
 �
'
 2 My Kentik Portal management


 !

 ^
	
 ^
	
  &
	
 !
	
	 *
	

 8
	
 /
	
 9

� 9

 < D Alert Policy



 <

  =

  =

  =

  =

 >

 >

 >	

 >

 ?$

 ?


 ?

 ?

 ?"#

 @

 @

 @	

 @

 A(

 A


 A

 A#

 A&'

 B

 B

 B

 B

 C

 C

 C	

 C


F M


F

 GJ

 G


  H

  H


  H

  H

 I

 I


 I

 I

 K

 K


 K

 K

 K

L

L

L	

L

P Z Alert Threshold



P

 Q

 Q

 Q	

 Q

R

R


R

R

S

S

S	

S

T$

T


T

T

T"#

U&

U


U

U!

U$%

V9

V


V

V4

V78

W"

W

W

W !

X'

X

X"

X%&

Y*

Y

Y%

Y()


\ b


\

 ]

 ]

 ]	

 ]

^

^

^	

^

_

_

_	

_

`

`

`	

`

a

a

a	

a


d k


d

 e

 e

 e	

 e

f

f

f	

f

g

g

g	

g

h

h

h	

h

i

i

i	

i

j

j

j	

j


m {


m

 n

 n

 n	

 n

o

o

o	

o

p

p

p	

p

q

q

q	

q

r

r

r	

r

s!

s

s

s 

t#

t

t	

t!"

u#

u

u	

u!"

v$

v

v	

v"#

	w$

	w

	w	

	w"#


x$


x


x


x!#
$
y" revisit for timestamp


y

y	

y
$
z" revisit for timestamp


z

z	

z


} 


}

 ~

 ~

 ~	

 ~

� �

�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�
!
�" revisit timestamp


�

�	

�
7
� ) Required for the CreateTenant operation


�

�

�
7
�) Required for the CreateTenant operation


�

�	

�
7
	�) Required for the CreateTenant operation


	�

	�	

	�
9
� �+ Tenants referencing this Package template


�

 �

 �

 �	

 �

�

�

�	

�

�!

�

�	

� 
+
	� � Package Template definition


	�

	 �

	 �

	 �	

	 �

	�

	�

	�	

	�

	�

	�

	�	

	�

	�

	�

	�	

	�

	�

	�

	�	

	�

	�

	�

	�	

	�

	�

	�


	�

	�

	�

	�

	�

	�

	�

	�

	�

	�

	�
P
		�#B list of tenants using this Package template (for GetTenant only)


		�


		�

		�

		� "


� �


�


 �


 �


 �	


 �


�


�


�	


�

� �

�

 �

 �

 �

 �

�#

�


�

�

�!"

�$

�


�

�

�"#

�#

�


�

�

�!"

�"

�


�

�

� !

� �

�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

� �

�

 �

 �

 �	

 �

�

�

�

�

�

�

�	

�

�

�

�


�

�

�

�	

�

�$

�


�

�

�"#

�#

�


�

�

�!"

�$

�


�

�

�"#

�

�


�

�

�

� �

�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�

�

� config object


�


�

�

�

�

�

�

�

�

�

�	

�

	�

	�

	�	

	�


�2


�



�


�,


�/1

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�
D
�!6 Packages associated with Tenant (for GetTenant only)


�


�

�

� 
A
�3 Users associated with Tenant (for GetTenant only)


�


�

�

�
-
� Package ID to use with tenant


�

�	

�


� 

�

� �

�

 � 

 �


 �

 �

 �
T
�F The number of invalid packages, for troubleshooting. Should be zero.


�

�	

�

� �

�

 �

 �

 �	

 �

� �

�

 �

 �	

 �


 �

� �

�

 �

 �	

 �


 �

� �

�

 �

 �	

 �


 �

� �

�

 �

 �	

 �


 �

� �

�

 �

 �	

 �


 �

� �

�

 �

 �	

 �


 �

�%q CSV values of fields follow the path of Package object dot notation (ie. "package.name,package.assets.reports")


�

� 

�#$

� �

�

 �

 �	

 �


 �

� �

�

 �

 �

 �	

 �


�  

�

 � �

 �

 �:

 ��:

 �F

 �+�F

 �;

 �*�;

  ��

  �

  �$

  �/B

  �A

  �*�A

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �"

 �-?

 �A

 �*�A

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �&

 �1E

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���


� 

�

� �

�

 �

 �


 �

 �

 �

�

�

�	

�

� �

�

 �

 �

 �	

 �

� �

�

 �

 �

 �	

 �

� �

�

 �

 �

 �	

 �

 � �

 �

  �

  �

  �	

  �

!� �

!�

! �

! �

! �	

! �

"� �

"�

" �

" �

" �	

" �

#� �

#�

# �

# �

# �	

# �
z
#�%l CSV values of fields follow the path of Tenant object dot notation (ie. "tenant.name,tenant.filters.name")


#�

#� 

#�#$

$� �

$�

$ �

$ �

$ �	

$ �

%� �

%�

% �

% �

% �	

% �


&� 

&�

� �

�

�:

��:

�F

�+�F

�;

�*�;

 ��

 �

 �"

 �-?

 �A

 �*�A

 ��

	 �ʼ"��

 ��

 ���

��

�

� 

�+<

�A

�*�A

��

	�ʼ"��

��

���

��

�

�&

�1E

�B

�*�B

��

	�ʼ"��

��

���

��

�

�&

�1E

�B

�*�B

��

	�ʼ"��

��

���

��

�

�$

�/B

�B

�*�B

��

	�ʼ"��

��

���

��

�

�&

�1E

�B

�*�B

��

	�ʼ"��

��

���bproto3��  
�
kentik/mkp/v202407/mkp.protokentik.mkp.v202407google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.protokentik/user/v202211/user.proto"�
Alert
saved (Rsaved
	policy_id (	RpolicyId=

thresholds (2.kentik.mkp.v202407.ThresholdR
thresholds%
primary_metric (	RprimaryMetric+
secondary_metrics (	RsecondaryMetrics
is_template (R
isTemplate!
subpolicy_id (	RsubpolicyId"�
Asset:
reports (2 .kentik.mkp.v202407.Asset.ReportRreportsG
default_report (2 .kentik.mkp.v202407.Asset.ReportRdefaultReport,
Report
id (	Rid
type (	Rtype"�
	Threshold
id (	Rid8
activate (2.kentik.mkp.v202407.ActivateRactivate
severity (	Rseverity=

conditions (2.kentik.mkp.v202407.ConditionR
conditions@
mitigations (2.kentik.mkp.v202407.MitigationRmitigations\
notification_channels (2'.kentik.mkp.v202407.NotificationChannelRnotificationChannels4
threshold_ack_required (RthresholdAckRequired>
enable_tenant_notifications (RenableTenantNotificationsD
receive_landlord_notifications	 (RreceiveLandlordNotifications"�
Activate
times (Rtimes
operator (	Roperator.
time_window_seconds (RtimeWindowSeconds0
grace_period_seconds (RgracePeriodSeconds"�
	Condition
type (	Rtype
value (	Rvalue
metric (	Rmetric
operator (	Roperator

value_type (	R	valueType!
value_select (	RvalueSelect"�

Mitigation
id (	Rid
status (	Rstatus

company_id (	R	companyId

pairing_id (	R	pairingId!
threshold_id (	RthresholdId2
is_method_overridable (RisMethodOverridable2
mitigation_apply_type (	RmitigationApplyType2
mitigation_clear_type (	RmitigationClearType4
mitigation_apply_timer (RmitigationApplyTimer4
mitigation_clear_timer	 (RmitigationClearTimer6
is_platform_overridable
 (RisPlatformOverridable"%
NotificationChannel
id (	Rid"w

TenantLink
id (	Rid*
pivot_template_id (	RpivotTemplateId-
pivot_user_group_id (	RpivotUserGroupId"�
PackageI
id (	B9�A220Unique system assigned identifier of the package�ARidL

company_id (	B-�A&2$Company id of the associated package�AR	companyId5
name (	B!�A2Name of package template�ARnameJ
description (	B(�A!2Description of package template�ARdescription,
icon (	B�A2Icon to display�ARicon,
color (	B�A2Color of Icon�ARcolorY
alerts (2.kentik.mkp.v202407.AlertB&�A2Alert thresholds and policies�ARalertsm
assets (2.kentik.mkp.v202407.AssetB:�A321Views and Dashboards associated with the package.�ARassets;

is_default	 (B�A2Is default template�AR	isDefaultZ
tenants
 (2.kentik.mkp.v202407.TenantLinkB �A2Tenant link information�ARtenants"M
CustomDimension
	dimension (	R	dimension
	populator (	R	populator"�
Devices
all_devices (R
allDevices!
device_types (	RdeviceTypes#
device_labels (RdeviceLabels!
device_sites (RdeviceSites
device_name (	R
deviceName"o
FilterField!
filter_field (	RfilterField
operator (	Roperator!
filter_value (	RfilterValue"�
Filter
name (	Rname
named (Rnamed
	connector (	R	connector
not (Rnot

auto_added (	R	autoAdded#
saved_filters (	RsavedFilters9
filters (2.kentik.mkp.v202407.FilterFieldRfilters?
filter_groups (2.kentik.mkp.v202407.FilterRfilterGroups
metric	 (	Rmetric"�

TenantH
id (	B8�A12/Unique system assigned identifier of the tenant�ARidL

company_id (	B-�A&2$Company id of the associated package�AR	companyId+
name (	B�A2Name of tenant�ARname@
description (	B�A2Description of tenant�ARdescription&
type (	B�A2	Subtenant�ARtype<
enabled (B"�A2Is tenant actively enable�ARenabledY
alerts (2.kentik.mkp.v202407.AlertB&�A2Alert thresholds and policies�ARalertsk
assets (2.kentik.mkp.v202407.AssetB8�A12/Views and Dashboards associated with the tenant�ARassets+
asn (	B�A2ASN data source.�ARasn.
cidr	 (	B�A2CIDR data source.�ARcidrw
custom_dimensions
 (2#.kentik.mkp.v202407.CustomDimensionB%�A2Custom dimension data source�ARcustomDimensionsS
devices (2.kentik.mkp.v202407.DevicesB�A2Device data source.�ARdevicesS
filters (2.kentik.mkp.v202407.FilterB�A2Data source filters.�ARfiltersF
interface_name (	B�A2Interface data source.�ARinterfaceName9

snmp_alias (	B�A2SNMP data source.�AR	snmpAliasf
packages (2.kentik.mkp.v202407.PackageB-�A&2$Packages associated with the tenant.�ARpackages[
users (2.kentik.user.v202211.UserB*�A#2!Users associated with the tenant.�ARusersT
template_id (	B3�A,2*Package template ID to assign with tenant.�AR
templateId"
ListPackageRequest"s
ListPackageResponse7
packages (2.kentik.mkp.v202407.PackageRpackages#
invalid_count (RinvalidCount"#
GetPackageRequest
id (	Rid"K
GetPackageResponse5
package (2.kentik.mkp.v202407.PackageRpackage"M
CreatePackageRequest5
package (2.kentik.mkp.v202407.PackageRpackage"N
CreatePackageResponse5
package (2.kentik.mkp.v202407.PackageRpackage"M
UpdatePackageRequest5
package (2.kentik.mkp.v202407.PackageRpackage"N
UpdatePackageResponse5
package (2.kentik.mkp.v202407.PackageRpackage"&
DeletePackageRequest
id (	Rid"
DeletePackageResponse"
ListTenantRequest"o
ListTenantResponse4
tenants (2.kentik.mkp.v202407.TenantRtenants#
invalid_count (RinvalidCount""
GetTenantRequest
id (	Rid"G
GetTenantResponse2
tenant (2.kentik.mkp.v202407.TenantRtenant"I
CreateTenantRequest2
tenant (2.kentik.mkp.v202407.TenantRtenant"J
CreateTenantResponse2
tenant (2.kentik.mkp.v202407.TenantRtenant"I
UpdateTenantRequest2
tenant (2.kentik.mkp.v202407.TenantRtenant"J
UpdateTenantResponse2
tenant (2.kentik.mkp.v202407.TenantRtenant"%
DeleteTenantRequest
id (	Rid"
DeleteTenantResponse2�	
PackageService�
ListPackage&.kentik.mkp.v202407.ListPackageRequest'.kentik.mkp.v202407.ListPackageResponse"t�ABList MKP packages.Returns a list of MKP packages.*PackageList��admin.mkp:read���/mkp/v202407/packages�

GetPackage%.kentik.mkp.v202407.GetPackageRequest&.kentik.mkp.v202407.GetPackageResponse"��Ae!Get information aboout a package.4Returns information about package specified with ID.*
PackageGet��admin.mkp:read���/mkp/v202407/packages/{id}�
CreatePackage(.kentik.mkp.v202407.CreatePackageRequest).kentik.mkp.v202407.CreatePackageResponse"��AbCreate a package template.5Create package from request. returns created package.*PackageCreate��admin.mkp:write���"/mkp/v202407/packages:*�
UpdatePackage(.kentik.mkp.v202407.UpdatePackageRequest).kentik.mkp.v202407.UpdatePackageResponse"��APUpdate a package.,Update package attributes specified with id.*PackageUpdate��admin.mkp:write���'"/mkp/v202407/packages/{package.id}:*�
DeletePackage(.kentik.mkp.v202407.DeletePackageRequest).kentik.mkp.v202407.DeletePackageResponse"��AJDelete a package.&Deletes the package specified with id.*PackageDelete��admin.mkp:write���*/mkp/v202407/packages/{id}&�Amkp.api.kentik.com��	admin.mkp��2�	
TenantService�

ListTenant%.kentik.mkp.v202407.ListTenantRequest&.kentik.mkp.v202407.ListTenantResponse"p�A?List MKP tenants.Returns a list of MKP tenants.*
TenantList��admin.mkp:read���/mkp/v202407/tenants�
	GetTenant$.kentik.mkp.v202407.GetTenantRequest%.kentik.mkp.v202407.GetTenantResponse"��Ac Get information aboout a tenant.4Returns information about package specified with ID.*	TenantGet��admin.mkp:read���/mkp/v202407/tenants/{id}�
CreateTenant'.kentik.mkp.v202407.CreateTenantRequest(.kentik.mkp.v202407.CreateTenantResponse"��AUCreate a tenant.3Create tenant from request. returns created tenant.*TenantCreate��admin.mkp:write���"/mkp/v202407/tenants:*�
UpdateTenant'.kentik.mkp.v202407.UpdateTenantRequest(.kentik.mkp.v202407.UpdateTenantResponse"��AMUpdate a tenant.+Update tenant attributes specified with id.*TenantUpdate��admin.mkp:write���% /mkp/v202407/tenants/{tenant.id}:*�
DeleteTenant'.kentik.mkp.v202407.DeleteTenantRequest(.kentik.mkp.v202407.DeleteTenantResponse"~�AGDelete a tenant.%Deletes the tenant specified with id.*TenantDelete��admin.mkp:write���*/mkp/v202407/tenants/{id}&�Amkp.api.kentik.com��	admin.mkp��B�ZAgithub.com/kentik/api-schema-public/gen/go/kentik/mkp/v202407;mkp�A��
MKP API�# Overview
My Kentik Portal API enables programmatic access to tenants and package templates.
| Endpoint | Purpose |
|-----------|---------|
| TenantService  | CRUD operations for MKP tenants. |
| PackageService | CRUD operations for MKP templates. |

Both REST endpoint and gRPC RPCs are provided.


 # Tenant Attributes and Settings
| Attribute | Access | Purpose |
|-----------|--------|---------|
| id | RO | System-generated unique identifier of the tenant |
| company_id | RO | System-generated unique identifier of the company |
| name | RW | User specified name for the tenant |
| description | RW | User specified description for the tenant |
| type | RO | subtenant |
| enabled | RW | User specified tenant active status |
| cdate | RO | Creation timestamp |
| edate | RO | Last-modification timestamp |
| alerts | RO | Alert policy configurations |
| assets | RW | dashboard, views, and templates associate with tenant |
| asn | RW | ASN data source |
| cidr | RW | CIDR data source |
| custom_dimensions | RW | Custom dimension data source |
| devices | RW | Devices data source |
| filters | RW | Data source filters |
| interface_name | RW | Interface source filters |
| snmp_alias | RW | SNMP source filters |
| packages | RO | Package templates use by the tenant |
| users | RO | Users assign to the tenant |
| template_id | WO | Update tenant's packages setting with package/template id |


 # Package Attributes and Settings
| Attribute | Access | Purpose |
|-----------|--------|---------|
| id | RO | System-generated unique identifier of the package |
| company_id | RO | System-generated unique identifier of the company |
| name | RW | User specified name for the package template |
| description | RW | User specified description for the package template |
| icon | RO | User specified icon |
| color | RW | User specified color of icon |
| alerts | RO | Alert policy configurations |
| assets | RW | dashboard, views, and templates associate with tenant |
| is_default | RW | Default package template to include for new tenant |
| tenants | RO | Tenants using this package template |


"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202407*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ�\
 �
'
 2 My Kentik Portal management


 

 X
	
 X
	
  &
	
 !
	
	 )
	

 8
	
 /
	
 (
	
 n

� n

 q y {{.Name}}



 q

  r

  r

  r

  r

 s

 s

 s	

 s

 t$

 t


 t

 t

 t"#

 u

 u

 u	

 u

 v(

 v


 v

 v#

 v&'

 w

 w

 w

 w

 x

 x

 x	

 x

| � {{.Name}}



|

 }�

 }


  ~

  ~


  ~

  ~

 

 


 

 

 �

 �


 �

 �

 �

�

�

�	

�

� � {{.Name}}


�

 �

 �

 �	

 �

�

�


�

�

�

�

�	

�

�$

�


�

�

�"#

�&

�


�

�!

�$%

�9

�


�

�4

�78

�"

�

�

� !

�'

�

�"

�%&

�*

�

�%

�()

� � {{.Name}}


�

 �

 �

 �	

 �

�

�

�	

�

�!

�

�	

� 

�"

�

�	

� !

� � {{.Name}}


�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

� � {{.Name}}


�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�!

�

�

� 

�#

�

�	

�!"

�#

�

�	

�!"

�$

�

�	

�"#

	�$

	�

	�	

	�"#


�$


�


�


�!#

� � {{.Name}}


�

 �

 �

 �	

 �

� � {{.Name}}


�

 �

 �

 �	

 �

�

�

�	

�

�!

�

�	

� 

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�


�

�

�

��

� �-

���

��

�

�

�

��

� �-

���

��

�

�

�

��

� �-

���

	��

	�


	�

	�

	� "

	�#�

	� �-

	���

	� � {{.Name}}


	�

	 �

	 �

	 �	

	 �

	�

	�

	�	

	�


� � {{.Name}}



�


 �


 �


 �


 �


�#


�



�


�


�!"


�$


�



�


�


�"#


�#


�



�


�


�!"


�"


�



�


�


� !

� � {{.Name}}


�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

� � {{.Name}}


�

 �

 �

 �	

 �

�

�

�

�

�

�

�	

�

�

�

�


�

�

�

�	

�

�$

�


�

�

�"#

�#

�


�

�

�!"

�$

�


�

�

�"#

�

�


�

�

�

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�

�

��

� �-

���

�� config object


�


�

�

�

��

� �-

���

��

�

�

�

��

� �-

���

��

�

�	

�

��

� �-

���

	��

	�

	�	

	�

	��

	� �-

	���


��


�



�


�,


�/1


�2�


� �-


���

��

�	

�


�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�


�

�

� 

�!�

� �-

���

��

�


�#

�$)

�,.

�/�

� �-

���

��

�

�	

�

��

� �-

���

�  {{.Name}}


�

� � {{.Name}}


�

 � 

 �


 �

 �

 �
T
�F The number of invalid packages, for troubleshooting. Should be zero.


�

�	

�

� � {{.Name}}


�

 �

 �

 �	

 �

� � {{.Name}}


�

 �

 �	

 �


 �

� � {{.Name}}


�

 �

 �	

 �


 �

� � {{.Name}}


�

 �

 �	

 �


 �

� � {{.Name}}


�

 �

 �	

 �


 �

� � {{.Name}}


�

 �

 �	

 �


 �

� � {{.Name}}


�

 �

 �

 �	

 �

�   {{.Name}}


�

 � �

 �

 �:

 ��:

 �F

 �+�F

 �;

 �*�;

  ��

  �

  �$

  �/B

  �A

  �*�A

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �"

 �-?

 �A

 �*�A

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���

�  {{.Name}}


�

� � {{.Name}}


�

 �

 �


 �

 �

 �

�

�

�	

�

� � {{.Name}}


�

 �

 �

 �	

 �

� � {{.Name}}


�

 �

 �

 �	

 �

� � {{.Name}}


�

 �

 �

 �	

 �

� � {{.Name}}


�

 �

 �

 �	

 �

� � {{.Name}}


�

 �

 �

 �	

 �

� � {{.Name}}


�

 �

 �

 �	

 �

 � � {{.Name}}


 �

  �

  �

  �	

  �

!�  {{.Name}}


!�

� �

�

�:

��:

�F

�+�F

�;

�*�;

 ��

 �

 �"

 �-?

 �A

 �*�A

 ��

	 �ʼ"��

 ��

 ���

��

�

� 

�+<

�A

�*�A

��

	�ʼ"��

��

���

��

�

�&

�1E

�B

�*�B

��

	�ʼ"��

��

���

��

�

�&

�1E

�B

�*�B

��

	�ʼ"��

��

���

��

�

�&

�1E

�B

�*�B

��

	�ʼ"��

��

���bproto3��  
�
6kentik/network_class/v202109alpha1/network_class.proto"kentik.network_class.v202109alpha1google/api/annotations.protogoogle/api/client.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"j
CloudSubnetA
type (2-.kentik.network_class.v202109alpha1.CloudTypeRtype
subnets (	Rsubnets"�
NetworkClass#
internal_asns (	RinternalAsns!
internal_ips (	RinternalIps(
use_private_asns (RusePrivateAsns.
use_private_subnets (RusePrivateSubnetsT
cloud_subnets (2/.kentik.network_class.v202109alpha1.CloudSubnetRcloudSubnets"
GetNetworkClassRequest"p
GetNetworkClassResponseU
network_class (20.kentik.network_class.v202109alpha1.NetworkClassRnetworkClass"r
UpdateNetworkClassRequestU
network_class (20.kentik.network_class.v202109alpha1.NetworkClassRnetworkClass"s
UpdateNetworkClassResponseU
network_class (20.kentik.network_class.v202109alpha1.NetworkClassRnetworkClass*y
	CloudType
CLOUD_TYPE_UNSPECIFIED 
CLOUD_TYPE_AWS
CLOUD_TYPE_AZURE
CLOUD_TYPE_GCE
CLOUD_TYPE_IBM2�
NetworkClassService�
GetNetworkClass:.kentik.network_class.v202109alpha1.GetNetworkClassRequest;.kentik.network_class.v202109alpha1.GetNetworkClassResponse"��AuGet a network classification.CReturns information about a network classification for the company.*NetworkClassGet��admin.network_class:read���,*/network_class/v202109alpha1/network_class�
UpdateNetworkClass=.kentik.network_class.v202109alpha1.UpdateNetworkClassRequest>.kentik.network_class.v202109alpha1.UpdateNetworkClassResponse"��A~ Update a network classification.FReplaces the entire network classification attributes for the company.*NetworkClassUpdate��admin.network_class:write���/"*/network_class/v202109alpha1/network_class:*1�Agrpc.api.kentik.com��admin.network_class��B�Z[github.com/kentik/api-schema-public/gen/go/kentik/network_class/v202109alpha1;network_class�A�D
Network Classification API"
Kentik API Engineering2202109alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ�
  �

  

 +

 r
	
 r
	
  &
	
 !
	
 8
	
 /
	
 6

� 6


 8 >


 8

  9

  9

  9

 :

 :

 :

 ;

 ;

 ;

 <

 <

 <

 =

 =

 =


 @ E


 @

  B Cloud provider


  B

  B

  B

 D Subnet masks


 D


 D

 D

 D


H S


H

 J$ Internal ASNs


 J


 J

 J

 J"#

L# Internal IPs


L


L

L

L!"
+
N Specify to use internal ASNs


N

N

N
*
P Specify to use internal IPs


P

P

P
.
R)! Cloud provider and subnet info.


R


R

R$

R'(
	
V !


V


W Y


W

 X!

 X

 X

 X 


[ ]


[!

 \!

 \

 \

 \ 


^ `


^"

 _!

 _

 _

 _ 

 c �


 c


 d;

 �d;


 eF

 �+eF


 fE

 �*fE

  is

  i

  i,

  i7N

  jK

  �*jK

  km

	  �ʼ"km

  nr

  �nr

 u�

 u

 u2

 u=W

 vL

 �*vL

 wz

	 �ʼ"wz

 {

 �{bproto3��  
�#
Dkentik/notification_channel/v202204alpha1/notification_channel.proto)kentik.notification_channel.v202204alpha1google/api/annotations.protogoogle/api/client.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.protogoogle/protobuf/timestamp.proto"�
NotificationChannel
id (	Rid
name (	RnameJ
type (26.kentik.notification_channel.v202204alpha1.ChannelTypeRtype
status (	Rstatus0
cdate (2.google.protobuf.TimestampRcdate0
edate (2.google.protobuf.TimestampRedate"!
ListNotificationChannelsRequest"�
 ListNotificationChannelsResponses
notification_channels (2>.kentik.notification_channel.v202204alpha1.NotificationChannelRnotificationChannels#
invalid_count (RinvalidCount"/
GetNotificationChannelRequest
id (	Rid"�
GetNotificationChannelResponseq
notification_channel (2>.kentik.notification_channel.v202204alpha1.NotificationChannelRnotificationChannel*�
ChannelType
CHANNEL_TYPE_UNSPECIFIED 
CHANNEL_TYPE_XMATTERS
CHANNEL_TYPE_SLACK
CHANNEL_TYPE_SERVICENOW
CHANNEL_TYPE_SYSLOG
CHANNEL_TYPE_OPSGENIE
CHANNEL_TYPE_CUSTOM_WEBHOOK
CHANNEL_TYPE_SPLUNK
CHANNEL_TYPE_MSTEAMS
CHANNEL_TYPE_JSON	
CHANNEL_TYPE_EMAIL

CHANNEL_TYPE_VICTOROPS
CHANNEL_TYPE_PAGERDUTY2�
NotificationChannelService�
ListNotificationChannelsJ.kentik.notification_channel.v202204alpha1.ListNotificationChannelsRequestK.kentik.notification_channel.v202204alpha1.ListNotificationChannelsResponse"��A{!Fetch Search NotificationChannels<Return list of notification_channels matches search critera.*ListNotificationChannels��admin.notification_channel:read���;9/notification_channel/v202204alpha1/notification_channels�
GetNotificationChannelH.kentik.notification_channel.v202204alpha1.GetNotificationChannelRequestI.kentik.notification_channel.v202204alpha1.GetNotificationChannelResponse"��A�)Get information about NotificationChannelAReturns information about notification_channel specified with ID.*GetNotificationChannel��admin.notification_channel:read���@>/notification_channel/v202204alpha1/notification_channels/{id}8�Agrpc.api.kentik.com��admin.notification_channel��B�Zigithub.com/kentik/api-schema-public/gen/go/kentik/notification_channel/v202204alpha1;notification_channel�A��
NotificationChannel APIK--- This API has been deprecated and will be removed in the near future ---"
Kentik API Engineering2202204alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�
  �

  

 2
	
 �


 �
	
  &
	
 !
	
 8
	
 /
	
	 )
	
 8

� 8


 : H


 :

  ;

  ;

  ;

 <

 <

 <

 =

 =

 =

 >

 >

 >

 ?

 ?

 ?

 @

 @

 @

 A"

 A

 A !

 B

 B

 B

 C

 C

 C

 	D

 	D

 	D

 
E

 
E

 
E

 F

 F

 F

 G

 G

 G


 J S


 J

  K

  K

  K	

  K

 L

 L

 L	

 L

 M

 M

 M

 M

 N

 N

 N	

 N
 
 P& Create timestamp.


 P

 P!

 P$%
 
 R& Update timestamp.


 R

 R!

 R$%


U V


U'


W Z


W(

 X9

 X


 X

 X4

 X78

Y

Y

Y

Y


\ ^


\%

 ]

 ]

 ]	

 ]


_ a


_&

 `/

 `

 `*

 `-.

 c �


 c"


 d;

 �d;


 eF

 �+eF


 fL

 �*fL

  is

  i

  i>

  iIi

  jR

  �*jR

  km

	  �ʼ"km

  nr

  �nr

 u

 u

 u:

 uEc

 vR

 �*vR

 wy

	 �ʼ"wy

 z~

 �z~bproto3��  
�F
>kentik/notification_channel/v202210/notification_channel.proto#kentik.notification_channel.v202210google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.protogoogle/protobuf/timestamp.proto"�
NotificationChannel9
id (	B)�A"2 Unique identifier of the channel�ARid>
name (	B*�A#2!User selected name of the channel�ARnameh
type (20.kentik.notification_channel.v202210.ChannelTypeB"�A2Notification channel type�ARtype8
enabled (B�A2Administrative status�ARenabledS
cdate (2.google.protobuf.TimestampB!�A2Creation timestamp (UTC)�ARcdate\
edate (2.google.protobuf.TimestampB*�A#2!Last modification timestamp (UTC)�ARedate"!
ListNotificationChannelsRequest"�
 ListNotificationChannelsResponse�
notification_channels (28.kentik.notification_channel.v202210.NotificationChannelB&�A2List of notification channels�ARnotificationChannels�
invalid_count (B]�AV2TNumber of invalid entries that were not included in the list (should be always zero)�ARinvalidCount"M
GetNotificationChannelRequest,
id (	B�A2Request channel ID.�ARid"�
GetNotificationChannelResponse�
notification_channel (28.kentik.notification_channel.v202210.NotificationChannelB(�A!2Data for the requested channel.�ARnotificationChannel"�
!SearchNotificationChannelsRequest�
name_pattern (	B��A�2�Regular expression pattern for matching the name attribute of channels. Empty string matches any name, otherwise the regular expression must consume all characters in the channel name.RnamePattern�
types (20.kentik.notification_channel.v202210.ChannelTypeBS�AP2NList of ChannelType enum values to match. Empty list matches any channel type.Rtypes\
include_disabled (B1�A.2%Include disabled channels in results.:falseRincludeDisabled"�
"SearchNotificationChannelsResponse�
notification_channels (28.kentik.notification_channel.v202210.NotificationChannelB0�A)2'List of matching notification channels.�ARnotificationChannels�
invalid_count (B]�AV2TNumber of invalid entries that were not included in the list (should be always zero)�ARinvalidCount*�
ChannelType
CHANNEL_TYPE_UNSPECIFIED 
CHANNEL_TYPE_XMATTERS
CHANNEL_TYPE_SLACK
CHANNEL_TYPE_SERVICENOW
CHANNEL_TYPE_SYSLOG
CHANNEL_TYPE_OPSGENIE
CHANNEL_TYPE_CUSTOM_WEBHOOK
CHANNEL_TYPE_SPLUNK
CHANNEL_TYPE_MSTEAMS
CHANNEL_TYPE_JSON	
CHANNEL_TYPE_EMAIL

CHANNEL_TYPE_VICTOROPS
CHANNEL_TYPE_PAGERDUTY2�
NotificationChannelService�
ListNotificationChannelsD.kentik.notification_channel.v202210.ListNotificationChannelsRequestE.kentik.notification_channel.v202210.ListNotificationChannelsResponse"��Aw$List available notification channels5Returns list of all configured notification channels.*ListNotificationChannels��admin.notification_channel:read���53/notification_channel/v202210/notification_channels�
GetNotificationChannelB.kentik.notification_channel.v202210.GetNotificationChannelRequestC.kentik.notification_channel.v202210.GetNotificationChannelResponse"��A�,Get information about a notification channelBReturns information about a notification channel with specific ID.*GetNotificationChannel��admin.notification_channel:read���:8/notification_channel/v202210/notification_channels/{id}�
SearchNotificationChannelsF.kentik.notification_channel.v202210.SearchNotificationChannelsRequestG.kentik.notification_channel.v202210.SearchNotificationChannelsResponse"��A�1Retrieve notification channels matching criteria.�Returns list of all notification channels matching request criteria. Match criteria are treated as a logical AND, i.e. all provided criteria must match in order for an entry to be included in the response.*SearchNotificationChannels��admin.notification_channel:read���?":/notification_channel/v202210/notification_channels/search:*8�Agrpc.api.kentik.com��admin.notification_channel��B�
Zcgithub.com/kentik/api-schema-public/gen/go/kentik/notification_channel/v202210;notification_channel�A�	�
Notification Channel API�# Overview
The Notification Channel APIs enable you to retrieve IDs for the channels in your organization's collection of notification channels (see [Notifications](https://kb.kentik.com/v4/Cb24.htm)). Each channel includes a channel type (e.g. email, Slack, PagerDuty, etc.) and a set of targets (recipients). Using the ID of a given channel, you can assign a set of recipients to receive notifications from Kentik alerts and synthetic tests, including those generated by the [Synthetics Monitoring APIs](https://kb.kentik.com/v0/Oa09.htm) and [BGP Monitoring APIs](https://kb.kentik.com/v0/Oa07.htm).

Both REST endpoints and gRPC RPCs are provided.
# Limitations
The use of this API is currently subject to the following limitations:
* **Read-only**: Creation, modification, and deletion of channels is not supported.
* **No v3 channels**: No support is (or will be) provided for notification channels created in Kentik's v3 portal.
"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202210*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ�
  �

  

 ,

 z
	
 z
	
  &
	
 !
	
 )
	
 8
	
	 /
	

 )
	
 F

� F

 I d {{.Name}}



 I

  K Invalid value.


  K

  K
 
 M XMATTERS platform


 M

 M

 O Slack channel


 O

 O
"
 Q ServiceNow platform


 Q

 Q

 S Syslog server


 S

 S
!
 U Atlassian Opsgenie


 U

 U
"
 W" Custom REST webhook


 W

 W !

 Y Splunk platform


 Y

 Y
&
 [ Microsoft Teams channel


 [

 [
(
 	] webhook with JSON payload


 	]

 	]

 
_ E-mail


 
_

 
_
2
 a% Splunk On-Call (formerly VictorOps)


 a

 a
!
 c Pagerduty platform


 c

 c

 g � {{.Name}}



 g

  hm

  h

  h	

  h

  hm

  � i-

  �jl

 ns

 n

 n	

 n

 ns

 � o-

 �pr

 ty

 t

 t

 t

 ty

 � u-

 �vx

 z

 z

 z

 z

 z

 � {-

 �|~

 ��

 �

 �!

 �$%

 �&�

 � �-

 ���

 ��

 �

 �!

 �$%

 �&�

 � �-

 ���

� * {{.Name}}


�'

� � {{.Name}}


�(

 ��

 �


 �

 �4

 �78

 �9�

 � �-

 ���

��

�

�

�

��

� �-

���

� � {{.Name}}


�%

 ��

 �

 �	

 �

 ��

 � �-

 ���

� � {{.Name}}


�&

 ��

 �

 �*

 �-.

 �/�

 � �-

 ���

� � {{.Name}}


�)

 ��

 �	

 �


 �

 ��

 ���

��

�


�

�

� 

�!�

���

��

�

�

�

��

���

� � {{.Name}}


�*

 ��

 �


 �

 �4

 �78

 �9�

 � �-

 ���

��

�

�

�

��

� �-

���

 � �

 �"

 �;

 ��;

 �F

 �+�F

 �L

 �*�L

  ��

  �

  �>

  �Ii

  �R

  �*�R

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �:

 �Ec

 �R

 �*�R

 ��

	 �ʼ"��

 ��

 ���

 ��

 � 

 �!B

 �Mo

 �R

 �*�R

 ��

	 �ʼ"��

 ��

 ���bproto3��  
�
google/type/latlng.protogoogle.type"B
LatLng
latitude (Rlatitude
	longitude (R	longitudeBc
com.google.typeBLatLngProtoPZ8google.golang.org/genproto/googleapis/type/latlng;latlng��GTPJ�

 $
�
 2� Copyright 2021 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 

 
	
 

 O
	
 O

 "
	

 "

 ,
	
 ,

 (
	
 (

 !
	
$ !
�
  $� An object that represents a latitude/longitude pair. This is expressed as a
 pair of doubles to represent degrees latitude and degrees longitude. Unless
 specified otherwise, this must conform to the
 <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
 standard</a>. Values must be within normalized ranges.



 
O
   B The latitude in degrees. It must be in the range [-90.0, +90.0].


   

   	

   
R
 #E The longitude in degrees. It must be in the range [-180.0, +180.0].


 #

 #	

 #bproto3�� 
�4
 google/type/postal_address.protogoogle.type"�
PostalAddress
revision (Rrevision
region_code (	R
regionCode#
language_code (	RlanguageCode
postal_code (	R
postalCode!
sorting_code (	RsortingCode/
administrative_area (	RadministrativeArea
locality (	Rlocality 
sublocality (	Rsublocality#
address_lines	 (	RaddressLines

recipients
 (	R
recipients"
organization (	RorganizationBx
com.google.typeBPostalAddressProtoPZFgoogle.golang.org/genproto/googleapis/type/postaladdress;postaladdress��GTPJ�/
 �
�
 2� Copyright 2021 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 

 
	
 

 ]
	
 ]

 "
	

 "

 3
	
 3

 (
	
 (

 !
	
$ !
�
 * �� Represents a postal address, e.g. for postal delivery or payments addresses.
 Given a postal address, a postal service can deliver items to a premise, P.O.
 Box or similar.
 It is not intended to model geographical locations (roads, towns,
 mountains).

 In typical usage an address would be created via user input or from importing
 existing data, depending on the type of process.

 Advice on address input / editing:
  - Use an i18n-ready address widget such as
    https://github.com/google/libaddressinput)
 - Users should not be presented with UI elements for input or editing of
   fields outside countries where that field is used.

 For more guidance on how to use this schema, please see:
 https://support.google.com/business/answer/6397478



 *
�
  /� The schema revision of the `PostalAddress`. This must be set to 0, which is
 the latest revision.

 All new revisions **must** be backward compatible with old revisions.


  /

  /

  /
�
 6� Required. CLDR region code of the country/region of the address. This
 is never inferred and it is up to the user to ensure the value is
 correct. See http://cldr.unicode.org/ and
 http://www.unicode.org/cldr/charts/30/supplemental/territory_information.html
 for details. Example: "CH" for Switzerland.


 6

 6	

 6
�
 D� Optional. BCP-47 language code of the contents of this address (if
 known). This is often the UI language of the input form or is expected
 to match one of the languages used in the address' country/region, or their
 transliterated equivalents.
 This can affect formatting in certain countries, but is not critical
 to the correctness of the data and will never affect any validation or
 other non-formatting related operations.

 If this value is not known, it should be omitted (rather than specifying a
 possibly incorrect default).

 Examples: "zh-Hant", "ja", "ja-Latn", "en".


 D

 D	

 D
�
 J� Optional. Postal code of the address. Not all countries use or require
 postal codes to be present, but where they are used, they may trigger
 additional validation with other parts of the address (e.g. state/zip
 validation in the U.S.A.).


 J

 J	

 J
�
 Q� Optional. Additional, country-specific, sorting code. This is not used
 in most regions. Where it is used, the value is either a string like
 "CEDEX", optionally followed by a number (e.g. "CEDEX 7"), or just a number
 alone, representing the "sector code" (Jamaica), "delivery area indicator"
 (Malawi) or "post office indicator" (e.g. Côte d'Ivoire).


 Q

 Q	

 Q
�
 Z!� Optional. Highest administrative subdivision which is used for postal
 addresses of a country or region.
 For example, this can be a state, a province, an oblast, or a prefecture.
 Specifically, for Spain this is the province and not the autonomous
 community (e.g. "Barcelona" and not "Catalonia").
 Many countries don't use an administrative area in postal addresses. E.g.
 in Switzerland this should be left unpopulated.


 Z

 Z	

 Z 
�
 `� Optional. Generally refers to the city/town portion of the address.
 Examples: US city, IT comune, UK post town.
 In regions of the world where localities are not well defined or do not fit
 into this structure well, leave locality empty and use address_lines.


 `

 `	

 `
r
 de Optional. Sublocality of the address.
 For example, this can be neighborhoods, boroughs, districts.


 d

 d	

 d
�	
 |$�	 Unstructured address lines describing the lower levels of an address.

 Because values in address_lines do not have type information and may
 sometimes contain multiple values in a single field (e.g.
 "Austin, TX"), it is important that the line order is clear. The order of
 address lines should be "envelope order" for the country/region of the
 address. In places where this can vary (e.g. Japan), address_language is
 used to make it explicit (e.g. "ja" for large-to-small ordering and
 "ja-Latn" or "en" for small-to-large). This way, the most specific line of
 an address can be selected based on the language.

 The minimum permitted structural representation of an address consists
 of a region_code with all remaining information placed in the
 address_lines. It would be possible to format such an address very
 approximately without geocoding, but no semantic reasoning could be
 made about any of the address components until it was at least
 partially resolved.

 Creating an address only containing a region_code and address_lines, and
 then geocoding is the recommended way to handle completely unstructured
 addresses (as opposed to guessing which parts of the address should be
 localities or administrative areas).


 |


 |

 |

 |"#
�
 	�"� Optional. The recipient at the address.
 This field may, under certain circumstances, contain multiline information.
 For example, it might contain "care of" information.


 	�


 	�

 	�

 	�!
F
 
�8 Optional. The name of the organization at the address.


 
�

 
�	

 
�bproto3�� 
�3
$kentik/site/v202106alpha1/site.protokentik.site.v202106alpha1google/api/annotations.protogoogle/api/client.protogoogle/type/latlng.proto google/type/postal_address.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"�
SiteIpClassification7
infrastructure_networks (	RinfrastructureNetworks0
user_access_networks (	RuserAccessNetworks
	other_ips (	RotherIps"=
SubLayer
name (	Rname

device_ids (	R	deviceIds"K
LayerB

sub_layers (2#.kentik.site.v202106alpha1.SubLayerR	subLayers"�
Site
id (	Rid
title (	Rtitle3

coordinate (2.google.type.LatLngR
coordinate4
address (2.google.type.PostalAddressRaddress7
type (2#.kentik.site.v202106alpha1.SiteTypeRtypeW
classification (2/.kentik.site.v202106alpha1.SiteIpClassificationRclassificationD
architecture (2 .kentik.site.v202106alpha1.LayerRarchitectureJ"
ListSiteRequest"n
ListSiteResponse5
sites (2.kentik.site.v202106alpha1.SiteRsites#
invalid_count (RinvalidCount" 
GetSiteRequest
id (	Rid"F
GetSiteResponse3
site (2.kentik.site.v202106alpha1.SiteRsite"H
CreateSiteRequest3
site (2.kentik.site.v202106alpha1.SiteRsite"I
CreateSiteResponse3
site (2.kentik.site.v202106alpha1.SiteRsite"H
UpdateSiteRequest3
site (2.kentik.site.v202106alpha1.SiteRsite"I
UpdateSiteResponse3
site (2.kentik.site.v202106alpha1.SiteRsite"#
DeleteSiteRequest
id (	Rid"
DeleteSiteResponse*�
SiteType
SITE_TYPE_UNSPECIFIED 
SITE_TYPE_DATA_CENTER
SITE_TYPE_CLOUD
SITE_TYPE_BRANCH
SITE_TYPE_CONNECTIVITY
SITE_TYPE_CUSTOMER
SITE_TYPE_OTHER2�	
SiteService�
ListSite*.kentik.site.v202106alpha1.ListSiteRequest+.kentik.site.v202106alpha1.ListSiteResponse"h�A1List sites.Returns a list of sites.*SiteList��admin.site:read���/site/v202106alpha1/sites�
GetSite).kentik.site.v202106alpha1.GetSiteRequest*.kentik.site.v202106alpha1.GetSiteResponse"��AKGet a site.3Returns information about a site specified with ID.*SiteGet��admin.site:read��� /site/v202106alpha1/sites/{id}�

CreateSite,.kentik.site.v202106alpha1.CreateSiteRequest-.kentik.site.v202106alpha1.CreateSiteResponse"��AJCreate a site.,Create a site from request. returns created.*
SiteCreate��admin.site:write���"/site/v202106alpha1/sites:*�

UpdateSite,.kentik.site.v202106alpha1.UpdateSiteRequest-.kentik.site.v202106alpha1.UpdateSiteResponse"��ATUpdate a site.6Replaces the entire site attributes specified with id.*
SiteUpdate��admin.site:write���(#/site/v202106alpha1/sites/{site.id}:*�

DeleteSite,.kentik.site.v202106alpha1.DeleteSiteRequest-.kentik.site.v202106alpha1.DeleteSiteResponse"~�AADelete a site.#Deletes the site specified with id.*
SiteDelete��admin.site:write��� */site/v202106alpha1/sites/{id}(�Agrpc.api.kentik.com��
admin.site��B�ZIgithub.com/kentik/api-schema-public/gen/go/kentik/site/v202106alpha1;site�A�
Site APIK--- This API has been deprecated and will be removed in the near future ---"
Kentik API Engineering2202106alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�
  �

  

 "

 `
	
 `
	
  &
	
 !
	
 "
	
 *
	
	 8
	

 /
	
 8

� 8


 : B


 :

  ;

  ;

  ;

 <

 <

 <

 =

 =

 =

 >

 >

 >

 ?

 ?

 ?

 @

 @

 @

 A

 A

 A
$
 E I Site IP Classification



 E

  F.

  F


  F

  F)

  F,-

 G+

 G


 G

 G&

 G)*

 H 

 H


 H

 H

 H


K N


K

 L

 L

 L	

 L

M!

M


M

M

M 


P R


P

 Q#

 Q


 Q

 Q

 Q!"


T ]


T

 U

 U

 U	

 U


	V

	 V

	 V

W

W

W	

W

X$

X

X

X"#

Y(

Y

Y#

Y&'

Z

Z


Z

Z

[*

[

[%

[()

\"

\


\

\

\ !
	
_ 


_


` c


`

 a

 a


 a

 a

 a

b

b

b	

b


e g


e

 f

 f

 f	

 f


h j


h

 i

 i

 i

 i


l n


l

 m

 m

 m

 m


	o q


	o

	 p

	 p

	 p

	 p



s u



s


 t


 t


 t


 t


v x


v

 w

 w

 w

 w


z |


z

 {

 {

 {	

 {
	
} 


}

 � �

 �

 �;

 ��;

 �F

 �+�F

 �<

 �*�<

  ��

  �

  �

  �)9

  �B

  �*�B

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �

 �'6

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �"

 �-?

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �"

 �-?

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �"

 �-?

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���bproto3��  
��
kentik/site/v202211/site.protokentik.site.v202211google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"�
SiteIpAddressClassification�
infrastructure_networks (	B\�AY2WList of IP address prefixes (in standard CIDR notation) used in infrastructure networksRinfrastructureNetworks�
user_access_networks (	BT�AQ2OList of IP address prefixes (in standard CIDR notation) used in access networksRuserAccessNetworksz
other_networks (	BS�AP2NList of IP address prefixes (in standard CIDR notation) used in other networksRotherNetworks"�
Layer2
name (	B�A2Name of the network layerRnameb

device_ids (	BC�A@2>IDs of devices that are deemed to be part of the network layerR	deviceIds"d
LayerSetX
layers (2.kentik.site.v202211.LayerB$�A!2List of parallel network layersRlayers"�
PostalAddress1
address (	B�A2Street address�ARaddress-
city (	B�A2City (full name)�ARcity0
region (	B�A2Geographical regionRregionB
postal_code (	B!�A2Country specific postal codeR
postalCodeF
country (	B,�A%2#Country (full name or country code)�ARcountry"�
PeeringDBSiteMapping&
id (	B�A2Peering DB id�ARid4
site_id (	B�A2Peering DB site id�ARsiteIdI
peeringdb_fac_id (	B�A2Peering DB facility id�ARpeeringdbFacId\
edate (2.google.protobuf.TimestampB*�A#2!Last modification timestamp (UTC)�ARedateS
cdate (2.google.protobuf.TimestampB!�A2Creation timestamp (UTC)�ARcdate.

company_id (	B�A2
Company IDR	companyId"�
Site;
id (	B+�A$2"System generated unique identifier�ARid7
title (	B!�A2User selected title/name�ARtitle8
lat (B&�A#2!Latitude (signed decimal degrees)Rlat9
lon (B'�A$2"Longitude (signed decimal degrees)Rlon^
postal_address (2".kentik.site.v202211.PostalAddressB�A2Postal addressRpostalAddressH
type (2.kentik.site.v202211.SiteTypeB�A2Type of site�ARtype�
address_classification (20.kentik.site.v202211.SiteIpAddressClassificationB*�A'2%Classification of site's IP addressesRaddressClassificationm
architecture	 (2.kentik.site.v202211.LayerSetB*�A'2%Logical network topology/architectureRarchitectureR
site_market
 (	B1�A.2,Name of the Site Market this site belongs toR
siteMarket^
peeringdb_site_mapping (	B(�A%2#PeeringDB Mapping of the given siteRpeeringdbSiteMapping"
ListSitesRequest"�
ListSitesResponse_
sites (2.kentik.site.v202211.SiteB.�A+2)List of configurations of requested sitesRsitese
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"C
GetSiteRequest1
id (	B!�A2ID of the requested site�ARid"j
GetSiteResponseW
site (2.kentik.site.v202211.SiteB(�A%2#Configuration of the requested siteRsite"j
CreateSiteRequestU
site (2.kentik.site.v202211.SiteB&�A2Configuration of the new site�ARsite"q
CreateSiteResponse[
site (2.kentik.site.v202211.SiteB,�A)2'Configuration of the newly created siteRsite"�
UpdateSiteRequesto
site (2.kentik.site.v202211.SiteB@�A927New configuration attributes for the site to be updated�ARsite"k
UpdateSiteResponseU
site (2.kentik.site.v202211.SiteB&�A#2!Updated configuration of the siteRsite"J
DeleteSiteRequest5
id (	B%�A2ID of the site to be deleted�ARid"
DeleteSiteResponse"�

SiteMarket;
id (	B+�A$2"System generated unique identifier�ARid6
name (	B"�A2User selected unique name�ARname<
description (	B�A2Free-form descriptionRdescriptionO
number_of_sites (B'�A 2Number of sites in this market�ARnumberOfSitesS
cdate (2.google.protobuf.TimestampB!�A2Creation timestamp (UTC)�ARcdate\
edate (2.google.protobuf.TimestampB*�A#2!Last modification timestamp (UTC)�ARedate"
ListSiteMarketsRequest"�
ListSiteMarketsResponsey
site_markets (2.kentik.site.v202211.SiteMarketB5�A220List of configurations of requested site marketsRsiteMarketse
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"P
GetSiteMarketRequest8
id (	B(�A!2ID of the requested site market�ARid"�
GetSiteMarketResponseq
site_market (2.kentik.site.v202211.SiteMarketB/�A,2*Configuration of the requested site marketR
siteMarket"�
CreateSiteMarketRequesto
site_market (2.kentik.site.v202211.SiteMarketB-�A&2$Configuration of the new site market�AR
siteMarket"�
CreateSiteMarketResponseu
site_market (2.kentik.site.v202211.SiteMarketB3�A02.Configuration of the newly created site marketR
siteMarket"�
UpdateSiteMarketRequest�
site_market (2.kentik.site.v202211.SiteMarketB@�A927New configuration attributes for the site to be updated�AR
siteMarket"�
UpdateSiteMarketResponseo
site_market (2.kentik.site.v202211.SiteMarketB-�A*2(Updated configuration of the site marketR
siteMarket"W
DeleteSiteMarketRequest<
id (	B,�A%2#ID of the site market to be deleted�ARid"
DeleteSiteMarketResponse*�
SiteType
SITE_TYPE_UNSPECIFIED 
SITE_TYPE_DATA_CENTER
SITE_TYPE_CLOUD
SITE_TYPE_BRANCH
SITE_TYPE_CONNECTIVITY
SITE_TYPE_CUSTOMER
SITE_TYPE_OTHER2�
SiteService�
	ListSites%.kentik.site.v202211.ListSitesRequest&.kentik.site.v202211.ListSitesResponse"p�A?List all sites.!Returns list of configured sites.*	ListSites��admin.site:read���/site/v202211/sites�
GetSite#.kentik.site.v202211.GetSiteRequest$.kentik.site.v202211.GetSiteResponse"��A^!Retrieve configuration of a site.0Returns configuration of a site specified by ID.*GetSite��admin.site:read���/site/v202211/sites/{id}�

CreateSite&.kentik.site.v202211.CreateSiteRequest'.kentik.site.v202211.CreateSiteResponse"��ArConfigure a new site.MCreate configuration for a new site. Returns the newly created configuration.*
CreateSite��admin.site:write���"/site/v202211/sites:*�

UpdateSite&.kentik.site.v202211.UpdateSiteRequest'.kentik.site.v202211.UpdateSiteResponse"��A� Updates configuration of a site.cReplaces configuration of a site with attributes in the request. Returns the updated configuration.*
UpdateSite��admin.site:write���"/site/v202211/sites/{site.id}:*�

DeleteSite&.kentik.site.v202211.DeleteSiteRequest'.kentik.site.v202211.DeleteSiteResponse"��A`Delete configuration of a site.1Deletes configuration of a site with specific ID.*
DeleteSite��admin.site:write���*/site/v202211/sites/{id}�
ListSiteMarkets+.kentik.site.v202211.ListSiteMarketsRequest,.kentik.site.v202211.ListSiteMarketsResponse"��ASList all site markets.(Returns list of configured site markets.*ListSiteMarkets��admin.site:read���/site/v202211/site_markets�
GetSiteMarket).kentik.site.v202211.GetSiteMarketRequest*.kentik.site.v202211.GetSiteMarketResponse"��Ar(Retrieve configuration of a site market.7Returns configuration of a site market specified by ID.*GetSiteMarket��admin.site:read���!/site/v202211/site_markets/{id}�
CreateSiteMarket,.kentik.site.v202211.CreateSiteMarketRequest-.kentik.site.v202211.CreateSiteMarketResponse"��A�Configure a new site market.TCreate configuration for a new site market. Returns the newly created configuration.*CreateSiteMarket��admin.site:write���"/site/v202211/site_markets:*�
UpdateSiteMarket,.kentik.site.v202211.UpdateSiteMarketRequest-.kentik.site.v202211.UpdateSiteMarketResponse"��A�'Updates configuration of a site market.jReplaces configuration of a site market with attributes in the request. Returns the updated configuration.*UpdateSiteMarket��admin.site:write���0+/site/v202211/site_markets/{site_market.id}:*�
DeleteSiteMarket,.kentik.site.v202211.DeleteSiteMarketRequest-.kentik.site.v202211.DeleteSiteMarketResponse"��At&Delete configuration of a site market.8Deletes configuration of a site market with specific ID.*DeleteSiteMarket��admin.site:write���!*/site/v202211/site_markets/{id}(�Agrpc.api.kentik.com��
admin.site��B�ZCgithub.com/kentik/api-schema-public/gen/go/kentik/site/v202211;site�A��	
Site Configuration API�# Overview
The Site Configuration API provides programmatic access to configuration of Sites and Site Markets:

* **Site**: A site is a specific user-defined physical location (e.g. a data center at a given address) or logical location at which there is hosting of your devices, services, providers, or partner networks. Information that can be associated with a site includes the classification of IP addresses and the site's logical network topology/architecture.
* **Site Market**: Sites with any common characteristics of your choosing (e.g. all PoPs in a particular region) can be logically grouped into a site market.

Both REST endpoint and gRPC RPCs are provided.

***Notes:*** 
    - Once a site is created in Kentik, you can assign one or more devices to the site via the settings for those devices; to do so programmatically you'd use the v5 Device API (see [Device Create](https://kb.kentik.com/v0/Ec05.htm#Ec05-Device_Create)).
    - Sites can also be managed using the legacy REST-only [Site API](https://kb.kentik.com/v0/Ec10.htm#Ec10-Site_API), which provides access to a subset of site configuration attributes."E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202211*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�G
  �

  

 

 Z
	
 Z
	
  &
	
 !
	
 )
	
 )
	
	 8
	

 /
	
 H

� H

 K Z {{.Name}}



 K

  M Invalid value.


  M

  M
%
 O Data center site type.


 O

 O

 Q Cloud site type.


 Q

 Q
'
 S Branch office site type.


 S

 S
*
 U Connectivity/PoP site type.


 U

 U
*
 W Customer/partner site type.


 W

 W

 Y Other site type.


 Y

 Y

 ] m {{.Name}}



 ]#

  ^b

  ^


  ^

  ^)

  ^,-

  ^.b

  �_a

 cg

 c


 c

 c&

 c)*

 c+g

 �df

 hl

 h


 h

 h 

 h#$

 h%l

 �ik

p { {{.Name}}



p

 qu

 q

 q	

 q

 qu

 �rt

vz

v


v

v

v 

v!z

�wy

~ � {{.Name}}



~

 �

 


 

 

 

 �

 ���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

 � �*

��

�

�	

�

��

���

� �*

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

� �*

� �

�

 ��

 �

 �	

 �

 ��

 ���

 � �*

��

�

�	

�

��

���

� �*

��

�

�	

�

��

���

� �*

��

�

�!

�$%

�&�

� �-

���

��

�

�!

�$%

�&�

� �-

���

��

�

�	

�

��

���
_
� � {{.Name}}
2D Site CRUD
 -------------------------------------------------------


�

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

���

� �*

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�

�!"

�#�

���

��

�


�

�

��

���

� �*

��

�

�4

�78

�9�

���

��

�


�

� 

�#$

�%�

���

��

�

�	

�

��

���

	��

	�

	�	

	�"$

	�%�

	���

�  {{.Name}}


�

� � {{.Name}}


�

 ��

 �


 �

 �

 �

 ��

 ���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

 � �*

	� � {{.Name}}


	�

	 ��

	 �

	 �

	 �

	 ��

	 ���


� � {{.Name}}



�


 ��


 �


 �


 �


 ��


 ���


 � �*

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

 � �*

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

 � �*

�  {{.Name}}


�
e
� � {{.Name}}
2J SiteMarket CRUD
 -------------------------------------------------------


�

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

���

� �*

��

�

�	

�

��

���

��

�

�	

�

��

� �-

���

��

�

�!

�$%

�&�

� �-

���

��

�

�!

�$%

�&�

� �-

���

� ! {{.Name}}


�

� � {{.Name}}


�

 ��

 �


 �

 �"

 �%&

 �'�

 ���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

 � �*

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

 � �*

� � {{.Name}}


� 

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

 � �*

� � {{.Name}}


� 

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

 � �*

� # {{.Name}}


� 
Z
 � �2L services and RPCs
 -------------------------------------------------------


 �

 �;

 ��;

 �F

 �+�F

 �<

 �*�<

  ��2 --- Sites ---


  �

  � 

  �+<

  �B

  �*�B

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �

 �'6

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �"

 �-?

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �"

 �-?

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �"

 �-?

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���
&
 ��2 --- Site Markets ---


 �

 �,

 �7N

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �(

 �3H

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �.

 �9Q

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �.

 �9Q

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���

 	��

 	�

 	�.

 	�9Q

 	�C

 	�*�C

 	��

	 	�ʼ"��

 	��

 	���bproto3��  
��
/kentik/synthetics/v202101beta1/synthetics.protokentik.synthetics.v202101beta1google/api/annotations.protogoogle/api/client.proto google/protobuf/field_mask.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"P
Health
health (	Rhealth.
time (2.google.protobuf.TimestampRtime";
AgentTaskConfig
id (Rid
targets (	Rtargets"�

TestHealth
test_id (	RtestId@
tasks (2*.kentik.synthetics.v202101beta1.TaskHealthRtasksM
overall_health (2&.kentik.synthetics.v202101beta1.HealthRoverallHealthC
	health_ts (2&.kentik.synthetics.v202101beta1.HealthRhealthTs[
agent_task_config (2/.kentik.synthetics.v202101beta1.AgentTaskConfigRagentTaskConfig@
mesh (2,.kentik.synthetics.v202101beta1.MeshResponseRmesh"�

TaskHealth8
task (2$.kentik.synthetics.v202101beta1.TaskRtaskC
agents (2+.kentik.synthetics.v202101beta1.AgentHealthRagentsM
overall_health (2&.kentik.synthetics.v202101beta1.HealthRoverallHealthH
target_agent (2%.kentik.synthetics.v202101beta1.AgentRtargetAgent"�
AgentHealth;
agent (2%.kentik.synthetics.v202101beta1.AgentRagentD
health (2,.kentik.synthetics.v202101beta1.HealthMomentRhealthM
overall_health (2&.kentik.synthetics.v202101beta1.HealthRoverallHealth"�
HealthMoment.
time (2.google.protobuf.TimestampRtime
src_ip (	RsrcIp
dst_ip (	RdstIp
packet_loss (R
packetLoss
avg_latency (R
avgLatency0
avg_weighted_latency (RavgWeightedLatency.
rolling_avg_latency (RrollingAvgLatency4
rolling_stddev_latency (RrollingStddevLatency?
rolling_avg_weighted_latency	 (RrollingAvgWeightedLatency%
latency_health
 (	RlatencyHealth,
packet_loss_health (	RpacketLossHealthM
overall_health (2&.kentik.synthetics.v202101beta1.HealthRoverallHealth

avg_jitter (R	avgJitter,
rolling_avg_jitter (RrollingAvgJitter,
rolling_std_jitter (RrollingStdJitter#
jitter_health (	RjitterHealth
data (	Rdata
size (Rsize
status (Rstatus
	task_type (	RtaskTypec
other_healths (2>.kentik.synthetics.v202101beta1.HealthMoment.OtherHealthsEntryRotherHealths?
OtherHealthsEntry
key (	Rkey
value (	Rvalue:8"�
Agent
id (	Rid
name (	RnameC
status (2+.kentik.synthetics.v202101beta1.AgentStatusRstatus
alias (	Ralias
type (	Rtype
os (	Ros
ip (	Rip
lat (Rlat
long	 (Rlong;
last_authed
 (2.google.protobuf.TimestampR
lastAuthed@
family (2(.kentik.synthetics.v202101beta1.IPFamilyRfamily
asn (Rasn
site_id (	RsiteId
version (	Rversion
	challenge (	R	challenge
city (	Rcity
region (	Rregion
country (	Rcountry
test_ids (	RtestIds
local_ip (	RlocalIp
	cloud_vpc (	RcloudVpcL

agent_impl (2-.kentik.synthetics.v202101beta1.ImplementTypeR	agentImpl"r
PingTaskDefinition
target (	Rtarget
period (Rperiod
expiry (Rexpiry
count (Rcount"s
TraceTaskDefinition
target (	Rtarget
period (Rperiod
expiry (Rexpiry
limit (Rlimit"\
HTTPTaskDefinition
target (	Rtarget
period (Rperiod
expiry (Rexpiry"�
Task
id (	Rid
test_id (	RtestId
	device_id (	RdeviceId?
state (2).kentik.synthetics.v202101beta1.TaskStateRstate
status (	Rstatus@
family (2(.kentik.synthetics.v202101beta1.IPFamilyRfamilyH
ping	 (22.kentik.synthetics.v202101beta1.PingTaskDefinitionH RpingU

traceroute
 (23.kentik.synthetics.v202101beta1.TraceTaskDefinitionH R
tracerouteH
http (22.kentik.synthetics.v202101beta1.HTTPTaskDefinitionH RhttpK
knock (23.kentik.synthetics.v202101beta1.KnockTaskDefinitionH RknockE
dns (21.kentik.synthetics.v202101beta1.DNSTaskDefinitionH RdnsK
shake (23.kentik.synthetics.v202101beta1.ShakeTaskDefinitionH RshakeB

definition"�
KnockTaskDefinition
target (	Rtarget
period (Rperiod
expiry (Rexpiry
count (Rcount
port (Rport"�
DNSTaskDefinition
target (	Rtarget
period (Rperiod
expiry (Rexpiry
count (Rcount
port (Rport
type (	Rtype
resolver (	Rresolver"q
ShakeTaskDefinition
target (	Rtarget
port (Rport
period (Rperiod
expiry (Rexpiry"M
UserInfo
id (	Rid
email (	Remail
	full_name (	RfullName"�
Test
id (	Rid
name (	Rname
type (	Rtype
	device_id (	RdeviceIdB
status (2*.kentik.synthetics.v202101beta1.TestStatusRstatusH
settings (2,.kentik.synthetics.v202101beta1.TestSettingsRsettings9

expires_on (2.google.protobuf.TimestampR	expiresOn0
cdate (2.google.protobuf.TimestampRcdate0
edate	 (2.google.protobuf.TimestampRedateG

created_by
 (2(.kentik.synthetics.v202101beta1.UserInfoR	createdByP
last_updated_by (2(.kentik.synthetics.v202101beta1.UserInfoRlastUpdatedBy"�

HTTPConfig
period (Rperiod
expiry (Rexpiry
method (	RmethodQ
headers (27.kentik.synthetics.v202101beta1.HTTPConfig.HeadersEntryRheaders
body (	Rbody*
ignore_tls_errors (RignoreTlsErrorsa
css_selectors (2<.kentik.synthetics.v202101beta1.HTTPConfig.CssSelectorsEntryRcssSelectors:
HeadersEntry
key (	Rkey
value (	Rvalue:8?
CssSelectorsEntry
key (	Rkey
value (	Rvalue:8"�
TestSettingsJ
hostname (2,.kentik.synthetics.v202101beta1.HostnameTestH Rhostname8
ip (2&.kentik.synthetics.v202101beta1.IpTestH RipA
agent (2).kentik.synthetics.v202101beta1.AgentTestH Ragent>
flow (2(.kentik.synthetics.v202101beta1.FlowTestH Rflow>
site (2(.kentik.synthetics.v202101beta1.SiteTestH Rsite;
tag	 (2'.kentik.synthetics.v202101beta1.TagTestH Rtag;
dns
 (2'.kentik.synthetics.v202101beta1.DnsTestH Rdns;
url (2'.kentik.synthetics.v202101beta1.UrlTestH RurlM
network_grid# (2(.kentik.synthetics.v202101beta1.GridTestH RnetworkGridF
	page_load$ (2'.kentik.synthetics.v202101beta1.UrlTestH RpageLoadH
dns_grid% (2+.kentik.synthetics.v202101beta1.DnsGridTestH RdnsGrid`
application_mesh& (23.kentik.synthetics.v202101beta1.ApplicationMeshTestH RapplicationMesh
	agent_ids (	RagentIds
period (Rperiod
count (Rcount
expiry (Rexpiry
limit (Rlimit
tasks (	RtasksW
health_settings (2..kentik.synthetics.v202101beta1.HealthSettingsRhealthSettingsg
monitoring_settings (26.kentik.synthetics.v202101beta1.TestMonitoringSettingsRmonitoringSettingsD
ping (20.kentik.synthetics.v202101beta1.TestPingSettingsRpingG
trace (21.kentik.synthetics.v202101beta1.TestTraceSettingsRtrace
port (Rport
protocol (	Rprotocol@
family (2(.kentik.synthetics.v202101beta1.IPFamilyRfamily
servers (	Rservers 
use_local_ip (R
useLocalIp

reciprocal  (R
reciprocal!
rollup_level! (RrollupLevel>
http" (2*.kentik.synthetics.v202101beta1.HTTPConfigRhttpB

definition"�
TestTraceSettings
period (Rperiod
count (Rcount
protocol (	Rprotocol
port (Rport
expiry (Rexpiry
limit (Rlimit
delay (Rdelay"n
TestPingSettings
period (Rperiod
count (Rcount
expiry (Rexpiry
delay (Rdelay"�
TestMonitoringSettings6
activation_grace_period (	RactivationGracePeriod0
activation_time_unit (	RactivationTimeUnit4
activation_time_window (	RactivationTimeWindow)
activation_times (	RactivationTimes3
notification_channels (	RnotificationChannels"�
HealthSettings)
latency_critical (RlatencyCritical'
latency_warning (RlatencyWarning0
packet_loss_critical (RpacketLossCritical.
packet_loss_warning (RpacketLossWarning'
jitter_critical (RjitterCritical%
jitter_warning (RjitterWarning2
http_latency_critical (RhttpLatencyCritical0
http_latency_warning (RhttpLatencyWarning(
http_valid_codes	 (RhttpValidCodes&
dns_valid_codes
 (RdnsValidCodes6
latency_critical_stddev (RlatencyCriticalStddev4
latency_warning_stddev (RlatencyWarningStddev4
jitter_critical_stddev (RjitterCriticalStddev2
jitter_warning_stddev (RjitterWarningStddev?
http_latency_critical_stddev (RhttpLatencyCriticalStddev=
http_latency_warning_stddev (RhttpLatencyWarningStddev"&
HostnameTest
target (	Rtarget""
IpTest
targets (	Rtargets"#
	AgentTest
target (	Rtarget"�
FlowTest
target (	RtargetC
target_refresh_interval_millis (RtargetRefreshIntervalMillis
	max_tasks (RmaxTasks
type (	Rtype%
inet_direction (	RinetDirection
	direction (	R	direction""
SiteTest
target (	Rtarget"!
TagTest
target (	Rtarget"`
DnsTest
target (	Rtarget=
type (2).kentik.synthetics.v202101beta1.DNSRecordRtype"!
UrlTest
target (	Rtarget"$
GridTest
targets (	Rtargets"f
DnsGridTest
targets (	Rtargets=
type (2).kentik.synthetics.v202101beta1.DNSRecordRtype"
ApplicationMeshTest"�
MeshResponse
id (	Rid
name (	Rname
local_ip (	RlocalIp
ip (	Rip
alias (	RaliasD
columns (2*.kentik.synthetics.v202101beta1.MeshColumnRcolumns"�

MeshColumn
id (	Rid
name (	Rname
alias (	Ralias
target (	RtargetE
metrics (2+.kentik.synthetics.v202101beta1.MeshMetricsRmetricsC
health (2+.kentik.synthetics.v202101beta1.MeshMetricsRhealth"N

MeshMetric
name (	Rname
health (	Rhealth
value (Rvalue"�
MeshMetrics.
time (2.google.protobuf.TimestampRtimeD
latency (2*.kentik.synthetics.v202101beta1.MeshMetricRlatencyK
packet_loss (2*.kentik.synthetics.v202101beta1.MeshMetricR
packetLossB
jitter (2*.kentik.synthetics.v202101beta1.MeshMetricRjitter")
ASN
id (Rid
name (	Rname"1
Country
code (	Rcode
name (	Rname",
Region
id (Rid
name (	Rname"d
City
id (	Rid
name (	Rname
latitude (Rlatitude
	longitude	 (R	longitude"�
GeoA
country (2'.kentik.synthetics.v202101beta1.CountryRcountry>
region (2&.kentik.synthetics.v202101beta1.RegionRregion8
city (2$.kentik.synthetics.v202101beta1.CityRcity"
DNS
name (	Rname"�
IPInfo
ip (	Rip5
asn (2#.kentik.synthetics.v202101beta1.ASNRasn5
geo (2#.kentik.synthetics.v202101beta1.GeoRgeo5
dns (2#.kentik.synthetics.v202101beta1.DNSRdns
	device_id (	RdeviceId
site_id (	RsiteId
egress (	Regress"(
IDByIP
id (	Rid
ip (	Rip"�
TracerouteLookupK
agent_id_by_ip (2&.kentik.synthetics.v202101beta1.IDByIPRagentIdByIp=
agents (2%.kentik.synthetics.v202101beta1.AgentRagents7
asns (2#.kentik.synthetics.v202101beta1.ASNRasnsM
device_id_by_ip (2&.kentik.synthetics.v202101beta1.IDByIPRdeviceIdByIpI
site_id_by_ip (2&.kentik.synthetics.v202101beta1.IDByIPR
siteIdByIp8
ips (2&.kentik.synthetics.v202101beta1.IPInfoRips"�
TraceHop
ttl (Rttl
ip (	Rip
timeout (Rtimeout
latency (Rlatency0
min_expected_latency (RminExpectedLatency
asn (Rasn
site (Rsite
region (Rregion
target	 (Rtarget
	trace_end
 (RtraceEnd"�

TraceProbe
as_path (RasPath
	completed (R	completed
	hop_count (RhopCount
region_path (	R
regionPath
	site_path (RsitePath<
hops (2(.kentik.synthetics.v202101beta1.TraceHopRhops"�
Trace
agent_id (	RagentId
agent_ip (	RagentIp
	target_ip (	RtargetIp
	hop_count (RhopCountB
probes (2*.kentik.synthetics.v202101beta1.TraceProbeRprobes"I
Stats
average (Raverage
max (Rmax
total (Rtotal"�
TracerouteResult.
time (2.google.protobuf.TimestampRtime=
traces (2%.kentik.synthetics.v202101beta1.TraceRtraces
	hop_count (RhopCount;
count (2%.kentik.synthetics.v202101beta1.StatsRcountA
distance (2%.kentik.synthetics.v202101beta1.StatsRdistance"�
TracerouteInfo9
is_trace_routes_truncated (RisTraceRoutesTruncated+
max_asn_path_count (RmaxAsnPathCount-
max_site_path_count (RmaxSitePathCount1
max_region_path_count (RmaxRegionPathCount"�
GetHealthForTestsRequest
ids (	Rids9

start_time (2.google.protobuf.TimestampR	startTime5
end_time (2.google.protobuf.TimestampRendTime
	agent_ids (	RagentIds
task_ids (	RtaskIds
augment (Raugment"_
GetHealthForTestsResponseB
health (2*.kentik.synthetics.v202101beta1.TestHealthRhealth"�
GetTraceForTestRequest
id (	Rid9

start_time (2.google.protobuf.TimestampR	startTime5
end_time (2.google.protobuf.TimestampRendTime
	agent_ids (	RagentIds

target_ips (	R	targetIps"�
GetTraceForTestResponseJ
lookups (20.kentik.synthetics.v202101beta1.TracerouteLookupRlookupsS
trace_routes (20.kentik.synthetics.v202101beta1.TracerouteResultRtraceRoutesZ
trace_routes_info (2..kentik.synthetics.v202101beta1.TracerouteInfoRtraceRoutesInfo"
ListAgentsRequest"�
ListAgentsResponse=
agents (2%.kentik.synthetics.v202101beta1.AgentRagents0
invalid_agents_count (RinvalidAgentsCount"!
GetAgentRequest
id (	Rid"O
GetAgentResponse;
agent (2%.kentik.synthetics.v202101beta1.AgentRagent"�
PatchAgentRequest;
agent (2%.kentik.synthetics.v202101beta1.AgentRagent.
mask (2.google.protobuf.FieldMaskRmask"Q
PatchAgentResponse;
agent (2%.kentik.synthetics.v202101beta1.AgentRagent"$
DeleteAgentRequest
id (	Rid"
DeleteAgentResponse"*
ListTestsRequest
preset (Rpreset"
ListTestsResponse:
tests (2$.kentik.synthetics.v202101beta1.TestRtests.
invalid_tests_count (RinvalidTestsCount"M
CreateTestRequest8
test (2$.kentik.synthetics.v202101beta1.TestRtest"N
CreateTestResponse8
test (2$.kentik.synthetics.v202101beta1.TestRtest" 
GetTestRequest
id (	Rid"K
GetTestResponse8
test (2$.kentik.synthetics.v202101beta1.TestRtest"j
SetTestStatusRequest
id (	RidB
status (2*.kentik.synthetics.v202101beta1.TestStatusRstatus"
SetTestStatusResponse"|
PatchTestRequest8
test (2$.kentik.synthetics.v202101beta1.TestRtest.
mask (2.google.protobuf.FieldMaskRmask"M
PatchTestResponse8
test (2$.kentik.synthetics.v202101beta1.TestRtest"#
DeleteTestRequest
id (	Rid"
DeleteTestResponse*a
ImplementType
IMPLEMENT_TYPE_UNSPECIFIED 
IMPLEMENT_TYPE_RUST
IMPLEMENT_TYPE_NODE*]
IPFamily
IP_FAMILY_UNSPECIFIED 
IP_FAMILY_V4
IP_FAMILY_V6
IP_FAMILY_DUAL*r

TestStatus
TEST_STATUS_UNSPECIFIED 
TEST_STATUS_ACTIVE
TEST_STATUS_PAUSED
TEST_STATUS_DELETED*q
AgentStatus
AGENT_STATUS_UNSPECIFIED 
AGENT_STATUS_OK
AGENT_STATUS_WAIT
AGENT_STATUS_DELETED*o
	TaskState
TASK_STATE_UNSPECIFIED 
TASK_STATE_CREATED
TASK_STATE_UPDATED
TASK_STATE_DELETED*�
	DNSRecord
DNS_RECORD_UNSPECIFIED 
DNS_RECORD_A
DNS_RECORD_AAAA
DNS_RECORD_CNAME
DNS_RECORD_DNAME
DNS_RECORD_NS
DNS_RECORD_MX
DNS_RECORD_PTR
DNS_RECORD_SOA2�
SyntheticsDataService�
GetHealthForTests8.kentik.synthetics.v202101beta1.GetHealthForTestsRequest9.kentik.synthetics.v202101beta1.GetHealthForTestsResponse"��A�&Get health status for synthetics test.MGet synthetics health test for login user. Also returns mesh data on request.*GetHealthForTests��synthetics:read���*"%/synthetics/v202101beta1/health/tests:*�
GetTraceForTest6.kentik.synthetics.v202101beta1.GetTraceForTestRequest7.kentik.synthetics.v202101beta1.GetTraceForTestResponse"��AXGet trace route data..Get trace route data for the specific test id.*GetTraceForTest��synthetics:read���6"1/synthetics/v202101beta1/tests/{id}/results/trace:*.�Asynthetics.api.kentik.com��
synthetics��2�
SyntheticsAdminService�

ListAgents1.kentik.synthetics.v202101beta1.ListAgentsRequest2.kentik.synthetics.v202101beta1.ListAgentsResponse"x�A5List Agents.Returns a list of agents.*
AgentsList��admin.synthetics:read���!/synthetics/v202101beta1/agents�
GetAgent/.kentik.synthetics.v202101beta1.GetAgentRequest0.kentik.synthetics.v202101beta1.GetAgentResponse"��AcGet information about an agent.6Returns information about the agent specified with id.*AgentGet��admin.synthetics:read���&$/synthetics/v202101beta1/agents/{id}�

PatchAgent1.kentik.synthetics.v202101beta1.PatchAgentRequest2.kentik.synthetics.v202101beta1.PatchAgentResponse"��ArPatch an agent.SPartially Updates the attributes of agent specified with id and update_mask fields.*
AgentPatch��admin.synthetics:write���/2*/synthetics/v202101beta1/agents/{agent.id}:*�
DeleteAgent2.kentik.synthetics.v202101beta1.DeleteAgentRequest3.kentik.synthetics.v202101beta1.DeleteAgentResponse"��AEDelete an agent.$Deletes the agent specified with id.*AgentDelete��admin.synthetics:write���&*$/synthetics/v202101beta1/agents/{id}�
	ListTests0.kentik.synthetics.v202101beta1.ListTestsRequest1.kentik.synthetics.v202101beta1.ListTestsResponse"��AHList Synthetics Tests.#Returns a list of syntehtics tests.*	TestsList��admin.synthetics:read��� /synthetics/v202101beta1/tests�

CreateTest1.kentik.synthetics.v202101beta1.CreateTestRequest2.kentik.synthetics.v202101beta1.CreateTestResponse"��AaCreate Synthetics Test.:Create synthetics test from request. Returns created test.*
TestCreate��admin.synthetics:write���#"/synthetics/v202101beta1/tests:*�
GetTest..kentik.synthetics.v202101beta1.GetTestRequest/.kentik.synthetics.v202101beta1.GetTestResponse"��At&Get information about Synthetics Test.AReturns information about synthetics test specified with test ID.*TestGet��admin.synthetics:read���%#/synthetics/v202101beta1/tests/{id}�
SetTestStatus4.kentik.synthetics.v202101beta1.SetTestStatusRequest5.kentik.synthetics.v202101beta1.SetTestStatusResponse"��AGUpdate a test status.Update the status of a test.*TestStatusUpdate��admin.synthetics:write���/*/synthetics/v202101beta1/tests/{id}/status:*�
	PatchTest0.kentik.synthetics.v202101beta1.PatchTestRequest1.kentik.synthetics.v202101beta1.PatchTestResponse"��A�Patch a Synthetics Test.]Partially Updates the attributes of synthetics test specified with id and update_mask fields.*	TestPatch��admin.synthetics:write���-2(/synthetics/v202101beta1/tests/{test.id}:*�

DeleteTest1.kentik.synthetics.v202101beta1.DeleteTestRequest2.kentik.synthetics.v202101beta1.DeleteTestResponse"��AXDelete an Synthetics Test..Deletes the synthetics test specified with id.*
TestDelete��admin.synthetics:write���%*#/synthetics/v202101beta1/tests/{id}4�Asynthetics.api.kentik.com��admin.synthetics��B�ZTgithub.com/kentik/api-schema-public/gen/go/kentik/synthetics/v202101beta1;synthetics�A��
Synthetics Monitoring APIK--- This API has been deprecated and will be removed in the near future ---"7
Kentik API Engineeringhttps://github.com/kentik/api2202101beta1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r`
"Kentik synthetic monitoring system:https://kb.kentik.com/v4/Ma00.htm#Ma00-Synthetics_OverviewJ��
 �
*
 2  Synthetics data and admin APIs


 '

 k
	
 k
	
  &
	
 !
	
	 *
	

 )
	
 8
	
 /
	
 <

� <
M
 A D2A models
 -------------------------------------------------------



 A

  B

  B

  B	

  B

 C%

 C

 C 

 C#$


F I


F

 G

 G

 G	

 G

H

H


H

H

H


K S


K

 L

 L

 L	

 L

M 

M


M

M

M

N

N

N	

N

O 

O


O

O

O

P1

P


P

P,

P/0

Q!

Q


Q

Q

Q 


U Z


U

 V

 V

 V

 V

W"

W


W

W

W !

X

X

X	

X

Y

Y

Y

Y


\ `


\

 ]

 ]

 ]

 ]

^#

^


^

^

^!"

_

_

_	

_


b y


b

 c%

 c

 c 

 c#$

d

d

d	

d

e

e

e	

e

f

f

f	

f

g

g

g	

g

h"

h

h	

h !

i!

i

i	

i 

j$

j

j	

j"#

k*

k

k	%

k()

	l

	l

	l	

	l


m!


m


m	


m 

n

n

n	

n
8
p+ fields returned from backend grpc service


p

p	

p

q!

q

q	

q 

r!

r

r	

r 

s

s

s	

s

t

t

t	

t

u

u

u	

u

v

v

v	

v

w

w

w	

w

x)

x

x#

x&(
a
 | �T Agent impl type determines global vs private agent to use for specific test types.



 |

  }!

  }

  } 
C
 6 setup IP test against a NODE global agent will fail.


 

 
M
 �? setup a page load test against a RUST global agent will fail.


 �

 �

� �

�
!
 � id of this agent.


 �

 �	

 �
K
�"= revert site_name to name to prevent breaking existing users


�

�	

�

�

�

�

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

	�-

	�

	�'

	�*,


�


�



�


�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

� 

�


�

�

�

�

�

�	

�

�

�

�	

�

� 

�

�

�

� �

�

 �" Invalid value.


 �

 �

�

�

�

�

�

�

�

�

�

� �

�

 �" Invalid value.


 �

 �

�" Test is active.


�

�

�" Test is paused.


�

�
@
�"2 Test is deleted. Not settable via SetTestStatus.


�

�

� �

�

 �" Invalid value.


 �

 �

�

�

�

�

�

�

�

�

�

� �

�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

�

�

�	

�

� �

�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

�

�

�	

�

	� �

	�

	 �

	 �

	 �	

	 �

	�

	�

	�	

	�

	�

	�

	�	

	�

� �

�

 �" Invalid value.


 �

 �

�

�

�

�

�

�

�

�

�


� �


�


 �


 �


 �	


 �


�


�


�	


�


�


�


�	


�


�


�


�


�


�


�


�	


�


�


�



�


�


 ��


 �


�'


�


�


�%&


�(


�


�"


�%'


�(


�


�


�%'


	�(


	�


	�


	�%'



�(



�



�



�%'


�(


�


�


�%'

� �

�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

� �

�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

� �

�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

�

�

�	

�

� �

�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

� �

�

 �

 �

 �	

 �

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�

�

�

�

�

�

�+

�

�&

�)*

�&

�

�!

�$%

�&

�

�!

�$%

	�

	�


	�

	�


� 


�



�


�

� �

�

 � 

 �

 �	

 �

� 

�

�	

�

� 

�

�	

�

�"

�

�

� !

� 

�

�	

�

� 

�

�

�

�(

�

�#

�&'

� �

�

 �

 �

 �

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

� �

�

 ��

 �

 �

 �

 �

 �

�

�


�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

	�

	�

	�

	�


�


�


�


�

�.

�

�(

�+-

�!

�


�

�

� 

�

�

�	

�

�

�

�	

�

�

�

�	

�

�

�

�	

�

�" Task types.


�


�

�

�

�&

�

� 

�#%

�2

�

�,

�/1

�

�

�

�

�

�

�

�

�

�

�	

�

�

�

�	

�

�

�


�

�

�

�


�

�

�

�

�

�

�

�

�

�

�

�

�

�	

�

�

�

�

�

� �

�

 �

 �

 �

 �

�

�

�

�

�

�

�	

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

� �

�

 �

 �

 �

 �

�

�

�

�

�

�

�

�

�

�

�

�

� �

�

 �%

 �

 �	 

 �#$

�"

�

�	

� !

�$

�

�	

�"#

�

�

�	

�

�,

�


�

�'

�*+

� �

�

 �

 �

 �

 �

�

�

�

�

�!

�

�

� 

� 

�

�

�

�

�

�

�

�

�

�

�

�"

�

�

� !

�!

�

�

� 

�'

�


�

�"

�%&

	�'

	�


	�

	�!

	�$&


�%


�


�


�"$

�$

�

�

�!#

�$

�

�

�!#

�#

�

�

� "

�*

�

�$

�')

�)

�

�#

�&(

� �

�

 �

 �

 �	

 �

� �

�

 �

 �


 �

 �

 �

� �

�

 �

 �

 �	

 �

� �

�

 �

 �

 �	

 �
,
�," How often to generate tasks.


�

�	'

�*+

�" Used for top N.


�

�	

�
F
�"8 What type of flow to look at -- asn, cdn, country, ...


�

�	

�

�

�

�	

�

�

�

�	

�

� �

�

 �

 �

 �	

 �

� �

�

 �

 �

 �	

 �

� �

�

 �

 �

 �	

 �

�

�

�

�

� �

�

 �

 �

 �	

 �

� �

�

 �

 �


 �

 �

 �

� �

�

 �

 �


 �

 �

 �

�

�

�

�
D
 � �"6 application mesh test expects empty object in target


 �

!� �

!�

! �

! �

! �	

! �

!�

!�

!�	

!�

!�

!�

!�	

!�

!�

!�

!�	

!�

!�

!�

!�	

!�

!�"

!�


!�

!�

!� !

"� �

"�

" �

" �

" �	

" �

"�

"�

"�	

"�

"�

"�

"�	

"�

"�

"�

"�	

"�

"�

"�

"�

"�

"�"

"�


"�

"�

"� !

#� �

#�

# �

# �

# �	

# �

#�

#�

#�	

#�

#�

#�

#�

#�

$� �

$�

$ �%

$ �

$ � 

$ �#$

$�

$�

$�

$�

$�

$�

$�

$�

$�

$�

$�

$�

%� �

%�

% �

% �

% �	

% �

%�

%�

%�	

%�

&� �

&�

& �

& �

& �	

& �

&�

&�

&�	

&�

'� �

'�

' �

' �

' �


' �

'�

'�

'�	

'�

(� �

(�

( �

( �

( �	

( �

(�

(�

(�	

(�

(�

(�

(�	

(�

(�

(�

(�	

(�

)� �

)�

) �

) �	

) �


) �

)�

)�

)�	

)�

)�

)�

)�

)�

*� �

*�

* �

* �

* �	

* �

+� �

+�

+ �

+ �

+ �	

+ �

+�

+�

+�	

+�

+�

+�

+�	

+�

+�

+�

+�	

+�

+�

+�

+�	

+�

+�

+�

+�	

+�

+�

+�

+�	

+�
4
,� �& ID type for the specified IP address


,�
 
, � ID value of type


, �

, �	

, �
,
,� IP address associate with IP


,�

,�	

,�
&
-� � Traceroute lookup info


-�

- �% Agent ID by IP


- �


- �

- � 

- �#$

-� Agents info


-�


-�

-�

-�

-� ASN


-�


-�

-�

-�

-�& Device ID by IP


-�


-�

-�!

-�$%

-�$ Site ID by IP


-�


-�

-�

-�"#

-�	 IP Info


-�


-�

-�

-�

.� �

.�

. �

. �

. �

. �

.�

.�

.�	

.�

.�

.�

.�

.�

.�

.�

.�

.�

.�!

.�

.�

.� 

.�

.�

.�

.�

.�

.�

.�

.�

.�

.�

.�

.�

.�

.�

.�

.�

.	�

.	�

.	�

.	�

/� � Probing detail


/�

/ �	 AS path


/ �


/ �

/ �

/ �

/� Completed probe


/�

/�

/�

/� Hop count


/�

/�

/�
!
/�" Region path trace


/�


/�

/�

/� !

/� Site path trace


/�


/�

/�

/�

/�

/�


/�

/�

/�

0� � Trace detail


0�
)
0 � ID of agent for the trace


0 �

0 �	

0 �
)
0� IP of agent for the trace


0�

0�	

0�
 
0� Remote target IP


0�

0�	

0�
,
0� Number of hops for the trace


0�

0�

0�

0�! Probing info


0�


0�

0�

0� 
/
1� �! Statistics for traceroute count


1�
!
1 � Average statistic


1 �

1 �

1 �
!
1� Maximum statistic


1�

1�

1�

1� Total statistic


1�

1�

1�

2� �

2�

2 �%

2 �

2 � 

2 �#$

2�

2�


2�

2�

2�

2�

2�

2�

2�

2�

2�

2�

2�

2�

2�

2�

2�

3� � Traceroute info


3�
2
3 �%$ Indicate trace route is trunciated


3 �

3 � 

3 �#$
*
3� Maximum number of asn path


3�

3�

3�
+
3�  Maximum number of site path


3�

3�

3�
-
3�" Maximum number of region path


3�

3�

3� !
U
4� �2G Data Service
 -------------------------------------------------------


4� 
;
4 �- List of ids of the tests to get health for.


4 �


4 �

4 �

4 �
:
4�+, Start of the time interval for this query.


4�

4�&

4�)*
8
4�)* End of the time interval for this query.


4�

4�$

4�'(
;
4� - Optionally, only look at a subset of agents


4�


4�

4�

4�
Y
4�K Optionally only look at a subset of tasks -- this lets you limit targets.


4�


4�

4�

4�

4�

4�

4�

4�

5� �

5�!

5 �!

5 �


5 �

5 �

5 � 

6� �

6�

6 �	 Test id


6 �

6 �	

6 �
:
6�+, Start of the time interval for this query.


6�

6�&

6�)*
8
6�)* End of the time interval for this query.


6�

6�$

6�'(
>
6� 0 Optionally, limit the query to these agent ids


6�


6�

6�

6�
M
6�!? Optionally, limit the query to these destination IP addresses


6�


6�

6�

6� 

7� �

7�

7 �

7 �

7 �

7 �

7�-

7�


7�

7�(

7�+,

7�'

7�

7�"

7�%&

 � �

 �

 �A

 ��A

 �F

 �+�F

 �<

 �*�<
4
  ��$ Get health data for a set of tests


  �

  �1

  �<U

  �B

  �*�B

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �-

 �8O

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���
T
8� 2H Admin Service
 -------------------------------------------------------


8�

9� �

9�

9 �

9 �


9 �

9 �

9 �

9�"

9�

9�	

9� !

:� �

:�

: �

: �

: �	

: �

;� �

;�

; �

; �

; �

; �

<� �

<�

< �

< �

< �

< �
v
<�%h CSV values of fields follow the path of Agent object with dot notation (ie. "agent.alias,export.type")


<�

<� 

<�#$

=� �

=�

= �

= �

= �

= �

>� �

>�

> �

> �

> �	

> �


?� 

?�

@� �

@�

@ �

@ �

@ �

@ �

A� �

A�

A �

A �


A �

A �

A �

A�!

A�

A�	

A� 

B� �

B�

B �

B �

B �

B �

C� �

C�

C �

C �

C �

C �

D� �

D�

D �

D �

D �	

D �

E� �

E�

E �

E �

E �

E �

F� �

F�

F �

F �

F �	

F �

F�

F�

F�

F�

G� �

G�

H� �

H�

H �

H �

H �

H �
u
H�%g CSV values of fields follow the path of Test object with dot notation (ie. "test.name,test.settings")


H�

H� 

H�#$

I� �

I�

I �

I �

I �

I �

J� �

J�

J �

J �

J �	

J �


K� 

K�

� �

�

�A

��A

�F

�+�F

�B

�*�B

 ��2 Agents


 �

 �"

 �-?

 �H

 �*�H

 ��

	 �ʼ"��

 ��

 ���

��

�

�

�)9

�H

�*�H

��

	�ʼ"��

��

���

��

�

�"

�-?

�I

�*�I

��

	�ʼ"��

��

���

��

�

�$

�/B

�I

�*�I

��

	�ʼ"��

��

���

��2 Tests


�

� 

�+<

�H

�*�H

��

	�ʼ"��

��

���

��

�

�"

�-?

�I

�*�I

��

	�ʼ"��

��

���

��

�

�

�'6

�H

�*�H

��

	�ʼ"��

��

���

��

�

�(

�3H

�I

�*�I

��

	�ʼ"��

��

���

��

�

� 

�+<

�I

�*�I

��

	�ʼ"��

��

���

	��

	�

	�"

	�-?

	�I

	�*�I

	��

		�ʼ"��

	��

	���bproto3��  
��
*kentik/synthetics/v202202/synthetics.protokentik.synthetics.v202202google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto#kentik/core/v202303/user_info.proto"�
Agent7
id (	B'�A 2Unique identifier of the agent�ARidI
	site_name (	B,�A)2'Name of the site where agent is locatedRsiteNameW
status (2&.kentik.synthetics.v202202.AgentStatusB�A2Operational statusRstatusF
alias (	B0�A-2+User selected descriptive name of the agentRalias=
type (	B)�A"2 Type of agent (global | private)�ARtypeB
os (	B2�A+2)OS version of server/VM hosting the agent�ARosI
ip (	B9�A02.Public IP address of the agent (auto-detected)�ARipL
lat (B:�A725Latitude of agent's location (signed decimal degrees)RlatO
long	 (B;�A826Longitude of agent's location (signed decimal degrees)Rlongi
last_authed
 (2.google.protobuf.TimestampB,�A%2#Timestamp of the last authorization�AR
lastAuthedj
family (2#.kentik.synthetics.v202202.IPFamilyB-�A*2(IP address family supported by the agentRfamilyB
asn (B0�A-2+ASN of the AS owning agent's public addressRasnX
site_id (	B?�A<2:ID of the site hosting the agent (if configured in Kentik)RsiteId@
version (	B&�A2Software version of the agent�ARversion8
city (	B$�A!2City where the agent is locatedRcityD
region (	B,�A)2'Geographical region of agent's locationRregion:
country (	B �A2Country of agent's locationRcountryK
test_ids (	B0�A)2'IDs of user's test running on the agent�ARtestIdsB
local_ip (	B'�A"2 Internal IP address of the agentRlocalIpO
cloud_region (	B,�A)2'Cloud region (if any) hosting the agentRcloudRegionU
cloud_provider (	B.�A+2)Cloud provider (if any) hosting the agentRcloudProviderM

agent_impl (2(.kentik.synthetics.v202202.ImplementTypeB�AR	agentImplN
labels (	B6�A321List of names of labels associated with the agentRlabels�
metadata (2(.kentik.synthetics.v202202.AgentMetadataBJ�AG2EAdditional information about agent's configuration and run-time stateRmetadata"�
AgentMetadata�
private_ipv4_addresses (20.kentik.synthetics.v202202.AgentMetadata.IpValueB#�A 2List of private IPv4 addressesRprivateIpv4Addresses�
public_ipv4_addresses (20.kentik.synthetics.v202202.AgentMetadata.IpValueB&�A2List of public IPv4 addresses�ARpublicIpv4Addresses�
private_ipv6_addresses (20.kentik.synthetics.v202202.AgentMetadata.IpValueB#�A 2List of private IPv6 addressesRprivateIpv6Addresses�
public_ipv6_addresses (20.kentik.synthetics.v202202.AgentMetadata.IpValueB&�A2List of public IPv6 addresses�ARpublicIpv6Addresses
IpValue
value (	Rvalue"�
Test.
id (	B�A2Unique ID of the test�ARid7
name (	B#�A 2User selected name of the testRname)
type (	B�A2Type of the testRtypeb
status (2%.kentik.synthetics.v202202.TestStatusB#�A 2Operational status of the testRstatus\
settings (2'.kentik.synthetics.v202202.TestSettingsB�A2Test configurationRsettingsS
cdate (2.google.protobuf.TimestampB!�A2Creation timestamp (UTC)�ARcdate\
edate (2.google.protobuf.TimestampB*�A#2!Last modification timestamp (UTC)�ARedate_

created_by	 (2.kentik.core.v202303.UserInfoB!�A2Identity of test creator�AR	createdBy
last_updated_by
 (2.kentik.core.v202303.UserInfoB8�A12/Identity of use that has modified the test last�ARlastUpdatedByC
labels (	B+�A(2&Set of labels associated with the testRlabels"�
TestSettingsE
hostname (2'.kentik.synthetics.v202202.HostnameTestH Rhostname3
ip (2!.kentik.synthetics.v202202.IpTestH Rip<
agent (2$.kentik.synthetics.v202202.AgentTestH Ragent9
flow (2#.kentik.synthetics.v202202.FlowTestH Rflow6
dns (2".kentik.synthetics.v202202.DnsTestH Rdns6
url (2".kentik.synthetics.v202202.UrlTestH RurlF
network_grid (2!.kentik.synthetics.v202202.IpTestH RnetworkGridF
	page_load (2'.kentik.synthetics.v202202.PageLoadTestH RpageLoad?
dns_grid	 (2".kentik.synthetics.v202202.DnsTestH RdnsGridO
network_mesh (2*.kentik.synthetics.v202202.NetworkMeshTestH RnetworkMesh[
	agent_ids
 (	B>�A;29IDs of agents assigned to run tasks on behalf of the testRagentIdsA
tasks (	B+�A(2&List of task names to run for the testRtasks�
health_settings (2).kentik.synthetics.v202202.HealthSettingsBU�AR2PHealth evaluation thresholds, acceptable responses and alarm activation settingsRhealthSettingsi
ping (2+.kentik.synthetics.v202202.TestPingSettingsB(�A%2#Ping tasks configuration parametersRpingq
trace (2,.kentik.synthetics.v202202.TestTraceSettingsB-�A*2(Traceroute task configuration parametersRtrace@
period (B(�A%2#Test evaluation period (in seconds)Rperiod�
family (2#.kentik.synthetics.v202202.IPFamilyBD�AA2?IP address family to select from available DNS name resolutionsRfamily
notification_channels (	BJ�AG2EList of IDs of notification channels for alarms triggered by the testRnotificationChannels>
notes (	B(�A%2#Add a note or comment for this testRnotesB

definition"�
TestPingSettingsK
count (B5�A220Number of probe packets to send in one iterationRcountG
protocol (	B+�A(2&Transport protocol to use (icmp | tcp)RprotocolF
port (B2�A/2-Target port for TCP probes (ignored for ICMP)RportP
timeout (B6�A321Timeout in milliseconds for execution of the taskRtimeout<
delay (B&�A#2!Inter-probe delay in millisecondsRdelayJ
dscp (B6�A321DSCP code to be set in IP header of probe packetsRdscp"�
TestTraceSettingsK
count (B5�A220Number of probe packets to send in one iterationRcountM
protocol (	B1�A.2,Transport protocol to use (icmp | tcp | udp)RprotocolM
port (B9�A624Target port for TCP or UDP probes (ignored for ICMP)RportP
timeout (B6�A321Timeout in milliseconds for execution of the taskRtimeoutM
limit (B7�A422Maximum number of hops to probe (i.e. maximum TTL)Rlimit<
delay (B&�A#2!Inter-probe delay in millisecondsRdelayJ
dscp (B6�A321DSCP code to be set in IP header of probe packetsRdscp"�
ActivationSettings�
grace_period (	B_�A\2ZPeriod of healthy status in minutes within the time window not cancelling alarm activationRgracePeriodN
	time_unit (	B1�A.2,Time unit for specifying time window (m | h)RtimeUnit]
time_window (	B<�A927Time window for evaluating of test for alarm activationR
timeWindow|
times (	Bf�Ac2aNumber of occurrences of unhealthy test status within the time window triggering alarm activationRtimes"�
HealthSettings
latency_critical (BT�AQ2OThreshold for ping response latency (in microseconds) to trigger critical alarmRlatencyCritical|
latency_warning (BS�AP2NThreshold for ping response latency (in microseconds) to trigger warning alarmRlatencyWarningv
packet_loss_critical (BD�AA2?Threshold for ping packet loss (in %) to trigger critical alarmRpacketLossCriticals
packet_loss_warning (BC�A@2>Threshold for ping packet loss (in %) to trigger warning alarmRpacketLossWarnings
jitter_critical (BJ�AG2EThreshold for ping jitter (in microseconds) to trigger critical alarmRjitterCriticalq
jitter_warning (BJ�AG2EThreshold for ping jitter (in microseconds) to trigger critical alarmRjitterWarning�
http_latency_critical (BT�AQ2OThreshold for HTTP response latency (in microseconds) to trigger critical alarmRhttpLatencyCritical�
http_latency_warning (BS�AP2NThreshold for HTTP response latency (in microseconds) to trigger warning alarmRhttpLatencyWarninga
http_valid_codes	 (B7�A422List of HTTP status codes indicating healthy stateRhttpValidCodes^
dns_valid_codes
 (B6�A321List of DNS status codes indicating healthy stateRdnsValidCodes�
latency_critical_stddev (Bj�Ag2eThreshold for standard deviation (in microseconds) of ping response latency to trigger critical alarmRlatencyCriticalStddev�
latency_warning_stddev (Bi�Af2dThreshold for standard deviation (in microseconds) of ping response latency to trigger warning alarmRlatencyWarningStddev�
jitter_critical_stddev (B`�A]2[Threshold for standard deviation of ping jitter (in microseconds) to trigger critical alarmRjitterCriticalStddev�
jitter_warning_stddev (B_�A\2ZThreshold for standard deviation of ping jitter (in microseconds) to trigger warning alarmRjitterWarningStddev�
http_latency_critical_stddev (Bj�Ag2eThreshold for standard deviation of HTTP response latency (in microseconds) to trigger critical alarmRhttpLatencyCriticalStddev�
http_latency_warning_stddev (Bi�Af2dThreshold for standard deviation of HTTP response latency (in microseconds) to trigger warning alarmRhttpLatencyWarningStddev�
unhealthy_subtest_threshold (Bo�Aj2hNumber of tasks (across all agents) that must report unhealthy status in order for alarm to be triggeredRunhealthySubtestThresholdm

activation (2-.kentik.synthetics.v202202.ActivationSettingsB�A2Alarm activation settingsR
activation�
cert_expiry_warning (B[�AX2VThreshold for remaining validity of TLS certificate (in days) to trigger warning alarmRcertExpiryWarning�
cert_expiry_critical (B\�AY2WThreshold for remaining validity of TLS certificate (in days) to trigger critical alarmRcertExpiryCritical�
dns_valid_ips (	Bd�Aa2_Comma separated list of IP addresses expected to be received in response to DNS A or AAAA queryRdnsValidIps�
dns_latency_critical (BS�AP2NThreshold for DNS response latency (in microseconds) to trigger critical alarmRdnsLatencyCritical�
dns_latency_warning (BR�AO2MThreshold for DNS response latency (in microseconds) to trigger warning alarmRdnsLatencyWarning�
dns_latency_critical_stddev (Bi�Af2dThreshold for standard deviation (in microseconds) of DNS response latency to trigger critical alarmRdnsLatencyCriticalStddev�
dns_latency_warning_stddev (Bh�Ae2cThreshold for standard deviation (in microseconds) of DNS response latency to trigger warning alarmRdnsLatencyWarningStddev"X
HostnameTestH
target (	B0�A-2+Fully qualified DNS name of the target hostRtarget"H
IpTest>
targets (	B$�A!2List of IP addresses of targetsRtargets"�
	AgentTest3
target (	B�A2ID of the target agentRtarget}
use_local_ip (B[�AX2VBoolean value indicating whether to use local (private) IP address of the target agentR
useLocalIp"�
FlowTest�
target (	Bo�Al2jTarget ASN, CDN, Country, Region of City for autonomous test (type of value depends on flow test sub-type)Rtarget�
target_refresh_interval_millis (BY�AV2TPeriod (in milliseconds) for refreshing list of targets based on available flow dataRtargetRefreshIntervalMillis^
max_providers (B9�A624Maximum number of IP providers to track autonomouslyRmaxProvidersp
max_ip_targets (BJ�AG2EMaximum number of target IP addresses to select based flow data queryRmaxIpTargetsW
type (	BC�A@2>Autonomous test sub-type (asn | cdn | country | region | city)Rtype�
inet_direction (	B��A}2{Selection of address from flow data (src = source address in inbound flows | dst = destination addresses in outbound flows)RinetDirection~
	direction (	B`�A]2[Direction of flows to match target attribute for extraction of target addresses (src | dst)R	direction"�
DnsTest>
target (	B&�A#2!Fully qualified DNS name to queryRtargetF
timeout (B,�A'2%--- Deprecated: value is ignored. ---Rtimeoutg
record_type (2$.kentik.synthetics.v202202.DNSRecordB �A2Type of DNS record to queryR
recordTypeB
servers (	B(�A%2#List of IP addresses of DNS serversRservers/
port (B�A2Target DNS server portRport"�
UrlTest9
target (	B!�A2HTTP or HTTPS URL to requestRtargetI
timeout (B/�A,2*HTTP transaction timeout (in milliseconds)RtimeoutQ
method (	B9�A624HTTP method to use (GET | HEAD | PATCH | POST | PUT)Rmethod
headers (2/.kentik.synthetics.v202202.UrlTest.HeadersEntryB4�A12/Map of HTTP header values keyed by header namesRheaders*
body (	B�A2HTTP request bodyRbodyy
ignore_tls_errors (BM�AJ2HBoolean indicating whether to ignore TLS certificate verification errorsRignoreTlsErrors:
HeadersEntry
key (	Rkey
value (	Rvalue:8"�
PageLoadTest9
target (	B!�A2HTTP or HTTPS URL to requestRtargetI
timeout (B/�A,2*HTTP transaction timeout (in milliseconds)Rtimeout�
headers (24.kentik.synthetics.v202202.PageLoadTest.HeadersEntryB4�A12/Map of HTTP header values keyed by header namesRheadersy
ignore_tls_errors (BM�AJ2HBoolean indicating whether to ignore TLS certificate verification errorsRignoreTlsErrors�
css_selectors (29.kentik.synthetics.v202202.PageLoadTest.CssSelectorsEntryB6�A321Map of CSS selector values keyed by selector nameRcssSelectors:
HeadersEntry
key (	Rkey
value (	Rvalue:8?
CssSelectorsEntry
key (	Rkey
value (	Rvalue:8"�
NetworkMeshTest~
use_local_ip (B\�AY2WBoolean value indicating whether to use local (private) IP address of the target agentsR
useLocalIp"�

MetricData6
current (B�A2Current value of metricRcurrent?
rolling_avg (B�A2Rolling average of metricR
rollingAvg[
rolling_stddev (B4�A12/Rolling average of standard deviation of metricRrollingStddevc
health (	BK�AH2FHealth evaluation status for the metric (healthy | warning | critical)Rhealth"�
PacketLossData8
current (B�A2Current packet loss valueRcurrentc
health (	BK�AH2FHealth evaluation status for the metric (healthy | warning | critical)Rhealth"�
PingResultsE
target (	B-�A*2(Hostname or address of the probed targetRtargetn
packet_loss (2).kentik.synthetics.v202202.PacketLossDataB"�A2Packet loss metric and healthR
packetLossf
latency (2%.kentik.synthetics.v202202.MetricDataB%�A"2 Packet latency metric and healthRlatencyo
jitter (2%.kentik.synthetics.v202202.MetricDataB0�A-2+Latency jitter (variance) metric and healthRjitter7
dst_ip (	B �A2IP address of probed targetRdstIp"�
HTTPResponseData4
status (B�A2HTTP status in responseRstatus>
size (B*�A'2%Total size of  received response bodyRsizeo
data (	B[�AX2VDetailed information about transaction timing, connection characteristics and responseRdata"�
HTTPResults.
target (	B�A2Target probed URLRtargetm
latency (2%.kentik.synthetics.v202202.MetricDataB,�A)2'HTTP response latency metric and healthRlatencyv
response (2+.kentik.synthetics.v202202.HTTPResponseDataB-�A*2(Information about received HTTP responseRresponse>
dst_ip (	B'�A$2"IP address of probed target serverRdstIp"�
DNSResponseData0
status (B�A2Received DNS statusRstatusB
data (	B.�A+2)Text rendering of received DNS resolutionRdata"�

DNSResults/
target (	B�A2Queried DNS recordRtarget:
server (	B"�A2DNS server used for the queryRserverl
latency (2%.kentik.synthetics.v202202.MetricDataB+�A(2&DNS response latency metric and healthRlatencyt
response (2*.kentik.synthetics.v202202.DNSResponseDataB,�A)2'Information about received DNS responseRresponse"�
TaskResultse
ping (2&.kentik.synthetics.v202202.PingResultsB'�A$2"Entry containing ping task resultsH Rpinge
http (2&.kentik.synthetics.v202202.HTTPResultsB'�A$2"Entry containing HTTP task resultsH Rhttpa
dns (2%.kentik.synthetics.v202202.DNSResultsB&�A#2!Entry containing DNS task resultsH Rdns6
health (	B�A2Health status of the taskRhealthB
	task_type"�
AgentResultsA
agent_id (	B&�A#2!ID of the agent providing resultsRagentIdb
health (	BJ�AG2EOverall health status of all task for the test executed by this agentRhealthg
tasks (2&.kentik.synthetics.v202202.TaskResultsB)�A&2$List of results for individual tasksRtasks"�
TestResultsK
test_id (	B2�A/2-ID of the test for which results are providedRtestIdL
time (2.google.protobuf.TimestampB�A2Results timestamp (UTC)Rtime6
health (	B�A2Health status of the testRhealth�
agents (2'.kentik.synthetics.v202202.AgentResultsBF�AC2AList of results from agents executing tasks on behalf of the testRagents"�
Stats,
average (B�A2Average valueRaverage$
min (B�A2Minimum valueRmin$
max (B�A2Maximum valueRmax"�
LocationC
latitude (B'�A$2"Latitude in signed decimal degreesRlatitudeF
	longitude	 (B(�A%2#Longitude in signed decimal degreesR	longitude6
country (	B�A2Country of the locationRcountryA
region (	B)�A&2$Geographic region within the countryRregion-
city (	B�A2City of the locationRcity"�
NetNodeH
ip (	B8�A523IP address of the node in standard textual notationRip?
asn (B-�A*2(AS number owning the address of the nodeRasnK
as_name (	B2�A/2-Name of the AS owning the address of the nodeRasNameh
location (2#.kentik.synthetics.v202202.LocationB'�A$2"Location of IP address of the nodeRlocationY
dns_name (	B>�A;29DNS name of the node (obtained by reverse DNS resolution)RdnsNamef
	device_id (	BI�AF2DID of the device corresponding with the node in Kentik configurationRdeviceIdv
site_id (	B]�AZ2XID of the site containing the device corresponding with the node in Kentik configurationRsiteId"�
TraceHopv
latency (B\�AY2WRound-trip packet latency to the node (in microseconds) - 0 if no response was receivedRlatencyo
node_id (	BV�AS2QID of the node for this hop in the Nodes map  - empty if no response was receivedRnodeId"�
	PathTrace:
as_path (B!�A2AS path of the network traceRasPathZ
is_complete (B9�A624Indication whether response from target was receivedR
isCompleteW
hops (2#.kentik.synthetics.v202202.TraceHopB�A2List of hops in the traceRhops"�
PathH
agent_id (	B-�A*2(ID of the agent generating the path dataRagentIdF
	target_ip (	B)�A&2$IP address of the target of the pathRtargetIpj
	hop_count (2 .kentik.synthetics.v202202.StatsB+�A(2&Hop count statistics across all tracesRhopCount]
max_as_path_length (B0�A-2+Maximum length of AS path across all tracesRmaxAsPathLength]
traces (2$.kentik.synthetics.v202202.PathTraceB�A2Data for individual tracesRtracesd
time	 (2.google.protobuf.TimestampB4�A12/Timestamp (UTC) of initiation of the path traceRtime"�
GetResultsForTestsRequestI
ids (	B7�A02.List of test IDs for which to retrieve results�ARidsy

start_time (2.google.protobuf.TimestampB>�A725Timestamp of the oldest results to include in results�AR	startTimeu
end_time (2.google.protobuf.TimestampB>�A725Timestamp of the newest results to include in results�ARendTimeP
	agent_ids (	B3�A02.List of agent IDs from which to return resultsRagentIds]
targets (	BC�A@2>List of targets (test dependent) for which to retrieve resultsRtargets�
	aggregate (Bk�Ah2fIf true, retrieve result aggregated across the requested time period, else return complete time seriesR	aggregate"^
GetResultsForTestsResponse@
results (2&.kentik.synthetics.v202202.TestResultsRresults"�
GetTraceForTestRequestM
id (	B=�A:28ID of test for which to retrieve network path trace dataRidy

start_time (2.google.protobuf.TimestampB>�A725Timestamp of the oldest results to include in results�AR	startTimeu
end_time (2.google.protobuf.TimestampB>�A725Timestamp of the newest results to include in results�ARendTimeP
	agent_ids (	B3�A02.List of agent IDs from which to return resultsRagentIds]

target_ips (	B>�A;29List of target IP addresses for which to retrieve resultsR	targetIps"�
GetTraceForTestResponse�
nodes (2=.kentik.synthetics.v202202.GetTraceForTestResponse.NodesEntryB6�A321Map of network node information keyed by node IDsRnodes_
paths (2.kentik.synthetics.v202202.PathB(�A%2#List of retrieved network path dataRpaths\

NodesEntry
key (	Rkey8
value (2".kentik.synthetics.v202202.NetNodeRvalue:8"
ListAgentsRequest"�
ListAgentsResponseW
agents (2 .kentik.synthetics.v202202.AgentB�A2List of available agentsRagentse
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"E
GetAgentRequest2
id (	B"�A2ID of the requested agent�ARid"t
GetAgentResponse`
agent (2 .kentik.synthetics.v202202.AgentB(�A%2#Agent configuration and status dataRagent"k
UpdateAgentRequestU
agent (2 .kentik.synthetics.v202202.AgentB�A2Agent configuration dataRagent"w
UpdateAgentResponse`
agent (2 .kentik.synthetics.v202202.AgentB(�A%2#Agent configuration and status dataRagent"L
DeleteAgentRequest6
id (	B&�A2ID of the agent to be deleted�ARid"
DeleteAgentResponse"
ListTestsRequest"�
ListTestsResponsee
tests (2.kentik.synthetics.v202202.TestB.�A+2)List of configured active or paused testsRtestse
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"j
CreateTestRequestU
test (2.kentik.synthetics.v202202.TestB �A2Test configuration data�ARtest"r
CreateTestResponse\
test (2.kentik.synthetics.v202202.TestB'�A$2"Test configuration and status dataRtest"?
GetTestRequest-
id (	B�A2ID of requested test�ARid"o
GetTestResponse\
test (2.kentik.synthetics.v202202.TestB'�A$2"Test configuration and status dataRtest"f
UpdateTestRequestQ
test (2.kentik.synthetics.v202202.TestB�A2Test configuration dataRtest"r
UpdateTestResponse\
test (2.kentik.synthetics.v202202.TestB'�A$2"Test configuration and status dataRtest"J
DeleteTestRequest5
id (	B%�A2ID of the test to be deleted�ARid"
DeleteTestResponse"�
SetTestStatusRequestF
id (	B6�A/2-ID of the test which status is to be modified�ARidZ
status (2%.kentik.synthetics.v202202.TestStatusB�A2Target test status�ARstatus"
SetTestStatusResponse*}
ImplementType
IMPLEMENT_TYPE_UNSPECIFIED 
IMPLEMENT_TYPE_RUST
IMPLEMENT_TYPE_NODE
IMPLEMENT_TYPE_NETWORK*]
IPFamily
IP_FAMILY_UNSPECIFIED 
IP_FAMILY_V4
IP_FAMILY_V6
IP_FAMILY_DUAL*�

TestStatus
TEST_STATUS_UNSPECIFIED 
TEST_STATUS_ACTIVE
TEST_STATUS_PAUSED
TEST_STATUS_DELETED
TEST_STATUS_PREVIEW*q
AgentStatus
AGENT_STATUS_UNSPECIFIED 
AGENT_STATUS_OK
AGENT_STATUS_WAIT
AGENT_STATUS_DELETED*�
	DNSRecord
DNS_RECORD_UNSPECIFIED 
DNS_RECORD_A
DNS_RECORD_AAAA
DNS_RECORD_CNAME
DNS_RECORD_DNAME
DNS_RECORD_NS
DNS_RECORD_MX
DNS_RECORD_PTR
DNS_RECORD_SOA2�
SyntheticsDataService�
GetResultsForTests4.kentik.synthetics.v202202.GetResultsForTestsRequest5.kentik.synthetics.v202202.GetResultsForTestsResponse"��AsGet results for testsFReturns probe results for a set of tests for specified period of time.*GetResultsForTests��synthetics:read��� "/synthetics/v202202/results:*�
GetTraceForTest1.kentik.synthetics.v202202.GetTraceForTestRequest2.kentik.synthetics.v202202.GetTraceForTestResponse"��A�!Get network trace data for a testdGet network trace data for a specific synthetic test. The test must have traceroute task configured.*GetTraceForTest��synthetics:read���"/synthetics/v202202/trace:*(�Agrpc.api.kentik.com��
synthetics��2�
SyntheticsAdminService�

ListAgents,.kentik.synthetics.v202202.ListAgentsRequest-.kentik.synthetics.v202202.ListAgentsResponse"��AcList available agents>Returns list of all synthetic agents available in the account.*
ListAgents��admin.synthetics:read��synthetics.agent::read���/synthetics/v202202/agents�
GetAgent*.kentik.synthetics.v202202.GetAgentRequest+.kentik.synthetics.v202202.GetAgentResponse"��AdGet information about an agent8Returns information about the requested synthetic agent.*GetAgent��admin.synthetics:read��synthetics.agent::read���!/synthetics/v202202/agents/{id}�
UpdateAgent-.kentik.synthetics.v202202.UpdateAgentRequest..kentik.synthetics.v202202.UpdateAgentResponse"��A[ Update configuration of an agent*Update configuration of a synthetic agent.*UpdateAgent��admin.synthetics:write��synthetics.agent::update���*%/synthetics/v202202/agents/{agent.id}:*�
DeleteAgent-.kentik.synthetics.v202202.DeleteAgentRequest..kentik.synthetics.v202202.DeleteAgentResponse"��AzDelete an agentZDeletes the requested agent. The deleted agent is removed from configuration of all tests.*DeleteAgent��admin.synthetics:write��synthetics.agent::delete���!*/synthetics/v202202/agents/{id}�
	ListTests+.kentik.synthetics.v202202.ListTestsRequest,.kentik.synthetics.v202202.ListTestsResponse"��A`List all testsCReturns a list of all configured active and paused synthetic tests.*	ListTests��admin.synthetics:read��synthetics.test::read���/synthetics/v202202/tests�

CreateTest,.kentik.synthetics.v202202.CreateTestRequest-.kentik.synthetics.v202202.CreateTestResponse"��AbCreate a testECreate synthetic test based on configuration provided in the request.*
CreateTest��admin.synthetics:write��synthetics.test::create���"/synthetics/v202202/tests:*�
GetTest).kentik.synthetics.v202202.GetTestRequest*.kentik.synthetics.v202202.GetTestResponse"��AkGet information about a testBReturns configuration and status for the requested synthetic test.*GetTest��admin.synthetics:read��synthetics.test::read��� /synthetics/v202202/tests/{id}�

UpdateTest,.kentik.synthetics.v202202.UpdateTestRequest-.kentik.synthetics.v202202.UpdateTestResponse"��AXUpdate configuration of a test*Updates configuration of a synthetic test.*
UpdateTest��admin.synthetics:write��synthetics.test::update���(#/synthetics/v202202/tests/{test.id}:*�

DeleteTest,.kentik.synthetics.v202202.DeleteTestRequest-.kentik.synthetics.v202202.DeleteTestResponse"��A�Delete a synthetic test.YDeletes the synthetics test. All accumulated results for the test cease to be accessible.*
DeleteTest��admin.synthetics:write��synthetics.test::delete��� */synthetics/v202202/tests/{id}�
SetTestStatus/.kentik.synthetics.v202202.SetTestStatusRequest0.kentik.synthetics.v202202.SetTestStatusResponse"��AU!Update status of a synthetic test!Update status of a synthetic test*SetTestStatus��admin.synthetics:write��synthetics.test::update���*%/synthetics/v202202/tests/{id}/status:*.�Agrpc.api.kentik.com��admin.synthetics��B�?ZOgithub.com/kentik/api-schema-public/gen/go/kentik/synthetics/v202202;synthetics�A�>�=
Synthetics Monitoring API�<# Overview
The Synthetics Monitoring API provides programmatic access to Kentik's [synthetic monitoring system](https://kb.kentik.com/v4/Ma00.htm). The API consists of two endpoints:
| Endpoint | Purpose |
|-----------|---------|
| SyntheticsAdminService | CRUD operations for synthetic tests and agents |
| SyntheticsDataService  | Retrieval of synthetic test results and network traces |

Both REST endpoint and gRPC RPCs are provided.
### Known Limitations
The API currently does not support the following [Synthetic Test Types](https://kb.kentik.com/v4/Ma00.htm#Ma00-Synthetic_Test_Types):
* BGP Monitor tests, which are supported in a [separate API](https://github.com/kentik/api-schema-public/blob/master/proto/kentik/bgp_monitoring/v202205beta1/bgp_monitoring.proto)
* Transaction tests.

### Additional Public Resources
Kentik community [Python](https://github.com/kentik/community_sdk_python) and [Go](https://github.com/kentik/community_sdk_golang) SDKs provide language-specific support for using this and other Kentik APIs. These SDKs can be also used as example code for development. 
 A [Terraform provider](https://registry.terraform.io/providers/kentik/kentik-synthetics) is available for configuring tests and agents for Kentik synthetic monitoring.
# Anatomy of a Synthetic Test
Each `Test` consists of one or more tasks. Tasks are executed by monitoring `Agents` that send synthetic traffic (probes) over the network. The API currently supports following tasks:
| Task name  | Purpose |
|------------|---------|
| ping       | Test basic address, and optionally TCP port reachability |
| traceroute (a.k.a. trace)| Discover unidirectional network path |
| http | Perform a simple HTTP/HTTPS request |
| page-load | Use headless Chromium to execute an HTTP/HTTPS request |
| dns | Execute a DNS query|

The set of tasks executed on behalf of a given test depends on the `type` of that test. The following test types are currently supported by the API:
| API type | Portal (UI) equivalent | Tasks |
|---------------|--------------|-------|
| ip | IP Address | ping, traceroute |
| hostname | Hostname | ping, traceroute |
| network_grid | Network Grid | ping, traceroute |
| agent | Agent-to-Agent | ping, traceroute |
| network_mesh | Network Mesh | ping, traceroute |
| flow | Autonomous Tests (5 variants) | ping, traceroute |
| url | HTTP(S) or API | http, ping (optional), traceroute (optional) |
| page_load | Page Load | page-load, ping (optional), traceroute (optional) |
| dns | DNS Server Monitor | dns |
| dns_grid | DNS Server Grid | dns |

***Note:*** `ping` and `traceroute` tasks are always run together (never one without the other).

# Test Attributes and Settings
The attributes of the test object enable configuration of test settings, access to test metadata, and access to runtime state information.
### State and Metadata Attributes
 The following table lists the metadata and state attributes:
| Attribute | Access | Purpose |
|-----------|--------|---------|
| id | RO | System-generated unique identifier of the test |
| name | RW | User specified name for the test (need not be unique) |
| type | RO (after creation) | Type of the test (set on creation; read-only thereafter) |
| status | RW | Life-cycle status of the test |
| cdate | RO | Creation timestamp |
| edate | RO | Last-modification timestamp |
| created_by | RO | Identity of the user that created the test |
| last_updated_by | RO | Identity of the latest user to modify the test |
| labels | RW | List of names of labels applied to the test |

Test configuration is performed via the test's `settings` attribute. Some settings are common to all tests while others are specific to tests of a given type.
### Common Test Settings
The following settings are used for tests of all types:
| Attribute | Purpose | Required |
|-----------|---------|----------|
| agentIds  | IDs of agents to execute tasks for the test | YES |
| period | Test execution interval in seconds | NO (default 60s) |
| family | IP address family. Used only for tests whose type is url or dns. Selects which type of DNS resource is queried for resolving hostname to target address | NO (default IP_FAMILY_DUAL) |
| notificationChannels | List of notification channels for the test | NO (default empty list) |
| healthSettings | A HealthSettings object that configures health settings for this test, which includes metric thresholds that define health status (warning and critical) and trigger associated alarms. | YES |
| ping | A TestPingSettings object that configures the ping task of the test | NO (default depends on test type) |
| trace | A TestTraceSettings object that configures the trace task of the test | NO (default depends on test type) |
| tasks | List of names of the tasks that will be executed for this test | YES |

### Type-specific Settings
Each test type has its own configuration object that represents the settings for that type. These type-specific objects are referenced by the attributes in `Test.settings`:
| Test type    | Settings attribute | Configuration object |
|--------------|-------------------------|---------------------------|
| ip           | ip                      | IpTest                    |
| hostname     | hostname                | HostnameTest              |
| network_grid | networkGrid             | IpTest                    |
| agent        | agent                   | AgentTest                 |
| network_mesh | networkMesh             | NetworkMeshTest           |
| flow         | flow                    | FlowTest                  |
| url          | url                     | UrlTest                   |
| page_load    | pageLoad                | PageLoadTest              |
| dns          | dns                     | DnsTest                   |
| dns_grid     | dnsGrid                 | DnsTest                   |

# Test Results
Results of synthetic tests are returned as a sequence of `TestResults` objects. Each such object represents measurements and health evaluation for a single test at specific point in time. Measurements and health evaluation are grouped by agent and by task.
Granularity of timestamps in test results depends on the frequency (period) of the test and on the requested time range. The minimum granularity is 1 minute (even when period < 1 minute). The longer the time range, the lower the granularity.
# Network Traces
Synthetic tests that include the `traceroute` task collect the unidirectional network path from the agent to the target for each agent/target pair. The trace data are returned in the `GetTraceForTestResponse` object. The `paths` attribute of this object contains the collected network path for each agent/target pair and the round-trip time (RTT) to each hop.
Hops in actual network traces are identified by a `nodeId`. The mapping of node IDs to address, name, location, and other attributes of the hop is provided in a map that is stored in the `nodes` attribute of the `GetTraceForTestResponse` object.
# Agents
The Kentik synthetic monitoring system recognizes 2 types of agents:
* **Global** (public): Managed by Kentik and available to every Kentik user. All information about global agents in this API is read-only.
* **Private**: Deployed by each customer and available only to that customer.
To be visible in this API, a private agent must first associate itself with a customer account by contacting the Kentik system (via private API). Once the agent is associated it can be authorized via the API by changing its `status` to `AGENT_STATUS_OK`. For more information about private agent deployment, see [**Synthetic Agent Deployments**](https://kb.kentik.com/v4/Ma01.htm#Ma01-Synthetic_Agent_Deployments).
"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202202*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r`
"Kentik synthetic monitoring system:https://kb.kentik.com/v4/Ma00.htm#Ma00-Synthetics_OverviewJ��
 �
*
 2  Synthetics data and admin APIs


 "

 f
	
 f
	
  &
	
 !
	
	 )
	

 )
	
 8
	
 /
	
 -


 �

� �
}
 � � {{.Name}}
2b models
 -------------------------------------------------------
 === AGENT config and status ===


 �

  �!

  �

  � 
�
 �u ksynth, a.k.a network agent (implemented in Rust) capable of running all tasks except for page-load and transaction


 �

 �
y
 �k ksynth-agent, a.k.a. app agent (implemented in NodeJS) with Chromium enabled capable of running all tasks


 �

 �
�
 �z ksynth-agent, a.k.a. app agent with Chromium disabled, capable of running all tasks except for page-load and transaction


 �

 �

 � � {{.Name}}


 �

  ��

  �

  �	

  �

  ��

  � �-

  ���

 ��

 �

 �	

 �

 ��

 ���

 ��

 �

 �

 �

 ��

 ���

 ��

 �

 �	

 �

 ��

 ���

 ��

 �

 �	

 �

 ��

 � �-

 ���

 ��

 �

 �	

 �

 ��

 � �-

 ���

 ��

 �

 �	

 �

 ��

 �

 � �-

 ���

 ��

 �

 �	

 �

 ��

 ���

 ��

 �

 �	

 �

 ��

 ���

 	��

 	�

 	�'

 	�*,

 	�-�

 	� �-

 	���

 
��

 
�


 
�

 
�

 
��

 
���

 ��

 �

 �	

 �

 ��

 ���

 ��

 �

 �	

 �

 ��

 ���

 ��

 �

 �	

 �

 ��

 � �-

 ���

 ��

 �

 �	

 �

 ��

 ���

 ��

 �

 �	

 �

 ��

 ���

 ��

 �

 �	

 �

 ��

 ���

 ��

 �


 �

 �

 �

 � �

 � �-

 ���

 ��

 �

 �	

 �

 ��

 �

 ���

 ��

 �

 �	

 �

 ��

 ���

 ��

 �

 �	

 �

 ��

 ���

 ��

 �

 �

 �

 � �

 � �-

 ��

 �


 �

 �

 �

 ��

 ���

 ��

 �

 �

 �

 ��

 ���

� � {{.Name}}


�

 ��

 �


 �

 �)

 �,-

 �.�

 ���

��

�


�

�(

�+,

�-�

� �-

���

��

�


�

�)

�,-

�.�

���

��

�


�

�(

�+,

�-�

� �-

���

 ��

 �


  �

  �


  �

  �

� � {{.Name}}


�

 � Invalid value.


 �

 �

� IPv4 only


�

�

� IPv6 only


�

�
'
� IPv4 and IPv6 supported


�

�

� � {{.Name}}


�

 � Invalid value.


 �

 �

� Test is active.


�

�

� Test is paused.


�

�
3
�% Test is deleted. Not user settable.


�

�

� Test is preview


�

�

� � {{.Name}}


�

 � Invalid value.


 �

 �
.
�  Agent is ready to accept tests


�

�
2
�$ Agent is waiting for authorization


�

�
5
�' Agent was deleted - not user settable


�

�
;
� � {{.Name}}
2  === TEST config and status ===


�

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�

�

��

���

��

�

�

�

��

���

��

�

�!

�$%

�&�

� �-

���

��

�

�!

�$%

�&�

� �-

���

��

�

�)

�,-

�.�

� �-

���

��

�

�.

�13

�4�

� �-

���

	��

	�


	�

	�

	�

	��

	���

� � {{.Name}}


�

 � Invalid value


 �

 �
0
�" name to IPv4 address(es) mapping


�

�
0
�" name to IPv6 address(es) mapping


�

�
)
� alternative resource name


�

�
-
� alternative resource set name


�

�
-
� domain to name server mapping


�

�
'
� SMTP mail server record


�

�
.
�  IPv4/6 address to name mapping


�

�
 
� domain meta-data


�

�

� � {{.Name}}


�

 ��

 �

 �

 �

 �

 �

�

�


�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�


�

�

�

�

�

�

�

�

�

�

	�&

	�

	� 

	�#%


��


�



�


�


� 


�!�


���

��

�


�

�

�

��

���

��

�

� 

�#%

�&�

���

��

�

�

�

��

���

��

�

�

�

��

���

��

�

�	

�

��

���

��

�


�

�

��

���

��

�


�

�'

�*,

�-�

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���

��

�

�

�

��

���

��

�

�

� 

�!�

���

��

�

�

�

� �

���

��

�

�

�

��

���

��

�

�

�

��

���

��

�

�

� !

�"�

���

��

�

�

� 

�!�

���

��

�


�

�"

�%&

�'�

���

	��

	�


	�

	�!

	�$&

	�'�

	���


��


�


�


�"$


�%�


���

��

�

�

�!#

�$�

���

��

�

�

�!#

�$�

���

��

�

�

� "

�#�

���

��

�

�$

�')

�*�

���

��

�

�#

�&(

�)�

���

��

�

�	$

�')

�*�

�

���

��

�

�

�"$

�%�

���

��

�

�	

�!

�"�

���

��

�

�	

� "

�#�

���

��

�

�	

�

��

���

��

�

�

�!

�"�

���

��

�

�

� 

�!�

���

��

�

�#

�&(

�)�

���

��

�

�"

�%'

�(�

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

	� � {{.Name}}


	�

	 ��

	 �


	 �

	 �

	 �

	 ��

	 ���


� � {{.Name}}



�


 ��


 �


 �	


 �


 ��


 ���


��


�


�


�


��


���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	'

�*+

�,�

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

�

���

��

�

�

�

��

���

��

�


�

�

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�

� !

�"�

���

��

�

�	

�

��

���

��

�

�

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�

� !

�"�

���

��

�

�

�

��

���

��

�

�#

�&'

�(�

���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���
-
� � {{.Name}}
2 === TEST RESULTS


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�

� 

�!�

���

��

�

�

�

��

���

��

�

�

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�

�

��

���

��

�

�

�

� �

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�

�

��

���

��

�

�

�

��

���

� � {{.Name}}


�

 ��

 �

 ��

 �

 �

 �

 ��

 ���

��

�

�

�

��

���

��

�

�

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�


�

�

� 

�!�

���

� �	 {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

� 

�#$

�%�

���

��	

�

�	

�

��	

��	�	

�	�	

�	


�	

�	

�	!"

�	#�	

��	�	
7
�	 �	 {{.Name}}
2 === TEST TRACE results ===


�	

 �	�	

 �	

 �	

 �	

 �	�	

 ��	�	

�	�	

�	

�	

�	

�	�	

��	�	

�	�	

�	

�	

�	

�	�	

��	�	

�	 �	 {{.Name}}


�	

 �	�	

 �	

 �		

 �	

 �	�	

 ��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	 �	 {{.Name}}


�	

 �	�	

 �	

 �		

 �	

 �	�	

 ��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	�	

�	


�	

�	

�	�	

��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	 �	 {{.Name}}


�	

 �	�	

 �	

 �	

 �	

 �	�	

 ��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	 �
 {{.Name}}


�	

 �	�	

 �	


 �	

 �	

 �	

 �	�	

 ��	�	

�	�	

�	

�	

�	

�	�	

��	�	

�	�


�	


�	

�	

�	

�	�


��
�


�
 �
 {{.Name}}


�


 �
�


 �


 �
	

 �


 �
�


 ��
�


�
�


�


�
	

�


�
�


��
�


�
�


�


�


�


�
�


��
�


�
�


�


�


�


�
�


��
�


�
�


�



�


�


�


�
 �


��
�


�
�


�


�
 

�
#$

�
%�


��
�

b
 �
 �
 {{.Name}}
2G Data Service
 -------------------------------------------------------


 �
!

  �
�


  �



  �


  �


  �


  �
�


  ��
�


  � �
*

 �
�


 �


 �
&

 �
)*

 �
+�


 ��
�


 � �
*

 �
�


 �


 �
$

 �
'(

 �
)�


 ��
�


 � �
*

 �
�


 �



 �


 �


 �


 �
 �


 ��
�


 �
�


 �



 �


 �


 �


 �
�


 ��
�


 �
�


 �


 �


 �


 �
�


 ��
�


!�
 �
 {{.Name}}


!�
"

! �
#

! �



! �


! �


! �
!"

"�
 �
 {{.Name}}


"�


" �
�


" �


" �
	

" �


" �
�


" ��
�


"�
�


"�


"�
&

"�
)*

"�
+�


"��
�


"� �
*

"�
�


"�


"�
$

"�
'(

"�
)�


"��
�


"� �
*

"�
�


"�



"�


"�


"�


"�
 �


"��
�


"�
�


"�



"�


"�


"�
 

"�
!�


"��
�


#�
 � {{.Name}}


#�


# ��

# �

# �

# � !

# �"�

# ���

#��

#�


#�

#�

#�

#��

#���

 � �

 �

 �;

 ��;

 �F

 �+�F

 �<

 �*�<
<
  ��, Get measurement results for a set of tests


  �

  �3

  �>X

  �B

  �*�B

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �-

 �8O

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���
a
$�  {{.Name}}
2H Admin Service
 -------------------------------------------------------


$�

%� � {{.Name}}


%�

% ��

% �


% �

% �

% �

% ��

% ���

%��

%�

%�	

%�

%��

%���

&� � {{.Name}}


&�

& ��

& �

& �	

& �

& ��

& ���

& � �*

'� � {{.Name}}


'�

' ��

' �

' �

' �

' ��

' ���

(� � {{.Name}}


(�

( ��

( �

( �

( �

( ��

( ���

)� � {{.Name}}


)�

) ��

) �

) �

) �

) ��

) ���

*� � {{.Name}}


*�

* ��

* �

* �	

* �

* ��

* ���

* � �*

+�  {{.Name}}


+�

,�  {{.Name}}


,�

-� � {{.Name}}


-�

- ��

- �


- �

- �

- �

- ��

- ���

-��

-�

-�	

-�

-��

-���

.� � {{.Name}}


.�

. ��

. �

. �

. �

. ��

. ���

. � �*

/� � {{.Name}}


/�

/ ��

/ �

/ �

/ �

/ ��

/ ���

0� � {{.Name}}


0�

0 ��

0 �

0 �	

0 �

0 ��

0 ���

0 � �*

1� � {{.Name}}


1�

1 ��

1 �

1 �

1 �

1 ��

1 ���

2� � {{.Name}}


2�

2 ��

2 �

2 �

2 �

2 ��

2 ���

3� � {{.Name}}


3�

3 ��

3 �

3 �

3 �

3 ��

3 ���

4� � {{.Name}}


4�

4 ��

4 �

4 �	

4 �

4 ��

4 ���

4 � �*

5�  {{.Name}}


5�

6� � {{.Name}}


6�

6 ��

6 �

6 �	

6 �

6 ��

6 ���

6 � �*

6��

6�

6�

6�

6��

6���

6� �*

7�   {{.Name}}


7�

� �

�

�;

��;

�F

�+�F

�B

�*�B

 ��

 �

 �"

 �-?

 �H

 �*�H

 �N

 �+�N

 ��

	 �ʼ"��

 ��

 ���

��

�

�

�)9

�H

�*�H

�N

�+�N

��

	�ʼ"��

��

���

��

�

�$

�/B

�I

�*�I

�P

�+�P

��

	�ʼ"��

��

���

��

�

�$

�/B

�I

�*�I

�P

�+�P

��

	�ʼ"��

��

���

��

�

� 

�+<

�H

�*�H

�M

�+�M

��

	�ʼ"��

��

���

��

�

�"

�-?

�I

�*�I

�O

�+�O

��

	�ʼ"��

��

���

��

�

�

�'6

�H

�*�H

�M

�+�M

��

	�ʼ"��

��

���

��

�

�"

�-?

�I

�*�I

�O

�+�O

��

	�ʼ"��

��

���

��

�

�"

�-?

�I

�*�I

�O

�+�O

��

	�ʼ"��

��

���

	��

	�

	�(

	�3H

	�I

	�*�I

	�O

	�+�O

	��

		�ʼ"��

	��

	���bproto3��  
��
*kentik/synthetics/v202309/synthetics.protokentik.synthetics.v202309google/api/annotations.protogoogle/api/client.protogoogle/api/field_behavior.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto#kentik/core/v202303/user_info.proto"�
DisabledMetrics!
ping_latency (RpingLatency
ping_jitter (R
pingJitter(
ping_packet_loss (RpingPacketLoss!
http_latency (RhttpLatency!
http_headers (RhttpHeaders

http_codes (R	httpCodes(
http_cert_expiry (RhttpCertExpiry/
transaction_latency (RtransactionLatency
dns_latency	 (R
dnsLatency
	dns_codes
 (RdnsCodes
dns_ips (RdnsIps1
throughput_bandwidth (RthroughputBandwidth"�
Agent7
id (	B'�A 2Unique identifier of the agent�ARidI
	site_name (	B,�A)2'Name of the site where agent is locatedRsiteNameW
status (2&.kentik.synthetics.v202309.AgentStatusB�A2Operational statusRstatusF
alias (	B0�A-2+User selected descriptive name of the agentRalias=
type (	B)�A"2 Type of agent (global | private)�ARtypeB
os (	B2�A+2)OS version of server/VM hosting the agent�ARosI
ip (	B9�A02.Public IP address of the agent (auto-detected)�ARipL
lat (B:�A725Latitude of agent's location (signed decimal degrees)RlatO
long	 (B;�A826Longitude of agent's location (signed decimal degrees)Rlongi
last_authed
 (2.google.protobuf.TimestampB,�A%2#Timestamp of the last authorization�AR
lastAuthedj
family (2#.kentik.synthetics.v202309.IPFamilyB-�A*2(IP address family supported by the agentRfamilyB
asn (B0�A-2+ASN of the AS owning agent's public addressRasnX
site_id (	B?�A<2:ID of the site hosting the agent (if configured in Kentik)RsiteId@
version (	B&�A2Software version of the agent�ARversion8
city (	B$�A!2City where the agent is locatedRcityD
region (	B,�A)2'Geographical region of agent's locationRregion:
country (	B �A2Country of agent's locationRcountryK
test_ids (	B0�A)2'IDs of user's test running on the agent�ARtestIdsB
local_ip (	B'�A"2 Internal IP address of the agentRlocalIpO
cloud_region (	B,�A)2'Cloud region (if any) hosting the agentRcloudRegionU
cloud_provider (	B.�A+2)Cloud provider (if any) hosting the agentRcloudProviderM

agent_impl (2(.kentik.synthetics.v202309.ImplementTypeB�AR	agentImplN
labels (	B6�A321List of names of labels associated with the agentRlabels�
metadata (2(.kentik.synthetics.v202309.AgentMetadataBJ�AG2EAdditional information about agent's configuration and run-time stateRmetadata"�
AgentMetadata�
private_ipv4_addresses (20.kentik.synthetics.v202309.AgentMetadata.IpValueB#�A 2List of private IPv4 addressesRprivateIpv4Addresses�
public_ipv4_addresses (20.kentik.synthetics.v202309.AgentMetadata.IpValueB&�A2List of public IPv4 addresses�ARpublicIpv4Addresses�
private_ipv6_addresses (20.kentik.synthetics.v202309.AgentMetadata.IpValueB#�A 2List of private IPv6 addressesRprivateIpv6Addresses�
public_ipv6_addresses (20.kentik.synthetics.v202309.AgentMetadata.IpValueB&�A2List of public IPv6 addresses�ARpublicIpv6Addresses
IpValue
value (	Rvalue"�
Test.
id (	B�A2Unique ID of the test�ARid7
name (	B#�A 2User selected name of the testRname)
type (	B�A2Type of the testRtypeb
status (2%.kentik.synthetics.v202309.TestStatusB#�A 2Operational status of the testRstatus\
settings (2'.kentik.synthetics.v202309.TestSettingsB�A2Test configurationRsettingsS
cdate (2.google.protobuf.TimestampB!�A2Creation timestamp (UTC)�ARcdate\
edate (2.google.protobuf.TimestampB*�A#2!Last modification timestamp (UTC)�ARedate_

created_by	 (2.kentik.core.v202303.UserInfoB!�A2Identity of test creator�AR	createdBy
last_updated_by
 (2.kentik.core.v202303.UserInfoB8�A12/Identity of use that has modified the test last�ARlastUpdatedByC
labels (	B+�A(2&Set of labels associated with the testRlabels"�
TestSettingsE
hostname (2'.kentik.synthetics.v202309.HostnameTestH Rhostname3
ip (2!.kentik.synthetics.v202309.IpTestH Rip<
agent (2$.kentik.synthetics.v202309.AgentTestH Ragent9
flow (2#.kentik.synthetics.v202309.FlowTestH Rflow6
dns (2".kentik.synthetics.v202309.DnsTestH Rdns6
url (2".kentik.synthetics.v202309.UrlTestH RurlF
network_grid (2!.kentik.synthetics.v202309.IpTestH RnetworkGridF
	page_load (2'.kentik.synthetics.v202309.PageLoadTestH RpageLoad?
dns_grid	 (2".kentik.synthetics.v202309.DnsTestH RdnsGridO
network_mesh (2*.kentik.synthetics.v202309.NetworkMeshTestH RnetworkMesh[
	agent_ids
 (	B>�A;29IDs of agents assigned to run tasks on behalf of the testRagentIdsA
tasks (	B+�A(2&List of task names to run for the testRtasks�
health_settings (2).kentik.synthetics.v202309.HealthSettingsBU�AR2PHealth evaluation thresholds, acceptable responses and alarm activation settingsRhealthSettingsi
ping (2+.kentik.synthetics.v202309.TestPingSettingsB(�A%2#Ping tasks configuration parametersRpingq
trace (2,.kentik.synthetics.v202309.TestTraceSettingsB-�A*2(Traceroute task configuration parametersRtrace@
period (B(�A%2#Test evaluation period (in seconds)Rperiod�
family (2#.kentik.synthetics.v202309.IPFamilyBD�AA2?IP address family to select from available DNS name resolutionsRfamily
notification_channels (	BJ�AG2EList of IDs of notification channels for alarms triggered by the testRnotificationChannels>
notes (	B(�A%2#Add a note or comment for this testRnotes�

throughput (21.kentik.synthetics.v202309.TestThroughputSettingsB-�A*2(Throughput task configuration parametersR
throughputB

definition"�
TestPingSettingsK
count (B5�A220Number of probe packets to send in one iterationRcountG
protocol (	B+�A(2&Transport protocol to use (icmp | tcp)RprotocolF
port (B2�A/2-Target port for TCP probes (ignored for ICMP)RportP
timeout (B6�A321Timeout in milliseconds for execution of the taskRtimeout<
delay (B&�A#2!Inter-probe delay in millisecondsRdelayJ
dscp (B6�A321DSCP code to be set in IP header of probe packetsRdscp"�
TestTraceSettingsK
count (B5�A220Number of probe packets to send in one iterationRcountM
protocol (	B1�A.2,Transport protocol to use (icmp | tcp | udp)RprotocolM
port (B9�A624Target port for TCP or UDP probes (ignored for ICMP)RportP
timeout (B6�A321Timeout in milliseconds for execution of the taskRtimeoutM
limit (B7�A422Maximum number of hops to probe (i.e. maximum TTL)Rlimit<
delay (B&�A#2!Inter-probe delay in millisecondsRdelayJ
dscp (B6�A321DSCP code to be set in IP header of probe packetsRdscp"�
TestThroughputSettingsp
port (B\�AY2WTarget port for TCP or UDP throughput task (the port the target server is listening on)RportX
omit (BD�AA2?(optional) Number of seconds to omit from the start of the testRomit@
duration (B$�A!2Duration of the test in secondsRduration�
	bandwidth (B��A�2�(optional) Target bandwidth in Mbps, if no bandwidth is specified, the test will measure the maximum bandwidth for TCP and 10Mbps for UDPR	bandwidthF
protocol (	B*�A'2%Transport protocol to use (tcp | udp)Rprotocol"�
ActivationSettings�
grace_period (	B_�A\2ZPeriod of healthy status in minutes within the time window not cancelling alarm activationRgracePeriodN
	time_unit (	B1�A.2,Time unit for specifying time window (m | h)RtimeUnit]
time_window (	B<�A927Time window for evaluating of test for alarm activationR
timeWindow|
times (	Bf�Ac2aNumber of occurrences of unhealthy test status within the time window triggering alarm activationRtimes"�"
HealthSettings
latency_critical (BT�AQ2OThreshold for ping response latency (in microseconds) to trigger critical alarmRlatencyCritical|
latency_warning (BS�AP2NThreshold for ping response latency (in microseconds) to trigger warning alarmRlatencyWarningv
packet_loss_critical (BD�AA2?Threshold for ping packet loss (in %) to trigger critical alarmRpacketLossCriticals
packet_loss_warning (BC�A@2>Threshold for ping packet loss (in %) to trigger warning alarmRpacketLossWarnings
jitter_critical (BJ�AG2EThreshold for ping jitter (in microseconds) to trigger critical alarmRjitterCriticalq
jitter_warning (BJ�AG2EThreshold for ping jitter (in microseconds) to trigger critical alarmRjitterWarning�
http_latency_critical (BT�AQ2OThreshold for HTTP response latency (in microseconds) to trigger critical alarmRhttpLatencyCritical�
http_latency_warning (BS�AP2NThreshold for HTTP response latency (in microseconds) to trigger warning alarmRhttpLatencyWarninga
http_valid_codes	 (B7�A422List of HTTP status codes indicating healthy stateRhttpValidCodes^
dns_valid_codes
 (B6�A321List of DNS status codes indicating healthy stateRdnsValidCodes�
latency_critical_stddev (Bj�Ag2eThreshold for standard deviation (in microseconds) of ping response latency to trigger critical alarmRlatencyCriticalStddev�
latency_warning_stddev (Bi�Af2dThreshold for standard deviation (in microseconds) of ping response latency to trigger warning alarmRlatencyWarningStddev�
jitter_critical_stddev (B`�A]2[Threshold for standard deviation of ping jitter (in microseconds) to trigger critical alarmRjitterCriticalStddev�
jitter_warning_stddev (B_�A\2ZThreshold for standard deviation of ping jitter (in microseconds) to trigger warning alarmRjitterWarningStddev�
http_latency_critical_stddev (Bj�Ag2eThreshold for standard deviation of HTTP response latency (in microseconds) to trigger critical alarmRhttpLatencyCriticalStddev�
http_latency_warning_stddev (Bi�Af2dThreshold for standard deviation of HTTP response latency (in microseconds) to trigger warning alarmRhttpLatencyWarningStddev�
unhealthy_subtest_threshold (Bo�Aj2hNumber of tasks (across all agents) that must report unhealthy status in order for alarm to be triggeredRunhealthySubtestThresholdm

activation (2-.kentik.synthetics.v202309.ActivationSettingsB�A2Alarm activation settingsR
activation�
cert_expiry_warning (B[�AX2VThreshold for remaining validity of TLS certificate (in days) to trigger warning alarmRcertExpiryWarning�
cert_expiry_critical (B\�AY2WThreshold for remaining validity of TLS certificate (in days) to trigger critical alarmRcertExpiryCritical�
dns_valid_ips (	Bd�Aa2_Comma separated list of IP addresses expected to be received in response to DNS A or AAAA queryRdnsValidIps�
dns_latency_critical (BS�AP2NThreshold for DNS response latency (in microseconds) to trigger critical alarmRdnsLatencyCritical�
dns_latency_warning (BR�AO2MThreshold for DNS response latency (in microseconds) to trigger warning alarmRdnsLatencyWarning�
dns_latency_critical_stddev (Bi�Af2dThreshold for standard deviation (in microseconds) of DNS response latency to trigger critical alarmRdnsLatencyCriticalStddev�
dns_latency_warning_stddev (Bh�Ae2cThreshold for standard deviation (in microseconds) of DNS response latency to trigger warning alarmRdnsLatencyWarningStddevo
per_agent_alerting (BA�A<2:Boolean value indicating whether to use per-agent alertingRperAgentAlerting�
disabled_metrics (2*.kentik.synthetics.v202309.DisabledMetricsB:�A725Set of metrics to be skipped during health evaluationRdisabledMetricsY
health_disabled (B0�A-2+Disable all health evaluation for this testRhealthDisabled|
throughput_critical (BK�AH2FThreshold for throughput bandwidth (in mbps) to trigger critical alarmRthroughputCriticaly
throughput_warning (BJ�AG2EThreshold for throughput bandwidth (in mbps) to trigger warning alarmRthroughputWarning�
throughput_critical_stddev (Ba�A^2\Threshold for standard deviation (in mbps) of throughput bandwidth to trigger critical alarmRthroughputCriticalStddev�
throughput_warning_stddev  (B`�A]2[Threshold for standard deviation (in mbps) of throughput bandwidth to trigger warning alarmRthroughputWarningStddev"X
HostnameTestH
target (	B0�A-2+Fully qualified DNS name of the target hostRtarget"�
IpTest>
targets (	B$�A!2List of IP addresses of targetsRtargets~
use_local_ip (B\�AY2WBoolean value indicating whether to use local (private) IP address of the target agentsR
useLocalIp"�
	AgentTest3
target (	B�A2ID of the target agentRtarget}
use_local_ip (B[�AX2VBoolean value indicating whether to use local (private) IP address of the target agentR
useLocalIpd

reciprocal (BD�AA2?Boolean value indicating whether to make the test bidirectionalR
reciprocal"�
FlowTest�
target (	Bo�Al2jTarget ASN, CDN, Country, Region of City for autonomous test (type of value depends on flow test sub-type)Rtarget�
target_refresh_interval_millis (BY�AV2TPeriod (in milliseconds) for refreshing list of targets based on available flow dataRtargetRefreshIntervalMillis^
max_providers (B9�A624Maximum number of IP providers to track autonomouslyRmaxProvidersp
max_ip_targets (BJ�AG2EMaximum number of target IP addresses to select based flow data queryRmaxIpTargetsW
type (	BC�A@2>Autonomous test sub-type (asn | cdn | country | region | city)Rtype�
inet_direction (	B��A}2{Selection of address from flow data (src = source address in inbound flows | dst = destination addresses in outbound flows)RinetDirection~
	direction (	B`�A]2[Direction of flows to match target attribute for extraction of target addresses (src | dst)R	direction"�
DnsTest>
target (	B&�A#2!Fully qualified DNS name to queryRtargetF
timeout (B,�A'2%--- Deprecated: value is ignored. ---Rtimeoutg
record_type (2$.kentik.synthetics.v202309.DNSRecordB �A2Type of DNS record to queryR
recordTypeB
servers (	B(�A%2#List of IP addresses of DNS serversRservers/
port (B�A2Target DNS server portRport"�
UrlTest9
target (	B!�A2HTTP or HTTPS URL to requestRtargetI
timeout (B/�A,2*HTTP transaction timeout (in milliseconds)RtimeoutQ
method (	B9�A624HTTP method to use (GET | HEAD | PATCH | POST | PUT)Rmethod
headers (2/.kentik.synthetics.v202309.UrlTest.HeadersEntryB4�A12/Map of HTTP header values keyed by header namesRheaders*
body (	B�A2HTTP request bodyRbodyy
ignore_tls_errors (BM�AJ2HBoolean indicating whether to ignore TLS certificate verification errorsRignoreTlsErrors:
HeadersEntry
key (	Rkey
value (	Rvalue:8"�
PageLoadTest9
target (	B!�A2HTTP or HTTPS URL to requestRtargetI
timeout (B/�A,2*HTTP transaction timeout (in milliseconds)Rtimeout�
headers (24.kentik.synthetics.v202309.PageLoadTest.HeadersEntryB4�A12/Map of HTTP header values keyed by header namesRheadersy
ignore_tls_errors (BM�AJ2HBoolean indicating whether to ignore TLS certificate verification errorsRignoreTlsErrors�
css_selectors (29.kentik.synthetics.v202309.PageLoadTest.CssSelectorsEntryB6�A321Map of CSS selector values keyed by selector nameRcssSelectors:
HeadersEntry
key (	Rkey
value (	Rvalue:8?
CssSelectorsEntry
key (	Rkey
value (	Rvalue:8"�
NetworkMeshTest~
use_local_ip (B\�AY2WBoolean value indicating whether to use local (private) IP address of the target agentsR
useLocalIp"�

MetricData6
current (B�A2Current value of metricRcurrent?
rolling_avg (B�A2Rolling average of metricR
rollingAvg[
rolling_stddev (B4�A12/Rolling average of standard deviation of metricRrollingStddevc
health (	BK�AH2FHealth evaluation status for the metric (healthy | warning | critical)Rhealth"�
PacketLossData8
current (B�A2Current packet loss valueRcurrentc
health (	BK�AH2FHealth evaluation status for the metric (healthy | warning | critical)Rhealth"�
PingResultsE
target (	B-�A*2(Hostname or address of the probed targetRtargetn
packet_loss (2).kentik.synthetics.v202309.PacketLossDataB"�A2Packet loss metric and healthR
packetLossf
latency (2%.kentik.synthetics.v202309.MetricDataB%�A"2 Packet latency metric and healthRlatencyo
jitter (2%.kentik.synthetics.v202309.MetricDataB0�A-2+Latency jitter (variance) metric and healthRjitter7
dst_ip (	B �A2IP address of probed targetRdstIp"�
HTTPResponseData4
status (B�A2HTTP status in responseRstatus>
size (B*�A'2%Total size of  received response bodyRsizeo
data (	B[�AX2VDetailed information about transaction timing, connection characteristics and responseRdata"�
HTTPResults.
target (	B�A2Target probed URLRtargetm
latency (2%.kentik.synthetics.v202309.MetricDataB,�A)2'HTTP response latency metric and healthRlatencyv
response (2+.kentik.synthetics.v202309.HTTPResponseDataB-�A*2(Information about received HTTP responseRresponse>
dst_ip (	B'�A$2"IP address of probed target serverRdstIp"�
DNSResponseData0
status (B�A2Received DNS statusRstatusB
data (	B.�A+2)Text rendering of received DNS resolutionRdata"�

DNSResults/
target (	B�A2Queried DNS recordRtarget:
server (	B"�A2DNS server used for the queryRserverl
latency (2%.kentik.synthetics.v202309.MetricDataB+�A(2&DNS response latency metric and healthRlatencyt
response (2*.kentik.synthetics.v202309.DNSResponseDataB,�A)2'Information about received DNS responseRresponse"�
TaskResultse
ping (2&.kentik.synthetics.v202309.PingResultsB'�A$2"Entry containing ping task resultsH Rpinge
http (2&.kentik.synthetics.v202309.HTTPResultsB'�A$2"Entry containing HTTP task resultsH Rhttpa
dns (2%.kentik.synthetics.v202309.DNSResultsB&�A#2!Entry containing DNS task resultsH Rdns6
health (	B�A2Health status of the taskRhealthB
	task_type"�
AgentResultsA
agent_id (	B&�A#2!ID of the agent providing resultsRagentIdb
health (	BJ�AG2EOverall health status of all task for the test executed by this agentRhealthg
tasks (2&.kentik.synthetics.v202309.TaskResultsB)�A&2$List of results for individual tasksRtasks"�
TestResultsK
test_id (	B2�A/2-ID of the test for which results are providedRtestIdL
time (2.google.protobuf.TimestampB�A2Results timestamp (UTC)Rtime6
health (	B�A2Health status of the testRhealth�
agents (2'.kentik.synthetics.v202309.AgentResultsBF�AC2AList of results from agents executing tasks on behalf of the testRagents"�
Stats,
average (B�A2Average valueRaverage$
min (B�A2Minimum valueRmin$
max (B�A2Maximum valueRmax"�
LocationC
latitude (B'�A$2"Latitude in signed decimal degreesRlatitudeF
	longitude	 (B(�A%2#Longitude in signed decimal degreesR	longitude6
country (	B�A2Country of the locationRcountryA
region (	B)�A&2$Geographic region within the countryRregion-
city (	B�A2City of the locationRcity"�
NetNodeH
ip (	B8�A523IP address of the node in standard textual notationRip?
asn (B-�A*2(AS number owning the address of the nodeRasnK
as_name (	B2�A/2-Name of the AS owning the address of the nodeRasNameh
location (2#.kentik.synthetics.v202309.LocationB'�A$2"Location of IP address of the nodeRlocationY
dns_name (	B>�A;29DNS name of the node (obtained by reverse DNS resolution)RdnsNamef
	device_id (	BI�AF2DID of the device corresponding with the node in Kentik configurationRdeviceIdv
site_id (	B]�AZ2XID of the site containing the device corresponding with the node in Kentik configurationRsiteId"�
TraceHopv
latency (B\�AY2WRound-trip packet latency to the node (in microseconds) - 0 if no response was receivedRlatencyo
node_id (	BV�AS2QID of the node for this hop in the Nodes map  - empty if no response was receivedRnodeId"�
	PathTrace:
as_path (B!�A2AS path of the network traceRasPathZ
is_complete (B9�A624Indication whether response from target was receivedR
isCompleteW
hops (2#.kentik.synthetics.v202309.TraceHopB�A2List of hops in the traceRhops"�
PathH
agent_id (	B-�A*2(ID of the agent generating the path dataRagentIdF
	target_ip (	B)�A&2$IP address of the target of the pathRtargetIpj
	hop_count (2 .kentik.synthetics.v202309.StatsB+�A(2&Hop count statistics across all tracesRhopCount]
max_as_path_length (B0�A-2+Maximum length of AS path across all tracesRmaxAsPathLength]
traces (2$.kentik.synthetics.v202309.PathTraceB�A2Data for individual tracesRtracesd
time	 (2.google.protobuf.TimestampB4�A12/Timestamp (UTC) of initiation of the path traceRtime"�
GetResultsForTestsRequestI
ids (	B7�A02.List of test IDs for which to retrieve results�ARidsy

start_time (2.google.protobuf.TimestampB>�A725Timestamp of the oldest results to include in results�AR	startTimeu
end_time (2.google.protobuf.TimestampB>�A725Timestamp of the newest results to include in results�ARendTimeP
	agent_ids (	B3�A02.List of agent IDs from which to return resultsRagentIds]
targets (	BC�A@2>List of targets (test dependent) for which to retrieve resultsRtargets�
	aggregate (Bk�Ah2fIf true, retrieve result aggregated across the requested time period, else return complete time seriesR	aggregate"^
GetResultsForTestsResponse@
results (2&.kentik.synthetics.v202309.TestResultsRresults"�
GetTraceForTestRequestM
id (	B=�A:28ID of test for which to retrieve network path trace dataRidy

start_time (2.google.protobuf.TimestampB>�A725Timestamp of the oldest results to include in results�AR	startTimeu
end_time (2.google.protobuf.TimestampB>�A725Timestamp of the newest results to include in results�ARendTimeP
	agent_ids (	B3�A02.List of agent IDs from which to return resultsRagentIds]

target_ips (	B>�A;29List of target IP addresses for which to retrieve resultsR	targetIps"�
GetTraceForTestResponse�
nodes (2=.kentik.synthetics.v202309.GetTraceForTestResponse.NodesEntryB6�A321Map of network node information keyed by node IDsRnodes_
paths (2.kentik.synthetics.v202309.PathB(�A%2#List of retrieved network path dataRpaths\

NodesEntry
key (	Rkey8
value (2".kentik.synthetics.v202309.NetNodeRvalue:8"
ListAgentsRequest"�
ListAgentsResponseW
agents (2 .kentik.synthetics.v202309.AgentB�A2List of available agentsRagentse
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"E
GetAgentRequest2
id (	B"�A2ID of the requested agent�ARid"t
GetAgentResponse`
agent (2 .kentik.synthetics.v202309.AgentB(�A%2#Agent configuration and status dataRagent"k
UpdateAgentRequestU
agent (2 .kentik.synthetics.v202309.AgentB�A2Agent configuration dataRagent"w
UpdateAgentResponse`
agent (2 .kentik.synthetics.v202309.AgentB(�A%2#Agent configuration and status dataRagent"L
DeleteAgentRequest6
id (	B&�A2ID of the agent to be deleted�ARid"
DeleteAgentResponse"
ListTestsRequest"�
ListTestsResponsee
tests (2.kentik.synthetics.v202309.TestB.�A+2)List of configured active or paused testsRtestse
invalid_count (B@�A=2;Number of invalid entries encountered while collecting dataRinvalidCount"j
CreateTestRequestU
test (2.kentik.synthetics.v202309.TestB �A2Test configuration data�ARtest"r
CreateTestResponse\
test (2.kentik.synthetics.v202309.TestB'�A$2"Test configuration and status dataRtest"?
GetTestRequest-
id (	B�A2ID of requested test�ARid"o
GetTestResponse\
test (2.kentik.synthetics.v202309.TestB'�A$2"Test configuration and status dataRtest"f
UpdateTestRequestQ
test (2.kentik.synthetics.v202309.TestB�A2Test configuration dataRtest"r
UpdateTestResponse\
test (2.kentik.synthetics.v202309.TestB'�A$2"Test configuration and status dataRtest"J
DeleteTestRequest5
id (	B%�A2ID of the test to be deleted�ARid"
DeleteTestResponse"�
SetTestStatusRequestF
id (	B6�A/2-ID of the test which status is to be modified�ARidZ
status (2%.kentik.synthetics.v202309.TestStatusB�A2Target test status�ARstatus"
SetTestStatusResponse"�

AgentAlert
id (	Rid+
threshold_seconds (RthresholdSeconds8
notification_channel_ids (	RnotificationChannelIds
agent_id (	RagentId

agent_name (	R	agentName"�
CreateAgentAlertRequest+
threshold_seconds (RthresholdSeconds8
notification_channel_ids (	RnotificationChannelIds
agent_id (	RagentId"b
CreateAgentAlertResponseF
agent_alert (2%.kentik.synthetics.v202309.AgentAlertR
agentAlert"�
UpdateAgentAlertRequest
id (	Rid+
threshold_seconds (RthresholdSeconds8
notification_channel_ids (	RnotificationChannelIds"b
UpdateAgentAlertResponseF
agent_alert (2%.kentik.synthetics.v202309.AgentAlertR
agentAlert"&
GetAgentAlertRequest
id (	Rid"_
GetAgentAlertResponseF
agent_alert (2%.kentik.synthetics.v202309.AgentAlertR
agentAlert"5
ListAgentAlertsRequest
	agent_ids (	RagentIds"c
ListAgentAlertsResponseH
agent_alerts (2%.kentik.synthetics.v202309.AgentAlertRagentAlerts")
DeleteAgentAlertRequest
id (	Rid"
DeleteAgentAlertResponse*}
ImplementType
IMPLEMENT_TYPE_UNSPECIFIED 
IMPLEMENT_TYPE_RUST
IMPLEMENT_TYPE_NODE
IMPLEMENT_TYPE_NETWORK*]
IPFamily
IP_FAMILY_UNSPECIFIED 
IP_FAMILY_V4
IP_FAMILY_V6
IP_FAMILY_DUAL*�

TestStatus
TEST_STATUS_UNSPECIFIED 
TEST_STATUS_ACTIVE
TEST_STATUS_PAUSED
TEST_STATUS_DELETED
TEST_STATUS_PREVIEW*q
AgentStatus
AGENT_STATUS_UNSPECIFIED 
AGENT_STATUS_OK
AGENT_STATUS_WAIT
AGENT_STATUS_DELETED*�
	DNSRecord
DNS_RECORD_UNSPECIFIED 
DNS_RECORD_A
DNS_RECORD_AAAA
DNS_RECORD_CNAME
DNS_RECORD_DNAME
DNS_RECORD_NS
DNS_RECORD_MX
DNS_RECORD_PTR
DNS_RECORD_SOA2�
SyntheticsDataService�
GetResultsForTests4.kentik.synthetics.v202309.GetResultsForTestsRequest5.kentik.synthetics.v202309.GetResultsForTestsResponse"��AsGet results for testsFReturns probe results for a set of tests for specified period of time.*GetResultsForTests��synthetics:read��� "/synthetics/v202309/results:*�
GetTraceForTest1.kentik.synthetics.v202309.GetTraceForTestRequest2.kentik.synthetics.v202309.GetTraceForTestResponse"��A�!Get network trace data for a testdGet network trace data for a specific synthetic test. The test must have traceroute task configured.*GetTraceForTest��synthetics:read���"/synthetics/v202309/trace:*(�Agrpc.api.kentik.com��
synthetics��2�&
SyntheticsAdminService�

ListAgents,.kentik.synthetics.v202309.ListAgentsRequest-.kentik.synthetics.v202309.ListAgentsResponse"��AcList available agents>Returns list of all synthetic agents available in the account.*
ListAgents��admin.synthetics:read��synthetics.agent::read���/synthetics/v202309/agents�
GetAgent*.kentik.synthetics.v202309.GetAgentRequest+.kentik.synthetics.v202309.GetAgentResponse"��AdGet information about an agent8Returns information about the requested synthetic agent.*GetAgent��admin.synthetics:read��synthetics.agent::read���!/synthetics/v202309/agents/{id}�
UpdateAgent-.kentik.synthetics.v202309.UpdateAgentRequest..kentik.synthetics.v202309.UpdateAgentResponse"��A[ Update configuration of an agent*Update configuration of a synthetic agent.*UpdateAgent��admin.synthetics:write��synthetics.agent::update���*%/synthetics/v202309/agents/{agent.id}:*�
DeleteAgent-.kentik.synthetics.v202309.DeleteAgentRequest..kentik.synthetics.v202309.DeleteAgentResponse"��AzDelete an agentZDeletes the requested agent. The deleted agent is removed from configuration of all tests.*DeleteAgent��admin.synthetics:write��synthetics.agent::delete���!*/synthetics/v202309/agents/{id}�
	ListTests+.kentik.synthetics.v202309.ListTestsRequest,.kentik.synthetics.v202309.ListTestsResponse"��A`List all testsCReturns a list of all configured active and paused synthetic tests.*	ListTests��admin.synthetics:read��synthetics.test::read���/synthetics/v202309/tests�

CreateTest,.kentik.synthetics.v202309.CreateTestRequest-.kentik.synthetics.v202309.CreateTestResponse"��AbCreate a testECreate synthetic test based on configuration provided in the request.*
CreateTest��admin.synthetics:write��synthetics.test::create���"/synthetics/v202309/tests:*�
GetTest).kentik.synthetics.v202309.GetTestRequest*.kentik.synthetics.v202309.GetTestResponse"��AkGet information about a testBReturns configuration and status for the requested synthetic test.*GetTest��admin.synthetics:read��synthetics.test::read��� /synthetics/v202309/tests/{id}�

UpdateTest,.kentik.synthetics.v202309.UpdateTestRequest-.kentik.synthetics.v202309.UpdateTestResponse"��AXUpdate configuration of a test*Updates configuration of a synthetic test.*
UpdateTest��admin.synthetics:write��synthetics.test::update���(#/synthetics/v202309/tests/{test.id}:*�

DeleteTest,.kentik.synthetics.v202309.DeleteTestRequest-.kentik.synthetics.v202309.DeleteTestResponse"��A�Delete a synthetic test.YDeletes the synthetics test. All accumulated results for the test cease to be accessible.*
DeleteTest��admin.synthetics:write��synthetics.test::delete��� */synthetics/v202309/tests/{id}�
SetTestStatus/.kentik.synthetics.v202309.SetTestStatusRequest0.kentik.synthetics.v202309.SetTestStatusResponse"��AU!Update status of a synthetic test!Update status of a synthetic test*SetTestStatus��admin.synthetics:write��synthetics.test::update���*%/synthetics/v202309/tests/{id}/status:*�
CreateAgentAlert2.kentik.synthetics.v202309.CreateAgentAlertRequest3.kentik.synthetics.v202309.CreateAgentAlertResponse"��Aa#Create an agent alert configuration(Creates a new agent alert configuration.*CreateAgentAlert��admin.synthetics:write��synthetics.agent::create���$"/synthetics/v202309/agentAlerts:*�
UpdateAgentAlert2.kentik.synthetics.v202309.UpdateAgentAlertRequest3.kentik.synthetics.v202309.UpdateAgentAlertResponse"��A�#Update an agent alert configurationiUpdates an existing agent alert configuration with the time threshold and notification channels provided.*UpdateAgentAlert��admin.synthetics:write��synthetics.agent::update���)$/synthetics/v202309/agentAlerts/{id}:*�
GetAgentAlert/.kentik.synthetics.v202309.GetAgentAlertRequest0.kentik.synthetics.v202309.GetAgentAlertResponse"��Ac Get an agent alert configuration0Retrieves an existing agent alert configuration.*GetAgentAlert��admin.synthetics:read��synthetics.agent::read���&$/synthetics/v202309/agentAlerts/{id}�
ListAgentAlerts1.kentik.synthetics.v202309.ListAgentAlertsRequest2.kentik.synthetics.v202309.ListAgentAlertsResponse"��A�List agent alert configurationsQLists all agent alert configurations, optionally filtered by a list of agent ids.*ListAgentAlerts��admin.synthetics:read��synthetics.agent::read���!/synthetics/v202309/agentAlerts�
DeleteAgentAlert2.kentik.synthetics.v202309.DeleteAgentAlertRequest3.kentik.synthetics.v202309.DeleteAgentAlertResponse"��Ag#Delete an agent alert configuration.Deletes an existing agent alert configuration.*DeleteAgentAlert��admin.synthetics:write��synthetics.agent::delete���&*$/synthetics/v202309/agentAlerts/{id}.�Agrpc.api.kentik.com��admin.synthetics��B�BZOgithub.com/kentik/api-schema-public/gen/go/kentik/synthetics/v202309;synthetics�A�A�@
Synthetics Monitoring API�?# Overview
The Synthetics Monitoring API provides programmatic access to Kentik's [synthetic monitoring system](https://kb.kentik.com/v4/Ma00.htm). The API consists of two endpoints:
| Endpoint | Purpose |
|-----------|---------|
| SyntheticsAdminService | CRUD operations for synthetic tests, agents, and offline agent alerts |
| SyntheticsDataService  | Retrieval of synthetic test results and network traces |

Both REST endpoint and gRPC RPCs are provided.
Note: API version v202309 is the same as v202202 except that the timestamps returned for synthetic test results are closer to when the test was actually run.
### Known Limitations
The API currently does not support the following [Synthetic Test Types](https://kb.kentik.com/v4/Ma00.htm#Ma00-Synthetic_Test_Types):
* BGP Monitor tests, which are supported in a [separate API](https://github.com/kentik/api-schema-public/blob/master/proto/kentik/bgp_monitoring/v202205beta1/bgp_monitoring.proto)
* Transaction tests.

### Additional Public Resources
Kentik community [Python](https://github.com/kentik/community_sdk_python) and [Go](https://github.com/kentik/community_sdk_golang) SDKs provide language-specific support for using this and other Kentik APIs. These SDKs can be also used as example code for development. 
 A [Terraform provider](https://registry.terraform.io/providers/kentik/kentik-synthetics) is available for configuring tests and agents for Kentik synthetic monitoring.
# Anatomy of a Synthetic Test
Each `Test` consists of one or more tasks. Tasks are executed by monitoring `Agents` that send synthetic traffic (probes) over the network. The API currently supports following tasks:
| Task name  | Purpose |
|------------|---------|
| ping       | Test basic address, and optionally TCP port reachability |
| traceroute (a.k.a. trace)| Discover unidirectional network path |
| http | Perform a simple HTTP/HTTPS request |
| page-load | Use headless Chromium to execute an HTTP/HTTPS request |
| dns | Execute a DNS query|
| throughput | Execute a throughput task to determine bandwidth |

The set of tasks executed on behalf of a given test depends on the `type` of that test. The following test types are currently supported by the API:
| API type | Portal (UI) equivalent | Tasks |
|---------------|--------------|-------|
| ip | IP Address | ping, traceroute |
| hostname | Hostname | ping, traceroute |
| network_grid | Network Grid | ping, traceroute |
| agent | Agent-to-Agent | ping, traceroute, throughput |
| network_mesh | Network Mesh | ping, traceroute |
| flow | Autonomous Tests (5 variants) | ping, traceroute |
| url | HTTP(S) or API | http, ping (optional), traceroute (optional) |
| page_load | Page Load | page-load, ping (optional), traceroute (optional) |
| dns | DNS Server Monitor | dns |
| dns_grid | DNS Server Grid | dns |

***Note:*** `ping` and `traceroute` tasks are always run together (never one without the other).

# Test Attributes and Settings
The attributes of the test object enable configuration of test settings, access to test metadata, and access to runtime state information.
### State and Metadata Attributes
 The following table lists the metadata and state attributes:
| Attribute | Access | Purpose |
|-----------|--------|---------|
| id | RO | System-generated unique identifier of the test |
| name | RW | User specified name for the test (need not be unique) |
| type | RO (after creation) | Type of the test (set on creation; read-only thereafter) |
| status | RW | Life-cycle status of the test |
| cdate | RO | Creation timestamp |
| edate | RO | Last-modification timestamp |
| created_by | RO | Identity of the user that created the test |
| last_updated_by | RO | Identity of the latest user to modify the test |
| labels | RW | List of names of labels applied to the test |

Test configuration is performed via the test's `settings` attribute. Some settings are common to all tests while others are specific to tests of a given type.
### Common Test Settings
The following settings are used for tests of all types:
| Attribute | Purpose | Required |
|-----------|---------|----------|
| agentIds  | IDs of agents to execute tasks for the test | YES |
| period | Test execution interval in seconds | NO (default 60s) |
| family | IP address family. Used only for tests whose type is url or dns. Selects which type of DNS resource is queried for resolving hostname to target address | NO (default IP_FAMILY_DUAL) |
| notificationChannels | List of notification channels for the test | NO (default empty list) |
| healthSettings | A HealthSettings object that configures health settings for this test, which includes metric thresholds that define health status (warning and critical) and trigger associated alarms. | YES |
| ping | A TestPingSettings object that configures the ping task of the test | NO (default depends on test type) |
| trace | A TestTraceSettings object that configures the trace task of the test | NO (default depends on test type) |
| throughput | A TestThroughputSettings object that configures the throughput task of the test | NO (default depends on test type) |
| tasks | List of names of the tasks that will be executed for this test | YES |

### Type-specific Settings
Each test type has its own configuration object that represents the settings for that type. These type-specific objects are referenced by the attributes in `Test.settings`:
| Test type    | Settings attribute | Configuration object |
|--------------|-------------------------|---------------------------|
| ip           | ip                      | IpTest                    |
| hostname     | hostname                | HostnameTest              |
| network_grid | networkGrid             | IpTest                    |
| agent        | agent                   | AgentTest                 |
| network_mesh | networkMesh             | NetworkMeshTest           |
| flow         | flow                    | FlowTest                  |
| url          | url                     | UrlTest                   |
| page_load    | pageLoad                | PageLoadTest              |
| dns          | dns                     | DnsTest                   |
| dns_grid     | dnsGrid                 | DnsTest                   |

# Test Results
Results of synthetic tests are returned as a sequence of `TestResults` objects. Each such object represents measurements and health evaluation for a single test at specific point in time. Measurements and health evaluation are grouped by agent and by task.
Granularity of timestamps in test results depends on the frequency (period) of the test and on the requested time range. The minimum granularity is 1 minute (even when period < 1 minute). The longer the time range, the lower the granularity.
# Network Traces
Synthetic tests that include the `traceroute` task collect the unidirectional network path from the agent to the target for each agent/target pair. The trace data are returned in the `GetTraceForTestResponse` object. The `paths` attribute of this object contains the collected network path for each agent/target pair and the round-trip time (RTT) to each hop.
Hops in actual network traces are identified by a `nodeId`. The mapping of node IDs to address, name, location, and other attributes of the hop is provided in a map that is stored in the `nodes` attribute of the `GetTraceForTestResponse` object.
# Agents
The Kentik synthetic monitoring system recognizes 2 types of agents:
* **Global** (public): Managed by Kentik and available to every Kentik user. All information about global agents in this API is read-only.
* **Private**: Deployed by each customer and available only to that customer.
To be visible in this API, a private agent must first associate itself with a customer account by contacting the Kentik system (via private API). Once the agent is associated it can be authorized via the API by changing its `status` to `AGENT_STATUS_OK`. For more information about private agent deployment, see [**Synthetic Agent Deployments**](https://kb.kentik.com/v4/Ma01.htm#Ma01-Synthetic_Agent_Deployments).
"E
Kentik API Engineering+https://github.com/kentik/api-schema-public2v202309*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r`
"Kentik synthetic monitoring system:https://kb.kentik.com/v4/Ma00.htm#Ma00-Synthetics_OverviewJ،
 �
*
 2  Synthetics data and admin APIs


 "

 f
	
 f
	
  &
	
 !
	
	 )
	

 )
	
 8
	
 /
	
 -


 �

� �
}
 � � {{.Name}}
2b models
 -------------------------------------------------------
 === AGENT config and status ===


 �

  �!

  �

  � 
�
 �u ksynth, a.k.a network agent (implemented in Rust) capable of running all tasks except for page-load and transaction


 �

 �
y
 �k ksynth-agent, a.k.a. app agent (implemented in NodeJS) with Chromium enabled capable of running all tasks


 �

 �
�
 �z ksynth-agent, a.k.a. app agent with Chromium disabled, capable of running all tasks except for page-load and transaction


 �

 �

 � �

 �

  �

  �

  �

  �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 	�

 	�

 	�

 	�

 
�

 
�

 
�

 
�

 �!

 �

 �

 � 

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

���

��

�

�

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

�

� �-

���

��

�

�	

�

��

���

��

�

�	

�

��

���

	��

	�

	�'

	�*,

	�-�

	� �-

	���


��


�



�


�


��


���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

� �-

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�


�

�

�

� �

� �-

���

��

�

�	

�

��

�

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�

�

� �

� �-

��

�


�

�

�

��

���

��

�

�

�

��

���

� � {{.Name}}


�

 ��

 �


 �

 �)

 �,-

 �.�

 ���

��

�


�

�(

�+,

�-�

� �-

���

��

�


�

�)

�,-

�.�

���

��

�


�

�(

�+,

�-�

� �-

���

 ��

 �


  �

  �


  �

  �

� � {{.Name}}


�

 � Invalid value.


 �

 �

� IPv4 only


�

�

� IPv6 only


�

�
'
� IPv4 and IPv6 supported


�

�

� � {{.Name}}


�

 � Invalid value.


 �

 �

� Test is active.


�

�

� Test is paused.


�

�
3
�% Test is deleted. Not user settable.


�

�

� Test is preview


�

�

� � {{.Name}}


�

 � Invalid value.


 �

 �
.
�  Agent is ready to accept tests


�

�
2
�$ Agent is waiting for authorization


�

�
5
�' Agent was deleted - not user settable


�

�
;
� � {{.Name}}
2  === TEST config and status ===


�

 ��

 �

 �	

 �

 ��

 � �-

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�

�

��

���

��

�

�

�

��

���

��

�

�!

�$%

�&�

� �-

���

��

�

�!

�$%

�&�

� �-

���

��

�

�)

�,-

�.�

� �-

���

��

�

�.

�13

�4�

� �-

���

	��

	�


	�

	�

	�

	��

	���

� � {{.Name}}


�

 � Invalid value


 �

 �
0
�" name to IPv4 address(es) mapping


�

�
0
�" name to IPv6 address(es) mapping


�

�
)
� alternative resource name


�

�
-
� alternative resource set name


�

�
-
� domain to name server mapping


�

�
'
� SMTP mail server record


�

�
.
�  IPv4/6 address to name mapping


�

�
 
� domain meta-data


�

�

� � {{.Name}}


�

 ��

 �

 �

 �

 �

 �

�

�


�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�


�

�

�

�

�

�

�

�

�

�

	�&

	�

	� 

	�#%


��


�



�


�


� 


�!�


���

��

�


�

�

�

��

���

��

�

� 

�#%

�&�

���

��

�

�

�

��

���

��

�

�

�

��

���

��

�

�	

�

��

���

��

�


�

�

��

���

��

�


�

�'

�*,

�-�

���

��

�

�	

�

��

���

��

�

�#

�&(

�)�

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

	� � {{.Name}}


	�

	 ��

	 �

	 �

	 �

	 ��

	 ���

	��

	�

	�

	�

	��

	���

	��

	�

	�

	� 

	�!�

	���

	��

	�

	�

	�

	� �

	���

	��

	�

	�

	�

	��

	���

	��

	�

	�

	�

	��

	���

	��

	�

	�

	� !

	�"�

	���

	��

	�

	�

	� 

	�!�

	���

	��

	�


	�

	�"

	�%&

	�'�

	���

		��

		�


		�

		�!

		�$&

		�'�

		���

	
��

	
�

	
�

	
�"$

	
�%�

	
���

	��

	�

	�

	�!#

	�$�

	���

	��

	�

	�

	�!#

	�$�

	���

	��

	�

	�

	� "

	�#�

	���

	��

	�

	�$

	�')

	�*�

	���

	��

	�

	�#

	�&(

	�)�

	���

	��

	�

	�	$

	�')

	�*�

	�

	���

	��

	�

	�

	�"$

	�%�

	���

	��

	�

	�	

	�!

	�"�

	���

	��

	�

	�	

	� "

	�#�

	���

	��

	�

	�	

	�

	��

	���

	��

	�

	�

	�!

	�"�

	���

	��

	�

	�

	� 

	�!�

	���

	��

	�

	�#

	�&(

	�)�

	���

	��

	�

	�"

	�%'

	�(�

	���

	��

	�

	�

	�

	��

	�

	���

	��

	�

	�"

	�%'

	�(�

	���

	��

	�

	�

	�

	��

	���

	��

	�

	�

	� 

	�!�

	���

	��

	�

	�

	�

	� �

	���

	��

	�

	�"

	�%'

	�(�

	���

	��

	�

	�!

	�$&

	�'�

	���


� � {{.Name}}



�


 ��


 �


 �	


 �


 ��


 ���

� � {{.Name}}


�

 ��

 �


 �

 �

 �

 ��

 ���

��

�

�

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�

�

��

���

��

�

�

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	'

�*+

�,�

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

�

���

��

�

�

�

��

���

��

�


�

�

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�

� !

�"�

���

��

�

�	

�

��

���

��

�

�

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�

� !

�"�

���

��

�

�

�

��

���

��

�

�#

�&'

�(�

���

� � {{.Name}}


�

 ��

 �

 �

 �

 ��

 ���
-
� � {{.Name}}
2 === TEST RESULTS


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�

� 

�!�

���

��

�

�

�

��

���

��

�

�

�

��

���

��

�

�	

�

��

���

� � {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�	

�

��

���

��

�

�	

�

��

���

� �	 {{.Name}}


�

 ��

 �

 �	

 �

 ��

 ���

��

�

�

�

��

���

��

�

�

�

� �

���

��	

�

�	

�

��	

���	

�	 �	 {{.Name}}


�	

 �	�	

 �	

 �		

 �	

 �	�	

 ��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	 �	 {{.Name}}


�	

 �	�	

 �	

 �		

 �	

 �	�	

 ��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	�	

�	

�	

�	

�	�	

��	�	

�	�	

�	

�	

�	

�	�	

��	�	

�	 �	 {{.Name}}


�	

 �	�	

 �	

 �	�	

 �	

 �	

 �	

 �	�	

 ��	�	

�	�	

�	

�	

�	

�	�	

��	�	

�	�	

�	

�	

�	

�	�	

��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	 �	 {{.Name}}


�	

 �	�	

 �	

 �		

 �	

 �	�	

 ��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	�	

�	


�	

�	

�	 

�	!�	

��	�	

�	 �	 {{.Name}}


�	

 �	�	

 �	

 �		

 �	

 �	�	

 ��	�	

�	�	

�	

�	 

�	#$

�	%�	

��	�	

�	�	

�	

�		

�	

�	�	

��	�	

�	�	

�	


�	

�	

�	!"

�	#�	

��	�	
7
�	 �
 {{.Name}}
2 === TEST TRACE results ===


�	

 �	�	

 �	

 �	

 �	

 �	�	

 ��	�	

�	�	

�	

�	

�	

�	�	

��	�	

�	�


�	

�	

�	

�	�


��	�


�
 �
 {{.Name}}


�


 �
�


 �


 �
	

 �


 �
�


 ��
�


�
�


�


�
	

�


�
�


��
�


�
�


�


�
	

�


�
�


��
�


�
�


�


�
	

�


�
�


��
�


�
�


�


�
	

�


�
�


��
�


�
 �
 {{.Name}}


�


 �
�


 �


 �
	

 �


 �
�


 ��
�


�
�


�


�
	

�


�
�


��
�


�
�


�


�
	

�


�
�


��
�


�
�


�



�


�


�
�


��
�


�
�


�


�
	

�


�
�


��
�


�
�


�


�
	

�


�
�


��
�


�
�


�


�
	

�


�
�


��
�


�
 �
 {{.Name}}


�


 �
�


 �


 �


 �


 �
�


 ��
�


�
�


�


�
	

�


�
�


��
�


 �
 �
 {{.Name}}


 �


  �
�


  �



  �


  �


  �


  �
�


  ��
�


 �
�


 �


 �


 �


 �
�


 ��
�


 �
�


 �



 �


 �


 �


 �
�


 ��
�


!�
 � {{.Name}}


!�


! �
�


! �


! �
	

! �


! �
�


! ��
�


!�
�


!�


!�
	

!�


!�
�


!��
�


!�
�


!�


!�


!�


!�
�


!��
�


!�
�


!�


!�


!�


!�
�


!��
�


!��

!�


!�

!�

!�

!� �

!���

!��

!�

!� 

!�#$

!�%�

!���
b
"� � {{.Name}}
2G Data Service
 -------------------------------------------------------


"�!

" ��

" �


" �

" �

" �

" ��

" ���

" � �*

"��

"�

"�&

"�)*

"�+�

"���

"� �*

"��

"�

"�$

"�'(

"�)�

"���

"� �*

"��

"�


"�

"�

"�

"� �

"���

"��

"�


"�

"�

"�

"��

"���

"��

"�

"�

"�

"��

"���

#� � {{.Name}}


#�"

# �#

# �


# �

# �

# �!"

$� � {{.Name}}


$�

$ ��

$ �

$ �	

$ �

$ ��

$ ���

$��

$�

$�&

$�)*

$�+�

$���

$� �*

$��

$�

$�$

$�'(

$�)�

$���

$� �*

$��

$�


$�

$�

$�

$� �

$���

$��

$�


$�

$�

$� 

$�!�

$���

%� � {{.Name}}


%�

% ��

% �

% �

% � !

% �"�

% ���

%��

%�


%�

%�

%�

%��

%���

 � �

 �

 �;

 ��;

 �F

 �+�F

 �<

 �*�<
<
  ��, Get measurement results for a set of tests


  �

  �3

  �>X

  �B

  �*�B

  ��

	  �ʼ"��

  ��

  ���

 ��

 �

 �-

 �8O

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���
a
&�  {{.Name}}
2H Admin Service
 -------------------------------------------------------


&�

'� � {{.Name}}


'�

' ��

' �


' �

' �

' �

' ��

' ���

'��

'�

'�	

'�

'��

'���

(� � {{.Name}}


(�

( ��

( �

( �	

( �

( ��

( ���

( � �*

)� � {{.Name}}


)�

) ��

) �

) �

) �

) ��

) ���

*� � {{.Name}}


*�

* ��

* �

* �

* �

* ��

* ���

+� � {{.Name}}


+�

+ ��

+ �

+ �

+ �

+ ��

+ ���

,� � {{.Name}}


,�

, ��

, �

, �	

, �

, ��

, ���

, � �*

-�  {{.Name}}


-�

.�  {{.Name}}


.�

/� � {{.Name}}


/�

/ ��

/ �


/ �

/ �

/ �

/ ��

/ ���

/��

/�

/�	

/�

/��

/���

0� � {{.Name}}


0�

0 ��

0 �

0 �

0 �

0 ��

0 ���

0 � �*

1� � {{.Name}}


1�

1 ��

1 �

1 �

1 �

1 ��

1 ���

2� � {{.Name}}


2�

2 ��

2 �

2 �	

2 �

2 ��

2 ���

2 � �*

3� � {{.Name}}


3�

3 ��

3 �

3 �

3 �

3 ��

3 ���

4� � {{.Name}}


4�

4 ��

4 �

4 �

4 �

4 ��

4 ���

5� � {{.Name}}


5�

5 ��

5 �

5 �

5 �

5 ��

5 ���

6� � {{.Name}}


6�

6 ��

6 �

6 �	

6 �

6 ��

6 ���

6 � �*

7�  {{.Name}}


7�

8� � {{.Name}}


8�

8 ��

8 �

8 �	

8 �

8 ��

8 ���

8 � �*

8��

8�

8�

8�

8��

8���

8� �*

9�   {{.Name}}


9�

:� �

:�

: �

: �

: �	

: �

:�

:�

:�	

:�

:�/

:�


:�

:�*

:�-.

:�

:�

:�	

:�

:�

:�

:�	

:�

;� �

;�

; �

; �

; �	

; �

;�/

;�


;�

;�*

;�-.

;�

;�

;�	

;�

<� �

<� 

< �

< �

< �

< �

=� �

=�

= �

= �

= �	

= �

=�

=�

=�	

=�

=�/

=�


=�

=�*

=�-.

>� �

>� 

> �

> �

> �

> �

?� �

?�

? �

? �

? �	

? �

@� �

@�

@ �

@ �

@ �

@ �

A� �

A�
O
A � "A Optional list of agent ids to retrieve alert configurations for


A �


A �

A �

A �

B� �

B�

B �'

B �


B �

B �"

B �%&

C� �

C�

C �

C �

C �	

C �


D� #

D� 

� �

�

�;

��;

�F

�+�F

�B

�*�B

 ��

 �

 �"

 �-?

 �H

 �*�H

 �N

 �+�N

 ��

	 �ʼ"��

 ��

 ���

��

�

�

�)9

�H

�*�H

�N

�+�N

��

	�ʼ"��

��

���

��

�

�$

�/B

�I

�*�I

�P

�+�P

��

	�ʼ"��

��

���

��

�

�$

�/B

�I

�*�I

�P

�+�P

��

	�ʼ"��

��

���

��

�

� 

�+<

�H

�*�H

�M

�+�M

��

	�ʼ"��

��

���

��

�

�"

�-?

�I

�*�I

�O

�+�O

��

	�ʼ"��

��

���

��

�

�

�'6

�H

�*�H

�M

�+�M

��

	�ʼ"��

��

���

��

�

�"

�-?

�I

�*�I

�O

�+�O

��

	�ʼ"��

��

���

��

�

�"

�-?

�I

�*�I

�O

�+�O

��

	�ʼ"��

��

���

	��

	�

	�(

	�3H

	�I

	�*�I

	�O

	�+�O

	��

		�ʼ"��

	��

	���


��


�


�.


�9Q


�I


�*�I


�P


�+�P


��

	
�ʼ"��


��


���

��

�

�.

�9Q

�I

�*�I

�P

�+�P

��

	�ʼ"��

��

���

��

�

�(

�3H

�H

�*�H

�N

�+�N

��

	�ʼ"��

��

���

��

�

�,

�7N

�H

�*�H

�N

�+�N

��

	�ʼ"��

��

���

��

�

�.

�9Q

�I

�*�I

�P

�+�P

��

	�ʼ"��

��

���bproto3��  
�/
$kentik/user/v202106alpha1/user.protokentik.user.v202106alpha1google/api/annotations.protogoogle/api/client.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto%kentik/core/v202303/annotations.proto"�
User
id (	Rid

user_email (	R	userEmail
username (	Rusername$
user_full_name (	RuserFullName3
role (2.kentik.user.v202106alpha1.RoleRrole9

last_login (2.google.protobuf.TimestampR	lastLogin=
created_date (2.google.protobuf.TimestampRcreatedDate=
updated_date (2.google.protobuf.TimestampRupdatedDate"
ListUserRequest"n
ListUserResponse5
users (2.kentik.user.v202106alpha1.UserRusers#
invalid_count (RinvalidCount" 
GetUserRequest
id (	Rid"F
GetUserResponse3
user (2.kentik.user.v202106alpha1.UserRuser"H
CreateUserRequest3
user (2.kentik.user.v202106alpha1.UserRuser"I
CreateUserResponse3
user (2.kentik.user.v202106alpha1.UserRuser"H
UpdateUserRequest3
user (2.kentik.user.v202106alpha1.UserRuser"I
UpdateUserResponse3
user (2.kentik.user.v202106alpha1.UserRuser"#
DeleteUserRequest
id (	Rid"
DeleteUserResponse*�
Landing
LANDING_UNSPECIFIED 
LANDING_OBSERVATION_DECK
LANDING_NETWORK_EXPLORER
LANDING_LIBRARY
LANDING_EXPLORER
LANDING_ALERTING
LANDING_SYNTHETICS*c
Role
ROLE_UNSPECIFIED 
ROLE_MEMBER
ROLE_ADMINISTRATOR
ROLE_SUPER_ADMINISTRATOR2�

UserService�
ListUser*.kentik.user.v202106alpha1.ListUserRequest+.kentik.user.v202106alpha1.ListUserResponse"p�A9List users. Returns a list of user accounts.*UserList��admin.user:read���/user/v202106alpha1/users�
GetUser).kentik.user.v202106alpha1.GetUserRequest*.kentik.user.v202106alpha1.GetUserResponse"��AYGet a user account.9Returns information about user account specified with ID.*UserGet��admin.user:read��� /user/v202106alpha1/users/{id}�

CreateUser,.kentik.user.v202106alpha1.CreateUserRequest-.kentik.user.v202106alpha1.CreateUserResponse"��AbCreate a user account.<Create a user account from request. returns created account.*
UserCreate��admin.user:write���"/user/v202106alpha1/users:*�

UpdateUser,.kentik.user.v202106alpha1.UpdateUserRequest-.kentik.user.v202106alpha1.UpdateUserResponse"��AdUpdate a user account.>Replaces the entire user account attributes specified with id.*
UserUpdate��admin.user:write���(#/user/v202106alpha1/users/{user.id}:*�

DeleteUser,.kentik.user.v202106alpha1.DeleteUserRequest-.kentik.user.v202106alpha1.DeleteUserResponse"��AQDelete a user account.+Deletes the user account specified with id.*
UserDelete��admin.user:write��� */user/v202106alpha1/users/{id}(�Agrpc.api.kentik.com��
admin.user��B�ZIgithub.com/kentik/api-schema-public/gen/go/kentik/user/v202106alpha1;user�A��
User management APIK--- This API has been deprecated and will be removed in the near future ---"7
Kentik API Engineeringhttps://github.com/kentik/api2202102alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r]
%General information about Kentik APIs4https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_OverviewJ�
  �

  

 "

 `
	
 `
	
  &
	
 !
	
 )
	
 8
	
	 /
	
 8

� 8


 : B


 :

  ;

  ;

  ;

 <

 <

 <

 =

 =

 =

 >

 >

 >

 ?

 ?

 ?

 @

 @

 @

 A

 A

 A


D I


D	

 E

 E

 E

F

F

F

G

G

G

H

H

H


 K T


 K

  L

  L

  L	

  L

 M

 M

 M	

 M

 N

 N

 N	

 N

 O

 O

 O	

 O

 P

 P

 P

 P

 Q+

 Q

 Q&

 Q)*

 R-

 R

 R(

 R+,

 S-

 S

 S(

 S+,
	
V 


V


W Z


W

 X

 X


 X

 X

 X

Y

Y

Y	

Y


\ ^


\

 ]

 ]

 ]	

 ]


_ a


_

 `

 `

 `

 `


c e


c

 d

 d

 d

 d


f h


f

 g

 g

 g

 g


j l


j

 k

 k

 k

 k


m o


m

 n

 n

 n

 n


	q s


	q

	 r

	 r

	 r	

	 r
	

t 



t

 w �


 w


 x;

 �x;


 yF

 �+yF


 z<

 �*z<

  |�

  |

  |

  |)9

  }B

  �*}B

  ~�

	  �ʼ"~�

  ��

  ���

 ��

 �

 �

 �'6

 �B

 �*�B

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �"

 �-?

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �"

 �-?

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���

 ��

 �

 �"

 �-?

 �C

 �*�C

 ��

	 �ʼ"��

 ��

 ���bproto3��  