// Copyright 2019 The gRPC Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.25.0
// 	protoc        (unknown)
// source: grpc/http_over_grpc/http_over_grpc.proto

package http_over_grpc

import (
	proto "github.com/golang/protobuf/proto"
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

// This is a compile-time assertion that a sufficiently up-to-date version
// of the legacy proto package is being used.
const _ = proto.ProtoPackageIsVersion4

// Represents HTTP 1.1 header.
type Header struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Key    string   `protobuf:"bytes,1,opt,name=key,proto3" json:"key,omitempty"`
	Values []string `protobuf:"bytes,2,rep,name=values,proto3" json:"values,omitempty"`
}

func (x *Header) Reset() {
	*x = Header{}
	if protoimpl.UnsafeEnabled {
		mi := &file_grpc_http_over_grpc_http_over_grpc_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Header) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Header) ProtoMessage() {}

func (x *Header) ProtoReflect() protoreflect.Message {
	mi := &file_grpc_http_over_grpc_http_over_grpc_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Header.ProtoReflect.Descriptor instead.
func (*Header) Descriptor() ([]byte, []int) {
	return file_grpc_http_over_grpc_http_over_grpc_proto_rawDescGZIP(), []int{0}
}

func (x *Header) GetKey() string {
	if x != nil {
		return x.Key
	}
	return ""
}

func (x *Header) GetValues() []string {
	if x != nil {
		return x.Values
	}
	return nil
}

// An HTTP 1.1 request encapsulated in a gRPC.
type HTTPOverGRPCRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// The HTTP request method.
	Method string `protobuf:"bytes,1,opt,name=method,proto3" json:"method,omitempty"`
	// The HTTP request URL.
	Url string `protobuf:"bytes,2,opt,name=url,proto3" json:"url,omitempty"`
	// The HTTP request headers.
	Headers []*Header `protobuf:"bytes,3,rep,name=headers,proto3" json:"headers,omitempty"`
	// HTTP request body.
	Body []byte `protobuf:"bytes,4,opt,name=body,proto3" json:"body,omitempty"`
}

func (x *HTTPOverGRPCRequest) Reset() {
	*x = HTTPOverGRPCRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_grpc_http_over_grpc_http_over_grpc_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *HTTPOverGRPCRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*HTTPOverGRPCRequest) ProtoMessage() {}

func (x *HTTPOverGRPCRequest) ProtoReflect() protoreflect.Message {
	mi := &file_grpc_http_over_grpc_http_over_grpc_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use HTTPOverGRPCRequest.ProtoReflect.Descriptor instead.
func (*HTTPOverGRPCRequest) Descriptor() ([]byte, []int) {
	return file_grpc_http_over_grpc_http_over_grpc_proto_rawDescGZIP(), []int{1}
}

func (x *HTTPOverGRPCRequest) GetMethod() string {
	if x != nil {
		return x.Method
	}
	return ""
}

func (x *HTTPOverGRPCRequest) GetUrl() string {
	if x != nil {
		return x.Url
	}
	return ""
}

func (x *HTTPOverGRPCRequest) GetHeaders() []*Header {
	if x != nil {
		return x.Headers
	}
	return nil
}

func (x *HTTPOverGRPCRequest) GetBody() []byte {
	if x != nil {
		return x.Body
	}
	return nil
}

// An HTTP 1.1 reply encapsulated in an RPC.
type HTTPOverGRPCReply struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// The HTTP status code (e.g. 200, 400, 404).
	Status int32 `protobuf:"varint,1,opt,name=status,proto3" json:"status,omitempty"`
	// The HTTP response headers.
	Headers []*Header `protobuf:"bytes,2,rep,name=headers,proto3" json:"headers,omitempty"`
	// The HTTP response body.
	Body []byte `protobuf:"bytes,3,opt,name=body,proto3" json:"body,omitempty"`
}

func (x *HTTPOverGRPCReply) Reset() {
	*x = HTTPOverGRPCReply{}
	if protoimpl.UnsafeEnabled {
		mi := &file_grpc_http_over_grpc_http_over_grpc_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *HTTPOverGRPCReply) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*HTTPOverGRPCReply) ProtoMessage() {}

