
?x
google/api/http.proto
google.api"y
Http*
rules (2.google.api.HttpRuleRrulesE
fully_decode_reserved_expansion (RfullyDecodeReservedExpansion"?
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
com.google.apiB	HttpProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations??GAPIJ?s
 ?
?
 2? Copyright 2020 Google LLC

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
?
  )? Defines the HTTP configuration for an API service. It contains a list of
 [HttpRule][google.api.HttpRule], each specifying the mapping of an RPC method
 to one or more HTTP REST API methods.



 
?
   ? A list of HTTP configuration rules that apply to individual API methods.

 **NOTE:** All service configuration rules follow "last one wins" order.


   


   

   

   
?
 (+? When set to true, URL path parameters will be fully URI-decoded except in
 cases of single segment matches in reserved expansion, where "%2F" will be
 left encoded.

 The default behavior is to not decode RFC 6570 reserved characters in multi
 segment matches.


 (

 (&

 ()*
?S
? ??S # gRPC Transcoding

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
    - Fields referred by the [HttpRule.body][google.api.HttpRule.body]. They are passed via the HTTP
      request body.
    - All other fields are passed via the URL query parameters, and the
      parameter name is the field path in the request message. A repeated
      field can be represented as multiple query parameters under the same
      name.
  2. If [HttpRule.body][google.api.HttpRule.body] is "*", there is no URL query parameter, all fields
     are passed via URL path and HTTP request body.
  3. If [HttpRule.body][google.api.HttpRule.body] is omitted, there is no HTTP request body, all
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


?
?
 ? Selects a method to which this rule applies.

 Refer to [selector][google.api.DocumentationRule.selector] for syntax details.


 ?

 ?	

 ?
?
 ??? Determines the URL pattern is matched by this rules. This pattern can be
 used with any of the {get|put|post|delete|patch} methods. A custom method
 can be defined using the 'custom' field.


 ?
\
?N Maps to HTTP GET. Used for listing and getting information about
 resources.


?


?

?
@
?2 Maps to HTTP PUT. Used for replacing a resource.


?


?

?
X
?J Maps to HTTP POST. Used for creating a resource or performing an action.


?


?

?
B
?4 Maps to HTTP DELETE. Used for deleting a resource.


?


?

?
A
?3 Maps to HTTP PATCH. Used for updating a resource.


?


?

?
?
?!? The custom pattern is used for specifying an HTTP method that is not
 included in the `pattern` field, such as HEAD, or "*" to leave the
 HTTP method unspecified for this rule. The wild-card rule is useful
 for services that provide content to Web (HTML) clients.


?

?

? 
?
?? The name of the request field whose value is mapped to the HTTP request
 body, or `*` for mapping all request fields not captured by the path
 pattern to the HTTP body, or omitted for not having any HTTP request body.

 NOTE: the referred field must be present at the top-level of the request
 message type.


?

?	

?
?
?? Optional. The name of the response field whose value is mapped to the HTTP
 response body. When omitted, the entire response message will be used
 as the HTTP response body.

 NOTE: The referred field must be present at the top-level of the response
 message type.


?

?	

?
?
	?-? Additional HTTP bindings for the selector. Nested bindings must
 not contain an `additional_bindings` field themselves (that is,
 the nesting may only be one level deep).


	?


	?

	?'

	?*,
G
? ?9 A custom pattern is used for defining custom HTTP verb.


?
2
 ?$ The name of this custom HTTP verb.


 ?

 ?	

 ?
5
?' The path matched by this custom verb.


?

?	

?bproto3??  
??
 google/protobuf/descriptor.protogoogle.protobuf"M
FileDescriptorSet8
file (2$.google.protobuf.FileDescriptorProtoRfile"?
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
syntax (	Rsyntax"?
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
end (Rend"|
ExtensionRangeOptionsX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????"?
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
proto3_optional (Rproto3Optional"?
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
options (2.google.protobuf.OneofOptionsRoptions"?
EnumDescriptorProto
name (	Rname?
value (2).google.protobuf.EnumValueDescriptorProtoRvalue6
options (2.google.protobuf.EnumOptionsRoptions]
reserved_range (26.google.protobuf.EnumDescriptorProto.EnumReservedRangeRreservedRange#
reserved_name (	RreservedName;
EnumReservedRange
start (Rstart
end (Rend"?
EnumValueDescriptorProto
name (	Rname
number (Rnumber;
options (2!.google.protobuf.EnumValueOptionsRoptions"?
ServiceDescriptorProto
name (	Rname>
method (2&.google.protobuf.MethodDescriptorProtoRmethod9
options (2.google.protobuf.ServiceOptionsRoptions"?
MethodDescriptorProto
name (	Rname

input_type (	R	inputType
output_type (	R
outputType8
options (2.google.protobuf.MethodOptionsRoptions0
client_streaming (:falseRclientStreaming0
server_streaming (:falseRserverStreaming"?	
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
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption":
OptimizeMode	
SPEED
	CODE_SIZE
LITE_RUNTIME*	?????J&'"?
MessageOptions<
message_set_wire_format (:falseRmessageSetWireFormatL
no_standard_descriptor_accessor (:falseRnoStandardDescriptorAccessor%

deprecated (:falseR
deprecated
	map_entry (RmapEntryX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????J	J	
"?
FieldOptionsA
ctype (2#.google.protobuf.FieldOptions.CType:STRINGRctype
packed (RpackedG
jstype (2$.google.protobuf.FieldOptions.JSType:	JS_NORMALRjstype
lazy (:falseRlazy%

deprecated (:falseR
deprecated
weak
 (:falseRweakX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption"/
CType

STRING 
CORD
STRING_PIECE"5
JSType
	JS_NORMAL 
	JS_STRING
	JS_NUMBER*	?????J"s
OneofOptionsX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????"?
EnumOptions
allow_alias (R
allowAlias%

deprecated (:falseR
deprecatedX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????J"?
EnumValueOptions%

deprecated (:falseR
deprecatedX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????"?
ServiceOptions%

deprecated! (:falseR
deprecatedX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	?????"?
MethodOptions%

deprecated! (:falseR
deprecatedq
idempotency_level" (2/.google.protobuf.MethodOptions.IdempotencyLevel:IDEMPOTENCY_UNKNOWNRidempotencyLevelX
uninterpreted_option? (2$.google.protobuf.UninterpretedOptionRuninterpretedOption"P
IdempotencyLevel
IDEMPOTENCY_UNKNOWN 
NO_SIDE_EFFECTS

IDEMPOTENT*	?????"?
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
is_extension (RisExtension"?
SourceCodeInfoD
location (2(.google.protobuf.SourceCodeInfo.LocationRlocation?
Location
path (BRpath
span (BRspan)
leading_comments (	RleadingComments+
trailing_comments (	RtrailingComments:
leading_detached_comments (	RleadingDetachedComments"?
GeneratedCodeInfoM

annotation (2-.google.protobuf.GeneratedCodeInfo.AnnotationR
annotationm

Annotation
path (BRpath
source_file (	R
sourceFile
begin (Rbegin
end (RendB~
com.google.protobufBDescriptorProtosHZ-google.golang.org/protobuf/types/descriptorpb??GPB?Google.Protobuf.ReflectionJ??
' ?
?
' 2? Protocol Buffers - Google's data interchange format
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
2? Author: kenton@google.com (Kenton Varda)
  Based on original Protocol Buffers design by
  Sanjay Ghemawat, Jeff Dean, and others.

 The messages in this file describe the definitions found in .proto files.
 A valid .proto file can be translated directly to a FileDescriptorProto
 without any other information (e.g. without reading its imports).


) 

+ D
	
+ D

, ,
	
, ,

- 1
	
- 1

. 7
	
%. 7

/ !
	
$/ !

0 
	
0 

4 

	4 t descriptor.proto must be optimized for speed because reflection-based
 algorithms don't work during bootstrapping.

j
 8 :^ The protocol compiler can output a FileDescriptorSet containing the .proto
 files it parses.



 8

  9(

  9


  9

  9#

  9&'
/
= Z# Describes a complete .proto file.



=
9
 >", file name, relative to root of source tree


 >


 >

 >

 >
*
?" e.g. "foo", "foo.bar", etc.


?


?

?

?
4
B!' Names of files imported by this file.


B


B

B

B 
Q
D(D Indexes of the public imported files in the dependency list above.


D


D

D"

D%'
z
G&m Indexes of the weak imported files in the dependency list.
 For Google-internal migration only. Do not use.


G


G

G 

G#%
6
J,) All top-level definitions in this file.


J


J

J'

J*+

K-

K


K

K(

K+,

L.

L


L!

L")

L,-

M.

M


M

M )

M,-

	O#

	O


	O

	O

	O!"
?

U/? This field contains optional information about the original source code.
 You may safely remove this entire field without harming runtime
 functionality of the descriptors -- the information is needed only by
 development tools.



U



U


U*


U-.
]
YP The syntax of the proto file.
 The supported values are "proto2" and "proto3".


Y


Y

Y

Y
'
] } Describes a message type.



]

 ^

 ^


 ^

 ^

 ^

`*

`


`

` %

`()

a.

a


a

a )

a,-

c+

c


c

c&

c)*

d-

d


d

d(

d+,

 fk

 f


  g" Inclusive.


  g

  g

  g

  g

 h" Exclusive.


 h

 h

 h

 h

 j/

 j

 j"

 j#*

 j-.

l.

l


l

l)

l,-

n/

n


n

n *

n-.

p&

p


p

p!

p$%
?
ux? Range of reserved tag numbers. Reserved tag numbers may not be used by
 fields or extension ranges in the same message. Reserved ranges may
 not overlap.


u


 v" Inclusive.


 v

 v

 v

 v

w" Exclusive.


w

w

w

w

y,

y


y

y'

y*+
?
	|%u Reserved field names, which may not be used by fields in the same message.
 A given name may only be reserved once.


	|


	|

	|

	|"$

 ?



O
 ?:A The parser stores options it doesn't recognize here. See above.


 ?


 ?

 ?3

 ?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?
3
? ?% Describes a field within a message.


?

 ??

 ?
S
  ?C 0 is reserved for errors.
 Order is weird for historical reasons.


  ?

  ?

 ?

 ?

 ?
w
 ?g Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT64 if
 negative values are likely.


 ?

 ?

 ?

 ?

 ?
w
 ?g Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT32 if
 negative values are likely.


 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?
?
 	?? Tag-delimited aggregate.
 Group type is deprecated and not supported in proto3. However, Proto3
 implementations should still be able to parse the group wire format and
 treat group fields as unknown fields.


 	?

 	?
-
 
?" Length-delimited aggregate.


 
?

 
?
#
 ? New in version 2.


 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?
'
 ?" Uses ZigZag encoding.


 ?

 ?
'
 ?" Uses ZigZag encoding.


 ?

 ?

??

?
*
 ? 0 is reserved for errors


 ?

 ?

?

?

?

?

?

?

 ?

 ?


 ?

 ?

 ?

?

?


?

?

?

?

?


?

?

?
?
?? If type_name is set, this need not be set.  If both this and type_name
 are set, this must be one of TYPE_ENUM, TYPE_MESSAGE or TYPE_GROUP.


?


?

?

?
?
? ? For message and enum types, this is the name of the type.  If the name
 starts with a '.', it is fully-qualified.  Otherwise, C++-like scoping
 rules are used to find the type (i.e. first the nested types within this
 message are searched, then within the parent, on up to the root
 namespace).


?


?

?

?
~
?p For extensions, this is the name of the type being extended.  It is
 resolved in the same manner as type_name.


?


?

?

?
?
?$? For numeric types, contains the original text representation of the value.
 For booleans, "true" or "false".
 For strings, contains the default text contents (not escaped in any way).
 For bytes, contains the C escaped value.  All bytes >= 128 are escaped.
 TODO(kenton):  Base-64 encode?


?


?

?

?"#
?
?!v If set, gives the index of a oneof in the containing type's oneof_decl
 list.  This field is a member of that oneof.


?


?

?

? 
?
?!? JSON name of this field. The value is set by protocol compiler. If the
 user has set a "json_name" option on this field, that option's value
 will be used. Otherwise, it's deduced from the field's name by converting
 it to camelCase.


?


?

?

? 

	?$

	?


	?

	?

	?"#
?	

?%?	 If true, this is a proto3 "optional". When a proto3 field is optional, it
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
?



?


?


?"$
"
? ? Describes a oneof.


?

 ?

 ?


 ?

 ?

 ?

?$

?


?

?

?"#
'
? ? Describes an enum type.


?

 ?

 ?


 ?

 ?

 ?

?.

?


?#

?$)

?,-

?#

?


?

?

?!"
?
 ??? Range of reserved numeric values. Reserved values may not be used by
 entries in the same enum. Reserved ranges may not overlap.

 Note that this is distinct from DescriptorProto.ReservedRange in that it
 is inclusive such that it can appropriately represent the entire int32
 domain.


 ?


  ?" Inclusive.


  ?

  ?

  ?

  ?

 ?" Inclusive.


 ?

 ?

 ?

 ?
?
?0? Range of reserved numeric values. Reserved numeric values may not be used
 by enum values in the same enum declaration. Reserved ranges may not
 overlap.


?


?

?+

?./
l
?$^ Reserved enum value names, which may not be reused. A given name may only
 be reserved once.


?


?

?

?"#
1
? ?# Describes a value within an enum.


? 

 ?

 ?


 ?

 ?

 ?

?

?


?

?

?

?(

?


?

?#

?&'
$
? ? Describes a service.


?

 ?

 ?


 ?

 ?

 ?

?,

?


? 

?!'

?*+

?&

?


?

?!

?$%
0
	? ?" Describes a method of a service.


	?

	 ?

	 ?


	 ?

	 ?

	 ?
?
	?!? Input and output type names.  These are resolved in the same way as
 FieldDescriptorProto.type_name, but must refer to a message type.


	?


	?

	?

	? 

	?"

	?


	?

	?

	? !

	?%

	?


	?

	? 

	?#$
E
	?77 Identifies if client streams multiple client messages


	?


	?

	? 

	?#$

	?%6

	?&5
E
	?77 Identifies if server streams multiple server messages


	?


	?

	? 

	?#$

	?%6

	?&5
?

? ?2N ===================================================================
 Options
2? Each of the definitions above may have "options" attached.  These are
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
?
?

 ?#? Sets the Java package where classes generated from this .proto will be
 placed.  By default, the proto package is used, but this is often
 inappropriate because proto packages do not normally start with backwards
 domain names.



 ?



 ?


 ?


 ?!"
?

?+? If set, all the classes from the .proto file are wrapped in a single
 outer class with the given name.  This applies to both Proto1
 (equivalent to the old "--one_java_file" option) and Proto2 (where
 a .proto always translates to a single class, but you may want to
 explicitly choose the class name).



?



?


?&


?)*
?

?;? If set true, then the Java code generator will generate a separate .java
 file for each top-level message, enum, and service defined in the .proto
 file.  Thus, these types will *not* be nested inside the outer class
 named by java_outer_classname.  However, the outer class will still be
 generated to contain the file's getDescriptor() method as well as any
 top-level extensions defined in the file.



?



?


?#


?&(


?):


?*9
)

?E This option does nothing.



?



?


?-


?02


?3D


?4C
?

?>? If set true, then the Java2 code generator will generate code that
 throws an exception whenever an attempt is made to assign a non-UTF-8
 byte sequence to a string field.
 Message reflection will do the same.
 However, an extension field still accepts non-UTF-8 byte sequences.
 This option has no effect on when used with the lite runtime.



?



?


?&


?)+


?,=


?-<
L

 ??< Generated classes can be optimized for speed or code size.



 ?
D

  ?"4 Generate complete code for parsing, serialization,



  ?	


  ?
G

 ? etc.
"/ Use ReflectionOps to implement these methods.



 ?


 ?
G

 ?"7 Generate code using MessageLite and the lite runtime.



 ?


 ?


?;


?



?


?$


?'(


?):


?*9
?

?"? Sets the Go package where structs generated from this .proto will be
 placed. If omitted, the Go package will be derived from the following:
   - The basename of the package import path, if provided.
   - Otherwise, the package statement in the .proto file, if present.
   - Otherwise, the basename of the .proto file, without extension.



?



?


?


?!
?

?;? Should generic services be generated in each language?  "Generic" services
 are not specific to any particular RPC system.  They are generated by the
 main code generators in each language (without additional plugins).
 Generic services were the only kind of service generation supported by
 early versions of google.protobuf.

 Generic services are now considered deprecated in favor of using plugins
 that generate code specific to your particular RPC system.  Therefore,
 these default to false.  Old code which depends on generic services should
 explicitly set them to true.



?



?


?#


?&(


?):


?*9


?=


?



?


?%


?(*


?+<


?,;


	?;


	?



	?


	?#


	?&(


	?):


	?*9



?<



?




?



?$



?')



?*;



?+:
?

?2? Is this file deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for everything in the file, or it will be completely ignored; in the very
 least, this is a formalization for deprecating files.



?



?


?


?


? 1


?!0


?7q Enables the use of arenas for the proto messages in this file. This applies
 only to generated classes for C++.



?



?


? 


?#%


?&6


?'5
?

?)? Sets the objective c class prefix which is prepended to all objective c
 generated classes from this .proto. There is no default.



?



?


?#


?&(
I

?(; Namespace for generated classes; defaults to the package.



?



?


?"


?%'
?

?$? By default Swift generators will take the proto package and CamelCase it
 replacing '.' with underscore and use that to prefix the types/symbols
 defined. When this options is provided, they will use this value instead
 to prefix the types/symbols defined.



?



?


?


?!#
~

?(p Sets the php class prefix which is prepended to all php generated classes
 from this .proto. Default is empty.



?



?


?"


?%'
?

?%? Use this option to change the namespace of php generated classes. Default
 is empty. When this option is empty, the package name will be used for
 determining the namespace.



?



?


?


?"$
?

?.? Use this option to change the namespace of php generated metadata classes.
 Default is empty. When this option is empty, the proto file name will be
 used for determining the namespace.



?



?


?(


?+-
?

?$? Use this option to change the package of ruby generated classes. Default
 is empty. When this option is not set, the package name will be used for
 determining the ruby package.



?



?


?


?!#
|

?:n The parser stores options it doesn't recognize here.
 See the documentation for the "Options" section above.



?



?


?3


?69
?

?z Clients can define custom options in extensions of this message.
 See the documentation for the "Options" section above.



 ?


 ?


 ?


	?


	 ?


	 ?

? ?

?
?
 ?>? Set true to use the old proto1 MessageSet wire format for extensions.
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


 ?


 ?

 ?'

 ?*+

 ?,=

 ?-<
?
?F? Disables the generation of the standard "descriptor()" accessor, which can
 conflict with a field of the same name.  This is meant to make migration
 from proto1 easier; new code should avoid fields named "descriptor".


?


?

?/

?23

?4E

?5D
?
?1? Is this message deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the message, or it will be completely ignored; in the very least,
 this is a formalization for deprecating messages.


?


?

?

?

?0

? /
?
?? Whether the message is an automatically generated map entry type for the
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

 NOTE: Do not set the option in .proto files. Always use the maps syntax
 instead. The option should only be implicitly set by the proto compiler
 parser.


?


?

?

?
$
	?" javalite_serializable


	 ?

	 ?

	?" javanano_as_lite


	?

	?
O
?:A The parser stores options it doesn't recognize here. See above.


?


?

?3

?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?

? ?

?
?
 ?.? The ctype option instructs the C++ code generator to use a different
 representation of the field than it normally would.  See the specific
 options below.  This option is not yet implemented in the open source
 release -- sorry, we'll try to include it in a future version!


 ?


 ?

 ?

 ?

 ?-

 ?,

 ??

 ?

  ? Default mode.


  ?


  ?

 ?

 ?

 ?

 ?

 ?

 ?
?
?? The packed option can be enabled for repeated primitive fields to enable
 a more efficient representation on the wire. Rather than repeatedly
 writing the tag and type for each element, the entire array is encoded as
 a single length-delimited blob. In proto3, only explicit setting it to
 false will avoid using packed encoding.


?


?

?

?
?
?3? The jstype option determines the JavaScript type used for values of the
 field.  The option is permitted only for 64 bit integral and fixed types
 (int64, uint64, sint64, fixed64, sfixed64).  A field with jstype JS_STRING
 is represented as JavaScript string, which avoids loss of precision that
 can happen when a large value is converted to a floating point JavaScript.
 Specifying JS_NUMBER for the jstype causes the generated JavaScript code to
 use the JavaScript "number" type.  The behavior of the default option
 JS_NORMAL is implementation dependent.

 This option is an enum to permit additional types to be added, e.g.
 goog.math.Integer.


?


?

?

?

?2

?1

??

?
'
 ? Use the default type.


 ?

 ?
)
? Use JavaScript strings.


?

?
)
? Use JavaScript numbers.


?

?
?
?+? Should this field be parsed lazily?  Lazy applies only to message-type
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


?


?

?

?

?*

?)
?
?1? Is this field deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for accessors, or it will be completely ignored; in the very least, this
 is a formalization for deprecating fields.


?


?

?

?

?0

? /
?
?,1 For Google-internal migration only. Do not use.


?


?

?

?

?+

?*
O
?:A The parser stores options it doesn't recognize here. See above.


?


?

?3

?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?

	?" removed jtype


	 ?

	 ?

? ?

?
O
 ?:A The parser stores options it doesn't recognize here. See above.


 ?


 ?

 ?3

 ?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?

? ?

?
`
 ? R Set this option to true to allow mapping different tag names to the same
 value.


 ?


 ?

 ?

 ?
?
?1? Is this enum deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the enum, or it will be completely ignored; in the very least, this
 is a formalization for deprecating enums.


?


?

?

?

?0

? /

	?" javanano_as_lite


	 ?

	 ?
O
?:A The parser stores options it doesn't recognize here. See above.


?


?

?3

?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?

? ?

?
?
 ?1? Is this enum value deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the enum value, or it will be completely ignored; in the very least,
 this is a formalization for deprecating enum values.


 ?


 ?

 ?

 ?

 ?0

 ? /
O
?:A The parser stores options it doesn't recognize here. See above.


?


?

?3

?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?

? ?

?
?
 ?2? Is this service deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the service, or it will be completely ignored; in the very least,
 this is a formalization for deprecating services.
2? Note:  Field numbers 1 through 32 are reserved for Google's internal RPC
   framework.  We apologize for hoarding these numbers to ourselves, but
   we were already using them long before we decided to release Protocol
   Buffers.


 ?


 ?

 ?

 ?

 ? 1

 ?!0
O
?:A The parser stores options it doesn't recognize here. See above.


?


?

?3

?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?

? ?

?
?
 ?2? Is this method deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the method, or it will be completely ignored; in the very least,
 this is a formalization for deprecating methods.
2? Note:  Field numbers 1 through 32 are reserved for Google's internal RPC
   framework.  We apologize for hoarding these numbers to ourselves, but
   we were already using them long before we decided to release Protocol
   Buffers.


 ?


 ?

 ?

 ?

 ? 1

 ?!0
?
 ??? Is this method side-effect-free (or safe in HTTP parlance), or idempotent,
 or neither? HTTP based RPC implementation may choose GET verb for safe
 methods, and PUT verb for idempotent methods instead of the default POST.


 ?

  ?

  ?

  ?
$
 ?" implies idempotent


 ?

 ?
7
 ?"' idempotent, but may have side effects


 ?

 ?

??&

?


?

?-

?02

?%

?$
O
?:A The parser stores options it doesn't recognize here. See above.


?


?

?3

?69
Z
?M Clients can define custom options in extensions of this message. See above.


 ?

 ?

 ?
?
? ?? A message representing a option the parser does not recognize. This only
 appears in options protos created by the compiler::Parser class.
 DescriptorPool resolves these when building Descriptor objects. Therefore,
 options protos in descriptor objects (e.g. returned by Descriptor::options(),
 or produced by Descriptor::CopyTo()) will never have UninterpretedOptions
 in them.


?
?
 ??? The name of the uninterpreted option.  Each string represents a segment in
 a dot-separated name.  is_extension is true iff a segment represents an
 extension (denoted with parentheses in options specs in .proto files).
 E.g.,{ ["foo", false], ["bar.baz", true], ["qux", false] } represents
 "foo.(bar.baz).qux".


 ?


  ?"

  ?

  ?

  ?

  ? !

 ?#

 ?

 ?

 ?

 ?!"

 ?

 ?


 ?

 ?

 ?
?
?'? The value of the uninterpreted option, in whatever type the tokenizer
 identified it as during parsing. Exactly one of these should be set.


?


?

?"

?%&

?)

?


?

?$

?'(

?(

?


?

?#

?&'

?#

?


?

?

?!"

?"

?


?

?

? !

?&

?


?

?!

?$%
?
? ?j Encapsulates information about the original source file from which a
 FileDescriptorProto was generated.
2` ===================================================================
 Optional source code info


?
?
 ?!? A Location identifies a piece of source code in a .proto file which
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


 ?


 ?

 ?

 ? 

 ??

 ?

?
  ?,? Identifies which part of the FileDescriptorProto was defined at this
 location.

 Each element is a field number or an index.  They form a path from
 the root FileDescriptorProto to the place where the definition.  For
 example, this path:
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
  ?

  ?

  ?

  ?

  ?+

  ?*
?
 ?,? Always has exactly three or four elements: start line, start column,
 end line (optional, otherwise assumed same as start line), end column.
 These are packed into a single field for efficiency.  Note that line
 and column numbers are zero-based -- typically you will want to add
 1 to each before displaying to a user.


 ?

 ?

 ?

 ?

 ?+

 ?*
?
 ?)? If this SourceCodeInfo represents a complete declaration, these are any
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

   // Comment attached to qux.
   //
   // Another line attached to qux.
   optional double qux = 4;

   // Detached comment for corge. This is not leading or trailing comments
   // to qux or corge because there are blank lines separating it from
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
 ?

 ?

 ?$

 ?'(

 ?*

 ?

 ?

 ?%

 ?()

 ?2

 ?

 ?

 ?-

 ?01
?
? ?? Describes the relationship between generated code and its original source
 file. A GeneratedCodeInfo message is associated with only one generated
 source file, but may contain references to different source .proto files.


?
x
 ?%j An Annotation connects some span of text in generated code to an element
 of its generating .proto file.


 ?


 ?

 ? 

 ?#$

 ??

 ?

?
  ?, Identifies the element in the original source .proto file. This field
 is formatted the same as SourceCodeInfo.Location.path.


  ?

  ?

  ?

  ?

  ?+

  ?*
O
 ?$? Identifies the filesystem path to the original source .proto.


 ?

 ?

 ?

 ?"#
w
 ?g Identifies the starting offset in bytes in the generated code
 that relates to the identified object.


 ?

 ?

 ?

 ?
?
 ?? Identifies the ending offset in bytes in the generated code that
 relates to the identified offset. The end offset should be one past
 the last relevant byte (so the length of the text = end - begin).


 ?

 ?

 ?

 ???  
?
google/api/annotations.proto
google.apigoogle/api/http.proto google/protobuf/descriptor.proto:K
http.google.protobuf.MethodOptions?ʼ" (2.google.api.HttpRuleRhttpBn
com.google.apiBAnnotationsProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations?GAPIJ?
 
?
 2? Copyright (c) 2015, Google Inc.

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


 bproto3??  
?
google/api/client.proto
google.api google/protobuf/descriptor.proto:J
method_signature.google.protobuf.MethodOptions? (	RmethodSignature:C
default_host.google.protobuf.ServiceOptions? (	RdefaultHost:C
oauth_scopes.google.protobuf.ServiceOptions? (	RoauthScopesBi
com.google.apiBClientProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations?GAPIJ?
 b
?
 2? Copyright 2020 Google LLC

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
 ,
	
 ,

 '
	
 '

 "
	
$ "
	
 ?
?
 >*?
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



 $


 >



 >


 >"


 >%)
	
A b
?
K? The hostname for this service.
 This should be specified with no prefix or protocol.

 Example:

   service Foo {
     option (google.api.default_host) = "foo.googleapi.com";
     ...
   }



A%


K


K	


K
?
a? OAuth scopes needed for the client.

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



A%


a


a	


abproto3??  
?
google/api/field_behavior.proto
google.api google/protobuf/descriptor.proto*{
FieldBehavior
FIELD_BEHAVIOR_UNSPECIFIED 
OPTIONAL
REQUIRED
OUTPUT_ONLY

INPUT_ONLY
	IMMUTABLE:`
field_behavior.google.protobuf.FieldOptions? (2.google.api.FieldBehaviorRfieldBehaviorBp
com.google.apiBFieldBehaviorProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations?GAPIJ?
 M
?
 2? Copyright 2020 Google LLC

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
?
 ':? A designation of a specific field behavior (required, output only, etc.)
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
?
 0 M? An indicator of the behavior of a given field (for example, that a field
 is required in requests, or given as output but ignored as input).
 This **does not** change the behavior in protocol buffers itself; it only
 denotes the behavior and may affect how API tooling handles the field.

 Note: This enum **may** receive new values in the future.



 0
?
  2!2 Conventional default for enums. Do not use this.


  2

  2 
?
 7? Specifically denotes a field as optional.
 While all fields in protocol buffers are optional, this may be specified
 for emphasis if appropriate.


 7


 7
?
 <? Denotes a field as required.
 This indicates that the field **must** be provided as part of the request,
 and failure to do so will cause an error (usually `INVALID_ARGUMENT`).


 <


 <
?
 B? Denotes a field as output only.
 This indicates that the field is provided in responses, but including the
 field in a request does nothing (the server *must* ignore it and
 *must not* throw an error as a result of the field's presence).


 B

 B
?
 G? Denotes a field as input only.
 This indicates that the field is provided in requests, and the
 corresponding field is not included in output.


 G

 G
?
 L? Denotes a field as immutable.
 This indicates that the field may be set once in a request to create a
 resource, but may not be changed thereafter.


 L

 Lbproto3??  
?,
google/protobuf/any.protogoogle.protobuf"6
Any
type_url (	RtypeUrl
value (RvalueBv
com.google.protobufBAnyProtoPZ,google.golang.org/protobuf/types/known/anypb?GPB?Google.Protobuf.WellKnownTypesJ?*
 ?
?
 2? Protocol Buffers - Google's data interchange format
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
" ;
	
%" ;

# C
	
# C

$ ,
	
$ ,

% )
	
% )

& "
	

& "

' !
	
$' !
?
 | ?? `Any` contains an arbitrary serialized protocol buffer message along with a
 URL that describes the type of the serialized message.

 Protobuf library provides support to pack/unpack Any values in the form
 of utility functions or additional generated methods of the Any type.

 Example 1: Pack and unpack a message in C++.

     Foo foo = ...;
     Any any;
     any.PackFrom(foo);
     ...
     if (any.UnpackTo(&foo)) {
       ...
     }

 Example 2: Pack and unpack a message in Java.

     Foo foo = ...;
     Any any = Any.pack(foo);
     ...
     if (any.is(Foo.class)) {
       foo = any.unpack(Foo.class);
     }

  Example 3: Pack and unpack a message in Python.

     foo = Foo(...)
     any = Any()
     any.Pack(foo)
     ...
     if any.Is(Foo.DESCRIPTOR):
       any.Unpack(foo)
       ...

  Example 4: Pack and unpack a message in Go

      foo := &pb.Foo{...}
      any, err := anypb.New(foo)
      if err != nil {
        ...
      }
      ...
      foo := &pb.Foo{}
      if err := any.UnmarshalTo(foo); err != nil {
        ...
      }

 The pack methods provided by protobuf library will by default use
 'type.googleapis.com/full.type.name' as the type URL and the unpack
 methods only use the fully qualified type name after the last '/'
 in the type URL, for example "foo.bar.com/x/y.z" will yield type
 name "y.z".


 JSON
 ====
 The JSON representation of an `Any` value uses the regular
 representation of the deserialized, embedded message, with an
 additional field `@type` which contains the type URL. Example:

     package google.profile;
     message Person {
       string first_name = 1;
       string last_name = 2;
     }

     {
       "@type": "type.googleapis.com/google.profile.Person",
       "firstName": <string>,
       "lastName": <string>
     }

 If the embedded message type is well-known and has a custom JSON
 representation, that representation will be embedded adding a field
 `value` which holds the custom JSON in addition to the `@type`
 field. Example (for message [google.protobuf.Duration][]):

     {
       "@type": "type.googleapis.com/google.protobuf.Duration",
       "value": "1.212s"
     }




 |
?

  ??
 A URL/resource name that uniquely identifies the type of the serialized
 protocol buffer message. This string must contain at least
 one "/" character. The last segment of the URL's path must represent
 the fully qualified name of the type (as in
 `path/google.protobuf.Duration`). The name should be in a canonical form
 (e.g., leading "." is not accepted).

 In practice, teams usually precompile into the binary all types that they
 expect it to use in the context of Any. However, for URLs which use the
 scheme `http`, `https`, or no scheme, one can optionally set up a type
 server that maps type URLs to message definitions as follows:

 * If no scheme is provided, `https` is assumed.
 * An HTTP GET on the URL must yield a [google.protobuf.Type][]
   value in binary format, or produce an error.
 * Applications are allowed to cache lookup results based on the
   URL, or have them precompiled into a binary to avoid any
   lookup. Therefore, binary compatibility needs to be preserved
   on changes to types. (Use versioned type names to manage
   breaking changes.)

 Note: this functionality is not currently available in the official
 protobuf release, and it is not used for type URLs beginning with
 type.googleapis.com.

 Schemes other than `http`, `https` (or the empty scheme) might be
 used with implementation specific semantics.



  ?

  ?	

  ?
W
 ?I Must be a valid serialized protocol buffer of the above specified type.


 ?

 ?

 ?bproto3??  
?
google/api/httpbody.proto
google.apigoogle/protobuf/any.proto"w
HttpBody!
content_type (	RcontentType
data (Rdata4

extensions (2.google.protobuf.AnyR
extensionsBh
com.google.apiBHttpBodyProtoPZ;google.golang.org/genproto/googleapis/api/httpbody;httpbody??GAPIJ?
 L
?
 2? Copyright 2020 Google LLC

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
	
  #

 
	
 

 R
	
 R

 "
	

 "

 .
	
 .

 '
	
 '

 "
	
$ "
?

 B L?
 Message that represents an arbitrary HTTP body. It should only be used for
 payload formats that can't be represented as JSON, such as raw binary or
 an HTML page.


 This message can be used both in streaming and non-streaming API methods in
 the request as well as the response.

 It can be used as a top-level request field, which is convenient if one
 wants to extract parameters from either the URL or HTTP template into the
 request fields and also want access to the raw HTTP body.

 Example:

     message GetResourceRequest {
       // A unique request id.
       string request_id = 1;

       // The raw HTTP body is bound to this field.
       google.api.HttpBody http_body = 2;
     }

     service ResourceService {
       rpc GetResource(GetResourceRequest) returns (google.api.HttpBody);
       rpc UpdateResource(google.api.HttpBody) returns
       (google.protobuf.Empty);
     }

 Example with streaming methods:

     service CaldavService {
       rpc GetCalendar(stream google.api.HttpBody)
         returns (stream google.api.HttpBody);
       rpc UpdateCalendar(stream google.api.HttpBody)
         returns (stream google.api.HttpBody);
     }

 Use of this type only changes how the request and response bodies are
 handled, all other features will continue to work unchanged.



 B
Z
  DM The HTTP Content-Type header value specifying the content type of the body.


  D

  D	

  D
<
 G/ The HTTP request/response body as raw binary.


 G

 G

 G
m
 K.` Application specific response metadata. Must be set in the first response
 for streaming APIs.


 K


 K

 K)

 K,-bproto3??  
?
$google/protobuf/source_context.protogoogle.protobuf",
SourceContext
	file_name (	RfileNameB?
com.google.protobufBSourceContextProtoPZ6google.golang.org/protobuf/types/known/sourcecontextpb?GPB?Google.Protobuf.WellKnownTypesJ?
 /
?
 2? Protocol Buffers - Google's data interchange format
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
" ;
	
%" ;

# ,
	
# ,

$ 3
	
$ 3

% "
	

% "

& !
	
$& !

' M
	
' M
?
 + /w `SourceContext` represents information about the source of a
 protobuf element, like the file in which it is defined.



 +
?
  .? The path-qualified name of the .proto file that contained the associated
 protobuf element.  For example: `"google/protobuf/source_context.proto"`.


  .

  .	

  .bproto3??  
?F
google/protobuf/type.protogoogle.protobufgoogle/protobuf/any.proto$google/protobuf/source_context.proto"?
Type
name (	Rname.
fields (2.google.protobuf.FieldRfields
oneofs (	Roneofs1
options (2.google.protobuf.OptionRoptionsE
source_context (2.google.protobuf.SourceContextRsourceContext/
syntax (2.google.protobuf.SyntaxRsyntax"?
Field/
kind (2.google.protobuf.Field.KindRkindD
cardinality (2".google.protobuf.Field.CardinalityRcardinality
number (Rnumber
name (	Rname
type_url (	RtypeUrl
oneof_index (R
oneofIndex
packed (Rpacked1
options	 (2.google.protobuf.OptionRoptions
	json_name
 (	RjsonName#
default_value (	RdefaultValue"?
Kind
TYPE_UNKNOWN 
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
TYPE_SINT64"t
Cardinality
CARDINALITY_UNKNOWN 
CARDINALITY_OPTIONAL
CARDINALITY_REQUIRED
CARDINALITY_REPEATED"?
Enum
name (	Rname8
	enumvalue (2.google.protobuf.EnumValueR	enumvalue1
options (2.google.protobuf.OptionRoptionsE
source_context (2.google.protobuf.SourceContextRsourceContext/
syntax (2.google.protobuf.SyntaxRsyntax"j
	EnumValue
name (	Rname
number (Rnumber1
options (2.google.protobuf.OptionRoptions"H
Option
name (	Rname*
value (2.google.protobuf.AnyRvalue*.
Syntax
SYNTAX_PROTO2 
SYNTAX_PROTO3B{
com.google.protobufB	TypeProtoPZ-google.golang.org/protobuf/types/known/typepb??GPB?Google.Protobuf.WellKnownTypesJ?8
 ?
?
 2? Protocol Buffers - Google's data interchange format
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
	
 " #
	
# .

% ;
	
%% ;

& 
	
& 

' ,
	
' ,

( *
	
( *

) "
	

) "

* !
	
$* !

+ D
	
+ D
-
 . ;! A protocol buffer message type.



 .
0
  0# The fully qualified message name.


  0

  0	

  0
"
 2 The list of fields.


 2


 2

 2

 2
O
 4B The list of types appearing in `oneof` definitions in this type.


 4


 4

 4

 4
+
 6 The protocol buffer options.


 6


 6

 6

 6
"
 8# The source context.


 8

 8

 8!"
!
 : The source syntax.


 :

 :	

 :
0
> ?# A single field of a message type.



>
"
 @g Basic field types.


 @
$
  B Field type unknown.


  B

  B
#
 D Field type double.


 D

 D
"
 F Field type float.


 F

 F
"
 H Field type int64.


 H

 H
#
 J Field type uint64.


 J

 J
"
 L Field type int32.


 L

 L
$
 N Field type fixed64.


 N

 N
$
 P Field type fixed32.


 P

 P
!
 R Field type bool.


 R

 R
#
 	T Field type string.


 	T

 	T
F
 
V7 Field type group. Proto2 syntax only, and deprecated.


 
V

 
V
$
 X Field type message.


 X

 X
"
 Z Field type bytes.


 Z

 Z
#
 \ Field type uint32.


 \

 \
!
 ^ Field type enum.


 ^

 ^
%
 ` Field type sfixed32.


 `

 `
%
 b Field type sfixed64.


 b

 b
#
 d Field type sint32.


 d

 d
#
 f Field type sint64.


 f

 f
C
js5 Whether a field is optional, required, or repeated.


j
5
 l& For fields with unknown cardinality.


 l

 l
%
n For optional fields.


n

n
9
p* For required fields. Proto2 syntax only.


p

p
%
r For repeated fields.


r

r

 v The field type.


 v

 v

 v
%
x The field cardinality.


x

x

x
 
z The field number.


z

z

z

| The field name.


|

|	

|
?
? The field type URL, without the scheme, for message or enumeration
 types. Example: `"type.googleapis.com/google.protobuf.Timestamp"`.




	


?
?? The index of the field type in `Type.oneofs`, for message or enumeration
 types. The first type has index 1; zero means the type is not in the list.


?

?

?
F
?8 Whether to use alternative packed wire representation.


?

?

?
,
? The protocol buffer options.


?


?

?

?
$
? The field JSON name.


?

?	

?
X
	?J The string value of the default value of this field. Proto2 syntax only.


	?

	?	

	?
%
? ? Enum type definition.


?

 ? Enum type name.


 ?

 ?	

 ?
'
?# Enum value definitions.


?


?

?

?!"
(
? Protocol buffer options.


?


?

?

?
#
?# The source context.


?

?

?!"
"
? The source syntax.


?

?	

?
&
? ? Enum value definition.


?
 
 ? Enum value name.


 ?

 ?	

 ?
"
? Enum value number.


?

?

?
(
? Protocol buffer options.


?


?

?

?
g
? ?Y A protocol buffer option, which can be attached to a message, field,
 enumeration, etc.


?
?
 ?? The option's name. For protobuf built-in options (options defined in
 descriptor.proto), this is the short name. For example, `"map_entry"`.
 For custom options, it should be the fully-qualified name. For example,
 `"google.api.http"`.


 ?

 ?	

 ?
?
?? The option's value packed in an Any message. If the value is a primitive,
 the corresponding wrapper type defined in google/protobuf/wrappers.proto
 should be used. If the value is an enum, it should be stored as an int32
 value using the google.protobuf.Int32Value type.


?

?

?
I
 ? ?; The syntax in which a protocol buffer element is defined.


 ?
 
  ? Syntax `proto2`.


  ?

  ?
 
 ? Syntax `proto3`.


 ?

 ?bproto3??  
?C
google/protobuf/api.protogoogle.protobuf$google/protobuf/source_context.protogoogle/protobuf/type.proto"?
Api
name (	Rname1
methods (2.google.protobuf.MethodRmethods1
options (2.google.protobuf.OptionRoptions
version (	RversionE
source_context (2.google.protobuf.SourceContextRsourceContext.
mixins (2.google.protobuf.MixinRmixins/
syntax (2.google.protobuf.SyntaxRsyntax"?
Method
name (	Rname(
request_type_url (	RrequestTypeUrl+
request_streaming (RrequestStreaming*
response_type_url (	RresponseTypeUrl-
response_streaming (RresponseStreaming1
options (2.google.protobuf.OptionRoptions/
syntax (2.google.protobuf.SyntaxRsyntax"/
Mixin
name (	Rname
root (	RrootBv
com.google.protobufBApiProtoPZ,google.golang.org/protobuf/types/known/apipb?GPB?Google.Protobuf.WellKnownTypesJ?<
 ?
?
 2? Protocol Buffers - Google's data interchange format
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
	
 " .
	
# $

% ;
	
%% ;

& ,
	
& ,

' )
	
' )

( "
	

( "

) !
	
$) !

* C
	
* C
?
 5 `? Api is a light-weight descriptor for an API Interface.

 Interfaces are also described as "protocol buffer services" in some contexts,
 such as by the "service" keyword in a .proto file, but they are different
 from API Services, which represent a concrete implementation of an interface
 as opposed to simply a description of methods and bindings. They are also
 sometimes simply referred to as "APIs" in other contexts, such as the name of
 this message itself. See https://cloud.google.com/apis/design/glossary for
 detailed terminology.



 5
{
  8n The fully qualified name of this interface, including package name
 followed by the interface's simple name.


  8

  8	

  8
C
 ;6 The methods of this interface, in unspecified order.


 ;


 ;

 ;

 ;
6
 >) Any metadata attached to the interface.


 >


 >

 >

 >
?
 U? A version string for this interface. If specified, must have the form
 `major-version.minor-version`, as in `1.10`. If the minor version is
 omitted, it defaults to zero. If the entire version field is empty, the
 major version is derived from the package name, as outlined below. If the
 field is not empty, the version in the package name will be verified to be
 consistent with what is provided here.

 The versioning schema uses [semantic
 versioning](http://semver.org) where the major version number
 indicates a breaking change and the minor version an additive,
 non-breaking change. Both version numbers are signals to users
 what to expect from different versions, and should be carefully
 chosen based on the product plan.

 The major version is also reflected in the package name of the
 interface, which must end in `v<major-version>`, as in
 `google.feature.v1`. For major versions 0 and 1, the suffix can
 be omitted. Zero major versions must only be used for
 experimental, non-GA interfaces.




 U

 U	

 U
[
 Y#N Source context for the protocol buffer service represented by this
 message.


 Y

 Y

 Y!"
2
 \% Included interfaces. See [Mixin][].


 \


 \

 \

 \
0
 _# The source syntax of the service.


 _

 _	

 _
=
c x1 Method represents a method of an API interface.



c
.
 e! The simple name of this method.


 e

 e	

 e
/
h" A URL of the input message type.


h

h	

h
0
k# If true, the request is streamed.


k

k

k
2
n% The URL of the output message type.


n

n	

n
1
q$ If true, the response is streamed.


q

q

q
3
t& Any metadata attached to the method.


t


t

t

t
0
w# The source syntax of this method.


w

w	

w
?
? ?? Declares an API Interface to be included in this interface. The including
 interface must redeclare all the methods from the included interface, but
 documentation and options are inherited as follows:

 - If after comment and whitespace stripping, the documentation
   string of the redeclared method is empty, it will be inherited
   from the original method.

 - Each annotation belonging to the service config (http,
   visibility) which is not set in the redeclared method will be
   inherited.

 - If an http annotation is inherited, the path pattern will be
   modified as follows. Any version prefix will be replaced by the
   version of the including interface plus the [root][] path if
   specified.

 Example of a simple mixin:

     package google.acl.v1;
     service AccessControl {
       // Get the underlying ACL object.
       rpc GetAcl(GetAclRequest) returns (Acl) {
         option (google.api.http).get = "/v1/{resource=**}:getAcl";
       }
     }

     package google.storage.v2;
     service Storage {
       rpc GetAcl(GetAclRequest) returns (Acl);

       // Get a data record.
       rpc GetData(GetDataRequest) returns (Data) {
         option (google.api.http).get = "/v2/{resource=**}";
       }
     }

 Example of a mixin configuration:

     apis:
     - name: google.storage.v2.Storage
       mixins:
       - name: google.acl.v1.AccessControl

 The mixin construct implies that all methods in `AccessControl` are
 also declared with same name and request/response types in
 `Storage`. A documentation generator or annotation processor will
 see the effective `Storage.GetAcl` method after inheriting
 documentation and annotations as follows:

     service Storage {
       // Get the underlying ACL object.
       rpc GetAcl(GetAclRequest) returns (Acl) {
         option (google.api.http).get = "/v2/{resource=**}:getAcl";
       }
       ...
     }

 Note how the version in the path pattern changed from `v1` to `v2`.

 If the `root` field in the mixin is specified, it should be a
 relative path under which inherited HTTP paths are placed. Example:

     apis:
     - name: google.storage.v2.Storage
       mixins:
       - name: google.acl.v1.AccessControl
         root: acls

 This implies the following inherited HTTP annotation:

     service Storage {
       // Get the underlying ACL object.
       rpc GetAcl(GetAclRequest) returns (Acl) {
         option (google.api.http).get = "/v2/acls/{resource=**}:getAcl";
       }
       ...
     }


?
L
 ?> The fully qualified name of the interface which is included.


 ?

 ?	

 ?
[
?M If non-empty specifies a path under which inherited HTTP paths
 are rooted.


?

?	

?bproto3??  
?K
%google/protobuf/compiler/plugin.protogoogle.protobuf.compiler google/protobuf/descriptor.proto"c
Version
major (Rmajor
minor (Rminor
patch (Rpatch
suffix (	Rsuffix"?
CodeGeneratorRequest(
file_to_generate (	RfileToGenerate
	parameter (	R	parameterC

proto_file (2$.google.protobuf.FileDescriptorProtoR	protoFileL
compiler_version (2!.google.protobuf.compiler.VersionRcompilerVersion"?
CodeGeneratorResponse
error (	Rerror-
supported_features (RsupportedFeaturesH
file (24.google.protobuf.compiler.CodeGeneratorResponse.FileRfile?
File
name (	Rname'
insertion_point (	RinsertionPoint
content (	RcontentR
generated_code_info (2".google.protobuf.GeneratedCodeInfoRgeneratedCodeInfo"8
Feature
FEATURE_NONE 
FEATURE_PROTO3_OPTIONALBW
com.google.protobuf.compilerBPluginProtosZ)google.golang.org/protobuf/types/pluginpbJ?C
. ?
?
. 2? Protocol Buffers - Google's data interchange format
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
2? Author: kenton@google.com (Kenton Varda)

 WARNING:  The plugin interface is currently EXPERIMENTAL and is subject to
   change.

 protoc (aka the Protocol Compiler) can be extended via plugins.  A plugin is
 just a program that reads a CodeGeneratorRequest from stdin and writes a
 CodeGeneratorResponse to stdout.

 Plugins written using C++ can use google/protobuf/compiler/plugin.h instead
 of dealing with the raw protocol defined here.

 A plugin executable needs only to be placed somewhere in the path.  The
 plugin should be named "protoc-gen-$NAME", and will then be used when the
 flag "--${NAME}_out" is passed to protoc.


0 !

1 5
	
1 5

2 -
	
2 -

4 @
	
4 @
	
 6 *
6
 9 @* The version number of protocol compiler.



 9

  :

  :


  :

  :

  :

 ;

 ;


 ;

 ;

 ;

 <

 <


 <

 <

 <
?
 ?s A suffix for alpha, beta or rc release, e.g., "alpha-1", "rc2". It should
 be empty for mainline stable releases.


 ?


 ?

 ?

 ?
O
C _C An encoded CodeGeneratorRequest is written to the plugin's stdin.



C
?
 G'? The .proto files that were explicitly listed on the command-line.  The
 code generator should generate code only for these files.  Each file's
 descriptor will be included in proto_file, below.


 G


 G

 G"

 G%&
B
J 5 The generator parameter passed on the command-line.


J


J

J

J
?
Z/? FileDescriptorProtos for all files in files_to_generate and everything
 they import.  The files will appear in topological order, so each file
 appears before any file that imports it.

 protoc guarantees that all proto_files will be written after
 the fields above, even though this is not technically guaranteed by the
 protobuf wire format.  This theoretically could allow a plugin to stream
 in the FileDescriptorProtos and handle them one by one rather than read
 the entire set into memory at once.  However, as of this writing, this
 is not similarly optimized on protoc's end -- it will store all fields in
 memory at once before sending them to the plugin.

 Type names of fields and extensions in the FileDescriptorProto are always
 fully qualified.


Z


Z

Z)

Z,.
7
](* The version number of protocol compiler.


]


]

]#

]&'
L
b ?? The plugin writes an encoded CodeGeneratorResponse to stdout.



b
?
 k? Error message.  If non-empty, code generation failed.  The plugin process
 should exit with status code zero even if it reports an error in this way.

 This should be used to indicate errors in .proto files which prevent the
 code generator from generating correct code.  Errors which indicate a
 problem in protoc itself -- such as the input CodeGeneratorRequest being
 unparseable -- should be reported by writing a message to stderr and
 exiting with a non-zero status code.


 k


 k

 k

 k
?
o)| A bitmask of supported features that the code generator supports.
 This is a bitwise "or" of values from the Feature enum.


o


o

o$

o'(
+
 ru Sync with code_generator.h.


 r

  s

  s

  s

 t 

 t

 t
4
 x?% Represents a single generated file.


 x

?
  ?? The file name, relative to the output directory.  The name must not
 contain "." or ".." components and must be relative, not be absolute (so,
 the file cannot lie outside the output directory).  "/" must be used as
 the path separator, not "\".

 If the name is omitted, the content will be appended to the previous
 file.  This allows the generator to break large files into small chunks,
 and allows the generated text to be streamed back to protoc so that large
 files need not reside completely in memory at one time.  Note that as of
 this writing protoc does not optimize for this -- it will read the entire
 CodeGeneratorResponse before writing files to disk.


  ?

  ?

  ?

  ?
?
 ?(? If non-empty, indicates that the named file should already exist, and the
 content here is to be inserted into that file at a defined insertion
 point.  This feature allows a code generator to extend the output
 produced by another code generator.  The original generator may provide
 insertion points by placing special annotations in the file that look
 like:
   @@protoc_insertion_point(NAME)
 The annotation can have arbitrary text before and after it on the line,
 which allows it to be placed in a comment.  NAME should be replaced with
 an identifier naming the point -- this is what other generators will use
 as the insertion_point.  Code inserted at this point will be placed
 immediately above the line containing the insertion point (thus multiple
 insertions to the same point will come out in the order they were added).
 The double-@ is intended to make it unlikely that the generated code
 could contain things that look like insertion points by accident.

 For example, the C++ code generator places the following line in the
 .pb.h files that it generates:
   // @@protoc_insertion_point(namespace_scope)
 This line appears within the scope of the file's package namespace, but
 outside of any particular class.  Another plugin can then specify the
 insertion_point "namespace_scope" to generate additional classes or
 other declarations that should be placed in this scope.

 Note that if the line containing the insertion point begins with
 whitespace, the same whitespace will be added to every line of the
 inserted text.  This is useful for languages like Python, where
 indentation matters.  In these languages, the insertion point comment
 should be indented the same amount as any inserted code will need to be
 in order to work correctly in that context.

 The code generator that generates the initial file and the one which
 inserts into it must both run as part of a single invocation of protoc.
 Code generators are executed in the order in which they appear on the
 command line.

 If |insertion_point| is present, |name| must also be present.


 ?

 ?

 ?#

 ?&'
$
 ?! The file contents.


 ?

 ?

 ?

 ? 
?
 ?8? Information describing the file content being inserted. If an insertion
 point is used, this information will be appropriately offset and inserted
 into the code generation metadata for the generated files.


 ?

 ?

 ?2

 ?57

?

?


?

?

???  
?%
google/protobuf/duration.protogoogle.protobuf":
Duration
seconds (Rseconds
nanos (RnanosB?
com.google.protobufBDurationProtoPZ1google.golang.org/protobuf/types/known/durationpb??GPB?Google.Protobuf.WellKnownTypesJ?#
 s
?
 2? Protocol Buffers - Google's data interchange format
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
" ;
	
%" ;

# 
	
# 

$ H
	
$ H

% ,
	
% ,

& .
	
& .

' "
	

' "

( !
	
$( !
?
 f s? A Duration represents a signed, fixed-length span of time represented
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





 f
?
  j? Signed seconds of the span of time. Must be from -315,576,000,000
 to +315,576,000,000 inclusive. Note: these bounds are computed from:
 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years


  j

  j

  j
?
 r? Signed fractions of a second at nanosecond resolution of the span
 of time. Durations less than one second are represented with a 0
 `seconds` field and a positive or negative `nanos` field. For durations
 of one second or more, a non-zero value for the `nanos` field must be
 of the same sign as the `seconds` field. Must be from -999,999,999
 to +999,999,999 inclusive.


 r

 r

 rbproto3??  
?
google/protobuf/empty.protogoogle.protobuf"
EmptyB}
com.google.protobufB
EmptyProtoPZ.google.golang.org/protobuf/types/known/emptypb??GPB?Google.Protobuf.WellKnownTypesJ?
 3
?
 2? Protocol Buffers - Google's data interchange format
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
" ;
	
%" ;

# E
	
# E

$ ,
	
$ ,

% +
	
% +

& "
	

& "

' !
	
$' !

( 
	
( 
?
 3 ? A generic empty message that you can re-use to avoid defining duplicated
 empty messages in your APIs. A typical example is to use it as the request
 or the response type of an API method. For instance:

     service Foo {
       rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
     }

 The JSON representation for `Empty` is empty JSON object `{}`.



 3bproto3??  
?=
 google/protobuf/field_mask.protogoogle.protobuf"!
	FieldMask
paths (	RpathsB?
com.google.protobufBFieldMaskProtoPZ2google.golang.org/protobuf/types/known/fieldmaskpb??GPB?Google.Protobuf.WellKnownTypesJ?;
 ?
?
 2? Protocol Buffers - Google's data interchange format
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
" ;
	
%" ;

# ,
	
# ,

$ /
	
$ /

% "
	

% "

& !
	
$& !

' I
	
' I

( 
	
( 
?,
 ? ??, `FieldMask` represents a set of symbolic field paths, for example:

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


 ?
,
  ? The set of field mask paths.


  ?


  ?

  ?

  ?bproto3??  
?#
google/protobuf/struct.protogoogle.protobuf"?
Struct;
fields (2#.google.protobuf.Struct.FieldsEntryRfieldsQ
FieldsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"?
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
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpb??GPB?Google.Protobuf.WellKnownTypesJ?
 ^
?
 2? Protocol Buffers - Google's data interchange format
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
" ;
	
%" ;

# 
	
# 

$ F
	
$ F

% ,
	
% ,

& ,
	
& ,

' "
	

' "

( !
	
$( !
?
 2 5? `Struct` represents a structured data value, consisting of fields
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
?
= M? `Value` represents a dynamically typed value which can be either
 null, a number, a string, a boolean, a recursive struct value, or a
 list of values. A producer of value is expected to set one of that
 variants, absence of any variant indicates an error.

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
?
 S V? `NullValue` is a singleton enumeration to represent the null value for the
 `Value` type union.

  The JSON representation for `NullValue` is JSON `null`.



 S

  U Null value.


  U

  U
?
[ ^v `ListValue` is a wrapper around a repeated field of values.

 The JSON representation for `ListValue` is JSON array.



[
:
 ]- Repeated field of dynamically typed values.


 ]


 ]

 ]

 ]bproto3??  
?1
google/protobuf/timestamp.protogoogle.protobuf";
	Timestamp
seconds (Rseconds
nanos (RnanosB?
com.google.protobufBTimestampProtoPZ2google.golang.org/protobuf/types/known/timestamppb??GPB?Google.Protobuf.WellKnownTypesJ?/
 ?
?
 2? Protocol Buffers - Google's data interchange format
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
" ;
	
%" ;

# 
	
# 

$ I
	
$ I

% ,
	
% ,

& /
	
& /

' "
	

' "

( !
	
$( !
?
 ? ?? A Timestamp represents a point in time independent of any time zone or local
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
 http://www.joda.org/joda-time/apidocs/org/joda/time/format/ISODateTimeFormat.html#dateTime%2D%2D
 ) to obtain a formatter capable of generating timestamps in this format.




 ?
?
  ?? Represents seconds of UTC time since Unix epoch
 1970-01-01T00:00:00Z. Must be from 0001-01-01T00:00:00Z to
 9999-12-31T23:59:59Z inclusive.


  ?

  ?

  ?
?
 ?? Non-negative fractions of a second at nanosecond resolution. Negative
 second values with fractions must still have non-negative nanos values
 that count forward in time. Must be from 0 to 999,999,999
 inclusive.


 ?

 ?

 ?bproto3??  
?#
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
value (RvalueB?
com.google.protobufBWrappersProtoPZ1google.golang.org/protobuf/types/known/wrapperspb??GPB?Google.Protobuf.WellKnownTypesJ?
( z
?
( 2? Protocol Buffers - Google's data interchange format
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
2? Wrappers for primitive (non-message) types. These types are useful
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
, ;
	
%, ;

- 
	
- 

. H
	
. H

/ ,
	
/ ,

0 .
	
0 .

1 "
	

1 "

2 !
	
$2 !
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

 ybproto3??  
?
!google/type/calendar_period.protogoogle.type*
CalendarPeriod
CALENDAR_PERIOD_UNSPECIFIED 
DAY
WEEK
	FORTNIGHT	
MONTH
QUARTER
HALF
YEARBx
com.google.typeBCalendarPeriodProtoPZHgoogle.golang.org/genproto/googleapis/type/calendarperiod;calendarperiod?GTPJ?
 7
?
 2? Copyright 2021 Google LLC

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
 _
	
 _

 "
	

 "

 4
	
 4

 (
	
 (

 !
	
$ !
?
  7? A `CalendarPeriod` represents the abstract concept of a time period that has
 a canonical start. Grammatically, "the start of the current
 `CalendarPeriod`." All calendar times begin at midnight UTC.



 
1
  "$ Undefined period, raises an error.


  

   !

  
 A day.


  

  	
q
 $d A week. Weeks begin on Monday, following
 [ISO 8601](https://en.wikipedia.org/wiki/ISO_week_date).


 $

 $	

?
 )? A fortnight. The first calendar fortnight of the year begins at the start
 of week 1 according to
 [ISO 8601](https://en.wikipedia.org/wiki/ISO_week_date).


 )

 )

 ,
 A month.


 ,

 ,

_
 0R A quarter. Quarters start on dates 1-Jan, 1-Apr, 1-Jul, and 1-Oct of each
 year.


 0	

 0
F
 39 A half-year. Half-years start on dates 1-Jan and 1-Jul.


 3

 3	


 6	 A year.


 6

 6	
bproto3??  
?1
google/type/color.protogoogle.typegoogle/protobuf/wrappers.proto"v
Color
red (Rred
green (Rgreen
blue (Rblue1
alpha (2.google.protobuf.FloatValueRalphaB`
com.google.typeB
ColorProtoPZ6google.golang.org/genproto/googleapis/type/color;color??GTPJ?/
 ?
?
 2? Copyright 2021 Google LLC

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
	
  (

 
	
 

 M
	
 M

 "
	

 "

 +
	
 +

 (
	
 (

 !
	
$ !
? 
 ? ??  Represents a color in the RGBA color space. This representation is designed
 for simplicity of conversion to/from color representations in various
 languages over compactness. For example, the fields of this representation
 can be trivially provided to the constructor of `java.awt.Color` in Java; it
 can also be trivially provided to UIColor's `+colorWithRed:green:blue:alpha`
 method in iOS; and, with just a little work, it can be easily formatted into
 a CSS `rgba()` string in JavaScript.

 This reference page doesn't carry information about the absolute color
 space
 that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB,
 DCI-P3, BT.2020, etc.). By default, applications should assume the sRGB color
 space.

 When color equality needs to be decided, implementations, unless
 documented otherwise, treat two colors as equal if all their red,
 green, blue, and alpha values each differ by at most 1e-5.

 Example (Java):

      import com.google.type.Color;

      // ...
      public static java.awt.Color fromProto(Color protocolor) {
        float alpha = protocolor.hasAlpha()
            ? protocolor.getAlpha().getValue()
            : 1.0;

        return new java.awt.Color(
            protocolor.getRed(),
            protocolor.getGreen(),
            protocolor.getBlue(),
            alpha);
      }

      public static Color toProto(java.awt.Color color) {
        float red = (float) color.getRed();
        float green = (float) color.getGreen();
        float blue = (float) color.getBlue();
        float denominator = 255.0;
        Color.Builder resultBuilder =
            Color
                .newBuilder()
                .setRed(red / denominator)
                .setGreen(green / denominator)
                .setBlue(blue / denominator);
        int alpha = color.getAlpha();
        if (alpha != 255) {
          result.setAlpha(
              FloatValue
                  .newBuilder()
                  .setValue(((float) alpha) / denominator)
                  .build());
        }
        return resultBuilder.build();
      }
      // ...

 Example (iOS / Obj-C):

      // ...
      static UIColor* fromProto(Color* protocolor) {
         float red = [protocolor red];
         float green = [protocolor green];
         float blue = [protocolor blue];
         FloatValue* alpha_wrapper = [protocolor alpha];
         float alpha = 1.0;
         if (alpha_wrapper != nil) {
           alpha = [alpha_wrapper value];
         }
         return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
      }

      static Color* toProto(UIColor* color) {
          CGFloat red, green, blue, alpha;
          if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) {
            return nil;
          }
          Color* result = [[Color alloc] init];
          [result setRed:red];
          [result setGreen:green];
          [result setBlue:blue];
          if (alpha <= 0.9999) {
            [result setAlpha:floatWrapperWithValue(alpha)];
          }
          [result autorelease];
          return result;
     }
     // ...

  Example (JavaScript):

     // ...

     var protoToCssColor = function(rgb_color) {
        var redFrac = rgb_color.red || 0.0;
        var greenFrac = rgb_color.green || 0.0;
        var blueFrac = rgb_color.blue || 0.0;
        var red = Math.floor(redFrac * 255);
        var green = Math.floor(greenFrac * 255);
        var blue = Math.floor(blueFrac * 255);

        if (!('alpha' in rgb_color)) {
           return rgbToCssColor(red, green, blue);
        }

        var alphaFrac = rgb_color.alpha.value || 0.0;
        var rgbParams = [red, green, blue].join(',');
        return ['rgba(', rgbParams, ',', alphaFrac, ')'].join('');
     };

     var rgbToCssColor = function(red, green, blue) {
       var rgbNumber = new Number((red << 16) | (green << 8) | blue);
       var hexString = rgbNumber.toString(16);
       var missingZeros = 6 - hexString.length;
       var resultBuilder = ['#'];
       for (var i = 0; i < missingZeros; i++) {
          resultBuilder.push('0');
       }
       resultBuilder.push(hexString);
       return resultBuilder.join('');
     };

     // ...


 ?
Q
  ?C The amount of red in the color as a value in the interval [0, 1].


  ?

  ?

  ?
S
 ?E The amount of green in the color as a value in the interval [0, 1].


 ?

 ?

 ?
R
 ?D The amount of blue in the color as a value in the interval [0, 1].


 ?

 ?

 ?
?
 ?'? The fraction of this color that should be applied to the pixel. That is,
 the final pixel color is defined by the equation:

   `pixel color = alpha * (this color) + (1.0 - alpha) * (background color)`

 This means that a value of 1.0 corresponds to a solid color, whereas
 a value of 0.0 corresponds to a completely transparent color. This
 uses a wrapper message rather than a simple float scalar so that it is
 possible to distinguish between a default value and the value being unset.
 If omitted, this color object is rendered as a solid color
 (as if the alpha value had been explicitly given a value of 1.0).


 ?

 ?"

 ?%&bproto3??  
?
google/type/date.protogoogle.type"B
Date
year (Ryear
month (Rmonth
day (RdayB]
com.google.typeB	DateProtoPZ4google.golang.org/genproto/googleapis/type/date;date??GTPJ?
 3
?
 2? Copyright 2021 Google LLC

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
 K
	
 K

 "
	

 "

 *
	
 *

 (
	
 (

 !
	
$ !
?
 & 3? Represents a whole or partial calendar date, such as a birthday. The time of
 day and time zone are either specified elsewhere or are insignificant. The
 date is relative to the Gregorian Calendar. This can represent one of the
 following:

 * A full date, with non-zero year, month, and day values
 * A month and day value, with a zero year, such as an anniversary
 * A year on its own, with zero month and day values
 * A year and month value, with a zero day, such as a credit card expiration
 date

 Related types are [google.type.TimeOfDay][google.type.TimeOfDay] and
 `google.protobuf.Timestamp`.



 &
`
  )S Year of the date. Must be from 1 to 9999, or 0 to specify a date without
 a year.


  )

  )

  )
f
 -Y Month of a year. Must be from 1 to 12, or 0 to specify a year without a
 month and day.


 -

 -

 -
?
 2? Day of a month. Must be from 1 to 31 and valid for the year and month, or 0
 to specify a year by itself or a year and month where the day isn't
 significant.


 2

 2

 2bproto3??  
?"
google/type/datetime.protogoogle.typegoogle/protobuf/duration.proto"?
DateTime
year (Ryear
month (Rmonth
day (Rday
hours (Rhours
minutes (Rminutes
seconds (Rseconds
nanos (Rnanos:

utc_offset (2.google.protobuf.DurationH R	utcOffset4
	time_zone	 (2.google.type.TimeZoneH RtimeZoneB
time_offset"4
TimeZone
id (	Rid
version (	RversionBi
com.google.typeBDateTimeProtoPZ<google.golang.org/genproto/googleapis/type/datetime;datetime??GTPJ?
 g
?
 2? Copyright 2021 Google LLC

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
	
  (

 
	
 

 S
	
 S

 "
	

 "

 .
	
 .

 (
	
 (

 !
	
$ !
?
 3 ]? Represents civil time (or occasionally physical time).

 This type can represent a civil time in one of a few possible ways:

  * When utc_offset is set and time_zone is unset: a civil time on a calendar
    day with a particular offset from UTC.
  * When time_zone is set and utc_offset is unset: a civil time on a calendar
    day in a particular time zone.
  * When neither time_zone nor utc_offset is set: a civil time on a calendar
    day in local time.

 The date is relative to the Proleptic Gregorian Calendar.

 If year is 0, the DateTime is considered not to have a specific year. month
 and day must have valid, non-zero values.

 This type may also be used to represent a physical time if all the date and
 time fields are set and either case of the `time_offset` oneof is set.
 Consider using `Timestamp` message for physical time instead. If your use
 case also would like to store the user's timezone, that can be done in
 another field.

 This type is more flexible than some applications may want. Make sure to
 document and validate your application's limitations.



 3
m
  6` Optional. Year of date. Must be from 1 to 9999, or 0 if specifying a
 datetime without a year.


  6

  6

  6
=
 90 Required. Month of year. Must be from 1 to 12.


 9

 9

 9
^
 =Q Required. Day of month. Must be from 1 to 31 and valid for the year and
 month.


 =

 =

 =
?
 B? Required. Hours of day in 24 hour format. Should be from 0 to 23. An API
 may choose to allow the value "24:00:00" for scenarios like business
 closing time.


 B

 B

 B
F
 E9 Required. Minutes of hour of day. Must be from 0 to 59.


 E

 E

 E
?
 I? Required. Seconds of minutes of the time. Must normally be from 0 to 59. An
 API may allow the value 60 if it allows leap-seconds.


 I

 I

 I
]
 MP Required. Fractions of seconds in nanoseconds. Must be from 0 to
 999,999,999.


 M

 M

 M
?
  T\? Optional. Specifies either the UTC offset or the time zone of the DateTime.
 Choose carefully between them, considering that time zone data may change
 in the future (for example, a country modifies their DST start/end dates,
 and future DateTimes in the affected range had already been stored).
 If omitted, the DateTime is considered to be in local time.


  T
?
 X,? UTC offset. Must be whole seconds, between -18 hours and +18 hours.
 For example, a UTC offset of -4:00 would be represented as
 { seconds: -14400 }.


 X

 X'

 X*+

 [ Time zone.


 [

 [

 [
j
a g^ Represents a time zone from the
 [IANA Time Zone Database](https://www.iana.org/time-zones).



a
J
 c= IANA Time Zone Database time zone, e.g. "America/New_York".


 c

 c	

 c
N
fA Optional. IANA Time Zone Database version number, e.g. "2019a".


f

f	

fbproto3??  
?
google/type/dayofweek.protogoogle.type*?
	DayOfWeek
DAY_OF_WEEK_UNSPECIFIED 

MONDAY
TUESDAY
	WEDNESDAY
THURSDAY

FRIDAY
SATURDAY

SUNDAYBi
com.google.typeBDayOfWeekProtoPZ>google.golang.org/genproto/googleapis/type/dayofweek;dayofweek?GTPJ?	
 1
?
 2? Copyright 2021 Google LLC

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
 U
	
 U

 "
	

 "

 /
	
 /

 (
	
 (

 !
	
$ !
+
  1 Represents a day of the week.



 
2
  % The day of the week is unspecified.


  

  

  Monday


 

 

 !	 Tuesday


 !	

 !

 $ Wednesday


 $

 $

 '
 Thursday


 '


 '

 * Friday


 *

 *

 -
 Saturday


 -


 -

 0 Sunday


 0

 0bproto3??  
?
google/type/decimal.protogoogle.type"
Decimal
value (	RvalueBf
com.google.typeBDecimalProtoPZ:google.golang.org/genproto/googleapis/type/decimal;decimal??GTPJ?
 ^
?
 2? Copyright 2021 Google LLC

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
 Q
	
 Q

 "
	

 "

 -
	
 -

 (
	
 (

 !
	
$ !
?
   ^? A representation of a decimal value, such as 2.5. Clients may convert values
 into language-native decimal formats, such as Java's [BigDecimal][] or
 Python's [decimal.Decimal][].

 [BigDecimal]:
 https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/math/BigDecimal.html
 [decimal.Decimal]: https://docs.python.org/3/library/decimal.html



  
?
  ]? The decimal value, as a string.

 The string representation consists of an optional sign, `+` (`U+002B`)
 or `-` (`U+002D`), followed by a sequence of zero or more decimal digits
 ("the integer"), optionally followed by a fraction, optionally followed
 by an exponent.

 The fraction consists of a decimal point followed by zero or more decimal
 digits. The string must contain at least one digit in either the integer
 or the fraction. The number formed by the sign, the integer and the
 fraction is referred to as the significand.

 The exponent consists of the character `e` (`U+0065`) or `E` (`U+0045`)
 followed by one or more decimal digits.

 Services **should** normalize decimal values before storing them by:

   - Removing an explicitly-provided `+` sign (`+2.5` -> `2.5`).
   - Replacing a zero-length integer value with `0` (`.5` -> `0.5`).
   - Coercing the exponent character to lower-case (`2.5E8` -> `2.5e8`).
   - Removing an explicitly-provided zero exponent (`2.5e0` -> `2.5`).

 Services **may** perform additional normalization based on its own needs
 and the internal decimal implementation selected, such as shifting the
 decimal point and exponent value together (example: `2.5e-1` <-> `0.25`).
 Additionally, services **may** preserve trailing zeroes in the fraction
 to indicate increased precision, but are not required to do so.

 Note that only the `.` character is supported to divide the integer
 and the fraction; `,` **should not** be supported regardless of locale.
 Additionally, thousand separators **should not** be supported. If a
 service does support them, values **must** be normalized.

 The ENBF grammar is:

     DecimalString =
       [Sign] Significand [Exponent];

     Sign = '+' | '-';

     Significand =
       Digits ['.'] [Digits] | [Digits] '.' Digits;

     Exponent = ('e' | 'E') [Sign] Digits;

     Digits = { '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' };

 Services **should** clearly document the range of supported values, the
 maximum supported precision (total number of digits), and, if applicable,
 the scale (number of digits after the decimal point), as well as how it
 behaves when receiving out-of-bounds values.

 Services **may** choose to accept values passed as input even when the
 value has a higher precision or scale than the service supports, and
 **should** round the value to fit the supported scale. Alternatively, the
 service **may** error with `400 Bad Request` (`INVALID_ARGUMENT` in gRPC)
 if precision would be lost.

 Services **should** error with `400 Bad Request` (`INVALID_ARGUMENT` in
 gRPC) if the service receives a value outside of the supported range.


  ]

  ]	

  ]bproto3??  
?
google/type/expr.protogoogle.type"z
Expr

expression (	R
expression
title (	Rtitle 
description (	Rdescription
location (	RlocationBZ
com.google.typeB	ExprProtoPZ4google.golang.org/genproto/googleapis/type/expr;expr?GTPJ?
 H
?
 2? Copyright 2021 Google LLC

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
 K
	
 K

 "
	

 "

 *
	
 *

 (
	
 (

 !
	
$ !
?	
 7 H?	 Represents a textual expression in the Common Expression Language (CEL)
 syntax. CEL is a C-like expression language. The syntax and semantics of CEL
 are documented at https://github.com/google/cel-spec.

 Example (Comparison):

     title: "Summary size limit"
     description: "Determines if a summary is less than 100 chars"
     expression: "document.summary.size() < 100"

 Example (Equality):

     title: "Requestor is owner"
     description: "Determines if requestor is the document owner"
     expression: "document.owner == request.auth.claims.email"

 Example (Logic):

     title: "Public documents"
     description: "Determine whether the document should be publicly visible"
     expression: "document.type != 'private' && document.type != 'internal'"

 Example (Data Manipulation):

     title: "Notification string"
     description: "Create a notification string with a timestamp."
     expression: "'New message received at ' + string(document.create_time)"

 The exact variables and functions that may be referenced within an expression
 are determined by the service that evaluates it. See the service
 documentation for additional information.



 7
]
  :P Textual representation of an expression in Common Expression Language
 syntax.


  :

  :	

  :
?
 ?? Optional. Title for the expression, i.e. a short string describing
 its purpose. This can be used e.g. in UIs which allow to enter the
 expression.


 ?

 ?	

 ?
?
 C? Optional. Description of the expression. This is a longer text which
 describes the expression, e.g. when hovered over it in a UI.


 C

 C	

 C
?
 G Optional. String indicating the location of the expression for error
 reporting, e.g. a file name and a position in the file.


 G

 G	

 Gbproto3??  
?	
google/type/fraction.protogoogle.type"J
Fraction
	numerator (R	numerator 
denominator (RdenominatorBf
com.google.typeBFractionProtoPZ<google.golang.org/genproto/googleapis/type/fraction;fraction?GTPJ?
  
?
 2? Copyright 2021 Google LLC

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
 S
	
 S

 "
	

 "

 .
	
 .

 (
	
 (

 !
	
$ !
U
   I Represents a fraction in terms of a numerator divided by a denominator.



 
<
  / The numerator in the fraction, e.g. 2 in 2/3.


  

  

  
]
 P The value by which the numerator is divided, e.g. 3 in 2/3. Must be
 positive.


 

 

 bproto3??  
?
google/type/interval.protogoogle.typegoogle/protobuf/timestamp.proto"|
Interval9

start_time (2.google.protobuf.TimestampR	startTime5
end_time (2.google.protobuf.TimestampRendTimeBi
com.google.typeBIntervalProtoPZ<google.golang.org/genproto/googleapis/type/interval;interval??GTPJ?
 -
?
 2? Copyright 2021 Google LLC

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
	
  )

 
	
 

 S
	
 S

 "
	

 "

 .
	
 .

 (
	
 (

 !
	
$ !
?
 ! -? Represents a time interval, encoded as a Timestamp start (inclusive) and a
 Timestamp end (exclusive).

 The start must be less than or equal to the end.
 When the start equals the end, the interval is empty (matches no time).
 When both start and end are unspecified, the interval matches any time.



 !
?
  &+? Optional. Inclusive start of the interval.

 If specified, a Timestamp matching this interval will have to be the same
 or after the start.


  &

  &&

  &)*
?
 ,)~ Optional. Exclusive end of the interval.

 If specified, a Timestamp matching this interval will have to be before the
 end.


 ,

 ,$

 ,'(bproto3??  
?
google/type/latlng.protogoogle.type"B
LatLng
latitude (Rlatitude
	longitude (R	longitudeBc
com.google.typeBLatLngProtoPZ8google.golang.org/genproto/googleapis/type/latlng;latlng??GTPJ?

 $
?
 2? Copyright 2021 Google LLC

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
?
  $? An object that represents a latitude/longitude pair. This is expressed as a
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

 #bproto3??  
?
 google/type/localized_text.protogoogle.type"H
LocalizedText
text (	Rtext#
language_code (	RlanguageCodeBz
com.google.typeBLocalizedTextProtoPZHgoogle.golang.org/genproto/googleapis/type/localized_text;localized_text??GTPJ?
 #
?
 2? Copyright 2021 Google LLC

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
 _
	
 _
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
C
  #7 Localized variant of a text in a particular language.



 
W
  J Localized string in the language corresponding to `language_code' below.


  

  	

  
?
 "? The text's BCP-47 language code, such as "en-US" or "sr-Latn".

 For more information, see
 http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.


 "

 "	

 "bproto3??  
?
google/type/money.protogoogle.type"X
Money#
currency_code (	RcurrencyCode
units (Runits
nanos (RnanosB`
com.google.typeB
MoneyProtoPZ6google.golang.org/genproto/googleapis/type/money;money??GTPJ?
 )
?
 2? Copyright 2021 Google LLC

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
 M
	
 M

 "
	

 "

 +
	
 +

 (
	
 (

 !
	
$ !
C
  )7 Represents an amount of money with its currency type.



 
B
  5 The three-letter currency code defined in ISO 4217.


  

  	

  
v
  i The whole units of the amount.
 For example if `currencyCode` is `"USD"`, then 1 unit is one US dollar.


  

  

  
?
 (? Number of nano (10^-9) units of the amount.
 The value must be between -999,999,999 and +999,999,999 inclusive.
 If `units` is positive, `nanos` must be positive or zero.
 If `units` is zero, `nanos` can be positive, zero, or negative.
 If `units` is negative, `nanos` must be negative or zero.
 For example $-1.75 is represented as `units`=-1 and `nanos`=-750,000,000.


 (

 (

 (bproto3??  
?
google/type/month.protogoogle.type*?
Month
MONTH_UNSPECIFIED 
JANUARY
FEBRUARY	
MARCH	
APRIL
MAY
JUNE
JULY

AUGUST
	SEPTEMBER	
OCTOBER

NOVEMBER
DECEMBERB]
com.google.typeB
MonthProtoPZ6google.golang.org/genproto/googleapis/type/month;month?GTPJ?
 @
?
 2? Copyright 2021 Google LLC

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
 M
	
 M

 "
	

 "

 +
	
 +

 (
	
 (

 !
	
$ !
;
  @/ Represents a month in the Gregorian calendar.



 

%
   The unspecified month.


  

  
$
  The month of January.


 	

 
%
 ! The month of February.


 !


 !
"
 $ The month of March.


 $

 $

"
 ' The month of April.


 '

 '

 
 *
 The month of May.


 *

 *	
!
 - The month of June.


 -

 -	

!
 0 The month of July.


 0

 0	

#
 3 The month of August.


 3

 3
&
 	6 The month of September.


 	6

 	6
$
 
9 The month of October.


 
9	

 
9
%
 < The month of November.


 <


 <
%
 ? The month of December.


 ?


 ?bproto3??  
?%
google/type/phone_number.protogoogle.type"?
PhoneNumber!
e164_number (	H R
e164NumberC

short_code (2".google.type.PhoneNumber.ShortCodeH R	shortCode
	extension (	R	extensionD
	ShortCode
region_code (	R
regionCode
number (	RnumberB
kindBt
com.google.typeBPhoneNumberProtoPZDgoogle.golang.org/genproto/googleapis/type/phone_number;phone_number??GTPJ?"
 p
?
 2? Copyright 2021 Google LLC

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
 [
	
 [

 "
	

 "

 1
	
 1

 (
	
 (

 !
	
$ !
?
 3 p? An object representing a phone number, suitable as an API wire format.

 This representation:

  - should not be used for locale-specific formatting of a phone number, such
    as "+1 (650) 253-0000 ext. 123"

  - is not designed for efficient storage
  - may not be suitable for dialing - specialized libraries (see references)
    should be used to parse the number for that purpose

 To do something meaningful with this number, such as format it for various
 use-cases, convert it to an `i18n.phonenumbers.PhoneNumber` object first.

 For instance, in Java this would be:

    com.google.type.PhoneNumber wireProto =
        com.google.type.PhoneNumber.newBuilder().build();
    com.google.i18n.phonenumbers.Phonenumber.PhoneNumber phoneNumber =
        PhoneNumberUtil.getInstance().parse(wireProto.getE164Number(), "ZZ");
    if (!wireProto.getExtension().isEmpty()) {
      phoneNumber.setExtension(wireProto.getExtension());
    }

  Reference(s):
   - https://github.com/google/libphonenumber



 3
?
  =H? An object representing a short code, which is a phone number that is
 typically much shorter than regular phone numbers and can be used to
 address messages in MMS and SMS systems, as well as for abbreviated dialing
 (e.g. "Text 611 to see how many minutes you have remaining on your plan.").

 Short codes are restricted to a region and are not internationally
 dialable, which means the same short code can exist in different regions,
 with different usage and pricing, even if those regions share the same
 country calling code (e.g. US and CA).


  =

?
   C? Required. The BCP-47 region code of the location where calls to this
 short code can be made, such as "US" and "BB".

 Reference(s):
  - http://www.unicode.org/reports/tr35/#unicode_region_subtag


   C


   C

   C
t
  Ge Required. The short code digits, without a leading plus ('+') or country
 calling code, e.g. "611".


  G


  G

  G
?
  Md? Required.  Either a regular number, or a short code.  New fields may be
 added to the oneof below in the future, so clients should ignore phone
 numbers for which none of the fields they coded against are set.


  M
?
  ]? The phone number, represented as a leading plus sign ('+'), followed by a
 phone number that uses a relaxed ITU E.164 format consisting of the
 country calling code (1 to 3 digits) and the subscriber number, with no
 additional spaces or formatting, e.g.:
  - correct: "+15552220123"
  - incorrect: "+1 (555) 222-01234 x123".

 The ITU E.164 format limits the latter to 12 digits, but in practice not
 all countries respect that, so we relax that restriction here.
 National-only numbers are not allowed.

 References:
  - https://www.itu.int/rec/T-REC-E.164-201011-I
  - https://en.wikipedia.org/wiki/E.164.
  - https://en.wikipedia.org/wiki/List_of_country_calling_codes


  ]


  ]

  ]
Y
 cL A short code.

 Reference(s):
  - https://en.wikipedia.org/wiki/Short_code


 c

 c

 c
?
 o? The phone number's extension. The extension is not standardized in ITU
 recommendations, except for being defined as a series of numbers with a
 maximum length of 40 digits. Other than digits, some other dialing
 characters such as ',' (indicating a wait) or '#' may be stored here.

 Note that no regions currently use extensions with short codes, so this
 field is normally only set in conjunction with an E.164 number. It is held
 separately from the E.164 number to allow for short code extensions in the
 future.


 o

 o	

 obproto3??  
?4
 google/type/postal_address.protogoogle.type"?
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
com.google.typeBPostalAddressProtoPZFgoogle.golang.org/genproto/googleapis/type/postaladdress;postaladdress??GTPJ?/
 ?
?
 2? Copyright 2021 Google LLC

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
?
 * ?? Represents a postal address, e.g. for postal delivery or payments addresses.
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
?
  /? The schema revision of the `PostalAddress`. This must be set to 0, which is
 the latest revision.

 All new revisions **must** be backward compatible with old revisions.


  /

  /

  /
?
 6? Required. CLDR region code of the country/region of the address. This
 is never inferred and it is up to the user to ensure the value is
 correct. See http://cldr.unicode.org/ and
 http://www.unicode.org/cldr/charts/30/supplemental/territory_information.html
 for details. Example: "CH" for Switzerland.


 6

 6	

 6
?
 D? Optional. BCP-47 language code of the contents of this address (if
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
?
 J? Optional. Postal code of the address. Not all countries use or require
 postal codes to be present, but where they are used, they may trigger
 additional validation with other parts of the address (e.g. state/zip
 validation in the U.S.A.).


 J

 J	

 J
?
 Q? Optional. Additional, country-specific, sorting code. This is not used
 in most regions. Where it is used, the value is either a string like
 "CEDEX", optionally followed by a number (e.g. "CEDEX 7"), or just a number
 alone, representing the "sector code" (Jamaica), "delivery area indicator"
 (Malawi) or "post office indicator" (e.g. Côte d'Ivoire).


 Q

 Q	

 Q
?
 Z!? Optional. Highest administrative subdivision which is used for postal
 addresses of a country or region.
 For example, this can be a state, a province, an oblast, or a prefecture.
 Specifically, for Spain this is the province and not the autonomous
 community (e.g. "Barcelona" and not "Catalonia").
 Many countries don't use an administrative area in postal addresses. E.g.
 in Switzerland this should be left unpopulated.


 Z

 Z	

 Z 
?
 `? Optional. Generally refers to the city/town portion of the address.
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
?	
 |$?	 Unstructured address lines describing the lower levels of an address.

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
?
 	?"? Optional. The recipient at the address.
 This field may, under certain circumstances, contain multiline information.
 For example, it might contain "care of" information.


 	?


 	?

 	?

 	?!
F
 
?8 Optional. The name of the organization at the address.


 
?

 
?	

 
?bproto3??  
?
google/type/quaternion.protogoogle.type"D

Quaternion
x (Rx
y (Ry
z (Rz
w (RwBo
com.google.typeBQuaternionProtoPZ@google.golang.org/genproto/googleapis/type/quaternion;quaternion??GTPJ?
 ]
?
 2? Copyright 2021 Google LLC

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
 W
	
 W

 "
	

 "

 0
	
 0

 (
	
 (

 !
	
$ !
?
 Q ]? A quaternion is defined as the quotient of two directed lines in a
 three-dimensional space or equivalently as the quotient of two Euclidean
 vectors (https://en.wikipedia.org/wiki/Quaternion).

 Quaternions are often used in calculations involving three-dimensional
 rotations (https://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation),
 as they provide greater mathematical robustness by avoiding the gimbal lock
 problems that can be encountered when using Euler angles
 (https://en.wikipedia.org/wiki/Gimbal_lock).

 Quaternions are generally represented in this form:

     w + xi + yj + zk

 where x, y, z, and w are real numbers, and i, j, and k are three imaginary
 numbers.

 Our naming choice `(x, y, z, w)` comes from the desire to avoid confusion for
 those interested in the geometric properties of the quaternion in the 3D
 Cartesian space. Other texts often use alternative names or subscripts, such
 as `(a, b, c, d)`, `(1, i, j, k)`, or `(0, 1, 2, 3)`, which are perhaps
 better suited for mathematical interpretations.

 To avoid any confusion, as well as to maintain compatibility with a large
 number of software libraries, the quaternions represented using the protocol
 buffer below *must* follow the Hamilton convention, which defines `ij = k`
 (i.e. a right-handed algebra), and therefore:

     i^2 = j^2 = k^2 = ijk = −1
     ij = −ji = k
     jk = −kj = i
     ki = −ik = j

 Please DO NOT use this to represent quaternions that follow the JPL
 convention, or any of the other quaternion flavors out there.

 Definitions:

   - Quaternion norm (or magnitude): `sqrt(x^2 + y^2 + z^2 + w^2)`.
   - Unit (or normalized) quaternion: a quaternion whose norm is 1.
   - Pure quaternion: a quaternion whose scalar component (`w`) is 0.
   - Rotation quaternion: a unit quaternion used to represent rotation.
   - Orientation quaternion: a unit quaternion used to represent orientation.

 A quaternion can be normalized by dividing it by its norm. The resulting
 quaternion maintains the same direction, but has a norm of 1, i.e. it moves
 on the unit sphere. This is generally necessary for rotation and orientation
 quaternions, to avoid rounding errors:
 https://en.wikipedia.org/wiki/Rotation_formalisms_in_three_dimensions

 Note that `(x, y, z, w)` and `(-x, -y, -z, -w)` represent the same rotation,
 but normalization would be even more useful, e.g. for comparison purposes, if
 it would produce a unique representation. It is thus recommended that `w` be
 kept positive, which can be achieved by changing all the signs when `w` is
 negative.




 Q

  S The x component.


  S

  S	


  S

 V The y component.


 V

 V	


 V

 Y The z component.


 Y

 Y	


 Y
$
 \ The scalar component.


 \

 \	


 \bproto3??  
?
google/type/timeofday.protogoogle.type"k
	TimeOfDay
hours (Rhours
minutes (Rminutes
seconds (Rseconds
nanos (RnanosBl
com.google.typeBTimeOfDayProtoPZ>google.golang.org/genproto/googleapis/type/timeofday;timeofday??GTPJ?
 +
?
 2? Copyright 2021 Google LLC

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
 U
	
 U

 "
	

 "

 /
	
 /

 (
	
 (

 !
	
$ !
?
  +? Represents a time of day. The date and time zone are either not significant
 or are specified elsewhere. An API may choose to allow leap seconds. Related
 types are [google.type.Date][google.type.Date] and
 `google.protobuf.Timestamp`.



 
?
   ? Hours of day in 24 hour format. Should be from 0 to 23. An API may choose
 to allow the value "24:00:00" for scenarios like business closing time.


   

   

   
<
 #/ Minutes of hour of day. Must be from 0 to 59.


 #

 #

 #
?
 'z Seconds of minutes of the time. Must normally be from 0 to 59. An API may
 allow the value 60 if it allows leap-seconds.


 '

 '

 '
R
 *E Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999.


 *

 *

 *bproto3??  
?#
!grpc/binary_log/v1alpha/log.protogrpc.binary_log.v1alphagoogle/protobuf/timestamp.proto"6
KeyValuePair
key (	Rkey
value (	Rvalue"?
Metadata
rpc_id (RrpcId8
	timestamp (2.google.protobuf.TimestampR	timestamp@
	direction (2".grpc.binary_log.v1alpha.DirectionR	directionA
metadata (2%.grpc.binary_log.v1alpha.KeyValuePairRmetadataq
client_initial_metadata (27.grpc.binary_log.v1alpha.Metadata.ClientInitialMetadataH RclientInitialMetadataI
	user_data (2*.grpc.binary_log.v1alpha.Metadata.UserDataH RuserDataq
server_initial_metadata (27.grpc.binary_log.v1alpha.Metadata.ServerInitialMetadataH RserverInitialMetadataU
server_status (2..grpc.binary_log.v1alpha.Metadata.ServerStatusH RserverStatus?
ClientInitialMetadata
method_name (	R
methodName6
deadline (2.google.protobuf.TimestampRdeadline
peer (	Rpeer

UserData
ServerInitialMetadata<
ServerStatus
code (Rcode
details (	RdetailsB
kind"?
Message
rpc_id (RrpcId'
sequence_number (RsequenceNumber@
	direction (2".grpc.binary_log.v1alpha.DirectionR	direction
length (Rlength
data (Rdata*O
	Direction
SERVER_SEND 
SERVER_RECV
CLIENT_SEND
CLIENT_RECVJ?
 \
?
 2? Copyright 2016 gRPC authors.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.

	
  )

  


  


 

  

  

  

 

 

 

 

 

 

 

 

 


  


 

  

  

  	

  

 

 

 	

 
U
! LI Any sort of metadata that may be sent in either direction during a call



!
d
 $W Cryptographically unique identifier, generated on the client and sent
 to the server.


 $

 $	

 $
0
&*# Timestamp of logging the metadata


&

&%

&()

'

'

'

'
5
)%( The actual metadata that is being sent


)


)

) 

)#$
I
 ,3; Initial metadata sent by the client to initiate a request


 ,

:
  .+ The full method name that is being called


  .


  .

  .
$
 0+ The call's deadline


 0

 0&

 0)*
2
 2# The address of the connected peer


 2


 2

 2
?
78w Arbitrary key/value pairs specified by the user that are not sent over
 the network but are nonetheless useful to log


7

X
;<J Initial metadata response sent by the server after accepting the request


;

R
?DD Status sent by the server when closing the call on the server side


?

 
 A The status code


 A


 A

 A
#
C The status details


C


C

C

 FK

 F

G6

G

G1

G45

H

H

H

H

I6

I

I1

I45

J#

J

J

J!"
2
O \& A message that is sent during a call



O
d
 RW Cryptographically unique identifier, generated on the client and sent
 to the server.


 R

 R	

 R
?
U? The sequence number of the message. Messages sent by the client and by the
 server should have independently incrementing sequence numbers.


U

U	

U

V

V

V

V
2
X% The length of the complete message.


X

X	

X
]
[P The contents of the message. May be a prefix instead of the complete
 message.


[

[

[bproto3??  
??
grpc/channelz/channelz.protogrpc.channelz.v1google/protobuf/any.protogoogle/protobuf/duration.protogoogle/protobuf/timestamp.protogoogle/protobuf/wrappers.proto"?
Channel.
ref (2.grpc.channelz.v1.ChannelRefRref1
data (2.grpc.channelz.v1.ChannelDataRdata=
channel_ref (2.grpc.channelz.v1.ChannelRefR
channelRefF
subchannel_ref (2.grpc.channelz.v1.SubchannelRefRsubchannelRef:

socket_ref (2.grpc.channelz.v1.SocketRefR	socketRef"?

Subchannel1
ref (2.grpc.channelz.v1.SubchannelRefRref1
data (2.grpc.channelz.v1.ChannelDataRdata=
channel_ref (2.grpc.channelz.v1.ChannelRefR
channelRefF
subchannel_ref (2.grpc.channelz.v1.SubchannelRefRsubchannelRef:

socket_ref (2.grpc.channelz.v1.SocketRefR	socketRef"?
ChannelConnectivityStateF
state (20.grpc.channelz.v1.ChannelConnectivityState.StateRstate"^
State
UNKNOWN 
IDLE

CONNECTING	
READY
TRANSIENT_FAILURE
SHUTDOWN"?
ChannelData@
state (2*.grpc.channelz.v1.ChannelConnectivityStateRstate
target (	Rtarget4
trace (2.grpc.channelz.v1.ChannelTraceRtrace#
calls_started (RcallsStarted'
calls_succeeded (RcallsSucceeded!
calls_failed (RcallsFailedY
last_call_started_timestamp (2.google.protobuf.TimestampRlastCallStartedTimestamp"?
ChannelTraceEvent 
description (	RdescriptionH
severity (2,.grpc.channelz.v1.ChannelTraceEvent.SeverityRseverity8
	timestamp (2.google.protobuf.TimestampR	timestamp?
channel_ref (2.grpc.channelz.v1.ChannelRefH R
channelRefH
subchannel_ref (2.grpc.channelz.v1.SubchannelRefH RsubchannelRef"E
Severity

CT_UNKNOWN 
CT_INFO

CT_WARNING
CT_ERRORB
	child_ref"?
ChannelTrace*
num_events_logged (RnumEventsLoggedI
creation_timestamp (2.google.protobuf.TimestampRcreationTimestamp;
events (2#.grpc.channelz.v1.ChannelTraceEventRevents"c

ChannelRef

channel_id (R	channelId
name (	RnameJJJJJJ	"l
SubchannelRef#
subchannel_id (RsubchannelId
name (	RnameJJJJJJ"`
	SocketRef
	socket_id (RsocketId
name (	RnameJJJJJJ	"`
	ServerRef
	server_id (RserverId
name (	RnameJJJJJJ	"?
Server-
ref (2.grpc.channelz.v1.ServerRefRref0
data (2.grpc.channelz.v1.ServerDataRdata@
listen_socket (2.grpc.channelz.v1.SocketRefRlistenSocket"?

ServerData4
trace (2.grpc.channelz.v1.ChannelTraceRtrace#
calls_started (RcallsStarted'
calls_succeeded (RcallsSucceeded!
calls_failed (RcallsFailedY
last_call_started_timestamp (2.google.protobuf.TimestampRlastCallStartedTimestamp"?
Socket-
ref (2.grpc.channelz.v1.SocketRefRref0
data (2.grpc.channelz.v1.SocketDataRdata/
local (2.grpc.channelz.v1.AddressRlocal1
remote (2.grpc.channelz.v1.AddressRremote6
security (2.grpc.channelz.v1.SecurityRsecurity
remote_name (	R
remoteName"?

SocketData'
streams_started (RstreamsStarted+
streams_succeeded (RstreamsSucceeded%
streams_failed (RstreamsFailed#
messages_sent (RmessagesSent+
messages_received (RmessagesReceived(
keep_alives_sent (RkeepAlivesSenth
#last_local_stream_created_timestamp (2.google.protobuf.TimestampRlastLocalStreamCreatedTimestampj
$last_remote_stream_created_timestamp (2.google.protobuf.TimestampR lastRemoteStreamCreatedTimestampY
last_message_sent_timestamp	 (2.google.protobuf.TimestampRlastMessageSentTimestampa
last_message_received_timestamp
 (2.google.protobuf.TimestampRlastMessageReceivedTimestampV
local_flow_control_window (2.google.protobuf.Int64ValueRlocalFlowControlWindowX
remote_flow_control_window (2.google.protobuf.Int64ValueRremoteFlowControlWindow6
option (2.grpc.channelz.v1.SocketOptionRoption"?
AddressM
tcpip_address (2&.grpc.channelz.v1.Address.TcpIpAddressH RtcpipAddressG
uds_address (2$.grpc.channelz.v1.Address.UdsAddressH R
udsAddressM
other_address (2&.grpc.channelz.v1.Address.OtherAddressH RotherAddressA
TcpIpAddress

ip_address (R	ipAddress
port (Rport(

UdsAddress
filename (	RfilenameN
OtherAddress
name (	Rname*
value (2.google.protobuf.AnyRvalueB	
address"?
Security2
tls (2.grpc.channelz.v1.Security.TlsH Rtls@
other (2(.grpc.channelz.v1.Security.OtherSecurityH Rother?
Tls%
standard_name (	H RstandardName

other_name (	H R	otherName+
local_certificate (RlocalCertificate-
remote_certificate (RremoteCertificateB
cipher_suiteO
OtherSecurity
name (	Rname*
value (2.google.protobuf.AnyRvalueB
model"n
SocketOption
name (	Rname
value (	Rvalue4

additional (2.google.protobuf.AnyR
additional"L
SocketOptionTimeout5
duration (2.google.protobuf.DurationRduration"c
SocketOptionLinger
active (Ractive5
duration (2.google.protobuf.DurationRduration"?
SocketOptionTcpInfo

tcpi_state (R	tcpiState"
tcpi_ca_state (RtcpiCaState)
tcpi_retransmits (RtcpiRetransmits
tcpi_probes (R
tcpiProbes!
tcpi_backoff (RtcpiBackoff!
tcpi_options (RtcpiOptions&
tcpi_snd_wscale (RtcpiSndWscale&
tcpi_rcv_wscale (RtcpiRcvWscale
tcpi_rto	 (RtcpiRto
tcpi_ato
 (RtcpiAto 
tcpi_snd_mss (R
tcpiSndMss 
tcpi_rcv_mss (R
tcpiRcvMss!
tcpi_unacked (RtcpiUnacked
tcpi_sacked (R
tcpiSacked
	tcpi_lost (RtcpiLost!
tcpi_retrans (RtcpiRetrans!
tcpi_fackets (RtcpiFackets-
tcpi_last_data_sent (RtcpiLastDataSent+
tcpi_last_ack_sent (RtcpiLastAckSent-
tcpi_last_data_recv (RtcpiLastDataRecv+
tcpi_last_ack_recv (RtcpiLastAckRecv
	tcpi_pmtu (RtcpiPmtu*
tcpi_rcv_ssthresh (RtcpiRcvSsthresh
tcpi_rtt (RtcpiRtt
tcpi_rttvar (R
tcpiRttvar*
tcpi_snd_ssthresh (RtcpiSndSsthresh"
tcpi_snd_cwnd (RtcpiSndCwnd
tcpi_advmss (R
tcpiAdvmss'
tcpi_reordering (RtcpiReordering"b
GetTopChannelsRequest(
start_channel_id (RstartChannelId
max_results (R
maxResults"_
GetTopChannelsResponse3
channel (2.grpc.channelz.v1.ChannelRchannel
end (Rend"\
GetServersRequest&
start_server_id (RstartServerId
max_results (R
maxResults"X
GetServersResponse0
server (2.grpc.channelz.v1.ServerRserver
end (Rend"/
GetServerRequest
	server_id (RserverId"E
GetServerResponse0
server (2.grpc.channelz.v1.ServerRserver"
GetServerSocketsRequest
	server_id (RserverId&
start_socket_id (RstartSocketId
max_results (R
maxResults"h
GetServerSocketsResponse:

socket_ref (2.grpc.channelz.v1.SocketRefR	socketRef
end (Rend"2
GetChannelRequest

channel_id (R	channelId"I
GetChannelResponse3
channel (2.grpc.channelz.v1.ChannelRchannel";
GetSubchannelRequest#
subchannel_id (RsubchannelId"U
GetSubchannelResponse<

subchannel (2.grpc.channelz.v1.SubchannelR
subchannel"I
GetSocketRequest
	socket_id (RsocketId
summary (Rsummary"E
GetSocketResponse0
socket (2.grpc.channelz.v1.SocketRsocket2?
Channelzc
GetTopChannels'.grpc.channelz.v1.GetTopChannelsRequest(.grpc.channelz.v1.GetTopChannelsResponseW

GetServers#.grpc.channelz.v1.GetServersRequest$.grpc.channelz.v1.GetServersResponseT
	GetServer".grpc.channelz.v1.GetServerRequest#.grpc.channelz.v1.GetServerResponsei
GetServerSockets).grpc.channelz.v1.GetServerSocketsRequest*.grpc.channelz.v1.GetServerSocketsResponseW

GetChannel#.grpc.channelz.v1.GetChannelRequest$.grpc.channelz.v1.GetChannelResponse`
GetSubchannel&.grpc.channelz.v1.GetSubchannelRequest'.grpc.channelz.v1.GetSubchannelResponseT
	GetSocket".grpc.channelz.v1.GetSocketRequest#.grpc.channelz.v1.GetSocketResponseBX
io.grpc.channelz.v1BChannelzProtoPZ0google.golang.org/grpc/channelz/grpc_channelz_v1J??
 ?
?
 2? Copyright 2018 The gRPC Authors

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
2? This file defines an interface for exporting monitoring information
 out of gRPC servers.  See the full design at
 https://github.com/grpc/proposal/blob/master/A14-channelz.md

 The canonical version of this proto can be found at
 https://github.com/grpc/grpc-proto/blob/master/grpc/channelz/v1/channelz.proto


 
	
  #
	
 (
	
 )
	
 (

 G
	
 G

 "
	

 "

  ,
	
  ,

! .
	
! .
R
 $ 8F Channel is a logical grouping of channels, subchannels, and sockets.



 $
C
  &6 The identifier for this channel. This should be set.


  &

  &

  &
q
 (  Data specific to this channel.
"B At most one of 'channel_ref+subchannel_ref' and 'socket' is set.


 (

 (

 (
?
 .&? There are no ordering guarantees on the order of channel refs.
 There may not be cycles in the ref graph.
 A channel ref may be present in more than one channel or subchannel.


 .


 .

 .!

 .$%
?
 4,? At most one of 'channel_ref+subchannel_ref' and 'socket' is set.
 There are no ordering guarantees on the order of subchannel refs.
 There may not be cycles in the ref graph.
 A sub channel ref may be present in more than one channel or subchannel.


 4


 4

 4'

 4*+
H
 7$; There are no ordering guarantees on the order of sockets.


 7


 7

 7

 7"#
?
< P~ Subchannel is a logical grouping of channels, subchannels, and sockets.
 A subchannel is load balanced over by it's ancestor



<
/
 >" The identifier for this channel.


 >

 >

 >
q
@  Data specific to this channel.
"B At most one of 'channel_ref+subchannel_ref' and 'socket' is set.


@

@

@
?
F&? There are no ordering guarantees on the order of channel refs.
 There may not be cycles in the ref graph.
 A channel ref may be present in more than one channel or subchannel.


F


F

F!

F$%
?
L,? At most one of 'channel_ref+subchannel_ref' and 'socket' is set.
 There are no ordering guarantees on the order of subchannel refs.
 There may not be cycles in the ref graph.
 A sub channel ref may be present in more than one channel or subchannel.


L


L

L'

L*+
H
O$; There are no ordering guarantees on the order of sockets.


O


O

O

O"#
?
T ^? These come from the specified states in this document:
 https://github.com/grpc/grpc/blob/master/doc/connectivity-semantics-and-api.md



T 

 U\

 U

  V

  V

  V

 W

 W

 W

 X

 X

 X

 Y

 Y	

 Y

 Z

 Z

 Z

 [

 [

 [

 ]

 ]

 ]

 ]
O
a uC Channel data is data related to a specific Channel or Subchannel.



a
m
 d%` The connectivity state of the channel or subchannel.  Implementations
 should always set this.


 d

 d 

 d#$
U
gH The target this channel originally tried to connect to.  May be absent


g

g	

g
G
j: A trace of recent events on the channel.  May be absent.


j

j

j
9
m, The number of calls started on the channel


m

m

m
H
o; The number of calls that have completed with an OK status


o

o

o
K
q> The number of calls that have completed with a non-OK status


q

q

q
?
t<2 The last time a call was started on the channel.


t

t7

t:;
?
y ?? A trace event is an interesting thing that happened to a channel or
 subchannel, such as creation, address resolution, subchannel creation, etc.



y
3
 {& High level description of the event.


 {

 {	

 {
?
 }?0 The supported severity levels of trace events.


 }

  ~

  ~

  ~

 

 

 

 ?

 ?

 ?

 ?

 ?

 ?
/
?! the severity of the trace event


?


?

?
)
?* When this event occurred.


?

?%

?()
?
 ??? ref of referenced channel or subchannel.
 Optional, only present if this event refers to a child object. For example,
 this field would be filled if this trace event was for a subchannel being
 created.


 ?

?

?

?

?

?%

?

? 

?#$
\
? ?N ChannelTrace represents the recent events that have occurred on the channel.


?
?
 ?? Number of events ever logged in this tracing object. This can differ from
 events.size() because events can be overwritten or garbage collected by
 implementations.


 ?

 ?

 ?
3
?3% Time that this channel was created.


?

?.

?12
B
?(4 List of events that have occurred on this channel.


?


?

?#

?&'
7
? ?) ChannelRef is a reference to a Channel.


?
T
 ?F The globally unique id for this channel.  Must be a positive number.


 ?

 ?

 ?
=
?/ An optional name associated with the channel.


?

?	

?
E
	?8 Intentionally don't use field numbers from other refs.


	 ?

	 ?

	?

	?

	?

	?

	?

	?

	?

	?

	?

	?
=
? ?/ SubchannelRef is a reference to a Subchannel.


?
W
 ?I The globally unique id for this subchannel.  Must be a positive number.


 ?

 ?

 ?
@
?2 An optional name associated with the subchannel.


?

?	

?
E
	?8 Intentionally don't use field numbers from other refs.


	 ?

	 ?

	?

	?

	?

	?

	?

	?

	?

	?

	?

	?
5
? ?' SocketRef is a reference to a Socket.


?
S
 ?E The globally unique id for this socket.  Must be a positive number.


 ?

 ?

 ?
<
?. An optional name associated with the socket.


?

?	

?
E
	?8 Intentionally don't use field numbers from other refs.


	 ?

	 ?

	?

	?

	?

	?

	?

	?

	?

	?

	?

	?
5
	? ?' ServerRef is a reference to a Server.


	?
Y
	 ?K A globally unique identifier for this server.  Must be a positive number.


	 ?

	 ?

	 ?
<
	?. An optional name associated with the server.


	?

	?	

	?
E
		?8 Intentionally don't use field numbers from other refs.


		 ?

		 ?

		?

		?

		?

		?

		?

		?

		?

		?

		?

		?
g

? ?Y Server represents a single server.  There may be multiple servers in a single
 program.



?
A

 ?3 The identifier for a Server.  This should be set.



 ?


 ?


 ?
2

?$ The associated data of the Server.



?


?


?
u

?'g The sockets that the server is listening on.  There are no ordering
 guarantees.  This may be absent.



?



?


?"


?%&
9
? ?+ ServerData is data for a specific Server.


?
G
 ?9 A trace of recent events on the server.  May be absent.


 ?

 ?

 ?
B
?4 The number of incoming calls started on the server


?

?

?
R
?D The number of incoming calls that have completed with an OK status


?

?

?
W
?I The number of incoming calls that have a completed with a non-OK status


?

?

?
?
?<1 The last time a call was started on the server.


?

?7

?:;
N
? ?@ Information about an actual connection.  Pronounced "sock-ay".


?
.
 ?  The identifier for the Socket.


 ?

 ?

 ?
-
? Data specific to this Socket.


?

?

?
*
? The locally bound address.


?	

?


?
9
?+ The remote bound address.  May be absent.


?	

?


?
z
?l Security details for this socket.  May be absent if not available, or
 there is no security on the socket.


?


?

?
r
?d Optional, represents the name of the remote endpoint, if different than
 the original target name.


?

?	

?
?
? ?? SocketData is data associated for a specific Socket.  The fields present
 are specific to the implementation, so there may be minor differences in
 the semantics.  (e.g. flow control windows)


?
=
 ?/ The number of streams that have been started.


 ?

 ?

 ?
?
?? The number of streams that have ended successfully:
 On client side, received frame with eos bit set;
 On server side, sent frame with eos bit set.


?

?

?
?
?? The number of streams that have ended unsuccessfully:
 On client side, ended without receiving frame with eos bit set;
 On server side, ended without sending frame with eos bit set.


?

?

?
M
?? The number of grpc messages successfully sent on this socket.


?

?

?
D
?6 The number of grpc messages received on this socket.


?

?

?
j
?\ The number of keep alives sent.  This is typically implemented with HTTP/2
 ping messages.


?

?

?
a
?DS The last time a stream was created by this endpoint.  Usually unset for
 servers.


?

??

?BC
g
?EY The last time a stream was created by the remote endpoint.  Usually unset
 for clients.


?

?@

?CD
B
?<4 The last time a message was sent by this endpoint.


?

?7

?:;
F
	?A8 The last time a message was received by this endpoint.


	?

	?;

	?>@
?

?<? The amount of window, granted to the local endpoint by the remote endpoint.
 This may be slightly out of date due to network latency.  This does NOT
 include stream level or TCP level flow control info.



?


?6


?9;
?
?>? The amount of window, granted to the remote endpoint by the local endpoint.
 This may be slightly out of date due to network latency.  This does NOT
 include stream level or TCP level flow control info.


?

?8

?;=
k
?$] Socket options set on this socket.  May be absent if 'summary' is set
 on GetSocketRequest.


?


?

?

?!#
I
? ?; Address represents the address used to create the socket.


?

 ??

 ?

k
  ?[ Either the IPv4 or IPv6 address in bytes.  Will be either 4 bytes or 16
 bytes in length.


  ?	

  ?


  ?
2
 ?" 0-64k, or -1 if not appropriate.


 ?	

 ?


 ?
/
?? A Unix Domain Socket address.


?


 ?

 ?


 ?

 ?
5
??% An address type not included above.


?

U
 ?E The human readable version of the value.  This value should be set.


 ?


 ?

 ?
-
?" The actual address message.


?

?

? !

 ??

 ?

 ?#

 ?

 ?

 ?!"

?

?

?

?

?#

?

?

?!"
K
? ?= Security represents details about how secure the socket is.


?

 ??

 ?


  ??

  ?

o
  ?_ The cipher suite name in the RFC 4346 format:
 https://tools.ietf.org/html/rfc4346#appendix-C


  ?

  ?

  ?
e
 ?U Some other way to describe the cipher suite if
 the RFC 4346 name is not available.


 ?

 ?

 ?
8
 ? ( the certificate used by this endpoint.


 ?	

 ?


 ?
>
 ?!. the certificate used by the remote endpoint.


 ?	

 ?


 ? 

??

?

:
 ?* The human readable version of the value.


 ?


 ?

 ?
6
?"& The actual security details message.


?

?

? !

 ??

 ?

 ?

 ?

 ?

 ?

?

?

?

?
?
? ?v SocketOption represents socket options for a socket.  Specifically, these
 are the options returned by getsockopt().


?
y
 ?k The full name of the socket option.  Typically this will be the upper case
 name, such as "SO_REUSEPORT".


 ?

 ?	

 ?
r
?d The human readable value of this socket option.  At least one of value or
 additional will be set.


?

?	

?
u
?%g Additional data associated with the socket option.  At least one of value
 or additional will be set.


?

? 

?#$
v
? ?h For use with SocketOption's additional field.  This is primarily used for
 SO_RCVTIMEO and SO_SNDTIMEO


?

 ?(

 ?

 ?#

 ?&'
e
? ?W For use with SocketOption's additional field.  This is primarily used for
 SO_LINGER.


?
6
 ?( active maps to `struct linger.l_onoff`


 ?

 ?

 ?
9
?(+ duration maps to `struct linger.l_linger`


?

?#

?&'
b
? ?T For use with SocketOption's additional field.  Tcp info for
 SOL_TCP and TCP_INFO.


?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

	?

	?

	?	

	?


?


?


?	


?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?"

?

?	

?!

?!

?

?	

? 

?"

?

?	

?!

?!

?

?	

? 

?

?

?	

?

? 

?

?	

?

?

?

?	

?

?

?

?	

?

? 

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?
h
 ? ?Z Channelz is a service exposed by gRPC servers that provides detailed debug
 information.


 ?
?
  ?M? Gets all root channels (i.e. channels the application has directly
 created). This does not include subchannels nor non-top level channels.


  ?

  ?*

  ?5K
;
 ?A- Gets all servers that exist in the process.


 ?

 ?"

 ?-?
B
 ?>4 Returns a single Server, or else a NOT_FOUND code.


 ?

 ? 

 ?+<
B
 ?S4 Gets all server sockets that exist in the process.


 ?

 ?.

 ?9Q
C
 ?A5 Returns a single Channel, or else a NOT_FOUND code.


 ?

 ?"

 ?-?
F
 ?J8 Returns a single Subchannel, or else a NOT_FOUND code.


 ?

 ?(

 ?3H
A
 ?>3 Returns a single Socket or else a NOT_FOUND code.


 ?

 ? 

 ?+<

? ?

?
?
 ?? start_channel_id indicates that only channels at or above this id should be
 included in the results.
 To request the first page, this should be set to 0. To request
 subsequent pages, the client generates this value by adding 1 to
 the highest seen result ID.


 ?

 ?

 ?
?
?? If non-zero, the server will return a page of results containing
 at most this many items. If zero, the server will choose a
 reasonable page size.  Must never be negative.


?

?

?

? ?

?
?
 ?? list of channels that the connection detail service knows about.  Sorted in
 ascending channel_id order.
 Must contain at least 1 result, otherwise 'end' must be true.


 ?


 ?

 ?

 ?
?
?? If set, indicates that the list of channels is the final list.  Requesting
 more channels can only return more if they are created after this RPC
 completes.


?

?


?

? ?

?
?
 ?? start_server_id indicates that only servers at or above this id should be
 included in the results.
 To request the first page, this must be set to 0. To request
 subsequent pages, the client generates this value by adding 1 to
 the highest seen result ID.


 ?

 ?

 ?
?
?? If non-zero, the server will return a page of results containing
 at most this many items. If zero, the server will choose a
 reasonable page size.  Must never be negative.


?

?

?

? ?

?
?
 ?? list of servers that the connection detail service knows about.  Sorted in
 ascending server_id order.
 Must contain at least 1 result, otherwise 'end' must be true.


 ?


 ?

 ?

 ?
?
?? If set, indicates that the list of servers is the final list.  Requesting
 more servers will only return more if they are created after this RPC
 completes.


?

?


?

? ?

?
J
 ?< server_id is the identifier of the specific server to get.


 ?

 ?

 ?

? ?

?
c
 ?U The Server that corresponds to the requested server_id.  This field
 should be set.


 ?

 ?	

 ?

? ?

?

 ?

 ?

 ?

 ?
?
?? start_socket_id indicates that only sockets at or above this id should be
 included in the results.
 To request the first page, this must be set to 0. To request
 subsequent pages, the client generates this value by adding 1 to
 the highest seen result ID.


?

?

?
?
?? If non-zero, the server will return a page of results containing
 at most this many items. If zero, the server will choose a
 reasonable page size.  Must never be negative.


?

?

?

? ?

? 
?
 ?$? list of socket refs that the connection detail service knows about.  Sorted in
 ascending socket_id order.
 Must contain at least 1 result, otherwise 'end' must be true.


 ?


 ?

 ?

 ?"#
?
?? If set, indicates that the list of sockets is the final list.  Requesting
 more sockets will only return more if they are created after this RPC
 completes.


?

?


?

? ?

?
L
 ?> channel_id is the identifier of the specific channel to get.


 ?

 ?

 ?

? ?

?
e
 ?W The Channel that corresponds to the requested channel_id.  This field
 should be set.


 ?	

 ?


 ?

? ?

?
R
 ?D subchannel_id is the identifier of the specific subchannel to get.


 ?

 ?

 ?

? ?

?
k
 ?] The Subchannel that corresponds to the requested subchannel_id.  This
 field should be set.


 ?

 ?

 ?

 ? ?

 ?
J
  ?< socket_id is the identifier of the specific socket to get.


  ?

  ?

  ?
?
 ?? If true, the response will contain only high level information
 that is inexpensive to obtain. Fields thay may be omitted are
 documented.


 ?

 ?

 ?

!? ?

!?
c
! ?U The Socket that corresponds to the requested socket_id.  This field
 should be set.


! ?

! ?	

! ?bproto3??  
?
grpc/core/stats.proto	grpc.core"4
Bucket
start (Rstart
count (Rcount"8
	Histogram+
buckets (2.grpc.core.BucketRbuckets"s
Metric
name (	Rname
count
 (H Rcount4
	histogram (2.grpc.core.HistogramH R	histogramB
value"4
Stats+
metrics (2.grpc.core.MetricRmetricsJ?
 %
?
 2? Copyright 2017 gRPC authors.

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
 


  


 

  

  

  	

  

 

 

 	

 


 




 

 


 

 

 


 !




 

 

 	

 

  

 



















# %


#

 $

 $


 $

 $

 $bproto3??  
?
grpc/health/v1/health.protogrpc.health.v1".
HealthCheckRequest
service (	Rservice"?
HealthCheckResponseI
status (21.grpc.health.v1.HealthCheckResponse.ServingStatusRstatus"O
ServingStatus
UNKNOWN 
SERVING
NOT_SERVING
SERVICE_UNKNOWN2?
HealthP
Check".grpc.health.v1.HealthCheckRequest#.grpc.health.v1.HealthCheckResponseR
Watch".grpc.health.v1.HealthCheckRequest#.grpc.health.v1.HealthCheckResponse0Ba
io.grpc.health.v1BHealthProtoPZ,google.golang.org/grpc/health/grpc_health_v1?Grpc.Health.V1J?
 >
?
 2? Copyright 2015 The gRPC Authors

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
2? The canonical version of this proto can be found at
 https://github.com/grpc/grpc-proto/blob/master/grpc/health/v1/health.proto


 

 +
	
% +

 C
	
 C

 "
	

 "

 ,
	
 ,

 *
	
 *


  


 

  

  

  	

  


 '




  %

  

  !

  !

  !

 "

 "

 "

 #

 #

 #
/
 $"  Used only by the Watch method.


 $

 $

 &

 &

 &

 &


 ) >


 )
^
  ,>Q If the requested service is unknown, the call will fail with status
 NOT_FOUND.


  ,

  ,

  ,)<
?
 =E? Performs a watch for the serving status of the requested service.
 The server will immediately send back a message indicating the current
 serving status.  It will then subsequently send a new message whenever
 the service's serving status changes.

 If the requested service is unknown when the call is received, the
 server will send a message setting the serving status to
 SERVICE_UNKNOWN but will *not* terminate the call.  If at some
 future point, the serving status of the service becomes known, the
 server will send a new message with the service's serving status.

 If the call terminates with status UNIMPLEMENTED, then clients
 should assume this method is not supported and should not retry the
 call.  If the call terminates with any other status (including OK),
 clients should retry the call with appropriate exponential backoff.


 =

 =

 =)/

 =0Cbproto3??  
?
(grpc/http_over_grpc/http_over_grpc.protogrpc.http_over_grpc"2
Header
key (	Rkey
values (	Rvalues"?
HTTPOverGRPCRequest
method (	Rmethod
url (	Rurl5
headers (2.grpc.http_over_grpc.HeaderRheaders
body (Rbody"v
HTTPOverGRPCReply
status (Rstatus5
headers (2.grpc.http_over_grpc.HeaderRheaders
body (Rbody2q
HTTPOverGRPCa
HTTPRequest(.grpc.http_over_grpc.HTTPOverGRPCRequest&.grpc.http_over_grpc.HTTPOverGRPCReply" J?
 2
?
 2? Copyright 2019 The gRPC Authors

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
 
)
   Represents HTTP 1.1 header.



 

  

  

  	

  

 

 


 

 

 
9
 "- An HTTP 1.1 request encapsulated in a gRPC.




'
  The HTTP request method.


 

 	

 
$
 The HTTP request URL.




	


(
 The HTTP request headers.










!
! HTTP request body.


!

!

!
7
% ,+ An HTTP 1.1 reply encapsulated in an RPC.



%
9
 ', The HTTP status code (e.g. 200, 400, 404).


 '

 '

 '
)
) The HTTP response headers.


)


)

)

)
&
+ The HTTP response body.


+

+

+
H
 / 2< Currently does not support HTTP chunked transfer encoding.



 /
.
  1D! Perform the given HTTP request.


  1

  1$

  1/@bproto3??  
?;
grpc/lb/v1/load_balancer.proto
grpc.lb.v1google/protobuf/duration.protogoogle/protobuf/timestamp.proto"?
LoadBalanceRequestP
initial_request (2%.grpc.lb.v1.InitialLoadBalanceRequestH RinitialRequest<
client_stats (2.grpc.lb.v1.ClientStatsH RclientStatsB
load_balance_request_type"/
InitialLoadBalanceRequest
name (	Rname"`
ClientStatsPerToken,
load_balance_token (	RloadBalanceToken
	num_calls (RnumCalls"?
ClientStats8
	timestamp (2.google.protobuf.TimestampR	timestamp*
num_calls_started (RnumCallsStarted,
num_calls_finished (RnumCallsFinished]
-num_calls_finished_with_client_failed_to_send (R&numCallsFinishedWithClientFailedToSendH
!num_calls_finished_known_received (RnumCallsFinishedKnownReceivedX
calls_finished_with_drop (2.grpc.lb.v1.ClientStatsPerTokenRcallsFinishedWithDropJJ"?
LoadBalanceResponseS
initial_response (2&.grpc.lb.v1.InitialLoadBalanceResponseH RinitialResponse9
server_list (2.grpc.lb.v1.ServerListH R
serverListK
fallback_response (2.grpc.lb.v1.FallbackResponseH RfallbackResponseB
load_balance_response_type"?
InitialLoadBalanceResponse4
load_balancer_delegate (	RloadBalancerDelegateZ
client_stats_report_interval (2.google.protobuf.DurationRclientStatsReportInterval"@

ServerList,
servers (2.grpc.lb.v1.ServerRserversJ"?
Server

ip_address (R	ipAddress
port (Rport,
load_balance_token (	RloadBalanceToken
drop (RdropJ"
FallbackResponse2b
LoadBalancerR
BalanceLoad.grpc.lb.v1.LoadBalanceRequest.grpc.lb.v1.LoadBalanceResponse(0BX
io.grpc.grpclbBLoadBalancerProtoPZ1google.golang.org/grpc/balancer/grpclb/grpc_lb_v1J?-
 ?
?
 ? This file defines the GRPCLB LoadBalancing protocol.

 The canonical version of this proto can be found at
 https://github.com/grpc/grpc-proto/blob/master/grpc/lb/v1/load_balancer.proto
2? Copyright 2015 The gRPC Authors

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
 
	
  (
	
 )

 H
	
 H

 "
	

 "

 2
	
 2

 '
	
 '


  !


 
:
   R- Bidirectional rpc to get a list of servers.


   

   

   +

   6<

   =P


 # ,


 #

  $+

  $!
U
  &2H This message should be sent on the first request to the load balancer.


  &

  &-

  &01
?
 *!? The client stats should be periodically reported to the load balancer
 based on the duration defined in the InitialLoadBalanceResponse.


 *

 *

 * 


. 4


.!
?
 3? The name of the load balanced service (e.g., service.googleapis.com). Its
 length should be less than 256 bytes.
 The name might include a port number. How to handle the port number is up
 to the balancer.


 3

 3	

 3
X
7 =L Contains the number of calls finished for a particular load balance token.



7
-
 9   See Server.load_balance_token.


 9

 9	

 9
P
<C The total number of RPCs that finished associated with the token.


<

<

<
?
A V? Contains client level statistics that are useful to load balancing. Each
 count except the timestamp should be reset to zero after reporting the stats.



A
6
 C*) The timestamp of generating the report.


 C

 C%

 C()
5
F( The total number of RPCs that started.


F

F

F
6
I) The total number of RPCs that finished.


I

I

I
Z
L:M The total number of RPCs that failed to reach a server except dropped RPCs.


L

L5

L89
g
P.Z The total number of RPCs that finished and are known to have been received
 by a server.


P

P)

P,-
)
S< The list of dropped calls.


S


S

S7

S:;


	U

	 U

	 U

	U

	U


X f


X

 Ye

 Y"
O
 [4B This message should be sent on the first response to the client.


 [

 [/

 [23
?
_? Contains the list of servers selected by the load balancer. The client
 should send requests to these servers in the specified order.


_

_

_
?
d+? If this field is set, then the client should eagerly enter fallback
 mode (even if there are existing, healthy connections to backends).
 See go/grpclb-explicit-fallback for more details.


d

d&

d)*


h t


h"
?
 n$? This is an application layer redirect that indicates the client should use
 the specified server for load balancing. When this field is non-empty in
 the response, the client should open a separate connection to the
 load_balancer_delegate and call the BalanceLoad method. Its length should
 be less than 64 bytes.


 n

 n	

 n"#
?
s<? This interval defines how often the client should send the client stats
 to the load balancer. Stats should only be reported when the duration is
 positive.


s

s7

s:;


v 


v
?
 {? Contains a list of servers selected by the load balancer. The list will
 be updated when server resolutions change or as needed to balance load
 across more servers. The client should consume the server list in order
 unless instructed otherwise via the client_config.


 {


 {

 {

 {
?
	~3 Was google.protobuf.Duration expiration_interval.


	 ~

	 ~
d
? ?V Contains server information. When the drop field is not true, use the other
 fields.


?

 ?q A resolved address for the server, serialized in network-byte-order. It may
 either be an IPv4 or IPv6 address.


 ?

 ?

 ?
6
?( A resolved port number for the server.


?

?

?
?
? ? An opaque but printable token for load reporting. The client must include
 the token of the picked server into the initial metadata when it starts a
 call to that server. The token is used by the server to verify the request
 and to allow the server to report load to the gRPC LB system. The token is
 also used in client stats for reporting dropped calls.

 Its length can be variable but must be less than 50 bytes.


?

?	

?
?
?? Indicates whether this particular request should be dropped by the client.
 If the request is dropped, there will be a corresponding entry in
 ClientStats.calls_finished_with_drop.


?

?

?

	?

	 ?

	 ?


? 

?bproto3??  
?L
grpc/lb/v1/load_reporter.proto
grpc.lb.v1google/protobuf/duration.proto"b
LoadReportRequestM
initial_request (2$.grpc.lb.v1.InitialLoadReportRequestRinitialRequest"?
InitialLoadReportRequest4
load_balanced_hostname (	RloadBalancedHostname
load_key (RloadKeyK
load_report_interval (2.google.protobuf.DurationRloadReportInterval"?
LoadReportResponseP
initial_response (2%.grpc.lb.v1.InitialLoadReportResponseRinitialResponseY
load_balancing_feedback (2!.grpc.lb.v1.LoadBalancingFeedbackRloadBalancingFeedback$
load (2.grpc.lb.v1.LoadRload"?
InitialLoadReportResponse(
load_balancer_id (	RloadBalancerIdk
implementation_id (2>.grpc.lb.v1.InitialLoadReportResponse.ImplementationIdentifierRimplementationId%
server_version (RserverVersion"K
ImplementationIdentifier
IMPL_UNSPECIFIED 
CPP
JAVA
GO"?
LoadBalancingFeedback-
server_utilization (RserverUtilization(
calls_per_second (RcallsPerSecond*
errors_per_second (RerrorsPerSecond"?
Load(
load_balance_tag (	RloadBalanceTag
user_id (	RuserId*
client_ip_address (RclientIpAddress*
num_calls_started (RnumCallsStarted3
num_calls_in_progress (H RnumCallsInProgressF
 num_calls_finished_without_error (RnumCallsFinishedWithoutError@
num_calls_finished_with_error (RnumCallsFinishedWithErrorM
$num_calls_finished_with_server_error (RnumCallsFinishedWithServerError(
total_bytes_sent (RtotalBytesSent0
total_bytes_received	 (RtotalBytesReceived>
total_latency
 (2.google.protobuf.DurationRtotalLatency;
metric_data (2.grpc.lb.v1.CallMetricDataR
metricData
load_key (BHRloadKey*
load_key_unknown (HRloadKeyUnknown^
orphaned_load_identifier (2".grpc.lb.v1.OrphanedLoadIdentifierHRorphanedLoadIdentifierB
in_progress_reportB
orphaned_loadJ"?
CallMetricData
metric_name (	R
metricNameB
num_calls_finished_with_metric (RnumCallsFinishedWithMetric,
total_metric_value (RtotalMetricValue"]
OrphanedLoadIdentifier
load_key (RloadKey(
load_balancer_id (	RloadBalancerId2a
LoadReporterQ

ReportLoad.grpc.lb.v1.LoadReportRequest.grpc.lb.v1.LoadReportResponse" (0J?:
 ?
?
 2? Copyright 2018 gRPC authors.

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
	
  (
'
   The LoadReporter service.



 
.
    Report load from server to lb.


  

  

  )

  

  &


  


 
S
  /F This message should be sent on the first request to the gRPC server.


  

  *

  -.


! .


! 
M
 #$@ The hostname this load reporter client is requesting load for.


 #

 #	

 #"#
?
)? Additional information to disambiguate orphaned load: load that should have
 gone to this load reporter client, but was not able to be sent since the
 load reporter client has disconnected. load_key is sent in orphaned load
 reports; see Load.load_key.


)

)

)
i
-4\ This interval defines how often the server should send load reports to
 the load balancer.


-

-/

-23


0 =


0
V
 21I This message should be sent on the first response to the load balancer.


 2

 2,

 2/0
o
64b Reports server-wide statistics for load balancing.
 This should be reported with every response.


6

6/

623
?
<? A load report for each <tag, user_id> tuple. This could be considered to be
 a multimap indexed by <tag, user_id>. It is not strictly necessary to
 aggregate all entries into one entry per <tag, user_id> tuple, although it
 is preferred to do so.


<


<

<

<


? Q


?!
i
 B\ Initial response returns the Load balancer ID. This must be plain text
 (printable ASCII).


 B

 B	

 B

 DI

 D

  E

  E

  E
4
 F"% Standard Google C++ implementation.


 F

 F

5
 G"& Standard Google Java implementation.


 G

 G
3
 H"$ Standard Google Go implementation.


 H

 H	

W
K1J Optional identifier of this implementation of the load reporting server.


K

K,

K/0
?
P? Optional server_version should be a value that is modified (and
 monotonically increased) when changes are made to the server
 implementation.


P

P

P


S \


S
Y
 UL Reports the current utilization of the server (typical range [0.0 - 1.0]).


 U

 U

 U
Q
XD The total rate of calls handled by this server (including errors).


X

X

X
E
[8 The total rate of error responses sent by this server.


[

[

[

^ ?


^
?
 b? The (plain text) tag used by the calls covered by this load report. The
 tag is that part of the load balancer token after removing the load
 balancer id. Empty is equivalent to non-existent tag.


 b

 b	

 b
?
fu The user identity authenticated by the calls covered by this load
 report. Empty is equivalent to no known user_id.


f

f	

f
?
j? IP address of the client that sent these requests, serialized in
 network-byte-order. It may either be an IPv4 or IPv6 address.


j

j

j
c
nV The number of calls started (since the last report) with the given tag and
 user_id.


n

n

n
?
 x{? Indicates whether this load report is an in-progress load report in which
 num_calls_in_progress is the only valid entry. If in_progress_report is not
 set, num_calls_in_progress will be ignored. If in_progress_report is set,
 fields other than num_calls_in_progress and orphaned_load will be ignored.
 TODO(juanlishen): A Load is either an in_progress_report or not. We should
 make this explicit in hierarchy. From the log, I see in_progress_report_
 has a random num_calls_in_progress_ when not set, which might lead to bug
 when the balancer process the load report.


 x
V
z$I The number of calls in progress (instantaneously) per load balancer id.


z	

z


z"#
?
-m The following values are counts or totals of call statistics that finished
 with the given tag and user_id.
" Calls with status OK.




(

+,
)
?*" Calls with status non-OK.


?

?%

?()
?
?2? Calls that finished with a status that maps to HTTP 5XX (see
 googleapis/google/rpc/code.proto). Note that this is a subset of
 num_calls_finished_with_error.


?

?,

?/1
D
?6 Totals are from calls that with _and_ without error.


?

?

?

	?!

	?

	?

	? 


?.


?


?(


?+-
`
?+R Optional metrics reported for the call(s). Requires that metric_name is
 unique.


?


?

?%

?(*
?
??? The following two fields are used for reporting orphaned load: load that
 could not be reported to the originating balancer either since the balancer
 is no longer connected or because the frontend sent an invalid token. These
 fields must not be set with normal (unorphaned) load reports.


?
a
?*S Load_key is the load_key from the initial_request from the originating
 balancer.


?	

?


?

?)

?(
?
?? If true then this load report is for calls that had an invalid token; the
 user is probably abusing the gRPC protocol.
 TODO(yankaiz): Rename load_key_unknown.


?

?	

?
q
?9c load_key and balancer_id are included in order to identify orphaned load
 from different origins.


?

?3

?68

	?

	 ?

	 ?

? ?

?
1
 ?# Name of the metric; may be empty.


 ?

 ?	

 ?
G
?+9 Number of calls that finished and included this metric.


?

?&

?)*
U
? G Sum of metric values across all calls that finished with this metric.


?

?	

?

? ?

?
T
 ?F The load_key from the initial_request from the originating balancer.


 ?

 ?

 ?
?
?{ The unique ID generated by LoadReporter to identify balancers. Here it
 distinguishes orphaned load with a same load_key.


?

?	

?bproto3??  
?8
(grpc/reflection/v1alpha/reflection.protogrpc.reflection.v1alpha"?
ServerReflectionRequest
host (	Rhost*
file_by_filename (	H RfileByFilename6
file_containing_symbol (	H RfileContainingSymbolg
file_containing_extension (2).grpc.reflection.v1alpha.ExtensionRequestH RfileContainingExtensionB
all_extension_numbers_of_type (	H RallExtensionNumbersOfType%
list_services (	H RlistServicesB
message_request"f
ExtensionRequest'
containing_type (	RcontainingType)
extension_number (RextensionNumber"?
ServerReflectionResponse

valid_host (	R	validHost[
original_request (20.grpc.reflection.v1alpha.ServerReflectionRequestRoriginalRequestk
file_descriptor_response (2/.grpc.reflection.v1alpha.FileDescriptorResponseH RfileDescriptorResponsew
all_extension_numbers_response (20.grpc.reflection.v1alpha.ExtensionNumberResponseH RallExtensionNumbersResponsed
list_services_response (2,.grpc.reflection.v1alpha.ListServiceResponseH RlistServicesResponseO
error_response (2&.grpc.reflection.v1alpha.ErrorResponseH RerrorResponseB
message_response"L
FileDescriptorResponse2
file_descriptor_proto (RfileDescriptorProto"j
ExtensionNumberResponse$
base_type_name (	RbaseTypeName)
extension_number (RextensionNumber"Y
ListServiceResponseB
service (2(.grpc.reflection.v1alpha.ServiceResponseRservice"%
ServiceResponse
name (	Rname"S
ErrorResponse

error_code (R	errorCode#
error_message (	RerrorMessage2?
ServerReflection
ServerReflectionInfo0.grpc.reflection.v1alpha.ServerReflectionRequest1.grpc.reflection.v1alpha.ServerReflectionResponse(0J?+
 ?
?
 2? Copyright 2016 gRPC authors.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
2' Service exported by server reflection


  


  


 
?
  0w The reflection service is structured as a bidirectional stream, ensuring
 all related requests go to a single server.


  

  !

  "9

  

  .
V
  <J The message sent by the client when calling ServerReflectionInfo method.



 

  

  

  	

  
?
  !;? To use reflection service, the client should set one of the following
 fields in message_request. The server distinguishes requests by their
 defined field and then handles them using corresponding methods.


  !
2
 # % Find a proto file by the file name.


 #


 #

 #
?
 (&? Find the proto file that declares the given fully-qualified symbol name.
 This field should be a fully-qualified symbol name
 (e.g. <package>.<service>[.<method>] or <package>.<type>).


 (


 (!

 ($%
|
 ,3o Find the proto file which defines an extension extending the given
 message type with the given field number.


 ,

 ,.

 ,12
?
 6-? Finds the tag numbers used by all known extensions of the given message
 type, and appends them to ExtensionNumberResponse in an undefined order.
 Its corresponding method is best-effort: it's not guaranteed that the
 reflection service will implement this method, and it's not guaranteed
 that this method will provide all extensions. Returns
 StatusCode::UNIMPLEMENTED if it's not implemented.
 This field should be a fully-qualified type name. The format is
 <package>.<type>


 6


 6(

 6+,
\
 :O List the full names of registered services. The content will not be
 checked.


 :


 :

 :
o
@ Dc The type name and extension number sent by the client when requesting
 file_containing_extension.



@
O
 BB Fully-qualified type name. The format should be <package>.<type>


 B

 B	

 B

C

C

C

C
S
G ^G The message sent by the server to answer ServerReflectionInfo method.



G 

 H

 H

 H	

 H

I/

I

I*

I-.
l
 L]^ The server set one of the following fields accroding to the message_request
 in the request.


 L
?
S8? This message is used to answer file_by_filename, file_containing_symbol,
 file_containing_extension requests with transitive dependencies. As
 the repeated label is not allowed in oneof fields, we use a
 FileDescriptorResponse message to encapsulate the repeated fields.
 The reflection service is allowed to avoid sending FileDescriptorProtos
 that were previously sent in response to earlier requests in the stream.


S

S3

S67
S
V?F This message is used to answer all_extension_numbers_of_type requst.


V

V:

V=>
D
Y37 This message is used to answer list_services request.


Y

Y.

Y12
9
\%, This message is used when an error occurs.


\

\ 

\#$
?
c h? Serialized FileDescriptorProto messages sent by the server answering
 a file_by_filename, file_containing_symbol, or file_containing_extension
 request.



c
?
 g+? Serialized FileDescriptorProto messages. We avoid taking a dependency on
 descriptor.proto, which uses proto2 only features, by making them opaque
 bytes instead.


 g


 g

 g&

 g)*
n
l qb A list of extension numbers sent by the server answering
 all_extension_numbers_of_type request.



l
f
 oY Full name of the base type, including the package name. The format
 is <package>.<type>


 o

 o	

 o

p&

p


p

p!

p$%
[
t xO A list of ServiceResponse sent by the server answering list_services request.



t
?
 w'v The information of each service may be expanded in the future, so we use
 ServiceResponse message to encapsulate it.


 w


 w

 w"

 w%&
p
| ?c The information of a single service used by ListServiceResponse to answer
 list_services request.



|
p
 c Full name of a registered service, including its package name. The format
 is <package>.<service>


 

 	

 
Y
? ?K The error code and error message sent by the server when an error occurs.


?
L
 ?> This field uses the error codes defined in grpc::StatusCode.


 ?

 ?

 ?

?

?

?	

?bproto3??  
? 
grpc/status/status.proto
google.rpcgoogle/protobuf/any.proto"f
Status
code (Rcode
message (	Rmessage.
details (2.google.protobuf.AnyRdetailsB^
com.google.rpcBStatusProtoPZ7google.golang.org/genproto/googleapis/rpc/status;status?RPCJ?
 [
?
 2? Copyright 2016 Google Inc.

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
	
  #

 N
	
 N

 "
	

 "

 ,
	
 ,

 '
	
 '

 !
	
$ !
?
 O [? The `Status` type defines a logical error model that is suitable for different
 programming environments, including REST APIs and RPC APIs. It is used by
 [gRPC](https://github.com/grpc). The error model is designed to be:

 - Simple to use and understand for most users
 - Flexible enough to meet unexpected needs

 # Overview

 The `Status` message contains three pieces of data: error code, error message,
 and error details. The error code should be an enum value of
 [google.rpc.Code][google.rpc.Code], but it may accept additional error codes if needed.  The
 error message should be a developer-facing English message that helps
 developers *understand* and *resolve* the error. If a localized user-facing
 error message is needed, put the localized message in the error details or
 localize it in the client. The optional error details may contain arbitrary
 information about the error. There is a predefined set of error detail types
 in the package `google.rpc` which can be used for common error conditions.

 # Language mapping

 The `Status` message is the logical representation of the error model, but it
 is not necessarily the actual wire format. When the `Status` message is
 exposed in different client libraries and different wire protocols, it can be
 mapped differently. For example, it will likely be mapped to some exceptions
 in Java, but more likely mapped to some error codes in C.

 # Other uses

 The error model and the `Status` message can be used in a variety of
 environments, either with or without APIs, to provide a
 consistent developer experience across different environments.

 Example uses of this error model include:

 - Partial errors. If a service needs to return partial errors to the client,
     it may embed the `Status` in the normal response to indicate the partial
     errors.

 - Workflow errors. A typical workflow has multiple steps. Each step may
     have a `Status` message for error reporting purpose.

 - Batch operations. If a client uses batch request and batch response, the
     `Status` message should be used directly inside batch response, one for
     each error sub-response.

 - Asynchronous operations. If an API call embeds asynchronous operation
     results in its response, the status of those operations should be
     represented directly using the `Status` message.

 - Logging. If some API errors are stored in logs, the message `Status` could
     be used directly after any stripping needed for security/privacy reasons.



 O
d
  QW The status code, which should be an enum value of [google.rpc.Code][google.rpc.Code].


  Q

  Q

  Q
?
 V? A developer-facing error message, which should be in English. Any
 user-facing error message should be localized and sent in the
 [google.rpc.Status.details][google.rpc.Status.details] field, or localized by the client.


 V

 V	

 V
~
 Z+q A list of messages that carry the error details.  There will be a
 common set of message types for APIs to use.


 Z


 Z

 Z&

 Z)*bproto3??  
??
,protoc-gen-openapiv2/options/openapiv2.proto)grpc.gateway.protoc_gen_openapiv2.optionsgoogle/protobuf/struct.proto"?
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
security (2>.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirementRsecuritye
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocsb

extensions (2B.grpc.gateway.protoc_gen_openapiv2.options.Swagger.ExtensionsEntryR
extensionsq
ResponsesEntry
key (	RkeyI
value (23.grpc.gateway.protoc_gen_openapiv2.options.ResponseRvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8J	J	
J"?
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
extensionsq
ResponsesEntry
key (	RkeyI
value (23.grpc.gateway.protoc_gen_openapiv2.options.ResponseRvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8J	"?
Header 
description (	Rdescription
type (	Rtype
format (	Rformat
default (	Rdefault
pattern (	RpatternJJJJ	J	
J
JJJJJJJ"?
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
value (2.google.protobuf.ValueRvalue:8"?
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
url (	Rurl"?
SchemaV
json_schema (25.grpc.gateway.protoc_gen_openapiv2.options.JSONSchemaR
jsonSchema$
discriminator (	Rdiscriminator
	read_only (RreadOnlye
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocs
example (	RexampleJ"?

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
enum. (	Renum"w
JSONSchemaSimpleTypes
UNKNOWN 	
ARRAY
BOOLEAN
INTEGER
NULL

NUMBER

OBJECT

STRINGJJJJJJJJJJ"J%*J*+J+."?
Tag 
description (	Rdescriptione
external_docs (2@.grpc.gateway.protoc_gen_openapiv2.options.ExternalDocumentationRexternalDocsJ"?
SecurityDefinitionsh
security (2L.grpc.gateway.protoc_gen_openapiv2.options.SecurityDefinitions.SecurityEntryRsecurityv
SecurityEntry
key (	RkeyO
value (29.grpc.gateway.protoc_gen_openapiv2.options.SecuritySchemeRvalue:8"?
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
FLOW_ACCESS_CODE"?
SecurityRequirement?
security_requirement (2W.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirement.SecurityRequirementEntryRsecurityRequirement0
SecurityRequirementValue
scope (	Rscope?
SecurityRequirementEntry
key (	Rkeym
value (2W.grpc.gateway.protoc_gen_openapiv2.options.SecurityRequirement.SecurityRequirementValueRvalue:8"?
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
WSSBHZFgithub.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/optionsJ??
  ?

  

 2

 ]
	
 ]
	
  &
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
?
 , e? `Swagger` is a representation of OpenAPI v2 specification's Swagger object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#swaggerObject

 Example:

  option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
    info: {
      title: "Echo API";
      version: "1.0";
      description: ";
      contact: {
        name: "gRPC-Gateway project";
        url: "https://github.com/grpc-ecosystem/grpc-gateway";
        email: "none@example.com";
      };
      license: {
        name: "BSD 3-Clause License";
        url: "https://github.com/grpc-ecosystem/grpc-gateway/blob/master/LICENSE.txt";
      };
    };
    schemes: HTTPS;
    consumes: "application/json";
    produces: "application/json";
  };




 ,
?
  0? Specifies the OpenAPI Specification version being used. It can be
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
?
 8? The host (name or ip) serving the API. This MUST be the host only and does
 not include the scheme nor sub-paths. It MAY include a port. If the host is
 not included, the host serving the documentation is to be used (including
 the port). The host does not support path templating.


 8

 8	

 8
?
 B? The base path on which the API is served, which is relative to the host. If
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
?
 F? The transfer protocol of the API. Values MUST be from the list: "http",
 "https", "ws", "wss". If the schemes is not included, the default scheme to
 be used is the one used to access the OpenAPI definition itself.


 F


 F

 F

 F
?
 J? A list of MIME types the APIs can consume. This is global to all APIs but
 can be overridden on specific API calls. Value MUST be as described under
 Mime Types.


 J


 J

 J

 J
?
 N? A list of MIME types the APIs can produce. This is global to all APIs but
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
?
 	Sw field 9 is reserved for 'definitions', which at this time are already
 exposed as and customizable as proto messages.


 	S

 	S
?
 V'? An object to hold responses that can be used across operations. This
 property does not define global responses for all operations.


 V

 V!

 V$&
U
 X0H Security scheme definitions that can be used across the specification.


 X

 X*

 X-/
?
 	]-? A declaration of which security schemes are applied for the API as a whole.
 The list of values describes alternative security schemes that can be used
 (that is, there is a logical OR between the security requirements).
 Individual operations can override this definition.


 	]


 	]

 	]'

 	]*,
?
 	a? field 13 is reserved for 'tags', which are supposed to be exposed as and
 customizable as proto services. TODO(ivucica): add processing of proto
 service objects into OpenAPI v2 Tag objects.


 	a

 	a
1
 
c+$ Additional external documentation.


 
c

 
c%

 
c(*

 d5

 d$

 d%/

 d24
?
? ?? `Operation` is a representation of OpenAPI v2 specification's Operation object.

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


?
?
 ?? A list of tags for API documentation control. Tags can be used for logical
 grouping of operations by resources or any other qualifier.


 ?


 ?

 ?

 ?
?
?? A short summary of what the operation does. For maximum readability in the
 swagger-ui, this field SHOULD be less than 120 characters.


?

?	

?
v
?h A verbose explanation of the operation behavior. GFM syntax can be used for
 rich text representation.


?

?	

?
E
?*7 Additional external documentation for this operation.


?

?%

?()
?
?? Unique string used to identify the operation. The id MUST be unique among
 all operations described in the API. Tools and libraries MAY use the
 operationId to uniquely identify an operation, therefore, it is recommended
 to follow common programming naming conventions.


?

?	

?
?
?? A list of MIME types the operation can consume. This overrides the consumes
 definition at the OpenAPI Object. An empty value MAY be used to clear the
 global definition. Value MUST be as described under Mime Types.


?


?

?

?
?
?? A list of MIME types the operation can produce. This overrides the produces
 definition at the OpenAPI Object. An empty value MAY be used to clear the
 global definition. Value MUST be as described under Mime Types.


?


?

?

?
4
	?' field 8 is reserved for 'parameters'.


	 ?

	 ?
c
?&U The list of possible responses as they are returned from executing this
 operation.


?

?!

?$%
?
?? The transfer protocol for the operation. Values MUST be from the list:
 "http", "https", "ws", "wss". The value overrides the OpenAPI Object
 schemes definition.


?


?

?

?
?
	?y Declares this operation to be deprecated. Usage of the declared operation
 should be refrained. Default value is false.


	?

	?

	?
?

?-? A declaration of which security schemes are applied for this operation. The
 list of values describes alternative security schemes that can be used
 (that is, there is a logical OR between the security requirements). This
 definition overrides any declared top-level security. To remove a top-level
 security declaration, an empty array can be used.



?



?


?'


?*,

?5

?$

?%/

?24
?
? ?? `Header` is a representation of OpenAPI v2 specification's Header object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#headerObject



?
C
 ?5 `Description` is a short description of the header.


 ?

 ?	

 ?
?
?? The type of the object. The value MUST be one of "string", "number", "integer", or "boolean". The "array" type is not supported.


?

?	

?
P
?B `Format` The extending format for the previously mentioned type.


?

?	

?
L
	?? field 4 is reserved for 'items', but in OpenAPI-specific way.


	 ?

	 ?
p
	?c field 5 is reserved `Collection Format` Determines the format of the array if type array is used.


	?

	?
?
?? `Default` Declares the value of the header that the server will use if none is provided.
 See: https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-6.2.
 Unlike JSON Schema this value MUST conform to the defined type for the header.


?

?	

?
1
	?$ field 7 is reserved for 'maximum'.


	?

	?
:
	?- field 8 is reserved for 'exclusiveMaximum'.


	?

	?
1
	?$ field 9 is reserved for 'minimum'.


	?

	?
;
	?. field 10 is reserved for 'exclusiveMinimum'.


	?

	?
4
	?' field 11 is reserved for 'maxLength'.


	?

	?
4
	?' field 12 is reserved for 'minLength'.


	?

	?
l
?^ 'Pattern' See https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.2.3.


?

?	

?
3
	?& field 14 is reserved for 'maxItems'.


	?

	?
3
	?& field 15 is reserved for 'minItems'.


		?

		?
6
	?) field 16 is reserved for 'uniqueItems'.


	
?

	
?
/
	?" field 17 is reserved for 'enum'.


	?

	?
5
	?( field 18 is reserved for 'multipleOf'.


	?

	?
?
? ?? `Response` is a representation of OpenAPI v2 specification's Response object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#responseObject



?
{
 ?m `Description` is a short description of the response.
 GFM syntax can be used for rich text representation.


 ?

 ?	

 ?
?
?? `Schema` optionally defines the structure of the response.
 If `Schema` is not provided, it means there is no content to the response.


?

?	

?
?
?"? `Headers` A list of headers that are sent with the response.
 `Header` name is expected to be a string in the canonical format of the MIME header key
 See: https://golang.org/pkg/net/textproto/#CanonicalMIMEHeaderKey


?

?

? !
?
?#? `Examples` gives per-mimetype response examples.
 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#example-object


?

?

?!"

?4

?$

?%/

?23
?
? ?? `Info` is a representation of OpenAPI v2 specification's Info object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#infoObject

 Example:

  option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
    info: {
      title: "Echo API";
      version: "1.0";
      description: ";
      contact: {
        name: "gRPC-Gateway project";
        url: "https://github.com/grpc-ecosystem/grpc-gateway";
        email: "none@example.com";
      };
      license: {
        name: "BSD 3-Clause License";
        url: "https://github.com/grpc-ecosystem/grpc-gateway/blob/master/LICENSE.txt";
      };
    };
    ...
  };



?
-
 ? The title of the application.


 ?

 ?	

 ?
m
?_ A short description of the application. GFM syntax can be used for rich
 text representation.


?

?	

?
1
?# The Terms of Service for the API.


?

?	

?
<
?. The contact information for the exposed API.


?	

?


?
<
?. The license information for the exposed API.


?	

?


?
q
?c Provides the version of the application API (not to be confused
 with the specification version).


?

?	

?

?4

?$

?%/

?23
?
? ?? `Contact` is a representation of OpenAPI v2 specification's Contact object.

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



?
H
 ?: The identifying name of the contact person/organization.


 ?

 ?	

 ?
]
?O The URL pointing to the contact information. MUST be in the format of a
 URL.


?

?	

?
q
?c The email address of the contact person/organization. MUST be in the format
 of an email address.


?

?	

?
?
? ?? `License` is a representation of OpenAPI v2 specification's License object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#licenseObject

 Example:

  option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_swagger) = {
    info: {
      ...
      license: {
        name: "BSD 3-Clause License";
        url: "https://github.com/grpc-ecosystem/grpc-gateway/blob/master/LICENSE.txt";
      };
      ...
    };
    ...
  };



?
2
 ?$ The license name used for the API.


 ?

 ?	

 ?
V
?H A URL to the license used for the API. MUST be in the format of a URL.


?

?	

?
?
? ?? `ExternalDocumentation` is a representation of OpenAPI v2 specification's
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



?
v
 ?h A short description of the target documentation. GFM syntax can be used for
 rich text representation.


 ?

 ?	

 ?
\
?N The URL for the target documentation. Value MUST be in the format
 of a URL.


?

?	

?
?
? ?? `Schema` is a representation of OpenAPI v2 specification's Schema object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject



?

 ?

 ?

 ?

 ?
?
?? Adds support for polymorphism. The discriminator is the schema property
 name that is used to differentiate between other schema that inherit this
 schema. The property name used MUST be defined at this schema and it MUST
 be in the required property list. When used, the value MUST be the name of
 this schema or any schema that inherits it.


?

?	

?
?
?? Relevant only for Schema "properties" definitions. Declares the property as
 "read only". This means that it MAY be sent as part of a response but MUST
 NOT be sent as part of the request. Properties marked as readOnly being
 true SHOULD NOT be in the required list of the defined schema. Default
 value is false.


?

?

?
-
	?  field 4 is reserved for 'xml'.


	 ?

	 ?
B
?*4 Additional external documentation for this schema.


?

?%

?()
?
?| A free-form property to include an example of an instance for this schema in JSON.
 This is copied verbatim to the output.


?

?	

?
?
	? ?? `JSONSchema` represents properties from JSON Schema taken, and as used, in
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
          {description: "The unique identifier of the simple message."
        }];
  }



	?
F
		?9 field 1 is reserved for '$id', omitted from OpenAPI v2.


		 ?

		 ?
J
		?= field 2 is reserved for '$schema', omitted from OpenAPI v2.


		?

		?
?
	 ?? Ref is used to define an external reference to include in the message.
 This could be a fully qualified proto message reference, and that type must
 be imported into the protofile. If no message is identified, the Ref will
 be used verbatim in the output.
 For example:
  `ref: ".google.protobuf.Timestamp"`.


	 ?

	 ?	

	 ?
K
		?> field 4 is reserved for '$comment', omitted from OpenAPI v2.


		?

		?
(
	? The title of the schema.


	?

	?	

	?
2
	?$ A short description of the schema.


	?

	?	

	?

	?

	?

	?	

	?

	?

	?

	?

	?
?
	?? A free-form property to include a JSON example of this field. This is copied
 verbatim to the output swagger.json. Quotes must be escaped.
 This property is the same for 2.0 and 3.0.0 https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/3.0.0.md#schemaObject  https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject


	?

	?	

	?

	?

	?

	?	

	?
s
	?e Maximum represents an inclusive upper limit for a numeric instance. The
 value of MUST be a number,


	?

	?	

	?

	?

	?

	?

	?
s
		?e minimum represents an inclusive lower limit for a numeric instance. The
 value of MUST be a number,


		?

		?	

		?

	
?

	
?

	
?

	
?

	?

	?

	?	

	?

	?

	?

	?	

	?

	?

	?

	?	

	?
S
		?F field 18 is reserved for 'additionalItems', omitted from OpenAPI v2.


		?

		?
j
		?] field 19 is reserved for 'items', but in OpenAPI-specific way.
 TODO(ivucica): add 'items'?


		?

		?

	?

	?

	?	

	?

	?

	?

	?	

	?

	?

	?

	?

	?
L
		?? field 23 is reserved for 'contains', omitted from OpenAPI v2.


		?

		?

	?

	?

	?	

	?

	?

	?

	?	

	?

	? 

	?


	?

	?

	?
?
		?{ field 27 is reserved for 'additionalProperties', but in OpenAPI-specific
 way. TODO(ivucica): add 'additionalProperties'?


		?

		?
O
		?B field 28 is reserved for 'definitions', omitted from OpenAPI v2.


		?

		?
~
		?q field 29 is reserved for 'properties', but in OpenAPI-specific way.
 TODO(ivucica): add 'additionalProperties'?


		?

		?
?
		?? following fields are reserved, as the properties have been omitted from
 OpenAPI v2:
 patternProperties, dependencies, propertyNames, const


			?

			?

			?
0
	?" Items in 'array' must be unique.


	?


	?

	?

	?

	 ??

	 ?

	  ?

	  ?

	  ?

	 ?

	 ?	

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?


	 ?

	 ?

	 ?


	 ?

	 ?

	 ?


	 ?

	?+

	?


	? 

	?!%

	?(*

	?
 `Format`


	?

	?	

	?
?
		?? following fields are reserved, as the properties have been omitted from
 OpenAPI v2: contentMediaType, contentEncoding, if, then, else


		
?

		
?

		
?
j
		?] field 42 is reserved for 'allOf', but in OpenAPI-specific way.
 TODO(ivucica): add 'allOf'?


		?

		?
v
		?i following fields are reserved, as the properties have been omitted from
 OpenAPI v2:
 anyOf, oneOf, not


		?

		?

		?
|
	?n Items in `enum` must be unique https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.5.1


	?


	?

	?

	?
?

? ?? `Tag` is a representation of OpenAPI v2 specification's Tag object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#tagObject




?
?

	?? field 1 is reserved for 'name'. In our generator, this is (to be) extracted
 from the name of proto service, and thus not exposed to the user, as
 changing tag object's name would break the link to the references to the
 tag in individual operation specifications.

 TODO(ivucica): Add 'name' property. Use it to allow override of the name of
 global Tag object, then use that name to reference the tag throughout the
 OpenAPI file.



	 ?


	 ?
f

 ?X A short description for the tag. GFM syntax can be used for rich text
 representation.



 ?


 ?	


 ?
?

?*1 Additional external documentation for this tag.



?


?%


?()
?
? ?? `SecurityDefinitions` is a representation of OpenAPI v2 specification's
 Security Definitions object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securityDefinitionsObject

 A declaration of the security schemes available to be used in the
 specification. This does not enforce the security schemes on the operations
 and only serves to provide the relevant details for each scheme.


?
`
 ?+R A single security scheme definition, mapping a "name" to the scheme it
 defines.


 ?

 ?&

 ?)*
?
? ?? `SecurityScheme` is a representation of OpenAPI v2 specification's
 Security Scheme object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securitySchemeObject

 Allows the definition of a security scheme that can be used by the
 operations. Supported schemes are basic authentication, an API key (either as
 a header or as a query parameter) and OAuth2's common flows (implicit,
 password, application and access code).


?
c
 ??S The type of the security scheme. Valid values are "basic",
 "apiKey" or "oauth2".


 ?

  ?

  ?

  ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?
T
??D The location of the API key. Valid values are "query" or "header".


?	

 ?

 ?

 ?

?

?

?

?

?

?
?
??w The flow used by the OAuth2 security scheme. Valid values are
 "implicit", "password", "application" or "accessCode".


?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?

?

?

?
a
 ?S The type of the security scheme. Valid values are "basic",
 "apiKey" or "oauth2".


 ?

 ?

 ?
8
?* A short description for security scheme.


?

?	

?
X
?J The name of the header or query parameter to be used.
 Valid for apiKey.


?

?	

?
f
?X The location of the API key. Valid values are "query" or
 "header".
 Valid for apiKey.


?

?

?

?
?? The flow used by the OAuth2 security scheme. Valid values are
 "implicit", "password", "application" or "accessCode".
 Valid for oauth2.


?

?

?
?
?? The authorization URL to be used for this flow. This SHOULD be in
 the form of a URL.
 Valid for oauth2/implicit and oauth2/accessCode.


?

?	

?
?
?? The token URL to be used for this flow. This SHOULD be in the
 form of a URL.
 Valid for oauth2/password, oauth2/application and oauth2/accessCode.


?

?	

?
W
?I The available scopes for the OAuth2 security scheme.
 Valid for oauth2.


?

?	

?

?4

?$

?%/

?23
?
? ?? `SecurityRequirement` is a representation of OpenAPI v2 specification's
 Security Requirement object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securityRequirementObject

 Lists the required security schemes to execute this operation. The object can
 have multiple security schemes declared in it which are all required (that
 is, there is a logical AND between the schemes).

 The name used for each property MUST correspond to a security scheme
 declared in the Security Definitions.


?
?
 ??? If the security scheme is of type "oauth2", then the value is a list of
 scope names required for the execution. For other security scheme types,
 the array MUST be empty.


 ?
"

  ?

  ?

  ?

  ?

  ?
?
 ?A? Each name must correspond to a security scheme which is declared in
 the Security Definitions. If the security scheme is of type "oauth2",
 then the value is a list of scope names required for the execution.
 For other security scheme types, the array MUST be empty.


 ?'

 ?(<

 ??@
?
? ?? `Scopes` is a representation of OpenAPI v2 specification's Scopes object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#scopesObject

 Lists the available scopes for an OAuth2 security scheme.


?
l
 ? ^ Maps between a name of a scope to a short description of it (as the value
 of the property).


 ?

 ?

 ?bproto3??  
?
.protoc-gen-openapiv2/options/annotations.proto)grpc.gateway.protoc_gen_openapiv2.options google/protobuf/descriptor.proto,protoc-gen-openapiv2/options/openapiv2.proto:~
openapiv2_swagger.google.protobuf.FileOptions? (22.grpc.gateway.protoc_gen_openapiv2.options.SwaggerRopenapiv2Swagger:?
openapiv2_operation.google.protobuf.MethodOptions? (24.grpc.gateway.protoc_gen_openapiv2.options.OperationRopenapiv2Operation:~
openapiv2_schema.google.protobuf.MessageOptions? (21.grpc.gateway.protoc_gen_openapiv2.options.SchemaRopenapiv2Schema:u
openapiv2_tag.google.protobuf.ServiceOptions? (2..grpc.gateway.protoc_gen_openapiv2.options.TagRopenapiv2Tag:~
openapiv2_field.google.protobuf.FieldOptions? (25.grpc.gateway.protoc_gen_openapiv2.options.JSONSchemaRopenapiv2FieldBHZFgithub.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/optionsJ?
  +

  

 2

 ]
	
 ]
	
  *
	
 6
	
	 
?
 #? ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



 	"


 	


 



 "
	
 
?
'? ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



$








"&
	
 
?
!? ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



%





	


 
	
 $
?
#? ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



%


#


#


#
	
% +
?
*$? ID assigned by protobuf-global-extension-registry@google.com for gRPC-Gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



%#


*


*


*#bproto3??  
?
2kentik/alerting/backend/v0/alertproto/common.protokentik.api.alerting.v0"?
DimensionDetail>
device (2$.kentik.api.alerting.v0.DeviceDetailH Rdevice8
site (2".kentik.api.alerting.v0.SiteDetailH RsiteG
	interface (2'.kentik.api.alerting.v0.InterfaceDetailH R	interface5
asn (2!.kentik.api.alerting.v0.ASNDetailH RasnB
detail"F
DeviceDetail
id (Rid
name (	Rname
type (	Rtype"0

SiteDetail
id (Rid
name (	Rname"?
InterfaceDetail
id (Rid
snmpID (	RsnmpID(
snmpDescription (	RsnmpDescription$
snmpSpeedMbps (RsnmpSpeedMbps"?
	ASNDetail
asn (Rasn 
description (	Rdescription*X
Severity
noneSeverity 	
minor

minor2	
major

major2
criticalBKZIgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertprotoJ?
  ,

  

 

 `
	
 `


  


 

  


  
(
  " Included for i_device_id.


  

  

  
/
 "" Included for i_device_site_name.


 

 

 
@
 ""3 Included for InterfaceID_src and InterfaceID_dst.


 

 

  !
.
 	"! Included for src_as and dst_as.


 	

 	

 	


 




 

 

 


 





	







	




 




 

 

 


 





	




 




 

 

 


 





	







	












 "




  

  

  

  

!

!

!	

!
-
 % ,! Severity of an alarm/threshold.



 %

  &

  &

  &

 '

 '

 '


 (

 (

 (

 )

 )

 )


 *

 *

 *

 +

 +


 +bproto3??  
?5
2kentik/alerting/backend/v0/alertproto/filter.protokentik.api.alerting.v0.protoc-gen-openapiv2/options/annotations.proto google/protobuf/field_mask.protogoogle/protobuf/timestamp.proto"?

FilterRootE
	connector (2'.kentik.api.alerting.v0.FilterConnectorR	connectorG
filterGroups (2#.kentik.api.alerting.v0.FilterGroupRfilterGroups"?
FilterGroupE
	connector (2'.kentik.api.alerting.v0.FilterConnectorR	connector
not (Rnot8
filters (2.kentik.api.alerting.v0.FilterRfiltersG
filterGroups (2#.kentik.api.alerting.v0.FilterGroupRfilterGroupsG
savedFilters (2#.kentik.api.alerting.v0.SavedFilterRsavedFilters"?
Filter 
filterField (	RfilterFieldB
operator (2&.kentik.api.alerting.v0.FilterOperatorRoperator 
filterValue (	RfilterValue"/
SavedFilter
id (Rid
not (Rnot"?
SavedFilterRef
id (Rid
name (	Rname 
description (	Rdescription<
filters (2".kentik.api.alerting.v0.FilterRootRfilters>
creationTime (2.google.protobuf.TimestampRcreationTime>
lastEditTime (2.google.protobuf.TimestampRlastEditTime"?
SavedFiltersListRequest
ids (Rids
names (	Rnames<
createStart (2.google.protobuf.TimestampRcreateStart8
	createEnd (2.google.protobuf.TimestampR	createEnd<
modifyStart (2.google.protobuf.TimestampRmodifyStart8
	modifyEnd (2.google.protobuf.TimestampR	modifyEnd,
includePredefined (RincludePredefined
limit (B?A:100Rlimit
offset (B?A:0Roffset"r
SavedFiltersListResponse@
filters (2&.kentik.api.alerting.v0.SavedFilterRefRfilters
count (Rcount"(
SavedFiltersGetRequest
id (Rid"?
SavedFiltersUpdateRequest>
filter (2&.kentik.api.alerting.v0.SavedFilterRefRfilter:

updateMask (2.google.protobuf.FieldMaskR
updateMask"\
SavedFiltersUpdateResponse>
filter (2&.kentik.api.alerting.v0.SavedFilterRefRfilter"+
SavedFiltersDeleteRequest
id (Rid"
SavedFiltersDeleteResponse*<
FilterConnector
noneFilterConnector 
any
all*?
FilterOperator
noneFilterOperator 

equals
	notEquals

bitwiseAnd
	bitwiseOr
lessThan
greaterThan
lessThanOrEquals
greaterThanOrEquals
notContains	
contains

notContainsRe

containsRe
notContainsReStar
containsReStarBKZIgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertprotoJ?!
  ?%

  

 

 `
	
 `
	
  8
	
 *
	
 )


  


 

  	

  	

  	

 



 


 
	

 


 

 	

 / v0FilterOperator




?
 ? noneFilterOperator is added due to special way protobuf handles defaults, do not use in day to day work.
 Backend rejects this value.


 

 

 "="






 "<>"






 "&"






 "|"






 "<"







 ">"






  "<="


 

 

" ">="


"

"

	$ "NOT ILIKE"


	$

	$


&	 "ILIKE"



&



&

( "!~"


(

(

* "~"


*

*

, "!~*"


,

,

. "~*"


.

.


 1 4


 1

  2 

  2

  2

  2

 3(

 3


 3

 3#

 3&'


6 <


6

 7 

 7

 7

 7

8

8

8


8

9

9


9

9

9

:(

:


:

:#

:&'

;(

;


;

;#

;&'


> B


>

 ?

 ?

 ?	

 ?

@

@

@

@

A

A

A	

A
]
E HQ TODO(tjonak): confirm that nothing will break and rename this to SavedFilterRef



E

 F

 F

 F	

 F

G

G

G


G


J Q


J

 K

 K

 K


 K

L

L

L	

L

M

M

M	

M

N

N

N

N

O-

O

O(

O+,

P-

P

P(

P+,


S t


S
<
 U/ ids of filters you want included in response.


 U


 U

 U

 U
_
XR names of filters you want included in response. Regex matching is not supported.


X


X

X

X
j
[,] createStart narrows results to platforms created no sooner than this timestamp (inclusive).


[

['

[*+
g
^*Z createEnd narrows results to platforms created no later than this timestamp (inclusive).


^

^%

^()
i
a,\ modifyStart narrows results to platforms edited no sooner than this timestamp (inclusive).


a

a'

a*+
f
d*Y modifyEnd narrows results to platforms edited no later than this timestamp (inclusive).


d

d%

d()
d
gW includePredefined controls whether predefined filters should be included in response.


g

g

g
M
km? limit of entries returned.
 Pseudocode: savedFilters[:limit].


k

k	

k

km

?lR
c
qsU offset in saved filters collection.
 Pseudocode: savedFilters[offset:offset+limit].


q

q	

q

qs

?rP


v y


v 

 w&

 w


 w

 w!

 w$%

x

x

x	

x


{ }


{

 |

 |

 |


 |

 ?


!

 ?

 ?

 ?

 ?

?+

?

?&

?)*

	? ?

	?"

	 ?

	 ?

	 ?

	 ?


? ?


?!


 ?


 ?


 ?



 ?


? %

?"bproto3??  
?
=kentik/alerting/backend/v0/alertproto/mitigations/types.proto"kentik.api.alerting.v0.mitigations*O
Type
unknownType 
a10
flowspec
radware
rtbh
cfmtBWZUgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertproto/mitigationsJ?
  

  

 +

 l
	
 l


  


 	

  

  

  

 


 

 	

 

 


 

 

 	

 

 	

 	

 		


 


 


 
	
bproto3??  
?p
6kentik/alerting/backend/v0/alertproto/mitigation.protokentik.api.alerting.v0.protoc-gen-openapiv2/options/annotations.proto=kentik/alerting/backend/v0/alertproto/mitigations/types.protogoogle/protobuf/timestamp.protogoogle/protobuf/duration.proto"?

Mitigation
id (Rid
policyID (RpolicyID 
thresholdID (RthresholdID
alarmID (RalarmID
alarmKey (	RalarmKey
ipCidr (	RipCidr
target (	Rtarget=
state (2'.kentik.api.alerting.v0.MitigationStateRstateM
previousState (2'.kentik.api.alerting.v0.MitigationStateRpreviousState

platformID (R
platformID
methodID	 (RmethodID0
start
 (2.google.protobuf.TimestampRstart,
end (2.google.protobuf.TimestampRend@
source (2(.kentik.api.alerting.v0.MitigationSourceRsource<
type (2(.kentik.api.alerting.v0.mitigations.TypeRtypeD
states (2,.kentik.api.alerting.v0.MitigationStateEntryRstates;
autoStopTTL (2.google.protobuf.DurationRautoStopTTL
comment (	RcommentO
flowspec (21.kentik.api.alerting.v0.FlowspecMitigationDetailsH RflowspecB	
details"3
FlowspecMitigationDetails
advert (	Radvert"?
MitigationStateEntry8
	timestamp (2.google.protobuf.TimestampR	timestamp=
state (2'.kentik.api.alerting.v0.MitigationStateRstate=
event (2'.kentik.api.alerting.v0.MitigationEventRevent"?
MitigationsListRequest<
createStart (2.google.protobuf.TimestampRcreateStart8
	createEnd (2.google.protobuf.TimestampR	createEnd 
mitigations (Rmitigations
policies (Rpolicies
alarms (Ralarms

thresholds (R
thresholds?
states (2'.kentik.api.alerting.v0.MitigationStateRstates
	platforms (R	platforms
methods	 (Rmethods
ipCidrs
 (	RipCidrs
limit (Rlimit
offset (RoffsetB
sources (2(.kentik.api.alerting.v0.MitigationSourceRsources$
keyPartsExact (	RkeyPartsExact(
keyPartsPartial (	RkeyPartsPartial"u
MitigationsListResponseD
mitigations (2".kentik.api.alerting.v0.MitigationRmitigations
count (Rcount"'
MitigationsGetRequest
id (Rid"?
MitigationsCreateRequest

platformID (R
platformID
methodID (RmethodID
ipCidr (	RipCidr
comment (	RcommentC
autoStopTTL (2.google.protobuf.DurationB?A:0RautoStopTTL"+
MitigationsCreateResponse
id (Rid"?
MitigationThreshold
id (Rid

platformID
 (R
platformID
methodID (RmethodIDZ
applyStrategy (24.kentik.api.alerting.v0.MitigationThreshold.StrategyRapplyStrategy=
applyTimeout (2.google.protobuf.DurationRapplyTimeoutZ
clearStrategy (24.kentik.api.alerting.v0.MitigationThreshold.StrategyRclearStrategy=
clearTimeout	 (2.google.protobuf.DurationRclearTimeout"F
Strategy
none 
	immediate
userAck
userAckOrTimeout"B
MitigationsActionRequest
id (Rid
action (	Raction"
MitigationsActionResponse"4
"MitigationsAvailableActionsRequest
id (Rid"?
#MitigationsAvailableActionsResponsew
stateToActions (2O.kentik.api.alerting.v0.MitigationsAvailableActionsResponse.StateToActionsEntryRstateToActionsr
StateToActionsEntry
key (	RkeyE
value (2/.kentik.api.alerting.v0.MitigationActionDetailsRvalue:8"c
MitigationActionDetailsH
actions (2..kentik.api.alerting.v0.MitigationActionDetailRactions"?
MitigationActionDetail
	eventName (	R	eventName

actionName (	R
actionName,
actionDescription (	RactionDescription
	fromState (	R	fromState
toStates (	RtoStates

actionPath (	R
actionPath"
MitigationsPumpRequest"
MitigationsPumpResponse*@
MitigationSource
noneMitigationType 

manual
auto*?
MitigationState
mitigationStateNone 
ackRequired
archived
clearing
clearingFail
endGrace
endWait
manualClear
manualClearing	
manualClearingFail

manualMitigating
manualStarting
manualStartingFail

mitigating
starting
startingFail
	startWait*?
MitigationEvent
mitigationEventNone 
userManualControl
userStop
	userStart

userDelete
userApproveStart
userSkipWait
	userRetry
userAck
skipWait	
doneWait

	autoStart
autoStop
remoteAdded
remoteRemoved
remoteError
systemClearDeleted

ttlExpiredBKZIgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertprotoJ?M
  ?"

  

 

 `
	
 `
	
  8
	
 G
	
 )
	
 (


 
 F


 

%
   id of this mitigation.


  

  


  
E
 8 policyID denotes a policy that caused this mitigation.


 

 

 
K
 > thresholdID denotes a threshold that caused this mitigation.


 

 

 
D
 7 alarmID denotes an alarm that caused this mitigation.


 

 

 
l
 _ alarmKey contains key of an alarm mitigation is based on.
 empty in case of manual mitigation


 

 	

 
N
 A ipCidr denotes either ip or cidr block this mitigation targets.


 

 	

 
a
 T target denotes entity this mitigation is applied to (ipCidr, flowspec filter etc).


 

 	

 
#
 " state of mitigation.


 "

 "

 "
,
 %% previous state of mitigation.


 %

 %

 %"$
<
 	(/ platformID id of platform used in mitigation.


 	(

 	(

 	(
8
 
++ methodID id of method used in mitigation.


 
+

 
+

 
+
*
 .' start time of a mitigation.


 .

 .!

 .$&
6
 1%) end time of a mitigation, if available.


 1

 1

 1"$
,
 4 denotes source of mitigation.


 4

 4

 4
*
 7 denotes type of mititagion.


 7

 7

 7
u
 :,h states log all state transitions this mitigation went through. Not available in Mitigations/List call.


 :


 :

 : &

 :)+
`
 =,S autoStopTTL offset from start of mitigation to it's automatic end, 0 if not used.


 =

 =&

 =)+

 ?

 ?

 ?	

 ?
h
  BEZ details contain any additional information that are specific to a given mitigation type.


  B
q
 D,d oneof means that the message will contain **at most** one of the fields. It may also contain none.


 D

 D&

 D)+


H J


H!

 I

 I

 I	

 I


 L P


 L

  M

  M

  M

 N

 N

 N

 O

 O

 O	



R d


R

 S

 S

 S

T

T

T

U

U


U

V

V


V

W

W

W

X

X


X

Y

Y	

Y

Z

Z

Z

[

[

[

	\

	\

	\


]


]


]

^

^

^

_

_

_

`

`

`

a

a


a

b

b

b

c

c

c


f |


f

 g

 g

 g

h

h

h

i

i

i

j

j

j

k

k

k

m

m

m
2
o% UserRejectStart = "userRejectStart"


o

o

p

p

p

q

q

q

	s

	s

	s


t


t


t

u

u

u

v

v

v

w

w

w

x

x

x

y

y

y

z 

z

z

{

{

{

~ ?


~

 *

 

 %

 ()

?

?

?

?

?

?

?

?

? ?

?
m
 ?,_ createStart narrows results to mitigations created no sooner than this timestamp (inclusive).


 ?

 ?'

 ?*+
j
?*\ createEnd narrows results to mitigations created no later than this timestamp (inclusive).


?

?%

?()
J
?!< mitigations narrows results to mitigations with those ids.


?


?

?

? 
R
?D policies narrows results to mitigations spawned by those policies.


?


?

?

?
P
?B policies narrows results to mitigations spawned by those alarms.


?


?

?

?
T
? F policies narrows results to mitigations spawned by those thresholds.


?


?

?

?
Z
?&L states narrows results to mitigations which are currently in those states.


?


?

?!

?$%
N
?@ platforms narrows results to mitigations with those platforms.


?


?

?

?
J
?< methods narrows results to mitigations with those methods.


?


?

?

?
R
	?D ipCidrs narrows results to mitigations targetting those ips/cidrs.


	?


	?

	?

	?
*

? limit of entries returned.



?


?	


?
@
?2 offset in list of entries matching search terms.


?

?	

?
H
?): sources narrows results to those sources of mitigations.


?


?

?#

?&(
?
?%a keyPartsExact narrows results to mitigations with alarm key containing all the specified parts.
2d types narrows down results to mitigations with those types.
 repeated mitigations.Type types = 19;


?


?

?

?"$
?
?'? keyPartsPartial narrows results to mitigations mitigations with alarm key containing all the specified parts via a partial match.
 Equivalent sql query `keyPart ilike '%keyPartPartial%'`.


?


?

?!

?$&

? ?

?
2
 ?&$ mitigations matching search terms.


 ?


 ?

 ?!

 ?$%
O
?A count of entries matching search terms discarding limit/offset.


?

?	

?

? ?

?

 ?

 ?

 ?


 ?

? ?

? 
O
 ?A platformID denotes mitigation platform used by this mitigation.


 ?

 ?

 ?
K
?= methodID denotes mitigation method used by this mitigation.


?

?

?
O
?A ipCidr denotes either ip or cidr block this mitigation targets.


?

?	

?

?

?

?	

?
?
??D autoStopTTL offset from start of mitigation to it's automatic end.
"?   oneof target {
     mitigations.TargetA10 a10 = 11;
     mitigations.TargetFlowspec flowspec = 12;
     mitigations.TargetRadware radware = 13;
     mitigations.TargetRTBH rtbh = 14;
     mitigations.TargetCFMT cfmt = 15;
   }


?

?&

?)*

?+?

??P

? ?

?!

 ?

 ?

 ?


 ?
?
? ?? MitigationThreshold

 Ties together mitigation platform and method tuple with threshold,
 mitigation is executed when threshold gets crossed.


?
;
 ?- id of this mitigation threshold. Read only.


 ?

 ?


 ?

?

?

?

?

?

?

?

?
?
 ??2? oneof target {
   mitigations.TargetA10 a10 = 2;
   mitigations.TargetFlowspec flowspec = 3;
   mitigations.TargetRadware radware = 4;
   mitigations.TargetRTBH rtbh = 5;
   mitigations.TargetCFMT cfmt = 6;
 }


 ?

  ?

  ?

  ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

?

?


?

?

?,

?

?'

?*+

?

?


?

?

?,

?

?'

?*+

	? ?

	? 

	 ?

	 ?

	 ?


	 ?

	?

	?

	?	

	?



? $


?!

? ?

?*

 ?

 ?

 ?


 ?

? ?

?+

 ?9

 ?%

 ?&4

 ?78

? ?

?

 ?.

 ?


 ?!

 ?")

 ?,-

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?


?

?

?

?

?

?	

?


? !

?


? "

?bproto3??  
?X
5kentik/alerting/backend/v0/alertproto/threshold.protokentik.api.alerting.v0google/protobuf/duration.proto.protoc-gen-openapiv2/options/annotations.proto2kentik/alerting/backend/v0/alertproto/common.proto6kentik/alerting/backend/v0/alertproto/mitigation.proto"?
	Threshold 
thresholdID (RthresholdID
policyID (RpolicyID<
severity (2 .kentik.api.alerting.v0.SeverityRseverityJ

conditions (2*.kentik.api.alerting.v0.ThresholdConditionR
conditionsY
activationSettings (2).kentik.api.alerting.v0.ThresholdActivateRactivationSettings 
description (	Rdescription 
ackRequired (RackRequired 
filtersJSON (	RfiltersJSONM
mitigations (2+.kentik.api.alerting.v0.MitigationThresholdRmitigations2
notificationChannels (RnotificationChannels"?
ThresholdCondition-
metric (	B?A:policy.metric[0]Rmetrici
operator (23.kentik.api.alerting.v0.ThresholdCondition.OperatorB?A:greaterThanOrEqualsRoperator2
comparisonValue (B?A:1.3RcomparisonValueY
type (2/.kentik.api.alerting.v0.ThresholdCondition.TypeB?A:baselinePercentRtype_
	direction (2*.kentik.api.alerting.v0.ThresholdDirectionB?A:currentToHistoryR	directionU
fallbackSettings (2).kentik.api.alerting.v0.ThresholdFallbackRfallbackSettingsQ
keySettings (2/.kentik.api.alerting.v0.ThresholdTopsetSettingsRkeySettingsT
ratioSettings (2..kentik.api.alerting.v0.ThresholdRatioSettingsRratioSettings"?
Operator
noneOperator 
less
greaterThanOrEquals"?
Type
noneType 

static
interfaceCapacity
interfaceCapacityPercent
keyNotInTop
baseline
baselinePercent	
ratio:i?Af2d{"metric": "bits", "operator": "greaterThanOrEquals", "comparisonValue": 10000000, "type": "static"}"?
ThresholdFallbackI
op (2,.kentik.api.alerting.v0.ThresholdFallback.OpB?A:lowestRop
value (B?A:0Rvalue"P
Op
none 

lowest
useThisValue
trigger
skip
highest"?
ThresholdActivate.
matchThreshold (B?A:5RmatchThreshold:
window (2.google.protobuf.DurationB?A:2hRwindow_
inactivityTimeUntilClear (2.google.protobuf.DurationB?A:20mRinactivityTimeUntilClear"?
ThresholdTopsetSettings,
nTopKeysEvaluated (RnTopKeysEvaluated:
nTopKeysStoredInBaseline (RnTopKeysStoredInBaseline"?
ThresholdRatioSettings,
lhsMetricPosition (RlhsMetricPosition,
rhsMetricPosition (RrhsMetricPosition0
lhsMetricProportion (RlhsMetricProportion0
rhsMetricProportion (RrhsMetricProportion
margin (B?A:0Rmarginj
	direction (28.kentik.api.alerting.v0.ThresholdRatioSettings.DirectionB?A:DirectionBothR	direction"E
	Direction
DirectionBoth 
DirectionRight
DirectionLeft*K
ThresholdMode
thresholdModeNone 

static
baseline	
exist*\
ThresholdDirection
thresholdDirectionNone 
currentToHistory
historyToCurrentBKZIgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertprotoJ?@
  ?

  

 

 `
	
 `
	
  (
	
 8
	
 <
	
 @
X
  ,L Threshold is metadata about a threshold that matched for an alarm/insight.



 
%
   thresholdID is the id.


  

  

  
@
 3 policyID is the policy this threshold belongs to.


 

 

 
N
 A severity is the severity of the threshold. Read only parameter.


 


 

 
9
 -, conditions for which this threshold fires.


 


 

 (

 +,
r
 +e activationSettings describe how many times this threshold must match before an alarm/insight fires.


 

 &

 )*
@
 3 description of this threshold if one is provided.


 

 	

 
k
 ^ ackRequired states whether alarm raised upon this threshold needs acknowledgement from user.


 

 

 

 % threshold filters as raw json
2Q TODO(tjonak): looks like this is not available through UI
 string runbook = 18;


 %

 %	

 %
b
 (0U mitigations creates mitigation definitions executed when this threshold is crossed.


 (


 (

 (*

 (-/
J
 	+,= notification channels to use when this threshold is crossed


 	+


 	+

 	+&

 	+)+


 . 3


 .

  /

  /

  /

 0

 0

 0

 1

 1


 1

 2

 2

 2



5 9


5

 6

 6

 6

7

7

7

8

8

8

; ?


;

=?
<
?=?- TODO(tjonak): oneof instead of type switch?

?
 DF? metric is the metric, i.e. "bits", "packets", "unique_src_ip".
 Only metrics defined in policy associated with this threshold are permitted.
 To get list of available metrics refer to GetSupportedMetrics endpoint.


 D

 D	

 D

 DF

 ?E_

 HN

 H

  I

  I

  I

 K "<"


 K

 K

 M ">="


 M

 M
?
RT? operator is the arithmetic operator, i.e. "greaterThanOrEquals" (>=).
 Read only parameter, new policies always use greaterThanOrEquals.


R


R

R

RT

?Sb
}
XZo value against which condition is compared.
 Precise formula depends on type of condition. Refer to Type enum.


X

X	

X

XZ

?YR
k
_p] v0ThresholdConditionType

 In enum examples, ">=" stands in for ThresholdConditionOperator.


_

 a unused value


 a

 a
 
c metric >= value


c


c
=
e. metric >= capacity (from snmp) - value (bps)


e

e
/
g!  metric >= capacity * value/100


g

g 
 
i key isn't found


i

i
+
k metric >= baseline + value


k

k
/
m  metric >= baseline * value/100


m

m
5
o& metric_x / metric_y > ratio + margin


o	

o
7
su) type is what kind of condition this is.


s

s

s

su

?t^
{
y{m Direction is the direction of comparison for this condition,
 if it is a baselining or existence threshold.


y

y

y!"

y#{

?z_
?
*v fallbackSettings are used for baseline type conditions.
 Their values control how alerting handles lack of baseline.




$

')
H
?+: keySettings are used for 'compare set of keys settings'.


?

?%

?(*
d
?,V ratioSettings are used for configuring ratio thresholds.
 required if type == ratio.


?

?&

?)+

? ?

?

 ??

 ?	

  ?

  ?

  ?
E
 ?"5 fallback = lowest value in the keys being evaluated


 ?


 ?
"
 ?" fallback = value


 ?

 ?
%
 ?" the condition fires


 ?

 ?
-
 ?" the condition does not fire


 ?

 ?
F
 ?"6 fallback = highest value in the keys being evaluated


 ?

 ?
U
 ??E op is the operation performed if the baseline value is not present.


 ?

 ?

 ?


 ??

 ??U
?
??? value is the value used when op = "useThisValue".
 Note that UI presents floating point value with prefix depending on metric (kilo, mega etc.).
 Which is then translated to absolute value. This field expects absolute value directly.
 So instead of 1.2 kilo packets/s, use 1200 packets/s.


?

?	

?

??

??P
X
? ?J More or less exporting the JSON object from mn_alert_threshold.activate.


?
x
 ??h matchThreshold is how many times this threshold must be matched before
 an alarm/insight is generated.


 ?

 ?	

 ?

 ??

 ??P
v
??f window is the duration in which the matchThreshold matches must occur.
 Truncated to nearest minute.


?

?!

?$%

?&?

??Q
e
??U After inactivityTimeUntilClear, the alarm is cleared.
 Truncated to nearest minute.


?

?3

?67

?8?

??R
?
? ?{ ThresholdTopsetSettings overrides policy level settings for keys evaluated and stored.
 Used in 'keyNotInTop' conditions.


?

 ?

 ?

 ?	

 ?

?&

?

?	!

?$%
o
? ?a ThresholdRatioSettings control how ratio thresholds are evaluated.
 Used in 'ratio' conditions.


?

 ??

 ?
?
  ?? DirectionBoth makes threshold condition crossed in both directions
 As an example with 1:10 ratio and 0 margin configured 1:11 would cross as well as 1:9.


  ?

  ?
?
 ?? DirectionRight makes threshold activate only if ratio is crossed in right direction.
 As an example with 1:10 ratio configured and 0 margin 1:11 would cross but 2:10 would not.


 ?

 ?
?
 ?? DirectionRight makes threshold activate only if ratio is crossed in left direction.
 As an example with 1:10 ratio configured and 0 margin 2:10 would cross but 1:11 would not.


 ?

 ?
g
 ?Y lhsMetricPosition controls which metric is used as left hand side of ratio calculation.


 ?

 ?	

 ?
h
?Z rhsMetricPosition controls which metric is used as right hand side of ratio calculation.


?

?	

?
u
?!g lhsMetricProportion is used to calculate ratio using lhsMetricProportion/rhsMetricProportion formula.


?

?	

? 
u
?!g rhsMetricProportion is used to calculate ratio using lhsMetricProportion/rhsMetricProportion formula.


?

?	

? 
~
??n margin specifies interval around ratio. Calculated values falling into this interval do not cross threshold.


?

?	

?

??

??P
?
??x Direction specifies activation policy for ratio thresholds.
 Refer to Direction enum values for detailed explaination.


?

?

?

??

??\bproto3??  
??
2kentik/alerting/backend/v0/alertproto/policy.protokentik.api.alerting.v0google/protobuf/duration.protogoogle/protobuf/timestamp.proto google/protobuf/field_mask.proto.protoc-gen-openapiv2/options/annotations.proto2kentik/alerting/backend/v0/alertproto/filter.proto5kentik/alerting/backend/v0/alertproto/threshold.proto">
DimensionDisplayNamesRequest

dimensions (	R
dimensions"?
DimensionDisplayNamesResponse?
dimensionToDisplayName (2Q.kentik.api.alerting.v0.DimensionDisplayNamesResponse.DimensionToDisplayNameEntryRdimensionToDisplayNameI
DimensionToDisplayNameEntry
key (	Rkey
value (	Rvalue:8"
SupportedDimensionsRequest"=
SupportedDimensionsResponse

dimensions (	R
dimensions"
SupportedMetricsRequest"T
SupportedMetricsResponse8
metrics (2.kentik.api.alerting.v0.MetricRmetrics"\
Metric
value (	Rvalue
label (	Rlabel&
isKProbeMetric (RisKProbeMetric""
PolicyGetRequest
id (Rid"?

Policy
id (Rid
	companyID (R	companyID
userID (RuserID>
creationTime (2.google.protobuf.TimestampRcreationTime>
lastEditTime (2.google.protobuf.TimestampRlastEditTime
name (	Rname%
description (	B?A RdescriptionI
status (2$.kentik.api.alerting.v0.PolicyStatusB?A:activeRstatus

dimensions (	R
dimensionsl
dimensionGroupingOptions (20.kentik.api.alerting.v0.DimensionGroupingOptionsRdimensionGroupingOptionsE
filters (2".kentik.api.alerting.v0.FilterRootB?A:{}Rfilters&
metrics (	B?A	:packetsRmetricsA

thresholds2 (2!.kentik.api.alerting.v0.ThresholdR
thresholdsN
evaluationPeriod (2.google.protobuf.DurationB?A:1mRevaluationPeriod5
nTopKeysEvaluated (B?A:25RnTopKeysEvaluatedA
nTopKeysAddedToBaseline	 (B?A:25RnTopKeysAddedToBaseline_
silentModeExpireDate (2.google.protobuf.TimestampB?A:
Now() + 4dRsilentModeExpireDate]
baselineSettings (2(.kentik.api.alerting.v0.BaselineSettingsB?A:{}RbaselineSettings0
minTrafficValue (B?A:0RminTrafficValueN
deviceSelector (2&.kentik.api.alerting.v0.DeviceSelectorRdeviceSelector 
dashboardID (RdashboardID@
baselineBackfillImmediately (RbaselineBackfillImmediately 
application (	Rapplication:

expireDate (2.google.protobuf.TimestampR
expireDateJ
"n
SynTest
id (Rid
agentIds (RagentIds7
type (2#.kentik.api.alerting.v0.SynTestTypeRtype"?
DeviceSelector
all (Rall
names (	Rnames
labels (Rlabels
sites (Rsites
types (	Rtypes9
synTest (2.kentik.api.alerting.v0.SynTestRsynTest"l
DimensionGroupingOptions 
MaxPerGroup (RMaxPerGroup.
GroupingDimensions (	RGroupingDimensions"?
BaselineSettingsw
datapointAggregationMethod (2).kentik.api.alerting.v0.BaselineAggregateB?A	:REL_P98RdatapointAggregationMethodD
startOffset (2.google.protobuf.DurationB?A:1dRstartOffset:
length (2.google.protobuf.DurationB?A:3wRlengthH
minimalLength (2.google.protobuf.DurationB?A:4dRminimalLengthY
seasonality (2+.kentik.api.alerting.v0.BaselineSeasonalityB
?A:dailyRseasonality|
neighbourhoodAggregationMethod (2).kentik.api.alerting.v0.BaselineAggregateB	?A:NoneRneighbourhoodAggregationMethod8
neighbourhoodRadius (B?A:0RneighbourhoodRadius?
 comparisonValueAggregateFunction (2).kentik.api.alerting.v0.BaselineAggregateB?A	:REL_P95R comparisonValueAggregateFunction.
weekendAware	 (B
?A:falseRweekendAware"?
PolicySearchRequest
	companyID (R	companyID
limit (Rlimit
offset (Roffset<
createStart (2.google.protobuf.TimestampRcreateStart8
	createEnd (2.google.protobuf.TimestampR	createEnd<
modifyStart (2.google.protobuf.TimestampRmodifyStart8
	modifyEnd (2.google.protobuf.TimestampR	modifyEnd
policies (Rpolicies

thresholds	 (R
thresholds
alarms
 (Ralarms
users (Rusers

dimensions (	R
dimensions

synthTests (R
synthTests.
ignoreNamePrefixes (	RignoreNamePrefixes"
applications (	Rapplications"h
PolicySearchResponse:
policies (2.kentik.api.alerting.v0.PolicyRpolicies
count (Rcount"%
PolicyDeleteRequest
id (Rid"?
PolicyUpdateRequest:

updateMask (2.google.protobuf.FieldMaskR
updateMask6
policy (2.kentik.api.alerting.v0.PolicyRpolicy"%
PolicyEnableRequest
id (Rid"
PolicyEnableResponse"&
PolicyDisableRequest
id (Rid"
PolicyDisableResponse"?
PolicyMuteRequest
id (Rid2
until (2.google.protobuf.TimestampH Runtil-
for (2.google.protobuf.DurationH RforB
time"
PolicyMuteResponse"%
PolicyUnmuteRequest
id (Rid"
PolicyUnmuteResponse"?
PolicyMigrateFieldsRequest
id (Rid>
fields (2&.kentik.api.alerting.v0.FieldMigrationRfields@
baselineBackfillImmediately (RbaselineBackfillImmediately"4
FieldMigration
from (	Rfrom
to (	Rto"
PolicyMigrateFieldsResponse"
PolicyGetAllActiveRequest"X
PolicyGetAllActiveResponse:
policies (2.kentik.api.alerting.v0.PolicyRpolicies"D
DimensionValue
	dimension (	R	dimension
value (	Rvalue";
MetricValue
metric (	Rmetric
value (Rvalue"?
ExplainCurrentEntryF

dimensions (2&.kentik.api.alerting.v0.DimensionValueR
dimensions=
metrics (2#.kentik.api.alerting.v0.MetricValueRmetrics8
	firstSeen (2.google.protobuf.TimestampR	firstSeen

numEntries (R
numEntries"4
"ExplainPolicyCurrentEntriesRequest
id (Rid"j
#ExplainPolicyCurrentEntriesResponseC
values (2+.kentik.api.alerting.v0.ExplainCurrentEntryRvalues"?
ExplainBaselineEntry.
time (2.google.protobuf.TimestampRtimeF

dimensions (2&.kentik.api.alerting.v0.DimensionValueR
dimensions

numEntries (R
numEntries
valueMax (RvalueMax
valueMin (RvalueMin
valueP05 (RvalueP05
valueP25 (RvalueP25
valueP50 (RvalueP50
valueP95	 (RvalueP95
valueP98
 (RvalueP98"5
#ExplainPolicyBaselineEntriesRequest
id (Rid"l
$ExplainPolicyBaselineEntriesResponseD
values (2,.kentik.api.alerting.v0.ExplainBaselineEntryRvalues"G
ExplainPolicyGraphRequest
id (Rid
alertKey (	RalertKey"?
ExplainGraphEntry 
thresholdID (RthresholdID;
values (2#.kentik.api.alerting.v0.MetricValueRvalues$
baselineValue (RbaselineValue.
time (2.google.protobuf.TimestampRtimeP
baselineUsed (2,.kentik.api.alerting.v0.BaselineAlarmTriggerRbaselineUsed"_
ExplainPolicyGraphResponseA
values (2).kentik.api.alerting.v0.ExplainGraphEntryRvalues*L
PolicyStatus
policyStatusInvalid 

active
disabled	
error*7
SynTestType
synTestTypeBasic 
synTestTypeBGP*?
BaselineAggregate
None 
REL_P05
REL_P10
REL_P25
REL_P50
REL_P75
REL_P80
REL_P90
REL_P95
REL_P98	
REL_P99

REL_MAX
REL_MIN*M
BaselineSeasonality
seasonalityNone 

hourly	
daily

weekly*?
BaselineAlarmTrigger
ACT_NOT_USED_BASELINE 
ACT_BASELINE_MISSING_SKIP 
ACT_BASELINE_MISSING_TRIGGER
ACT_BASELINE_USED_FOUND 
ACT_BASELINE_MISSING_DEFAULT
ACT_BASELINE_MISSING_LOWEST 
ACT_BASELINE_MISSING_HIGHEST!
ACT_BASELINE_NOT_FOUND_EXISTS
ACT_CURRENT_MISSING_SKIP
ACT_CURRENT_MISSING_TRIGGER	
ACT_CURRENT_USED_FOUND

ACT_CURRENT_MISSING_DEFAULT
ACT_CURRENT_MISSING_LOWEST
ACT_CURRENT_MISSING_HIGHEST 
ACT_CURRENT_NOT_FOUND_EXISTS2
.ACT_BASELINE_MISSING_DEFAULT_INSTEAD_OF_LOWEST3
/ACT_BASELINE_MISSING_DEFAULT_INSTEAD_OF_HIGHEST1
-ACT_CURRENT_MISSING_DEFAULT_INSTEAD_OF_LOWEST2
.ACT_CURRENT_MISSING_DEFAULT_INSTEAD_OF_HIGHESTBKZIgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertprotoJ??
  ?

  

 

 `
	
 `
	
  (
	
 )
	
 *
	
	 8
	
 <
	
 ?


  


 $
D
  !7 dimension limits the request to a specific dimension.


  


  

  

   


 


%
N
 1A dimensionToDisplayName is a map of dimensions to display names.


 

 ,

 /0
	
 %


"


 


#
@
 !3 dimensions is a list of the supported dimensions.


 


 

 

  
	
 "





! $


! 
:
 #- metrics is a list of the supported metrics.


 #


 #

 #

 #


& *


&

 '

 '

 '	

 '

(

(

(	

(

)

)

)

)


 , 1


 ,

  -

  -

  -

 .

 .

 .

 /

 /


 /

 0

 0

 0



3 6


3
&
 5 id of requested policy.


 5

 5


 5
C
9 ?6 Policy is a definition upon which alarms are raised.



9
m
 <` id of policy. Read only parameter.
 Setting this value in create/update request has no effect.


 <

 <


 <
|
@o companyID of policy creator. Read only parameter.
 Setting this value in create/update request has no effect.


@

@

@
;
C. userID denotes last user who modified policy


C

C

C
?
G.} creationTime denotes policy creation time. Read only parameter.
 Setting this value in create/update request has no effect.


G

G(

G+-
v
K.i lastEditTime denotes last policy edit time.
 Setting this value in create/update request has no effect.


K

K(

K+-

N name of policy.


N

N	

N
&
QS description of policy.


Q

Q	

Q

QS

?RO
!
VX status of policy.


V

V

V

VX

?WU
,
	[  Used to be devices, deprecated


	 [

	 [
.
^"! dimensions used to create keys.


^


^

^

^!

	`9

	`

	`3

	`68
?

ce1 filters decide which flows should be evaluated.



c


c


c


ce


?dQ
A
hj3 metric(s) against which thresholds are evaluated.


h


h

h

h

hj

?iV
.
m%! thresholds used by this policy.


m


m

m

m"$
?
vx2? evaluationPeriod

 Represents aggregation period for betas (using Go time.Duration string syntax)
 Allowed values are (in minutes):
 1, 2, 5 - at any case
 10, 15, 30, 60, 90 - for synthetics


v

v+

v./

v0x

?wQ
F
{}8 nTopKeysEvaluated amount of keys evaluated per window.


{

{	

{

{}

?|Q
V
??F nTopKeysAddedToBaseline amount of keys added to baseline per window.


?

?	 

?#$

?%?

??Q
A
??1 silentModeExpireDate denotes end of silentMode.


?

?0

?35

?6?

??Y
?
??? baselineSettings define how baseline is gathered and processed in order to create comparison points.
 Those settings are used only in thresholds which use baseline modes.


?

?#

?&(

?)?

??Q
m
??] minTrafficValue is a minimum amount of data flowing on given key to include it in top keys.


?

?	

?

??

??P
w
?%i deviceSelector defines which devices are included in this policy.
 Mandatory in create/update requests.


?

?

?"$
P
?B dashboardID identifies the dashboard this policy is attached to.


?

?	

?
?
?(? baselineBackfillImmediately is a flag indicating a backfill should be started.
 It is only read during create and update, and it is not stored.


?

?"

?%'
?
?? application is an optional attribute determining what app is using given policy
 meaningful for the applications, not for the alert API itself


?

?	

?
V
?,H expireDate indicates when the policy should expire and become disabled


?

?&

?)+

? ?

?

 ?

 ?

 ?

?

?

?
2
	? ?$ Holds data about a synthetic test.


	?
)
	 ? Get data about this test.


	 ?

	 ?	

	 ?
>
	?0 Optionally limit down to only these agent ids.


	?


	?

	?

	?
0
	?" Optional type, eg. for BGP tests


	?

	?

	?
?

? ?? v0DeviceSelector

 DeviceSelector defines subset of company devices for which policy is applicable.
 Names, labels, sites and types form a disjunction of predicates, roughly equal to following sql query:
 `WHERE name IN (names) OR label IN (labels) ...`



?
f

 ?X all decides whether policy is applicable to all devices. Overrides all other settings.



 ?


 ?



 ?
0

?" names is a list of device names.



?



?


?


?
2

?$ labels is a list of device labels.



?



?


?


?
)

? sites is a list of sites.



?



?


?


?
0

?" types is a list of device types.



?



?


?


?
?

?? These fields are needed to support synthetic policies.
 If the policy is synthetic based, will be populated, else it is expected to be nil.



?	


?



?

? ?

? 

 ?

 ?

 ?	

 ?

?)

?


?

?$

?'(

? ?

?

 ?

 ?

 ?	


?

?	

?

?

?	

?

?

?	

?

?

?	

?

?

?	

?

?

?	

?

?

?	

?

?

?	

?

	?

	?	

	?


?


?	


?

?

?	

?

?

?	

?
]
? ?O BaselineSeasonality enumerates available seasonality cycle types in baseline.


?

 ?

 ?

 ?

?

?

?

?

?

?


?

?

?

? ?

?

 ?

 ?

 ?

? 

?

?

?#

?

?!"

?

?

?

?#

?

?!"

?"

?

? !

?#

?

?!"

?$

?

?"#

?

?

?

	?"

	?

	? !


?


?


?

?#

?

? "

?"

?

?!

?#

?

? "

?$

?

?!#

?6

?0

?35

?7

?1

?46

?5

?/

?24

?6

?0

?35
?
? ?? v0BaselineSettings

 A baseline is a time series of values observed by alerting system, it is used to derive thresholds at which alarms should be raised.
 A baseline starts at some point in the past and has some length (startOffset and length setttings).
 Before a baseline is considered valid it has to gather some data (minimalLength setting),
 until then the policy exhibits one of four behaviors. Configurable through threshold model.

 - always alert
 - do not alert at all
 - use lowest value from top keys set
 - use static default value

 A single point in a baseline represents an hour worth of datapoints observed, aggregated using some function (datapointAggregationMethod).
 Values observed are compared to `comparision value` which is derived from `seasonality set` using another aggregate function (comparisonValueAggregateFunction).
 The seasonality set is a subset of the baseline picked based on seasonality. Three cases are possible:

 - No seasonality: pick all datapoints
 - Daily pattern: pick datapoints from the same hour from each day
 - Weekly pattern: pick datapoints from the same hour and same day from each week

 Before the final aggergation function gets applied the user has possibility to refine the points
 in seasonality set based on their neighbours, this time each point and n points before/after are scalarized
 using another aggregate function (neighbourhoodAggregationMethod), amount of points befor/after included in set is dictated by neighbourhoodRadius setting.


?
?
 ??? datapointAggregationMethod defines how all values recorded in given hour window.
 are translated to single datapoint in baseline (i.e 95th percentile, max).


 ?

 ?.

 ?12

 ?3?

 ??V
b
??R startOffset defines when baseline starts relative to current time (i.e day ago).


?

?&

?)*

?+?

??Q
?
??y length of baseline (i.e 3 weeks) togeteher with startOffset denote window in time used to calculate comparision points.


?

?!

?$%

?&?

??Q
y
??i minimalLength defines how much baseline has to be recorded before it is considered usable (i.e 4 days).


?

?(

?+,

?-?

??Q
b
??R seasonality dictates which points from baseline are included in seasonality set.


?

?!

?$%

?&?

??T
?
??? neighbourhoodAggregationMethod is used to further refine values from baseline before creating comparision datapoint.
 This aggregation is optional. Value is calculated from set of values defined by neighbourhoodRadius.


?

?2

?56

?7?

??S
?
??? neighbourhoodRadius defines aggregation window upon which neighbourhoodAggregationMethod is used.
 In example if pointContextWidth is set to 1 and current point index is i, then neighbourhood would consist of [i - 1, i, i + 1].
 Final value would be comp_set_refined[i] = neighbourhoodAggregationMethod([comp_set[i-1], comp_set[i], comp_set[i+1]]).


?

?	

? 

?!?

??P
?
??t comparisonValueAggregateFunctionis a final agregate function, used to translate comparision set into single value.


?

?4

?78

?9?

??V
U
??E weekendAware decides whether separate pattern is used for weekends.


?

?

?

??

??T
[
? ?"M TODO(tjonak): this param got moved to headers, check whether still required


?

 ?

 ?

 ?

 ?
I
?; limit of entries returned.
 Pseudocode: policies[:limit].


?

?	

?
b
?T offset at which start pulling results.
 Pseudocode: policies[offset:offset+limit].


?

?	

?
j
?,\ createStart narrows results to policies created no sooner than this timestamp (inclusive).


?

?'

?*+
g
?*Y createEnd narrows results to policies created no later than this timestamp (inclusive).


?

?%

?()
i
?,[ modifyStart narrows results to policies edited no sooner than this timestamp (inclusive).


?

?'

?*+
f
?*X modifyEnd narrows results to policies edited no later than this timestamp (inclusive).


?

?%

?()
D
?6 policies narrows results to policies with those ids.


?


?

?

?
^
? P thresholds narrows results to policies with those thresholds (denoted by ids).


?


?

?

?
_
	?Q alarms narrows results to policies which spawned those alarms (denoted by ids).


	?


	?

	?

	?
h

?Z users narrows results to policies created (associated?) to those users (denoted by ids).



?



?


?


?
c
?"U dimensions narrows results to policies which use those dimensions to assemble keys.


?


?

?

?!
e
?"W synthetic test ids narrows results to policies which target specific synthetic tests.


?


?

?

?!
?
?*s ignoreNamePrefixes narrows results to policies whose names do not start with specified prefixes.
 Case sensitive.


?


?

?$

?')
c
?$U applications narrows results to policies managed with given application identifiers


?


?

?

?!#

? ?

?
/
 ?! policies matching search terms.


 ?


 ?

 ?

 ?
R
?D count of entries in policy collection, regardless of limit/offset.


?

?	

?

? ?

?
$
 ? id of target policy.


 ?

 ?	

 ?

? ?

?

 ?+

 ?

 ?&

 ?)*

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?


? 

?

? ?

?

 ?

 ?

 ?	

 ?


?  

?

? ?

?

 ?

 ?

 ?	

 ?

 ??

 ?

?(

?

?#

?&'

?%

?

? 

?#$


? 

?

? ?

?

 ?

 ?

 ?	

 ?


? 

?

? ?

?"

 ?

 ?

 ?	

 ?

?%

?


?

? 

?#$

?'

?

?"

?%&

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

? ?

?#


? $

?!

? ?

?"

 ?

 ?


 ?

 ?

 ?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

 ? ?

 ?

  ?)

  ?


  ?

  ?$

  ?'(

 ?#

 ?


 ?

 ?

 ?!"

 ?*

 ?

 ?%

 ?()

 ?

 ?

 ?	

 ?

!? ?

!?*

! ?

! ?

! ?	

! ?

"? ?

"?+

" ?*

" ?


" ?

" ?%

" ?()

#? ?

#?

# ?%

# ?

# ? 

# ?#$

#?)

#?


#?

#?$

#?'(

#?

#?

#?

#?

#?

#?

#?	

#?

#?

#?

#?	

#?

#?

#?

#?	

#?

#?

#?

#?	

#?

#?

#?

#?	

#?

#?

#?

#?	

#?

#	?

#	?

#	?	

#	?

$? ?

$?+

$ ?

$ ?

$ ?


$ ?

%? ?

%?,

% ?+

% ?


% ?

% ? &

% ?)*

&? ?

&?!

& ?

& ?

& ?	

& ?

&?

&?

&?	

&?

'? ?

'?

' ?

' ?

' ?

' ?

'?"

'?


'?

'?

'? !

'?

'?

'?	

'?

'?%

'?

'? 

'?#$

'?(

'?

'?#

'?&'

(? ?

(?"

( ?(

( ?


( ?

( ?#

( ?&'bproto3??  
??
2kentik/alerting/backend/v0/alertproto/alarms.protokentik.api.alerting.v0google/protobuf/timestamp.protogoogle/protobuf/duration.proto.protoc-gen-openapiv2/options/annotations.proto2kentik/alerting/backend/v0/alertproto/common.proto2kentik/alerting/backend/v0/alertproto/policy.proto5kentik/alerting/backend/v0/alertproto/threshold.proto6kentik/alerting/backend/v0/alertproto/mitigation.proto"?
AlarmsRequest
limit (B?A:100Rlimit
offset (B?A:0Roffset0
start (2.google.protobuf.TimestampRstart,
end (2.google.protobuf.TimestampRendH
creationTimeStart (2.google.protobuf.TimestampRcreationTimeStartD
creationTimeEnd  (2.google.protobuf.TimestampRcreationTimeEndM
creationTimeDuration! (2.google.protobuf.DurationRcreationTimeDurationB
startTimeStart" (2.google.protobuf.TimestampRstartTimeStart>
startTimeEnd# (2.google.protobuf.TimestampRstartTimeEndG
startTimeDuration$ (2.google.protobuf.DurationRstartTimeDuration>
endTimeStart% (2.google.protobuf.TimestampRendTimeStart:

endTimeEnd& (2.google.protobuf.TimestampR
endTimeEndC
endTimeDuration' (2.google.protobuf.DurationRendTimeDuration]
states (2".kentik.api.alerting.v0.AlarmStateB!?A:["clear", "alarm", "ackReq"]Rstatesy

severities (2 .kentik.api.alerting.v0.SeverityB7?A4:2["minor", "minor2", "major", "major2", "critical"]R
severities)
mitigations (B?A:[]Rmitigations#
policies	 (B?A:[]Rpolicies
alarms (B?A:[]Ralarms.
policyNamePrefixes (	RpolicyNamePrefixes 
policyNames (	RpolicyNames&
ignorePolicies (RignorePolicies:
ignorePolicyNamePrefixes (	RignorePolicyNamePrefixes,
ignorePolicyNames (	RignorePolicyNames4
dimensionsConjunction (	RdimensionsConjunction4
dimensionsDisjunction (	RdimensionsDisjunction'

dimensions (	B?A:[]R
dimensionsv
dimensionToKeyPart
 (2=.kentik.api.alerting.v0.AlarmsRequest.DimensionToKeyPartEntryB?A:{}RdimensionToKeyPart`
dimensionToKeyPartDNF (2*.kentik.api.alerting.v0.AlarmsRequest.DTKPRdimensionToKeyPartDNF|
relatedEntityToValue (2?.kentik.api.alerting.v0.AlarmsRequest.RelatedEntityToValueEntryB?A:{}RrelatedEntityToValue2
includeInsightAlarms (RincludeInsightAlarms.
excludeUserDefined (RexcludeUserDefined]
pastOrPresent (23.kentik.api.alerting.v0.AlarmsRequest.PastOrPresentBRpastOrPresent$
keyPartsExact (	RkeyPartsExact(
keyPartsPartial (	RkeyPartsPartial.
excludeSubpolicies( (RexcludeSubpolicies"
applications) (	RapplicationsE
DimensionToKeyPartEntry
key (	Rkey
value (	Rvalue:8?
DTKPr
dimensionToKeyPart (2B.kentik.api.alerting.v0.AlarmsRequest.DTKP.DimensionToKeyPartEntryRdimensionToKeyPartE
DimensionToKeyPartEntry
key (	Rkey
value (	Rvalue:8G
RelatedEntityToValueEntry
key (	Rkey
value (	Rvalue:8"W
PastOrPresent
pastOrPresent_unspecified 
presentOnly
pastOnly
both"U
AlarmGetRequest
id (Rid2
includeRelatedAlarms (RincludeRelatedAlarms"/
AlarmDetailsRequest
alarmID (RalarmID"?
AlarmsResponse5
alarms (2.kentik.api.alerting.v0.AlarmRalarms
count (RcountC
totals (2+.kentik.api.alerting.v0.AlarmsAggregateDataRtotalsk
policyIDToDetails (2=.kentik.api.alerting.v0.AlarmsResponse.PolicyIDToDetailsEntryRpolicyIDToDetailst
thresholdIDToDetails (2@.kentik.api.alerting.v0.AlarmsResponse.ThresholdIDToDetailsEntryRthresholdIDToDetailsd
PolicyIDToDetailsEntry
key (Rkey4
value (2.kentik.api.alerting.v0.PolicyRvalue:8j
ThresholdIDToDetailsEntry
key (Rkey7
value (2!.kentik.api.alerting.v0.ThresholdRvalue:8"?
AlarmGetResponse3
alarm (2.kentik.api.alerting.v0.AlarmRalarmL
stateChanges (2(.kentik.api.alerting.v0.AlarmStateChangeRstateChangesC
relatedAlarms (2.kentik.api.alerting.v0.AlarmRrelatedAlarms6
policy (2.kentik.api.alerting.v0.PolicyRpolicy?
	threshold (2!.kentik.api.alerting.v0.ThresholdR	threshold"?
AlarmDetailsResponse3
alarm (2.kentik.api.alerting.v0.AlarmRalarmL
stateChanges (2(.kentik.api.alerting.v0.AlarmStateChangeRstateChangesC
relatedAlarms (2.kentik.api.alerting.v0.AlarmRrelatedAlarms6
policy (2.kentik.api.alerting.v0.PolicyRpolicy?
	threshold (2!.kentik.api.alerting.v0.ThresholdR	threshold"?
Alarm
id (Rid
	companyID (R	companyID
policyID (RpolicyID 
thresholdID (RthresholdID"
mitigationID (RmitigationIDe
dimensionToKeyPart (25.kentik.api.alerting.v0.Alarm.DimensionToKeyPartEntryRdimensionToKeyPartV
metricToValue (20.kentik.api.alerting.v0.Alarm.MetricToValueEntryRmetricToValue
baseline (Rbaseline8
	startTime	 (2.google.protobuf.TimestampR	startTime4
endTime
 (2.google.protobuf.TimestampRendTime8
state (2".kentik.api.alerting.v0.AlarmStateRstate<
severity (2 .kentik.api.alerting.v0.SeverityRseverityq
dimensionToDisplayName (29.kentik.api.alerting.v0.Alarm.DimensionToDisplayNameEntryRdimensionToDisplayNamek
dimensionToKeyDetail (27.kentik.api.alerting.v0.Alarm.DimensionToKeyDetailEntryRdimensionToKeyDetail

policyName (	R
policyName$
relatedAlarms (RrelatedAlarms(
historicalCount (RhistoricalCount`
baselineAlarmTrigger (2,.kentik.api.alerting.v0.BaselineAlarmTriggerRbaselineAlarmTriggerB

mitigation (2".kentik.api.alerting.v0.MitigationR
mitigation
	isInsight (R	isInsightE
DimensionToKeyPartEntry
key (	Rkey
value (	Rvalue:8@
MetricToValueEntry
key (	Rkey
value (Rvalue:8I
DimensionToDisplayNameEntry
key (	Rkey
value (	Rvalue:8p
DimensionToKeyDetailEntry
key (	Rkey=
value (2'.kentik.api.alerting.v0.DimensionDetailRvalue:8"?
AlarmStateChange8
state (2".kentik.api.alerting.v0.AlarmStateRstate?
event (2).kentik.api.alerting.v0.AlarmHistoryEventRevent.
time (2.google.protobuf.TimestampRtime<
severity (2 .kentik.api.alerting.v0.SeverityRseverity 
thresholdID (RthresholdID"?
AlarmsAggregateDataO
states (27.kentik.api.alerting.v0.AlarmsAggregateData.StatesEntryRstates[

severities (2;.kentik.api.alerting.v0.AlarmsAggregateData.SeveritiesEntryR
severitiesU
policies (29.kentik.api.alerting.v0.AlarmsAggregateData.PoliciesEntryRpolicies9
StatesEntry
key (	Rkey
value (Rvalue:8=
SeveritiesEntry
key (	Rkey
value (Rvalue:8;
PoliciesEntry
key (Rkey
value (Rvalue:8";
AlarmAckRequest
id (Rid
comment (	Rcomment"
AlarmAckResponse*=

AlarmState
	noneState 	
clear	
alarm

ackReq*g
AlarmHistoryEvent
noneAlarmHistoryEvent 	
start

escalation
acknowledgement
endBKZIgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertprotoJ?g
  ?

  

 

 `
	
 `
	
  )
	
 (
	
 8
	
 <
	
	 <
	

 ?
	
 @
m
  ?` AlarmsRequest is a bunch of optional filtering parameters to narrow down returned alarms list.



 
K
  d> limit is how many alarms to return at most. Defaults to 100.


  

  	

  

  c

  ?b
Q
 cD offset is the offset into the list of alarms. Use this for paging.


 

 	

 

 b

 ?a
?
 &x start is a lower bound of timespan. Alarm duration has to overlap this timespan to get included in results (inclusive)


 

 !

 $%
?
 $v end is a upper bound of timespan. Alarm duration has to overlap this timespan to get included in results (inclusive)


 

 

 "#
U
 3H creationTimeStart and creationTimeEnd bracket an alarm's creationTime.


 

 -

 02

 1

 

 +

 .0

 5

 

 /

 24
L
 !0? startTimeStart and startTimeEnd bracket an alarm's startTime.


 !

 !*

 !-/

 ".

 "

 "(

 "+-

 	#2

 	#

 	#,

 	#/1
F
 
&.9 endTimeStart and endTimeEnd bracket an alarm's endTime.


 
&

 
&(

 
&+-

 ',

 '

 '&

 ')+

 (0

 (

 (*

 (-/
k
 ,.] states filters alarms to only those in these states.
 If not present, any state is allowed.


 ,


 ,

 ,

 , 

 ,!.

 ?-k
v
 26h severities filters alarms to only those at these severities.
 If not present, any severity is allowed.


 2


 2

 2

 2!"

 2#6

 ?35
X
 9=J mitigations narrows results to alarms with given mitigations associated.


 9


 9

 9

 9 

 9!=

 ?:<
P
 @DB policies narrows results to alarms with given policy associated.


 @


 @

 @

 @

 @D

 ?AC
@
 GK2 alarms filters results to alarms with these ids.


 G


 G

 G

 G

 GK

 ?HJ
b
 N*U policyNamePrefixes filters results to alarms for policies whose names prefix-match.


 N


 N

 N$

 N')
T
 Q#G policyNames filters results to alarms for policies whose names match.


 Q


 Q

 Q

 Q "

 S%

 S


 S

 S

 S"$

 T0

 T


 T

 T*

 T-/

 U)

 U


 U

 U#

 U&(
i
 X-\ dimensionsConjunction filters results to alarms for policies with all of these dimensions.


 X


 X

 X'

 X*,
i
 Z-\ dimensionsDisjunction filters results to alarms for policies with any of these dimensions.


 Z


 Z

 Z'

 Z*,
\
 ]aN dimensions narrows results to alarms with all specified dimensions included.


 ]


 ]

 ]

 ]!

 ]"a

 ?^`
?
 ei? dimensionToKeyPart describes a partial match of specific dimension values.
 For example, find all alarms with i_device_id = 1001.


 e

 e(

 e+-

 e.i

 ?fh
?
 m+} dimensionToKeyPartDNF describes a partial match of dimension values, connected
 in disjunctive normal form (an OR of ANDs).


 m


 m

 m%

 m(*

 np

 n


  o/

  o

  o*

  o-.
?
 x|? relatedEntityToValue describes a partial match of dimension values in alarms,
 like dimensionToKeyPart, however, the keys are "entities" and matches will include
 any dimensions that are "related". For example, `{"as": 1234}` will match dst_as,
 src_as, and other as dimensions. `{"device_id": 1234}` will match i_device_id,
 but also any InterfaceID_src, InterfaceID_dst, etc. related to that device. And so on.
 This feature is still under development.


 x

 x*

 x-/

 x0|

 ?y{
p
 !c includeInsightAlarms includes Kentik-defined (insight) alarms. Default false = no insight alarms.


 

 

  
e
 ?W excludeUserDefined excludes user-defined alarms. Default false = alarms are included.


 ?

 ?

 ?

  ??

  ?

   ?"

   ?

   ? !

  ?

  ?

  ?

  ?

  ?

  ?

  ?

  ?

  ?
?
 ?5? Deprecated, not used anymore
 PastOrPresent indicates whether we should include alarms that are
 current, or historical, or both.


 ?

 ?

 ? "

 ?#4

 ?$3
f
  ?%X keyPartsExact narrows results to alarms where all the specified key parts are present.


  ?


  ?

  ?

  ?"$
?
 !?'? keyPartsPartial narrows results to alarms where all the specified key parts are present via a partial match.
 Equivalent sql query `keyPart ilike '%keyPartPartial%'`.


 !?


 !?

 !?!

 !?$&
c
 "?U excludeSubpolices excludes Subpolicies alarms. Default false = alarms are included.


 "?

 "?

 "?

 #?$

 #?


 #?

 #?

 #?!#

? ?

?
A
 ?3 id of an alarm whose details are being requested.


 ?

 ?


 ?
Z
? L includeRelatedAlarms runs additional logic to fetch alarms related by key.


?

?

?

? ?

?

 ?

 ?

 ?

 ?

? ?

?
0
 ?" alarms are the alarms requested.


 ?


 ?

 ?

 ?
e
?W count is an amount of alarms matching AlarmsRequest before applying limit and offset.


?

?	

?
E
?!7 totals is metadata about all alarms for this company.


?

?

? 
D
?+6 policyIDToDetails includes relevant policy metadata.


?

?&

?)*

?1

?

?,

?/0

? ?

?
-
 ? alarm is the alarm requested.


 ?

 ?

 ?
L
?-> stateChanges is the history of state changes for this alarm.


?


?

?(

?+,
l
?#^ relatedAlarms is a list of suggested related alarms,
 i.e. other alarms for the same device.


?


?

?

?!"
?
?x policy includes partial information about policy for this alarm.
 If you want to get full info query for given policy.


?

?	

?
I
?; threshold stores all data about threshold for this alarm.


?

?

?

? ?

?
-
 ? alarm is the alarm requested.


 ?	

 ?


 ?
L
?/> stateChanges is the history of state changes for this alarm.


?

?

?*

?-.
l
?%^ relatedAlarms is a list of suggested related alarms,
 i.e. other alarms for the same device.


?

?

? 

?#$
?
?x policy includes partial information about policy for this alarm.
 If you want to get full info query for given policy.


?


?

?
I
?; threshold stores all data about threshold for this alarm.


?

?

?
O
? ?A Alarm is an event of crossing some threshold defined in policy.


?
+
 ? id is the id of this alarm.


 ?

 ?


 ?
?
?1 companyID is the company this alarm belongs to.


?

?

?
?
?1 policyID is the policy that created this alarm.


?

?

?
Q
?C thresholdID is the current threshold that matched for this alarm.


?

?

?
R
?D mitigationID is the mitigation associated with this alarm, if any.


?

?

?
Y
?-K dimensionToKeyPart is a map of dimensions to their values for this alarm.


?

?(

?+,
Q
?(C metricToValue is a map of metrics to their values for this alarm.


?

?#

?&'
?
?? baseline is the value of the relevant baseline, if any.
 It won't be present if the value was 0, or this policy doesn't use baselines.


?

?	

?
;
?*- startTime is when this alarm began to fire.


?

?%

?()
U
	?)G endTime is when this alarm cleared. Not present if it hasn't cleared.


	?

	?#

	?&(
9

?+ state is the current state of this alarm.



?


?


?
]
?O severity is the severity of this alarm, which is the severity of thresholdID.


?


?

?
r
?2d dimensionToDisplayName is a mapping between dimensions used in this alarm and their display names.


?

?,

?/1
o
?9a dimensionToKeyDetail provides extended information about given dimension (display names, etc.).


?

?3

?68
M
?? policyName is the name of the policy that created this alarm.


?

?	

?
?
?%? relatedAlarms is a list of alarms triggered for the same policy on the same key. Included if includeRelatedAlarms = true in Get request.


?


?

?

?"$
?
?? historicalCount is how many alarms triggered for the same policy on the same key. Included if includeRelatedAlarms = true in Get request.


?

?	

?
m
?1_ baselineAlarmTrigger is the reason the baseline condition matched when triggering this alarm.


?

?+

?.0
@
?2 mitigation is the associated mitigation, if any.


?

?

?
s
?e isInsight is true if this is an alarm from an insight policy and not a custom, user defined policy.


?

?

?
J
? ?< AlarmStateChange is an event where an alarm changed state.


?
B
 ?4 currentState is the state after this state change.


 ?

 ?

 ?
6
?( event denotes reason for state change.


?

?

?
7
?%) time is when the state change occurred.


?

? 

?#$
9
?+ severity of alarm after this state change


?


?

?
U
?G thresholdID denotes threshold associated with current alarm severity.


?

?	

?
R
 ? ?2D Remember that 0 in enum values is mapped to null in json responses


 ?

  ?

  ?

  ?

 ?

 ?

 ?


 ?

 ?

 ?


 ?

 ?

 ?
Z
? ?L AlarmsAggregateData gives counts of alarms by state, severity, and policy.


?
?
 ? ? states is a map from each state to how many alarms are in that state.

 TODO(jackb): maybe stateToCount, severityToCount, policyIDToCount?


 ?

 ?

 ?
_
?$Q severities is a map from each severity to how many alarms are at that severity.


?

?

?"#
`
?!R policies is a map from policy id to how many alarms are present for that policy.


?

?

? 

? ?

?

 ?

 ?

 ?

?

?

?


?

?

?

?

?

?

?


?

?	

	? ?

	?

	 ?

	 ?

	 ?	

	 ?

	?

	?

	?	

	?



? 


?bproto3??  
?
+kentik/core/v202012alpha1/annotations.protokentik.core.v202012alpha1 google/protobuf/descriptor.proto:E
service_scope.google.protobuf.ServiceOptions?* (	RserviceScope:I
private_service.google.protobuf.ServiceOptions?* (RprivateService:B
method_scope.google.protobuf.MethodOptions?* (	RmethodScope:F
private_method.google.protobuf.MethodOptions?+ (RprivateMethodBJZHgithub.com/kentik/api-schema/gen/go/kentik/core/v202012alpha1;kentik_apiJ?
 

 2 Error information


 "

 _
	
 _
	
  *
	
	 
(
  auth scope for this service



 	%


 


 	


 
R
G private_service indicates that this service is not publicly available



	%









	
 
(
 auth scope for this service



$





	



P
E private_method indicates that this method is not publicly available



$








bproto3??  
?P
4kentik/alerting/backend/v0/alertproto/baseline.protokentik.api.alerting.v0google/protobuf/duration.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto"p
$AlarmBaselineExplanationGraphRequest
alarmID (RalarmID.
time (2.google.protobuf.TimestampRtime"?
BaselineExplanationGraphRequest
policyID (RpolicyID
alarmID (RalarmID
dimensionToKeyPart (2O.kentik.api.alerting.v0.BaselineExplanationGraphRequest.DimensionToKeyPartEntryRdimensionToKeyPart8
time (2.google.protobuf.TimestampB?A:nowRtimeE
DimensionToKeyPartEntry
key (	Rkey
value (	Rvalue:8"?
 BaselineExplanationGraphResponse
policyID (RpolicyID
alarmID (RalarmID?
dimensionToKeyPart (2P.kentik.api.alerting.v0.BaselineExplanationGraphResponse.DimensionToKeyPartEntryRdimensionToKeyPart&
baselineMetric (	RbaselineMetric$
baselineValue (RbaselineValueI

datapoints (2).kentik.api.alerting.v0.BaselineDatapointR
datapointsQ
finalDatapoint (2).kentik.api.alerting.v0.BaselineDatapointRfinalDatapoint.
englishDescription (	RenglishDescriptionE
DimensionToKeyPartEntry
key (	Rkey
value (	Rvalue:8"Y
BaselineDatapoint.
time (2.google.protobuf.TimestampRtime
value (Rvalue"n
BaselineBackfillJobRequest
policyID (RpolicyID
id (	Rid$
sqlPredicates (	RsqlPredicates"\
BaselineBackfillJobResponse=
job (2+.kentik.api.alerting.v0.BaselineBackfillJobRjob"a
BaselineBackfillJobsRequest
policyID (RpolicyID&
showSuperseded (RshowSuperseded"_
BaselineBackfillJobsResponse?
jobs (2+.kentik.api.alerting.v0.BaselineBackfillJobRjobs"?
BaselineBackfillJob
	companyID (R	companyID
userID (RuserID
policyID (RpolicyID
id (	Rid$
sqlPredicates (	RsqlPredicates

slotsTotal (R
slotsTotal$
slotsComplete (RslotsComplete
progress (Rprogress"
isSuperseded	 (RisSuperseded"?
BaselineBackfillSlotJob
	companyID (R	companyID
userID (RuserID
policyID (RpolicyID
id (	Rid
ksql (	Rksql0
start (2.google.protobuf.TimestampRstart,
end (2.google.protobuf.TimestampRend"
metricColumn (	RmetricColumn*
dimensionColumns	 (	RdimensionColumns 
countColumn
 (	RcountColumn"J
BaselineSlotsRequest
policyID (RpolicyID
source (	Rsource"S
BaselineSlotsResponse:
slots (2$.kentik.api.alerting.v0.BaselineSlotRslots"?
BaselineSlot
id (Rid
	companyID (R	companyID
policyID (RpolicyID.
time (2.google.protobuf.TimestampRtime/
width (2.google.protobuf.DurationRwidth>
creationTime (2.google.protobuf.TimestampRcreationTime
source (	Rsource
prio (Rprio

numEntries	 (R
numEntries?
entries
 (2%.kentik.api.alerting.v0.BaselineEntryRentries
jobUUID (	RjobUUID"?
BaselineEntry.
time (2.google.protobuf.TimestampRtime
value (Rvaluem
dimensionToKeyPart (2=.kentik.api.alerting.v0.BaselineEntry.DimensionToKeyPartEntryRdimensionToKeyPartE
DimensionToKeyPartEntry
key (	Rkey
value (	Rvalue:8"?
DeleteBaselineSlotRequest
policyID (RpolicyID.
time (2.google.protobuf.TimestampRtime
slotID (RslotID
source (	Rsource
prio (Rprio"?
DeleteBaselineEntryRequest
policyID (RpolicyIDz
dimensionToKeyPart
 (2J.kentik.api.alerting.v0.DeleteBaselineEntryRequest.DimensionToKeyPartEntryRdimensionToKeyPart.
time (2.google.protobuf.TimestampRtime
slotID (RslotID
source (	Rsource
prio (RprioE
DimensionToKeyPartEntry
key (	Rkey
value (	Rvalue:8"r
 RetryBaselineBackfillJobsRequest
	companyID (R	companyID
policyID (RpolicyID
retry (Rretry"?
!RetryBaselineBackfillJobsResponsex
policiesRetried (2N.kentik.api.alerting.v0.RetryBaselineBackfillJobsResponse.PoliciesRetriedEntryRpoliciesRetriedB
PoliciesRetriedEntry
key (	Rkey
value (Rvalue:8BKZIgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertprotoJ?/
  ?

  

 

 `
	
 `
	
  (
	
 )
	
 8


 	 


 	,

  


  


  


  

%
 %" default: time of alarm


 

  

 #$


 


'

 

 

 

 
!
 optional alarm id.








-



(

+,





 

#$

%

?R


 "


(

 

 

 

 









-



(

+,





	







	



,






'

*+

'



"

%&

!!

!

!	

! 


$ '


$

 %%

 %

 % 

 %#$

&

&

&	

&
Y
) 5"M companyID is grabbed from the headers.
 userID is grabbed from the headers.



)"

 -

 -

 -

 -
0
."# id cannot be requested on create.


.

.	

.
?
4$? sqlPredicates are additional ksql predicates that will be added to the job's
 where clause. This could be used to filter out some kind of data that should be
 excluded from the baseline. For example, "IP_src != '1.2.3.4'".
 All of the predicates are ANDed together with the main predicate.


4


4

4

4"#


7 9


7#

 8

 8

 8

 8
4
; @"( companyID is grabbed from the headers.



;#

 >"
 optional


 >

 >

 >
=
?"0 optional; default to not show superseded jobs.


?

?

?


B D


B$

 C(

 C


 C

 C#

 C&'


F Q


F
)
 G" the company the job is for


 G

 G

 G
(
H" the user starting the job


H

H

H
(
I" the policy the job is for


I

I

I

J" a uuid


J

J	

J
!
K$" additional filters


K


K

K

K"#

M

M

M

M

N

N

N

N
E
O"8 slotsComplete / slotsTotal (a number between 0 and 1).


O

O	

O

P

P

P

P
Z
	T _N Stored as a message in kafka (topic kentik.alert.baseline.backfill.queries).



	T

	 U

	 U

	 U

	 U

	V

	V

	V

	V

	W

	W

	W

	W

	X" a uuid


	X

	X	

	X
5
	Y"( the exact ksql to be run for this slot


	Y

	Y	

	Y

	Z&

	Z

	Z!

	Z$%

	[$

	[

	[

	["#
8
	\"+ the sql column that is the primary metric


	\

	\	

	\
0
	]'"# the sql columns that form the key


	]


	]

	]"

	]%&
7
		^"* the sql column that holds the flow count


		^

		^	

		^
Y

a g"M companyID is grabbed from the headers.
 userID is grabbed from the headers.




a


 e


 e


 e


 e


f


f


f	


f


i k


i

 j"

 j


 j

 j

 j !


m y


m

 n

 n

 n


 n

o

o

o

o

p

p

p

p

q%

q

q 

q#$
#
r%" i.e., always an hour


r

r 

r#$

s-

s

s(

s+,
,
t" "backfill", "frontfill", etc.


t

t	

t

u

u

u

u

v

v

v

v

	w&

	w


	w

	w 

	w#%
%

x" if created by backfill



x


x	


x


{ 


{

 |%

 |

 | 

 |#$

}

}

}	

}

~-

~

~(

~+,

? ?

?!

 ?

 ?

 ?

 ?

?%

?

? 

?#$

?

?

?

?

?

?

?	

?

?

?

?

?

? ?

?"

 ?

 ?

 ?

 ?

?."	 the key


?

?(

?+-

?%

?

? 

?#$

?

?

?

?

?

?

?	

?

?

?

?

?

? ?

?(
"
 ?" 0 => all companies


 ?

 ?

 ?
!
?" 0 => all policies


?

?

?
T
?"F the default, false, means juts show which policies would be retried.


?

?

?

? ?

?)

 ?(

 ?

 ?#

 ?&'bproto3??  
?
4kentik/alerting/backend/v0/alertproto/insights.protokentik.api.alerting.v02kentik/alerting/backend/v0/alertproto/policy.proto"?
InsightPolicy6
policy (2.kentik.api.alerting.v0.PolicyRpolicy 
insightName (	RinsightName 
displayName (	RdisplayName"v
InsightPolicySearchResponseA
policies (2%.kentik.api.alerting.v0.InsightPolicyRpolicies
count (RcountBKZIgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertprotoJ?
  

  

 

 `
	
 `
	
  <
E
  9 InsightPolicy has a bit of metadata on top of a Policy.



 

  

  

  	

  

 	

 	

 		

 	

 


 


 
	

 

.
 " Compare to PolicySearchResponse.



#

 &

 


 

 !

 $%





	

bproto3??  
?%
5kentik/alerting/backend/v0/alertproto/subpolicy.protokentik.api.alerting.v0 google/protobuf/field_mask.protogoogle/protobuf/timestamp.proto5kentik/alerting/backend/v0/alertproto/threshold.proto"?
	Subpolicy
parentID (RparentID
id (Rid?
filter (2'.kentik.api.alerting.v0.SubpolicyFilterRfilterA

thresholds (2!.kentik.api.alerting.v0.ThresholdR
thresholds>
creationTime (2.google.protobuf.TimestampRcreationTime>
lastEditTime (2.google.protobuf.TimestampRlastEditTime>
injectDimensionsIntoParent (RinjectDimensionsIntoParent"C
SubpoliciesGetRequest
parentID (RparentID
id (Rid"H
SubpoliciesListRequest
	parentIDs (R	parentIDs
ids (Rids"^
SubpoliciesListResponseC
subpolicies (2!.kentik.api.alerting.v0.SubpolicyRsubpolicies"[
SubpoliciesCreateRequest?
	subpolicy (2!.kentik.api.alerting.v0.SubpolicyR	subpolicy"[
SubpolciesCreateResponse?
	subpolicy (2!.kentik.api.alerting.v0.SubpolicyR	subpolicy"?
SubpoliciesUpdateRequest?
	subpolicy (2!.kentik.api.alerting.v0.SubpolicyR	subpolicy:

updateMask (2.google.protobuf.FieldMaskR
updateMask"\
SubpoliciesUpdateResponse?
	subpolicy (2!.kentik.api.alerting.v0.SubpolicyR	subpolicy"F
SubpoliciesDeleteRequest
parentID (RparentID
id (Rid"
SubpoliciesDeleteResponse"x
SubpolicyFilterG
conjunctions (2#.kentik.api.alerting.v0.ConjunctionRconjunctions
	isInclude (R	isInclude"F
Conjunction7
entries (2.kentik.api.alerting.v0.EntryRentries"O
Entry
	dimension (	R	dimension
values (	Rvalues
not (Rnot"?
SubpoliciesMissingDimensionsj
requirements (2F.kentik.api.alerting.v0.SubpoliciesMissingDimensions.RequirementsEntryRrequirements{
RequirementsEntry
key (	RkeyP
value (2:.kentik.api.alerting.v0.SubpoliciesSingleFieldRequirementsRvalue:8"?
"SubpoliciesSingleFieldRequirements
required (	Rrequired^
alternatives (2:.kentik.api.alerting.v0.SubpoliciesRequirementsAlternativeRalternatives"8
"SubpoliciesRequirementsAlternative
dims (	RdimsBKZIgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertprotoJ?
  \

  

 

 `
	
 `
	
  *
	
 )
	
 ?


 
 


 


  

  

  	

  

 

 

 	

 

 

 

 

 

 $

 


 

 

 "#

 -

 

 (

 +,

 -

 

 (

 +,
?
 &t used in create/update flows to skip filter validation in favor of adding unavailable dimensions into parent policy


 

 !

 $%


 




 

 

 	

 





	




 




  

 


 

 

 













  "


 

 !%

 !


 !

 ! 

 !#$


$ &


$ 

 %

 %

 %

 %


( *


( 

 )

 )

 )

 )


, /


, 

 -

 -

 -

 -

.+

.

.&

.)*


1 3


1!

 2

 2

 2

 2


5 8


5 

 6

 6

 6	

 6

7

7

7	

7
	
	: $


	:!



< @



<
-

 >(  conjunctions are ored together



 >



 >


 >#


 >&'


?


?


?


?


B E


B
)
 D entries are anded together


 D


 D

 D

 D


G L


G

 H

 H

 H	

 H

I

I


I

I

I
 
K not negates entry


K

K


K


N P


N$

 OC

 O1

 O2>

 OAB


R W


R*
/
 T" All of those have to be present.


 T


 T

 T

 T
4
V?' One of those sets have to be present.


V


V-

V.:

V=>
[
Z \O this field is here only because protobuf doesn't understand arrays of arrays.



Z*

 [

 [


 [

 [

 [bproto3??  
?
7kentik/alerting/backend/v0/alertproto/suppression.protokentik.api.alerting.v0google/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto"?
Suppression
id (	B?A@RidE
creationTime (2.google.protobuf.TimestampB?A@RcreationTime
policyID (RpolicyIDt
dimensionToKeyPart (2;.kentik.api.alerting.v0.Suppression.DimensionToKeyPartEntryB?A:{}RdimensionToKeyPartD
type (20.kentik.api.alerting.v0.SuppressionDimensionTypeRtype
comment (	RcommentB
expirationTime (2.google.protobuf.TimestampRexpirationTimeE
DimensionToKeyPartEntry
key (	Rkey
value (	Rvalue:8"a
CreateSuppressionRequestE
suppression (2#.kentik.api.alerting.v0.SuppressionRsuppression"b
CreateSuppressionResponseE
suppression (2#.kentik.api.alerting.v0.SuppressionRsuppression"
ListSuppressionsRequest"c
ListSuppressionsResponseG
suppressions (2#.kentik.api.alerting.v0.SuppressionRsuppressions"*
DeleteSuppressionRequest
id (	Rid"+
DeleteSuppressionResponse
id (	Rid*N
SuppressionDimensionType
typeUnknown 
full
partial

policyBKZIgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertprotoJ?
  I

  

 

 `
	
 `
	
  )
	
 8


  


 

  	

  	

  	
(
  Full dimension must match


 

 	


  Partial matches


 	

 
U
 H Only policyID is matched (dimensions are not taken into consideration)


 

 


  3


 
#
   Read only attribute


  

  	

  

  

  ?
#
  Read only attribute


 

 (

 +,

 -

 ?
A
 "4 If set it will only be used with matching policies


 "

 "	

 "
?
 &*? dimensionToKeyPart describes a partial match of specific dimension values.
 For example, find all alarms with i_device_id = 1001.


 &

 &(

 &+,

 &-*

 ?')
"
 -$ Type of suppression


 -

 -

 -"#

 /

 /

 /	

 /
M
 2/@ Expiration time, if not set suppression will be active forever


 2

 2*

 2-.


5 7


5 

 6

 6

 6

 6


9 ;


9!

 :

 :

 :

 :
	
= "


=


? A


? 

 @(

 @


 @

 @#

 @&'


C E


C 

 D

 D

 D	

 D


G I


G!

 H

 H

 H	

 Hbproto3??  
?
;kentik/alerting/backend/v0/alertproto/mitigations/a10.proto"kentik.api.alerting.v0.mitigations"?
	TargetA10U
platform (29.kentik.api.alerting.v0.mitigations.MitigationPlatformA10RplatformO
method (27.kentik.api.alerting.v0.mitigations.MitigationMethodA10Rmethod
target (	Rtarget"?
MitigationPlatformA10
ip (	Rip
login (	Rlogin
password (	Rpassword.
deleteIfNotTracked (RdeleteIfNotTracked"?
MitigationMethodA10
priority (RpriorityT
static (2:.kentik.api.alerting.v0.mitigations.ConfigurationStaticA10H RstaticW
dynamic (2;.kentik.api.alerting.v0.mitigations.ConfigurationDynamicA10H RdynamicB
configuration"?
ConfigurationStaticA10~
bgpAnnounceViaNetworkStatement (26.kentik.api.alerting.v0.mitigations.AnnounceOptionsA10RbgpAnnounceViaNetworkStatement"?
ConfigurationDynamicA10
zoneName (	RzoneNamef
bgpAdvertiseInZone (26.kentik.api.alerting.v0.mitigations.AnnounceOptionsA10RbgpAdvertiseInZone~
bgpAnnounceViaNetworkStatement (26.kentik.api.alerting.v0.mitigations.AnnounceOptionsA10RbgpAnnounceViaNetworkStatementD
macros (2,.kentik.api.alerting.v0.mitigations.A10MacroRmacros"X
AnnounceOptionsA10
enabled (Renabled(
ensureAtLeast24 (RensureAtLeast24"?
A10MacroL
static (22.kentik.api.alerting.v0.mitigations.A10StaticMacroH RstaticR
baseline (24.kentik.api.alerting.v0.mitigations.A10BaselineMacroH RbaselineB
type"b
A10StaticMacro$
searchAnomaly (	RsearchAnomaly*
replacementValue (	RreplacementValue"?
A10BaselineMacro
policyID (RpolicyID$
searchAnomaly (	RsearchAnomaly.
baselineMultiplier (RbaselineMultiplier&
baselineOffset (RbaselineOffset4
baselineFallbackValue (RbaselineFallbackValueBWZUgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertproto/mitigationsJ?
  H

  

 +

 l
	
 l


  	


 

  %

  

   

  #$

 !

 

 

  
4
 ' target is an ip address or cidr block


 

 	

 


 




 

 

 	

 





	







	












 




 

 

 	

 

 

 

&



!

$%

(



#

&'


 




 8

 

 3

 67


 -



,
   zone name without kp- prefix.


  

  	

  
?
', advertise in zone
2w Notes on BGP:
 - bgpAdvertiseInZone and bgpAnnounceViaNetworkStatement are mutually exclusive
 - both can be disabled


'

''

'*+
1
*8$ or advertise via network statement


*

*3

*67

,

,


,

,

,


/ 2


/

 0

 0

 0

 0

1

1

1

1


4 9


4

 58

 5

 6

 6

 6

 6

7"

7

7

7 !


; >


;

 <

 <

 <	

 <

=

=

=	

=


@ H


@
A
 B4 if non-zero, use baseline data from another policy


 B

 B	

 B

D

D

D	

D

E

E

E

E

F

F

F

F

G"

G

G

G !bproto3??  
?P
@kentik/alerting/backend/v0/alertproto/mitigations/flowspec.proto"kentik.api.alerting.v0.mitigations"6
MitigationPlatformFlowspec
devices (Rdevices"?
MitigationMethodFlowspecY

destIpCidr (29.kentik.api.alerting.v0.mitigations.InferrableStringFieldR
destIpCidr]
sourceIpCidr (29.kentik.api.alerting.v0.mitigations.InferrableStringFieldRsourceIpCidr^
	protocols (2@.kentik.api.alerting.v0.mitigations.InferrableUint64FormulaFieldR	protocols\
dstPorts (2@.kentik.api.alerting.v0.mitigations.InferrableUint64FormulaFieldRdstPorts\
srcPorts (2@.kentik.api.alerting.v0.mitigations.InferrableUint64FormulaFieldRsrcPortsV
ports (2@.kentik.api.alerting.v0.mitigations.InferrableUint64FormulaFieldRportsV
	icmpTypes (28.kentik.api.alerting.v0.mitigations.IcmpTypeFormulaFieldR	icmpTypesT
	icmpCodes (26.kentik.api.alerting.v0.mitigations.Uint64FormulaFieldR	icmpCodesR
tcpFlags (26.kentik.api.alerting.v0.mitigations.Uint64FormulaFieldRtcpFlags\
packetLengths	 (26.kentik.api.alerting.v0.mitigations.Uint64FormulaFieldRpacketLengthsJ
dscps
 (24.kentik.api.alerting.v0.mitigations.DscpFormulaFieldRdscpsV
	fragments (28.kentik.api.alerting.v0.mitigations.FragmentFormulaFieldR	fragments
sample (Rsample
terminal (Rterminal\
	rateLimit (2<.kentik.api.alerting.v0.mitigations.FilteringActionRateLimitH R	rateLimitV
discard (2:.kentik.api.alerting.v0.mitigations.FilteringActionDiscardH RdiscardY
markDSCP (2;.kentik.api.alerting.v0.mitigations.FilteringActionMarkDSCPH RmarkDSCPz
routeTargetRedirect (2F.kentik.api.alerting.v0.mitigations.FilteringActionRedirectRouteTargetH RrouteTargetRedirectn
nextHopRedirect (2B.kentik.api.alerting.v0.mitigations.FilteringActionRedirectNextHopH RnextHopRedirectB
action":
FilteringActionRateLimit

limitValue (R
limitValue"
FilteringActionDiscard"-
FilteringActionMarkDSCP
mark (Rmark"F
"FilteringActionRedirectRouteTarget 
routeTarget (	RrouteTarget"\
FilteringActionRedirectNextHop
	nextHopV4 (	R	nextHopV4
	nextHopV6 (	R	nextHopV6"_
InferrableStringField
value (	Rvalue
infer (Rinfer
disabled (Rdisabled"?
InferrableUint64FormulaFieldG
value (21.kentik.api.alerting.v0.mitigations.Uint64FormulaRvalue
infer (Rinfer
disabled (Rdisabled"y
Uint64FormulaFieldG
value (21.kentik.api.alerting.v0.mitigations.Uint64FormulaRvalue
disabled (Rdisabled"?
Uint64FormulaS

predicates (23.kentik.api.alerting.v0.mitigations.Uint64PredicateR
predicatesG
groups (2/.kentik.api.alerting.v0.mitigations.Uint64GroupRgroups"z
Uint64PredicateQ
operator (25.kentik.api.alerting.v0.mitigations.PredicateOperatorRoperator
value (Rvalue"b
Uint64GroupS

predicates (23.kentik.api.alerting.v0.mitigations.Uint64PredicateR
predicates"?
TargetFlowspecZ
platform (2>.kentik.api.alerting.v0.mitigations.MitigationPlatformFlowspecRplatformT
method (2<.kentik.api.alerting.v0.mitigations.MitigationMethodFlowspecRmethod
target (	Rtarget"|
IcmpTypePredicateQ
operator (25.kentik.api.alerting.v0.mitigations.PredicateOperatorRoperator
value (Rvalue"f
IcmpTypeGroupU

predicates (25.kentik.api.alerting.v0.mitigations.IcmpTypePredicateR
predicates"}
IcmpTypeFormulaFieldI
value (23.kentik.api.alerting.v0.mitigations.IcmpTypeFormulaRvalue
disabled (Rdisabled"?
IcmpTypeFormulaU

predicates (25.kentik.api.alerting.v0.mitigations.IcmpTypePredicateR
predicatesI
groups (21.kentik.api.alerting.v0.mitigations.IcmpTypeGroupRgroups"x
DscpPredicateQ
operator (25.kentik.api.alerting.v0.mitigations.PredicateOperatorRoperator
value (Rvalue"^
	DscpGroupQ

predicates (21.kentik.api.alerting.v0.mitigations.DscpPredicateR
predicates"u
DscpFormulaFieldE
value (2/.kentik.api.alerting.v0.mitigations.DscpFormulaRvalue
disabled (Rdisabled"?
DscpFormulaQ

predicates (21.kentik.api.alerting.v0.mitigations.DscpPredicateR
predicatesE
groups (2-.kentik.api.alerting.v0.mitigations.DscpGroupRgroups"|
FragmentPredicateQ
operator (25.kentik.api.alerting.v0.mitigations.PredicateOperatorRoperator
value (Rvalue"f
FragmentGroupU

predicates (25.kentik.api.alerting.v0.mitigations.FragmentPredicateR
predicates"}
FragmentFormulaFieldI
value (23.kentik.api.alerting.v0.mitigations.FragmentFormulaRvalue
disabled (Rdisabled"?
FragmentFormulaU

predicates (25.kentik.api.alerting.v0.mitigations.FragmentPredicateR
predicatesI
groups (21.kentik.api.alerting.v0.mitigations.FragmentGroupRgroups*?
PredicateOperator
unknown 

equals
	notEquals
lessThan
greaterThan
lessThanOrEquals
greaterThanOrEqualsBWZUgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertproto/mitigationsJ?*
  ?

  

 +

 l
	
 l


  


 "
G
  : devices is a list of devices constituting this platform.


  


  

  

  


	 "


	 

 
'

 


 
"

 
%&

)



$

'(

-



(

+,

,



'

*+

,



'

*+

*



$

')

%



 

#$

#





!"

"





 !

	'

	

	"

	%&













&



 

#%

















 !

 

,



&

)+

(



"

%'

*



$

')

@

&

':

=?

 8

 "

 #2

 57


$ '


$ 
I
 &< limitValue sets throttling threshold. In bytes per second.


 &

 &	

 &
	
) !


)


+ -


+
e
 ,"X DSCP as defined in rfc 2474 and rfc 5575 (single byte, 6 least significant bits: dscp)


 ,

 ,	

 ,


/ 1


/*

 0

 0

 0	

 0


3 6


3&

 4

 4

 4	

 4

5

5

5	

5


8 <


8

 9

 9

 9	

 9

:

:

:

:

;

;

;

;


> B


>$

 ?

 ?

 ?

 ?

@

@

@

@

A

A

A

A


	D G


	D

	 E

	 E

	 E

	 E

	F

	F

	F

	F



I L



I


 J*


 J



 J


 J%


 J()


K"


K



K


K


K !


 N V


 N

  O

  O	

  O

 P

 P

 P

 Q

 Q

 Q

 R

 R


 R

 S

 S

 S

 T

 T

 T

 U

 U

 U
;
X ]"/ TODO(tjonak): unify with operators in filters



X

 [!

 [

 [

 [ 

\

\

\	

\


_ a


_

 `*

 `


 `

 `%

 `()


c l


c

 d*

 d

 d%

 d()

e&

e

e!

e$%
?
k? target is an ip address or cidr block
 TODO(tjonak): when we switch to non ip based flowspec mitigations
 this field is gonna be meaningless, superseeded by contents of MitigationMethod
 should this target support usage of preexisting platforms/methods?
 prolly yes


k

k	

k


m p


m

 n!

 n

 n

 n 
.
o"! ICMP Type as defined in rfc 792


o

o	

o


r t


r

 s,

 s


 s

 s'

 s*+


v y


v

 w

 w

 w

 w

x

x

x

x


{ ~


{

 |,

 |


 |

 |'

 |*+

}$

}


}

}

}"#

? ?

?

 ?!

 ?

 ?

 ? 
f
?"X DSCP as defined in rfc 2474 and rfc 5575 (single byte, 6 least significant bits: dscp)


?

?	

?

? ?

?

 ?(

 ?


 ?

 ?#

 ?&'

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

? ?

?

 ?(

 ?


 ?

 ?#

 ?&'

? 

?


?

?

?

? ?

?

 ?!

 ?

 ?

 ? 
C
?"5 bitmask as defined in rfc 5575 "Type 12 - Fragment"


?

?	

?

? ?

?

 ?,

 ?


 ?

 ?'

 ?*+

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

? ?

?

 ?,

 ?


 ?

 ?'

 ?*+

?$

?


?

?

?"#bproto3??  
?
?kentik/alerting/backend/v0/alertproto/mitigations/radware.proto"kentik.api.alerting.v0.mitigations"?
MitigationMethodRadwarei
protocol (2M.kentik.api.alerting.v0.mitigations.MitigationMethodRadware.TransportProtocolRprotocol0
protectedObjectName (	RprotectedObjectName*
convertTo24Block (RconvertTo24Block.
useProtocolFromDim
 (RuseProtocolFromDimh
	icmpBytes (2J.kentik.api.alerting.v0.mitigations.MitigationMethodRadware.BaselinePolicyR	icmpBytesl
icmpPackets (2J.kentik.api.alerting.v0.mitigations.MitigationMethodRadware.BaselinePolicyRicmpPacketsf
tcpBytes (2J.kentik.api.alerting.v0.mitigations.MitigationMethodRadware.BaselinePolicyRtcpBytesj

tcpPackets (2J.kentik.api.alerting.v0.mitigations.MitigationMethodRadware.BaselinePolicyR
tcpPacketsf
udpBytes (2J.kentik.api.alerting.v0.mitigations.MitigationMethodRadware.BaselinePolicyRudpBytesj

udpPackets	 (2J.kentik.api.alerting.v0.mitigations.MitigationMethodRadware.BaselinePolicyR
udpPackets,
BaselinePolicy
policyID (RpolicyID"D
TransportProtocol
none 
tcp
udp
icmp	
other"?
MitigationPlatformRadware
ip (	Rip
login (	Rlogin
password (	Rpassword.
deleteIfNotTracked (RdeleteIfNotTracked"?
TargetRadwareY
platform (2=.kentik.api.alerting.v0.mitigations.MitigationPlatformRadwareRplatformS
method (2;.kentik.api.alerting.v0.mitigations.MitigationMethodRadwareRmethod
target (	RtargetBWZUgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertproto/mitigationsJ?
  7

  

 +

 l
	
 l


  $


 

  

  

   

   

   

  

  

  


  

  

  


  	

  	

  	

  


  
	

  


  !

  

  

   
/
 "" protectedObjectName is optional.


 

 	

 !

 

 

 

 
j
 ] useProtocolFromDim permits derivation of protocol from alert dimension when it's available.


 

 

 
#
   mitigationBaselines


  


   

   


   

   

 

 

 

 

 !

 

 

  

 

 

 

 

   

  

  

  

 "

 "

 "

 "

 	# 

 	#

 	#

 	#


& -


&!

 '

 '

 '	

 '

(

(

(	

(

)

)

)	

)
Y
,L deleteIfNotTracked removes ip from radware if it is not tracked by Kentik.


,

,

,


/ 7


/

 0)

 0

 0$

 0'(

1%

1

1 

1#$
i
6( target is an ip address or cidr block.
22 TODO(tjonak): extract that to manual mit create?


6

6	

6bproto3??  
?
<kentik/alerting/backend/v0/alertproto/mitigations/rtbh.proto"kentik.api.alerting.v0.mitigations"2
MitigationPlatformRTBH
devices (Rdevices"<
BGPCommunity
asn (Rasn
internal (Rinternal"?
MitigationMethodRTBHh
communitiesToAdvertise (20.kentik.api.alerting.v0.mitigations.BGPCommunityRcommunitiesToAdvertise
	nextHopV4 (	R	nextHopV4
	nextHopV6 (	R	nextHopV6(
localPreference (RlocalPreference*
convertTo24Block (RconvertTo24Block"?

TargetRTBHV
platform (2:.kentik.api.alerting.v0.mitigations.MitigationPlatformRTBHRplatformP
method (28.kentik.api.alerting.v0.mitigations.MitigationMethodRTBHRmethod
target (	RtargetBWZUgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertproto/mitigationsJ?
  

  

 +

 l
	
 l


  


 
G
  : devices is a list of devices constituting this platform.


  


  

  

  


	 


	

 


 


 
	

 






	




 




 3

 


 

 .

 12





	







	







	












 




 &

 

 !

 $%

"





 !
4
' target is an ip address or cidr block




	

bproto3??  
?
<kentik/alerting/backend/v0/alertproto/mitigations/cfmt.proto"kentik.api.alerting.v0.mitigations"
MitigationMethodCFMT"t
MitigationPlatformCFMT
	accountID (	R	accountID
apiLogin (	RapiLogin 
apiPassword (	RapiPassword"?

TargetCFMTV
platform (2:.kentik.api.alerting.v0.mitigations.MitigationPlatformCFMTRplatformP
method (28.kentik.api.alerting.v0.mitigations.MitigationMethodCFMTRmethod
target (	RtargetBWZUgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertproto/mitigationsJ?
  

  

 +

 l
	
 l


  


 


 




 

 


 

 

	

	


	

	















 




 (

 

 #

 &'

$





"#
g
Z TODO(tjonak): extract that to manual mit create?
 target is an ip address or cidr block.







bproto3??  
?/
>kentik/alerting/backend/v0/alertproto/mitigations/method.proto"kentik.api.alerting.v0.mitigationsgoogle/protobuf/duration.proto google/protobuf/field_mask.protogoogle/protobuf/timestamp.proto=kentik/alerting/backend/v0/alertproto/mitigations/types.proto;kentik/alerting/backend/v0/alertproto/mitigations/a10.proto@kentik/alerting/backend/v0/alertproto/mitigations/flowspec.proto?kentik/alerting/backend/v0/alertproto/mitigations/radware.proto<kentik/alerting/backend/v0/alertproto/mitigations/rtbh.proto<kentik/alerting/backend/v0/alertproto/mitigations/cfmt.proto"?
Method
id (Rid
name (	Rname 
description (	Rdescription2
notificationChannels (RnotificationChannelsK
a10 (27.kentik.api.alerting.v0.mitigations.MitigationMethodA10H Ra10Z
flowspec (2<.kentik.api.alerting.v0.mitigations.MitigationMethodFlowspecH RflowspecW
radware (2;.kentik.api.alerting.v0.mitigations.MitigationMethodRadwareH RradwareN
rtbh (28.kentik.api.alerting.v0.mitigations.MitigationMethodRTBHH RrtbhN
cfmt (28.kentik.api.alerting.v0.mitigations.MitigationMethodCFMTH Rcfmt 
ackRequired (RackRequired(
excludedIpCidrs	 (	RexcludedIpCidrs;
gracePeriod
 (2.google.protobuf.DurationRgracePeriod>
creationTime (2.google.protobuf.TimestampRcreationTime>
lastEditTime (2.google.protobuf.TimestampRlastEditTimeB
method""
MethodGetRequest
id (Rid"?
MethodListRequest
methods (Rmethods
names (	Rnames>
types (2(.kentik.api.alerting.v0.mitigations.TypeRtypes<
createStart (2.google.protobuf.TimestampRcreateStart8
	createEnd (2.google.protobuf.TimestampR	createEnd<
modifyStart (2.google.protobuf.TimestampRmodifyStart8
	modifyEnd (2.google.protobuf.TimestampR	modifyEnd
limit (Rlimit
offset (Roffset"p
MethodListResponseD
methods (2*.kentik.api.alerting.v0.mitigations.MethodRmethods
count (Rcount"?
MethodUpdateRequestB
method (2*.kentik.api.alerting.v0.mitigations.MethodRmethod:

updateMask (2.google.protobuf.FieldMaskR
updateMask"Z
MethodUpdateResponseB
method (2*.kentik.api.alerting.v0.mitigations.MethodRmethod"%
MethodDeleteRequest
id (Rid"
MethodDeleteResponseBWZUgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertproto/mitigationsJ?
  i

  

 +

 l
	
 l
	
  (
	
 *
	
 )
	
 G
	
	 E
	

 J
	
 I
	
 F
	
 F
<
  20 Method specifies mitigation handling behavior.



 
,
   id of this migitation method.


  

  


  
)
  name of mitigation method.


 

 	

 
0
 # description of mitigation method.


 

 	

 
J
 += notificationChannels is a list of notification channel ids.


 


 

 &

 )*
;
   - method specifies type of mitigation method.


  

  

 

 

 

 *

 

 %

 ()

 (

 

 #

 &'

 "

 

 

  !

 #

 

 

  "
h
 	#[ ackRequired denotes whether mitigation requires ack. Works only in automatic mitigations.


 	#

 	#

 	#
z
 
&&m excludedIpCidrs is a list of ips or blocks which are never mitigatied. Works only in automatic mitigations.


 
&


 
&

 
&!

 
&$%
p
 ),c gracePeriod defines grace period for this mitigation method. Works only in automatic mitigations.


 )

 )&

 ))+
?
 -.} creationTime denotes method creation time. Read only parameter.
 Setting this value in create/update request has no effect.


 -

 -(

 -+-
v
 1.i lastEditTime denotes last method edit time.
 Setting this value in create/update request has no effect.


 1

 1(

 1+-


4 6


4

 5

 5

 5


 5


8 S


8
<
 :/ ids of methods you want included in response.


 :


 :

 :

 :
_
<R names of methods you want included in response. Regex matching is not supported.


<


<

<

<
>
>1 types of methods you want included in response.


>


>

>

>
j
A,] createStart narrows results to platforms created no sooner than this timestamp (inclusive).


A

A'

A*+
g
D*Z createEnd narrows results to platforms created no later than this timestamp (inclusive).


D

D%

D()
i
G,\ modifyStart narrows results to platforms edited no sooner than this timestamp (inclusive).


G

G'

G*+
f
J*Y modifyEnd narrows results to platforms edited no later than this timestamp (inclusive).


J

J%

J()
I
N< limit of entries returned.
 Pseudocode: platforms[:limit].


N

N	

N
b
RU offset at which start pulling results.
 Pseudocode: platforms[offset:offset+limit].


R

R	

R


U Z


U

 V

 V


 V

 V

 V
_
YR count of entries matching filter terms, limit/offset are not taken into account.


Y

Y	

Y


\ _


\

 ]

 ]

 ]	

 ]

^+

^

^&

^)*


a c


a

 b

 b

 b	

 b


e g


e

 f

 f

 f


 f
	
i 


ibproto3??  
?+
@kentik/alerting/backend/v0/alertproto/mitigations/platform.proto"kentik.api.alerting.v0.mitigations google/protobuf/field_mask.protogoogle/protobuf/timestamp.proto=kentik/alerting/backend/v0/alertproto/mitigations/types.proto;kentik/alerting/backend/v0/alertproto/mitigations/a10.proto@kentik/alerting/backend/v0/alertproto/mitigations/flowspec.proto?kentik/alerting/backend/v0/alertproto/mitigations/radware.proto<kentik/alerting/backend/v0/alertproto/mitigations/rtbh.proto<kentik/alerting/backend/v0/alertproto/mitigations/cfmt.proto"?
Platform
id (Rid
name (	Rname 
description (	RdescriptionM
a10 (29.kentik.api.alerting.v0.mitigations.MitigationPlatformA10H Ra10\
flowspec (2>.kentik.api.alerting.v0.mitigations.MitigationPlatformFlowspecH RflowspecY
radware (2=.kentik.api.alerting.v0.mitigations.MitigationPlatformRadwareH RradwareP
rtbh (2:.kentik.api.alerting.v0.mitigations.MitigationPlatformRTBHH RrtbhP
cfmt (2:.kentik.api.alerting.v0.mitigations.MitigationPlatformCFMTH Rcfmt,
mitigationMethods	 (RmitigationMethods>
creationTime (2.google.protobuf.TimestampRcreationTime>
lastEditTime (2.google.protobuf.TimestampRlastEditTimeB

platform"$
PlatformGetRequest
id (Rid"?
PlatformListRequest
	platforms (R	platforms
names (	Rnames>
types (2(.kentik.api.alerting.v0.mitigations.TypeRtypes<
createStart (2.google.protobuf.TimestampRcreateStart8
	createEnd (2.google.protobuf.TimestampR	createEnd<
modifyStart (2.google.protobuf.TimestampRmodifyStart8
	modifyEnd (2.google.protobuf.TimestampR	modifyEnd
limit (Rlimit
offset (Roffset"x
PlatformListResponseJ
	platforms (2,.kentik.api.alerting.v0.mitigations.PlatformR	platforms
count (Rcount"?
PlatformUpdateRequestH
platform (2,.kentik.api.alerting.v0.mitigations.PlatformRplatform:

updateMask (2.google.protobuf.FieldMaskR
updateMask"b
PlatformUpdateResponseH
platform (2,.kentik.api.alerting.v0.mitigations.PlatformRplatform"'
PlatformDeleteRequest
id (Rid"
PlatformDeleteResponseBWZUgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertproto/mitigationsJ?
  `!

  

 +

 l
	
 l
	
  *
	
 )
	
 G
	
 E
	
	 J
	

 I
	
 F
	
 F
h
  )\ MitigationPlatform encapsulates set of devices used to apply associated mitigation method.



 
.
  ! id of this migitation platform.


  

  


  
+
  name of mitigation platform.


 

 	

 
2
 % description of mitigation platform.


 

 	

 
@
  2 platform specifies type of mitigaition platform.


  

 .

 %

 &)

 ,-

 8

 *

 +3

 67

 6

 )

 *1

 45

 0

 &

 '+

 ./

 0

 &

 '+

 ./
[
  (N mitigationMethods is a list of mitigation methods attached to this platform.


  


  

  #

  &'
?
 	$. creationTime denotes platform creation time. Read only parameter.
 Setting this value in create/update request has no effect.


 	$

 	$(

 	$+-
x
 
(.k lastEditTime denotes last platform edit time.
 Setting this value in create/update request has no effect.


 
(

 
((

 
(+-


+ -


+

 ,

 ,

 ,


 ,


/ J


/
>
 11 ids of platforms you want included in response.


 1


 1

 1

 1
a
3T names of platforms you want included in response. Regex matching is not supported.


3


3

3

3
@
53 types of platforms you want included in response.


5


5

5

5
j
8,] createStart narrows results to platforms created no sooner than this timestamp (inclusive).


8

8'

8*+
g
;*Z createEnd narrows results to platforms created no later than this timestamp (inclusive).


;

;%

;()
i
>,\ modifyStart narrows results to platforms edited no sooner than this timestamp (inclusive).


>

>'

>*+
f
A*Y modifyEnd narrows results to platforms edited no later than this timestamp (inclusive).


A

A%

A()
I
E< limit of entries returned.
 Pseudocode: platforms[:limit].


E

E	

E
b
IU offset at which start pulling results.
 Pseudocode: platforms[offset:offset+limit].


I

I	

I


L Q


L

 M"

 M


 M

 M

 M !
_
PR count of entries matching filter terms, limit/offset are not taken into account.


P

P	

P


S V


S

 T

 T


 T

 T

U+

U

U&

U)*


X Z


X

 Y

 Y


 Y

 Y


\ ^


\

 ]

 ]

 ]


 ]
	
` !


`bproto3??  
??
1kentik/alerting/backend/v0/alertproto/alert.protokentik.api.alerting.v0google/api/annotations.protogoogle/protobuf/empty.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto2kentik/alerting/backend/v0/alertproto/alarms.proto4kentik/alerting/backend/v0/alertproto/baseline.proto4kentik/alerting/backend/v0/alertproto/insights.proto6kentik/alerting/backend/v0/alertproto/mitigation.proto2kentik/alerting/backend/v0/alertproto/policy.proto5kentik/alerting/backend/v0/alertproto/subpolicy.proto2kentik/alerting/backend/v0/alertproto/filter.proto7kentik/alerting/backend/v0/alertproto/suppression.proto>kentik/alerting/backend/v0/alertproto/mitigations/method.proto@kentik/alerting/backend/v0/alertproto/mitigations/platform.proto2?
Alarms?
List%.kentik.api.alerting.v0.AlarmsRequest&.kentik.api.alerting.v0.AlarmsResponse"??A?List alarms.pReturns a list of alarms, filterable by attributes including time, severity, state, dimensions, and mitigations.*	AlarmList????	/alarms?
GetCompanyAlarms%.kentik.api.alerting.v0.AlarmsRequest&.kentik.api.alerting.v0.AlarmsResponse"r?AV!Deprecated in favor of AlarmList."Returns [filtered] list of alarms.*AlarmSearchX????"/alarms:search:*?
Get'.kentik.api.alerting.v0.AlarmGetRequest(.kentik.api.alerting.v0.AlarmGetResponse"??A?Get information about an alarm.?Returns information about the alarm specified with alarmID, including attributes such as time, severity, state, dimensions, and mitigations.*AlarmGet????/alarms/{id}u
GetCompanyAlarmDetails+.kentik.api.alerting.v0.AlarmDetailsRequest,.kentik.api.alerting.v0.AlarmDetailsResponse" ?
Ack'.kentik.api.alerting.v0.AlarmAckRequest(.kentik.api.alerting.v0.AlarmAckResponse"??A?Acknowledge an alarm.?Acknowledges an alarm whose alert policy is set to Acknowledgement Required. When the alert leaves ALARM state the alarm won't be fully cleared until it is acknowledged.*AlarmAck????"/alarms/{id}/ack:*?
 GetAlarmBaselineExplanationGraph<.kentik.api.alerting.v0.AlarmBaselineExplanationGraphRequest8.kentik.api.alerting.v0.BaselineExplanationGraphResponse"y?AR7Returns baseline data for the alarm. Internal endpoint. *AlarmBaselineExplain????"/alarms/{alarmID}/explain:*??2?
Subpolicies?
List..kentik.api.alerting.v0.SubpoliciesListRequest/.kentik.api.alerting.v0.SubpoliciesListResponse"?????|/subpoliciesZ"/subpolicies:search:*Z#!/policies/{parentIDs}/subpoliciesZ-"(/policies/{parentIDs}/subpolicies:search:*?
Create0.kentik.api.alerting.v0.SubpoliciesCreateRequest0.kentik.api.alerting.v0.SubpolciesCreateResponse"5????/"*/policies/{subpolicy.parentID}/subpolicies:*?
Get-.kentik.api.alerting.v0.SubpoliciesGetRequest!.kentik.api.alerting.v0.Subpolicy"-????'%/policies/{parentID}/subpolicies/{id}?
Update0.kentik.api.alerting.v0.SubpoliciesUpdateRequest1.kentik.api.alerting.v0.SubpoliciesUpdateResponse"L????F29/policies/{subpolicy.parentID}/subpolicies/{subpolicy.id}:	subpolicy?
Delete0.kentik.api.alerting.v0.SubpoliciesDeleteRequest1.kentik.api.alerting.v0.SubpoliciesDeleteResponse"-????'*%/policies/{parentID}/subpolicies/{id}??2?$
Policies?
List+.kentik.api.alerting.v0.PolicySearchRequest,.kentik.api.alerting.v0.PolicySearchResponse"??A?List alert policies.?Returns a list of your organization’s currently enabled alert policies, filterable by attributes such as time, IDs, thresholds, alarms, users, and dimensions.*
PolicyList????	/policies?
Create.kentik.api.alerting.v0.Policy.kentik.api.alerting.v0.Policy"??A?Create an alert policy.?Creates a new alert policy with the specified attributes, including name, description, and settings such as dimensions, filters, metrics, thresholds, and baseline.*PolicyCreate????"	/policies:*?
Get(.kentik.api.alerting.v0.PolicyGetRequest.kentik.api.alerting.v0.Policy"??A?Get information about a policy.?Returns information about the alert policy specified with policyId, including attributes such as name, description, and the properties set when the policy was created or updated.*	PolicyGet????/policies/{id}?
Search+.kentik.api.alerting.v0.PolicySearchRequest,.kentik.api.alerting.v0.PolicySearchResponse"U?A7"Deprecated in favor of PolicyList. *PolicySearchX????"/policies:search:*?
Update+.kentik.api.alerting.v0.PolicyUpdateRequest.kentik.api.alerting.v0.Policy"??AdUpdate an alert policy.;Updates the settings of the alert policy specified with id.*PolicyUpdate????2/policies/{policy.id}:policy?
Delete+.kentik.api.alerting.v0.PolicyDeleteRequest.google.protobuf.Empty"m?ATDelete an alert policy.+Deletes the alert policy specified with id.*PolicyDelete????*/policies/{id}?
Enable+.kentik.api.alerting.v0.PolicyEnableRequest,.kentik.api.alerting.v0.PolicyEnableResponse"?A\Enable an alert policy.3Activates the alert policy specified with policyId.*PolicyEnable????"/policies/{id}/enable:*?
Disable,.kentik.api.alerting.v0.PolicyDisableRequest-.kentik.api.alerting.v0.PolicyDisableResponse"??A?Disable an alert policy.xDeactivates the alert policy specified with policyId. The policy will not be removed and can be reactivated at any time.*PolicyDisable????"/policies/{id}/disable:*?
Mute).kentik.api.alerting.v0.PolicyMuteRequest*.kentik.api.alerting.v0.PolicyMuteResponse"??A?'Place an alert policy into silent mode.?Temporarily mutes the alarms (and therefore mitigations) that would otherwise be triggered on traffic matching the conditions in an alert threshold.*
PolicyMute????"/policies/{id}/mute:*?
Unmute+.kentik.api.alerting.v0.PolicyUnmuteRequest,.kentik.api.alerting.v0.PolicyUnmuteResponse"o?ALExit silent mode.)Takes an alert policy out of silent mode.*PolicyUnmute????"/policies/{id}/unmute:*?
MigrateFields2.kentik.api.alerting.v0.PolicyMigrateFieldsRequest3.kentik.api.alerting.v0.PolicyMigrateFieldsResponse"p?AEInternal endpoint.Update field/column names.*PolicyMigrateFields????""/policies/{id}/migrate:fields:*?
GetSupportedDimensions2.kentik.api.alerting.v0.SupportedDimensionsRequest3.kentik.api.alerting.v0.SupportedDimensionsResponse"??A?
UtilityList supported dimensions.?Returns a list of the dimensions supported in your environment. Results will vary depending on your organization’s custom dimensions.*DimensionList????/dimensions/supported?
GetSupportedMetrics/.kentik.api.alerting.v0.SupportedMetricsRequest0.kentik.api.alerting.v0.SupportedMetricsResponse"??Al
UtilityList supported metrics.<Returns a list of the metrics supported in your environment.*
MetricList????/metrics/supported?
GetDimensionDisplayNames4.kentik.api.alerting.v0.DimensionDisplayNamesRequest5.kentik.api.alerting.v0.DimensionDisplayNamesResponse"??A?
UtilityList dimension display names.DReturns a list showing the display name of each supported dimension.*DimensionListNames????/dimensions/display?
GetAllActive1.kentik.api.alerting.v0.PolicyGetAllActiveRequest2.kentik.api.alerting.v0.PolicyGetAllActiveResponse"!????/internal/policies/active?
ExplainPolicyBaselineEntries;.kentik.api.alerting.v0.ExplainPolicyBaselineEntriesRequest<.kentik.api.alerting.v0.ExplainPolicyBaselineEntriesResponse"'????!/policies/{id}/explain/baseline?
ExplainPolicyCurrentEntries:.kentik.api.alerting.v0.ExplainPolicyCurrentEntriesRequest;.kentik.api.alerting.v0.ExplainPolicyCurrentEntriesResponse"&???? /policies/{id}/explain/current?
ExplainPolicyGraph1.kentik.api.alerting.v0.ExplainPolicyGraphRequest2.kentik.api.alerting.v0.ExplainPolicyGraphResponse"c?A9Internal endpoint$Explain data for policy debug graphs????!"/policies/{id}/explain/graph:*??2?
Suppressions?
CreateSuppression0.kentik.api.alerting.v0.CreateSuppressionRequest1.kentik.api.alerting.v0.CreateSuppressionResponse"??A?5Place a specific key or set of keys into silent mode.?Temporarily suppresses the alarms (and therefore mitigations) that would otherwise be triggered on traffic matching the conditions in an alert threshold.*CreateSuppression????"/suppressions:*?
ListSuppressions/.kentik.api.alerting.v0.ListSuppressionsRequest0.kentik.api.alerting.v0.ListSuppressionsResponse"\?AD0List the alarm suppressions currently in effect.*ListSuppressions????/suppressions?
DeleteSuppression0.kentik.api.alerting.v0.DeleteSuppressionRequest1.kentik.api.alerting.v0.DeleteSuppressionResponse"G?A*Delete a suppression.*DeleteSuppression????*/suppressions/{id}??2?
Baseline?
CreateBaselineBackfillJob2.kentik.api.alerting.v0.BaselineBackfillJobRequest3.kentik.api.alerting.v0.BaselineBackfillJobResponse"Z?A50Create baseline backfill job. Internal endpoint. ????"/baseline/backfill/jobs:*?
ListBaselineBackfillJobs3.kentik.api.alerting.v0.BaselineBackfillJobsRequest4.kentik.api.alerting.v0.BaselineBackfillJobsResponse"C?A!List baseline backfill jobs. ????/baseline/backfill/jobs?
GetBaselineBackfillJob2.kentik.api.alerting.v0.BaselineBackfillJobRequest3.kentik.api.alerting.v0.BaselineBackfillJobResponse"F?AGet baseline backfill job. ????/baseline/backfill/jobs/{id}?
ListBaselineSlots,.kentik.api.alerting.v0.BaselineSlotsRequest-.kentik.api.alerting.v0.BaselineSlotsResponse"c?A7Find baseline slots.Returns list of baseline slots.????#!/baseline/policy/{policyID}/slots?
DeleteBaselineSlot1.kentik.api.alerting.v0.DeleteBaselineSlotRequest-.kentik.api.alerting.v0.BaselineSlotsResponse"F?ADelete baseline slot. ????#*!/baseline/policy/{policyID}/slots?
DeleteBaselineEntry2.kentik.api.alerting.v0.DeleteBaselineEntryRequest-.kentik.api.alerting.v0.BaselineSlotsResponse"K?ADelete a baseline entry. ????%*#/baseline/policy/{policyID}/entries?
GetBaselineExplanationGraph7.kentik.api.alerting.v0.BaselineExplanationGraphRequest8.kentik.api.alerting.v0.BaselineExplanationGraphResponse"E?A% Get baseline explaination graph. ????"/baselines/explain:*?
RetryBaselineBackfillJobs8.kentik.api.alerting.v0.RetryBaselineBackfillJobsRequest9.kentik.api.alerting.v0.RetryBaselineBackfillJobsResponse"W?A#Internal endpoint. Look up all ????+"&/internal/baseline/backfill/jobs:retry:*??2?
Mitigations?
List..kentik.api.alerting.v0.MitigationsListRequest/.kentik.api.alerting.v0.MitigationsListResponse"??A?List mitigations.?Returns a list of your organization’s currently active mitigations, filterable by attributes such as time, policy, state, platform, and type.*MitigateList????/mitigations?
Create0.kentik.api.alerting.v0.MitigationsCreateRequest1.kentik.api.alerting.v0.MitigationsCreateResponse"??A?Create a manual mitigation.?Starts a new manual mitigation on a specified IP/CIDR using a specified mitigation platform and method.
**Note:** Mitigation creation may take up to one minute after this call returns.*MitigateCreate????"/mitigations:*?
Get-.kentik.api.alerting.v0.MitigationsGetRequest".kentik.api.alerting.v0.Mitigation"??A?#Get information about a mitigation.~Returns information about the mitigation specified with mitID, including attributes such as time, state, method, and platform.*MitigateGet????/mitigations/{id}?
Act0.kentik.api.alerting.v0.MitigationsActionRequest1.kentik.api.alerting.v0.MitigationsActionResponse"??A?Perform a mitigation action.?Mitigation actions force a change in mitigation state (e.g. from ACK_REQ to MANUAL_CLEAR). This method executes the specified action.
**Note:** To get available actions use GET /mitigations/actions*MitigateAct????"/mitigations/{id}/{action}:*?
AvailableActions:.kentik.api.alerting.v0.MitigationsAvailableActionsRequest;.kentik.api.alerting.v0.MitigationsAvailableActionsResponse"??A? List available actions by state.?The state of a mitigation (STARTING, MITIGATING, CLEARING, etc.) determines both the actions that are available and the mitigation's post-action state. This call returns a list of the actions available when in each state.*MitigateAvailableActions????/mitigations/actions?
Pump..kentik.api.alerting.v0.MitigationsPumpRequest/.kentik.api.alerting.v0.MitigationsPumpResponse"????"/mitigations/pump:*??2?
MitigationMethods?
List5.kentik.api.alerting.v0.mitigations.MethodListRequest6.kentik.api.alerting.v0.mitigations.MethodListResponse"??A?
Mitigation MethodsList mitigation methods.uReturns a list of your organization’s currently enabled mitigation methods, filterable by attributes such as [TBD].*MitigationMethodList????/mitigations/methods?
Create*.kentik.api.alerting.v0.mitigations.Method*.kentik.api.alerting.v0.mitigations.Method"??A?
Mitigation MethodsCreate a mitigation method.?Creates a new mitigation method with the specified attributes, including name, description, and type (e.g. RTBH, Flowspec, Radware, or A10) as well as grace period, excluded IPs, and acknowledgement.*MitigationMethodCreate????"/mitigations/methods:*?
Get4.kentik.api.alerting.v0.mitigations.MethodGetRequest*.kentik.api.alerting.v0.mitigations.Method"??A?
Mitigation Methods*Get information about a mitigation method.?Returns information about the mitigation method specified with methodId, including attributes such as name, description, platform, grace period, excluded IPs, and acknowledgement.*MitigationMethodGet????/mitigations/methods/{id}?
Update7.kentik.api.alerting.v0.mitigations.MethodUpdateRequest8.kentik.api.alerting.v0.mitigations.MethodUpdateResponse"??A?
Mitigation MethodsUpdate a mitigation method.BUpdates the attributes of the mitigation method specified with id.*MitigationMethodUpdate????*2 /mitigations/methods/{method.id}:method?
Delete7.kentik.api.alerting.v0.mitigations.MethodDeleteRequest8.kentik.api.alerting.v0.mitigations.MethodDeleteResponse"??A{
Mitigation MethodsDelete a mitigation method.0Deletes the mitigation method specified with id.*MitigationMethodDelete????*/mitigations/methods/{id}??2?
MitigationPlatforms?
List7.kentik.api.alerting.v0.mitigations.PlatformListRequest8.kentik.api.alerting.v0.mitigations.PlatformListResponse"??A?
Mitigation PlatformsList mitigation platforms.wReturns a list of your organization’s currently enabled mitigation platforms, filterable by attributes such as [TBD].*MitigationPlatformList????/mitigations/platforms?
Create,.kentik.api.alerting.v0.mitigations.Platform,.kentik.api.alerting.v0.mitigations.Platform"??A?
Mitigation PlatformsCreate a mitigation platform.?Creates a new mitigation platform with the specified attributes, including name, description, and type (e.g. RTBH, Flowspec, Radware, or A10), as well as properties that are specific to the type and a list of the mitigation methods that will use the platform.*MitigationPlatformCreate????"/mitigations/platforms:*?
Get6.kentik.api.alerting.v0.mitigations.PlatformGetRequest,.kentik.api.alerting.v0.mitigations.Platform"??A?
Mitigation Platforms,Get information about a mitigation platform.?Returns information about the mitigation platform specified with platformId, including attributes such as name, description, type, type-specific properties, and associated methods.*MitigationPlatformGet????/mitigations/platforms/{id}?
Update9.kentik.api.alerting.v0.mitigations.PlatformUpdateRequest:.kentik.api.alerting.v0.mitigations.PlatformUpdateResponse"??A?
Mitigation PlatformsUpdate mitigation platform.DUpdates the attributes of the mitigation platform specified with id.*MitigationPlatformUpdate????02$/mitigations/platforms/{platform.id}:platform?
Delete9.kentik.api.alerting.v0.mitigations.PlatformDeleteRequest:.kentik.api.alerting.v0.mitigations.PlatformDeleteResponse"??A?
Mitigation PlatformsDelete mitigation platform.2Deletes the mitigation platform specified with id.*MitigationPlatformDelete????*/mitigations/platforms/{id}??2?
Insights?
SearchInsightPolicies+.kentik.api.alerting.v0.PolicySearchRequest3.kentik.api.alerting.v0.InsightPolicySearchResponse"??AZInternal endpoint.DList insight policies, with same API as for user-specified policies.????"/insights/policies:search:*??2?
SavedFilters{
List/.kentik.api.alerting.v0.SavedFiltersListRequest0.kentik.api.alerting.v0.SavedFiltersListResponse"????
/filterst
Get..kentik.api.alerting.v0.SavedFiltersGetRequest&.kentik.api.alerting.v0.SavedFilterRef"????/filters/{id}m
Create&.kentik.api.alerting.v0.SavedFilterRef&.kentik.api.alerting.v0.SavedFilterRef"????"/filters:*?
Update1.kentik.api.alerting.v0.SavedFiltersUpdateRequest2.kentik.api.alerting.v0.SavedFiltersUpdateResponse"$????2/filters/{filter.id}:filter?
Delete1.kentik.api.alerting.v0.SavedFiltersDeleteRequest2.kentik.api.alerting.v0.SavedFiltersDeleteResponse"????*/filters/{id}??B?ZIgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertproto?A?j
Alerting API"U
Kentik Alerting team#https://github.com/kentik/chf-alertengr-alerting@kentik.com20.1api.kentik.com"/api/v5/alerting*Zk
5
email,api user email adressX-CH-Auth-Email 
2
token)api user tokenX-CH-Auth-API-Token b
	
email 
	
token J?F
  ?

  

 

 `
	
 `
	
  &
	
 %
	
 8
	
 5
	

 <
	
 >
	
 >
	
 @
	
 <
	
	 ?
	

 <
	
 A
	
 H
	
 J
	
 @

? @

 B ?


 B


 C<

 ?*C<

  EO

  E


  E

  E#1

  FH

	  ?ʼ"FH

  JN

  ?JN

 Q]

 Q

 Q$

 Q/=

 RU

	 ?ʼ"RU

 W\

 ?W\

 _j

 _	

 _


 _$4

 `b

	 ?ʼ"`b

 di

 ?di
3
 ln"% TODO(tjonak): still used by notify,


 l

 l0

 l;O

 p{

 p	

 p


 p$4

 qt

	 ?ʼ"qt

 vz

 ?vz

 }?

 }&

 }'K

 }Vv

 ~?

	 ?ʼ"~?

 ??
?
 ???2? if no tag is defined then tags = ["<service name>"]
 in case of service `Alarms` this ends up in `["Alarms"]`
 swagger-editor puts endpoints in each tagged group


? ?

?

?<

?*?<

 ??

 ?


 ?!

 ?,C

 ??

	 ?ʼ"??

??

?

?%

?0H

??

	?ʼ"??

??

?	

?


?*3

??

	?ʼ"??

??

?

?%

?0I

??

	?ʼ"??

??

?

?%

?0I

??

	?ʼ"??

? ?

?

?<

?*?<

 ??

 ?


 ?

 ?)=

 ??

	 ?ʼ"??

 ??

 ???

??

?

?

?$

??

	?ʼ"??

??

???

??

?	

?


?%+

??

	?ʼ"??

??

???

??

?

? 

?+?

??

	?ʼ"??

??

???

??

?

? 

?+1

??

	?ʼ"??

??

???

??

?

? 

?+@

??

	?ʼ"??

??

???

??

?

? 

?+?

??

	?ʼ"??

??

???

??

?

?"

?-B

??

	?ʼ"??

??

???

??

?


?

?'9

??

	?ʼ"??

??

???

	??

	?

	? 

	?+?

	??

		?ʼ"??

	??

	???


??


?


?.


?9T


??

	
?ʼ"??


??


???
s
??2c TODO(tjonak): find better place for dimensions/metrics, conceptually they belong to policy though


?

?7

?B]

??

	?ʼ"??

??

???

??

?

?1

?<T

??

	?ʼ"??

??

???

??

?

?;

?Fc

??

	?ʼ"??

??

???

??

?

?,

?7Q

??

	?ʼ"??

??

?"

?#F

?Qu

??

	?ʼ"??

??

?!

?"D

?Or

??

	?ʼ"??

??

?

?2

?=W

??

	?ʼ"??

??

???

? ?

?

?<

?*?<

 ??

 ?

 ?0

 ?;T

 ??

	 ?ʼ"??

 ??

 ???

??

?

?.

?9Q

??

	?ʼ"??

??

???

??

?

?0

?;T

??

	?ʼ"??

??

???

? ?

?

?<

?*?<
X
 ??2H TODO(tjonak): not sure whether we want to expose those controls at all


 ?

 ? :

 ?E`

 ??

	 ?ʼ"??

 ??

 ???

??

?

?:

?Ea

??

	?ʼ"??

??

???

??

?

?7

?B]

??

	?ʼ"??

??

???

??

?

?,

?7L

??

	?ʼ"??

??

???

??

?

?2

?=R

??

	?ʼ"??

??

???

??

?

?4

??T

??

	?ʼ"??

??

???

??

?!

?"A

?Ll

??

	?ʼ"??

??

???

??

?

? @

?Kl

??

	?ʼ"??

??

???

? ?

?

?<

?*?<

 ??

 ?


 ?!

 ?,C

 ??

	 ?ʼ"??

 ??

 ???
R
??B Create spawns and starts manual mitigation. This operation is as


?

?%

?0I

??

	?ʼ"??

??

???

??

?	

?


?*4

??

	?ʼ"??

??

???

??

?	

?
"

?-F

??

	?ʼ"??

??

???

??

?

?9

?Dg

??

	?ʼ"??

??

???

??

?


?!

?,C

??

	?ʼ"??

? ?

?

?<

?*?<

 ??

 ?


 ?(

 ?3Q

 ??

	 ?ʼ"??

 ??

 ???

??

?

?

?*<

??

	?ʼ"??

??

???

??

?	

?
&

?1C

??

	?ʼ"??

??

???

??

?

?,

?7W

??

	?ʼ"??

??

???

??

?

?,

?7W

??

	?ʼ"??

??

???

? ?

?

?<

?*?<

 ??

 ?


 ?*

 ?5U

 ??

	 ?ʼ"??

 ??

 ???

??

?

?!

?,@

??

	?ʼ"??

??

???

??

?	

?
(

?3G

??

	?ʼ"??

??

???

??

?

?.

?9[

??

	?ʼ"??

??

???

??

?

?.

?9[

??

	?ʼ"??

??

???

? ?

?

?<

?*?<

 ??

 ?

 ?/

 ?:U

 ??

	 ?ʼ"??

 ??

 ???

	? ?

	?

	?<

	?*?<

	 ??

	 ?


	 ?"

	 ?-E

	 ??

		 ?ʼ"??

	??

	?	

	?
 

	?+9

	??

		?ʼ"??

	??

	?

	?

	?&4

	??

		?ʼ"??

	??

	?

	?&

	?1K

	??

		?ʼ"??

	??

	?

	?&

	?1K

	??
d
		?ʼ"??O TODO(tjonak): what should happen if there's a policy referencing this filter?
bproto3??  
?
2kentik/alerting/backend/v0/alertproto/errors.protokentik.api.alerting.v0 google/protobuf/field_mask.protogoogle/protobuf/timestamp.proto5kentik/alerting/backend/v0/alertproto/threshold.proto5kentik/alerting/backend/v0/alertproto/subpolicy.proto"?
MissingDimsForFlowspecI
items (23.kentik.api.alerting.v0.MissingDimsForFlowspec.ItemRitemsn
Item
policyID (RpolicyID
	dimension (	R	dimension,
mitigationMethods (RmitigationMethodsBKZIgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertprotoJ?
  

  

 

 `
	
 `
	
  *
	
 )
	
 ?
	
	 ?
?
  ? MissingDimsForFlowspecErrorDetail contains all missing policy-dimension pairs
 required to satisfy linked flowspec mitigation methods



 

  

  


   

   	

   


   

  

  


  

  

  )

  

  

  $

  '(

  

  


  

  

  bproto3??       
?
5kentik/alerting/backend/v0/alertproto/util/util.protokentik.api.alerting.v0.utilBPZNgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/alertproto/utilJ1
  e

  

 $

 e
	
 ebproto3??  
?
*kentik/alerting/backend/v0/meta/meta.protokentik.api.alerting.v0google/api/annotations.proto+kentik/core/v202012alpha1/annotations.proto"?
DatabasePoolSettings"
maxOpenConns (RmaxOpenConns"
maxIdleConns (RmaxIdleConns6
connMaxLifeTimeSeconds (RconnMaxLifeTimeSeconds6
connMaxIdleTimeSeconds (RconnMaxIdleTimeSeconds"?
DatabaseStats.
maxOpenConnections (RmaxOpenConnections(
openConnections (RopenConnections
inUse (RinUse
idle (Ridle
	waitCount (R	waitCount.
waitDurationMillis (RwaitDurationMillis$
maxIdleClosed (RmaxIdleClosed,
maxIdleTimeClosed (RmaxIdleTimeClosed,
maxLifetimeClosed	 (RmaxLifetimeClosed"*
GetDBPoolSettingsRequest
id (	Rid"e
GetDBPoolSettingsResponseH
settings (2,.kentik.api.alerting.v0.DatabasePoolSettingsRsettings"t
SetDBPoolSettingsRequest
id (	RidH
settings (2,.kentik.api.alerting.v0.DatabasePoolSettingsRsettings"
SetDBPoolSettingsResponse"#
GetDBStatsRequest
id (	Rid"Q
GetDBStatsResponse;
stats (2%.kentik.api.alerting.v0.DatabaseStatsRstats2?
Meta?
GetDBPoolSettings0.kentik.api.alerting.v0.GetDBPoolSettingsRequest1.kentik.api.alerting.v0.GetDBPoolSettingsResponse"????/db/{id}/settings?
SetDBPoolSettings0.kentik.api.alerting.v0.SetDBPoolSettingsRequest1.kentik.api.alerting.v0.SetDBPoolSettingsResponse"????/db/{id}/settings{

GetDBStats).kentik.api.alerting.v0.GetDBStatsRequest*.kentik.api.alerting.v0.GetDBStatsResponse"????/db/{id}/stats??BEZCgithub.com/kentik/api-schema/gen/go/kentik/alerting/backend/v0/metaJ?
  L

  

 

 Z
	
 Z
	
  &
	
 5


  


 


 >

 ?*>

  


  


  
2

  
=V

  

	  ?ʼ"

 

 

 2

 =V

 

	 ?ʼ"

 

 

 $

 /A

 

	 ?ʼ"


  "


 

  

  

  

  

 

 

 

 

  $

  

  	

  "#

 !$

 !

 !	

 !"#
"
% 4 golang's sql.DBStats



%
B
 &"5 Maximum number of open connections to the database.


 &

 &

 &
J
("= The number of established connections both in use and idle.


(

(	

(
:
)"- The number of connections currently in use.


)

)	

)
.
*"! The number of idle connections.


*

*	

*
F
-
 Counters
"- The total number of connections waited for.


-

-

-
?
0 B NOTE: duration in go; just convert this to millis for simplicity
"L The total time blocked waiting for a new connection. (converted to millis)


0

0	

0
M
1"@ The total number of connections closed due to SetMaxIdleConns.


1

1

1
P
2"C The total number of connections closed due to SetConnMaxIdleTime.


2

2

2
P
3"C The total number of connections closed due to SetConnMaxLifetime.


3

3

3


6 8


6 
1
 7"$ dsn id, eg. "chwww-ro" or whatever


 7

 7	

 7


: <


:!

 ;$

 ;

 ;

 ;"#


> A


> 
1
 ?"$ dsn id, eg. "chwww-ro" or whatever


 ?

 ?	

 ?

@$

@

@

@"#


C D


C!


F H


F
1
 G"$ dsn id, eg. "chwww-ro" or whatever


 G

 G	

 G


J L


J

 K

 K

 K

 Kbproto3??  
?#
%kentik/audit/v202205beta1/audit.protokentik.audit.v202205beta1google/api/annotations.protogoogle/api/client.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto"?
RequestEvent%
request_method (	RrequestMethod!
request_path (	RrequestPath%
client_address (	RclientAddress#
response_code (RresponseCodeg
request_metadata (2<.kentik.audit.v202205beta1.RequestEvent.RequestMetadataEntryRrequestMetadataj
response_metadata (2=.kentik.audit.v202205beta1.RequestEvent.ResponseMetadataEntryRresponseMetadataU
request_protocol (2*.kentik.audit.v202205beta1.RequestProtocolRrequestProtocolB
RequestMetadataEntry
key (	Rkey
value (	Rvalue:8C
ResponseMetadataEntry
key (	Rkey
value (	Rvalue:8"?

AuditEvent
user_id (	RuserId

company_id (	R	companyId!
service_name (	RserviceName
event_id (	ReventId0
cdate (2.google.protobuf.TimestampRcdate#
event_payload (	ReventPayload%
correlation_id (	RcorrelationIdC
request (2'.kentik.audit.v202205beta1.RequestEventH RrequestB

event_type"X
CreateAuditEventRequest=
events (2%.kentik.audit.v202205beta1.AuditEventRevents"
CreateAuditEventResponse*?
RequestProtocol 
REQUEST_PROTOCOL_UNSPECIFIED 
REQUEST_PROTOCOL_REST
REQUEST_PROTOCOL_GRPC
REQUEST_PROTOCOL_HTTP2?
AuditService?
CreateAuditEvent2.kentik.audit.v202205beta1.CreateAuditEventRequest3.kentik.audit.v202205beta1.CreateAuditEventResponse"??AX!Create one ore more audit events.!Create one ore more audit events.*CreateAuditEvent??audit:write????"/audit/v202205beta1:*%?Agrpc.api.kentik.com??admin.auditB?ZCgithub.com/kentik/api-schema/gen/go/kentik/audit/v202205beta1;audit?A?L
	Audit API"7
Kentik API Engineeringhttps://github.com/kentik/api2202205*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ?
  ?

  

 "

 Z
	
 Z
	
  &
	
 !
	
 )
	
 8
	

 5
	
 8

? 8
M
 = B2A models
 -------------------------------------------------------



 =

  >#

  >

  >!"

 ?

 ?

 ?

 @

 @

 @

 A

 A

 A
c
 G PH RequestEvent describes an event generated by an REST or a gRPC request
2 Event Types



 G

  H

  H

  H	

  H

 I

 I

 I	

 I
Q
 KD IP address of the client that made the request. Example: 75.2.60.5


 K

 K	

 K

 L

 L

 L	

 L

 M+

 M

 M&

 M)*

 N,

 N

 N'

 N*+

 O'

 O

 O"

 O%&
E
U k29 -------------------------------------------------------



U
;
 W. ID of the user (uid) that produced the event


 W

 W	

 W
>
Y1 ID of the company (cid) that produced the event


Y

Y	

Y
<
[/ Name of the service that generated the event.


[

[	

[
m
]` Unique identifier of the event. EventID and ServiceName are used to identify an event uniquely


]

]	

]
U
_&H When the event was produced, the current time is used if not provided.


_

_!

_$%
-
a  Event payload as a JSON string


a

a	

a
?
cu Idenfier for events generated by the same root transaction. For instrumented services, this is usually the trace ID


c

c	

c
?
 hj2? TODO
 Should we have a different event type for UI/portal events? How about events that are not related to a request? Like an internal event?


 h

i

i

i

i


m o


m

 n!

 n


 n

 n

 n 


q s


q 

 u ?


 u


 v=

 ?v=


 wE

 ?*wE

  y?

  y

  y1

  y<T

  zF

  ?*zF

  {~

	  ?ʼ"{~

  ??

  ???bproto3??  
?3
%kentik/ktrac/route/v202104/elem.protokentik.ktrac.route.v202104google/protobuf/timestamp.proto"?
Elem.
time (2.google.protobuf.TimestampRtimeG
record_type (2&.kentik.ktrac.route.v202104.RecordTypeR
recordTypeM
vantage_point (2(.kentik.ktrac.route.v202104.VantagePointRvantagePoint

message_id (R	messageId
serial (Rserial1
afi (2.kentik.ktrac.route.v202104.AfiRafi4
safi (2 .kentik.ktrac.route.v202104.SafiRsafi8
type (2$.kentik.ktrac.route.v202104.ElemTypeRtypeL
unicast_nlris	 (2'.kentik.ktrac.route.v202104.UnicastNlriRunicastNlrisF
l3vpn_nlris
 (2%.kentik.ktrac.route.v202104.L3vpnNlriR
l3vpnNlrisH

peer_state (2).kentik.ktrac.route.v202104.PeerStateElemR	peerStateF

attributes (2&.kentik.ktrac.route.v202104.AttributesR
attributesA
	rib_entry (2$.kentik.ktrac.route.v202104.RibEntryRribEntry"z
VantagePoint
dataset (	Rdataset
	collector (	R	collector
peer_asn (RpeerAsn
peer_ip (	RpeerIp"?
VantagePointTableM
vantage_point (2(.kentik.ktrac.route.v202104.VantagePointRvantagePoint1
afi (2.kentik.ktrac.route.v202104.AfiRafi4
safi (2 .kentik.ktrac.route.v202104.SafiRsafi"%
UnicastNlri
prefix (	Rprefix"w
	L3vpnNlri
prefix (	RprefixB
labels (2*.kentik.ktrac.route.v202104.MplsLabelStackRlabels
rd (	Rrd"&
MplsLabelStack
label (Rlabel"S
PeerStateElemB
	new_state (2%.kentik.ktrac.route.v202104.PeerStateRnewState"?

Attributes:
origin (2".kentik.ktrac.route.v202104.OriginRorigin
next_hop (	RnextHop
as_path (	RasPath 
communities (Rcommunities1
extended_communities (	RextendedCommunities"?
RibEntry7
	dump_time (2.google.protobuf.TimestampRdumpTimeM
dump_position (2(.kentik.ktrac.route.v202104.DumpPositionRdumpPosition
rib_id (RribId

elem_count (R	elemCount*V

RecordType
RECORD_TYPE_UNSPECIFIED 
RECORD_TYPE_UPDATE
RECORD_TYPE_RIB*4
Afi
AFI_UNSPECIFIED 
AFI_IP4
AFI_IP6*N
Safi
SAFI_UNSPECIFIED 
SAFI_UNICAST
	SAFI_MPLS

SAFI_L3VPN?*W
Origin
ORIGIN_UNSPECIFIED 

ORIGIN_IGP


ORIGIN_EGP
ORIGIN_INCOMPLETE*?
ElemType
ELEM_TYPE_UNSPECIFIED 
ELEM_TYPE_PEERSTATE

ELEM_TYPE_ANNOUNCEMENT
ELEM_TYPE_WITHDRAWAL
ELEM_TYPE_RIB_ENTRY
ELEM_TYPE_SYNC*O
	PeerState
PEER_STATE_UNSPECIFIED 
PEER_STATE_UP

PEER_STATE_DOWN*t
DumpPosition
DUMP_POSITION_UNSPECIFIED 
DUMP_POSITION_START
DUMP_POSITION_MID
DUMP_POSITION_ENDB&Z$github.com/kentik/ktrac/pkg/route/pbJ?
  z

  

 #

 ;
	
 ;
	
  )


  


 

  %

  

   

  #$

 	

 	

 	

 	

 
!

 


 


 
 

 

 

 

 

 

 

 	

 

 

 

 	

 

 

 

 

 

 

 


 

 

 )

 


 

 $

 '(

 	&

 	


 	

 	 

 	#%

 
 

 


 


 


 

 

 

 

 

 


 

 


  


 

  

  

  

 

 

 

 

 

 
?
! & XXX: these belong in vp.proto, but it would mean a breaking
 change. When we get to that point, let's rearrange these things.



!

 "

 "

 "	

 "

#

#

#	

#

$

$

$	

$

%

%

%	

%


( ,


(

 )!

 )

 )

 ) 

*

*

*	

*

+

+

+

+
F
/ 3: XXX: These are common and perhaps belong in a bgp.proto.



/

 0

 0

 0

1

1	

1

2

2	

2


5 :


5	

 6

 6

 6

7

7

7

8

8

8

9

9

9
>
= B2 Note: values here are +10 from those in RFC 4271



=

 >

 >

 >

?

?

?

@

@

@

A

A

A


D K


D

 E

 E

 E

F

F

F

G

G

G

H

H

H

I

I

I

J

J

J


M P


M
L
 O? TODO: could consider binary encoding here to save a few bytes


 O

 O	

 O


R V


R

 S

 S

 S	

 S

T%

T


T

T 

T#$

U

U

U	

U


X Z


X

 Y

 Y


 Y

 Y

 Y


\ ^


\

 ]

 ]

 ]

 ]


` d


`

 a

 a

 a

b

b

b

c

c

c


f l


f

 g

 g

 g	

 g

h

h

h	

h

i

i


i

i

i

j"

j


j

j

j !

k+

k


k

k&

k)*


n s


n

 o*

 o

 o%

 o()

p!

p

p

p 

q

q

q

q
,
r" only set in DUMP_POSITION_END


r

r	

r


u z


u

 v 

 v

 v

w" No Attributes


w

w
8
x"+ Attributes will contain route information


x

x

y" No Attributes


y

ybproto3??  
?
,kentik/ktrac/route/v202104/annotations.protokentik.ktrac.route.v202104"V
AnnotationsG
rpki_status (2&.kentik.ktrac.route.v202104.RpkiStatusR
rpkiStatus*?

RpkiStatus
RPKI_STATUS_UNSPECIFIED 
RPKI_STATUS_NOT_FOUND 
RPKI_STATUS_EXPLICIT_INVALID
RPKI_STATUS_INVALID_PREFIX
RPKI_STATUS_INVALID
RPKI_STATUS_VALID
RPKI_STATUS_ERRORB&Z$github.com/kentik/ktrac/pkg/route/pbJ?
  

  

 #

 ;
	
 ;


  


 

  

  

  

 

 

 

 #

 

 !"

 	!

 	

 	 

 


 


 


 

 

 

 

 

 


  


 

  

  

  

  bproto3??  
??
*kentik/synthetics/v202202/synthetics.protokentik.synthetics.v202202google/api/annotations.protogoogle/api/client.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto"?
Agent
id (	Rid
	site_name (	RsiteName>
status (2&.kentik.synthetics.v202202.AgentStatusRstatus
alias (	Ralias
type (	Rtype
os (	Ros
ip (	Rip
lat (Rlat
long	 (Rlong;
last_authed
 (2.google.protobuf.TimestampR
lastAuthed;
family (2#.kentik.synthetics.v202202.IPFamilyRfamily
asn (Rasn
site_id (	RsiteId
version (	Rversion
city (	Rcity
region (	Rregion
country (	Rcountry
test_ids (	RtestIds
local_ip (	RlocalIp!
cloud_region (	RcloudRegion%
cloud_provider (	RcloudProviderG

agent_impl (2(.kentik.synthetics.v202202.ImplementTypeR	agentImpl
labels (	Rlabels"M
UserInfo
id (	Rid
email (	Remail
	full_name (	RfullName"?
Test
id (	Rid
name (	Rname
type (	Rtype=
status (2%.kentik.synthetics.v202202.TestStatusRstatusC
settings (2'.kentik.synthetics.v202202.TestSettingsRsettings0
cdate (2.google.protobuf.TimestampRcdate0
edate (2.google.protobuf.TimestampRedateB

created_by	 (2#.kentik.synthetics.v202202.UserInfoR	createdByK
last_updated_by
 (2#.kentik.synthetics.v202202.UserInfoRlastUpdatedBy
labels (	Rlabels"?
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
network_mesh (2*.kentik.synthetics.v202202.NetworkMeshTestH RnetworkMesh
	agent_ids
 (	RagentIds
tasks (	RtasksR
health_settings (2).kentik.synthetics.v202202.HealthSettingsRhealthSettings?
ping (2+.kentik.synthetics.v202202.TestPingSettingsRpingB
trace (2,.kentik.synthetics.v202202.TestTraceSettingsRtrace
period (Rperiod;
family (2#.kentik.synthetics.v202202.IPFamilyRfamily3
notification_channels (	RnotificationChannelsB

definition"?
TestPingSettings
count (Rcount
protocol (	Rprotocol
port (Rport
timeout (Rtimeout
delay (Rdelay"?
TestTraceSettings
count (Rcount
protocol (	Rprotocol
port (Rport
timeout (Rtimeout
limit (Rlimit
delay (Rdelay"?
ActivationSettings!
grace_period (	RgracePeriod
	time_unit (	RtimeUnit
time_window (	R
timeWindow
times (	Rtimes"?
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
http_latency_warning_stddev (RhttpLatencyWarningStddev>
unhealthy_subtest_threshold (RunhealthySubtestThresholdM

activation (2-.kentik.synthetics.v202202.ActivationSettingsR
activation.
cert_expiry_warning (RcertExpiryWarning0
cert_expiry_critical (RcertExpiryCritical"&
HostnameTest
target (	Rtarget""
IpTest
targets (	Rtargets"E
	AgentTest
target (	Rtarget 
use_local_ip (R
useLocalIp"?
FlowTest
target (	RtargetC
target_refresh_interval_millis (RtargetRefreshIntervalMillis#
max_providers (RmaxProviders$
max_ip_targets (RmaxIpTargets
type (	Rtype%
inet_direction (	RinetDirection
	direction (	R	direction"?
DnsTest
target (	Rtarget
timeout (RtimeoutE
record_type (2$.kentik.synthetics.v202202.DNSRecordR
recordType
servers (	Rservers
port (Rport"?
UrlTest
target (	Rtarget
timeout (Rtimeout
method (	RmethodI
headers (2/.kentik.synthetics.v202202.UrlTest.HeadersEntryRheaders
body (	Rbody*
ignore_tls_errors (RignoreTlsErrors:
HeadersEntry
key (	Rkey
value (	Rvalue:8"?
PageLoadTest
target (	Rtarget
timeout (RtimeoutN
headers (24.kentik.synthetics.v202202.PageLoadTest.HeadersEntryRheaders*
ignore_tls_errors (RignoreTlsErrors^
css_selectors (29.kentik.synthetics.v202202.PageLoadTest.CssSelectorsEntryRcssSelectors:
HeadersEntry
key (	Rkey
value (	Rvalue:8?
CssSelectorsEntry
key (	Rkey
value (	Rvalue:8"3
NetworkMeshTest 
use_local_ip (R
useLocalIp"?

MetricData
current (Rcurrent
rolling_avg (R
rollingAvg%
rolling_stddev (RrollingStddev
health (	Rhealth"B
PacketLossData
current (Rcurrent
health (	Rhealth"?
PingResults
target (	RtargetJ
packet_loss (2).kentik.synthetics.v202202.PacketLossDataR
packetLoss?
latency (2%.kentik.synthetics.v202202.MetricDataRlatency=
jitter (2%.kentik.synthetics.v202202.MetricDataRjitter
dst_ip (	RdstIp"R
HTTPResponseData
status (Rstatus
size (Rsize
data (	Rdata"?
HTTPResults
target (	Rtarget?
latency (2%.kentik.synthetics.v202202.MetricDataRlatencyG
response (2+.kentik.synthetics.v202202.HTTPResponseDataRresponse
dst_ip (	RdstIp"=
DNSResponseData
status (Rstatus
data (	Rdata"?

DNSResults
target (	Rtarget
server (	Rserver?
latency (2%.kentik.synthetics.v202202.MetricDataRlatencyF
response (2*.kentik.synthetics.v202202.DNSResponseDataRresponse"?
TaskResults<
ping (2&.kentik.synthetics.v202202.PingResultsH Rping<
http (2&.kentik.synthetics.v202202.HTTPResultsH Rhttp9
dns (2%.kentik.synthetics.v202202.DNSResultsH Rdns
health (	RhealthB
	task_type"
AgentResults
agent_id (	RagentId
health (	Rhealth<
tasks (2&.kentik.synthetics.v202202.TaskResultsRtasks"?
TestResults
test_id (	RtestId.
time (2.google.protobuf.TimestampRtime
health (	Rhealth?
agents (2'.kentik.synthetics.v202202.AgentResultsRagents"E
Stats
average (Raverage
min (Rmin
max (Rmax"?
Location
latitude (Rlatitude
	longitude	 (R	longitude
country (	Rcountry
region (	Rregion
city (	Rcity"?
NetNode
ip (	Rip
asn (Rasn
as_name (	RasName?
location (2#.kentik.synthetics.v202202.LocationRlocation
dns_name (	RdnsName
	device_id (	RdeviceId
site_id (	RsiteId"=
TraceHop
latency (Rlatency
node_id (	RnodeId"~
	PathTrace
as_path (RasPath
is_complete (R
isComplete7
hops (2#.kentik.synthetics.v202202.TraceHopRhops"?
Path
agent_id (	RagentId
	target_ip (	RtargetIp=
	hop_count (2 .kentik.synthetics.v202202.StatsRhopCount+
max_as_path_length (RmaxAsPathLength<
traces (2$.kentik.synthetics.v202202.PathTraceRtraces.
time	 (2.google.protobuf.TimestampRtime"?
GetResultsForTestsRequest
ids (	Rids9

start_time (2.google.protobuf.TimestampR	startTime5
end_time (2.google.protobuf.TimestampRendTime
	agent_ids (	RagentIds
targets (	Rtargets"^
GetResultsForTestsResponse@
results (2&.kentik.synthetics.v202202.TestResultsRresults"?
GetTraceForTestRequest
id (	Rid9

start_time (2.google.protobuf.TimestampR	startTime5
end_time (2.google.protobuf.TimestampRendTime
	agent_ids (	RagentIds

target_ips (	R	targetIps"?
GetTraceForTestResponseS
nodes (2=.kentik.synthetics.v202202.GetTraceForTestResponse.NodesEntryRnodes5
paths (2.kentik.synthetics.v202202.PathRpaths\

NodesEntry
key (	Rkey8
value (2".kentik.synthetics.v202202.NetNodeRvalue:8"
ListAgentsRequest"s
ListAgentsResponse8
agents (2 .kentik.synthetics.v202202.AgentRagents#
invalid_count (RinvalidCount"!
GetAgentRequest
id (	Rid"J
GetAgentResponse6
agent (2 .kentik.synthetics.v202202.AgentRagent"L
UpdateAgentRequest6
agent (2 .kentik.synthetics.v202202.AgentRagent"M
UpdateAgentResponse6
agent (2 .kentik.synthetics.v202202.AgentRagent"$
DeleteAgentRequest
id (	Rid"
DeleteAgentResponse"
ListTestsRequest"o
ListTestsResponse5
tests (2.kentik.synthetics.v202202.TestRtests#
invalid_count (RinvalidCount"H
CreateTestRequest3
test (2.kentik.synthetics.v202202.TestRtest"I
CreateTestResponse3
test (2.kentik.synthetics.v202202.TestRtest" 
GetTestRequest
id (	Rid"F
GetTestResponse3
test (2.kentik.synthetics.v202202.TestRtest"H
UpdateTestRequest3
test (2.kentik.synthetics.v202202.TestRtest"I
UpdateTestResponse3
test (2.kentik.synthetics.v202202.TestRtest"#
DeleteTestRequest
id (	Rid"
DeleteTestResponse"e
SetTestStatusRequest
id (	Rid=
status (2%.kentik.synthetics.v202202.TestStatusRstatus"
SetTestStatusResponse*a
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
AGENT_STATUS_DELETED*?
	DNSRecord
DNS_RECORD_UNSPECIFIED 
DNS_RECORD_A
DNS_RECORD_AAAA
DNS_RECORD_CNAME
DNS_RECORD_DNAME
DNS_RECORD_NS
DNS_RECORD_MX
DNS_RECORD_PTR
DNS_RECORD_SOA2?
SyntheticsDataService?
GetResultsForTests4.kentik.synthetics.v202202.GetResultsForTestsRequest5.kentik.synthetics.v202202.GetResultsForTestsResponse"??A? Get results for synthetic tests.iReturns measurement results for a set of test for specified period of time, or the latest available data.*GetResultsForTests??synthetics:read???? "/synthetics/v202202/results:*?
GetTraceForTest1.kentik.synthetics.v202202.GetTraceForTestRequest2.kentik.synthetics.v202202.GetTraceForTestResponse"??AXGet trace route data..Get trace route data for the specific test id.*GetTraceForTest??synthetics:read????"/synthetics/v202202/trace:*$?Agrpc.api.kentik.com??
synthetics2?
SyntheticsAdminService?

ListAgents,.kentik.synthetics.v202202.ListAgentsRequest-.kentik.synthetics.v202202.ListAgentsResponse"s?A5List Agents.Returns a list of agents.*
AgentsList??admin.synthetics:read????/synthetics/v202202/agents?
GetAgent*.kentik.synthetics.v202202.GetAgentRequest+.kentik.synthetics.v202202.GetAgentResponse"??AcGet information about an agent.6Returns information about the agent specified with id.*AgentGet??admin.synthetics:read????!/synthetics/v202202/agents/{id}?
UpdateAgent-.kentik.synthetics.v202202.UpdateAgentRequest..kentik.synthetics.v202202.UpdateAgentResponse"??ALUpdate an agent.+Update configuration of a synthetics agent.*AgentUpdate??admin.synthetics:write????*%/synthetics/v202202/agents/{agent.id}:*?
DeleteAgent-.kentik.synthetics.v202202.DeleteAgentRequest..kentik.synthetics.v202202.DeleteAgentResponse"??AEDelete an agent.$Deletes the agent specified with id.*AgentDelete??admin.synthetics:write????!*/synthetics/v202202/agents/{id}?
	ListTests+.kentik.synthetics.v202202.ListTestsRequest,.kentik.synthetics.v202202.ListTestsResponse"??AHList Synthetics Tests.#Returns a list of syntehtics tests.*	TestsList??admin.synthetics:read????/synthetics/v202202/tests?

CreateTest,.kentik.synthetics.v202202.CreateTestRequest-.kentik.synthetics.v202202.CreateTestResponse"??AaCreate Synthetics Test.:Create synthetics test from request. Returns created test.*
TestCreate??admin.synthetics:write????"/synthetics/v202202/tests:*?
GetTest).kentik.synthetics.v202202.GetTestRequest*.kentik.synthetics.v202202.GetTestResponse"??At&Get information about Synthetics Test.AReturns information about synthetics test specified with test ID.*TestGet??admin.synthetics:read???? /synthetics/v202202/tests/{id}?

UpdateTest,.kentik.synthetics.v202202.UpdateTestRequest-.kentik.synthetics.v202202.UpdateTestResponse"??ASUpdate a Synthetics Test.*Updates configuration of a synthetic test.*
TestUpdate??admin.synthetics:write????(#/synthetics/v202202/tests/{test.id}:*?

DeleteTest,.kentik.synthetics.v202202.DeleteTestRequest-.kentik.synthetics.v202202.DeleteTestResponse"??AXDelete an Synthetics Test..Deletes the synthetics test specified with id.*
TestDelete??admin.synthetics:write???? */synthetics/v202202/tests/{id}?
SetTestStatus/.kentik.synthetics.v202202.SetTestStatusRequest0.kentik.synthetics.v202202.SetTestStatusResponse"??ADUpdate a test status.Update the status of a test.*SetTestStatus??admin.synthetics:write????*%/synthetics/v202202/tests/{id}/status:**?Agrpc.api.kentik.com??admin.syntheticsB?ZHgithub.com/kentik/api-schema/gen/go/kentik/synthetics/v202202;synthetics?A?\
Synthetics Monitoring API"7
Kentik API Engineeringhttps://github.com/kentik/api2202202*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ??
 ?
*
 2  Synthetics data and admin APIs


 "

 _
	
 _
	
  &
	
 !
	
	 )
	

 8
	
 5
	
 :

? :
?
 B H3 Agent impl type determines capabilities of agent.
2A models
 -------------------------------------------------------
2! === AGENT config and status ===



 B

  C!

  C

  C 
c
 EV ksynth agent (implemented in Rust) capable of running all tasks except for page-load


 E

 E
k
 G^ ksynth-agent (implemented in NodeJS) capable of running ping, traceroute and page-load tasks


 G

 G


 J c


 J
 
  L id of this agent.


  L

  L	

  L

 M

 M

 M	

 M

 N

 N

 N

 N

 O

 O

 O	

 O

 P

 P

 P	

 P

 Q

 Q

 Q	

 Q

 R

 R

 R	

 R

 S

 S

 S	

 S

 T

 T

 T	

 T

 	U-

 	U

 	U'

 	U*,

 
V

 
V


 
V

 
V

 W

 W

 W	

 W

 X

 X

 X	

 X

 Y

 Y

 Y	

 Y

 Z

 Z

 Z	

 Z

 [

 [

 [	

 [

 \

 \

 \	

 \

 ] 

 ]


 ]

 ]

 ]

 ^

 ^

 ^	

 ^

 _

 _

 _	

 _

 `

 `

 `	

 `

 a 

 a

 a

 a

 b

 b


 b

 b

 b


e j


e

 f" Invalid value.


 f

 f

g

g

g

h

h

h

i

i

i


l q


l

 m" Invalid value.


 m

 m

n" Test is active.


n

n

o" Test is paused.


o

o
?
p"2 Test is deleted. Not settable via SetTestStatus.


p

p


s x


s

 t" Invalid value.


 t

 t

u

u

u

v

v

v

w

w

w
-
} ?2  === TEST config and status ===



}

 ~

 ~

 ~	

 ~





	



?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?

?

?

?

?

?

?&

?

?!

?$%

?&

?

?!

?$%

?

?


?

?

? 

?


?

?

	?

	?


	?

	?

	?

? ?

?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

? ?

?

 ??

 ?

 ?

 ?

 ?

 ?

?

?


?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?


?

?

?

?

?

?

?

?

?

?

	?&

	?

	? 

	?#%


?!


?



?


?


? 

?" Task types.


?


?

?

?

?&

?

? 

?#%

?

?

?

?

?

?

?

?

?

?

?	

?

?

?


?

?

?-

?


?

?'

?*,

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

?!

?

?

? 

? 

?

?

?

?

?

?

?

?

?

?

?

?"

?

?

? !

?!

?

?

? 

?'

?


?

?"

?%&

	?'

	?


	?

	?!

	?$&


?%


?


?


?"$

?$

?

?

?!#

?$

?

?

?!#

?#

?

?

? "

?*

?

?$

?')

?)

?

?#

?&(

?*

?

?	$

?')

?%

?

?

?"$

?"

?

?	

?!

?#

?

?	

? "

? ?

?

 ?

 ?

 ?	

 ?

	? ?

	?

	 ?

	 ?


	 ?

	 ?

	 ?


? ?


?


 ?


 ?


 ?	


 ?


?


?


?


?

? ?

?

 ?

 ?

 ?	

 ?
,
?," How often to generate tasks.


?

?	'

?*+
H
?": see issue https://github.com/kentik/api-schema/issues/94


?

?	

?
H
?": see issue https://github.com/kentik/api-schema/issues/94


?

?	

?
F
?"8 What type of flow to look at -- asn, cdn, country, ...


?

?	

?

?

?

?	

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?

?

?

?


?

?

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?"

?

?

? !

?

?

?	

?

?

?

?

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?"

?

?

? !

?

?

?

?

?(

?

?#

?&'

? ?

?

 ?

 ?

 ?

 ?
D
? ?26 === TEST RESULTS (metrics, stats, responses, health)


?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?!

?

?

? 

?

?

?

?

?

?

?

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?

?

? 

?

?

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?

?

?

?

?

?

? ?

?

 ??

 ?

 ?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?!

?


?

?

? 

? ?

?

 ?

 ?

 ?	

 ?

?%

?

? 

?#$

?

?

?	

?

?#

?


?

?

?!"
*
? ?2 === TEST TRACE results ===


?

 ?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?


?

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

? ?

?
;
 ?- observed latency; 0 if node did not respond


 ?

 ?

 ?
V
?H node_id refers to TracerouteResult.nodes; empty if hop did not respond


?

?	

?

? ? Probing detail


?

 ?

 ?


 ?

 ?

 ?

?

?

?

?

?

?


?

?

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?

?

?

?

?

?

? 

?


?

?

?

?%

?

? 

?#$
U
 ? ?2G Data Service
 -------------------------------------------------------


 ?!
;
  ?- List of ids of the tests to get health for.


  ?


  ?

  ?

  ?
:
 ?+, Start of the time interval for this query.


 ?

 ?&

 ?)*
8
 ?)* End of the time interval for this query.


 ?

 ?$

 ?'(
;
 ? - Optionally, only look at a subset of agents


 ?


 ?

 ?

 ?
<
 ?. Optionally only look at a subset of targets.


 ?


 ?

 ?

 ?

!? ?

!?"

! ?#

! ?


! ?

! ?

! ?!"

"? ?

"?

" ?	 Test id


" ?

" ?	

" ?
:
"?+, Start of the time interval for this query.


"?

"?&

"?)*
8
"?)* End of the time interval for this query.


"?

"?$

"?'(
>
"? 0 Optionally, limit the query to these agent ids


"?


"?

"?

"?
M
"?!? Optionally, limit the query to these destination IP addresses


"?


"?

"?

"? 

#? ?

#?

# ?"

# ?

# ?

# ? !

#?

#?


#?

#?

#?

 ? ?

 ?

 ?;

 ??;

 ?B

 ?*?B
<
  ??, Get measurement results for a set of tests


  ?

  ?3

  ?>X

  ?H

  ?*?H

  ??

	  ?ʼ"??

  ??

  ???

 ??

 ?

 ?-

 ?8O

 ?H

 ?*?H

 ??

	 ?ʼ"??

 ??

 ???
T
$? 2H Admin Service
 -------------------------------------------------------


$?

%? ?

%?

% ?

% ?


% ?

% ?

% ?

%?

%?

%?	

%?

&? ?

&?

& ?

& ?

& ?	

& ?

'? ?

'?

' ?

' ?

' ?

' ?

(? ?

(?

( ?

( ?

( ?

( ?

)? ?

)?

) ?

) ?

) ?

) ?

*? ?

*?

* ?

* ?

* ?	

* ?


+? 

+?
<
,? ?. list the company tests config, remove preset


,?

-? ?

-?

- ?

- ?


- ?

- ?

- ?

-?

-?

-?	

-?

.? ?

.?

. ?

. ?

. ?

. ?

/? ?

/?

/ ?

/ ?

/ ?

/ ?

0? ?

0?

0 ?

0 ?

0 ?	

0 ?

1? ?

1?

1 ?

1 ?

1 ?

1 ?

2? ?

2?

2 ?

2 ?

2 ?

2 ?

3? ?

3?

3 ?

3 ?

3 ?

3 ?

4? ?

4?

4 ?

4 ?

4 ?	

4 ?


5? 

5?

6? ?

6?

6 ?

6 ?

6 ?	

6 ?

6?

6?

6?

6?

7? ?

7?

? ?

?

?;

??;

?H

?*?H

 ??2 Agents


 ?

 ?"

 ?-?

 ?N

 ?*?N

 ??

	 ?ʼ"??

 ??

 ???

??

?

?

?)9

?N

?*?N

??

	?ʼ"??

??

???

??

?

?$

?/B

?O

?*?O

??

	?ʼ"??

??

???

??

?

?$

?/B

?O

?*?O

??

	?ʼ"??

??

???

??2 Tests


?

? 

?+<

?N

?*?N

??

	?ʼ"??

??

???

??

?

?"

?-?

?O

?*?O

??

	?ʼ"??

??

???

??

?

?

?'6

?N

?*?N

??

	?ʼ"??

??

???

??

?

?"

?-?

?O

?*?O

??

	?ʼ"??

??

???

??

?

?"

?-?

?O

?*?O

??

	?ʼ"??

??

???

	??

	?

	?(

	?3H

	?O

	?*?O

	??

		?ʼ"??

	??

	???bproto3??  
?k
7kentik/bgp_monitoring/v202205beta1/bgp_monitoring.proto"kentik.bgp_monitoring.v202205beta1google/api/annotations.protogoogle/api/client.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto%kentik/ktrac/route/v202104/elem.proto,kentik/ktrac/route/v202104/annotations.proto*kentik/synthetics/v202202/synthetics.proto"?
Nlri1
afi (2.kentik.ktrac.route.v202104.AfiRafi4
safi (2 .kentik.ktrac.route.v202104.SafiRsafi
prefix (	H RprefixB
type"{
BgpHealthSettings1
reachability_warning (RreachabilityWarning3
reachability_critical (RreachabilityCritical"?
BgpMonitorSettings!
allowed_asns (RallowedAsnsB
targets (2(.kentik.bgp_monitoring.v202205beta1.NlriRtargets

check_rpki (R	checkRpki8
include_covered_prefixes (RincludeCoveredPrefixes^
health_settings (25.kentik.bgp_monitoring.v202205beta1.BgpHealthSettingsRhealthSettings3
notification_channels (	RnotificationChannels"?

BgpMonitor
id (	Rid
name (	RnameL
status (24.kentik.bgp_monitoring.v202205beta1.BgpMonitorStatusRstatusR
settings (26.kentik.bgp_monitoring.v202205beta1.BgpMonitorSettingsRsettings0
cdate (2.google.protobuf.TimestampRcdate0
edate (2.google.protobuf.TimestampRedateB

created_by (2#.kentik.synthetics.v202202.UserInfoR	createdByK
last_updated_by (2#.kentik.synthetics.v202202.UserInfoRlastUpdatedBy
labels	 (	Rlabels"?
	RouteInfo<
nlri (2(.kentik.bgp_monitoring.v202205beta1.NlriRnlri

origin_asn (R	originAsn
as_path (	RasPathM
vantage_point (2(.kentik.ktrac.route.v202104.VantagePointRvantagePointG
rpki_status (2&.kentik.ktrac.route.v202104.RpkiStatusR
rpkiStatus
nexthop (	Rnexthop"?
	BgpMetric8
	timestamp (2.google.protobuf.TimestampR	timestamp<
nlri (2(.kentik.bgp_monitoring.v202205beta1.NlriRnlri$
reachability (H Rreachability#
path_changes (H RpathChangesB
type"
ListMonitorsRequest"?
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
SetMonitorStatusResponse"?
GetMetricsForTargetRequest9

start_time (2.google.protobuf.TimestampR	startTime5
end_time (2.google.protobuf.TimestampRendTime@
target (2(.kentik.bgp_monitoring.v202205beta1.NlriRtarget'
include_covered (RincludeCoveredK
metrics (21.kentik.bgp_monitoring.v202205beta1.BgpMetricTypeRmetrics"f
GetMetricsForTargetResponseG
metrics (2-.kentik.bgp_monitoring.v202205beta1.BgpMetricRmetrics"?
GetRoutesForTargetRequest.
time (2.google.protobuf.TimestampRtime@
target (2(.kentik.bgp_monitoring.v202205beta1.NlriRtarget'
include_covered (RincludeCovered

check_rpki (R	checkRpki"?
GetRoutesForTargetResponseE
routes (2-.kentik.bgp_monitoring.v202205beta1.RouteInfoRroutesf
as_names (2K.kentik.bgp_monitoring.v202205beta1.GetRoutesForTargetResponse.AsNamesEntryRasNames:
AsNamesEntry
key (Rkey
value (	Rvalue:8*?
BgpMonitorStatus"
BGP_MONITOR_STATUS_UNSPECIFIED 
BGP_MONITOR_STATUS_ACTIVE
BGP_MONITOR_STATUS_PAUSED
BGP_MONITOR_STATUS_DELETED*t
BgpMetricType
BGP_METRIC_TYPE_UNSPECIFIED  
BGP_METRIC_TYPE_REACHABILITY 
BGP_METRIC_TYPE_PATH_CHANGES2?
BgpMonitoringAdminService?
ListMonitors7.kentik.bgp_monitoring.v202205beta1.ListMonitorsRequest8.kentik.bgp_monitoring.v202205beta1.ListMonitorsResponse"??ACList BGP Monitors.Returns a list of BGP monitors.*MonitorsList??admin.synthetics:read????'%/bgp_monitoring/v202205beta1/monitors?
CreateMonitor8.kentik.bgp_monitoring.v202205beta1.CreateMonitorRequest9.kentik.bgp_monitoring.v202205beta1.CreateMonitorResponse"??A`Create BGP Monitor.:Create BGP monitor. Returns created monitor configuration.*MonitorCreate??admin.synthetics:write????*"%/bgp_monitoring/v202205beta1/monitors:*?

GetMonitor5.kentik.bgp_monitoring.v202205beta1.GetMonitorRequest6.kentik.bgp_monitoring.v202205beta1.GetMonitorResponse"??AcGet BGP Monitor configuration.5Return configuration of BGP monitor with specific ID.*
MonitorGet??admin.synthetics:read????,*/bgp_monitoring/v202205beta1/monitors/{id}?
UpdateMonitor8.kentik.bgp_monitoring.v202205beta1.UpdateMonitorRequest9.kentik.bgp_monitoring.v202205beta1.UpdateMonitorResponse"??A?!Update BGP Monitor configuration.\Update configuration of BGP monitor with specific ID. Returns updated monitor configuration.*MonitorUpdate??admin.synthetics:write????72/bgp_monitoring/v202205beta1/monitors/{monitor.id}:*?
DeleteMonitor8.kentik.bgp_monitoring.v202205beta1.DeleteMonitorRequest9.kentik.bgp_monitoring.v202205beta1.DeleteMonitorResponse"??APDelete BGP Monitor.*Delete BGP monitor with  with specific ID.*MonitorDelete??admin.synthetics:write????,**/bgp_monitoring/v202205beta1/monitors/{id}?
SetMonitorStatus;.kentik.bgp_monitoring.v202205beta1.SetMonitorStatusRequest<.kentik.bgp_monitoring.v202205beta1.SetMonitorStatusResponse"??A_Set status of BGP monitor./Set the status of BGP monitor with specific ID.*SetMonitorStatus??admin.synthetics:write????61/bgp_monitoring/v202205beta1/monitors/{id}/status:**?Agrpc.api.kentik.com??admin.synthetics2?
BgpMonitoringDataService?
GetMetricsForTarget>.kentik.bgp_monitoring.v202205beta1.GetMetricsForTargetRequest?.kentik.bgp_monitoring.v202205beta1.GetMetricsForTargetResponse"??A?-Get metrics for a single BGP target (prefix).FRetrieve metric data for single BGP target (prefix) and time interval.*GetMetricsForTarget??synthetics:read????)"$/bgp_monitoring/v202205beta1/metrics:*?
GetRoutesForTarget=.kentik.bgp_monitoring.v202205beta1.GetRoutesForTargetRequest>.kentik.bgp_monitoring.v202205beta1.GetRoutesForTargetResponse"??A?*Get routes for single BGP target (prefix).HRetrieve route information for signle BGP target (prefix) and timestamp.*GetRoutesForTarget??synthetics:read????("#/bgp_monitoring/v202205beta1/routes:*$?Agrpc.api.kentik.com??
syntheticsB?ZUgithub.com/kentik/api-schema/gen/go/kentik/bgp_monitoring/v202205beta1;bgp_monitoring?A?U
BGP Monitoring API"7
Kentik API Engineeringhttps://github.com/kentik/api2202205*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ?2
  ?

  

 +

 l
	
 l
	
  &
	
 !
	
 )
	
 8
	

 5
	
 /
	
 6
	
 4
	
 ;

? ;
M
 ? DA models
 -------------------------------------------------------



 ?

  @'" Invalid value.


  @"

  @%&
!
 A"" Monitor is active.


 A

 A !
!
 B"" Monitor is paused.


 B

 B !
E
 C#"8 Monitor is deleted. Not settable via SetMonitorStatus.


 C

 C!"
3
 G M' === BGP monitor config and status ===



 G

  H)

  H 

  H!$

  H'(

 I+

 I!

 I"&

 I)*

  JL

  J

 K

 K

 K

 K


O R


O

 P!

 P

 P

 P 

Q"

Q

Q

Q !


T [


T

 U#

 U


 U

 U

 U!"

V

V


V

V

V

W

W

W

W

X$

X

X

X"#

Y(

Y

Y#

Y&'

Z,

Z


Z

Z'

Z*+


] g


]

 ^

 ^


 ^

 ^

_

_


_

_

` 

`

`

`

a$

a

a

a"#

b(

b

b#

b&'

c(

c

c#

c&'

d6

d&

d'1

d45

e;

e&

e'6

e9:

f

f

f

f

f
)
j n === BGP monitor results ===



j

 k"" Invalid value.


 k

 k !

l#

l

l!"

m#

m

m!"


p w


p

 q

 q

 q

 q

r

r

r	

r

s

s


s

s

s

t<

t)

t*7

t:;

u8

u'

u(3

u67

v

v

v	

v

y ?


y

 z,

 z

 z'

 z*+

{

{

{	

{

 |

 |

J
}"= percentage of vantage points reporting the prefix reachable


}

}

}
m
~"` number of AS path changes for the prefix across all vantage points in the querried time period


~

~

~
:
?  Admin Service
2 === BGP monitoring services


?

? ?

?

 ?%

 ?

 ?

 ? 

 ?#$

?

?


?

?

? ?

?

 ?

 ?

 ?

 ?

	? ?

	?

	 ?

	 ?

	 ?

	 ?


? ?


?


 ?


 ?



 ?


 ?

? ?

?

 ?

 ?

 ?

 ?

? ?

?

 ?

 ?

 ?

 ?

? ?

?

 ?

 ?

 ?

 ?

? ?

?

 ?

 ?


 ?

 ?


?  

?

? ?

?

 ?

 ?


 ?

 ?

? 

?

?

?


? #

? 

 ? ?

 ?!

 ?=

 ??=

 ?J

 ?*?J

  ??2
 Monitors


  ?

  ?(

  ?3G

  ?P

  ?*?P

  ??

	  ?ʼ"??

  ??

  ???

 ??

 ?

 ?*

 ?5J

 ?Q

 ?*?Q

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?$

 ?/A

 ?P

 ?*?P

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?*

 ?5J

 ?Q

 ?*?Q

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?*

 ?5J

 ?Q

 ?*?Q

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?0

 ?;S

 ?Q

 ?*?Q

 ??

	 ?ʼ"??

 ??

 ???

? ? Data service


?"
:
 ?-, Start of the time interval for this query.


 ?

 ?(

 ?+,
8
?+* End of the time interval for this query.


?

?&

?)*

?

?

?	

?

?

?

?	

?
.
?'"  list of metric types to return


?

?

?"

?%&

? ?

?#

 ?#

 ?

 ?

 ?

 ?!"

? ?

?!
=
 ?%"/ reference time for route information snapshot


 ?

 ? 

 ?#$

?

?

?

?

?

?

?

?

?

?

?

?

? ?

?"

 ? 

 ?


 ?

 ?

 ?
>
?#"0 lookaside map of AS number -> AS name mappings


?

?

?!"

? ?

? 

?=

??=

?D

?*?D

 ??

 ?

 ?7

 ?B]

 ?J

 ?*?J

 ??

	 ?ʼ"??

 ??

 ???

??

?

?5

?@Z

?J

?*?J

??

	?ʼ"??

??

???bproto3??  
?`
3kentik/cloud_export/v202101beta1/cloud_export.proto kentik.cloud_export.v202101beta1google/protobuf/wrappers.protogoogle/api/annotations.protogoogle/api/client.proto google/protobuf/field_mask.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto"?
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
device_bgp_type (	RdeviceBgpType"?
AwsProperties
bucket (	Rbucket 
iam_role_arn (	R
iamRoleArn
region (	Rregion*
delete_after_read (RdeleteAfterRead)
multiple_buckets (RmultipleBuckets"?
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
bucket (	Rbucket"?
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
ListCloudExportRequest"?
ListCloudExportResponseG
exports (2-.kentik.cloud_export.v202101beta1.CloudExportRexports2
invalid_exports_count (RinvalidExportsCount"'
GetCloudExportRequest
id (	Rid"_
GetCloudExportResponseE
export (2-.kentik.cloud_export.v202101beta1.CloudExportRexport"?
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
DeleteCloudExportResponse*?
CloudExportType!
CLOUD_EXPORT_TYPE_UNSPECIFIED $
 CLOUD_EXPORT_TYPE_KENTIK_MANAGED&
"CLOUD_EXPORT_TYPE_CUSTOMER_MANAGED2?
CloudExportAdminService?
CreateCloudExport:.kentik.cloud_export.v202101beta1.CreateCloudExportRequest;.kentik.cloud_export.v202101beta1.CreateCloudExportResponse"??A_Create Cloud Export.9Create cloud export from request. Returns created export.*ExportCreate??admin.cloud_export:write????'""/cloud_export/v202101beta1/exports:*?
ListCloudExport8.kentik.cloud_export.v202101beta1.ListCloudExportRequest9.kentik.cloud_export.v202101beta1.ListCloudExportResponse"??AAList Cloud Export.Returns a list of cloud export.*
ExportList??admin.cloud_export:read????$"/cloud_export/v202101beta1/exports?
GetCloudExport7.kentik.cloud_export.v202101beta1.GetCloudExportRequest8.kentik.cloud_export.v202101beta1.GetCloudExportResponse"??Ai Get information about an export.:Returns information about export specified with export ID.*	ExportGet??admin.cloud_export:read????)'/cloud_export/v202101beta1/exports/{id}?
PatchCloudExport9.kentik.cloud_export.v202101beta1.PatchCloudExportRequest:.kentik.cloud_export.v202101beta1.PatchCloudExportResponse"??AuPatch an export.TPartially Updates the attributes of export specified with id and update_mask fields.*ExportPatch??admin.cloud_export:write????32./cloud_export/v202101beta1/exports/{export.id}:*?
UpdateCloudExport:.kentik.cloud_export.v202101beta1.UpdateCloudExportRequest;.kentik.cloud_export.v202101beta1.UpdateCloudExportResponse"??A[Update an export.8Replaces the entire export attributes specified with id.*ExportUpdate??admin.cloud_export:write????3./cloud_export/v202101beta1/exports/{export.id}:*?
DeleteCloudExport:.kentik.cloud_export.v202101beta1.DeleteCloudExportRequest;.kentik.cloud_export.v202101beta1.DeleteCloudExportResponse"??AHDelete an export.%Deletes the export specified with id.*ExportDelete??admin.cloud_export:write????)*'/cloud_export/v202101beta1/exports/{id}4?Acloud_export.api.kentik.com??admin.cloud_exportB?ZQgithub.com/kentik/api-schema/gen/go/kentik/cloud_export/v202101beta1;cloud_export?A?^
Cloud Export Admin API"7
Kentik API Engineeringhttps://github.com/kentik/api2202101beta1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ?5
 ?
$
 2 Cloud exports management


 )

 h
	
 h
	
  (
	
 &
	
	 !
	

 *
	
 8
	
 5
	
 ;

? ;
?
 A J2z =======================================================
 models
 =======================================================



 A
-
  C$  Invalid or incomplete exports.


  C

  C"#
8
 F'+ Cloud exports that are managed by Kentik.


 F"

 F%&
U
 I)H Exports that are managed by Kentik customers (eg. by running an agent)


 I$

 I'(
A
 M v5 The CloudExport message defines a cloud export task



 M
^
  OQ The internal cloud export identifier. This is Read-only and assigned by Kentik.


  O

  O	

  O
&
 R The kind of export task


 R

 R

 R
M
 U@ Whether this task is enabled and intended to run, or disabled.


 U

 U

 U
,
 X A short name for this export.


 X

 X	

 X
/
 [" An optional, longer description.


 [

 [	

 [
y
 ^l Hostname of the Kentik deployment where the API calls related to this export should go, eg. api.kentik.com


 ^

 ^	

 ^
w
 aj Hostname of the Kentik deployment where the data generated by this export should go, eg. flow.kentik.com


 a

 a	

 a
K
 d> The identifier of the Kentik plan associated with this task.


 d

 d	

 d
W
 gJ The cloud provider targeted by this export (eg. aws, azure, gce, ibm...)


 g

 g	

 g
@
  jo2 Properties specific to the cloud provider above.


  j

 	k

 	k

 	k

 	k

 
l

 
l

 
l

 
l

 m

 m

 m

 m

 n

 n

 n

 n
%
 r Optional BGP settings.


 r

 r

 r
D
 u7 The most current status Kentik has about this export.


 u

 u	

 u
-
y ?  Optional BGP related settings.



y
b
 {U If true, apply BGP data discovered via another device to the flow from this export.


 {

 {

 {
6
~) Which other device to get BGP data from


~

~	

~
C
?5 FIXME: unclear. "device", "other_device" or "none"?


?

?	

?
R
? ?D Properties specific to Amazon Web Services "vpc flow logs" exports


?
<
 ?. Source S3 bucket to fetch vpc flow logs from


 ?

 ?	

 ?
e
?W ARN for the IAM role to assume when fetching data or making AWS calls for this export


?

?	

?
K
?= AWS region where this bucket resides (FIXME is that right?)


?

?	

?
^
?P If true, attempt to delete vpc flow log chunks from S3 after they've been read


?

?

?

? FIXME


?

?

?
4
? ?& Properties specific to Azure exports


?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?&

?

?!

?$%
:
? ?, Properties specific to Google Cloud export


?

 ?

 ?

 ?	

 ?

?

?

?	

?
8
? ?* Properties specific to IBM Cloud exports


?

 ?

 ?

 ?	

 ?
"
? ? Export task status


?

 ? FIXME


 ?

 ?	

 ?
/
?! If not empty, the current error


?

?	

?
+
?+ If true, we found flow logs


?

?&

?)*

?+

?

?&

?)*

?7

?

?2

?56
?
? ?2| =======================================================
 services
 =======================================================


? 

 ?

 ?

 ?

 ?

? ?

?!

 ?

 ?

 ?

 ?

	? ?

	?


? ?


?


 ?#


 ?



 ?


 ?


 ?!"


?#


?


?	


?!"

? ?

?

 ?

 ?

 ?	

 ?

? ?

?

 ?

 ?

 ?

 ?

? ?

?

 ?

 ?

 ?

 ?
~
?%p CSV values of fields follow the path of Export object with dot notation (ie. "export.name,export.description")


?

? 

?#$

? ?

? 

 ?

 ?

 ?

 ?

? ?

? 

 ?

 ?

 ?

 ?

? ?

?!

 ?

 ?

 ?

 ?

? ?

? 

 ?

 ?

 ?	

 ?

? ?

?!

 ? ?

 ?

 ?C

 ??C

 ?J

 ?*?J

  ??

  ?

  ?0

  ?;T

  ?Q

  ?*?Q

  ??

	  ?ʼ"??

  ??

  ???

 ??

 ?

 ?,

 ?7N

 ?P

 ?*?P

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?*

 ?5K

 ?P

 ?*?P

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?.

 ?9Q

 ?Q

 ?*?Q

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?0

 ?;T

 ?Q

 ?*?Q

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?0

 ?;T

 ?Q

 ?*?Q

 ??

	 ?ʼ"??

 ??

 ???bproto3??  
?.
,kentik/cloud_gw/v202103alpha1/cloud_gw.protokentik.cloud_gw.v202103alpha1google/api/annotations.protogoogle/api/client.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto(grpc/http_over_grpc/http_over_grpc.proto"Z
LoginAwsRequest
region (	Rregion
role (	Rrole
	caller_id (	RcallerId"
LoginAwsResponse"v
ProxyAwsRequest
region (	RregionK
http_request (2(.grpc.http_over_grpc.HTTPOverGRPCRequestRhttpRequest"_
ProxyAwsResponseK
http_response (2&.grpc.http_over_grpc.HTTPOverGRPCReplyRhttpResponse"
ListAwsRolesRequest"?
ListAwsRolesResponsex
cid_region_to_roles (2I.kentik.cloud_gw.v202103alpha1.ListAwsRolesResponse.CidRegionToRolesEntryRcidRegionToRolesl
CidRegionToRolesEntry
key (	Rkey=
value (2'.kentik.cloud_gw.v202103alpha1.RoleListRvalue:8" 
RoleList
roles (	Rroles"D
GetAwsRequest
region (	Rregion
	caller_id (	RcallerId"|
GetAwsResponse

request_id (R	requestIdK
http_request (2(.grpc.http_over_grpc.HTTPOverGRPCRequestRhttpRequest"|
SendAwsRequest

request_id (R	requestIdK
http_response (2&.grpc.http_over_grpc.HTTPOverGRPCReplyRhttpResponse"
SendAwsResponse"2
Header
key (	Rkey
values (	Rvalues2?
AwsGwInternalService?
ProxyAws..kentik.cloud_gw.v202103alpha1.ProxyAwsRequest/.kentik.cloud_gw.v202103alpha1.ProxyAwsResponse"M??admin.cloud_gw:write????/"*/cloud_gw/v202103alpha1/proxy_aws/{region}:*?
ListAwsRoles2.kentik.cloud_gw.v202103alpha1.ListAwsRolesRequest3.kentik.cloud_gw.v202103alpha1.ListAwsRolesResponse"E??admin.cloud_gw:read????(&/cloud_gw/v202103alpha1/list_aws_roles,?Acloud_gw.api.kentik.com??admin.cloud_gw2?
AwsGwExternalService?
LoginAws..kentik.cloud_gw.v202103alpha1.LoginAwsRequest/.kentik.cloud_gw.v202103alpha1.LoginAwsResponse"J??admin.cloud_gw:write????,*/cloud_gw/v202103alpha1/login_aws/{region}?
GetAws,.kentik.cloud_gw.v202103alpha1.GetAwsRequest-.kentik.cloud_gw.v202103alpha1.GetAwsResponse"???admin.cloud_gw:write????!/cloud_gw/v202103alpha1/get_aws?
SendAws-.kentik.cloud_gw.v202103alpha1.SendAwsRequest..kentik.cloud_gw.v202103alpha1.SendAwsResponse"P??admin.cloud_gw:write????2"-/cloud_gw/v202103alpha1/send_aws/{request_id}:*??admin.cloud_gwB?ZIgithub.com/kentik/api-schema/gen/go/kentik/cloud_gw/v202103alpha1;cloudgw?A?U
CLOUD GW API"7
Kentik API Engineeringhttps://github.com/kentik/api2202103alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ?
  ?

  

 &
	
  &
	
 !
	
 8
	
 5
	
 2


 `
	

 `
	
 8

? 8
4
 ; M( Called by clients of cloud-gw (Blake).



 ;


 <?

 ?<?


 =F

 ?*=F

  ?E

  ?

  ?

  ?)9

  @M

  ?*@M

  AD

	  ?ʼ"AD

 GL

 G

 G&

 G1E

 HL

 ?*HL

 IK

	 ?ʼ"IK
L
P o@ Called by cloud-api-proxy instances in transfluo & orangeflow.



P


QF

?*QF
?
 W\? LoginAws is used to tell the gateway that there's a listener active for a
 given region.  A proxy starts a LoginAws, then services Get/SendAws
 requests, and ends the LoginAws via context cancellation when it shuts
 down (or disconnects).


 W

 W

 W)9

 XM

 ?*XM

 Y[

	 ?ʼ"Y[
?
af? The client calls GetAws to get a request from the gateway.  It runs the
 request, and returns the result via SendAws, linking them together via
 request_id.


a

a

a%3

bM

?*bM

ce

	?ʼ"ce

hn

h

h

h'6

iM

?*iM

jm

	?ʼ"jm


 q w


 q

  r

  r

  r	

  r

 s

 s

 s	

 s
a
 vT caller_id in LoginAwsRequest must be the same as caller_id in all
 GetAwsRequests.


 v

 v	

 v
	
x 


x
(
{ ~ cid from headers / context



{

 |

 |

 |	

 |

};

})

}*6

}9:

? ?

?
A
 ?:3 HTTPOverGRPCResponse http_over_grpc_response = 1;


 ?'

 ?(5

 ?89


? 

?
?
? ?? This API is certainly open to discussion.  Instead of a map with a key you
 then have to parse, I could return a list of struct{cid, region, role} (or
 something else, of course), if that would work better.

 In raw Go I'd do it differently, but trying to mimic that in protobuf gets
 ugly, imho.


?
!
 ?0 key is cid~region


 ?

 ?+

 ?./

? ?

?

 ?

 ?


 ?

 ?

 ?

? ?

?

 ?

 ?

 ?	

 ?
b
?T caller_id in LoginAwsRequest must be the same as caller_id in all
 GetAwsRequests.


?

?	

?

? ?

?

 ?

 ?

 ?

 ?

?;

?)

?*6

?9:

	? ?

	?

	 ?

	 ?

	 ?

	 ?

	?:

	?'

	?(5

	?89



? 


?

? ?

?

 ?

 ?

 ?	

 ?

?

?


?

?

?bproto3??  
?
0kentik/cloud_maps/v202201alpha1/cloud_maps.protokentik.cloud_maps.v202201alpha1google/api/http.protogoogle/api/annotations.protogoogle/api/client.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto"?
(ProvideAwsMetadataStorageLocationRequest
version (	Rversion1
source_aws_account_id (	RsourceAwsAccountId*
source_aws_region (	RsourceAwsRegion"J
)ProvideAwsMetadataStorageLocationResponse

target_url (	R	targetUrl"?
!GetAwsCrawlerConfigurationRequest
version (	Rversion1
source_aws_account_id (	RsourceAwsAccountId*
source_aws_region (	RsourceAwsRegion"@
"GetAwsCrawlerConfigurationResponse
services (	Rservices2?
CloudMapsService?
!ProvideAwsMetadataStorageLocationI.kentik.cloud_maps.v202201alpha1.ProvideAwsMetadataStorageLocationRequestJ.kentik.cloud_maps.v202201alpha1.ProvideAwsMetadataStorageLocationResponse"??A?'Provide location for given AWS metadataFProvides location at which the API client may store AWS cloud metadata*AwsMetadataStorageLocation??admin.cloud_maps:write????:"5/cloud_maps/v202201alpha1/ingest/aws_storage_location:*?
GetAwsCrawlerConfigurationB.kentik.cloud_maps.v202201alpha1.GetAwsCrawlerConfigurationRequestC.kentik.cloud_maps.v202201alpha1.GetAwsCrawlerConfigurationResponse"??A?Get AWS crawler configurationPGet AWS crawler configuration that determines what AWS cloud metadata to collect*AwsConfiguration??admin.cloud_maps:read????7"2/cloud_maps/v202201alpha1/ingest/aws_configuration:**?Agrpc.api.kentik.com??admin.cloud_mapsB?ZNgithub.com/kentik/api-schema/gen/go/kentik/cloud_maps/v202201alpha1;cloud_maps?A?8
Cloud Maps API"
Kentik API Engineering2202201alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ?	
  o

  

 (

 e
	
 e
	
  
	
 &
	
 !
	
 8
	
	 5
	
 6

? 6


 8 ?


 80
-
  :  only "aws-1.0" literal for now


  :

  :	

  :
&
 <# 12-digit AWS account ID


 <

 <	

 <!"

 > AWS region code


 >

 >	

 >


A C


A1

 B

 B

 B	

 B


E L


E)
-
 G  only "aws-1.0" literal for now


 G

 G	

 G
&
I# 12-digit AWS account ID


I

I	

I!"

K AWS region code


K

K	

K


N P


N*

 O

 O

 O	

 O


 R o


 R


 S;

 ?S;


 TH

 ?*TH

  Va

  V'

  V(P

  V[?

  WO

  ?*WO

  X[

	  ?ʼ"X[

  \`

  ?\`

 cn

 c 

 c!B

 cMo

 dN

 ?*dN

 eh

	 ?ʼ"eh

 im

 ?imbproto3??    
?	
&kentik/core/v202012alpha1/errors.protokentik.core.v202012alpha1google/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto"?
	ErrorInfo#
code (B?A2
Error codeRcode,
message (	B?A2Error messageRmessageW
correlation_id (	B0?A-2+Unique event identifier for server requestsRcorrelationIdd
	timestamp (2.google.protobuf.TimestampB*?A'2%Date and time when this error occuredR	timestampg
documentation_link (	B8?A523Optional link to documentation regarding this errorRdocumentationLinkBJZHgithub.com/kentik/api-schema/gen/go/kentik/core/v202012alpha1;kentik_apiJ?
 

 2 Error information


 "

 _
	
 _
	
  )
	
 8


 
 


 


  

  

  

  

  

  ?

 

 

 	

 

 

 ?

 

 

 	

 

 

 ?

 

 

 %

 ()

 *

 ?+

 

 

 	

 

  

 ?!bproto3??  
?"
<kentik/event_view_model/v202204alpha1/event_view_model.proto%kentik.event_view_model.v202204alpha1google/api/annotations.protogoogle/api/client.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.protogoogle/protobuf/timestamp.protogoogle/protobuf/struct.proto"

AlarmEvent
id (	Rid"i
GetViewModelRequestI
alarm (21.kentik.event_view_model.v202204alpha1.AlarmEventH RalarmB
event"{
EventViewDetail
name (	Rname
label (	Rlabel
tag (	Rtag,
value (2.google.protobuf.ValueRvalue"?
EventViewModelH
type (24.kentik.event_view_model.v202204alpha1.EventViewTypeRtype
group (	Rgroup 
description (	Rdescription
	is_active (RisActive9

start_time (2.google.protobuf.TimestampR	startTime5
end_time (2.google.protobuf.TimestampRendTime#
current_state (	RcurrentState%
previous_state (	RpreviousStateZ

importance	 (2:.kentik.event_view_model.v202204alpha1.EventViewImportanceR
importanceP
details
 (26.kentik.event_view_model.v202204alpha1.EventViewDetailRdetails"c
GetViewModelResponseK
model (25.kentik.event_view_model.v202204alpha1.EventViewModelRmodel*?
EventViewType
EVENT_VIEW_TYPE_UNSPECIFIED 
EVENT_VIEW_TYPE_ALERT
EVENT_VIEW_TYPE_MITIGATION
EVENT_VIEW_TYPE_SYNTHETIC
EVENT_VIEW_TYPE_INSIGHT"
EVENT_VIEW_TYPE_CUSTOM_INSIGHT*?
EventViewImportance%
!EVENT_VIEW_IMPORTANCE_UNSPECIFIED !
EVENT_VIEW_IMPORTANCE_HEALTHY 
EVENT_VIEW_IMPORTANCE_NOTICE
EVENT_VIEW_IMPORTANCE_MINOR!
EVENT_VIEW_IMPORTANCE_WARNING
EVENT_VIEW_IMPORTANCE_MAJOR 
EVENT_VIEW_IMPORTANCE_SEVERE"
EVENT_VIEW_IMPORTANCE_CRITICAL2?
EventViewModelService?
GetViewModel:.kentik.event_view_model.v202204alpha1.GetViewModelRequest;.kentik.event_view_model.v202204alpha1.GetViewModelResponse"??A?MEvent view model will provide event context necessary to render notifications9GetViewModel will provide event view model data structure*GetViewModel????5"0/event_view_model/v202204alpha1/event_view_model:*?Agrpc.api.kentik.com??B?ZZgithub.com/kentik/api-schema/gen/go/kentik/event_view_model/v202204alpha1;event_view_model?A?<
EventViewModel API"
Kentik API Engineering2202204alpha1*2application/json:application/jsonr5
More about Kentik APIshttps://docs.kentik.com/apiJ?
  b

  

 .

 q
	
 q
	
  &
	
 !
	
 8
	
 5
	
	 )
	

 &
	
 

? 


  


 

  

  

  	

  


! %


!

 "$

 "

 #

 #

 #

 #


 ' .


 '

  ("

  (

  ( !

 )

 )

 )

 *!

 *

 * 

 + 

 +

 +

 ,

 ,

 ,

 -%

 - 

 -#$


0 9


0

 1(

 1#

 1&'

2$

2

2"#

3#

3

3!"

4"

4

4 !

5$

5

5"#

6"

6

6 !

7#

7

7!"

8%

8 

8#$


; @


;

 <

 <

 <	

 <

=

=

=	

=

>

>

>	

>

?"

?

?

? !


B M


B

 C

 C

 C

 C

D

D

D	

D

E

E

E	

E

F

F

F

F

G+

G

G&

G)*

H)

H

H$

H'(

I

I

I	

I

J

J

J	

J

K%

K

K 

K#$

	L(

	L


	L

	L"

	L%'


O Q


O

 P

 P

 P

 P


 S b


 S


 T;

 ?T;


 U<

 ?*U<

  Wa

  W

  W&

  W1E

  X[

	  ?ʼ"X[

  \`

  ?\`bproto3??  
??
2kentik/insights/backend/v0/models-definition.protokentik.api.insights.v02kentik/alerting/backend/v0/alertproto/policy.protogoogle/protobuf/struct.proto"?

InsightDefinition 
insightName (	RinsightName.
insightDisplayName (	RinsightDisplayName
family (	Rfamily
icon (	Ricon 
description (	RdescriptionN
dataSourceType (2&.kentik.api.insights.v0.DataSourceTypeRdataSourceType,
overrideCompanyID (RoverrideCompanyID(
refreshDuration (	RrefreshDuration6
status (2.kentik.api.insights.v0.StatusRstatus,
retentionDuration (	RretentionDuration
notes (	Rnotes 
jsxTemplate (	RjsxTemplate$
plainTemplate (	RplainTemplate
weight (Rweight*
approvalRequired (RapprovalRequiredE
dataExplorerQuery (2.google.protobuf.StructRdataExplorerQueryO
alerting (21.kentik.api.insights.v0.AlertingInsightDefinitionH Ralerting@
kde (2,.kentik.api.insights.v0.KDEInsightDefinitionH RkdeC
ksql	 (2-.kentik.api.insights.v0.KSQLInsightDefinitionH Rksql=
db
 (2+.kentik.api.insights.v0.DBInsightDefinitionH RdbO
combined (21.kentik.api.insights.v0.CombinedInsightDefinitionH RcombinedI
custom (2/.kentik.api.insights.v0.CustomInsightDefinitionH RcustomU

comparison (23.kentik.api.insights.v0.ComparisonInsightDefinitionH R
comparisonL
factors (20.kentik.api.insights.v0.FactorsInsightDefinitionH RfactorsB
typeSpecificDetails"S
AlertingInsightDefinition6
policy (2.kentik.api.alerting.v0.PolicyRpolicy"?
KDEInsightDefinition<
topXDataQueryJSONTemplate (	RtopXDataQueryJSONTemplate.
startRelativeToNow (	RstartRelativeToNow*
endRelativeToNow (	RendRelativeToNow

dimensions (	R
dimensions
metrics (	Rmetrics"?
KSQLInsightDefinition
	ksqlQuery (	R	ksqlQuery.
startRelativeToNow (	RstartRelativeToNow*
endRelativeToNow (	RendRelativeToNow?
rawDimensionToDimension (2J.kentik.api.insights.v0.KSQLInsightDefinition.RawDimensionToDimensionEntryRrawDimensionToDimensionr
rawMetricToMetric (2D.kentik.api.insights.v0.KSQLInsightDefinition.RawMetricToMetricEntryRrawMetricToMetric"
chwwwQueries (	RchwwwQueries
kdeQuery (	RkdeQuery0
kdeQueryDescription (	RkdeQueryDescriptionJ
RawDimensionToDimensionEntry
key (	Rkey
value (	Rvalue:8D
RawMetricToMetricEntry
key (	Rkey
value (	Rvalue:8"?
DBInsightDefinition
sqlQuery (	RsqlQuery3
sqlDB (2.kentik.api.insights.v0.SQLDBRsqlDB.
startRelativeToNow (	RstartRelativeToNow*
endRelativeToNow (	RendRelativeToNow"?
CombinedInsightDefinition

expression (	R
expression"
insightNames (	RinsightNames

dimensions (	R
dimensions
metric (	Rmetric"?
CustomInsightDefinition

customName (	R
customNameJ
kvs (28.kentik.api.insights.v0.CustomInsightDefinition.KvsEntryRkvs6
KvsEntry
key (	Rkey
value (	Rvalue:8"?
ComparisonInsightDefinition(
comparisonQuery (	RcomparisonQuery.
startRelativeToNow (	RstartRelativeToNow*
endRelativeToNow (	RendRelativeToNow?
rawDimensionToDimension (2P.kentik.api.insights.v0.ComparisonInsightDefinition.RawDimensionToDimensionEntryRrawDimensionToDimensionx
rawMetricToMetric (2J.kentik.api.insights.v0.ComparisonInsightDefinition.RawMetricToMetricEntryRrawMetricToMetric(
thresholdMetric (	RthresholdMetricS

thresholds (23.kentik.api.insights.v0.ComparisonInsightThresholdsR
thresholdsJ
RawDimensionToDimensionEntry
key (	Rkey
value (	Rvalue:8D
RawMetricToMetricEntry
key (	Rkey
value (	Rvalue:8"?
ComparisonInsightThresholds 
valueChange (RvalueChange2
nKeysHighValueChange (RnKeysHighValueChange.
maxValueDropAnyKey	 (RmaxValueDropAnyKey>
maxValueDropAbsoluteAnyKey
 (RmaxValueDropAbsoluteAnyKey6
maxValueIncreaseAnyKey (RmaxValueIncreaseAnyKeyF
maxValueIncreaseAbsoluteAnyKey (RmaxValueIncreaseAbsoluteAnyKey"
nKeysMissing (RnKeysMissing
nNewKeys (RnNewKeys 
nStickyKeys (RnStickyKeys@
nStickyKeysMustNotLeaveTopN (RnStickyKeysMustNotLeaveTopN$
avgRankChange (RavgRankChangeJ"?
FactorsInsightDefinition

eventQuery (	R
eventQuery.
startRelativeToNow (	RstartRelativeToNow*
endRelativeToNow (	RendRelativeToNow?
rawDimensionToDimension (2M.kentik.api.insights.v0.FactorsInsightDefinition.RawDimensionToDimensionEntryRrawDimensionToDimensionu
rawMetricToMetric (2G.kentik.api.insights.v0.FactorsInsightDefinition.RawMetricToMetricEntryRrawMetricToMetric~
rawMetricToMetricOld (2J.kentik.api.insights.v0.FactorsInsightDefinition.RawMetricToMetricOldEntryRrawMetricToMetricOld&
drilldownQuery (	RdrilldownQuery~
 drilldownDimensionsBySpecificity (22.kentik.api.insights.v0.FactorsDrilldownDimensionsR drilldownDimensionsBySpecificity>
eventContributionThreshold	 (ReventContributionThreshold8
absValueChangeThreshold
 (RabsValueChangeThresholdJ
RawDimensionToDimensionEntry
key (	Rkey
value (	Rvalue:8D
RawMetricToMetricEntry
key (	Rkey
value (	Rvalue:8G
RawMetricToMetricOldEntry
key (	Rkey
value (	Rvalue:8"<
FactorsDrilldownDimensions

dimensions (	R
dimensions*?
DataSourceType
unknownDataSourceType 
alerting
kde
ksql
db
combined

custom

manual

comparison
factors	*B
Status
unknownStatus 
enabled
disabled

hidden*
SQLDB	
chwww BZv0/insightsJ?l
  ?

  

 

 "
	
 "
	
  <
	
 &
h
 
 W\ An InsightDefinition fully describes how instances of a
 particular insight are generated.



 


  r insightName is the unique string identifying this insight.
 For example, "core.networkHealth.deviceTrafficDrop".


  

  	

  
M
 !@ insightDisplayName is the human-friendly name of this insight.


 

 	

  
o
 b family is the human-friendly category name for this insight.
 For example, "Connectivity Costs".


 

 	

 
f
 Y icon is the id of an icon to be used with this insight,
 as interpreted by Kentik's UI.


 

 	

 
?
 ? description is a general description of the insight definition.
 It is not a templated description of an instance of the insight.
 For that, see plainTemplate, jsxTemplate.


 

 	

 
`
 !$S dataSourceType is the underlying source of the insight, such
 as alerting or KDE.


 !

 !

 !"#
?
 &? overrideCompanyID is only present if this InsightDefinition is
 an edited version of another InsightDefinition, which only
 applies for this company id.


 &

 &

 &
?
 *? refreshDuration is a golang time.Duration string (e.g. "30m", "5h") which
 describes the time after which the system should recalculate the insight.


 *

 *	

 *
Q
 -D status indicates whether this InsightDefinition is enabled or not.


 -

 -	

 -
?
 	1? retentionDuration is a golang time.Duration string (e.g. "30m", "5h") which
 describes the time after which stale insights are deleted.


 	1

 	1	

 	1
^
 
4Q notes is human readable notes about what this insight means, how it works, etc.


 
4

 
4	

 
4
?
 8t jsxTemplate is a golang text/template string that produces JSX to be
 used to display an instance of this insight.


 8

 8	

 8
?
 <} plainTemplate is a golang text/template string that produces plain text
 to be used to display an instance of this insight.


 <

 <	

 <
A
 ?4 weight is a weight applied to sorting of insights.


 ?

 ?	

 ?
y
 Cl approvalRequired is whether the insight needs to be approved by Kentik
 before being visible to customers.


 C

 C

 C
?
 I0? dataExplorerQuery is a JSON object in the format expected by the Kentik UI
 to create a data explorer query. This object will be modified and extended to
 match a specific insight. Its string fields may be golang template strings,
 which will be filled in.


 I

 I*

 I-/
e
  MVW typeSpecificDetails holds additional definition info specific to
 e.g. alerting, kde.


  M

 N+

 N

 N&

 N)*

 O!

 O

 O

 O 

 P#

 P

 P

 P!"

 Q 

 Q

 Q

 Q

 R,

 R

 R&

 R)+

 S(

 S

 S"

 S%'

 T0

 T

 T *

 T-/

 U*

 U

 U$

 U')


 Y d


 Y

  Z

  Z

  Z

 [

 [


 [

 \


 \

 \	

 ]

 ]

 ]	


 ^	

 ^

 ^

 _

 _


 _

 `

 `

 `

 a

 a

 a

 b

 b

 b

 	c

 	c	

 	c


f k


f

 g

 g

 g

h

h	

h

i

i


i

j

j

j


m o


m!

 n-

 n!

 n"(

 n+,

q ?


q
?
 x'? topXDataQueryJSONTemplate is a golang text/template template that produces
 JSON that will be sent as the payload to chnode's /api/v5/query/topXdata endpoint.
 When parsed and executed, the template will use the delimeters "<<%" and "%>>", and
 the parameters "StartingTime" and "EndingTime" will be provided. StartingTime
 and EndingTime are set based on the values of startRelativeToNow and endRelativeToNow
 below.


 x

 x	"

 x%&
?
| ? startRelativeToNow is a golang time.Duration string (e.g. "30m", "5h") which
 describes what StartingTime will be set to in the query.


|

|	

|
?
?? endRelativeToNow is a golang time.Duration string (e.g. "30m", "5h") which
 describes what EndingTime will be set to in the query.


?

?	

?
?
?!? dimensions is an array of the dimensions expected to be returned in the topXdata
 response. Note that this may not be the same as the "dimensions" field.
 These will then form the dimensions of the generated insight.


?


?

?

? 
?
?? metrics is an array of the metrics expected to be returned in the topXdata
 response. Note that this may not be the same as the "metrics" field.
 These will then form the metrics of the generated insight.


?


?

?

?

? ?

?
?
 ?s ksqlQuery is a KSQL query, fit to be passed to queryrelay. It must have as
 its parameters (in order) start, end.


 ?

 ?	

 ?
?
? ? startRelativeToNow is a golang time.Duration string (e.g. "30m", "5h") which
 describes what start will be set to in the query.


?

?	

?
?
?} endRelativeToNow is a golang time.Duration string (e.g. "30m", "5h") which
 describes what end will be set to in the query.


?

?	

?
~
?2p rawDimensionToDimension maps the dimension names from the sql response to
 the dimensions used in the insight.


?

?-

?01
r
?,d rawMetricToMetric maps the metric names from the sql response to
 the metrics used in the insight.


?

?'

?*+
?
?#} chwwwQueries is a list of sql queries against ch_www, the results of which
 are available via templating in the ksql query.


?


?

?

?!"

?

?

?

?

?'

?

?"

?%&

? ?

?
?
 ?z sqlQuery is a sql query fit to be run against ch_www. It must have as
 its parameters (in order) company_id, start, end.


 ?

 ?	

 ?
?
?? sqlDB is the well-known Kentik database the query should be run against.
 As of this writing this is just chwww, but it could be additional new
 aggregate databases.


?

?

?
?
? ? startRelativeToNow is a golang time.Duration string (e.g. "30m", "5h") which
 describes what start will be set to in the query.


?

?	

?
?
?? endRelativeToNow is a golang time.Duration string (e.g. "30m", "5h") which
 describes what EndingTime will be set to in the query.


?

?	

?

? ?

?


 ?

 ?

 ?


? ?

?!
?
 ?? expression is a golang text/template template that evaluates to a number.
 Within the template, arithmetic functions are available: add, subtract, multiply, divide.
 Insight values are accessible by the function i(insightName).
 For example,
 `{{multiply 100.0 (divide (i "core.networkHealth.flowsThisWeek") (i "core.networkHealth.flowsLastWeek"))}}`
 Only insights with identical dimensions and values are used.


 ?

 ?	

 ?
^
?#P insightNames is a list of the dependent insight names, used in the expression.


?


?

?

?!"
U
?!G dimensions is a list of the dimension names needed in the expression.


?


?

?

? 
C
?5 metric is the type of the result of the expression.


?

?	

?

? ?

?
?
 ?} customName is the identifier of the custom code that will be executed. This is
 a string defined in the server source code.


 ?

 ?	

 ?
0
?" kvs is a set of key-value pairs.


?

?

?

? ?

?#
?
 ?y comparisonQuery is a KSQL query, fit to be passed to queryrelay. It must have as
 its parameters (in order) start, end.


 ?

 ?	

 ?
?
? ? startRelativeToNow is a golang time.Duration string (e.g. "30m", "5h") which
 describes what start will be set to in the query.


?

?	

?
?
?} endRelativeToNow is a golang time.Duration string (e.g. "30m", "5h") which
 describes what end will be set to in the query.


?

?	

?
~
?2p rawDimensionToDimension maps the dimension names from the sql response to
 the dimensions used in the insight.


?

?-

?01
r
?,d rawMetricToMetric maps the metric names from the sql response to
 the metrics used in the insight.


?

?'

?*+
?
?? ThresholdMetric indicates which of the metrics listed in rawMetricToMetric will be subject
 to the threshold rules.  A comparison-insight query can return multiple metrics, as listed
 in the rawMetricToMetric list above.  But only one of the metrics will be subject to thresholding;
 the other values will be reported in the insight's metricToValue map, but don't directly affect
 the insight's severity or interestingness.  The name used for the metric here should be the insight
 name for the metric; that is, the value in the metric's rawMetricToMetric entry, not the key.


?

?	

?
_
?-Q thresholds are the threholds at which the comparison is considered interesting.


?

?(

?+,

? ?

?#

 ? value change


 ?

 ?	

 ?

?!

?

?

? 
?
? ? If a single key exceeds maxValueDropAnyKey (percentage) and maxValueDropAbsoluteAnyKey (abs value),
 this threshold is tripped.
", must be negative to make sense. e.g. -0.95


?

?	

?

?)

?

?	#

?&(
?
?%? If a single key exceeds maxValueIncreaseAnyKey (percentage) and maxValueIncreaseAbsoluteAnyKey (abs value),
 this threshold is tripped.


?

?	

?"$

?-

?

?	'

?*,

? counts


?

?

?

?

?

?

?

?

?

?

?

	?(" e.g. 1


	?

	?#

	?&'


? rank change



?


?	


?
>
	? removed fields
" double maxAvgValueChange = 3;


	 ?

	 ?

	? ?

	? 
?
	 ?? eventQuery is a KSQL query, fit to be passed to queryrelay. It must have as
 its parameters (in order) start, end.
 It is used to find events to drill down into.


	 ?

	 ?	

	 ?
?
	? ? startRelativeToNow is a golang time.Duration string (e.g. "30m", "5h") which
 describes what start will be set to in the query.


	?

	?	

	?
?
	?} endRelativeToNow is a golang time.Duration string (e.g. "30m", "5h") which
 describes what end will be set to in the query.


	?

	?	

	?

	?2

	?

	?-

	?01

	?,

	?

	?'

	?*+

	?/

	?

	?*

	?-.
?
	?? drilldownQuery is a KSQL query, fit to be passed to queryrelay. It must have as
 its parameters (in order) selectColumns, start, end.
 It is used to drill down on an event


	?

	?	

	?
w
	?Ki drilldownDimensionsBySpecificity is a list of list of dimensions, ordered
 by specificity (descending).


	?


	?%

	?&F

	?IJ
?
	?(? eventContributionThreshold controls how much of the event (i.e. % of traffic increase)
 must be attributed to the explaining factors.


	?

	?	#

	?&'
?
		?&? absValueChangeThreshold controls what the value change on the factored event must be.
 For instance if it is set to 0.50, if an event is detected that has a 75% increase in
 bps as measured by snmp and then it is factored and has a 40% increase in bps as measured
 by flow, then the event will be discarded.


		?

		?	 

		?#%


? ?


?"


 ?!


 ?



 ?


 ?


 ? bproto3??  
?;
(kentik/insights/backend/v0/factors.protokentik.api.insights.v0google/protobuf/duration.protogoogle/protobuf/timestamp.proto2kentik/insights/backend/v0/models-definition.proto"?
FactorsRequest=
event (2'.kentik.api.insights.v0.UnfactoredEventReventC
settings (2'.kentik.api.insights.v0.FactorsSettingsRsettings"?
UnfactoredEvent:

eventStart (2.google.protobuf.TimestampR
eventStart6
eventEnd (2.google.protobuf.TimestampReventEndP
comparisonPeriodStart (2.google.protobuf.TimestampRcomparisonPeriodStartL
comparisonPeriodEnd (2.google.protobuf.TimestampRcomparisonPeriodEndi
dimensionToValue (2=.kentik.api.insights.v0.UnfactoredEvent.DimensionToValueEntryRdimensionToValueC
DimensionToValueEntry
key (	Rkey
value (	Rvalue:8"?
FactorsSettingsR
drilldownType (2,.kentik.api.insights.v0.FactorsDrilldownTypeRdrilldownType~
 drilldownDimensionsBySpecificity (22.kentik.api.insights.v0.FactorsDrilldownDimensionsR drilldownDimensionsBySpecificity"
drilldownSQL (	RdrilldownSQL$
drilldownSQLs (	RdrilldownSQLs$
showAllDetail (RshowAllDetail4
contributionThreshold (RcontributionThreshold
metrics (	Rmetrics?
eventDuration	 (2.google.protobuf.DurationReventDurationE
lookbackDuration
 (2.google.protobuf.DurationRlookbackDuration"?
FactorsResponse;
event (2%.kentik.api.insights.v0.FactoredEventReventV
explainingFactors (2(.kentik.api.insights.v0.ExplainingFactorRexplainingFactorsM
allFactorsFound
 (2#.kentik.api.insights.v0.FactorsListRallFactorsFound"?
FactoredEventg
dimensionToValue (2;.kentik.api.insights.v0.FactoredEvent.DimensionToValueEntryRdimensionToValueg
metricToValueOld (2;.kentik.api.insights.v0.FactoredEvent.MetricToValueOldEntryRmetricToValueOldg
metricToValueNew (2;.kentik.api.insights.v0.FactoredEvent.MetricToValueNewEntryRmetricToValueNew:

eventStart (2.google.protobuf.TimestampR
eventStart6
eventEnd (2.google.protobuf.TimestampReventEndP
comparisonPeriodStart (2.google.protobuf.TimestampRcomparisonPeriodStartL
comparisonPeriodEnd (2.google.protobuf.TimestampRcomparisonPeriodEndX
valueChange (26.kentik.api.insights.v0.FactoredEvent.ValueChangeEntryRvalueChangeC
DimensionToValueEntry
key (	Rkey
value (	Rvalue:8C
MetricToValueOldEntry
key (	Rkey
value (Rvalue:8C
MetricToValueNewEntry
key (	Rkey
value (Rvalue:8>
ValueChangeEntry
key (	Rkey
value (Rvalue:8"?
ExplainingFactorj
dimensionToValue (2>.kentik.api.insights.v0.ExplainingFactor.DimensionToValueEntryRdimensionToValuej
metricToValueOld (2>.kentik.api.insights.v0.ExplainingFactor.MetricToValueOldEntryRmetricToValueOldj
metricToValueNew (2>.kentik.api.insights.v0.ExplainingFactor.MetricToValueNewEntryRmetricToValueNew[
valueChange (29.kentik.api.insights.v0.ExplainingFactor.ValueChangeEntryRvalueChangem
eventContribution (2?.kentik.api.insights.v0.ExplainingFactor.EventContributionEntryReventContribution2
eventContributionAvg (ReventContributionAvg0
start (2.google.protobuf.TimestampRstart,
end (2.google.protobuf.TimestampRendC
DimensionToValueEntry
key (	Rkey
value (	Rvalue:8C
MetricToValueOldEntry
key (	Rkey
value (Rvalue:8C
MetricToValueNewEntry
key (	Rkey
value (Rvalue:8>
ValueChangeEntry
key (	Rkey
value (Rvalue:8D
EventContributionEntry
key (	Rkey
value (Rvalue:8"Q
FactorsListB
factors (2(.kentik.api.insights.v0.ExplainingFactorRfactors*=
FactorsDrilldownType
drilldownTypeUnspecified 
bpsBZv0/insightsJ?
  h

  

 

 "
	
 "
	
  (
	
 )
	
 <


 	 


 	

  


  


  


  


 

 

 

 


 




 +

 

 &

 )*
>
)"1 defaults to eventStart + settings.eventDuration




$

'(
A
6"4 defaults to eventStart - settings.lookbackDuration




1

45
J
4"= defaults to comparisonPeriodStart + (eventEnd - eventStart)




/

23
A
+4 dimensionToValue's dimensions must be KDE columns.




&

)*


 <



y
 )l drilldownType specifies a preset drilldown type, which sets the rest of the options. The default is "bps".


 

 $

 '(
v
!Ki drilldownDimensionsBySpecificity is a list of list of dimensions, ordered
 by specificity (descending).


!


!%

!&F

!IJ
?
+? drilldownSQL is a templated KSQL query, using golang text/template style formating.
 The template variables are:
   SelectColumns: a csv list of columns to appear in the select clause
   WhereClause: sql to appear at the end of the where clause, i.e. beginning with "AND ..."
   StartingTime: unix timestamp of the start of the period.
   EndingTime: unix timestamp of the end of the period.
 The query should return the SelectColumns as well as any metrics
 from the UnfactoredEvent's metricToValue.


+

+	

+
?
/$? drilldownSQLs is ignored when empty. If len(drilldownSQLs) == len(drilldownDimensionsBySpecificity),
 then each drilldownSQL sql statement is used to query for the corresponding drilldown dimensions.


/


/

/

/"#

1

1

1

1

3#

3

3	

3!"

5

5


5

5

5

7-" default 10m


7

7(

7+,
(
81" default to event duration


8

8+

8.0


 > A


 >

  ?

  ?

  ?
%
 @
" a single metric, "bps"


 @

 @	


C L


C

 D

 D

 D

 D
;
G2. if empty, explaining factors were not found.


G


G

G-

G01
i
K,\ only present when showAllDetail = true
 corresponding to drilldownDimensionsBySpecificity.


K


K

K&

K)+


N Y


N

 O+

 O

 O&

 O)*

P+

P

P&

P)*

Q+

Q

Q&

Q)*

R+

R

R&

R)*

S)

S

S$

S'(

T6

T

T1

T45

U4

U

U/

U23
G
W&": eventContribution doesn't make sense, this is the event.


W

W!

W$%


[ d


[

 \+

 \

 \&

 \)*

]+

]

]&

])*

^+

^

^&

^)*

_&

_

_!

_$%

`,

`

`'

`*+

a"

a

a	

a !

b&

b

b!

b$%

c$

c

c

c"#


f h


f

 g(

 g


 g

 g#

 g&'bproto3??  
?j
/kentik/insights/backend/v0/models-insight.protokentik.api.insights.v0google/protobuf/duration.protogoogle/protobuf/struct.protogoogle/protobuf/timestamp.proto2kentik/insights/backend/v0/models-definition.proto(kentik/insights/backend/v0/factors.proto2kentik/alerting/backend/v0/alertproto/alarms.proto"?
Insight 
insightName (	RinsightNameN
dataSourceType (2&.kentik.api.insights.v0.DataSourceTypeRdataSourceType
	insightID (	R	insightID
	companyID (R	companyID
userID (RuserID"
definitionID  (RdefinitionIDa
dimensionToValue (25.kentik.api.insights.v0.Insight.DimensionToValueEntryRdimensionToValuej
associatedDimensionToValues2 (2(.kentik.api.insights.v0.DimensionToValueRassociatedDimensionToValuesX
metricToValue (22.kentik.api.insights.v0.Insight.MetricToValueEntryRmetricToValue8
	startTime (2.google.protobuf.TimestampR	startTime4
endTime (2.google.protobuf.TimestampRendTime$
isInteresting	 (RisInteresting(
interestingness
 (Rinterestingness>
creationTime (2.google.protobuf.TimestampRcreationTime&
jsxDescription (	RjsxDescription*
plainDescription (	RplainDescriptionC
severity (2'.kentik.api.insights.v0.InsightSeverityRseverity
flagged (Rflagged
approved (Rapproved*
approvalRequired (RapprovalRequired 
highlighted (Rhighlighted
	voteScore (R	voteScoreE
dataExplorerQuery (2.google.protobuf.StructRdataExplorerQuery;
alerting (2.kentik.api.alerting.v0.AlarmH Ralerting6
kde (2".kentik.api.insights.v0.KDEInsightH Rkde9
ksql (2#.kentik.api.insights.v0.KSQLInsightH Rksql3
db (2!.kentik.api.insights.v0.DBInsightH RdbE
combined (2'.kentik.api.insights.v0.CombinedInsightH RcombinedK

comparison (2).kentik.api.insights.v0.ComparisonInsightH R
comparisonB
factors (2&.kentik.api.insights.v0.FactorsInsightH RfactorsC
metadata (2'.kentik.api.insights.v0.InsightMetadataRmetadata
KdeQuery (	RKdeQuery0
KdeQueryDescription (	RKdeQueryDescriptionC
DimensionToValueEntry
key (	Rkey
value (	Rvalue:8@
MetricToValueEntry
key (	Rkey
value (Rvalue:8B
typeSpecificDetails"?
DimensionToValuej
dimensionToValue (2>.kentik.api.insights.v0.DimensionToValue.DimensionToValueEntryRdimensionToValueC
DimensionToValueEntry
key (	Rkey
value (	Rvalue:8"0

KDEInsight"
kdeInsightID (RkdeInsightID"
KSQLInsight"-
	DBInsight 
dbInsightID (RdbInsightID"?
CombinedInsight,
relatedInsightIDs (	RrelatedInsightIDs"?
ComparisonInsight 
description (	RdescriptionL

oldTopKeys (2,.kentik.api.insights.v0.ComparisonInsightKeyR
oldTopKeysL

newTopKeys (2,.kentik.api.insights.v0.ComparisonInsightKeyR
newTopKeys&
numKeysMissing (RnumKeysMissing

numNewKeys	 (R
numNewKeys.
totalAbsRankChange
 (RtotalAbsRankChange*
avgAbsRankChange (RavgAbsRankChange,
maxAvgValueChange (RmaxAvgValueChange6
numKeysHighValueChange (RnumKeysHighValueChange,
thresholdsCrossed (	RthresholdsCrossedS

thresholds (23.kentik.api.insights.v0.ComparisonInsightThresholdsR
thresholdsI
values (21.kentik.api.insights.v0.ComparisonThresholdValuesRvaluesJJJJ"?
ComparisonInsightKeyn
dimensionToValue (2B.kentik.api.insights.v0.ComparisonInsightKey.DimensionToValueEntryRdimensionToValuen
metricToValueOld (2B.kentik.api.insights.v0.ComparisonInsightKey.MetricToValueOldEntryRmetricToValueOldn
metricToValueNew (2B.kentik.api.insights.v0.ComparisonInsightKey.MetricToValueNewEntryRmetricToValueNew
rankOld (RrankOld
rankNew (RrankNewC
DimensionToValueEntry
key (	Rkey
value (	Rvalue:8C
MetricToValueOldEntry
key (	Rkey
value (Rvalue:8C
MetricToValueNewEntry
key (	Rkey
value (Rvalue:8"?
ComparisonThresholdValues|
highestValueDropKey (2J.kentik.api.insights.v0.ComparisonThresholdValues.HighestValueDropKeyEntryRhighestValueDropKey8
highestValueDropPercent (RhighestValueDropPercent:
highestValueDropAbsolute (RhighestValueDropAbsolute?
highestValueIncreaseKey (2N.kentik.api.insights.v0.ComparisonThresholdValues.HighestValueIncreaseKeyEntryRhighestValueIncreaseKey@
highestValueIncreasePercent (RhighestValueIncreasePercentB
highestValueIncreaseAbsolute (RhighestValueIncreaseAbsoluteF
HighestValueDropKeyEntry
key (	Rkey
value (	Rvalue:8J
HighestValueIncreaseKeyEntry
key (	Rkey
value (	Rvalue:8"?
FactorsInsight;
event (2%.kentik.api.insights.v0.FactoredEventReventV
explainingFactors (2(.kentik.api.insights.v0.ExplainingFactorRexplainingFactorsM
allFactorsFound (2#.kentik.api.insights.v0.FactorsListRallFactorsFound"?
InsightMetadataB
executionStart (2.google.protobuf.TimestampRexecutionStart>
executionEnd (2.google.protobuf.TimestampRexecutionEndG
executionDuration (2.google.protobuf.DurationRexecutionDuration
error (	Rerror*l
InsightSeverity
noneSeverity 

notice	
minor
warning	
major

severe
criticalBZv0/insightsJ?@
  ?

  

 

 "
	
 "
	
  (
	
 &
	
 )
	
 <
	
	 2
	

 <


  n


 
?
  z insightName is the unique string identifying this kind of insight.
 It corresponds to the InsightDefinition.insightName.


  

  	

  
?
 $? dataSourceType describes where this insight came from, such as
 alerting or KDE. It corresponds to the InsightDefinition.DataSourceType.


 

 

 "#
?
 ? insightID is the identifier for this insight.
 The ID consists of a one-character prefix indicating the dataSourceType,
 followed by a numeric id. For example, "a1234" or "k5678".


 

 	

 
<
 / companyID is the company this insight is for.


 

 

 

 

 

 

 

 

 

 

 
?
 !+x dimensionToValue holds the dimensions and their particular value for
 this insight. For example, {"IP_src":"1.2.3.4"}.


 !

 !&

 !)*

 #=

 #


 #

 #7

 #:<
x
 '(k metricToValue holds the metrics and their particular value for this insight.
 For example, {"fps": 1000}.


 '

 '#

 '&'
?
 	,*? startTime indicates the beginning of the window for this insight. For an
 alerting insight, this corresponds to the time the underlying alarm
 started. For a KDE insight, this is the start of the query window.


 	,

 	,%

 	,()
?
 
2(? endTime, if present, indicates the end of the window for this insight. For an
 alerting insight, this corresponds to the time the underlying alarm
 cleared (which may or may not have happened yet).
 For a KDE insight, this is the end of the query window.


 
2

 
2#

 
2&'
?
 7? isInteresting describes whether this insight qualifies as interesting enough
 to be shown in the UI. For alerting insights, this is always true, but for KDE
 or other insights, it may not be true.


 7

 7

 7
`
 :S interestingness is a calculated score describing how interesting this insight is.


 :

 :	

 :
?
 >.? creationTime is when this insight was queried for, if this is an insight that
 is "queried" for. It doesn't apply to alerting insights.


 >

 >(

 >+-
S
 AF jsxDescription is jsx that explains this insight, for use in the ui.


 A

 A	

 A
I
 D< plainDescription is plain text that explains this insight.


 D

 D	

 D
8
 G + severity is the severity of this insight.


 G

 G

 G
D
 J7 flagged is true if the user has flagged this insight.


 J

 J

 J
@
 M3 approved is true if Kentik approved this insight.


 M

 M

 M
O
 PB approvalRequired is true if this insight type requires approval.


 P

 P

 P
F
 S9 highlighted is true if Kentik highlighted this insight.


 S

 S

 S
?
 Y? voteScore is the score given to this insight by the user requesting the insights.
 If the current user voted it "1", then the value is "1".
 If the current user voted it "-1", then the value is "-1".
 If the current user didn't vote for it, then the value is "0".


 Y

 Y

 Y
?
 ^0? dataExplorerQuery is a JSON object in the format expected by the Kentik UI
 to create a data explorer query. This is the final object for use by the UI,
 after having been extended from the insight definition's dataExplorerQuery field.


 ^

 ^*

 ^-/
h
  aiZ typeSpecificDetails holds additional information specific to the source of this insight.


  a

 b/

 b 

 b!)

 b,.

 c

 c

 c

 c

 d

 d

 d

 d

 e

 e

 e

 e

 f"

 f

 f

 f!

 g&

 g

 g 

 g#%

 h 

 h

 h

 h

 k 

 k

 k

 k

 l

 l

 l	

 l

  m(

  m

  m"

  m%'


p r


p

 q+

 q

 q&

 q)*


t w


t
7
 v* kdeInsightID is the id for this insight.


 v

 v

 v


y z


y


| 


|
6
 ~) dbInsightID is the id for this insight.


 ~

 ~

 ~

? ?

?
Y
 ?(K relatedInsightIDs are the insights that were used to create this insight.


 ?


 ?

 ?#

 ?&'

? ?

?

	?

	 ?

	 ?

	?

	?

	?

 ?

 ?

 ?	

 ?
8
	?"+ ComparisonInsightKey mostIncreaseKey = 4;


	?

	?
8
	?"+ ComparisonInsightKey mostDecreaseKey = 5;


	?

	?

?/

?


?

? *

?-.

?/

?


?

? *

?-.

?

?

?

?

?

?

?

?

? 

?

?

?
D
?"6 avg(for each key on both sides, new rank - old rank)


?

?	

?
M
? "? max(for each metric, avg(for each key, (this - last) / last))


?

?	

?
7
?$") count(keys w/ value change > threshold)


?

?

?!#
5
	?)"'the names thresholds that were crossed


	?


	?

	?#

	?&(


?.


?


?(


?+-

?(

?

?"

?%'

? ?

?

 ?+

 ?

 ?&

 ?)*

?+

?

?&

?)*

?+

?

?&

?)*

?

?

?

?

?

?

?

?

? ?

?!
?
 ?.? Of the keys with "%vc > maxValueDropAnyKey && vc > maxValueDropAbsoluteAnyKey",
 the key with highest (relative) value drop. There may be no such key,
 in which case this will be empty.


 ?

 ?)

 ?,-

?%

?

?	 

?#$

?&

?

?	!

?$%
D
?26 Same conditions as for value drop, but for increase.


?

?-

?01

?)

?

?	$

?'(

?*

?

?	%

?()

	? ?

	?

	 ?

	 ?

	 ?

	 ?

	?2

	?


	?

	?-

	?01

	?+

	?


	?

	?&

	?)*


? ?


?


 ?/


 ?


 ?*


 ?-.


?-


?


?(


?+,


?1


?


?,


?/0


?


?


?	


?
d
 ? ?V Note: InsightSeverity does not directly correspond to alerting Severity numerically.


 ?

  ?

  ?

  ?

 ?

 ?

 ?

 ?

 ?

 ?


 ?

 ?	

 ?

 ?

 ?

 ?


 ?

 ?

 ?

 ?

 ?


 ?bproto3??  
?
)kentik/insights/backend/v0/capacity.protokentik.api.insights.v0google/protobuf/timestamp.proto/kentik/insights/backend/v0/models-insight.proto"
CapacitySummaryRequest"l
CapacitySummaryResponseQ
planSummaries (2+.kentik.api.insights.v0.CapacityPlanSummaryRplanSummaries"?
CapacityPlanSummary
id (	RidY
utilizationSeverity (2'.kentik.api.insights.v0.InsightSeverityRutilizationSeverityO
runoutSeverity (2'.kentik.api.insights.v0.InsightSeverityRrunoutSeverity.
interfacesCritical (RinterfacesCritical,
interfacesWarning (RinterfacesWarning(
interfacesTotal (RinterfacesTotal"1
CapacityInsightsRequest
planID (	RplanID"?
CapacityBoxAndWhiskerRequest
deviceID (RdeviceID
snmpID (RsnmpID
planID (	RplanID
strategy (	Rstrategy"?
CapacityBoxAndWhiskerResponse
deviceID (RdeviceID
snmpID (RsnmpIDY
boxAndWhiskersIn (2-.kentik.api.insights.v0.CapacityBoxAndWhiskerRboxAndWhiskersIn[
boxAndWhiskersOut (2-.kentik.api.insights.v0.CapacityBoxAndWhiskerRboxAndWhiskersOut,
bottomWhiskerDesc (	RbottomWhiskerDesc$
bottomBoxDesc (	RbottomBoxDesc

middleDesc (	R
middleDesc

topBoxDesc (	R
topBoxDesc&
topWhiskerDesc	 (	RtopWhiskerDesc"?
CapacityBoxAndWhisker.
time (2.google.protobuf.TimestampRtime$
bottomWhisker (RbottomWhisker
	bottomBox (R	bottomBox
middle (Rmiddle
topBox (RtopBox

topWhisker (R
topWhiskerBZv0/insightsJ?
  7

  

 

 "
	
 "
	
  )
	
 9


  	


 


 




 1

 


 

 ,

 /0


 




 

 

 	

 

*



%

()

%



 

#$
5
"( either utiliziation OR runout critical







F
"9 either utilization OR runout warning (and not critical)

















 




 

 

 	

 


 !


$

 

 

 

 








/
"" optional, defaults to first plan




	


O
 "B optional, default to same as plan (weekOverWeek, monthOverMonth)


 

 	

 


# -


#%

 $

 $

 $

 $

%

%

%

%

&6

&


& 

&!1

&45

'7

'


' 

'!2

'56

(

(

(	

(

)

)

)	

)

*

*

*	

*

+

+

+	

+

,

,

,	

,


/ 7


/

 0%

 0

 0 

 0#$

2

2

2	

2

3

3

3	

3

4

4

4	

4

5

5

5	

5

6

6

6	

6bproto3??  
?
%kentik/insights/backend/v0/cost.protokentik.api.insights.v0"
CostInsightsRequestBZv0/insightsJI
  

  

 

 "
	
 "


  


 bproto3??  
?
)kentik/insights/backend/v0/metadata.protokentik.api.insights.v0google/protobuf/timestamp.proto"$
"ExportMetadataToGlobalStoreRequest"%
#ExportMetadataToGlobalStoreResponse"
MetadataDumpRequest"i
MetadataDumpResponseQ
definitions (2/.kentik.api.insights.v0.InsightDefinitionSQLRowRdefinitions"?
InsightDefinitionSQLRow
id (Rid 
insightName (	RinsightName0
cdate (2.google.protobuf.TimestampRcdate 
detailsJSON (	RdetailsJSON"
metadataJSON (	RmetadataJSON"&
$ImportMetadataFromGlobalStoreRequest"'
%ImportMetadataFromGlobalStoreResponse"j
ImportMetadataRequestQ
definitions (2/.kentik.api.insights.v0.InsightDefinitionSQLRowRdefinitions"
ImportMetadataResponseBZv0/insightsJ?
   

  

 

 "
	
 "
	
  )


  


 *


 	


+



 






 




 3

 


 "

 #.

 12


 




 

 

 


 





	



&



!

$%





	







	




 


,


 


-


 




 3

 


 "

 #.

 12


  


bproto3??  
?
5kentik/insights/backend/v0/models-insight-group.protokentik.api.insights.v0/kentik/insights/backend/v0/models-insight.proto"m
InsightGroup 
insightName (	RinsightName;
insights (2.kentik.api.insights.v0.InsightRinsightsBZv0/insightsJ?
  

  

 

 "
	
 "
	
  9


  


 
?
  	z insightName is the unique string identifying this kind of insight.
 It corresponds to the InsightDefinition.insightName.


  	

  		

  	
7
  * insights are the insights in this group.


 


 

 

 bproto3??  
?
,kentik/insights/backend/v0/utilization.protokentik.api.insights.v0"?
SimpleUtilizationRequest 
insightName (	RinsightName

sortMetric (	R
sortMetric$
sortAscending (RsortAscending
limit (RlimitBZv0/insightsJ?
  	

  

 

 "
	
 "


  	


  
E
  "8 default operate.capacity.externalInterfacesUtilization


  

  	

  
(
 " default outUtilizationP95


 

 	

 
:
 "- default false => sort descending by default


 

 

 

 " default 100


 

 

 bproto3??  
??
)kentik/insights/backend/v0/insights.protokentik.api.insights.v0google/api/annotations.protogoogle/protobuf/duration.protogoogle/protobuf/struct.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto)kentik/insights/backend/v0/metadata.proto2kentik/insights/backend/v0/models-definition.proto/kentik/insights/backend/v0/models-insight.proto5kentik/insights/backend/v0/models-insight-group.proto)kentik/insights/backend/v0/capacity.proto%kentik/insights/backend/v0/cost.proto(kentik/insights/backend/v0/factors.proto,kentik/insights/backend/v0/utilization.proto2kentik/alerting/backend/v0/alertproto/alarms.proto2kentik/alerting/backend/v0/alertproto/policy.proto5kentik/alerting/backend/v0/alertproto/threshold.proto"Q
InsightsRequest>
filter (2&.kentik.api.insights.v0.InsightsFilterRfilter"?
InsightsFilter 
insightName (	RinsightName"
insightNames (	RinsightNames,
insightNamePrefix (	RinsightNamePrefix0
insightNamePrefixes (	RinsightNamePrefixesN
dataSourceType (2&.kentik.api.insights.v0.DataSourceTypeRdataSourceTypeP
dataSourceTypes (2&.kentik.api.insights.v0.DataSourceTypeRdataSourceTypes
	insightID	 (	R	insightID

insightIDs (	R
insightIDsh
dimensionToValue
 (2<.kentik.api.insights.v0.InsightsFilter.DimensionToValueEntryRdimensionToValue\
dimensionToValueDNF (2*.kentik.api.insights.v0.InsightsFilter.DTVRdimensionToValueDNFZ
pastOrPresent (24.kentik.api.insights.v0.InsightsFilter.PastOrPresentRpastOrPresentZ
isInteresting (24.kentik.api.insights.v0.InsightsFilter.IsInterestingRisInteresting

dimensions (	R
dimensions4
dimensionsDisjunction (	RdimensionsDisjunction(
relatedEntities (	RrelatedEntitiest
relatedEntityToValue (2@.kentik.api.insights.v0.InsightsFilter.RelatedEntityToValueEntryRrelatedEntityToValuew
relatedEntityToValues (2A.kentik.api.insights.v0.InsightsFilter.RelatedEntityToValuesEntryRrelatedEntityToValuesQ
minimumSeverity< (2'.kentik.api.insights.v0.InsightSeverityRminimumSeverityG

severities= (2'.kentik.api.insights.v0.InsightSeverityR
severities=
kde (2).kentik.api.insights.v0.KDEInsightsFilterH Rkde@
ksql (2*.kentik.api.insights.v0.KSQLInsightsFilterH RksqlL
combined (2..kentik.api.insights.v0.CombinedInsightsFilterH RcombinedC
alerting (2%.kentik.api.alerting.v0.AlarmsRequestH Ralerting&
ignoreSilencesA (RignoreSilences.
ignoreInsightNamesB (	RignoreInsightNames<
ignoreInsightNamePrefixesC (	RignoreInsightNamePrefixes.
excludeUserDefined (RexcludeUserDefined:
statesD (2".kentik.api.alerting.v0.AlarmStateRstates
flaggedF (Rflagged*
flaggedByCompanyG (RflaggedByCompany
limit (B?A:100Rlimit
offset (Roffset'

groupLimit (B?A:10R
groupLimit&
noAugmentation (RnoAugmentationH
groupingType (2$.kentik.api.insights.v0.GroupingTypeRgroupingTypeH
creationTimeStart (2.google.protobuf.TimestampRcreationTimeStartD
creationTimeEnd  (2.google.protobuf.TimestampRcreationTimeEndM
creationTimeDuration! (2.google.protobuf.DurationRcreationTimeDurationB
startTimeStart" (2.google.protobuf.TimestampRstartTimeStart>
startTimeEnd# (2.google.protobuf.TimestampRstartTimeEndG
startTimeDuration$ (2.google.protobuf.DurationRstartTimeDuration>
endTimeStart% (2.google.protobuf.TimestampRendTimeStart:

endTimeEnd& (2.google.protobuf.TimestampR
endTimeEndC
endTimeDuration' (2.google.protobuf.DurationRendTimeDuration&
maxEndTimeOnly( (RmaxEndTimeOnly,
includeUnapproved) (RincludeUnapproved&
noHighlighting* (RnoHighlighting 
highlighted, (Rhighlighted$
includeHidden+ (RincludeHiddenC
DimensionToValueEntry
key (	Rkey
value (	Rvalue:8?
DTVl
dimensionToValue (2@.kentik.api.insights.v0.InsightsFilter.DTV.DimensionToValueEntryRdimensionToValueC
DimensionToValueEntry
key (	Rkey
value (	Rvalue:8G
RelatedEntityToValueEntry
key (	Rkey
value (	Rvalue:8}
RelatedEntityToValuesEntry
key (	RkeyI
value (23.kentik.api.insights.v0.InsightsFilter.EntityValuesRvalue:8&
EntityValues
values (	Rvalues"W
PastOrPresent
pastOrPresent_unspecified 
presentOnly
pastOnly
both"X
IsInteresting
interesting_unspecified 
interestingOnly
uninterestingOnlyB
typeSpecificFilter"
KDEInsightsFilter"
KSQLInsightsFilter"
CombinedInsightsFilter"?
InsightsResponse;
insights (2.kentik.api.insights.v0.InsightRinsights|
dimensionToDisplayName (2D.kentik.api.insights.v0.InsightsResponse.DimensionToDisplayNameEntryRdimensionToDisplayNamem
policyIDToDetails (2?.kentik.api.insights.v0.InsightsResponse.PolicyIDToDetailsEntryRpolicyIDToDetailsv
thresholdIDToDetails (2B.kentik.api.insights.v0.InsightsResponse.ThresholdIDToDetailsEntryRthresholdIDToDetails?
entityTypeToDisplayNames (2F.kentik.api.insights.v0.InsightsResponse.EntityTypeToDisplayNamesEntryRentityTypeToDisplayNamess
interfaceIDToDetail (2A.kentik.api.insights.v0.InsightsResponse.InterfaceIDToDetailEntryRinterfaceIDToDetailj
deviceIDToDetail (2>.kentik.api.insights.v0.InsightsResponse.DeviceIDToDetailEntryRdeviceIDToDetailI
DimensionToDisplayNameEntry
key (	Rkey
value (	Rvalue:8k
PolicyIDToDetailsEntry
key (Rkey;
value (2%.kentik.api.insights.v0.InsightPolicyRvalue:8j
ThresholdIDToDetailsEntry
key (Rkey7
value (2!.kentik.api.alerting.v0.ThresholdRvalue:8q
EntityTypeToDisplayNamesEntry
key (	Rkey:
value (2$.kentik.api.insights.v0.DisplayNamesRvalue:8o
InterfaceIDToDetailEntry
key (	Rkey=
value (2'.kentik.api.insights.v0.InterfaceDetailRvalue:8i
DeviceIDToDetailEntry
key (Rkey:
value (2$.kentik.api.insights.v0.DeviceDetailRvalue:8J	"?
InsightPolicy6
policy (2.kentik.api.alerting.v0.PolicyRpolicy 
insightName (	RinsightName 
displayName (	RdisplayName"?
DisplayNamesZ
displayNames (26.kentik.api.insights.v0.DisplayNames.DisplayNamesEntryRdisplayNames?
DisplayNamesEntry
key (	Rkey
value (	Rvalue:8"?
InterfaceDetail
deviceID (RdeviceID
snmpID (RsnmpID
id (	Rid(
snmpDescription (	RsnmpDescription$
snmpSpeedMbps (RsnmpSpeedMbps
	snmpAlias (	R	snmpAlias"R
DeviceDetail
deviceID (RdeviceID
name (	Rname
type (	Rtype"V
InsightRequest
	insightID (	R	insightID&
noAugmentation (RnoAugmentation"?
InsightResponse9
insight (2.kentik.api.insights.v0.InsightRinsight{
dimensionToDisplayName (2C.kentik.api.insights.v0.InsightResponse.DimensionToDisplayNameEntryRdimensionToDisplayNamel
policyIDToDetails (2>.kentik.api.insights.v0.InsightResponse.PolicyIDToDetailsEntryRpolicyIDToDetailsu
thresholdIDToDetails (2A.kentik.api.insights.v0.InsightResponse.ThresholdIDToDetailsEntryRthresholdIDToDetails?
entityTypeToDisplayNames (2E.kentik.api.insights.v0.InsightResponse.EntityTypeToDisplayNamesEntryRentityTypeToDisplayNamesr
interfaceIDToDetail (2@.kentik.api.insights.v0.InsightResponse.InterfaceIDToDetailEntryRinterfaceIDToDetaili
deviceIDToDetail (2=.kentik.api.insights.v0.InsightResponse.DeviceIDToDetailEntryRdeviceIDToDetailE
dataExplorerQuery (2.google.protobuf.StructRdataExplorerQueryI
DimensionToDisplayNameEntry
key (	Rkey
value (	Rvalue:8k
PolicyIDToDetailsEntry
key (Rkey;
value (2%.kentik.api.insights.v0.InsightPolicyRvalue:8j
ThresholdIDToDetailsEntry
key (Rkey7
value (2!.kentik.api.alerting.v0.ThresholdRvalue:8q
EntityTypeToDisplayNamesEntry
key (	Rkey:
value (2$.kentik.api.insights.v0.DisplayNamesRvalue:8o
InterfaceIDToDetailEntry
key (	Rkey=
value (2'.kentik.api.insights.v0.InterfaceDetailRvalue:8i
DeviceIDToDetailEntry
key (Rkey:
value (2$.kentik.api.insights.v0.DeviceDetailRvalue:8"
InsightDefinitionsRequest 
insightName (	RinsightName@
showDisabledInsightPolicies (RshowDisabledInsightPolicies"<
InsightDefinitionRequest 
insightName (	RinsightName"w
InsightDefinitionsResponseY
insightDefinitions (2).kentik.api.insights.v0.InsightDefinitionRinsightDefinitions"t
InsightDefinitionResponseW
insightDefinition (2).kentik.api.insights.v0.InsightDefinitionRinsightDefinition"?
ForceExecuteRequest 
insightName (	RinsightName
save (Rsave.
time (2.google.protobuf.TimestampRtimeR
options (28.kentik.api.insights.v0.ForceExecuteRequest.OptionsEntryRoptions:
OptionsEntry
key (	Rkey
value (	Rvalue:8"e
ForceExecuteResponse
msg (	Rmsg;
insights (2.kentik.api.insights.v0.InsightRinsights"\
ListInsightDimensionsRequest<
excludeAlertingDimensions (RexcludeAlertingDimensions"?
ListInsightDimensionsResponse

dimensions (	R
dimensions"
ListSilencesRequest"S
ListSilencesResponse;
silences (2.kentik.api.insights.v0.SilenceRsilences"?
Silence 
insightName (	RinsightName,
insightNamePrefix (	RinsightNamePrefix
	companyID (R	companyID
userID (RuserID
reason (	Rreason"?
SilenceRequest 
insightName (	RinsightName,
insightNamePrefix (	RinsightNamePrefix
userOnly (RuserOnly
reason (	Rreason"?
Vote
id (Rid
	companyID (R	companyID
userID (RuserID
	insightID (	R	insightID 
insightName (	RinsightName
score (Rscore"A
VoteRequest
	insightID (	R	insightID
score (Rscore"P
VoteResponse0
vote (2.kentik.api.insights.v0.VoteRvote
ok (Rok"
ListVotesRequest"G
ListVotesResponse2
votes (2.kentik.api.insights.v0.VoteRvotes"9
SummarizeVotesRequest 
companyWide (RcompanyWide"?
SummarizeVotesResponseS
summariesByName (2).kentik.api.insights.v0.VoteSummaryByNameRsummariesByNameM
summariesByID (2'.kentik.api.insights.v0.VoteSummaryByIDRsummariesByID\
summariesByCompany (2,.kentik.api.insights.v0.VoteSummaryByCompanyRsummariesByCompany"?
VoteSummaryByName 
insightName (	RinsightName
score (Rscore
countUp (RcountUp
	countDown (R	countDown"}
VoteSummaryByID
	insightID (	R	insightID
score (Rscore
countUp (RcountUp
	countDown (R	countDown"?
VoteSummaryByCompany
	companyID (R	companyID
score (Rscore
countUp (RcountUp
	countDown (R	countDown"?
InsightsGroupedResponseJ
insightGroups (2$.kentik.api.insights.v0.InsightGroupRinsightGroups?
dimensionToDisplayName (2K.kentik.api.insights.v0.InsightsGroupedResponse.DimensionToDisplayNameEntryRdimensionToDisplayNamet
policyIDToDetails (2F.kentik.api.insights.v0.InsightsGroupedResponse.PolicyIDToDetailsEntryRpolicyIDToDetails}
thresholdIDToDetails (2I.kentik.api.insights.v0.InsightsGroupedResponse.ThresholdIDToDetailsEntryRthresholdIDToDetailsI
DimensionToDisplayNameEntry
key (	Rkey
value (	Rvalue:8k
PolicyIDToDetailsEntry
key (Rkey;
value (2%.kentik.api.insights.v0.InsightPolicyRvalue:8j
ThresholdIDToDetailsEntry
key (Rkey7
value (2!.kentik.api.alerting.v0.ThresholdRvalue:8"|
Flag
	insightID (	R	insightID
	companyID (R	companyID
userID (RuserID 
insightName (	RinsightName"?
FlagRequest0
flag (2.kentik.api.insights.v0.FlagRflag"@
FlagResponse0
flag (2.kentik.api.insights.v0.FlagRflag"
ListFlagsRequest"G
ListFlagsResponse2
flags (2.kentik.api.insights.v0.FlagRflags"5
ApproveInsightRequest
	insightID (	R	insightID"6
ApproveInsightResponse
	insightID (	R	insightID"7
HighlightInsightRequest
	insightID (	R	insightID"8
HighlightInsightResponse
	insightID (	R	insightID"8
DataExplorerQueryRequest
	insightID (	R	insightID"b
DataExplorerQueryResponseE
dataExplorerQuery (2.google.protobuf.StructRdataExplorerQuery*J
GroupingType
groupingType_unspecified 

byName
byNameAndDTV2?5
Insights?
SearchInsights'.kentik.api.insights.v0.InsightsRequest(.kentik.api.insights.v0.InsightsResponse"#????"/v0/insights:search:filterw
ListInsights'.kentik.api.insights.v0.InsightsRequest(.kentik.api.insights.v0.InsightsResponse"????/v0/insightss
CreateInsight.kentik.api.insights.v0.Insight(.kentik.api.insights.v0.InsightsResponse"????"/v0/insights:*

GetInsight&.kentik.api.insights.v0.InsightRequest'.kentik.api.insights.v0.InsightResponse" ????/v0/insights/{insightID}?
SearchInsightsGrouped&.kentik.api.insights.v0.InsightsFilter/.kentik.api.insights.v0.InsightsGroupedResponse"&???? "/v0/insights/grouped:search:*?
ListInsightsGrouped&.kentik.api.insights.v0.InsightsFilter/.kentik.api.insights.v0.InsightsGroupedResponse"????/v0/insights/grouped?
ListInsightDefinitions1.kentik.api.insights.v0.InsightDefinitionsRequest2.kentik.api.insights.v0.InsightDefinitionsResponse"????/v0/definitions?
SearchInsightDefinitions1.kentik.api.insights.v0.InsightDefinitionsRequest2.kentik.api.insights.v0.InsightDefinitionsResponse"!????"/v0/definitions:search:*?
CreateInsightDefinition).kentik.api.insights.v0.InsightDefinition2.kentik.api.insights.v0.InsightDefinitionsResponse"????"/v0/definitions:*?
GetInsightDefinition0.kentik.api.insights.v0.InsightDefinitionRequest1.kentik.api.insights.v0.InsightDefinitionResponse"%????/v0/definitions/{insightName}?
UpdateInsightDefinition).kentik.api.insights.v0.InsightDefinition2.kentik.api.insights.v0.InsightDefinitionsResponse"(????"/v0/definitions/{insightName}:*?
DeleteInsightDefinition).kentik.api.insights.v0.InsightDefinition2.kentik.api.insights.v0.InsightDefinitionsResponse"%????*/v0/definitions/{insightName}?
ExecuteInsightDefinition+.kentik.api.insights.v0.ForceExecuteRequest,.kentik.api.insights.v0.ForceExecuteResponse"0????*"%/v0/definitions/{insightName}:execute:*?
ListInsightDimensions4.kentik.api.insights.v0.ListInsightDimensionsRequest5.kentik.api.insights.v0.ListInsightDimensionsResponse"????/v0/dimensions?
ListInsightSilences+.kentik.api.insights.v0.ListSilencesRequest,.kentik.api.insights.v0.ListSilencesResponse"????/v0/silences?
CreateInsightSilence&.kentik.api.insights.v0.SilenceRequest,.kentik.api.insights.v0.ListSilencesResponse"????"/v0/silences:*?
"CreateInsightSilenceForInsightName&.kentik.api.insights.v0.SilenceRequest,.kentik.api.insights.v0.ListSilencesResponse"0????*"%/v0/definitions/{insightName}/silence:*?
DeleteInsightSilence&.kentik.api.insights.v0.SilenceRequest,.kentik.api.insights.v0.ListSilencesResponse"????*/v0/silences?
DeleteInsightSilencePost&.kentik.api.insights.v0.SilenceRequest,.kentik.api.insights.v0.ListSilencesResponse"????"/v0/silences:delete:*?
"DeleteInsightSilenceForInsightName&.kentik.api.insights.v0.SilenceRequest,.kentik.api.insights.v0.ListSilencesResponse"-????'*%/v0/definitions/{insightName}/silence?
&DeleteInsightSilenceForInsightNamePost&.kentik.api.insights.v0.SilenceRequest,.kentik.api.insights.v0.ListSilencesResponse"7????1",/v0/definitions/{insightName}/silence:delete:*m

CreateVote#.kentik.api.insights.v0.VoteRequest$.kentik.api.insights.v0.VoteResponse"????"	/v0/votes:*s
	ListVotes(.kentik.api.insights.v0.ListVotesRequest).kentik.api.insights.v0.ListVotesResponse"????	/v0/votesj

DeleteVote#.kentik.api.insights.v0.VoteRequest$.kentik.api.insights.v0.VoteResponse"????*	/v0/votesx
DeleteVotePost#.kentik.api.insights.v0.VoteRequest$.kentik.api.insights.v0.VoteResponse"????"/v0/votes:delete:*?
SummarizeVotes-.kentik.api.insights.v0.SummarizeVotesRequest..kentik.api.insights.v0.SummarizeVotesResponse"????"/v0/votes:summarize:*m

CreateFlag#.kentik.api.insights.v0.FlagRequest$.kentik.api.insights.v0.FlagResponse"????"	/v0/flags:*s
	ListFlags(.kentik.api.insights.v0.ListFlagsRequest).kentik.api.insights.v0.ListFlagsResponse"????	/v0/flagsj

DeleteFlag#.kentik.api.insights.v0.FlagRequest$.kentik.api.insights.v0.FlagResponse"????*	/v0/flagsx
DeleteFlagPost#.kentik.api.insights.v0.FlagRequest$.kentik.api.insights.v0.FlagResponse"????"/v0/flags:delete:*?
ApproveInsight-.kentik.api.insights.v0.ApproveInsightRequest..kentik.api.insights.v0.ApproveInsightResponse"+????%" /v0/insights/{insightID}:approve:*?
UnapproveInsight-.kentik.api.insights.v0.ApproveInsightRequest..kentik.api.insights.v0.ApproveInsightResponse"-????'""/v0/insights/{insightID}:unapprove:*?
HighlightInsight/.kentik.api.insights.v0.HighlightInsightRequest0.kentik.api.insights.v0.HighlightInsightResponse"-????'""/v0/insights/{insightID}:highlight:*?
UnhighlightInsight/.kentik.api.insights.v0.HighlightInsightRequest0.kentik.api.insights.v0.HighlightInsightResponse"/????)"$/v0/insights/{insightID}:unhighlight:*?
GetInsightDataExplorerQuery0.kentik.api.insights.v0.DataExplorerQueryRequest1.kentik.api.insights.v0.DataExplorerQueryResponse"2????,*/v0/insights/{insightID}/dataExplorerQuery?
GetCapacitySummary..kentik.api.insights.v0.CapacitySummaryRequest/.kentik.api.insights.v0.CapacitySummaryResponse"%????/v0/insights/capacity/summary?
SearchCapacityInsights/.kentik.api.insights.v0.CapacityInsightsRequest(.kentik.api.insights.v0.InsightsResponse"'????!"/v0/insights/capacity:search:*?
GetCapacityBoxAndWhisker4.kentik.api.insights.v0.CapacityBoxAndWhiskerRequest5.kentik.api.insights.v0.CapacityBoxAndWhiskerResponse"-????'%/v0/insights/capacity/box-and-whisker?
SearchSimpleUtilizationInsights0.kentik.api.insights.v0.SimpleUtilizationRequest(.kentik.api.insights.v0.InsightsResponse"*????$"/v0/insights/utilization:search:*?
ExecuteFactoringForEvent&.kentik.api.insights.v0.FactorsRequest'.kentik.api.insights.v0.FactorsResponse"????"/v0/factors:execute:*?
SearchCostInsights+.kentik.api.insights.v0.CostInsightsRequest(.kentik.api.insights.v0.InsightsResponse"#????"/v0/insights/cost:search:*?
ExportMetadataToGlobalStore:.kentik.api.insights.v0.ExportMetadataToGlobalStoreRequest;.kentik.api.insights.v0.ExportMetadataToGlobalStoreResponse".????("#/v0/internal/metadata/global:export:*?
GetMetadataDump+.kentik.api.insights.v0.MetadataDumpRequest,.kentik.api.insights.v0.MetadataDumpResponse""????/v0/internal/metadata/dump?
ImportMetadataFromGlobalStore<.kentik.api.insights.v0.ImportMetadataFromGlobalStoreRequest=.kentik.api.insights.v0.ImportMetadataFromGlobalStoreResponse".????("#/v0/internal/metadata/global:import:*?
ImportMetadata-.kentik.api.insights.v0.ImportMetadataRequest..kentik.api.insights.v0.ImportMetadataResponse",????&"!/v0/internal/metadata/dump:import:*??BZv0/insightsJ??
  ?

  

 

 "
	
 "
	
  &
	
 (
	
 &
	
 )
	
 8
	

 5
	
 3
	
 <
	
 9
	
	 ?
	

 3
	
 /
	
 2
	
 6
	
 <
	
 <
	
 ?

  ?


 


 <

 ?*<

  

  

  $

  /?

  

	  ?ʼ"

 !%

 !

 !"

 !-=

 "$

	 ?ʼ""$

 ',

 '

 '

 '&6

 (+

	 ?ʼ"(+

 .2

 .

 .

 .*9

 /1

	 ?ʼ"/1

 49

 4

 4*

 45L

 58

	 ?ʼ"58

 ;?

 ;

 ;(

 ;3J

 <>

	 ?ʼ"<>

 AE

 A

 A6

 AA[

 BD

	 ?ʼ"BD

 GN

 G

 G8

 GC]

 JM
?
	 ?ʼ"JMv Note: this is the same ListInsightDefinitions, but accepts its parameters
 in the HTTP body as part of an HTTP POST.


 PU

 P

 P/

 P:T

 QT

	 ?ʼ"QT

 	W[

 	W

 	W3

 	W>W

 	XZ

	 	?ʼ"XZ

 
]b

 
]

 
]/

 
]:T

 
^a

	 
?ʼ"^a

 dh

 d

 d/

 d:T

 eg

	 ?ʼ"eg

 jo

 j

 j2

 j=Q

 kn

	 ?ʼ"kn

 qu

 q

 q8

 qC`

 rt

	 ?ʼ"rt

 w{

 w

 w-

 w8L

 xz

	 ?ʼ"xz

 }?

 }

 })

 }4H

 ~?

	 ?ʼ"~?

 ??

 ?(

 ?)7

 ?BV

 ??

	 ?ʼ"??

 ??

 ?

 ?)

 ?4H

 ??

	 ?ʼ"??

 ??

 ?

 ?-

 ?8L

 ??

	 ?ʼ"??

 ??

 ?(

 ?)7

 ?BV

 ??

	 ?ʼ"??

 ??

 ?,

 ?-;

 ?FZ

 ??

	 ?ʼ"??

 ??

 ?

 ?

 ?'3

 ??

	 ?ʼ"??

 ??

 ?

 ? 

 ?+<

 ??

	 ?ʼ"??

 ??

 ?

 ?

 ?'3

 ??

	 ?ʼ"??

 ??

 ?

 ? 

 ?+7

 ??

	 ?ʼ"??

 ??

 ?

 ?*

 ?5K

 ??

	 ?ʼ"??

 ??

 ?

 ?

 ?'3

 ??

	 ?ʼ"??

 ??

 ?

 ? 

 ?+<

 ??

	 ?ʼ"??

 ??

 ?

 ?

 ?'3

 ??

	 ?ʼ"??

 ??

 ?

 ? 

 ?+7

 ??

	 ?ʼ"??

 ??

 ?

 ?*

 ?5K

 ??

	 ?ʼ"??

 ??

 ?

 ?,

 ?7M

 ??

	 ?ʼ"??

  ??

  ?

  ?.

  ?9Q

  ??

	  ?ʼ"??

 !??

 !?

 !?0

 !?;S

 !??

	 !?ʼ"??

 "??

 "?!

 "?":

 "?E^

 "??

	 "?ʼ"??

 #??

 #?

 #?/

 #?:Q

 #??

	 #?ʼ"??

 $??

 $?

 $?4

 $??O

 $??

	 $?ʼ"??

 %??

 %?

 %?;

 %?Fc

 %??

	 %?ʼ"??

 &??

 &?%

 &?&>

 &?IY

 &??

	 &?ʼ"??

 '??

 '?

 '?-

 '?8G

 '??

	 '?ʼ"??

 (??

 (?

 (?,

 (?7G

 (??

	 (?ʼ"??

 )??

 )?!

 )?"D

 )?Or

 )??

	 )?ʼ"??

 *??

 *?

 *?)

 *?4H

 *??

	 *?ʼ"??

 +??

 +?#

 +?$H

 +?Sx

 +??

	 +?ʼ"??

 ,??

 ,?

 ,?*

 ,?5K

 ,??

	 ,?ʼ"??

 ? ?

 ?
c
  ?U filter filters down the insights returned. By default, all of them in the past day.


  ?

  ?

  ?

? ?

?
?
 ?w insightName limits results to those matching this name exactly.
 For example, "core.trafficAnalytics.bitsInLastWeek".


 ?

 ?	

 ?

?$

?


?

?

?!#
?
?? insightNamePrefix limits results to those prefix-matching this name.
 e.g. "core", or "core.trafficAnalytics", or even "core.trafficAnalytics.bits".


?

?	

?

?+

?


?

?%

?(*
Y
?$K dataSourceType limits results to a specific source, like alerting or kde.


?

?

?"#

?/

?


?

?)

?,.
?
?? insightID filters to a specific insightID.
 The ID consists of a one-character prefix indicating the dataSourceType,
 followed by a numeric id. For example, "a1234" or "k5678".


?

?	

?

?"

?


?

?

?!
?
?,? dimensionToValue describes a partial match of specific dimension values.
 For example, find all insights with i_device_id = 1001.


?

?&

?)+

	?(

	?


	?

	?"

	?%'

??

?


 ?-

 ?

 ?(

 ?+,

 ??

 ?

  ?"

  ?

  ? !

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?
}

?#o PastOrPresent indicates whether we should include insights that are
 the most recent, or historical, or both.



?


?


? "

??

?

 ? 

 ?

 ?

?

?

?

?

?

?
o
?#a IsInteresting indicates whether we should include insights that are
 interesting, not, or both.


?

?

? "
?
?"? dimensions filters to insights that include these dimensions only. For example,
 find all insights with the src_as dimension and the dst_as dimension.


?


?

?

?!

?-

?


?

?'

?*,
?
?'? relatedEntities filters to insights for entity types such as "as" or "ip".
 This has the same effect as setting "dimensionsDisjunction", where the list of
 dimensions is all dimensions related to the entity types.


?


?

?!

?$&
?
?0? relatedEntityToValue describes a partial match of dimension values in insights,
 like dimensionToValue, however, the keys are "entities" and matches will include
 any dimensions that are "related". For example, `{"as": 1234}` will match dst_as,
 src_as, and other as dimensions. `{"device_id": 1234}` will match i_device_id,
 but also any InterfaceID_src, InterfaceID_dst, etc. related to that device. And so on.


?

?*

?-/

?7

?

?1

?46

??

?


 ?

 ?

 ?

 ?

 ?
T
?'F minimumSeverity filters to severities greater than or equal to this.


?

?!

?$&
>
?+0 severities filters to severities in this list.


?


?

?%

?(*
?
 ??? typeSpecificFilter limits results based on more specific options for a
 given DataSourceType. The value in dataSourceType must match.


 ?

?

?

?

?

?!

?

?

? 

?)

?

?#

?&(

?7

?(

?)1

?46
_
?Q ignoreSilences returns results as if there were no silences (ignored insights).


?

?

?
]
?*O ignoreInsightNames are insights to ignore as if they were currently silenced.


?


?

?$

?')
l
?1^ ignoreInsightNamePrefixes are insight prefixes to ignore as if they were currently silenced.


?


?

?+

?.0
]
?O excludeUserDefined excludes user-defined insights, such as alerting policies.


?

?

?
?
?9r states filters to alerting insights with these states. If specified, no
 non-alerting insights will be returned.


?


?,

?-3

?68
_
?Q flagged filters results to include insights that have been flagged by the user.


?

?

?
k
?] flagged filters results to include insights that have been flagged any user in the company.


?

?

?
N
?d@ limit is how many insights to return at most. Defaults to 100.


?

?	

?

?c

??b
|
?n offset is the offset into the list of insights being returned.
 Use this to implement paging. Defaults to 0.


?

?	

?
X
 ?gJ groupLimit is a limit on how many insights to include a grouped insight.


 ?

 ?

 ?

 ?f

 ??e
Z
!?L noAugmentation removes all fields from the response other than "insights".


!?

!?

!?
?
"? | groupingType controls how things are grouped, if groupLimit is setting or using
 the grouping API. default: "byNameAndDTV"


"?

"?

"?
X
#?3J creationTimeStart and creationTimeEnd bracket an Insight's creationTime.


#?

#?-

#?02

$?1

$?

$?+

$?.0

%?5

%?

%?/

%?24
O
&?0A startTimeStart and startTimeEnd bracket an Insight's startTime.


&?

&?*

&?-/

'?.

'?

'?(

'?+-

(?2

(?

(?,

(?/1
I
)?.; endTimeStart and endTimeEnd bracket an Insight's endTime.


)?

)?(

)?+-

*?,

*?

*?&

*?)+

+?0

+?

+?*

+?-/
:
,?", only include the farthest forward windows.


,?

,?

,?
O
-?A includeUnapproved includes insights not yet approved by Kentik.


-?

-?

-?
\
.?N noHighlighting removes special treatment for insights highlighted by Kentik.


.?

.?

.?
[
/?M highlighted filters results to include insights that have been highlighted.


/?

/?

/?
z
0?l includeHidden includes insights marked as hidden, normally only found by directly querying an insightName.


0?

0?

0?

 ? ?

 ?

  ?

  ?

  ?

 ?

 ?

 ?

 ?

 ?

 ?

? ?

?

? ?

?

? ?

?

? ?

?
A
 ? 3 insights are the matching Insights for the query.


 ?


 ?

 ?

 ?

?1

?

?,

?/0
D
?26 policyIDToDetails includes relevant policy metadata.


?

?-

?01
J
?H< thresholdIDToDetails includes relevant threshold metadata.


?.

?/C

?FG

?9

?

?4

?78
?
?7? interfaceIDToDetail includes augmented data about interfaces mentioned.
 The key of the map is a string like "${deviceID}:${snmpID}".


?

?2

?56
Q
?0C deviceIDToDetail includes augmented data about devices mentioned.


?

?+

?./
?
	?? dataExplorerQuery is a JSON object in the format expected by the Kentik UI
 to create a data explorer query. This is the final object for use by the UI,
 after having been extended from the insight definition's dataExplorerQuery field.
 Deprecated: look on the individual insight.
"/ google.protobuf.Struct dataExplorerQuery = 8;


	 ?

	 ?
G
? ?9 InsightPolicy has a bit of metadata on top of a Policy.


?

 ?+

 ?

 ? &

 ?)*

?

?

?	

?

?

?

?	

?

? ?

?

 ?'

 ?

 ?"

 ?%&

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?
'
?" "${deviceID}:${snmpID}"


?

?	

?

?

?

?	

?

?

?

?

?

?

?

?	

?

	? ?

	?

	 ?

	 ?

	 ?

	 ?

	?

	?

	?	

	?

	?

	?

	?	

	?


? ?


?


 ?


 ?


 ?	


 ?
Z

?L noAugmentation removes all fields from the response other than "insights".



?


?


?

? ?

?
>
 ?0 insight is the matching Insight for the query.


 ?	

 ?


 ?

?1

?

?,

?/0
D
?26 policyIDToDetails includes relevant policy metadata.


?

?-

?01
J
?H< thresholdIDToDetails includes relevant threshold metadata.


?.

?/C

?FG

?9

?

?4

?78
?
?7? interfaceIDToDetail includes augmented data about interfaces mentioned.
 The key of the map is a string like "${deviceID}:${snmpID}".


?

?2

?56
Q
?0C deviceIDToDetail includes augmented data about devices mentioned.


?

?+

?./
?
?/? dataExplorerQuery is a JSON object in the format expected by the Kentik UI
 to create a data explorer query. This is the final object for use by the UI,
 after having been extended from the insight definition's dataExplorerQuery field.


?

?*

?-.

? ?

?!
?
 ?w insightName limits results to those matching this name exactly.
 For example, "core.trafficAnalytics.bitsInLastWeek".


 ?

 ?	

 ?
|
?'n showDisabledInsightPolicies shows alerting policies that are disabled in alerting,
 default is to hide them.


?

?"

?%&

? ?

? 
9
 ?+ Name of the insight definition to return.


 ?

 ?	

 ?

? ?

?"
@
 ?42 insightDefinitions are all the defined insights.


 ?


 ?

 ?/

 ?23

? ?

?!
>
 ?*0 insightDefinition is the definition requested.


 ?

 ?%

 ?()

? ?

?
3
 ?% Name of the insight to be executed.


 ?

 ?	

 ?
3
?% Whether to save the results or not.


?

?

?
8
?%* Pretend query was executed at this time.


?

? 

?#$
Z
?"L Options to this execute request. Perhaps specific to the (custom) insight.


?

?

? !

? ?

?
3
 ?% A message returned from the system.


 ?

 ?	

 ?
-
?  insights that were generated.


?


?

?

?

? ?

?$

 ?%

 ?

 ? 

 ?#$

? ?

?%

 ?!

 ?


 ?

 ?

 ? 

? ?

?

? ?

?

 ? 

 ?


 ?

 ?

 ?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?

?

?

?

?

?

?

?

?	

?

? ?

?
>
 ?0 Name of the insight to be silenced/unsilenced.


 ?

 ?	

 ?
1
?# Prefix to be silenced/unsilenced.


?

?	

?
A
?3 Whether the silence should be for this user only.


?

?

?
O
?A An optional reason string that will be stored with the silence.


?

?	

?

? ?

?

 ?

 ?

 ?


 ?

?

?

?

?

?

?

?

?

?

?

?	

?

?

?

?	

?

?"
 +1 or -1


?

?

?

? ?

?

 ?

 ?

 ?	

 ?
#
?" must be "1" or "-1"


?

?

?

? ?

?

 ?

 ?

 ?

 ?

?

?

?	

?

? ?

?

? ?

?

 ?

 ?


 ?

 ?

 ?

? ?

?
?
 ?z companyWide summarizes the votes across the whole company,
 even if the current request is associated with some user id.


 ?

 ?

 ?

? ?

?

 ?1

 ?


 ?

 ?,

 ?/0

?-

?


?

?(

?+,

?7

?


?

? 2

?56

? ?

?

 ?

 ?

 ?	

 ?

?" sum(score)


?

?

?
/
?"! i.e. all the votes with score=1


?

?

?
0
?"" i.e. all the votes with score=-1


?

?

?

 ? ?

 ?

  ?

  ?

  ?	

  ?

 ?" sum(score)


 ?

 ?

 ?
/
 ?"! i.e. all the votes with score=1


 ?

 ?

 ?
0
 ?"" i.e. all the votes with score=-1


 ?

 ?

 ?

!? ?

!?

! ?

! ?

! ?

! ?

!?" sum(score)


!?

!?

!?
/
!?"! i.e. all the votes with score=1


!?

!?

!?
0
!?"" i.e. all the votes with score=-1


!?

!?

!?

"? ?

"?
K
" ?*= insightGroups are the matching InsightGroups for the query.


" ?


" ?

" ?%

" ?()

"?1

"?

"?,

"?/0
D
"?26 policyIDToDetails includes relevant policy metadata.


"?

"?-

"?01
J
"?H< thresholdIDToDetails includes relevant threshold metadata.


"?.

"?/C

"?FG

#? ?

#?

# ?

# ?

# ?	

# ?

#?

#?

#?

#?

#?

#?

#?

#?

#?

#?

#?	

#?

$? ?

$?
#
$ ?" insightID required.


$ ?

$ ?

$ ?

%? ?

%?

% ?

% ?

% ?

% ?

&? ?

&?

'? ?

'?

' ?

' ?


' ?

' ?

' ?

(? ?

(?

( ?

( ?

( ?	

( ?

)? ?

)?

) ?

) ?

) ?	

) ?

*? ?

*?

* ?

* ?

* ?	

* ?

+? ?

+? 

+ ?

+ ?

+ ?	

+ ?

,? ?

,? 

, ?

, ?

, ?	

, ?

-? ?

-?!

- ?/

- ?

- ?*

- ?-.bproto3??  
?.
%kentik/insights/backend/v0/meta.protokentik.api.insights.v0google/api/annotations.protogoogle/protobuf/empty.proto+kentik/core/v202012alpha1/annotations.proto"?
DatabasePoolSettings"
maxOpenConns (RmaxOpenConns"
maxIdleConns (RmaxIdleConns6
connMaxLifeTimeSeconds (RconnMaxLifeTimeSeconds6
connMaxIdleTimeSeconds (RconnMaxIdleTimeSeconds"?
DatabaseStats.
maxOpenConnections (RmaxOpenConnections(
openConnections (RopenConnections
inUse (RinUse
idle (Ridle
	waitCount (R	waitCount.
waitDurationMillis (RwaitDurationMillis$
maxIdleClosed (RmaxIdleClosed,
maxIdleTimeClosed (RmaxIdleTimeClosed,
maxLifetimeClosed	 (RmaxLifetimeClosed"*
GetDBPoolSettingsRequest
id (	Rid"e
GetDBPoolSettingsResponseH
settings (2,.kentik.api.insights.v0.DatabasePoolSettingsRsettings"t
SetDBPoolSettingsRequest
id (	RidH
settings (2,.kentik.api.insights.v0.DatabasePoolSettingsRsettings"
SetDBPoolSettingsResponse"#
GetDBStatsRequest
id (	Rid"Q
GetDBStatsResponse;
stats (2%.kentik.api.insights.v0.DatabaseStatsRstats"?
MetaEnvResponseB
env (20.kentik.api.insights.v0.MetaEnvResponse.EnvEntryRenv
redacted (	Rredacted6
EnvEntry
key (	Rkey
value (	Rvalue:8"-
LogLevelRequest
logLevel (	RlogLevel"X
LogLevelResponse
logLevel (	RlogLevel(
initialLogLevel (	RinitialLogLevel"0
LogJSONModeRequest
jsonMode (RjsonMode"1
LogJSONModeResponse
jsonMode (RjsonMode2?
Meta?
GetDBPoolSettings0.kentik.api.insights.v0.GetDBPoolSettingsRequest1.kentik.api.insights.v0.GetDBPoolSettingsResponse"????/db/{id}/settings?
SetDBPoolSettings0.kentik.api.insights.v0.SetDBPoolSettingsRequest1.kentik.api.insights.v0.SetDBPoolSettingsResponse"????/db/{id}/settings{

GetDBStats).kentik.api.insights.v0.GetDBStatsRequest*.kentik.api.insights.v0.GetDBStatsResponse"????/db/{id}/statsW
GetEnv.google.protobuf.Empty'.kentik.api.insights.v0.MetaEnvResponse"????/envc
GetLogLevel.google.protobuf.Empty(.kentik.api.insights.v0.LogLevelResponse"????
/log/level~
SetLogLevel'.kentik.api.insights.v0.LogLevelRequest(.kentik.api.insights.v0.LogLevelResponse"????
/log/level:logLevelh
GetLogJSONMode.google.protobuf.Empty+.kentik.api.insights.v0.LogJSONModeResponse"????	/log/json
SetLogJSONMode*.kentik.api.insights.v0.LogJSONModeRequest+.kentik.api.insights.v0.LogJSONModeResponse"????	/log/json:*??BZv0/insightsJ?
  ?

  

 

 "
	
 "
	
  &
	
 %
	
 5


  


 

  	

  	

  	

  	

 


 


 


 


 $

 

 	

 "#

 $

 

 	

 "#
"
  golang's sql.DBStats




B
 "5 Maximum number of open connections to the database.


 

 

 
J
"= The number of established connections both in use and idle.




	


:
"- The number of connections currently in use.




	


.
"! The number of idle connections.




	


F

 Counters
"- The total number of connections waited for.







?
 B NOTE: duration in go; just convert this to millis for simplicity
"L The total time blocked waiting for a new connection. (converted to millis)




	


M
"@ The total number of connections closed due to SetMaxIdleConns.







P
"C The total number of connections closed due to SetConnMaxIdleTime.







P
"C The total number of connections closed due to SetConnMaxLifetime.









! #


! 
1
 ""$ dsn id, eg. "chwww-ro" or whatever


 "

 "	

 "


% '


%!

 &$

 &

 &

 &"#


) ,


) 
1
 *"$ dsn id, eg. "chwww-ro" or whatever


 *

 *	

 *

+$

+

+

+"#


. /


.!


1 3


1
1
 2"$ dsn id, eg. "chwww-ro" or whatever


 2

 2	

 2


5 7


5

 6

 6

 6

 6


 9 m


 9


 :<

 ?*:<

  <@

  <

  <0

  <;T

  =?

	  ?ʼ"=?

 BF

 B

 B0

 B;T

 CE

	 ?ʼ"CE

 HL

 H

 H"

 H-?

 IK

	 ?ʼ"IK

 NR

 N

 N"

 N-<

 OQ

	 ?ʼ"OQ

 TX

 T

 T'

 T2B

 UW

	 ?ʼ"UW

 Z_

 Z

 Z!

 Z,<

 [^

	 ?ʼ"[^

 ae

 a

 a*

 a5H

 bd

	 ?ʼ"bd

 gl

 g

 g'

 g2E

 hk

	 ?ʼ"hk


o r


o

 p

 p

 p

 p

q

q


q

q

q


	t v


	t

	 u

	 u

	 u	

	 u



x {



x


 y


 y


 y	


 y


z


z


z	


z


} 


}

 ~

 ~

 ~

 ~

? ?

?

 ?

 ?

 ?

 ?bproto3??  
?
+kentik/insights/backend/v0/migrations.protokentik.api.insights.v0google/api/annotations.protogoogle/protobuf/timestamp.proto+kentik/core/v202012alpha1/annotations.proto"T
MigrationsRequest?
status (2'.kentik.api.insights.v0.MigrationStatusRstatus"W
MigrationsResponseA

migrations (2!.kentik.api.insights.v0.MigrationR
migrations"?
	Migration
id (Rid
name (	Rname?
status (2'.kentik.api.insights.v0.MigrationStatusRstatus8
	appliedOn (2.google.protobuf.TimestampR	appliedOn
sql (	Rsql"c
RunMigrationsRequestK
migrationsToRun (2!.kentik.api.insights.v0.MigrationRmigrationsToRun"l
RunMigrationsResponse
msg (	RmsgA

migrations (2!.kentik.api.insights.v0.MigrationR
migrations*G
MigrationStatus
unknownMigrationStatus 
pending
applied2?

Migrations
ListMigrations).kentik.api.insights.v0.MigrationsRequest*.kentik.api.insights.v0.MigrationsResponse"????/v0/migrations?
RunMigrations,.kentik.api.insights.v0.RunMigrationsRequest-.kentik.api.insights.v0.RunMigrationsResponse"????"/v0/migrations:run:*??BZv0/insightsJ?	
  6

  

 

 "
	
 "
	
  &
	
 )
	
 5


  


 


 	<

 ?*	<

  

  

  &

  1C

  

	  ?ʼ"

 

 

 (

 3H

 

	 ?ʼ"


  


 

  

  

  

  


 




 $

 


 

 

 "#


! '


!

 "

 "

 "


 "

#

#

#	

#

$

$

$

$

%*

%

%%

%()

&

&

&	

&


 ) -


 )

  *

  *

  *

 +

 +	

 +

 ,

 ,	

 ,


/ 1


/

 0)" only id required


 0


 0

 0$

 0'(


3 6


3

 4

 4

 4	

 4

5$

5


5

5

5"#bproto3??  
??
.kentik/interface/v202108alpha1/interface.protokentik.interface.v202108alpha1google/api/annotations.protogoogle/api/client.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.protogoogle/protobuf/timestamp.proto"?
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
provider (	Rprovider"?
InterfaceClassification

classified (R
classified]
connectivity_type (20.kentik.interface.v202108alpha1.ConnectivityTypeRconnectivityTypeZ
network_boundary (2/.kentik.interface.v202108alpha1.NetworkBoundaryRnetworkBoundary"?
ClassifyCounter
count (Rcount%
external_count (RexternalCount$
free_pni_count (RfreePniCount
ix_count (RixCount%
provider_count (RproviderCount#
transit_count (RtransitCount"?	
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
changed_classification (RchangedClassification"?
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
interfaces"?
InterfaceFilter
text (	Rtext

device_ids (	R	deviceIds_
connectivity_types (20.kentik.interface.v202108alpha1.ConnectivityTypeRconnectivityTypes^
network_boundaries (2/.kentik.interface.v202108alpha1.NetworkBoundaryRnetworkBoundaries
	providers (	R	providers
snmp_speeds (R
snmpSpeedsC
ip_types (2(.kentik.interface.v202108alpha1.IpFilterRipTypes"
AutoClassifyRequest"?
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
devices (22.kentik.interface.v202108alpha1.DeviceClassifyInfoRdevices"?
ManualClassifyRequest#
interface_ids (	RinterfaceIds]
connectivity_type (20.kentik.interface.v202108alpha1.ConnectivityTypeRconnectivityTypeZ
network_boundary (2/.kentik.interface.v202108alpha1.NetworkBoundaryRnetworkBoundary
provider (	Rprovider"7
ManualClassifyResponse

device_ids (	R	deviceIds"a
ListInterfaceRequestI
filters (2/.kentik.interface.v202108alpha1.InterfaceFilterRfilters"?
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
DeleteInterfaceResponse"?
MatchW
match_attribute (2..kentik.interface.v202108alpha1.MatchAttributeRmatchAttributeO
match_operator (2(.kentik.interface.v202108alpha1.OperatorRmatchOperator
pattern (	Rpattern"?
Actiond
set_connectivity_type (20.kentik.interface.v202108alpha1.ConnectivityTypeRsetConnectivityTypea
set_network_boundary (2/.kentik.interface.v202108alpha1.NetworkBoundaryRsetNetworkBoundary,
set_connected_asns (	RsetConnectedAsns!
set_provider (	RsetProvider"?
DeviceFilter
all_devices (R
allDevices
device_name (	R
deviceName#
device_labels (	RdeviceLabels!
device_rules (	RdeviceRules!
device_types (	RdeviceTypes"?
Rule
id (	Rid
enabled (Renabled
rank (RrankH
match_clause (2%.kentik.interface.v202108alpha1.MatchRmatchClauseE

action_set (2&.kentik.interface.v202108alpha1.ActionR	actionSet0
cdate (2.google.protobuf.TimestampRcdate0
edate (2.google.protobuf.TimestampRedateW
included_devices (2,.kentik.interface.v202108alpha1.DeviceFilterRincludedDevicesW
excluded_devices	 (2,.kentik.interface.v202108alpha1.DeviceFilterRexcludedDevices*?
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
'CONNECTIVITY_TYPE_VIRTUAL_CROSS_CONNECT*?
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
IP_FILTER_UNSET*?
MatchAttribute
MATCH_ATTRIBUTE_UNSPECIFIED )
%MATCH_ATTRIBUTE_INTERFACE_DESCRIPTION
MATCH_ATTRIBUTE_SNMP_ALIAS 
MATCH_ATTRIBUTE_INTERFACE_IP*?
Operator
OPERATOR_UNSPECIFIED 
OPERATOR_EQUALS
OPERATOR_CONTAINS
OPERATOR_REGEX 
OPERATOR_CONTAINED_IN_SUBNET
OPERATOR_IS_PUBLIC_IP
OPERATOR_IS_PRIVATE_IP
OPERATOR_NO_IP2?
InterfaceService?
ManualClassify5.kentik.interface.v202108alpha1.ManualClassifyRequest6.kentik.interface.v202108alpha1.ManualClassifyResponse"??AVManual Classify Interface)Manually set interface(s) classification.*ManualClassify??admin.interface:write????-"(/interface/v202108alpha1/manual_classify:*?
ListInterface4.kentik.interface.v202108alpha1.ListInterfaceRequest5.kentik.interface.v202108alpha1.ListInterfaceResponse"??A[Fetch Search Interfaces1Return list of interfaces matches search critera.*ListInterface??admin.interface:read????%#/interface/v202108alpha1/interfaces?
GetInterface3.kentik.interface.v202108alpha1.GetInterfaceRequest4.kentik.interface.v202108alpha1.GetInterfaceResponse"??AZGet a interface.8Returns information about a interface specified with ID.*InterfaceGet??admin.interface:read????*(/interface/v202108alpha1/interfaces/{id}?
CreateInterface6.kentik.interface.v202108alpha1.CreateInterfaceRequest7.kentik.interface.v202108alpha1.CreateInterfaceResponse"??AYCreate a interface.1Create a interface from request. returns created.*InterfaceCreate??admin.interface:write????("#/interface/v202108alpha1/interfaces:*?
UpdateInterface6.kentik.interface.v202108alpha1.UpdateInterfaceRequest7.kentik.interface.v202108alpha1.UpdateInterfaceResponse"??AcUpdate a interface.;Replaces the entire interface attributes specified with id.*InterfaceUpdate??admin.interface:write????72/interface/v202108alpha1/interfaces/{interface.id}:*?
DeleteInterface6.kentik.interface.v202108alpha1.DeleteInterfaceRequest7.kentik.interface.v202108alpha1.DeleteInterfaceResponse"??APDelete a interface.(Deletes the interface specified with id.*InterfaceDelete??admin.interface:write????**(/interface/v202108alpha1/interfaces/{id})?Agrpc.api.kentik.com??admin.interfaceB?ZHgithub.com/kentik/api-schema/gen/go/kentik/interface/v202108alpha1;iface?A?7
Interface API"
Kentik API Engineering2202108alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ?d
  ?

  

 '

 _
	
 _
	
  &
	
 !
	
 8
	
 5
	
	 )
	
 6

? 6


 8 J


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


L R


L

 M#

 M

 M!"

N

N

N

O 

O

O

P 

P

P

Q

Q

Q


 U t


 U

  W ID of interface.


  W

  W	

  W
0
 Y# ID of device with this interface.


 Y

 Y	

 Y

 [
 SNMP ID.


 [

 [	

 [
%
 ] Network speed in Mbps.


 ]

 ]

 ]

 _ Snmp Type.


 _

 _

 _

 a Interface alias.


 a

 a	

 a

 c IP of interface.


 c

 c	

 c
8
 e#+ Readable string description of interface.


 e

 e	

 e!"
 
 g& Create timestamp.


 g

 g!

 g$%
 
 	i' Update Timestamp.


 	i

 	i!

 	i$&

 
k# Subnet mask.


 
k

 
k	

 
k "
1
 m*$ Type of network connectivity type.


 m

 m$

 m')
(
 o( Type of network boundary.


 o

 o"

 o%'

 q' Top asn hops.


 q


 q

 q!

 q$&
 
 s Network provider.


 s

 s	

 s


w {


w

 x

 x

 x

 x

y)

y

y$

y'(

z'

z

z"

z%&

} ?


}

 ~

 ~

 ~

 ~









?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?

?

?

?

?

?

?'

?


?

?"

?%&

?

?

?	

?
&
	?3 current classification


	?

	?-

	?02
'

?7 previous classification



?


?1


?46

?

?

?	

?

?)

?

?#

?&(

?*

?

?$

?')

?!

?

?

? 

?%

?

?

?"$

?-

?

?	'

?*,

?+

?

?%

?(*

?

?

?

?

?

?

?

?

?

?

?

?

?&

?

? 

?#%

?

?

?

?

?#

?

?

? "

? ?

?

 ? ID of device.


 ?

 ?	

 ?
;
?- Total number of interfaces for this device.


?

?

?
.
?4  previously_classified_ counts.


?

?/

?23
(
?. auto_classified_ counts.


?

?)

?,-

?*

?

?$

?')

?"

?

?

?!

?

?

?

?

?#

?

?

? "

?-

?

?'

?*,

	?$

	?

	?

	?!#
#

?1 List of interfaces.



?



? 


?!+


?.0

? ?

?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?
k
? ?] Supports multiple search criteria. Fields are combined to AND statements to perform search.


?
E
 ?7 Search text match in interface description and alias.


 ?

 ?	

 ?
$
?! Search by device ID.


?


?

?

? 
9
?3+ Search by type of interface connectivity.


?


?

?.

?12
3
?2% Search by type of network boundary.


?


?

?-

?01
"
?  Search by provider


?


?

?

?
"
?! SNMP speed in Mbps


?


?

?

? 
%
?! Search by ip address.


?


?

?

? 
.
? ?"  uses company_id from auth user


?

? ?

?
C
 ?"5 Percent of all interfaces taht are auto calssified.


 ?

 ?	

 ? !

? 

?

?

?

?

?

?

?

?!

?

?

? 

?/

?

?*

?-.

?&

?

?!

?$%
,
?2 total_auto_classify_ counts.


?

?-

?01
'
?- total_previous_ counts.


?

?(

?+,
+
? Total number of interfaces.


?

?

?
 
	?+ List of devices.


	?


	?

	?%

	?(*
a
? ?S Set connection type, network boundary, and provider of interface id(s) specified.


?
4
 ?$& Interface ids to set the properties.


 ?


 ?

 ?

 ?"#
%
?) Connection type enum.


?

?$

?'(
&
?' Network boundary enum.


?

?"

?%&
!
? Network provider.


?

?	

?

	? ?

	?

	 ?!

	 ?


	 ?

	 ?

	 ? 


? ?


?


 ?


 ?


 ?


 ?

? ?

?

 ?$

 ?


 ?

 ?

 ?"#

?

?

?

?

?

?

?

?

? ?

?
 
 ? ID of interface.


 ?

 ?	

 ?

? ?

?

 ?

 ?

 ?

 ?

? ?

?

 ?

 ?

 ?

 ?

? ?

?

 ?

 ?

 ?

 ?

? ?

?

 ?

 ?

 ?

 ?

? ?

?

 ?

 ?

 ?

 ?

? ?

?
 
 ? ID of interface.


 ?

 ?	

 ?


? "

?

 ? ?

 ?

 ?;

 ??;

 ?G

 ?*?G
?
  ??2? Comment out for now until we need auto classification.
 rpc AutoClassify(AutoClassifyRequest) returns (AutoClassifyResponse) {
   option (kentik.core.v202012alpha1.method_scope) = "admin.interface:write";
   option (google.api.http) = {
     get: "/interface/v202108alpha1/auto_classify"
   };
   option (grpc.gateway.protoc_gen_openapiv2.options.openapiv2_operation) = {
     operation_id: "AutoClassify"
     summary: "Auto Classify Interface"
     description: "Classify devices and interface base on rules."
   };
 }


  ?

  ?*

  ?5K

  ?N

  ?*?N

  ??

	  ?ʼ"??

  ??

  ???

 ??

 ?

 ?(

 ?3H

 ?M

 ?*?M

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?&

 ?1E

 ?M

 ?*?M

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?,

 ?7N

 ?N

 ?*?N

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?,

 ?7N

 ?N

 ?*?N

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?,

 ?7N

 ?N

 ?*?N

 ??

	 ?ʼ"??

 ??

 ???

? ?

?

 ?"

 ?

 ? !

?,

?'

?*+

?!

?

? 

?#

?

?!"

? ?

?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?

?#

?

?!"

?

?

?

?

?

?

?

?

?

? ?

?
#
 ?% Attribute to match.


 ?

 ? 

 ?#$
 
? Match operation.


?


?

?
"
? Value to match by.


?

?	

?
?
? ?~ Set the values of the interface property base on match rule defintion. Requires explicit input value, empty string is allow.


?
'
 ?- Set type of connection.


 ?

 ?(

 ?+,
%
?+ Set network boundary.


?

?&

?)*

?  Set ASNs.


?

?	

?
,
? List of providers available.


?

?	

?

? ?

?

 ?

 ?

 ?

 ?

?"

?


?

?

? !

?$

?


?

?

?"#

?#

?


?

?

?!"

?#

?


?

?

?!"

? ?

?
%
 ? ID of interface rule.


 ?

 ?	

 ?
$
? Is this rule enable.


?

?

?
3
?% Rank order for apply list of rules.


?

?

?
$
? Rule match criteria.


?

?

?
&
? Action for match rule.


?

?	

?
!
?& Create timestamp.


?

?!

?$%
!
?& Update timestamp.


?

?!

?$%
)
?$ Device inclusive filters.


?

?

?"#
)
?$ Device exclusive filters.


?

?

?"#bproto3??  
?A
%kentik/ktbgp/v202203beta2/proxy.protokentik.ktbgp.v202203beta2+kentik/core/v202012alpha1/annotations.proto"?
ControlRequest
proto (	Rproto
	device_ip (	RdeviceIp
device_port (R
devicePort
proxy_ip (	RproxyIp

proxy_port (R	proxyPort@
action (2(.kentik.ktbgp.v202203beta2.ControlActionRaction"?
ControlResponse
proto (	Rproto
	device_ip (	RdeviceIp
device_port (R
devicePort
proxy_ip (	RproxyIp

proxy_port (R	proxyPort
ttl_seconds (R
ttlSeconds
ttl_counter (R
ttlCounter@
action (2(.kentik.ktbgp.v202203beta2.ControlActionRaction=
metadata	 (2!.kentik.ktbgp.v202203beta2.KeyValRmetadata

company_id
 (R	companyId
	device_id (RdeviceId
device_name (	R
deviceName
tcp_md5 (RtcpMd5",
KeyVal
key (	Rkey
val (	Rval"`
DataRequest=
action (2%.kentik.ktbgp.v202203beta2.DataActionRaction
data (Rdata"a
DataResponse=
action (2%.kentik.ktbgp.v202203beta2.DataActionRaction
data (Rdata*j
ControlAction
CONTROL_ACTION_UNSPECIFIED 
CONTROL_ACTION_BLOCK_IP
CONTROL_ACTION_KEEPALIVE*X

DataAction
DATA_ACTION_UNSPECIFIED 
DATA_ACTION_KILL
DATA_ACTION_RESTART2?
ProxyServicez
Control).kentik.ktbgp.v202203beta2.ControlRequest*.kentik.ktbgp.v202203beta2.ControlResponse"??ktbgp.proxy:read(0r
Data&.kentik.ktbgp.v202203beta2.DataRequest'.kentik.ktbgp.v202203beta2.DataResponse"??ktbgp.proxy:write(0??ktbgp.proxyBEZCgithub.com/kentik/api-schema/gen/go/kentik/ktbgp/v202203beta2;ktbgpJ?4
  ?

  

 "

 Z
	
 Z
	
  5
I
  B= ProxyService is a VPN for routers without public IP address



 


 	I

 ?*	I
?
  	? Control is the control channel used to fetch parameters needed to establish the data channel.
 This channel is usually used when the client connection is established, or attempted (eg.
 TCP SYN packets with the MD5 option).

 One can think of this call as a channel for continuous replication of device configuration
 data relevant to a particular proxy agent. The server MAY push unsolicited messages.

 This call can be handled by different machine than the Data() call below.

 Client MUST set the following gRPC metadata:
 - x-ch-auth-email
 - x-ch-auth-token (API key)
 - sid: site id
 - version: ktbgp terminator version
 - instance: random UUID (type-4) generated at the terminator startup


  

  

  )

  4:

  ;J

  U

  ?*U
?
 ?A	? Data is the data channel run to forward app protocol messages. Clients SHOULD call Control() first.

 Client MUST set the following gRPC metadata:
 - x-ch-auth-email
 - x-ch-auth-token (API key)
 - sid: site id
 - version: ktbgp terminator version
 - instance: random UUID (type-4) generated at the terminator startup
 - the 5-tuple: proto, device-ip, device-port, proxy-ip, proxy-port
 - all of ControlResponse.metadata
 - session-id: a random (version 4) UUID that uniquely identifies the established connection;
               each new connection MUST have different session id, even if it has an already seen 5-tuple
 - counter-up: how many DataRequests were already sent to backend for that session
 - counter-down: how many DataResponses were already received from backend for that session

 Server MUST set the following gRPC metadata:
 - counter-up: how many DataRequests were already received from client for that session
 - counter-down: how many DataResponses were already sent to client for that session

 Just after receiving the metadata, both sides MUST verify the session-id and counter values in metadata
 vs. the local state. The side that detects a disagreement MUST send a KILL message.

 Client and server MUST respect the action field in received messages:
 - OK (0): carry on, forward the raw bytes
 - KILL (1): kill the session: abort the connection, its gRPC stream, and drop cached ControlResponses for connection
 - RESTART (2): execute a graceful restart

 The side initiating the graceful RESTART procedure MUST stop sending new messages, close the
 sending side of the gRPC stream, wait for a RESTART message from the other end, and after that close
 its gRPC stream completely. The side receiving the graceful RESTART request MUST act accordingly.

 The client SHOULD initiate a gRPC re-connect attempt after completing the RESTART procedure. In case of
 transient gRPC errors (without completing the RESTART procedure), client MAY try to reconnect.


 ?

 ?

 ?#

 ?.4

 ?5A

 @V

 ?*@V
}
 E Nq ControlRequest represents a new connection from customer device (already accepted or attempted by the customer)



 E
6
  G the 5-tuple
" app protocol (eg. "BGP")


  G

  G

  G
6
 H") customer device's (internal) IP address


 H

 H

 H
,
 I" customer device's port number


 I

 I

 I
,
 J" proxy's (internal) IP address


 J

 J

 J
5
 K"( proxy's destination TCP/IP port number


 K

 K

 K
D
 M!"7 should we make any action different than the default?


 M

 M

 M 
r
Q df ControlResponse provides parameters for establishing a proxy forwarding session to a customer device



Q
6
 S the 5-tuple
" app protocol (eg. "BGP")


 S

 S

 S
6
T") customer device's (internal) IP address


T

T

T
,
U" customer device's port number


U

U

U
,
V" proxy's (internal) IP address


V

V

V
5
W"( proxy's destination TCP/IP port number


W

W

W
v
Z* params for the terminator (internal use)
"= how long to use this response (seconds); 0 means no caching


Z

Z

Z
R
["E how many times the cache can return this response; 0 means no limit


[

[

[
D
\!"7 should we make any action different than the default?


\

\

\ 
B
]%"5 client MUST set this gRPC metadata for Data() calls


]

]

] 

]#$
6
	` params for the connection
" company id


	`

	`

	`
#

a" customer device's id



a


a


a
%
b " customer device's name


b

b

b
%
c" TCP-MD5 key (optional)


c

c

c
c
h kW KeyVal is a key-value(s) pair
 gRPC key-val metadata is represented as HTTP/2 headers



h

 i

 i

 i

 i

j 

j

j

j

j
Y
 n rM ControlAction is used to signal Control() actions, such as blocking devices



 n
!
  o'" carry on, all good


  o"

  o%&
H
 p$"; deny access, block all connections from proto + device_ip


 p

 p"#
6
 q%") keep-alive message, ignore its contents


 q 

 q#$
V
u yJ DataAction is used to signal Data() actions, such as killing the session



u
+
 v$" no event, all good, carry on


 v

 v"#
*
w" kill the proxied connection


w

w
2
x "% graceful restart of the gRPC stream


x

x
_
| S DataRequest holds bytes received from device that should be sent to the SaaS side



|
)
 }" if not 0, signals an event


 }

 }

 }

~ " raw data bytes


~

~

~

~
]
? ?O DataResponse holds bytes received from SaaS that should be sent to the device


?
*
 ?" if not 0, signals an event


 ?

 ?

 ?

? " raw data bytes


?

?

?

?bproto3??  
?
%kentik/ktrac/route/v202104/flow.protokentik.ktrac.route.v202104google/protobuf/timestamp.proto%kentik/ktrac/route/v202104/elem.proto,kentik/ktrac/route/v202104/annotations.proto"?
Flow;
nlri (2'.kentik.ktrac.route.v202104.UnicastNlriRnlri]
vantage_point_table (2-.kentik.ktrac.route.v202104.VantagePointTableRvantagePointTable9

first_time (2.google.protobuf.TimestampR	firstTimeD

last_route (2%.kentik.ktrac.route.v202104.FlowRouteR	lastRouteD
counters (2(.kentik.ktrac.route.v202104.FlowCountersRcountersI
annotations (2'.kentik.ktrac.route.v202104.AnnotationsRannotations"?
	FlowRoute.
time (2.google.protobuf.TimestampRtime8
type (2$.kentik.ktrac.route.v202104.ElemTypeRtypeF

attributes (2&.kentik.ktrac.route.v202104.AttributesR
attributes"?
FlowCounters

peer_state (R	peerState"
announcement (Rannouncement

withdrawal (R
withdrawal
	rib_entry (RribEntry
sync (Rsync
total (RtotalB&Z$github.com/kentik/ktrac/pkg/route/pbJ?
  !

  

 #

 ;
	
 ;
	
  )
	
 /
	
 6


 	 


 	

  


  


  


  


 ,

 

 '

 *+

 +

 

 &

 )*

 

 

 

 

 

 

 

 

 

 

 

 


 




 %

 

  

 #$



















 !




 

 

 	

 





	







	







	







	



 

 

 	

 bproto3??  
?
#kentik/ktrac/route/v202104/vp.protokentik.ktrac.route.v202104google/protobuf/timestamp.proto%kentik/ktrac/route/v202104/elem.proto"?
VantagePointStats;
last_update (2.google.protobuf.TimestampR
lastUpdate5
last_rib (2.google.protobuf.TimestampRlastRib
routes (Rroutes"?
VantagePointMeta]
vantage_point_table (2-.kentik.ktrac.route.v202104.VantagePointTableRvantagePointTable.
time (2.google.protobuf.TimestampRtimeC
state (2-.kentik.ktrac.route.v202104.VantagePointStateRstateC
stats (2-.kentik.ktrac.route.v202104.VantagePointStatsRstats*r
VantagePointState#
VANTAGE_POINT_STATE_UNSPECIFIED 
VANTAGE_POINT_STATE_UP
VANTAGE_POINT_STATE_DOWNB&Z$github.com/kentik/ktrac/pkg/route/pbJ?
  (

  

 #

 ;
	
 ;
	
  )
	
 /


  


 

  	&

  	!

  	$%

 


 


 


 

 

 


  


 
5
  ,( Timestamp of the last seen update elem


  

  '

  *+
F
 )9 Time of the last RIB processed (not the last RIB entry)


 

 $

 '(
b
 U Number of routes currently tracked
 This may be non-zero even if the VP is not "UP"


 

 	

 


 (



-
 ,  VPTable this message refers to


 

 '

 *+
0
!%# Time that this update took effect


!

! 

!#$
,
$ Current state of this VPTable


$

$

$
!
' Current statistics


'

'

'bproto3??  
?!
&kentik/label/v202203alpha1/label.protokentik.label.v202203alpha1google/api/annotations.protogoogle/api/client.protogoogle/type/latlng.proto google/type/postal_address.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.protogoogle/protobuf/timestamp.proto"?
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
DeleteLabelResponse2?
LabelService?

ListLabels-.kentik.label.v202203alpha1.ListLabelsRequest..kentik.label.v202203alpha1.ListLabelsResponse"??AOFetch Search Labels-Return list of labels matches search critera.*	ListLabel??admin.label:read????/label/v202203alpha1/labels?
CreateLabel..kentik.label.v202203alpha1.CreateLabelRequest/.kentik.label.v202203alpha1.CreateLabelResponse"??AMCreate a label.-Create a label from request. returns created.*LabelCreate??admin.label:write???? "/label/v202203alpha1/labels:*?
UpdateLabel..kentik.label.v202203alpha1.UpdateLabelRequest/.kentik.label.v202203alpha1.UpdateLabelResponse"??AWUpdate a label.7Replaces the entire label attributes specified with id.*LabelUpdate??admin.label:write????+"&/label/v202203alpha1/labels/{label.id}:*?
DeleteLabel..kentik.label.v202203alpha1.DeleteLabelRequest/.kentik.label.v202203alpha1.DeleteLabelResponse"??ADDelete a label.$Deletes the label specified with id.*LabelDelete??admin.label:write????"* /label/v202203alpha1/labels/{id}%?Agrpc.api.kentik.com??admin.labelB?ZDgithub.com/kentik/api-schema/gen/go/kentik/label/v202203alpha1;label?A?3
	Label API"
Kentik API Engineering2202203alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ?
  ?

  

 #

 [
	
 [
	
  &
	
 !
	
 "
	
 *
	
	 8
	

 5
	
 )
	
 9

? 9


 ; E


 ;

  <

  <

  <	

  <

 =

 =

 =	

 =

 >

 >

 >	

 >
#
 @ hex color code value


 @

 @	

 @
 
 B& Create timestamp.


 B

 B!

 B$%
 
 D& Update timestamp.


 D

 D!

 D$%


G H


G


I L


I

 J

 J


 J

 J

 J

K

K

K

K


N P


N

 O

 O

 O

 O


Q S


Q

 R

 R

 R

 R


U W


U

 V

 V

 V

 V


X Z


X

 Y

 Y

 Y

 Y


\ _


\

 ^ ID of label.


 ^

 ^	

 ^
	
` 


`

 c ?


 c


 d;

 ?d;


 eC

 ?*eC

  hr

  h

  h"

  h-?

  iI

  ?*iI

  jl

	  ?ʼ"jl

  mq

  ?mq

 t

 t

 t$

 t/B

 uJ

 ?*uJ

 vy

	 ?ʼ"vy

 z~

 ?z~

 ??

 ?

 ?$

 ?/B

 ?J

 ?*?J

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?$

 ?/B

 ?J

 ?*?J

 ??

	 ?ʼ"??

 ??

 ???bproto3??    
??
"kentik/mkp/v202102alpha1/mkp.protokentik.mkp.v202102alpha1google/api/annotations.protogoogle/api/client.proto google/protobuf/field_mask.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto"?
Alert
saved (Rsaved
	policy_id (RpolicyIdC

thresholds (2#.kentik.mkp.v202102alpha1.ThresholdR
thresholds%
primary_metric (	RprimaryMetric+
secondary_metrics (	RsecondaryMetrics
is_template (R
isTemplate!
subpolicy_id (	RsubpolicyId"?
Asset@
reports (2&.kentik.mkp.v202102alpha1.Asset.ReportRreportsM
default_report (2&.kentik.mkp.v202102alpha1.Asset.ReportRdefaultReport,
Report
id (Rid
type (	Rtype"?
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
receive_landlord_notifications	 (RreceiveLandlordNotifications"?
Activate
times (Rtimes
operator (	Roperator
	time_unit (	RtimeUnit
time_window (R
timeWindow!
grace_period (RgracePeriod"?
	Condition
type (	Rtype
value (Rvalue
metric (	Rmetric
operator (	Roperator

value_type (	R	valueType!
value_select (	RvalueSelect"?

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
id (Rid"?
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
pivot_user_group_id (RpivotUserGroupId"?
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
	populator (	R	populator"?
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
filter_value (	RfilterValue"?
Filter
name (	Rname
named (Rnamed
	connector (	R	connector
not (Rnot

auto_added (	R	autoAdded#
saved_filters (	RsavedFilters?
filters (2%.kentik.mkp.v202102alpha1.FilterFieldRfiltersE
filter_groups (2 .kentik.mkp.v202102alpha1.FilterRfilterGroups
metric	 (	Rmetric"?
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
package (2!.kentik.mkp.v202102alpha1.PackageRpackage"?
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
DeleteTenantResponse2?
PackageService?
ListPackage,.kentik.mkp.v202102alpha1.ListPackageRequest-.kentik.mkp.v202102alpha1.ListPackageResponse"z?ABList MKP packages.Returns a list of MKP packages.*PackageList??admin.mkp:read????/mkp/v202102alpha1/packages?

GetPackage+.kentik.mkp.v202102alpha1.GetPackageRequest,.kentik.mkp.v202102alpha1.GetPackageResponse"??Ae!Get information aboout a package.4Returns information about package specified with ID.*
PackageGet??admin.mkp:read????" /mkp/v202102alpha1/packages/{id}?
CreatePackage..kentik.mkp.v202102alpha1.CreatePackageRequest/.kentik.mkp.v202102alpha1.CreatePackageResponse"??AbCreate a package template.5Create package from request. returns created package.*PackageCreate??admin.mkp:write???? "/mkp/v202102alpha1/packages:*?
UpdatePackage..kentik.mkp.v202102alpha1.UpdatePackageRequest/.kentik.mkp.v202102alpha1.UpdatePackageResponse"??A]Update a package.9Replaces the entire package attributes specified with id.*PackageUpdate??admin.mkp:write????-(/mkp/v202102alpha1/packages/{package.id}:*?
PatchPackage-.kentik.mkp.v202102alpha1.PatchPackageRequest..kentik.mkp.v202102alpha1.PatchPackageResponse"??ApPatch a package.NPartially Updates the attributes of package specified with id and mask fields.*PackagePatch??admin.mkp:write????-2(/mkp/v202102alpha1/packages/{package.id}:*?
DeletePackage..kentik.mkp.v202102alpha1.DeletePackageRequest/.kentik.mkp.v202102alpha1.DeletePackageResponse"??AJDelete a package.&Deletes the package specified with id.*PackageDelete??admin.mkp:write????"* /mkp/v202102alpha1/packages/{id}"?Amkp.api.kentik.com??	admin.mkp2?
TenantService?

ListTenant+.kentik.mkp.v202102alpha1.ListTenantRequest,.kentik.mkp.v202102alpha1.ListTenantResponse"v?A?List MKP tenants.Returns a list of MKP tenants.*
TenantList??admin.mkp:read????/mkp/v202102alpha1/tenants?
	GetTenant*.kentik.mkp.v202102alpha1.GetTenantRequest+.kentik.mkp.v202102alpha1.GetTenantResponse"??Ac Get information aboout a tenant.4Returns information about package specified with ID.*	TenantGet??admin.mkp:read????!/mkp/v202102alpha1/tenants/{id}?
CreateTenant-.kentik.mkp.v202102alpha1.CreateTenantRequest..kentik.mkp.v202102alpha1.CreateTenantResponse"??AUCreate a tenant.3Create tenant from request. returns created tenant.*TenantCreate??admin.mkp:write????"/mkp/v202102alpha1/tenants:*?
UpdateTenant-.kentik.mkp.v202102alpha1.UpdateTenantRequest..kentik.mkp.v202102alpha1.UpdateTenantResponse"??AZUpdate a tenant.8Replaces the entire tenant attributes specified with id.*TenantUpdate??admin.mkp:write????+&/mkp/v202102alpha1/tenants/{tenant.id}:*?
PatchTenant,.kentik.mkp.v202102alpha1.PatchTenantRequest-.kentik.mkp.v202102alpha1.PatchTenantResponse"??AmPatch a tenant.MPartially Updates the attributes of tenant specified with id and mask fields.*TenantPatch??admin.mkp:write????+2&/mkp/v202102alpha1/tenants/{tenant.id}:*?
DeleteTenant-.kentik.mkp.v202102alpha1.DeleteTenantRequest..kentik.mkp.v202102alpha1.DeleteTenantResponse"??AGDelete a tenant.%Deletes the tenant specified with id.*TenantDelete??admin.mkp:write????!*/mkp/v202102alpha1/tenants/{id}"?Amkp.api.kentik.com??	admin.mkpB?Z@github.com/kentik/api-schema/gen/go/kentik/mkp/v202102alpha1;mkp?A?P
MKP API"7
Kentik API Engineeringhttps://github.com/kentik/api2202102alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ?]
 ?
'
 2 My Kentik Portal management


 !

 W
	
 W
	
  &
	
 !
	
	 *
	

 8
	
 5
	
 9

? 9
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

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?
!
?" revisit timestamp


?

?	

?
7
? ) Required for the CreateTenant operation


?

?

?
7
?) Required for the CreateTenant operation


?

?	

?
7
	?) Required for the CreateTenant operation


	?

	?	

	?
9
? ?+ Tenants referencing this Package template


?

 ?

 ?

 ?	

 ?

?

?

?	

?

?!

?

?	

? 
+
	? ? Package Template definition


	?

	 ?

	 ?

	 ?	

	 ?

	?

	?

	?	

	?

	?

	?

	?	

	?

	?

	?

	?	

	?

	?

	?

	?	

	?

	?

	?

	?	

	?

	?

	?


	?

	?

	?

	?

	?

	?

	?

	?

	?

	?

	?
P
		?#B list of tenants using this Package template (for GetTenant only)


		?


		?

		?

		? "


? ?


?


 ?


 ?


 ?	


 ?


?


?


?	


?

? ?

?

 ?

 ?

 ?

 ?

?#

?


?

?

?!"

?$

?


?

?

?"#

?#

?


?

?

?!"

?"

?


?

?

? !

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?

?

?

?

?	

?

?

?

?


?

?

?

?	

?

?$

?


?

?

?"#

?#

?


?

?

?!"

?$

?


?

?

?"#

?

?


?

?

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?

?

? config object


?


?

?

?

?

?

?

?

?

?

?	

?

	?

	?

	?	

	?


?2


?



?


?,


?/1

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?
D
?!6 Packages associated with Tenant (for GetTenant only)


?


?

?

? 
A
?3 Users associated with Tenant (for GetTenant only)


?


?

?

?
-
? Package ID to use with tenant


?

?	

?


? 

?

? ?

?

 ? 

 ?


 ?

 ?

 ?
T
?F The number of invalid packages, for troubleshooting. Should be zero.


?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

? ?

?

 ?

 ?	

 ?


 ?

? ?

?

 ?

 ?	

 ?


 ?

? ?

?

 ?

 ?	

 ?


 ?

? ?

?

 ?

 ?	

 ?


 ?

? ?

?

 ?

 ?	

 ?


 ?

? ?

?

 ?

 ?	

 ?


 ?

?%q CSV values of fields follow the path of Package object dot notation (ie. "package.name,package.assets.reports")


?

? 

?#$

? ?

?

 ?

 ?	

 ?


 ?

? ?

?

 ?

 ?

 ?	

 ?


?  

?

 ? ?

 ?

 ?:

 ??:

 ?A

 ?*?A

  ??

  ?

  ?$

  ?/B

  ?G

  ?*?G

  ??

	  ?ʼ"??

  ??

  ???

 ??

 ?

 ?"

 ?-?

 ?G

 ?*?G

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?(

 ?3H

 ?H

 ?*?H

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?(

 ?3H

 ?H

 ?*?H

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?&

 ?1E

 ?H

 ?*?H

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?(

 ?3H

 ?H

 ?*?H

 ??

	 ?ʼ"??

 ??

 ???


? 

?

? ?

?

 ?

 ?


 ?

 ?

 ?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

? ?

?

 ?

 ?

 ?	

 ?

? ?

?

 ?

 ?

 ?	

 ?

 ? ?

 ?

  ?

  ?

  ?	

  ?

!? ?

!?

! ?

! ?

! ?	

! ?

"? ?

"?

" ?

" ?

" ?	

" ?

#? ?

#?

# ?

# ?

# ?	

# ?
z
#?%l CSV values of fields follow the path of Tenant object dot notation (ie. "tenant.name,tenant.filters.name")


#?

#? 

#?#$

$? ?

$?

$ ?

$ ?

$ ?	

$ ?

%? ?

%?

% ?

% ?

% ?	

% ?


&? 

&?

? ?

?

?:

??:

?A

?*?A

 ??

 ?

 ?"

 ?-?

 ?G

 ?*?G

 ??

	 ?ʼ"??

 ??

 ???

??

?

? 

?+<

?G

?*?G

??

	?ʼ"??

??

???

??

?

?&

?1E

?H

?*?H

??

	?ʼ"??

??

???

??

?

?&

?1E

?H

?*?H

??

	?ʼ"??

??

???

??

?

?$

?/B

?H

?*?H

??

	?ʼ"??

??

???

??

?

?&

?1E

?H

?*?H

??

	?ʼ"??

??

???bproto3??  
?
6kentik/network_class/v202109alpha1/network_class.proto"kentik.network_class.v202109alpha1google/api/annotations.protogoogle/api/client.protogoogle/type/latlng.proto google/type/postal_address.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto"j
CloudSubnetA
type (2-.kentik.network_class.v202109alpha1.CloudTypeRtype
subnets (	Rsubnets"?
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
CLOUD_TYPE_IBM2?
NetworkClassService?
GetNetworkClass:.kentik.network_class.v202109alpha1.GetNetworkClassRequest;.kentik.network_class.v202109alpha1.GetNetworkClassResponse"??AuGet a network classification.CReturns information about a network classification for the company.*NetworkClassGet??admin.network_class:read????,*/network_class/v202109alpha1/network_class?
UpdateNetworkClass=.kentik.network_class.v202109alpha1.UpdateNetworkClassRequest>.kentik.network_class.v202109alpha1.UpdateNetworkClassResponse"??A~ Update a network classification.FReplaces the entire network classification attributes for the company.*NetworkClassUpdate??admin.network_class:write????/"*/network_class/v202109alpha1/network_class:*-?Agrpc.api.kentik.com??admin.network_classB?ZTgithub.com/kentik/api-schema/gen/go/kentik/network_class/v202109alpha1;network_class?A?D
Network Classification API"
Kentik API Engineering2202109alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ?
  ?

  

 +

 k
	
 k
	
  &
	
 !
	
 "
	
 *
	
	 8
	

 5
	
 8

? 8


 : @


 :

  ;

  ;

  ;

 <

 <

 <

 =

 =

 =

 >

 >

 >

 ?

 ?

 ?


 B G


 B

  D Cloud provider


  D

  D

  D

 F Subnet masks


 F


 F

 F

 F


J U


J

 L$ Internal ASNs


 L


 L

 L

 L"#

N# Internal IPs


N


N

N

N!"
+
P Specify to use internal ASNs


P

P

P
*
R Specify to use internal IPs


R

R

R
.
T)! Cloud provider and subnet info.


T


T

T$

T'(
	
X !


X


Y [


Y

 Z!

 Z

 Z

 Z 


] _


]!

 ^!

 ^

 ^

 ^ 


` b


`"

 a!

 a

 a

 a 

 e ?


 e


 f;

 ?f;


 gK

 ?*gK

  jt

  j

  j,

  j7N

  kQ

  ?*kQ

  ln

	  ?ʼ"ln

  os

  ?os

 v?

 v

 v2

 v=W

 wR

 ?*wR

 x{

	 ?ʼ"x{

 |?

 ?|?bproto3??    
?#
Dkentik/notification_channel/v202204alpha1/notification_channel.proto)kentik.notification_channel.v202204alpha1google/api/annotations.protogoogle/api/client.protogoogle/type/latlng.proto google/type/postal_address.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.protogoogle/protobuf/timestamp.proto"?
NotificationChannel
id (	Rid
name (	RnameJ
type (26.kentik.notification_channel.v202204alpha1.ChannelTypeRtype
status (	Rstatus0
cdate (2.google.protobuf.TimestampRcdate0
edate (2.google.protobuf.TimestampRedate"!
ListNotificationChannelsRequest"?
 ListNotificationChannelsResponses
notification_channels (2>.kentik.notification_channel.v202204alpha1.NotificationChannelRnotificationChannels#
invalid_count (RinvalidCount"/
GetNotificationChannelRequest
id (	Rid"?
GetNotificationChannelResponseq
notification_channel (2>.kentik.notification_channel.v202204alpha1.NotificationChannelRnotificationChannel*?
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
CHANNEL_TYPE_PAGERDUTY2?
NotificationChannelService?
ListNotificationChannelsJ.kentik.notification_channel.v202204alpha1.ListNotificationChannelsRequestK.kentik.notification_channel.v202204alpha1.ListNotificationChannelsResponse"??A{!Fetch Search NotificationChannels<Return list of notification_channels matches search critera.*ListNotificationChannels??admin.notification_channel:read????;9/notification_channel/v202204alpha1/notification_channels?
GetNotificationChannelH.kentik.notification_channel.v202204alpha1.GetNotificationChannelRequestI.kentik.notification_channel.v202204alpha1.GetNotificationChannelResponse"??A?)Get information about NotificationChannelAReturns information about notification_channel specified with ID.*GetNotificationChannel??admin.notification_channel:read????@>/notification_channel/v202204alpha1/notification_channels/{id}4?Agrpc.api.kentik.com??admin.notification_channelB?Zbgithub.com/kentik/api-schema/gen/go/kentik/notification_channel/v202204alpha1;notification_channel?A?A
NotificationChannel API"
Kentik API Engineering2202204alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ?
  ?

  

 2

 y
	
 y
	
  &
	
 !
	
 "
	
 *
	
	 8
	

 5
	
 )
	
 9

? 9


 ; I


 ;

  <

  <

  <

 =

 =

 =

 >

 >

 >

 ?

 ?

 ?

 @

 @

 @

 A

 A

 A

 B"

 B

 B !

 C

 C

 C

 D

 D

 D

 	E

 	E

 	E

 
F

 
F

 
F

 G

 G

 G

 H

 H

 H


 K T


 K

  L

  L

  L	

  L

 M

 M

 M	

 M

 N

 N

 N

 N

 O

 O

 O	

 O
 
 Q& Create timestamp.


 Q

 Q!

 Q$%
 
 S& Update timestamp.


 S

 S!

 S$%


V W


V'


X [


X(

 Y9

 Y


 Y

 Y4

 Y78

Z

Z

Z

Z


] _


]%

 ^

 ^

 ^	

 ^


` b


`&

 a/

 a

 a*

 a-.

 d ?


 d"


 e;

 ?e;


 fR

 ?*fR

  is

  i

  i>

  iIi

  jX

  ?*jX

  km

	  ?ʼ"km

  nr

  ?nr

 u

 u

 u:

 uEc

 vX

 ?*vX

 wy

	 ?ʼ"wy

 z~

 ?z~bproto3??    
?1
#kentik/notify/backend/v0/meta.protokentik.api.notify.v0google/api/annotations.protogoogle/protobuf/empty.proto+kentik/core/v202012alpha1/annotations.proto"?
DatabasePoolSettings"
maxOpenConns (RmaxOpenConns"
maxIdleConns (RmaxIdleConns6
connMaxLifeTimeSeconds (RconnMaxLifeTimeSeconds6
connMaxIdleTimeSeconds (RconnMaxIdleTimeSeconds"?
DatabaseStats.
maxOpenConnections (RmaxOpenConnections(
openConnections (RopenConnections
inUse (RinUse
idle (Ridle
	waitCount (R	waitCount.
waitDurationMillis (RwaitDurationMillis$
maxIdleClosed (RmaxIdleClosed,
maxIdleTimeClosed (RmaxIdleTimeClosed,
maxLifetimeClosed	 (RmaxLifetimeClosed"*
GetDBPoolSettingsRequest
id (	Rid"c
GetDBPoolSettingsResponseF
settings (2*.kentik.api.notify.v0.DatabasePoolSettingsRsettings"r
SetDBPoolSettingsRequest
id (	RidF
settings (2*.kentik.api.notify.v0.DatabasePoolSettingsRsettings"
SetDBPoolSettingsResponse"#
GetDBStatsRequest
id (	Rid"O
GetDBStatsResponse9
stats (2#.kentik.api.notify.v0.DatabaseStatsRstats"?
MetaEnvResponse@
env (2..kentik.api.notify.v0.MetaEnvResponse.EnvEntryRenv
redacted (	Rredacted6
EnvEntry
key (	Rkey
value (	Rvalue:8"-
LogLevelRequest
logLevel (	RlogLevel"X
LogLevelResponse
logLevel (	RlogLevel(
initialLogLevel (	RinitialLogLevel"4
LogJSONModeRequest
jsonMode (BRjsonMode"5
LogJSONModeResponse
jsonMode (BRjsonMode2?	
Meta?
GetDBPoolSettings..kentik.api.notify.v0.GetDBPoolSettingsRequest/.kentik.api.notify.v0.GetDBPoolSettingsResponse"0????*(/notify/backend/v0/meta/db/{id}/settings?
SetDBPoolSettings..kentik.api.notify.v0.SetDBPoolSettingsRequest/.kentik.api.notify.v0.SetDBPoolSettingsResponse"0????*(/notify/backend/v0/meta/db/{id}/settings?

GetDBStats'.kentik.api.notify.v0.GetDBStatsRequest(.kentik.api.notify.v0.GetDBStatsResponse"-????'%/notify/backend/v0/meta/db/{id}/statsl
GetEnv.google.protobuf.Empty%.kentik.api.notify.v0.MetaEnvResponse"#????/notify/backend/v0/meta/envx
GetLogLevel.google.protobuf.Empty&.kentik.api.notify.v0.LogLevelResponse")????#!/notify/backend/v0/meta/log/level?
SetLogLevel%.kentik.api.notify.v0.LogLevelRequest&.kentik.api.notify.v0.LogLevelResponse"3????-!/notify/backend/v0/meta/log/level:logLevel?
GetLogJSONMode.google.protobuf.Empty).kentik.api.notify.v0.LogJSONModeResponse"+?????" /notify/backend/v0/meta/log/json?
SetLogJSONMode(.kentik.api.notify.v0.LogJSONModeRequest).kentik.api.notify.v0.LogJSONModeResponse".?????% /notify/backend/v0/meta/log/json:*??B!Zkentik/notify/backend/v0;notifyJ?
  ?

  

 

 6
	
 6
	
  &
	
 %
	
 5


  


 

  	

  	

  	

  	

 


 


 


 


 $

 

 	

 "#

 $

 

 	

 "#
"
  golang's sql.DBStats




B
 "5 Maximum number of open connections to the database.


 

 

 
J
"= The number of established connections both in use and idle.




	


:
"- The number of connections currently in use.




	


.
"! The number of idle connections.




	


F

 Counters
"- The total number of connections waited for.







?
 B NOTE: duration in go; just convert this to millis for simplicity
"L The total time blocked waiting for a new connection. (converted to millis)




	


M
"@ The total number of connections closed due to SetMaxIdleConns.







P
"C The total number of connections closed due to SetConnMaxIdleTime.







P
"C The total number of connections closed due to SetConnMaxLifetime.









! #


! 
1
 ""$ dsn id, eg. "chwww-ro" or whatever


 "

 "	

 "


% '


%!

 &$

 &

 &

 &"#


) ,


) 
1
 *"$ dsn id, eg. "chwww-ro" or whatever


 *

 *	

 *

+$

+

+

+"#


. /


.!


1 3


1
1
 2"$ dsn id, eg. "chwww-ro" or whatever


 2

 2	

 2


5 7


5

 6

 6

 6

 6


 9 r


 9


 :<

 ?*:<

  <@

  <

  <0

  <;T

  =?

	  ?ʼ"=?

 BF

 B

 B0

 B;T

 CE

	 ?ʼ"CE

 HL

 H

 H"

 H-?

 IK

	 ?ʼ"IK

 NR

 N

 N"

 N-<

 OQ

	 ?ʼ"OQ

 TX

 T

 T'

 T2B

 UW

	 ?ʼ"UW

 Z_

 Z

 Z!

 Z,<

 [^

	 ?ʼ"[^

 bg deprecated


 b

 b*

 b5H

 c

 !c

 df

	 ?ʼ"df

 jp deprecated


 j

 j'

 j2E

 k

 !k

 lo

	 ?ʼ"lo


t w


t

 u

 u

 u

 u

v

v


v

v

v


	y {


	y

	 z

	 z

	 z	

	 z


} ?



}


 ~


 ~


 ~	


 ~








	




? ?

?

 ?&

 ?

 ?

 ?

 ?%

 ?$

? ?

?

 ?&

 ?

 ?

 ?

 ?%

 ?$bproto3??  
?
)kentik/notify/backend/v0/migrations.protokentik.api.notify.v0google/api/annotations.protogoogle/protobuf/timestamp.proto+kentik/core/v202012alpha1/annotations.proto"R
MigrationsRequest=
status (2%.kentik.api.notify.v0.MigrationStatusRstatus"U
MigrationsResponse?

migrations (2.kentik.api.notify.v0.MigrationR
migrations"?
	Migration
id (Rid
name (	Rname=
status (2%.kentik.api.notify.v0.MigrationStatusRstatus8
	appliedOn (2.google.protobuf.TimestampR	appliedOn
sql (	Rsql"a
RunMigrationsRequestI
migrationsToRun (2.kentik.api.notify.v0.MigrationRmigrationsToRun"j
RunMigrationsResponse
msg (	Rmsg?

migrations (2.kentik.api.notify.v0.MigrationR
migrations*G
MigrationStatus
unknownMigrationStatus 
pending
applied2?

Migrations?
ListMigrations'.kentik.api.notify.v0.MigrationsRequest(.kentik.api.notify.v0.MigrationsResponse"????/notify/v0/migrations?
RunMigrations*.kentik.api.notify.v0.RunMigrationsRequest+.kentik.api.notify.v0.RunMigrationsResponse"$????"/notify/v0/migrations:run:*??B!Zkentik/notify/backend/v0;notifyJ?	
  6

  

 

 6
	
 6
	
  &
	
 )
	
 5


  


 


 	<

 ?*	<

  

  

  &

  1C

  

	  ?ʼ"

 

 

 (

 3H

 

	 ?ʼ"


  


 

  

  

  

  


 




 $

 


 

 

 "#


! '


!

 "

 "

 "


 "

#

#

#	

#

$

$

$

$

%*

%

%%

%()

&

&

&	

&


 ) -


 )

  *

  *

  *

 +

 +	

 +

 ,

 ,	

 ,


/ 1


/

 0)" only id required


 0


 0

 0$

 0'(


3 6


3

 4

 4

 4	

 4

5$

5


5

5

5"#bproto3??  
?
+kentik/notify/backend/v0/models-event.protokentik.api.notify.v0"?
NotificationEvent
	companyID (R	companyIDB

alarmEvent (2 .kentik.api.notify.v0.AlarmEventH R
alarmEventQ
mitigationEvent (2%.kentik.api.notify.v0.MitigationEventH RmitigationEventH
insightEvent (2".kentik.api.notify.v0.InsightEventH RinsightEventi
mitigationPlatformEvent (2-.kentik.api.notify.v0.MitigationPlatformEventH RmitigationPlatformEventH
genericEvent (2".kentik.api.notify.v0.GenericEventH RgenericEvent]
extraDetails (29.kentik.api.notify.v0.NotificationEvent.ExtraDetailsEntryRextraDetails?
ExtraDetailsEntry
key (	Rkey
value (Rvalue:8B
event"+
NotificationEventResponse
ok (Rok"?

AlarmEvent
alarmID (RalarmID&
alarmHistoryID (RalarmHistoryID
policyID (RpolicyID 
thresholdID (RthresholdID"?
MitigationEvent"
mitigationID (RmitigationID,
mitigationEventID (RmitigationEventID
policyID (RpolicyID 
thresholdID (RthresholdID2
mitigationPlatformID (RmitigationPlatformID.
mitigationMethodID (RmitigationMethodID"?
InsightEvent
	insightID (	R	insightID&
dataSourceType (	RdataSourceType 
insightName (	RinsightName$
insightFamily (	RinsightFamily"[
MitigationPlatformEvent

platformID (R
platformID 
description (	Rdescription"?
GenericEvent
title (	Rtitle 
description (	Rdescription
url (	Rurl=
kvs (2+.kentik.api.notify.v0.GenericEvent.KvsEntryRkvs

channelIDs (R
channelIDs6
KvsEntry
key (	Rkey
value (	Rvalue:8B!Zkentik/notify/backend/v0;notifyJ?
  A

  

 

 6
	
 6


  


 

  

  

  

  

  

  

 

 

 

 

 	(

 	

 	#

 	&'

 
"

 


 


 
 !

 8

 

 3

 67

 "

 

 

  !

 &

 

 !

 $%


 


!

 

 

 	

 


 




 

 

 

 
H
"; TODO: final name of this field corresponding to alert-api







?
? This data is denormalized, but we need it to do channel selection w/o lookups.
 Do not include data for the rendering layer, just for channel selection.

















  *


 

 !

 !

 !

 !

"

"

"

"
?
&? This data is denormalized, but we need it to do channel selection w/o lookups.
 Do not include data for the rendering layer, just for channel selection.


&

&

&

'

'

'

'

(!

(

(

( 

)

)

)

)


, 4


,

 -

 -

 -	

 -
?
1? This data is denormalized, but we need it to do channel selection w/o lookups.
 Do not include data for the rendering layer, just for channel selection.


1

1	

1

2

2

2	

2

3

3

3	

3


6 9


6

 7

 7

 7

 7

8

8

8	

8


; A


;

 <

 <

 <	

 <

=

=

=	

=

>

>

>	

>

?

?

?

?

@ "
 optional


@


@

@

@bproto3??  
?	
3kentik/notify/backend/v0/models-channel-event.protokentik.api.notify.v0google/protobuf/timestamp.proto+kentik/notify/backend/v0/models-event.proto"?
ChannelEvent
	channelID (R	channelIDL
channelVersion (2$.kentik.api.notify.v0.ChannelVersionRchannelVersionB
eventTimestamp (2.google.protobuf.TimestampReventTimestamp=
event (2'.kentik.api.notify.v0.NotificationEventRevent*U
ChannelVersion
channelVersionUnknown 
channelVersion1
channelVersion2B!Zkentik/notify/backend/v0;notifyJ?
  

  

 

 6
	
 6
	
  )
	
 5


  


 

  	

  	

  	

  	

 
$

 


 


 
"#
?
 /t eventTimestamp is when the NotificationEvent was ingested by kafka.
 i.e. the ConsumerMessage.Timestamp when read.


 

 *

 -.

 

 

 

 


  


 

  

  

  
G
 ": channels defined in ch_www.mn_alert_notification_channel


 

 
5
 "( channels defined and owned by "notify"


 

 bproto3??  
?
3kentik/notify/backend/v0/models-channel-batch.protokentik.api.notify.v03kentik/notify/backend/v0/models-channel-event.proto"p
ChannelBatch:
events (2".kentik.api.notify.v0.ChannelEventRevents$
timesEnqueued (RtimesEnqueuedB!Zkentik/notify/backend/v0;notifyJ?
  	

  

 

 6
	
 6
	
  =


  	


 

  #

  


  

  

  !"

 

 

 

 bproto3??  
?
6kentik/notify/backend/v0/models-channel-send-job.protokentik.api.notify.v0google/protobuf/timestamp.proto3kentik/notify/backend/v0/models-channel-event.proto"?
ChannelSendJob
	channelID (R	channelIDL
channelVersion (2$.kentik.api.notify.v0.ChannelVersionRchannelVersion
jobUUID (	RjobUUID&
notificationID (RnotificationID&
timesAttempted (RtimesAttempted@
firstEnqueued (2.google.protobuf.TimestampRfirstEnqueued<
lastFailure (2.google.protobuf.TimestampRlastFailureJB!Zkentik/notify/backend/v0;notifyJ?
  

  

 

 6
	
 6
	
  )
	
 =


  


 

  	

  	

  	

  	

 
$

 


 


 
"#
:
 - randomly assigned id representing this job.


 

 	

 
0
 # id of the underlying notification


 

 

 
M
 	"A was payloadBody. Going forward look this up via notificationID.


 	 

 	 

 

 

 

 
?
 .? firstEnqueued is when the job was first enqueued into the send queue,
 not the most recent time if this is a retry. On a job that has not
 failed yet, it will be unset.


 

 )

 ,-

 ,

 

 '

 *+bproto3??  
?
:kentik/notify/backend/v0/models-notification-to-send.protokentik.api.notify.v0"
NotificationToSendB!Zkentik/notify/backend/v0;notifyJQ
  

  

 

 6
	
 6

  " TODO



 bproto3??  
?	
2kentik/notify/backend/v0/models-notification.protokentik.api.notify.v0google/protobuf/timestamp.proto3kentik/notify/backend/v0/models-channel-batch.proto3kentik/notify/backend/v0/models-channel-event.proto"?
NotificationL
channelVersion (2$.kentik.api.notify.v0.ChannelVersionRchannelVersion
	channelID (R	channelID
id (Rid
jobUUID (	RjobUUID>
creationTime (2.google.protobuf.TimestampRcreationTime
payload (	Rpayload 
description (	Rdescription8
batch (2".kentik.api.notify.v0.ChannelBatchRbatchB!Zkentik/notify/backend/v0;notifyJ?
  

  

 

 6
	
 6
	
  )
	
 =
	
 =


 	 


 	

  
$

  


  


  
"#

 

 

 

 

 

 

 


 

 

 

 	

 

 -

 

 (

 +,

 

 

 	

 

 

 

 	

 
9
 ", TODO: better format / non-internal format?


 

 

 bproto3??  
?
(kentik/notify/backend/v0/subscribe.protokentik.api.notify.v0"
CreateUserChannelRequest"
CreateUserChannelResponse"Z
SubscribeRequest 
insightName (	RinsightName$
insightFamily (	RinsightFamily"
SubscribeResponseB!Zkentik/notify/backend/v0;notifyJ?
  

  

 

 6
	
 6


  


  


 


!



 





 

 

 	

 





	




 


bproto3??  
??
%kentik/notify/backend/v0/notify.protokentik.api.notify.v0google/api/annotations.protogoogle/api/client.protogoogle/protobuf/duration.protogoogle/protobuf/timestamp.proto3kentik/notify/backend/v0/models-channel-event.proto+kentik/notify/backend/v0/models-event.proto2kentik/notify/backend/v0/models-notification.proto(kentik/notify/backend/v0/subscribe.proto+kentik/core/v202012alpha1/annotations.proto"?
$PopExportedNotificationEventsRequest
id (	Rid
queue (	Rqueue
maxCount (RmaxCount3
timeout (2.google.protobuf.DurationRtimeout"?
 NotificationEventWithProduceTime=
event (2'.kentik.api.notify.v0.NotificationEventRevent<
produceTime (2.google.protobuf.TimestampRproduceTime"w
%PopExportedNotificationEventsResponseN
events (26.kentik.api.notify.v0.NotificationEventWithProduceTimeRevents"?
*ApplyAlertingManagedChannelsMappingRequests
mappings (2W.kentik.api.notify.v0.ApplyAlertingManagedChannelsMappingRequest.PolicyThresholdMappingRmappings?
PolicyThresholdMapping 
alertPolicy (	RalertPolicy&
alertThreshold (	RalertThreshold

channelIDs (R
channelIDs
company (	Rcompany"?
NotificationsRequestL
channelVersion (2$.kentik.api.notify.v0.ChannelVersionRchannelVersion
	channelID (R	channelID&
notificationID (RnotificationID"a
NotificationsResponseH
notifications (2".kentik.api.notify.v0.NotificationRnotifications"?
NotificationChannelsRequest&
showV1Channels (RshowV1ChannelsH
managed (2*.kentik.api.notify.v0.ChannelManagedStatusBRmanagedF
userChannelNotFoundReturnEmpty (RuserChannelNotFoundReturnEmpty"e
NotificationChannelsResponseE
channels (2).kentik.api.notify.v0.NotificationChannelRchannels"b
NotificationChannelResponseC
channel (2).kentik.api.notify.v0.NotificationChannelRchannel"?
NotificationChannelL
channelVersion (2$.kentik.api.notify.v0.ChannelVersionRchannelVersion
	channelID (R	channelID 
channelType (	RchannelType
name (	Rname;
status (2#.kentik.api.notify.v0.ChannelStatusRstatus>
creationTime (2.google.protobuf.TimestampRcreationTime6
editTime (2.google.protobuf.TimestampReditTime;
config (2#.kentik.api.notify.v0.ChannelConfigRconfig
v1Raw	 (	Rv1Raw"?
ChannelConfigL
selectorConfig (2$.kentik.api.notify.v0.SelectorConfigRselectorConfigL
batchingConfig (2$.kentik.api.notify.v0.BatchingConfigRbatchingConfigO
renderingConfig (2%.kentik.api.notify.v0.RenderingConfigRrenderingConfigI
sendingConfig (2#.kentik.api.notify.v0.SendingConfigRsendingConfigF
syslogConfig (2".kentik.api.notify.v0.SyslogConfigRsyslogConfig,
userChannelUserID (RuserChannelUserIDH
managed (2*.kentik.api.notify.v0.ChannelManagedStatusBRmanaged"_
SelectorConfigM
conjunctions (2).kentik.api.notify.v0.SelectorConjunctionRconjunctions"S
SelectorConjunction<
	selectors (2.kentik.api.notify.v0.SelectorR	selectors">
Selector
lhs (	Rlhs
op (	Rop
rhs (	Rrhs"?
BatchingConfig"
maxBatchSize (RmaxBatchSize?
batchDuration (2.google.protobuf.DurationRbatchDurationF
dailyTimesToSend (2.google.protobuf.TimestampRdailyTimesToSend"?
RenderingConfig&
customTemplate (	RcustomTemplate

uglifyJSON (R
uglifyJSON&
insightsDigest (RinsightsDigest"?
SendingConfig
url (	Rurl
username (	Rusername
	usernames (	R	usernames
token (	Rtoken

identifier (	R
identifier\
customHeaders (26.kentik.api.notify.v0.SendingConfig.CustomHeadersEntryRcustomHeaders 
maxAttempts (RmaxAttemptsE
cooldownDuration (2.google.protobuf.DurationRcooldownDuration@
CustomHeadersEntry
key (	Rkey
value (	Rvalue:8"?
SyslogConfig
host (	Rhost
port (Rport
network (	Rnetwork&
syslogHostname (	RsyslogHostname
severity (Rseverity
facility (Rfacility"?
DeliveryResultsRequestL
channelVersion (2$.kentik.api.notify.v0.ChannelVersionRchannelVersion
	channelID (R	channelID
jobUUID (	RjobUUID"Y
DeliveryResultsResponse>
results (2$.kentik.api.notify.v0.DeliveryResultRresults"?
DeliveryResult
id (Rid
	companyID (R	companyIDL
channelVersion (2$.kentik.api.notify.v0.ChannelVersionRchannelVersion
	channelID (R	channelID.
time (2.google.protobuf.TimestampRtime
jobUUID (	RjobUUID

statusCode (R
statusCode 
requestBody (	RrequestBody"
responseBody	 (	RresponseBody>
requestStart
 (2.google.protobuf.TimestampRrequestStart:

requestEnd (2.google.protobuf.TimestampR
requestEnd
error (	Rerror
sent (Rsent"?
NotificationAndStatusRequestL
channelVersion (2$.kentik.api.notify.v0.ChannelVersionRchannelVersion
	channelID (R	channelID"?
NotificationAndStatusResponseF
notification (2".kentik.api.notify.v0.NotificationRnotificationN
deliveryResults (2$.kentik.api.notify.v0.DeliveryResultRdeliveryResults<
status (2$.kentik.api.notify.v0.DeliveryStatusRstatus"?
NotificationPayloadRequestL
channelVersion (2$.kentik.api.notify.v0.ChannelVersionRchannelVersion
	channelID (R	channelIDJ
options (20.kentik.api.notify.v0.NotificationPayloadOptionsRoptionsR
optionsList (20.kentik.api.notify.v0.NotificationPayloadOptionsRoptionsList"?
NotificationPayloadOptions
	modelType (	R	modelType
	lastModel (R	lastModel
	testModel (R	testModel 
testModelID (	RtestModelID
alarmID (RalarmID&
alarmHistoryID (RalarmHistoryID"
mitigationID (RmitigationID,
mitigationEventID (RmitigationEventID
	insightID	 (	R	insightID"7
NotificationPayloadResponse
payload (	Rpayload"?
#CreateNotificationForTestingRequestL
channelVersion (2$.kentik.api.notify.v0.ChannelVersionRchannelVersion
	channelID (R	channelIDX
payloadOptions (20.kentik.api.notify.v0.NotificationPayloadOptionsRpayloadOptionsR
optionsList (20.kentik.api.notify.v0.NotificationPayloadOptionsRoptionsList"&
$CreateNotificationForTestingResponse"
SupportedChannelsRequest"q
SupportedChannelsResponseT
supportedChannels (2&.kentik.api.notify.v0.SupportedChannelRsupportedChannels"?
SupportedChannel 
channelType (	RchannelType.
channelDisplayName (	RchannelDisplayNameJ
requiredFields (2".kentik.api.notify.v0.ChannelFieldRrequiredFields"D
ChannelField
path (	Rpath 
description (	Rdescription"
GetAccessControlConfigRequest"}
GetAccessControlConfigResponse[
accessControlConfig (2).kentik.api.notify.v0.AccessControlConfigRaccessControlConfig"|
SetAccessControlConfigRequest[
accessControlConfig (2).kentik.api.notify.v0.AccessControlConfigRaccessControlConfig"}
SetAccessControlConfigResponse[
accessControlConfig (2).kentik.api.notify.v0.AccessControlConfigRaccessControlConfig"Q
AccessControlConfig:
allow (2$.kentik.api.notify.v0.SelectorConfigRallow*A
ChannelStatus
channelStatusNone 
enabled
disabled*;
ChannelManagedStatus

notManaged 
alertingManaged*[
DeliveryStatus
deliveryUnknown 

deliveryOK
deliveryPending
deliveryBad2?.
Notify?
SearchNotifications*.kentik.api.notify.v0.NotificationsRequest+.kentik.api.notify.v0.NotificationsResponse"`??notify:read????K"'/notify/backend/v0/notifications:search:*Z"/v0/notifications:search:*?
ListNotifications*.kentik.api.notify.v0.NotificationsRequest+.kentik.api.notify.v0.NotificationsResponse"???notify:read????u?/notify/backend/v0/notifications/v/{channelVersion}/{channelID}Z20/v0/notifications/v/{channelVersion}/{channelID}?
StreamNotifications*.kentik.api.notify.v0.NotificationsRequest+.kentik.api.notify.v0.NotificationsResponse"]??notify:read????HF/notify/backend/v0/notifications/v/{channelVersion}/{channelID}/stream0?
CreateNotificationEvent'.kentik.api.notify.v0.NotificationEvent/.kentik.api.notify.v0.NotificationEventResponse"]??notify:write????G"%/notify/backend/v0/notification/event:*Z"/v0/notification/event:*?
SearchDeliveryResults,.kentik.api.notify.v0.DeliveryResultsRequest-.kentik.api.notify.v0.DeliveryResultsResponse"`??notify:read????K"'/notify/backend/v0/notifications:search:*Z"/v0/notifications:search:*?
CreateNotificationChannel).kentik.api.notify.v0.NotificationChannel2.kentik.api.notify.v0.NotificationChannelsResponse"I??notify:write????3"/notify/backend/v0/channels:*Z"/v0/channels:*?
ListNotificationChannels1.kentik.api.notify.v0.NotificationChannelsRequest2.kentik.api.notify.v0.NotificationChannelsResponse"B??notify:read????-/notify/backend/v0/channelsZ/v0/channels?
SearchNotificationChannels1.kentik.api.notify.v0.NotificationChannelsRequest2.kentik.api.notify.v0.NotificationChannelsResponse"V??notify:read????A""/notify/backend/v0/channels:search:*Z"/v0/channels:search:*?
GetNotificationChannel).kentik.api.notify.v0.NotificationChannel1.kentik.api.notify.v0.NotificationChannelResponse"Z??notify:read????E'/notify/backend/v0/channels/{channelID}Z/v0/channels/{channelID}?
UpdateNotificationChannel).kentik.api.notify.v0.NotificationChannel2.kentik.api.notify.v0.NotificationChannelsResponse"a??notify:write????K'/notify/backend/v0/channels/{channelID}:*Z/v0/channels/{channelID}:*?
DeleteNotificationChannel).kentik.api.notify.v0.NotificationChannel2.kentik.api.notify.v0.NotificationChannelsResponse"[??notify:write????E*'/notify/backend/v0/channels/{channelID}Z*/v0/channels/{channelID}?
GetSupportedChannels..kentik.api.notify.v0.SupportedChannelsRequest/.kentik.api.notify.v0.SupportedChannelsResponse"V??notify:read????A%/notify/backend/v0/channels/supportedZ/v0/channels/supported?
CreateUserChannel..kentik.api.notify.v0.CreateUserChannelRequest1.kentik.api.notify.v0.NotificationChannelResponse"S??notify:write????=" /notify/backend/v0/channels/user:*Z"/v0/channels/user:*?
GetUserChannel1.kentik.api.notify.v0.NotificationChannelsRequest1.kentik.api.notify.v0.NotificationChannelResponse"L??notify:read????7 /notify/backend/v0/channels/userZ/v0/channels/user?
SubscribeWithUserChannel&.kentik.api.notify.v0.SubscribeRequest'.kentik.api.notify.v0.SubscribeResponse"g??notify:write????Q"*/notify/backend/v0/channels/user/subscribe:*Z "/v0/channels/user/subscribe:*?
UnsubscribeWithUserChannel&.kentik.api.notify.v0.SubscribeRequest'.kentik.api.notify.v0.SubscribeResponse"k??notify:write????U",/notify/backend/v0/channels/user/unsubscribe:*Z""/v0/channels/user/unsubscribe:*?
DeleteUserChannel).kentik.api.notify.v0.NotificationChannel2.kentik.api.notify.v0.NotificationChannelsResponse"M??notify:write????7* /notify/backend/v0/channels/userZ*/v0/channels/user?
GetLastNotificationAndStatus2.kentik.api.notify.v0.NotificationAndStatusRequest3.kentik.api.notify.v0.NotificationAndStatusResponse"???notify:read????u?/notify/backend/v0/channels/{channelVersion}/{channelID}/statusZ20/v0/channels/{channelVersion}/{channelID}/status?
GetNotificationPayload0.kentik.api.notify.v0.NotificationPayloadRequest1.kentik.api.notify.v0.NotificationPayloadResponse"???notify:read????}"@/notify/backend/v0/channels/{channelVersion}/{channelID}/payload:*Z6"1/v0/channels/{channelVersion}/{channelID}/payload:*?
CreateNotificationForTesting9.kentik.api.notify.v0.CreateNotificationForTestingRequest:.kentik.api.notify.v0.CreateNotificationForTestingResponse"???notify:write????w"=/notify/backend/v0/channels/{channelVersion}/{channelID}/test:*Z3"./v0/channels/{channelVersion}/{channelID}/test:*?
#CreateNotificationForTestingInsight9.kentik.api.notify.v0.CreateNotificationForTestingRequest:.kentik.api.notify.v0.CreateNotificationForTestingResponse"???notify:write?????"E/notify/backend/v0/channels/{channelVersion}/{channelID}/test/insight:*Z;"6/v0/channels/{channelVersion}/{channelID}/test/insight:*?
GetNotificationPayloadInsight0.kentik.api.notify.v0.NotificationPayloadRequest1.kentik.api.notify.v0.NotificationPayloadResponse"???notify:read?????"H/notify/backend/v0/channels/{channelVersion}/{channelID}/payload/insight:*Z>"9/v0/channels/{channelVersion}/{channelID}/payload/insight:*?
ApplyAlertingMapping@.kentik.api.notify.v0.ApplyAlertingManagedChannelsMappingRequest2.kentik.api.notify.v0.NotificationChannelsResponse"k??notify:write????U,/notify/backend/v0/channels/alerting/mapping:*Z"/v0/channels/alerting/mapping:*?
GetAccessControlConfig3.kentik.api.notify.v0.GetAccessControlConfigRequest4.kentik.api.notify.v0.GetAccessControlConfigResponse"0??notify:read????/notify/backend/v0/access?
SetAccessControlConfig3.kentik.api.notify.v0.SetAccessControlConfigRequest4.kentik.api.notify.v0.SetAccessControlConfigResponse"4??notify:write????/notify/backend/v0/access:*?
PopExportedNotificationEvents:.kentik.api.notify.v0.PopExportedNotificationEventsRequest;.kentik.api.notify.v0.PopExportedNotificationEventsResponse"=??admin.notify:read????" /notify/backend/v0/export/events ?Agrpc.api.kentik.com??notifyB!Zkentik/notify/backend/v0;notifyJ?h
  ?

  

 

 6
	
 6
	
  &
	
 !
	
 (
	
 )
	
	 =
	

 5
	
 <
	
 2
	
 5

  ?


 


 ;

 ?;


 >

 ?*>

   

  

  .

  9N

  D

  ?*D

  

	  ?ʼ"

 ",

 "

 ",

 "7L

 #D

 ?*#D

 $+

	 ?ʼ"$+

 /4 deprecated


 /

 /.

 /9?

 /@U

 0D

 ?*0D

 13

	 ?ʼ"13
M
 7C? Note: internally can publish notifications directly to Kafka.


 7

 7/

 7:S

 8E

 ?*8E

 9B

	 ?ʼ"9B

 ER

 E

 E2

 E=T

 FD

 ?*FD

 GQ

	 ?ʼ"GQ

 T`

 T

 T 3

 T>Z

 UE

 ?*UE

 V_

	 ?ʼ"V_

 bl

 b

 b:

 bEa

 cD

 ?*cD

 dk

	 ?ʼ"dk

 nz

 n 

 n!<

 nGc

 oD

 ?*oD

 py

	 ?ʼ"py

 |?

 |

 |0

 |;V

 }D

 ?*}D

 ~?

	 ?ʼ"~?

 	??

 	?

 	? 3

 	?>Z

 	?E

 	?*?E

 	??

	 	?ʼ"??

 
??

 
?

 
? 3

 
?>Z

 
?E

 
?*?E

 
??

	 
?ʼ"??

 ??

 ?

 ?3

 ?>W

 ?D

 ?*?D

 ??

	 ?ʼ"??

 ??

 ?

 ?0

 ?;V

 ?E

 ?*?E

 ??

	 ?ʼ"??

 ??

 ?

 ?0

 ?;V

 ?D

 ?*?D

 ??

	 ?ʼ"??

 ??

 ?

 ?/

 ?:K

 ?E

 ?*?E

 ??

	 ?ʼ"??

 ??

 ? 

 ?!1

 ?<M

 ?E

 ?*?E

 ??

	 ?ʼ"??

 ??

 ?

 ?+

 ?6R

 ?E

 ?*?E

 ??

	 ?ʼ"??

 ??

 ?"

 ?#?

 ?Jg

 ?D

 ?*?D

 ??

	 ?ʼ"??

 ??

 ?

 ?7

 ?B]

 ?D

 ?*?D

 ??

	 ?ʼ"??
x
 ??h immediately but asynchronously send notification described in the enclosed NotificationPayloadRequest.


 ?"

 ?#F

 ?Qu

 ?E

 ?*?E

 ??

	 ?ʼ"??

 ??

 ?)

 ?*M

 ?X|

 ?E

 ?*?E

 ??

	 ?ʼ"??

 ??

 ?#

 ?$>

 ?Id

 ?D

 ?*?D

 ??

	 ?ʼ"??
?
 ??? ApplyAlertingMapping offers a policy+threshold centric way to manage channels.
 It replaces selectors in the target channels by simple policy+threshold matchers.


 ?

 ?E

 ?Pl

 ?E

 ?*?E

 ??

	 ?ʼ"??

 ??

 ?

 ?:

 ?Ec

 ?D

 ?*?D

 ??

	 ?ʼ"??

 ??

 ?

 ?:

 ?Ec

 ?E

 ?*?E

 ??

	 ?ʼ"??

 ??

 ?#

 ?$H

 ?Sx

 ?J

 ?*?J

 ??

	 ?ʼ"??

 ? ?

 ?,
/
  ?! environment/importer identifier


  ?

  ?	

  ?
*
 ? the queue name to pop from


 ?

 ?	

 ?
6
 ?( the maximum amount of events to return


 ?

 ?	

 ?
B
 ?'4 how to wait for new events when the queue is empty


 ?

 ?"

 ?%&

? ?

?(

 ?

 ?

 ?

 ?

?,

?

?'

?*+

? ?

?-

 ?7

 ?


 ?+

 ?,2

 ?56

? ?

?2

 ??

 ?"

  ?

  ?

  ?

  ?

 ?"

 ?

 ?

 ? !

 ?&

 ?

 ?

 ?!

 ?$%
@
 ?"0 optional, used for cross company notifications


 ?

 ?

 ?

 ?1

 ?

 ?#

 ?$,

 ?/0

? ?

?

 ?$

 ?

 ?

 ?"#

?

?

?

?

?

?

?

?

? ?

?

 ?*

 ?


 ?

 ?%

 ?()

? ?

?#
#
 ? include v1 channels


 ?

 ?

 ?

?7 deprecated


?

?

?!"

?#6

?$5
C
?*5 if no user channel is found, return an empty result


?

?%

?()

? ?

?$

 ?,

 ?


 ?

 ?'

 ?*+

? ?

?#

 ?"

 ?

 ?

 ? !

	? ?

	?

	 ?$

	 ?

	 ?

	 ?"#

	?

	?

	?

	?

	?

	?

	?	

	?

	?

	?

	?	

	?

	?

	?

	?

	?

	?-

	?

	?(

	?+,

	?)

	?

	?$

	?'(

	?

	?

	?

	?
>
	?"0 raw json dump of v1 info. don't use generally.


	?

	?	

	?

 ? ?

 ?

  ?

  ?

  ?

 ?

 ?	

 ?

 ?

 ?


 ?

? ? deprecated


?

 ?

 ?

 ?

?

?

?


? ?


?


 ?$


 ?


 ?


 ?"#


?$


?


?


?"#


?&


?


?!


?$%


?"


?


?


? !


? 


?


?


?


?


?


?


?


?7


?


?


?!"


?#6


?$5

? ?

?

 ?0

 ?


 ?

 ?+

 ?./

? ?

?

 ?"

 ?


 ?

 ?

 ? !

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

? ?

?

 ?

 ?

 ?

 ?

?-

?

?(

?+,
?
?:? Sends a batch at a certain time each day.
 There is no associated timezone (and so no accounting for daylight savings).
 The date portion of the timestamp is ignored, only the time matters.


?


?$

?%5

?89

? ?

?

 ?

 ?

 ?	

 ?

?

?

?

?

?

?

?

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

? 

?


?

?

?

?

?

?	

?

?

?

?	

?

?(

?

?#

?&'

?" default 3


?

?

?
2
?0"$ time between attempts. default 30s


?

?+

?./

? ?

?

 ?

 ?

 ?	

 ?

?

?

?

?

?" "tcp" or "udp"


?

?	

?

?

?

?	

?

?

?

?

?

?

?

?

?

? ?

?

 ?$

 ?

 ?

 ?"#

?

?

?

?

?

?

?	

?

? ?

?

 ?&

 ?


 ?

 ?!

 ?$%

? ?

?

 ?

 ?

 ?


 ?

?

?

?

?

?$

?

?

?"#

?

?

?

?

?%

?

? 

?#$

?

?

?	

?

?

?

?

?

?

?

?	

?

?

?

?	

?

	?.

	?

	?(

	?+-


?,


?


?&


?)+

?

?

?	

?

?

?

?

?

? ?

?$

 ?$" default 2


 ?

 ?

 ?"#

?

?

?

?

? ?

?%

 ? 

 ?

 ?

 ?

?.

?


?

?)

?,-

?

?

?

?

? ?

?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?

? ?

?"

 ?$

 ?

 ?

 ?"#

?

?

?

?

?)

?

?$

?'(

?6

?


?%

?&1

?45

? ?

?"
f
 ?"X alarmEvent, mitigationEvent, insightEvent, mitigationPlatformEvent, genericEvent, etc.


 ?

 ?	

 ?
J
?"< instead of using the id below, grab the most recent model.


?

?

?
C
?"5 instead of using the id below, use a testing model.


?

?

?

?

?

?	

?
5
?' IDs specified according to modelType:


?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?	

?

? ?

?#

 ?

 ?

 ?	

 ?

? ?

?+

 ?$

 ?

 ?

 ?"#

?

?

?

?

?0

?

?+

?./

?6

?


?%

?&1

?45

? ?

?,

? ?

? 

? ?

?!

 ?2

 ?


 ?

 ?-

 ?01

? ?

?

 ?

 ?

 ?	

 ?

? 

?

?	

?

?+

?


?

?&

?)*

? ?

?
?
 ?~ A path is within a NotificationChannel's ChannelConfig,
 for example "sendingConfig.username" or "sendingConfig.identifier".


 ?

 ?	

 ?

?" for humans


?

?	

?

 ? ?

 ?%

!? ?

!?&

! ?.

! ?

! ?)

! ?,-

"? ?

"?%

" ?.

" ?

" ?)

" ?,-

#? ?

#?&

# ?.

# ?

# ?)

# ?,-

$? ?

$?

$ ?

$ ?

$ ?

$ ?bproto3??  
?1
$kentik/site/v202106alpha1/site.protokentik.site.v202106alpha1google/api/annotations.protogoogle/api/client.protogoogle/type/latlng.proto google/type/postal_address.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto"?
SiteIpClassification7
infrastructure_networks (	RinfrastructureNetworks0
user_access_networks (	RuserAccessNetworks
	other_ips (	RotherIps"=
SubLayer
name (	Rname

device_ids (	R	deviceIds"K
LayerB

sub_layers (2#.kentik.site.v202106alpha1.SubLayerR	subLayers"?
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
DeleteSiteResponse*?
SiteType
SITE_TYPE_UNSPECIFIED 
SITE_TYPE_DATA_CENTER
SITE_TYPE_CLOUD
SITE_TYPE_BRANCH
SITE_TYPE_CONNECTIVITY
SITE_TYPE_CUSTOMER
SITE_TYPE_OTHER2?	
SiteService?
ListSite*.kentik.site.v202106alpha1.ListSiteRequest+.kentik.site.v202106alpha1.ListSiteResponse"h?A1List sites.Returns a list of sites.*SiteList??admin.site:read????/site/v202106alpha1/sites?
GetSite).kentik.site.v202106alpha1.GetSiteRequest*.kentik.site.v202106alpha1.GetSiteResponse"??AKGet a site.3Returns information about a site specified with ID.*SiteGet??admin.site:read???? /site/v202106alpha1/sites/{id}?

CreateSite,.kentik.site.v202106alpha1.CreateSiteRequest-.kentik.site.v202106alpha1.CreateSiteResponse"??AJCreate a site.,Create a site from request. returns created.*
SiteCreate??admin.site:write????"/site/v202106alpha1/sites:*?

UpdateSite,.kentik.site.v202106alpha1.UpdateSiteRequest-.kentik.site.v202106alpha1.UpdateSiteResponse"??ATUpdate a site.6Replaces the entire site attributes specified with id.*
SiteUpdate??admin.site:write????(#/site/v202106alpha1/sites/{site.id}:*?

DeleteSite,.kentik.site.v202106alpha1.DeleteSiteRequest-.kentik.site.v202106alpha1.DeleteSiteResponse"~?AADelete a site.#Deletes the site specified with id.*
SiteDelete??admin.site:write???? */site/v202106alpha1/sites/{id}$?Agrpc.api.kentik.com??
admin.siteB?ZBgithub.com/kentik/api-schema/gen/go/kentik/site/v202106alpha1;site?A?2
Site API"
Kentik API Engineering2202106alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ?
  ?

  

 "

 Y
	
 Y
	
  &
	
 !
	
 "
	
 *
	
	 8
	

 5
	
 7

? 7


 9 A


 9

  :

  :

  :

 ;

 ;

 ;

 <

 <

 <

 =

 =

 =

 >

 >

 >

 ?

 ?

 ?

 @

 @

 @
$
 D H Site IP Classification



 D

  E.

  E


  E

  E)

  E,-

 F+

 F


 F

 F&

 F)*

 G 

 G


 G

 G

 G


J M


J

 K

 K

 K	

 K

L!

L


L

L

L 


O Q


O

 P#

 P


 P

 P

 P!"


S \


S

 T

 T

 T	

 T


	U

	 U

	 U

V

V

V	

V

W$

W

W

W"#

X(

X

X#

X&'

Y

Y


Y

Y

Z*

Z

Z%

Z()

["

[


[

[

[ !
	
^ 


^


_ b


_

 `

 `


 `

 `

 `

a

a

a	

a


d f


d

 e

 e

 e	

 e


g i


g

 h

 h

 h

 h


k m


k

 l

 l

 l

 l


	n p


	n

	 o

	 o

	 o

	 o



r t



r


 s


 s


 s


 s


u w


u

 v

 v

 v

 v


y {


y

 z

 z

 z	

 z
	
| 


|

  ?


 

 ?;

 ??;

 ?B

 ?*?B

  ??

  ?

  ?

  ?)9

  ?H

  ?*?H

  ??

	  ?ʼ"??

  ??

  ???

 ??

 ?

 ?

 ?'6

 ?H

 ?*?H

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?"

 ?-?

 ?I

 ?*?I

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?"

 ?-?

 ?I

 ?*?I

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?"

 ?-?

 ?I

 ?*?I

 ??

	 ?ʼ"??

 ??

 ???bproto3??  
??
-kentik/synthetics/backend/v1/synthetics.proto	syntheticgoogle/api/annotations.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto"?
Status
ok (H Rok+
err (2.synthetic.Status.ErrorH RerrG
Error
status (Rstatus
msg (	Rmsg
retry (RretryB
status"?
AuthRequest
agent (	Ragent
	signature (	R	signature
	timestamp (	R	timestamp
version (	Rversion

company_id (R	companyId
name (	Rname
global (Rglobal
os (	Ros
bind	 (	Rbind
site
 (Rsite3

agent_impl (2.synthetic.AgentImplR	agentImpl"?
	AuthReply-
auth (2.synthetic.AuthReply.AuthRauth)
status (2.synthetic.StatusRstatus
session (	Rsession+
family (2.synthetic.IPFamilyRfamily
agent_id (RagentId
	challenge (	R	challenge"+
Auth
OK 
WAIT
DENY
ERR"4
Kentik
email (	Remail
token (	Rtoken"K
Device
id (Rid1
customs (2.synthetic.CustomColumnRcustoms"?
CustomColumn
name (	Rname
id (Rid0
type (2.synthetic.CustomColumn.TypeRtype"4
Type

UINT32 

UINT64

STRING
ADDR">
TasksRequest
session (	Rsession
since (Rsince"

TasksReply(
groups (2.synthetic.GroupRgroups
	timestamp (R	timestamp)
status (2.synthetic.StatusRstatus"?
Group

company_id (R	companyId)
device (2.synthetic.DeviceRdevice)
kentik (2.synthetic.KentikRkentik%
tasks (2.synthetic.TaskRtasks"?
Task
id (Rid+
state (2.synthetic.Task.StateRstate

company_id (R	companyId
user_id (RuserId
	device_id (RdeviceId
status (	Rstatus
test_id (RtestId+
family (2.synthetic.IPFamilyRfamily3
ping	 (2.synthetic.PingTaskDefinitionH Rping@

traceroute
 (2.synthetic.TraceTaskDefinitionH R
traceroute3
http (2.synthetic.HTTPTaskDefinitionH Rhttp6
knock (2.synthetic.KnockTaskDefinitionH Rknock0
dns (2.synthetic.DNSTaskDefinitionH Rdns6
shake (2.synthetic.ShakeTaskDefinitionH Rshake@
http_timing (2.synthetic.HTTPTaskDefinitionH R
httpTiming<
	page_load (2.synthetic.HTTPTaskDefinitionH RpageLoadA
transaction (2.synthetic.HTTPTaskDefinitionH Rtransaction7
dns_sec (2.synthetic.DNSTaskDefinitionH RdnsSec".
State
CREATED 
UPDATED
DELETEDB

definition"?
PingTaskDefinition
target (	Rtarget
period (Rperiod
expiry (Rexpiry
count (Rcount
delay (Rdelay"?
TraceTaskDefinition
target (	Rtarget
period (Rperiod
expiry (Rexpiry
limit (Rlimit
protocol (	Rprotocol
port (Rport
count (Rcount
delay (Rdelay"?
HTTPTaskDefinition
target (	Rtarget
period (Rperiod
expiry (Rexpiry
method (	Rmethod
return_code (R
returnCodeD
headers (2*.synthetic.HTTPTaskDefinition.HeadersEntryRheaders
body (	Rbody*
ignore_tls_errors (RignoreTlsErrorsT
css_selectors	 (2/.synthetic.HTTPTaskDefinition.CssSelectorsEntryRcssSelectors

trx_script
 (	R	trxScript:
HeadersEntry
key (	Rkey
value (	Rvalue:8?
CssSelectorsEntry
key (	Rkey
value (	Rvalue:8"?
KnockTaskDefinition
target (	Rtarget
period (Rperiod
expiry (Rexpiry
count (Rcount
port (Rport
delay (Rdelay"?
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
expiry (Rexpiry"Z
StatusRequest
session (	Rsession/
report (2.synthetic.StatusReportRreport"Q
StatusReport+
tasks (2.synthetic.TaskStatusRtasks
addrs (	Raddrs"?

TaskStatus
started (Rstarted
running (Rrunning
exited (Rexited
failed (Rfailed
active (Ractive"8
StatusReply)
status (2.synthetic.StatusRstatus")
DeauthRequest
session (	Rsession"8
DeauthReply)
status (2.synthetic.StatusRstatus"?
SearchRequest

company_id (R	companyId
limit (Rlimit
offset (Roffset
select (	Rselect&
where (2.synthetic.WhereRwhere-
order_by (2.synthetic.OrderByRorderBy"i
Where
	connector (	R	connectorB
criteria_groups (2.synthetic.CriteriaGroupsRcriteriaGroups"?
OrderBy
fields (	Rfields
	direction (	R	direction"_
CriteriaGroups
	connector (	R	connector/
criteria (2.synthetic.CriteriaRcriteria"R
Criteria
field (	Rfield
operator (	Roperator
value (	Rvalue"?
SearchReply%
tasks (2.synthetic.TaskRtasks(
agents (2.synthetic.AgentRagents%
tests (2.synthetic.TestRtests)
status (2.synthetic.StatusRstatus">
UpdateAgentRequest(
agents (2.synthetic.AgentRagents"O
UpdateAgentReply)
status (2.synthetic.StatusRstatus
num (Rnum":
UpdateTaskRequest%
tasks (2.synthetic.TaskRtasks"N
UpdateTaskReply)
status (2.synthetic.StatusRstatus
num (Rnum"?
Agent
id (Rid

agent_name (	R	agentName!
agent_status (	RagentStatus

company_id (R	companyId
agent_alias (	R
agentAlias

agent_type (	R	agentType
os (	Ros
ip (	Rip
lat	 (Rlat
long
 (Rlong*
agent_last_authed (RagentLastAuthed+
family (2.synthetic.IPFamilyRfamily
asn (Rasn"
agent_site_id (RagentSiteId
version (	Rversion
	challenge (	R	challenge
city (	Rcity
region (	Rregion
country (	Rcountry
local_ip (	RlocalIp3

agent_impl (2.synthetic.AgentImplR	agentImpl"a
AgentTaskAssignRequest
agent_id (RagentId
action (	Raction
tasks (Rtasks"A
AgentTaskAssignReply)
status (2.synthetic.StatusRstatus":
UpdateTestRequest%
tests (2.synthetic.TestRtests"?
Test
id (Rid
	test_type (	RtestType5
hostname (2.synthetic.HostnameTestH Rhostname#
ip (2.synthetic.IpTestH Rip,
agent (2.synthetic.AgentTestH Ragent)
flow (2.synthetic.FlowTestH Rflow)
site (2.synthetic.SiteTestH Rsite&
tag (2.synthetic.TagTestH Rtag

company_id	 (R	companyId
user_id
 (RuserId
	device_id (RdeviceId
status (	Rstatus-
config (2.synthetic.TestConfigRconfigB

definition"h

PingConfig
period (Rperiod
count (Rcount
expiry (Rexpiry
delay (Rdelay"?
TraceConfig
period (Rperiod
expiry (Rexpiry
limit (Rlimit
port (Rport
protocol (	Rprotocol
count (Rcount
delay (Rdelay"?

HTTPConfig
period (Rperiod
expiry (Rexpiry
method (	Rmethod<
headers (2".synthetic.HTTPConfig.HeadersEntryRheaders
body (	Rbody*
ignore_tls_errors (RignoreTlsErrorsL
css_selectors (2'.synthetic.HTTPConfig.CssSelectorsEntryRcssSelectors

trx_script (	R	trxScript:
HeadersEntry
key (	Rkey
value (	Rvalue:8?
CssSelectorsEntry
key (	Rkey
value (	Rvalue:8"?

TestConfig
agents (Ragents
period (Rperiod
count (Rcount
expiry (Rexpiry
limit (Rlimit
tasks (	Rtasks
name (	Rname
	direction (	R	direction%
inet_direction	 (	RinetDirection 
use_local_ip
 (R
useLocalIp

reciprocal (R
reciprocal!
rollup_level (RrollupLevel
protocol (	Rprotocol
port (Rport
method (	Rmethod
return_code (R
returnCode
type (	Rtype
	resolvers (	R	resolvers+
family (2.synthetic.IPFamilyRfamily)
ping (2.synthetic.PingConfigRping,
trace (2.synthetic.TraceConfigRtrace
	max_tasks (RmaxTasks
max_targets (R
maxTargets!
high_density (RhighDensity)
http (2.synthetic.HTTPConfigRhttp"&
HostnameTest
target (	Rtarget" 
IpTest
target (	Rtarget"#
	AgentTest
target (	Rtarget"?
FlowTest
target (	RtargetC
target_refresh_interval_millis (RtargetRefreshIntervalMillis
	max_tasks (RmaxTasks
type (	Rtype""
SiteTest
target (	Rtarget"!
TagTest
target (	Rtarget"N
UpdateTestReply)
status (2.synthetic.StatusRstatus
num (Rnum"K
SetTasksFromTestsRequest
ids (Rids

company_id (R	companyId"`
SetTasksFromTestsReply)
status (2.synthetic.StatusRstatus
	num_tasks (RnumTasks"Q
DropAgentCacheRequest
agent_id (RagentId

agent_name (	R	agentName"@
DropAgentCacheReply)
status (2.synthetic.StatusRstatus"?
GetHealthForTestsRequest
ids (Rids

company_id (R	companyId

start_time (R	startTime
end_time (RendTime
	agent_ids (RagentIds
task_ids (RtaskIds"r
GetHealthForTestsReply)
status (2.synthetic.StatusRstatus-
health (2.synthetic.TestHealthRhealth"?

TestHealth
test_id (RtestId+
tasks (2.synthetic.TaskHealthRtasks8
overall_health (2.synthetic.HealthRoverallHealth.
	health_ts (2.synthetic.HealthRhealthTsC

health_agg (2$.synthetic.TestHealth.HealthAggEntryR	healthAggY
HealthAggEntry
key (	Rkey1
value (2.synthetic.AggregatedHealthRvalue:8"?

TaskHealth#
task (2.synthetic.TaskRtask.
agents (2.synthetic.AgentHealthRagents8
overall_health (2.synthetic.HealthRoverallHealth"?
AgentHealth&
agent (2.synthetic.AgentRagent/
health (2.synthetic.HealthMomentRhealth8
overall_health (2.synthetic.HealthRoverallHealth"s
AggregatedHealth.
agents (2.synthetic.AgentHealthRagents/
health (2.synthetic.HealthMomentRhealth"?
HealthMoment
time (Rtime
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
packet_loss_health (	RpacketLossHealth8
overall_health (2.synthetic.HealthRoverallHealth

avg_jitter (R	avgJitter,
rolling_avg_jitter (RrollingAvgJitter,
rolling_std_jitter (RrollingStdJitter#
jitter_health (	RjitterHealth
data (	Rdata
size (Rsize
status (Rstatus
	task_type (	RtaskTypeN
other_healths (2).synthetic.HealthMoment.OtherHealthsEntryRotherHealths?
OtherHealthsEntry
key (	Rkey
value (	Rvalue:8"4
Health
health (	Rhealth
time (Rtime"?
GetTraceForTestRequest
id (Rid

company_id (R	companyId

start_time (R	startTime
end_time (RendTime
	agent_ids (RagentIds"i
GetTraceForTestReply)
status (2.synthetic.StatusRstatus&
trace (2.synthetic.TraceRtrace"\
Trace'
hops (2.synthetic.TraceHopRhops*
links (2.synthetic.TraceLinkRlinks"?
TraceHop
id (Rid
hop_name (	RhopName
	hop_depth (RhopDepth
asn (Rasn.
	in_health (2.synthetic.HealthRinHealth0

out_health (2.synthetic.HealthR	outHealth"?
	TraceLink

src_hop_id (RsrcHopId

dst_hop_id (RdstHopId8
overall_health (2.synthetic.HealthRoverallHealth/
health (2.synthetic.HealthMomentRhealth"V
GetHealthOfAgentsRequest

company_id (R	companyId
	agent_ids (RagentIds"?
GetHealthOfAgentsReply)
status (2.synthetic.StatusRstatus4
agents (2.synthetic.AgentHealthStatusRagents
good (Rgood
warn (Rwarn
crit (Rcrit"?
AgentHealthStatus
	last_seen (RlastSeen-
status (2.synthetic.TaskStatusRstatus
health (	Rhealth&
agent (2.synthetic.AgentRagent"
last_seen_str (	RlastSeenStr"?
GetErrorsForTestsRequest
ids (Rids

company_id (R	companyId

start_time (R	startTime
end_time (RendTime
	agent_ids (RagentIds
task_ids (RtaskIds"q
GetErrorsForTestsReply)
status (2.synthetic.StatusRstatus,
errors (2.synthetic.TestErrorRerrors"R
	TestError
test_id (RtestId,
errors (2.synthetic.TaskErrorRerrors"_
	TaskError-
errors (2.synthetic.AgentErrorRerrors#
task (2.synthetic.TaskRtask"?

AgentError&
agent (2.synthetic.AgentRagent0
errors (2.synthetic.AgentErrorSetRerrors6
timeouts (2.synthetic.AgentTimeoutSetRtimeouts"]
AgentErrorSet
	last_time (RlastTime
msg (	Rmsg

num_errors (R	numErrors"Q
AgentTimeoutSet
	last_time (RlastTime!
num_timeouts (RnumTimeouts*
	AgentImpl
RUST 
NODE*$
IPFamily
V4 
V6
DUAL2?
SyntheticAgentW
Auth.synthetic.AuthRequest.synthetic.AuthReply"!????"/api/agent/v1/syn/auth:*[
Tasks.synthetic.TasksRequest.synthetic.TasksReply""????"/api/agent/v1/syn/tasks:*_
Status.synthetic.StatusRequest.synthetic.StatusReply"#????"/api/agent/v1/syn/status:*_
Deauth.synthetic.DeauthRequest.synthetic.DeauthReply"#????"/api/agent/v1/syn/deauth:*^
Search.synthetic.SearchRequest.synthetic.SearchReply""????"/v1/syn/internal/search:*m
UpdateAgent.synthetic.UpdateAgentRequest.synthetic.UpdateAgentReply""????/v1/syn/internal/agents:*i

UpdateTask.synthetic.UpdateTaskRequest.synthetic.UpdateTaskReply"!????/v1/syn/internal/tasks:*?
AgentTaskAssign!.synthetic.AgentTaskAssignRequest.synthetic.AgentTaskAssignReply"0????*%/v1/syn/internal/agentTask/{agent_id}:*i

UpdateTest.synthetic.UpdateTestRequest.synthetic.UpdateTestReply"!????/v1/syn/internal/tests:*?
SetTasksFromTests#.synthetic.SetTasksFromTestsRequest!.synthetic.SetTasksFromTestsReply"$????/v1/syn/internal/settasks:*?
GetHealthForTests#.synthetic.GetHealthForTestsRequest!.synthetic.GetHealthForTestsReply"(????""/v1/syn/internal/health/tasks:*
GetTraceForTest!.synthetic.GetTraceForTestRequest.synthetic.GetTraceForTestReply"(????""/v1/syn/internal/health/trace:*
DropAgentCache .synthetic.DropAgentCacheRequest.synthetic.DropAgentCacheReply"+????%" /v1/syn/internal/dropcache/agent:*?
GetHealthOfAgents#.synthetic.GetHealthOfAgentsRequest!.synthetic.GetHealthOfAgentsReply")????#"/v1/syn/internal/health/agents:*?
GetErrorsForTests#.synthetic.GetErrorsForTestsRequest!.synthetic.GetErrorsForTestsReply")????#"/v1/syn/internal/health/errors:*??B+?A(&
Kentik Synthetics Backend API20.0.1J??
	 ?
?
	 ? syn-back (synthetics backend) proto definition

 This is NOT a supported product API.

 Kentik agents use this API to interact with the platform and push data, so parts of this are internet-facing.
 Node and api use this API to get data from the backend, so parts of this are internal only.

 AS OF 2020-02-01 THIS PROTO DEFINITION LIVES IN the proto/ repo, THIS IS A COPY FOR USE IN api-node.


 
	
  &
	
 8
	
 5
	
 

? 


  v


 


 <

 ?*<

  !

  


  

  "+

   

	  ?ʼ" 

 "'

 "

 "

 "$.

 #&

	 ?ʼ"#&

 (-

 (

 (

 (&1

 ),

	 ?ʼ"),

 .3

 .

 .

 .&1

 /2

	 ?ʼ"/2

 49

 4

 4

 4&1

 58

	 ?ʼ"58

 :?

 :

 :%

 :0@

 ;>

	 ?ʼ";>

 @E

 @

 @#

 @.=

 AD

	 ?ʼ"AD

 FK

 F

 F-

 F8L

 GJ

	 ?ʼ"GJ

 LQ

 L

 L#

 L.=

 MP

	 ?ʼ"MP

 	RW

 	R

 	R1

 	R<R

 	SV

	 	?ʼ"SV

 
X]

 
X

 
X1

 
X<R

 
Y\

	 
?ʼ"Y\

 ^c

 ^

 ^-

 ^8L

 _b

	 ?ʼ"_b

 di

 d

 d+

 d6I

 eh

	 ?ʼ"eh

 jo

 j

 j1

 j<R

 kn

	 ?ʼ"kn

 pu

 p

 p1

 p<R

 qt

	 ?ʼ"qt

 x ?


 x

  y}

  y

   z

   z

   z

   z

  {

  {

  {

  {

  |

  |

  |

  |

  ?

  


  ?

  ?

  ?

  ?

 ?

 ?

 ?

 ?

 ? ?

 ?

  ?

  ?

  ?

 ?" ALGOL = 2;


 ?

 ?

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

	?

	?

	?

	?


?"


?


?


?!

? ?

?

 ?

 ?

 ?	


?

?

?	


?

?

?	


? ?

?

 ??	

 ?

  ?

  ?

  ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

? ?

?

 ?

 ?

 ?

 ?

?*

?

?

?%

?()

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

 ??	

 ?

  ?

  ?

  ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

 ?

?

?

?

?

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

? ?

?

 ?"

 ?

 ?

 ?

 ? !

?"

?

?

? !

?"

?

?

? !

? ?

?

 ? 

 ?

 ?

 ?

? 

?

?

?

? 

?

?

?

? 

?

?

?

?

	? ?

	?

	 ?

	 ?

	 ?

	 ?

	 ??	

	 ?

	  ?

	  ?

	  ?

	 ?

	 ?

	 ?

	 ?

	 ?

	 ?

	?

	?

	?

	?

	? 

	?

	?

	?

	? 

	?

	?

	?

	? 

	?

	?

	?

	? 

	?

	?

	?

	? 

	?

	?

	?

	? 

	?

	?

	?

	 ??	

	 ?

	?1

	? 

	?!%

	?/0

		?2

		?!

		?",

		?/1

	
?2

	
? 

	
?!%

	
?/1

	?2

	?!

	?"'

	?/1

	?2

	?

	? #

	?/1

	?2

	?!

	?"'

	?/1

	?2

	? 

	?!,

	?/1

	?2

	? 

	?!*

	?/1

	?2

	? 

	?!,

	?/1

	?-

	?

	? '

	?*,


? ?


?


 ?


 ?


 ?


 ?


?


?


?


?


?


?


?


?


?


?


?


?


?


?


?


?

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

? ?

?

 ? 

 ?

 ?

 ?

? 

?

?

?

? 

?

?

?

? 

?

?

?

? 

?

?

?

?(

?

?#

?&'

? 

?

?

?

?#

?

?

?!"

?.

?

?)

?,-

	?

	?

	?

	?

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

? ?

?

 ?%

 ?

 ?

 ?#$

?%

?

?

?#$

?%

?

?

?#$

?%

?

?

?#$

?%

?

?

?#$

?%

?

?

?#$

?%

?

?

?#$

? ?

?

 ?%

 ?

 ?

 ?#$

?%

?

?

?#$

?%

?

?

?#$

?%

?

?

?#$

? ?

?

 ?

 ?


 ?

 ?

?

?

?

?

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

?

? ?

?

 ?

 ?


 ?

 ?

?

?


?

?

?

?


?

?

?

?


?

?

?

?

?

?

?

? ?

?

 ?

 ?

 ?

 ?

? ?

?

 ?

 ?


 ?

 ?

? ?

?

 ?

 ?


 ?

 ?

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

? ?

?

 ?)

 ?

 ?

 ?'(

?)

?

?$

?'(

? ?

?

 ?!

 ?

 ?

 ?

 ? 

?!

?

?

? 

? ?

?

 ?&

 ?

 ?

 ?$%

?&

?

?

?!

?$%

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

? ?

?

 ?"

 ?

 ?

 ?

 ? !

?"

?

?

?

? !

?"

?

?

?

? !

?"

?

?

? !

? ?

?

 ?"

 ?

 ?

 ?

 ? !

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

? ?

?

 ? 

 ?

 ?

 ?

 ?

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

 ? ?

 ?

  ?%

  ?

  ?

  ?#$

 ?%

 ?

 ?

 ?#$

 ?%

 ?

 ?

 ?#$

 ?%

 ?

 ?

 ?#$

 ?%

 ?

 ?

 ?#$

 ?%

 ?

 ?

 ?#$

 ?%

 ?

 ?

 ?#$

 ?%

 ?

 ?

 ?#$

 ?%

 ?

 ?

 ?#$

 	?&

 	?

 	?

 	?#%

 
?&

 
?

 
? 

 
?#%

 ?&

 ?

 ?

 ?#%

 ?&

 ?

 ?

 ?#%

 ?&

 ?

 ?

 ?#%

 ?&

 ?

 ?

 ?#%

 ?&

 ?

 ?

 ?#%

 ?&

 ?

 ?

 ?#%

 ?&

 ?

 ?

 ?#%

 ?&

 ?

 ?

 ?#%

 ?&

 ?

 ?

 ?#%

 ?&

 ?

 ?

 ?#%

!? ?

!?

! ?"

! ?

! ?

! ? !

!?"

!?

!?

!? !

!?"

!?

!?

!?

!? !

"? ?

"?

" ?

" ?

" ?

" ?

#? ?

#?

# ? 

# ?

# ?

# ?

# ?

$? ?

$?

$ ?

$ ?

$ ?

$ ?

$?

$?

$?

$?

$ ??	

$ ?

$?%

$?

$? 

$?#$

$?%

$?

$?

$?#$

$?%

$?

$?

$?#$

$?%

$?

$?

$?#$

$?%

$?

$?

$?#$

$?%

$?

$?

$?#$

$?#

$?

$?

$?!"

$	?$

$	?

$	?

$	?!#

$
?$

$
?

$
?

$
?!#

$?$

$?

$?

$?!#

$?$

$?

$?

$?!#

%? ?

%?

% ?&

% ?

% ?

% ?$%

%?&

%?

%?

%?$%

%?&

%?

%?

%?$%

%?&

%?

%?

%?$%

&? ?

&?

& ?&

& ?

& ?

& ?$%

&?&

&?

&?

&?$%

&?&

&?

&?

&?$%

&?&

&?

&?

&?$%

&?&

&?

&?

&?$%

&?&

&?

&?

&?$%

&?&

&?

&?

&?$%

'? ?

'?

' ?&

' ?

' ?

' ?$%

'?&

'?

'?

'?$%

'?&

'?

'?

'?$%

'?(

'?

'?#

'?&'

'?&

'?

'?

'?$%

'?&

'?

'?

'?$%

'?.

'?

'?)

'?,-

'?

'?

'?

'?

(? ?

(?

( ?&

( ?

( ?

( ?

( ?$%

(?&

(?

(?

(?$%

(?&

(?

(?

(?$%

(?&

(?

(?

(?$%

(?&

(?

(?

(?$%

(?&" Task types.


(?

(?

(?

(?$%

(?&

(?

(?

(?$%

(?&

(?

(?

(?$%

(?&

(?

(?

(?$%

(	?'

(	?

(	?

(	?$&

(
?'

(
?

(
?

(
?$&

(?'

(?

(?

(?$&

(?'

(?

(?

(?$&

(?'

(?

(?

(?$&

(?'

(?

(?

(?$&

(?'

(?

(?

(?$&

(?'

(?

(?

(?$&

(?'

(?

(?

(?!

(?$&

(?'

(?

(?

(?$&

(?'

(?

(?

(?$&

(?'

(?

(?

(?$&

(?'

(?

(?

(?$&

(?'

(?

(?

(?$&

(?'

(?

(?

(?$&

(?'

(?

(?

(?$&

)? ?

)?

) ?

) ?

) ?

) ?

*? ?

*?

* ?

* ?

* ?

* ?

+? ?

+?

+ ?

+ ?

+ ?

+ ?

,? ?

,?

, ?2

, ?

, ?

, ?01
,
,?2" How often to generate tasks.


,?

,?-

,?01

,?2" Used for top N.


,?

,?

,?01
F
,?2"8 What type of flow to look at -- asn, cdn, country, ...


,?

,?

,?01

-? ?

-?

- ?

- ?

- ?

- ?

.? ?

.?

. ?

. ?

. ?

. ?

/? ?

/?

/ ?

/ ?

/ ?

/ ?

/?

/?

/?

/?

0? ?

0? 
G
0 ?!"9 All we need is a list of ids of the tests to configure.


0 ?

0 ?

0 ?

0 ? 
"
0?" Bound per company.


0?

0?

0?

1? ?

1?

1 ?

1 ?

1 ?

1 ?

1?

1?

1?

1?

2? ?

2?
!
2 ?" Agent id to drop.


2 ?

2 ?

2 ?

2?

2?

2?

2?

3? ?

3?

3 ?

3 ?

3 ?

3 ?

4? ?

4? 
K
4 ?!"= All we need is a list of ids of the tests to get heath for.


4 ?

4 ?

4 ?

4 ? 
"
4?" Bound per company.


4?

4?

4?

4?

4?

4?

4?

4?

4?

4?

4?
9
4?&"+ Allow looking at only a subset of agents.


4?

4?

4?!

4?$%
W
4?%"I Allow looking at only a subset of tasks -- this lets you limit targets.


4?

4?

4? 

4?#$

5? ?

5?

5 ?'

5 ?

5 ?

5 ?%&

5?'

5?

5?

5?"

5?%&

6? ?

6?

6 ?)

6 ?

6 ?

6 ?'(

6?)

6?

6?

6?!

6?'(

6?)

6?

6?

6?'(

6?)

6?

6?

6?!

6?'(

6?6

6?%

6?&0

6?45

7? ?

7?

7 ?)

7 ?

7 ?

7 ?'(

7?)

7?

7?

7?#

7?'(

7?)

7?

7?

7?'(

8? ?

8?

8 ?)

8 ?

8 ?

8 ?'(

8?)

8?

8?

8?$

8?'(

8?)

8?

8?

8?'(

9? ?

9?

9 ?)

9 ?

9 ?

9 ?#

9 ?'(

9?)

9?

9?

9?$

9?'(

:? ?

:?

: ?0

: ?

: ?

: ?./

:?0

:?

:?

:?./

:?0

:?

:?

:?./

:?0

:?

:?

:?./

:?0

:?

:?

:?./

:?0

:?

:?#

:?./

:?0

:?

:?"

:?./

:?0

:?

:?%

:?./

:?0

:?

:?+

:?./

:	?1

:	?

:	?

:	?.0

:
?1

:
?

:
?!

:
?.0

:?1

:?

:?

:?.0

:?1

:?

:?

:?.0

:?1

:?

:?!

:?.0

:?1

:?

:?!

:?.0

:?1

:?

:?

:?.0

:?1

:?

:?

:?.0

:?1

:?

:?

:?.0

:?1

:?

:?

:?.0

:?1

:?

:?

:?.0

:?1

:?

:?)

:?.0

;? ?

;?

; ?

; ?

; ?

; ?

;?

;?

;?

;?

<? ?

<?
)
< ?(" This is for a single test


< ?

< ?

< ?&'
"
<?(" Bound per company.


<?

<?

<?&'

<?(

<?

<?

<?&'

<?(

<?

<?

<?&'
9
<?("+ Allow looking at only a subset of agents.


<?

<?

<?!

<?&'

=? ?

=?

= ?

= ?

= ?

= ?

=?

=?

=?

=?

>? ?

>?

> ?%

> ?

> ?

> ?

> ?#$

>?%

>?

>?

>? 

>?#$

?? ?

??
5
? ? "' an ID to use to ref this hop in links


? ?

? ?

? ?
R
?? "D this is either the device_name if we know it, or the IP of the hop


??

??

??
N
?? "@ 0 for agents, 100 for last hop regardless of intermediate hops


??

??

??
/
?? "! this is an augmentation: ip2asn


??

??

??
/
?? "! a rollup of inbound link health


??

??

??
0
?? "" a rollup of outbound link health


??

??

??

@? ?

@?
!
@ ?," id of the src hop


@ ?

@ ?

@ ?*+
!
@?," id of the dst hop


@?

@?

@?*+
.
@?,"  rollup of health moment health


@?

@?

@?*+
X
@?,"J src_ip is optional if we have it from topology; dst_ip is the dst_hop ip


@?

@?

@?$

@?*+

A? ?

A? 
+
A ?(" look up agents per company.


A ?

A ?

A ?&'
9
A?("+ Allow looking at only a subset of agents.


A?

A?

A?!

A?&'

B? ?

B?

B ?.

B ?

B ?

B ?,-

B?.

B?

B?"

B?#)

B?,-

B?.

B?

B?

B?,-

B?.

B?

B?

B?,-

B?.

B?

B?

B?,-

C? ?

C?

C ?	%

C ?	

C ?

C ?#$

C?	%

C?	

C?

C?#$

C?	%

C?	

C?

C?#$

C?	%

C?	

C?

C?#$

C?	%

C?	

C?

C?#$

D? ?

D? 
K
D ?!"= All we need is a list of ids of the tests to get heath for.


D ?

D ?

D ?

D ? 
"
D?" Bound per company.


D?

D?

D?

D?

D?

D?

D?

D?

D?

D?

D?
9
D?&"+ Allow looking at only a subset of agents.


D?

D?

D?!

D?$%
W
D?%"I Allow looking at only a subset of tasks -- this lets you limit targets.


D?

D?

D? 

D?#$

E? ?

E?

E ?'

E ?

E ?

E ?%&

E?'

E?

E?

E?!

E?%&

F? ?

F?

F ?'

F ?

F ?

F ?%&

F?'

F?

F?

F?!

F?%&

G? ?

G?

G ?,

G ?

G ?

G ?"

G ?*+

G?,

G?

G?

G?*+

H? ?

H?

H ?	0

H ?	

H ?

H ?./

H?	0

H?	

H?

H?$*

H?./

H?	0

H?	

H?!

H?"*

H?./

I? ?

I?

I ?	%

I ?	

I ?

I ?#$

I?	%

I?	

I?

I?#$

I?	%

I?	

I?

I?#$

J? ?

J?

J ?	%

J ?	

J ?

J ?#$

J?	%

J?	

J?

J?#$bproto3??  
??
/kentik/synthetics/v202101beta1/synthetics.protokentik.synthetics.v202101beta1google/api/annotations.protogoogle/api/client.proto google/protobuf/field_mask.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto"P
Health
health (	Rhealth.
time (2.google.protobuf.TimestampRtime";
AgentTaskConfig
id (Rid
targets (	Rtargets"?

TestHealth
test_id (	RtestId@
tasks (2*.kentik.synthetics.v202101beta1.TaskHealthRtasksM
overall_health (2&.kentik.synthetics.v202101beta1.HealthRoverallHealthC
	health_ts (2&.kentik.synthetics.v202101beta1.HealthRhealthTs[
agent_task_config (2/.kentik.synthetics.v202101beta1.AgentTaskConfigRagentTaskConfig@
mesh (2,.kentik.synthetics.v202101beta1.MeshResponseRmesh"?

TaskHealth8
task (2$.kentik.synthetics.v202101beta1.TaskRtaskC
agents (2+.kentik.synthetics.v202101beta1.AgentHealthRagentsM
overall_health (2&.kentik.synthetics.v202101beta1.HealthRoverallHealthH
target_agent (2%.kentik.synthetics.v202101beta1.AgentRtargetAgent"?
AgentHealth;
agent (2%.kentik.synthetics.v202101beta1.AgentRagentD
health (2,.kentik.synthetics.v202101beta1.HealthMomentRhealthM
overall_health (2&.kentik.synthetics.v202101beta1.HealthRoverallHealth"?
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
value (	Rvalue:8"?
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
expiry (Rexpiry"?
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

definition"?
KnockTaskDefinition
target (	Rtarget
period (Rperiod
expiry (Rexpiry
count (Rcount
port (Rport"?
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
	full_name (	RfullName"?
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
last_updated_by (2(.kentik.synthetics.v202101beta1.UserInfoRlastUpdatedBy"?

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
value (	Rvalue:8"?
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

definition"?
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
delay (Rdelay"?
TestMonitoringSettings6
activation_grace_period (	RactivationGracePeriod0
activation_time_unit (	RactivationTimeUnit4
activation_time_window (	RactivationTimeWindow)
activation_times (	RactivationTimes3
notification_channels (	RnotificationChannels"?
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
target (	Rtarget"?
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
ApplicationMeshTest"?
MeshResponse
id (	Rid
name (	Rname
local_ip (	RlocalIp
ip (	Rip
alias (	RaliasD
columns (2*.kentik.synthetics.v202101beta1.MeshColumnRcolumns"?

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
value (Rvalue"?
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
	longitude	 (R	longitude"?
GeoA
country (2'.kentik.synthetics.v202101beta1.CountryRcountry>
region (2&.kentik.synthetics.v202101beta1.RegionRregion8
city (2$.kentik.synthetics.v202101beta1.CityRcity"
DNS
name (	Rname"?
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
ip (	Rip"?
TracerouteLookupK
agent_id_by_ip (2&.kentik.synthetics.v202101beta1.IDByIPRagentIdByIp=
agents (2%.kentik.synthetics.v202101beta1.AgentRagents7
asns (2#.kentik.synthetics.v202101beta1.ASNRasnsM
device_id_by_ip (2&.kentik.synthetics.v202101beta1.IDByIPRdeviceIdByIpI
site_id_by_ip (2&.kentik.synthetics.v202101beta1.IDByIPR
siteIdByIp8
ips (2&.kentik.synthetics.v202101beta1.IPInfoRips"?
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
 (RtraceEnd"?

TraceProbe
as_path (RasPath
	completed (R	completed
	hop_count (RhopCount
region_path (	R
regionPath
	site_path (RsitePath<
hops (2(.kentik.synthetics.v202101beta1.TraceHopRhops"?
Trace
agent_id (	RagentId
agent_ip (	RagentIp
	target_ip (	RtargetIp
	hop_count (RhopCountB
probes (2*.kentik.synthetics.v202101beta1.TraceProbeRprobes"I
Stats
average (Raverage
max (Rmax
total (Rtotal"?
TracerouteResult.
time (2.google.protobuf.TimestampRtime=
traces (2%.kentik.synthetics.v202101beta1.TraceRtraces
	hop_count (RhopCount;
count (2%.kentik.synthetics.v202101beta1.StatsRcountA
distance (2%.kentik.synthetics.v202101beta1.StatsRdistance"?
TracerouteInfo9
is_trace_routes_truncated (RisTraceRoutesTruncated+
max_asn_path_count (RmaxAsnPathCount-
max_site_path_count (RmaxSitePathCount1
max_region_path_count (RmaxRegionPathCount"?
GetHealthForTestsRequest
ids (	Rids9

start_time (2.google.protobuf.TimestampR	startTime5
end_time (2.google.protobuf.TimestampRendTime
	agent_ids (	RagentIds
task_ids (	RtaskIds
augment (Raugment"_
GetHealthForTestsResponseB
health (2*.kentik.synthetics.v202101beta1.TestHealthRhealth"?
GetTraceForTestRequest
id (	Rid9

start_time (2.google.protobuf.TimestampR	startTime5
end_time (2.google.protobuf.TimestampRendTime
	agent_ids (	RagentIds

target_ips (	R	targetIps"?
GetTraceForTestResponseJ
lookups (20.kentik.synthetics.v202101beta1.TracerouteLookupRlookupsS
trace_routes (20.kentik.synthetics.v202101beta1.TracerouteResultRtraceRoutesZ
trace_routes_info (2..kentik.synthetics.v202101beta1.TracerouteInfoRtraceRoutesInfo"
ListAgentsRequest"?
ListAgentsResponse=
agents (2%.kentik.synthetics.v202101beta1.AgentRagents0
invalid_agents_count (RinvalidAgentsCount"!
GetAgentRequest
id (	Rid"O
GetAgentResponse;
agent (2%.kentik.synthetics.v202101beta1.AgentRagent"?
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
TASK_STATE_DELETED*?
	DNSRecord
DNS_RECORD_UNSPECIFIED 
DNS_RECORD_A
DNS_RECORD_AAAA
DNS_RECORD_CNAME
DNS_RECORD_DNAME
DNS_RECORD_NS
DNS_RECORD_MX
DNS_RECORD_PTR
DNS_RECORD_SOA2?
SyntheticsDataService?
GetHealthForTests8.kentik.synthetics.v202101beta1.GetHealthForTestsRequest9.kentik.synthetics.v202101beta1.GetHealthForTestsResponse"??A?&Get health status for synthetics test.MGet synthetics health test for login user. Also returns mesh data on request.*GetHealthForTests??synthetics:read????*"%/synthetics/v202101beta1/health/tests:*?
GetTraceForTest6.kentik.synthetics.v202101beta1.GetTraceForTestRequest7.kentik.synthetics.v202101beta1.GetTraceForTestResponse"??AXGet trace route data..Get trace route data for the specific test id.*GetTraceForTest??synthetics:read????6"1/synthetics/v202101beta1/tests/{id}/results/trace:**?Asynthetics.api.kentik.com??
synthetics2?
SyntheticsAdminService?

ListAgents1.kentik.synthetics.v202101beta1.ListAgentsRequest2.kentik.synthetics.v202101beta1.ListAgentsResponse"x?A5List Agents.Returns a list of agents.*
AgentsList??admin.synthetics:read????!/synthetics/v202101beta1/agents?
GetAgent/.kentik.synthetics.v202101beta1.GetAgentRequest0.kentik.synthetics.v202101beta1.GetAgentResponse"??AcGet information about an agent.6Returns information about the agent specified with id.*AgentGet??admin.synthetics:read????&$/synthetics/v202101beta1/agents/{id}?

PatchAgent1.kentik.synthetics.v202101beta1.PatchAgentRequest2.kentik.synthetics.v202101beta1.PatchAgentResponse"??ArPatch an agent.SPartially Updates the attributes of agent specified with id and update_mask fields.*
AgentPatch??admin.synthetics:write????/2*/synthetics/v202101beta1/agents/{agent.id}:*?
DeleteAgent2.kentik.synthetics.v202101beta1.DeleteAgentRequest3.kentik.synthetics.v202101beta1.DeleteAgentResponse"??AEDelete an agent.$Deletes the agent specified with id.*AgentDelete??admin.synthetics:write????&*$/synthetics/v202101beta1/agents/{id}?
	ListTests0.kentik.synthetics.v202101beta1.ListTestsRequest1.kentik.synthetics.v202101beta1.ListTestsResponse"??AHList Synthetics Tests.#Returns a list of syntehtics tests.*	TestsList??admin.synthetics:read???? /synthetics/v202101beta1/tests?

CreateTest1.kentik.synthetics.v202101beta1.CreateTestRequest2.kentik.synthetics.v202101beta1.CreateTestResponse"??AaCreate Synthetics Test.:Create synthetics test from request. Returns created test.*
TestCreate??admin.synthetics:write????#"/synthetics/v202101beta1/tests:*?
GetTest..kentik.synthetics.v202101beta1.GetTestRequest/.kentik.synthetics.v202101beta1.GetTestResponse"??At&Get information about Synthetics Test.AReturns information about synthetics test specified with test ID.*TestGet??admin.synthetics:read????%#/synthetics/v202101beta1/tests/{id}?
SetTestStatus4.kentik.synthetics.v202101beta1.SetTestStatusRequest5.kentik.synthetics.v202101beta1.SetTestStatusResponse"??AGUpdate a test status.Update the status of a test.*TestStatusUpdate??admin.synthetics:write????/*/synthetics/v202101beta1/tests/{id}/status:*?
	PatchTest0.kentik.synthetics.v202101beta1.PatchTestRequest1.kentik.synthetics.v202101beta1.PatchTestResponse"??A?Patch a Synthetics Test.]Partially Updates the attributes of synthetics test specified with id and update_mask fields.*	TestPatch??admin.synthetics:write????-2(/synthetics/v202101beta1/tests/{test.id}:*?

DeleteTest1.kentik.synthetics.v202101beta1.DeleteTestRequest2.kentik.synthetics.v202101beta1.DeleteTestResponse"??AXDelete an Synthetics Test..Deletes the synthetics test specified with id.*
TestDelete??admin.synthetics:write????%*#/synthetics/v202101beta1/tests/{id}0?Asynthetics.api.kentik.com??admin.syntheticsB?ZMgithub.com/kentik/api-schema/gen/go/kentik/synthetics/v202101beta1;synthetics?A?a
Synthetics Monitoring API"7
Kentik API Engineeringhttps://github.com/kentik/api2202101beta1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ??
 ?
*
 2  Synthetics data and admin APIs


 '

 d
	
 d
	
  &
	
 !
	
	 *
	

 )
	
 8
	
 5
	
 ;

? ;
M
 @ C2A models
 -------------------------------------------------------



 @

  A

  A

  A	

  A

 B%

 B

 B 

 B#$


E H


E

 F

 F

 F	

 F

G

G


G

G

G


J R


J

 K

 K

 K	

 K

L 

L


L

L

L

M

M

M	

M

N 

N


N

N

N

O1

O


O

O,

O/0

P!

P


P

P

P 


T Y


T

 U

 U

 U

 U

V"

V


V

V

V !

W

W

W	

W

X

X

X

X


[ _


[

 \

 \

 \

 \

]#

]


]

]

]!"

^

^

^	

^


a x


a

 b%

 b

 b 

 b#$

c

c

c	

c

d

d

d	

d

e

e

e	

e

f

f

f	

f

g"

g

g	

g !

h!

h

h	

h 

i$

i

i	

i"#

j*

j

j	%

j()

	k

	k

	k	

	k


l!


l


l	


l 

m

m

m	

m
8
o+ fields returned from backend grpc service


o

o	

o

p!

p

p	

p 

q!

q

q	

q 

r

r

r	

r

s

s

s	

s

t

t

t	

t

u

u

u	

u

v

v

v	

v

w)

w

w#

w&(
a
 { ?T Agent impl type determines global vs private agent to use for specific test types.



 {

  |!

  |

  | 
C
 ~6 setup IP test against a NODE global agent will fail.


 ~

 ~
M
 ?? setup a page load test against a RUST global agent will fail.


 ?

 ?

? ?

?
!
 ? id of this agent.


 ?

 ?	

 ?
K
?"= revert site_name to name to prevent breaking existing users


?

?	

?

?

?

?

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

	?-

	?

	?'

	?*,


?


?



?


?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

? 

?


?

?

?

?

?

?	

?

?

?

?	

?

? 

?

?

?

? ?

?

 ?" Invalid value.


 ?

 ?

?

?

?

?

?

?

?

?

?

? ?

?

 ?" Invalid value.


 ?

 ?

?" Test is active.


?

?

?" Test is paused.


?

?
@
?"2 Test is deleted. Not settable via SetTestStatus.


?

?

? ?

?

 ?" Invalid value.


 ?

 ?

?

?

?

?

?

?

?

?

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

	? ?

	?

	 ?

	 ?

	 ?	

	 ?

	?

	?

	?	

	?

	?

	?

	?	

	?

? ?

?

 ?" Invalid value.


 ?

 ?

?

?

?

?

?

?

?

?

?


? ?


?


 ?


 ?


 ?	


 ?


?


?


?	


?


?


?


?	


?


?


?


?


?


?


?


?	


?


?


?



?


?


 ??


 ?


?'


?


?


?%&


?(


?


?"


?%'


?(


?


?


?%'


	?(


	?


	?


	?%'



?(



?



?



?%'


?(


?


?


?%'

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?

?

?

?

?

?

?+

?

?&

?)*

?&

?

?!

?$%

?&

?

?!

?$%

	?

	?


	?

	?


? 


?



?


?

? ?

?

 ? 

 ?

 ?	

 ?

? 

?

?	

?

? 

?

?	

?

?"

?

?

? !

? 

?

?	

?

? 

?

?

?

?(

?

?#

?&'

? ?

?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

? ?

?

 ??

 ?

 ?

 ?

 ?

 ?

?

?


?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

	?

	?

	?

	?


?


?


?


?

?.

?

?(

?+-

?!

?


?

?

? 

?

?

?	

?

?

?

?	

?

?

?

?	

?

?

?

?	

?

?" Task types.


?


?

?

?

?&

?

? 

?#%

?2

?

?,

?/1

?

?

?

?

?

?

?

?

?

?

?	

?

?

?

?	

?

?

?


?

?

?

?


?

?

?

?

?

?

?

?

?

?

?

?

?

?	

?

?

?

?

?

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

?

?

?	

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

?

?

?

?

?

?

?

?

? ?

?

 ?%

 ?

 ?	 

 ?#$

?"

?

?	

? !

?$

?

?	

?"#

?

?

?	

?

?,

?


?

?'

?*+

? ?

?

 ?

 ?

 ?

 ?

?

?

?

?

?!

?

?

? 

? 

?

?

?

?

?

?

?

?

?

?

?

?"

?

?

? !

?!

?

?

? 

?'

?


?

?"

?%&

	?'

	?


	?

	?!

	?$&


?%


?


?


?"$

?$

?

?

?!#

?$

?

?

?!#

?#

?

?

? "

?*

?

?$

?')

?)

?

?#

?&(

? ?

?

 ?

 ?

 ?	

 ?

? ?

?

 ?

 ?


 ?

 ?

 ?

? ?

?

 ?

 ?

 ?	

 ?

? ?

?

 ?

 ?

 ?	

 ?
,
?," How often to generate tasks.


?

?	'

?*+

?" Used for top N.


?

?	

?
F
?"8 What type of flow to look at -- asn, cdn, country, ...


?

?	

?

?

?

?	

?

?

?

?	

?

? ?

?

 ?

 ?

 ?	

 ?

? ?

?

 ?

 ?

 ?	

 ?

? ?

?

 ?

 ?

 ?	

 ?

?

?

?

?

? ?

?

 ?

 ?

 ?	

 ?

? ?

?

 ?

 ?


 ?

 ?

 ?

? ?

?

 ?

 ?


 ?

 ?

 ?

?

?

?

?
D
 ? ?"6 application mesh test expects empty object in target


 ?

!? ?

!?

! ?

! ?

! ?	

! ?

!?

!?

!?	

!?

!?

!?

!?	

!?

!?

!?

!?	

!?

!?

!?

!?	

!?

!?"

!?


!?

!?

!? !

"? ?

"?

" ?

" ?

" ?	

" ?

"?

"?

"?	

"?

"?

"?

"?	

"?

"?

"?

"?	

"?

"?

"?

"?

"?

"?"

"?


"?

"?

"? !

#? ?

#?

# ?

# ?

# ?	

# ?

#?

#?

#?	

#?

#?

#?

#?

#?

$? ?

$?

$ ?%

$ ?

$ ? 

$ ?#$

$?

$?

$?

$?

$?

$?

$?

$?

$?

$?

$?

$?

%? ?

%?

% ?

% ?

% ?	

% ?

%?

%?

%?	

%?

&? ?

&?

& ?

& ?

& ?	

& ?

&?

&?

&?	

&?

'? ?

'?

' ?

' ?

' ?


' ?

'?

'?

'?	

'?

(? ?

(?

( ?

( ?

( ?	

( ?

(?

(?

(?	

(?

(?

(?

(?	

(?

(?

(?

(?	

(?

)? ?

)?

) ?

) ?	

) ?


) ?

)?

)?

)?	

)?

)?

)?

)?

)?

*? ?

*?

* ?

* ?

* ?	

* ?

+? ?

+?

+ ?

+ ?

+ ?	

+ ?

+?

+?

+?	

+?

+?

+?

+?	

+?

+?

+?

+?	

+?

+?

+?

+?	

+?

+?

+?

+?	

+?

+?

+?

+?	

+?
4
,? ?& ID type for the specified IP address


,?
 
, ? ID value of type


, ?

, ?	

, ?
,
,? IP address associate with IP


,?

,?	

,?
&
-? ? Traceroute lookup info


-?

- ?% Agent ID by IP


- ?


- ?

- ? 

- ?#$

-? Agents info


-?


-?

-?

-?

-? ASN


-?


-?

-?

-?

-?& Device ID by IP


-?


-?

-?!

-?$%

-?$ Site ID by IP


-?


-?

-?

-?"#

-?	 IP Info


-?


-?

-?

-?

.? ?

.?

. ?

. ?

. ?

. ?

.?

.?

.?	

.?

.?

.?

.?

.?

.?

.?

.?

.?

.?!

.?

.?

.? 

.?

.?

.?

.?

.?

.?

.?

.?

.?

.?

.?

.?

.?

.?

.?

.?

.	?

.	?

.	?

.	?

/? ? Probing detail


/?

/ ?	 AS path


/ ?


/ ?

/ ?

/ ?

/? Completed probe


/?

/?

/?

/? Hop count


/?

/?

/?
!
/?" Region path trace


/?


/?

/?

/? !

/? Site path trace


/?


/?

/?

/?

/?

/?


/?

/?

/?

0? ? Trace detail


0?
)
0 ? ID of agent for the trace


0 ?

0 ?	

0 ?
)
0? IP of agent for the trace


0?

0?	

0?
 
0? Remote target IP


0?

0?	

0?
,
0? Number of hops for the trace


0?

0?

0?

0?! Probing info


0?


0?

0?

0? 
/
1? ?! Statistics for traceroute count


1?
!
1 ? Average statistic


1 ?

1 ?

1 ?
!
1? Maximum statistic


1?

1?

1?

1? Total statistic


1?

1?

1?

2? ?

2?

2 ?%

2 ?

2 ? 

2 ?#$

2?

2?


2?

2?

2?

2?

2?

2?

2?

2?

2?

2?

2?

2?

2?

2?

2?

3? ? Traceroute info


3?
2
3 ?%$ Indicate trace route is trunciated


3 ?

3 ? 

3 ?#$
*
3? Maximum number of asn path


3?

3?

3?
+
3?  Maximum number of site path


3?

3?

3?
-
3?" Maximum number of region path


3?

3?

3? !
U
4? ?2G Data Service
 -------------------------------------------------------


4? 
;
4 ?- List of ids of the tests to get health for.


4 ?


4 ?

4 ?

4 ?
:
4?+, Start of the time interval for this query.


4?

4?&

4?)*
8
4?)* End of the time interval for this query.


4?

4?$

4?'(
;
4? - Optionally, only look at a subset of agents


4?


4?

4?

4?
Y
4?K Optionally only look at a subset of tasks -- this lets you limit targets.


4?


4?

4?

4?

4?

4?

4?

4?

5? ?

5?!

5 ?!

5 ?


5 ?

5 ?

5 ? 

6? ?

6?

6 ?	 Test id


6 ?

6 ?	

6 ?
:
6?+, Start of the time interval for this query.


6?

6?&

6?)*
8
6?)* End of the time interval for this query.


6?

6?$

6?'(
>
6? 0 Optionally, limit the query to these agent ids


6?


6?

6?

6?
M
6?!? Optionally, limit the query to these destination IP addresses


6?


6?

6?

6? 

7? ?

7?

7 ?

7 ?

7 ?

7 ?

7?-

7?


7?

7?(

7?+,

7?'

7?

7?"

7?%&

 ? ?

 ?

 ?A

 ??A

 ?B

 ?*?B
4
  ??$ Get health data for a set of tests


  ?

  ?1

  ?<U

  ?H

  ?*?H

  ??

	  ?ʼ"??

  ??

  ???

 ??

 ?

 ?-

 ?8O

 ?H

 ?*?H

 ??

	 ?ʼ"??

 ??

 ???
T
8? 2H Admin Service
 -------------------------------------------------------


8?

9? ?

9?

9 ?

9 ?


9 ?

9 ?

9 ?

9?"

9?

9?	

9? !

:? ?

:?

: ?

: ?

: ?	

: ?

;? ?

;?

; ?

; ?

; ?

; ?

<? ?

<?

< ?

< ?

< ?

< ?
v
<?%h CSV values of fields follow the path of Agent object with dot notation (ie. "agent.alias,export.type")


<?

<? 

<?#$

=? ?

=?

= ?

= ?

= ?

= ?

>? ?

>?

> ?

> ?

> ?	

> ?


?? 

??

@? ?

@?

@ ?

@ ?

@ ?

@ ?

A? ?

A?

A ?

A ?


A ?

A ?

A ?

A?!

A?

A?	

A? 

B? ?

B?

B ?

B ?

B ?

B ?

C? ?

C?

C ?

C ?

C ?

C ?

D? ?

D?

D ?

D ?

D ?	

D ?

E? ?

E?

E ?

E ?

E ?

E ?

F? ?

F?

F ?

F ?

F ?	

F ?

F?

F?

F?

F?

G? ?

G?

H? ?

H?

H ?

H ?

H ?

H ?
u
H?%g CSV values of fields follow the path of Test object with dot notation (ie. "test.name,test.settings")


H?

H? 

H?#$

I? ?

I?

I ?

I ?

I ?

I ?

J? ?

J?

J ?

J ?

J ?	

J ?


K? 

K?

? ?

?

?A

??A

?H

?*?H

 ??2 Agents


 ?

 ?"

 ?-?

 ?N

 ?*?N

 ??

	 ?ʼ"??

 ??

 ???

??

?

?

?)9

?N

?*?N

??

	?ʼ"??

??

???

??

?

?"

?-?

?O

?*?O

??

	?ʼ"??

??

???

??

?

?$

?/B

?O

?*?O

??

	?ʼ"??

??

???

??2 Tests


?

? 

?+<

?N

?*?N

??

	?ʼ"??

??

???

??

?

?"

?-?

?O

?*?O

??

	?ʼ"??

??

???

??

?

?

?'6

?N

?*?N

??

	?ʼ"??

??

???

??

?

?(

?3H

?O

?*?O

??

	?ʼ"??

??

???

??

?

? 

?+<

?O

?*?O

??

	?ʼ"??

??

???

	??

	?

	?"

	?-?

	?O

	?*?O

	??

		?ʼ"??

	??

	???bproto3??  
?.
$kentik/user/v202106alpha1/user.protokentik.user.v202106alpha1google/api/annotations.protogoogle/api/client.protogoogle/protobuf/timestamp.proto.protoc-gen-openapiv2/options/annotations.proto+kentik/core/v202012alpha1/annotations.proto"?
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
DeleteUserResponse*?
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
ROLE_SUPER_ADMINISTRATOR2?

UserService?
ListUser*.kentik.user.v202106alpha1.ListUserRequest+.kentik.user.v202106alpha1.ListUserResponse"p?A9List users. Returns a list of user accounts.*UserList??admin.user:read????/user/v202106alpha1/users?
GetUser).kentik.user.v202106alpha1.GetUserRequest*.kentik.user.v202106alpha1.GetUserResponse"??AYGet a user account.9Returns information about user account specified with ID.*UserGet??admin.user:read???? /user/v202106alpha1/users/{id}?

CreateUser,.kentik.user.v202106alpha1.CreateUserRequest-.kentik.user.v202106alpha1.CreateUserResponse"??AbCreate a user account.<Create a user account from request. returns created account.*
UserCreate??admin.user:write????"/user/v202106alpha1/users:*?

UpdateUser,.kentik.user.v202106alpha1.UpdateUserRequest-.kentik.user.v202106alpha1.UpdateUserResponse"??AdUpdate a user account.>Replaces the entire user account attributes specified with id.*
UserUpdate??admin.user:write????(#/user/v202106alpha1/users/{user.id}:*?

DeleteUser,.kentik.user.v202106alpha1.DeleteUserRequest-.kentik.user.v202106alpha1.DeleteUserResponse"??AQDelete a user account.+Deletes the user account specified with id.*
UserDelete??admin.user:write???? */user/v202106alpha1/users/{id}$?Agrpc.api.kentik.com??
admin.userB?ZBgithub.com/kentik/api-schema/gen/go/kentik/user/v202106alpha1;user?A?\
User management API"7
Kentik API Engineeringhttps://github.com/kentik/api2202102alpha1*2application/json:application/jsonZD

emailX-CH-Auth-Email 
"
tokenX-CH-Auth-API-Token b
	
email 
	
token r5
More about Kentik APIshttps://docs.kentik.com/apiJ?
  ?

  

 "

 Y
	
 Y
	
  &
	
 !
	
 )
	
 8
	
	 5
	
 7

? 7


 9 A


 9

  :

  :

  :

 ;

 ;

 ;

 <

 <

 <

 =

 =

 =

 >

 >

 >

 ?

 ?

 ?

 @

 @

 @


C H


C	

 D

 D

 D

E

E

E

F

F

F

G

G

G


 J S


 J

  K

  K

  K	

  K

 L

 L

 L	

 L

 M

 M

 M	

 M

 N

 N

 N	

 N

 O

 O

 O

 O

 P+

 P

 P&

 P)*

 Q-

 Q

 Q(

 Q+,

 R-

 R

 R(

 R+,
	
U 


U


V Y


V

 W

 W


 W

 W

 W

X

X

X	

X


[ ]


[

 \

 \

 \	

 \


^ `


^

 _

 _

 _

 _


b d


b

 c

 c

 c

 c


e g


e

 f

 f

 f

 f


i k


i

 j

 j

 j

 j


l n


l

 m

 m

 m

 m


	p r


	p

	 q

	 q

	 q	

	 q
	

s 



s

 v ?


 v


 w;

 ?w;


 xB

 ?*xB

  z?

  z

  z

  z)9

  {H

  ?*{H

  |~

	  ?ʼ"|~

  ?

  ??

 ??

 ?

 ?

 ?'6

 ?H

 ?*?H

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?"

 ?-?

 ?I

 ?*?I

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?"

 ?-?

 ?I

 ?*?I

 ??

	 ?ʼ"??

 ??

 ???

 ??

 ?

 ?"

 ?-?

 ?I

 ?*?I

 ??

	 ?ʼ"??

 ??

 ???bproto3??  