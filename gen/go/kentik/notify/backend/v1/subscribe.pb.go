// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.25.0
// 	protoc        v3.13.0
// source: kentik/notify/backend/v1/subscribe.proto

package notify

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

type CreateUserChannelRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *CreateUserChannelRequest) Reset() {
	*x = CreateUserChannelRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_notify_backend_v1_subscribe_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateUserChannelRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateUserChannelRequest) ProtoMessage() {}

func (x *CreateUserChannelRequest) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_notify_backend_v1_subscribe_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateUserChannelRequest.ProtoReflect.Descriptor instead.
func (*CreateUserChannelRequest) Descriptor() ([]byte, []int) {
	return file_kentik_notify_backend_v1_subscribe_proto_rawDescGZIP(), []int{0}
}

type CreateUserChannelResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *CreateUserChannelResponse) Reset() {
	*x = CreateUserChannelResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_notify_backend_v1_subscribe_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateUserChannelResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateUserChannelResponse) ProtoMessage() {}

func (x *CreateUserChannelResponse) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_notify_backend_v1_subscribe_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateUserChannelResponse.ProtoReflect.Descriptor instead.
func (*CreateUserChannelResponse) Descriptor() ([]byte, []int) {
	return file_kentik_notify_backend_v1_subscribe_proto_rawDescGZIP(), []int{1}
}

type SubscribeRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	InsightName   string `protobuf:"bytes,1,opt,name=insightName,proto3" json:"insightName,omitempty"`
	InsightFamily string `protobuf:"bytes,2,opt,name=insightFamily,proto3" json:"insightFamily,omitempty"`
}

func (x *SubscribeRequest) Reset() {
	*x = SubscribeRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_notify_backend_v1_subscribe_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SubscribeRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SubscribeRequest) ProtoMessage() {}

func (x *SubscribeRequest) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_notify_backend_v1_subscribe_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SubscribeRequest.ProtoReflect.Descriptor instead.
func (*SubscribeRequest) Descriptor() ([]byte, []int) {
	return file_kentik_notify_backend_v1_subscribe_proto_rawDescGZIP(), []int{2}
}

func (x *SubscribeRequest) GetInsightName() string {
	if x != nil {
		return x.InsightName
	}
	return ""
}

func (x *SubscribeRequest) GetInsightFamily() string {
	if x != nil {
		return x.InsightFamily
	}
	return ""
}

type SubscribeResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *SubscribeResponse) Reset() {
	*x = SubscribeResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_notify_backend_v1_subscribe_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SubscribeResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SubscribeResponse) ProtoMessage() {}

func (x *SubscribeResponse) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_notify_backend_v1_subscribe_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SubscribeResponse.ProtoReflect.Descriptor instead.
func (*SubscribeResponse) Descriptor() ([]byte, []int) {
	return file_kentik_notify_backend_v1_subscribe_proto_rawDescGZIP(), []int{3}
}

var File_kentik_notify_backend_v1_subscribe_proto protoreflect.FileDescriptor