func (x *HTTPOverGRPCReply) ProtoReflect() protoreflect.Message {
	mi := &file_grpc_http_over_grpc_http_over_grpc_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use HTTPOverGRPCReply.ProtoReflect.Descriptor instead.
func (*HTTPOverGRPCReply) Descriptor() ([]byte, []int) {
	return file_grpc_http_over_grpc_http_over_grpc_proto_rawDescGZIP(), []int{2}
}

func (x *HTTPOverGRPCReply) GetStatus() int32 {
	if x != nil {
		return x.Status
	}
	return 0
}

func (x *HTTPOverGRPCReply) GetHeaders() []*Header {
	if x != nil {
		return x.Headers
	}
	return nil
}

func (x *HTTPOverGRPCReply) GetBody() []byte {
	if x != nil {
		return x.Body
	}
	return nil
}

var File_grpc_http_over_grpc_http_over_grpc_proto protoreflect.FileDescriptor

var file_grpc_http_over_grpc_http_over_grpc_proto_rawDesc = []byte{
	0x0a, 0x28, 0x67, 0x72, 0x70, 0x63, 0x2f, 0x68, 0x74, 0x74, 0x70, 0x5f, 0x6f, 0x76, 0x65, 0x72,
	0x5f, 0x67, 0x72, 0x70, 0x63, 0x2f, 0x68, 0x74, 0x74, 0x70, 0x5f, 0x6f, 0x76, 0x65, 0x72, 0x5f,
	0x67, 0x72, 0x70, 0x63, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x13, 0x67, 0x72, 0x70, 0x63,
	0x2e, 0x68, 0x74, 0x74, 0x70, 0x5f, 0x6f, 0x76, 0x65, 0x72, 0x5f, 0x67, 0x72, 0x70, 0x63, 0x22,
	0x32, 0x0a, 0x06, 0x48, 0x65, 0x61, 0x64, 0x65, 0x72, 0x12, 0x10, 0x0a, 0x03, 0x6b, 0x65, 0x79,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x03, 0x6b, 0x65, 0x79, 0x12, 0x16, 0x0a, 0x06, 0x76,
	0x61, 0x6c, 0x75, 0x65, 0x73, 0x18, 0x02, 0x20, 0x03, 0x28, 0x09, 0x52, 0x06, 0x76, 0x61, 0x6c,
	0x75, 0x65, 0x73, 0x22, 0x8a, 0x01, 0x0a, 0x13, 0x48, 0x54, 0x54, 0x50, 0x4f, 0x76, 0x65, 0x72,
	0x47, 0x52, 0x50, 0x43, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x16, 0x0a, 0x06, 0x6d,
	0x65, 0x74, 0x68, 0x6f, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x6d, 0x65, 0x74,
	0x68, 0x6f, 0x64, 0x12, 0x10, 0x0a, 0x03, 0x75, 0x72, 0x6c, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x03, 0x75, 0x72, 0x6c, 0x12, 0x35, 0x0a, 0x07, 0x68, 0x65, 0x61, 0x64, 0x65, 0x72, 0x73,
	0x18, 0x03, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x1b, 0x2e, 0x67, 0x72, 0x70, 0x63, 0x2e, 0x68, 0x74,
	0x74, 0x70, 0x5f, 0x6f, 0x76, 0x65, 0x72, 0x5f, 0x67, 0x72, 0x70, 0x63, 0x2e, 0x48, 0x65, 0x61,
	0x64, 0x65, 0x72, 0x52, 0x07, 0x68, 0x65, 0x61, 0x64, 0x65, 0x72, 0x73, 0x12, 0x12, 0x0a, 0x04,
	0x62, 0x6f, 0x64, 0x79, 0x18, 0x04, 0x20, 0x01, 0x28, 0x0c, 0x52, 0x04, 0x62, 0x6f, 0x64, 0x79,
	0x22, 0x76, 0x0a, 0x11, 0x48, 0x54, 0x54, 0x50, 0x4f, 0x76, 0x65, 0x72, 0x47, 0x52, 0x50, 0x43,
	0x52, 0x65, 0x70, 0x6c, 0x79, 0x12, 0x16, 0x0a, 0x06, 0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x18,
	0x01, 0x20, 0x01, 0x28, 0x05, 0x52, 0x06, 0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x12, 0x35, 0x0a,
	0x07, 0x68, 0x65, 0x61, 0x64, 0x65, 0x72, 0x73, 0x18, 0x02, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x1b,
	0x2e, 0x67, 0x72, 0x70, 0x63, 0x2e, 0x68, 0x74, 0x74, 0x70, 0x5f, 0x6f, 0x76, 0x65, 0x72, 0x5f,
	0x67, 0x72, 0x70, 0x63, 0x2e, 0x48, 0x65, 0x61, 0x64, 0x65, 0x72, 0x52, 0x07, 0x68, 0x65, 0x61,
	0x64, 0x65, 0x72, 0x73, 0x12, 0x12, 0x0a, 0x04, 0x62, 0x6f, 0x64, 0x79, 0x18, 0x03, 0x20, 0x01,
	0x28, 0x0c, 0x52, 0x04, 0x62, 0x6f, 0x64, 0x79, 0x32, 0x71, 0x0a, 0x0c, 0x48, 0x54, 0x54, 0x50,
	0x4f, 0x76, 0x65, 0x72, 0x47, 0x52, 0x50, 0x43, 0x12, 0x61, 0x0a, 0x0b, 0x48, 0x54, 0x54, 0x50,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x28, 0x2e, 0x67, 0x72, 0x70, 0x63, 0x2e, 0x68,
	0x74, 0x74, 0x70, 0x5f, 0x6f, 0x76, 0x65, 0x72, 0x5f, 0x67, 0x72, 0x70, 0x63, 0x2e, 0x48, 0x54,
	0x54, 0x50, 0x4f, 0x76, 0x65, 0x72, 0x47, 0x52, 0x50, 0x43, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x1a, 0x26, 0x2e, 0x67, 0x72, 0x70, 0x63, 0x2e, 0x68, 0x74, 0x74, 0x70, 0x5f, 0x6f, 0x76,
	0x65, 0x72, 0x5f, 0x67, 0x72, 0x70, 0x63, 0x2e, 0x48, 0x54, 0x54, 0x50, 0x4f, 0x76, 0x65, 0x72,
	0x47, 0x52, 0x50, 0x43, 0x52, 0x65, 0x70, 0x6c, 0x79, 0x22, 0x00, 0x62, 0x06, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x33,
}

var (
	file_grpc_http_over_grpc_http_over_grpc_proto_rawDescOnce sync.Once
	file_grpc_http_over_grpc_http_over_grpc_proto_rawDescData = file_grpc_http_over_grpc_http_over_grpc_proto_rawDesc
)

func file_grpc_http_over_grpc_http_over_grpc_proto_rawDescGZIP() []byte {
	file_grpc_http_over_grpc_http_over_grpc_proto_rawDescOnce.Do(func() {
		file_grpc_http_over_grpc_http_over_grpc_proto_rawDescData = protoimpl.X.CompressGZIP(file_grpc_http_over_grpc_http_over_grpc_proto_rawDescData)
	})
	return file_grpc_http_over_grpc_http_over_grpc_proto_rawDescData
}

var file_grpc_http_over_grpc_http_over_grpc_proto_msgTypes = make([]protoimpl.MessageInfo, 3)
var file_grpc_http_over_grpc_http_over_grpc_proto_goTypes = []interface{}{
	(*Header)(nil),              // 0: grpc.http_over_grpc.Header
	(*HTTPOverGRPCRequest)(nil), // 1: grpc.http_over_grpc.HTTPOverGRPCRequest
	(*HTTPOverGRPCReply)(nil),   // 2: grpc.http_over_grpc.HTTPOverGRPCReply
}
var file_grpc_http_over_grpc_http_over_grpc_proto_depIdxs = []int32{
	0, // 0: grpc.http_over_grpc.HTTPOverGRPCRequest.headers:type_name -> grpc.http_over_grpc.Header
	0, // 1: grpc.http_over_grpc.HTTPOverGRPCReply.headers:type_name -> grpc.http_over_grpc.Header
	1, // 2: grpc.http_over_grpc.HTTPOverGRPC.HTTPRequest:input_type -> grpc.http_over_grpc.HTTPOverGRPCRequest
	2, // 3: grpc.http_over_grpc.HTTPOverGRPC.HTTPRequest:output_type -> grpc.http_over_grpc.HTTPOverGRPCReply
	3, // [3:4] is the sub-list for method output_type
	2, // [2:3] is the sub-list for method input_type
	2, // [2:2] is the sub-list for extension type_name
	2, // [2:2] is the sub-list for extension extendee
	0, // [0:2] is the sub-list for field type_name
}

func init() { file_grpc_http_over_grpc_http_over_grpc_proto_init() }
func file_grpc_http_over_grpc_http_over_grpc_proto_init() {
	if File_grpc_http_over_grpc_http_over_grpc_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_grpc_http_over_grpc_http_over_grpc_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Header); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_grpc_http_over_grpc_http_over_grpc_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*HTTPOverGRPCRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_grpc_http_over_grpc_http_over_grpc_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*HTTPOverGRPCReply); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_grpc_http_over_grpc_http_over_grpc_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   3,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_grpc_http_over_grpc_http_over_grpc_proto_goTypes,
		DependencyIndexes: file_grpc_http_over_grpc_http_over_grpc_proto_depIdxs,
		MessageInfos:      file_grpc_http_over_grpc_http_over_grpc_proto_msgTypes,
	}.Build()
	File_grpc_http_over_grpc_http_over_grpc_proto = out.File
	file_grpc_http_over_grpc_http_over_grpc_proto_rawDesc = nil
	file_grpc_http_over_grpc_http_over_grpc_proto_goTypes = nil
	file_grpc_http_over_grpc_http_over_grpc_proto_depIdxs = nil
}