var file_kentik_notify_backend_v1_subscribe_proto_rawDesc = []byte{
	0x0a, 0x28, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2f, 0x6e, 0x6f, 0x74, 0x69, 0x66, 0x79, 0x2f,
	0x62, 0x61, 0x63, 0x6b, 0x65, 0x6e, 0x64, 0x2f, 0x76, 0x31, 0x2f, 0x73, 0x75, 0x62, 0x73, 0x63,
	0x72, 0x69, 0x62, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x14, 0x6b, 0x65, 0x6e, 0x74,
	0x69, 0x6b, 0x2e, 0x61, 0x70, 0x69, 0x2e, 0x6e, 0x6f, 0x74, 0x69, 0x66, 0x79, 0x2e, 0x76, 0x30,
	0x22, 0x1a, 0x0a, 0x18, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x55, 0x73, 0x65, 0x72, 0x43, 0x68,
	0x61, 0x6e, 0x6e, 0x65, 0x6c, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x22, 0x1b, 0x0a, 0x19,
	0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x55, 0x73, 0x65, 0x72, 0x43, 0x68, 0x61, 0x6e, 0x6e, 0x65,
	0x6c, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x5a, 0x0a, 0x10, 0x53, 0x75, 0x62,
	0x73, 0x63, 0x72, 0x69, 0x62, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x20, 0x0a,
	0x0b, 0x69, 0x6e, 0x73, 0x69, 0x67, 0x68, 0x74, 0x4e, 0x61, 0x6d, 0x65, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x0b, 0x69, 0x6e, 0x73, 0x69, 0x67, 0x68, 0x74, 0x4e, 0x61, 0x6d, 0x65, 0x12,
	0x24, 0x0a, 0x0d, 0x69, 0x6e, 0x73, 0x69, 0x67, 0x68, 0x74, 0x46, 0x61, 0x6d, 0x69, 0x6c, 0x79,
	0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0d, 0x69, 0x6e, 0x73, 0x69, 0x67, 0x68, 0x74, 0x46,
	0x61, 0x6d, 0x69, 0x6c, 0x79, 0x22, 0x13, 0x0a, 0x11, 0x53, 0x75, 0x62, 0x73, 0x63, 0x72, 0x69,
	0x62, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x42, 0x0b, 0x5a, 0x09, 0x76, 0x30,
	0x2f, 0x6e, 0x6f, 0x74, 0x69, 0x66, 0x79, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_kentik_notify_backend_v1_subscribe_proto_rawDescOnce sync.Once
	file_kentik_notify_backend_v1_subscribe_proto_rawDescData = file_kentik_notify_backend_v1_subscribe_proto_rawDesc
)

func file_kentik_notify_backend_v1_subscribe_proto_rawDescGZIP() []byte {
	file_kentik_notify_backend_v1_subscribe_proto_rawDescOnce.Do(func() {
		file_kentik_notify_backend_v1_subscribe_proto_rawDescData = protoimpl.X.CompressGZIP(file_kentik_notify_backend_v1_subscribe_proto_rawDescData)
	})
	return file_kentik_notify_backend_v1_subscribe_proto_rawDescData
}

var file_kentik_notify_backend_v1_subscribe_proto_msgTypes = make([]protoimpl.MessageInfo, 4)
var file_kentik_notify_backend_v1_subscribe_proto_goTypes = []interface{}{
	(*CreateUserChannelRequest)(nil),  // 0: kentik.api.notify.v0.CreateUserChannelRequest
	(*CreateUserChannelResponse)(nil), // 1: kentik.api.notify.v0.CreateUserChannelResponse
	(*SubscribeRequest)(nil),          // 2: kentik.api.notify.v0.SubscribeRequest
	(*SubscribeResponse)(nil),         // 3: kentik.api.notify.v0.SubscribeResponse
}
var file_kentik_notify_backend_v1_subscribe_proto_depIdxs = []int32{
	0, // [0:0] is the sub-list for method output_type
	0, // [0:0] is the sub-list for method input_type
	0, // [0:0] is the sub-list for extension type_name
	0, // [0:0] is the sub-list for extension extendee
	0, // [0:0] is the sub-list for field type_name
}

func init() { file_kentik_notify_backend_v1_subscribe_proto_init() }
func file_kentik_notify_backend_v1_subscribe_proto_init() {
	if File_kentik_notify_backend_v1_subscribe_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_kentik_notify_backend_v1_subscribe_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateUserChannelRequest); i {
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
		file_kentik_notify_backend_v1_subscribe_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateUserChannelResponse); i {
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
		file_kentik_notify_backend_v1_subscribe_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SubscribeRequest); i {
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
		file_kentik_notify_backend_v1_subscribe_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SubscribeResponse); i {
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
			RawDescriptor: file_kentik_notify_backend_v1_subscribe_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   4,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_kentik_notify_backend_v1_subscribe_proto_goTypes,
		DependencyIndexes: file_kentik_notify_backend_v1_subscribe_proto_depIdxs,
		MessageInfos:      file_kentik_notify_backend_v1_subscribe_proto_msgTypes,
	}.Build()
	File_kentik_notify_backend_v1_subscribe_proto = out.File
	file_kentik_notify_backend_v1_subscribe_proto_rawDesc = nil
	file_kentik_notify_backend_v1_subscribe_proto_goTypes = nil
	file_kentik_notify_backend_v1_subscribe_proto_depIdxs = nil
}
