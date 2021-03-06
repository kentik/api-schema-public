// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.25.0
// 	protoc        (unknown)
// source: kentik/cloud_maps/v202201alpha1/cloud_maps.proto

package cloud_maps

import (
	proto "github.com/golang/protobuf/proto"
	_ "github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/options"
	_ "github.com/kentik/api-schema-public/gen/go/kentik/core/v202012alpha1"
	_ "google.golang.org/genproto/googleapis/api/annotations"
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

type ProvideAwsMetadataStorageLocationRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// only "aws-1.0" literal for now
	Version string `protobuf:"bytes,1,opt,name=version,proto3" json:"version,omitempty"`
	// 12-digit AWS account ID
	SourceAwsAccountId string `protobuf:"bytes,2,opt,name=source_aws_account_id,json=sourceAwsAccountId,proto3" json:"source_aws_account_id,omitempty"`
	// AWS region code
	SourceAwsRegion string `protobuf:"bytes,3,opt,name=source_aws_region,json=sourceAwsRegion,proto3" json:"source_aws_region,omitempty"`
}

func (x *ProvideAwsMetadataStorageLocationRequest) Reset() {
	*x = ProvideAwsMetadataStorageLocationRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ProvideAwsMetadataStorageLocationRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ProvideAwsMetadataStorageLocationRequest) ProtoMessage() {}

func (x *ProvideAwsMetadataStorageLocationRequest) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ProvideAwsMetadataStorageLocationRequest.ProtoReflect.Descriptor instead.
func (*ProvideAwsMetadataStorageLocationRequest) Descriptor() ([]byte, []int) {
	return file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDescGZIP(), []int{0}
}

func (x *ProvideAwsMetadataStorageLocationRequest) GetVersion() string {
	if x != nil {
		return x.Version
	}
	return ""
}

func (x *ProvideAwsMetadataStorageLocationRequest) GetSourceAwsAccountId() string {
	if x != nil {
		return x.SourceAwsAccountId
	}
	return ""
}

func (x *ProvideAwsMetadataStorageLocationRequest) GetSourceAwsRegion() string {
	if x != nil {
		return x.SourceAwsRegion
	}
	return ""
}

type ProvideAwsMetadataStorageLocationResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	TargetUrl string `protobuf:"bytes,1,opt,name=target_url,json=targetUrl,proto3" json:"target_url,omitempty"`
}

func (x *ProvideAwsMetadataStorageLocationResponse) Reset() {
	*x = ProvideAwsMetadataStorageLocationResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ProvideAwsMetadataStorageLocationResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ProvideAwsMetadataStorageLocationResponse) ProtoMessage() {}

func (x *ProvideAwsMetadataStorageLocationResponse) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ProvideAwsMetadataStorageLocationResponse.ProtoReflect.Descriptor instead.
func (*ProvideAwsMetadataStorageLocationResponse) Descriptor() ([]byte, []int) {
	return file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDescGZIP(), []int{1}
}

func (x *ProvideAwsMetadataStorageLocationResponse) GetTargetUrl() string {
	if x != nil {
		return x.TargetUrl
	}
	return ""
}

type GetAwsCrawlerConfigurationRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// only "aws-1.0" literal for now
	Version string `protobuf:"bytes,1,opt,name=version,proto3" json:"version,omitempty"`
	// 12-digit AWS account ID
	SourceAwsAccountId string `protobuf:"bytes,2,opt,name=source_aws_account_id,json=sourceAwsAccountId,proto3" json:"source_aws_account_id,omitempty"`
	// AWS region code
	SourceAwsRegion string `protobuf:"bytes,3,opt,name=source_aws_region,json=sourceAwsRegion,proto3" json:"source_aws_region,omitempty"`
}

func (x *GetAwsCrawlerConfigurationRequest) Reset() {
	*x = GetAwsCrawlerConfigurationRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetAwsCrawlerConfigurationRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetAwsCrawlerConfigurationRequest) ProtoMessage() {}

func (x *GetAwsCrawlerConfigurationRequest) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetAwsCrawlerConfigurationRequest.ProtoReflect.Descriptor instead.
func (*GetAwsCrawlerConfigurationRequest) Descriptor() ([]byte, []int) {
	return file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDescGZIP(), []int{2}
}

func (x *GetAwsCrawlerConfigurationRequest) GetVersion() string {
	if x != nil {
		return x.Version
	}
	return ""
}

func (x *GetAwsCrawlerConfigurationRequest) GetSourceAwsAccountId() string {
	if x != nil {
		return x.SourceAwsAccountId
	}
	return ""
}

func (x *GetAwsCrawlerConfigurationRequest) GetSourceAwsRegion() string {
	if x != nil {
		return x.SourceAwsRegion
	}
	return ""
}

type GetAwsCrawlerConfigurationResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Services string `protobuf:"bytes,1,opt,name=services,proto3" json:"services,omitempty"`
}

func (x *GetAwsCrawlerConfigurationResponse) Reset() {
	*x = GetAwsCrawlerConfigurationResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetAwsCrawlerConfigurationResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetAwsCrawlerConfigurationResponse) ProtoMessage() {}

func (x *GetAwsCrawlerConfigurationResponse) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetAwsCrawlerConfigurationResponse.ProtoReflect.Descriptor instead.
func (*GetAwsCrawlerConfigurationResponse) Descriptor() ([]byte, []int) {
	return file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDescGZIP(), []int{3}
}

func (x *GetAwsCrawlerConfigurationResponse) GetServices() string {
	if x != nil {
		return x.Services
	}
	return ""
}

var File_kentik_cloud_maps_v202201alpha1_cloud_maps_proto protoreflect.FileDescriptor

var file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDesc = []byte{
	0x0a, 0x30, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2f, 0x63, 0x6c, 0x6f, 0x75, 0x64, 0x5f, 0x6d,
	0x61, 0x70, 0x73, 0x2f, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x31, 0x61, 0x6c, 0x70, 0x68, 0x61,
	0x31, 0x2f, 0x63, 0x6c, 0x6f, 0x75, 0x64, 0x5f, 0x6d, 0x61, 0x70, 0x73, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x12, 0x1f, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x63, 0x6c, 0x6f, 0x75, 0x64,
	0x5f, 0x6d, 0x61, 0x70, 0x73, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x31, 0x61, 0x6c, 0x70,
	0x68, 0x61, 0x31, 0x1a, 0x15, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x61, 0x70, 0x69, 0x2f,
	0x68, 0x74, 0x74, 0x70, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x1c, 0x67, 0x6f, 0x6f, 0x67,
	0x6c, 0x65, 0x2f, 0x61, 0x70, 0x69, 0x2f, 0x61, 0x6e, 0x6e, 0x6f, 0x74, 0x61, 0x74, 0x69, 0x6f,
	0x6e, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x17, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65,
	0x2f, 0x61, 0x70, 0x69, 0x2f, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x1a, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x63, 0x2d, 0x67, 0x65, 0x6e, 0x2d, 0x6f, 0x70,
	0x65, 0x6e, 0x61, 0x70, 0x69, 0x76, 0x32, 0x2f, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2f,
	0x61, 0x6e, 0x6e, 0x6f, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x1a, 0x2b, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2f, 0x63, 0x6f, 0x72, 0x65, 0x2f, 0x76,
	0x32, 0x30, 0x32, 0x30, 0x31, 0x32, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2f, 0x61, 0x6e, 0x6e,
	0x6f, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0xa3,
	0x01, 0x0a, 0x28, 0x50, 0x72, 0x6f, 0x76, 0x69, 0x64, 0x65, 0x41, 0x77, 0x73, 0x4d, 0x65, 0x74,
	0x61, 0x64, 0x61, 0x74, 0x61, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x4c, 0x6f, 0x63, 0x61,
	0x74, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x18, 0x0a, 0x07, 0x76,
	0x65, 0x72, 0x73, 0x69, 0x6f, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x76, 0x65,
	0x72, 0x73, 0x69, 0x6f, 0x6e, 0x12, 0x31, 0x0a, 0x15, 0x73, 0x6f, 0x75, 0x72, 0x63, 0x65, 0x5f,
	0x61, 0x77, 0x73, 0x5f, 0x61, 0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x5f, 0x69, 0x64, 0x18, 0x02,
	0x20, 0x01, 0x28, 0x09, 0x52, 0x12, 0x73, 0x6f, 0x75, 0x72, 0x63, 0x65, 0x41, 0x77, 0x73, 0x41,
	0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x49, 0x64, 0x12, 0x2a, 0x0a, 0x11, 0x73, 0x6f, 0x75, 0x72,
	0x63, 0x65, 0x5f, 0x61, 0x77, 0x73, 0x5f, 0x72, 0x65, 0x67, 0x69, 0x6f, 0x6e, 0x18, 0x03, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x0f, 0x73, 0x6f, 0x75, 0x72, 0x63, 0x65, 0x41, 0x77, 0x73, 0x52, 0x65,
	0x67, 0x69, 0x6f, 0x6e, 0x22, 0x4a, 0x0a, 0x29, 0x50, 0x72, 0x6f, 0x76, 0x69, 0x64, 0x65, 0x41,
	0x77, 0x73, 0x4d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67,
	0x65, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x12, 0x1d, 0x0a, 0x0a, 0x74, 0x61, 0x72, 0x67, 0x65, 0x74, 0x5f, 0x75, 0x72, 0x6c, 0x18,
	0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x74, 0x61, 0x72, 0x67, 0x65, 0x74, 0x55, 0x72, 0x6c,
	0x22, 0x9c, 0x01, 0x0a, 0x21, 0x47, 0x65, 0x74, 0x41, 0x77, 0x73, 0x43, 0x72, 0x61, 0x77, 0x6c,
	0x65, 0x72, 0x43, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x75, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x18, 0x0a, 0x07, 0x76, 0x65, 0x72, 0x73, 0x69, 0x6f,
	0x6e, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x76, 0x65, 0x72, 0x73, 0x69, 0x6f, 0x6e,
	0x12, 0x31, 0x0a, 0x15, 0x73, 0x6f, 0x75, 0x72, 0x63, 0x65, 0x5f, 0x61, 0x77, 0x73, 0x5f, 0x61,
	0x63, 0x63, 0x6f, 0x75, 0x6e, 0x74, 0x5f, 0x69, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x12, 0x73, 0x6f, 0x75, 0x72, 0x63, 0x65, 0x41, 0x77, 0x73, 0x41, 0x63, 0x63, 0x6f, 0x75, 0x6e,
	0x74, 0x49, 0x64, 0x12, 0x2a, 0x0a, 0x11, 0x73, 0x6f, 0x75, 0x72, 0x63, 0x65, 0x5f, 0x61, 0x77,
	0x73, 0x5f, 0x72, 0x65, 0x67, 0x69, 0x6f, 0x6e, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0f,
	0x73, 0x6f, 0x75, 0x72, 0x63, 0x65, 0x41, 0x77, 0x73, 0x52, 0x65, 0x67, 0x69, 0x6f, 0x6e, 0x22,
	0x40, 0x0a, 0x22, 0x47, 0x65, 0x74, 0x41, 0x77, 0x73, 0x43, 0x72, 0x61, 0x77, 0x6c, 0x65, 0x72,
	0x43, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x75, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x73,
	0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x1a, 0x0a, 0x08, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65,
	0x73, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65,
	0x73, 0x32, 0xf1, 0x06, 0x0a, 0x10, 0x43, 0x6c, 0x6f, 0x75, 0x64, 0x4d, 0x61, 0x70, 0x73, 0x53,
	0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0xa8, 0x03, 0x0a, 0x21, 0x50, 0x72, 0x6f, 0x76, 0x69,
	0x64, 0x65, 0x41, 0x77, 0x73, 0x4d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0x53, 0x74, 0x6f,
	0x72, 0x61, 0x67, 0x65, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x12, 0x49, 0x2e, 0x6b,
	0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x63, 0x6c, 0x6f, 0x75, 0x64, 0x5f, 0x6d, 0x61, 0x70, 0x73,
	0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x31, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2e, 0x50,
	0x72, 0x6f, 0x76, 0x69, 0x64, 0x65, 0x41, 0x77, 0x73, 0x4d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74,
	0x61, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x4a, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b,
	0x2e, 0x63, 0x6c, 0x6f, 0x75, 0x64, 0x5f, 0x6d, 0x61, 0x70, 0x73, 0x2e, 0x76, 0x32, 0x30, 0x32,
	0x32, 0x30, 0x31, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2e, 0x50, 0x72, 0x6f, 0x76, 0x69, 0x64,
	0x65, 0x41, 0x77, 0x73, 0x4d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0x53, 0x74, 0x6f, 0x72,
	0x61, 0x67, 0x65, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x22, 0xeb, 0x01, 0x92, 0x41, 0x8d, 0x01, 0x12, 0x27, 0x50, 0x72, 0x6f, 0x76,
	0x69, 0x64, 0x65, 0x20, 0x6c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x20, 0x66, 0x6f, 0x72,
	0x20, 0x67, 0x69, 0x76, 0x65, 0x6e, 0x20, 0x41, 0x57, 0x53, 0x20, 0x6d, 0x65, 0x74, 0x61, 0x64,
	0x61, 0x74, 0x61, 0x1a, 0x46, 0x50, 0x72, 0x6f, 0x76, 0x69, 0x64, 0x65, 0x73, 0x20, 0x6c, 0x6f,
	0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x20, 0x61, 0x74, 0x20, 0x77, 0x68, 0x69, 0x63, 0x68, 0x20,
	0x74, 0x68, 0x65, 0x20, 0x41, 0x50, 0x49, 0x20, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x20, 0x6d,
	0x61, 0x79, 0x20, 0x73, 0x74, 0x6f, 0x72, 0x65, 0x20, 0x41, 0x57, 0x53, 0x20, 0x63, 0x6c, 0x6f,
	0x75, 0x64, 0x20, 0x6d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0x2a, 0x1a, 0x41, 0x77, 0x73,
	0x4d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x4c,
	0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0xf2, 0xd7, 0x02, 0x16, 0x61, 0x64, 0x6d, 0x69, 0x6e,
	0x2e, 0x63, 0x6c, 0x6f, 0x75, 0x64, 0x5f, 0x6d, 0x61, 0x70, 0x73, 0x3a, 0x77, 0x72, 0x69, 0x74,
	0x65, 0x82, 0xd3, 0xe4, 0x93, 0x02, 0x3a, 0x22, 0x35, 0x2f, 0x63, 0x6c, 0x6f, 0x75, 0x64, 0x5f,
	0x6d, 0x61, 0x70, 0x73, 0x2f, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x31, 0x61, 0x6c, 0x70, 0x68,
	0x61, 0x31, 0x2f, 0x69, 0x6e, 0x67, 0x65, 0x73, 0x74, 0x2f, 0x61, 0x77, 0x73, 0x5f, 0x73, 0x74,
	0x6f, 0x72, 0x61, 0x67, 0x65, 0x5f, 0x6c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x3a, 0x01,
	0x2a, 0x12, 0x85, 0x03, 0x0a, 0x1a, 0x47, 0x65, 0x74, 0x41, 0x77, 0x73, 0x43, 0x72, 0x61, 0x77,
	0x6c, 0x65, 0x72, 0x43, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x75, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e,
	0x12, 0x42, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x63, 0x6c, 0x6f, 0x75, 0x64, 0x5f,
	0x6d, 0x61, 0x70, 0x73, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x31, 0x61, 0x6c, 0x70, 0x68,
	0x61, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x41, 0x77, 0x73, 0x43, 0x72, 0x61, 0x77, 0x6c, 0x65, 0x72,
	0x43, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x75, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x71,
	0x75, 0x65, 0x73, 0x74, 0x1a, 0x43, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x63, 0x6c,
	0x6f, 0x75, 0x64, 0x5f, 0x6d, 0x61, 0x70, 0x73, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x31,
	0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2e, 0x47, 0x65, 0x74, 0x41, 0x77, 0x73, 0x43, 0x72, 0x61,
	0x77, 0x6c, 0x65, 0x72, 0x43, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x75, 0x72, 0x61, 0x74, 0x69, 0x6f,
	0x6e, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0xdd, 0x01, 0x92, 0x41, 0x83, 0x01,
	0x12, 0x1d, 0x47, 0x65, 0x74, 0x20, 0x41, 0x57, 0x53, 0x20, 0x63, 0x72, 0x61, 0x77, 0x6c, 0x65,
	0x72, 0x20, 0x63, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x75, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x1a,
	0x50, 0x47, 0x65, 0x74, 0x20, 0x41, 0x57, 0x53, 0x20, 0x63, 0x72, 0x61, 0x77, 0x6c, 0x65, 0x72,
	0x20, 0x63, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x75, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x20, 0x74,
	0x68, 0x61, 0x74, 0x20, 0x64, 0x65, 0x74, 0x65, 0x72, 0x6d, 0x69, 0x6e, 0x65, 0x73, 0x20, 0x77,
	0x68, 0x61, 0x74, 0x20, 0x41, 0x57, 0x53, 0x20, 0x63, 0x6c, 0x6f, 0x75, 0x64, 0x20, 0x6d, 0x65,
	0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0x20, 0x74, 0x6f, 0x20, 0x63, 0x6f, 0x6c, 0x6c, 0x65, 0x63,
	0x74, 0x2a, 0x10, 0x41, 0x77, 0x73, 0x43, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x75, 0x72, 0x61, 0x74,
	0x69, 0x6f, 0x6e, 0xf2, 0xd7, 0x02, 0x15, 0x61, 0x64, 0x6d, 0x69, 0x6e, 0x2e, 0x63, 0x6c, 0x6f,
	0x75, 0x64, 0x5f, 0x6d, 0x61, 0x70, 0x73, 0x3a, 0x72, 0x65, 0x61, 0x64, 0x82, 0xd3, 0xe4, 0x93,
	0x02, 0x37, 0x22, 0x32, 0x2f, 0x63, 0x6c, 0x6f, 0x75, 0x64, 0x5f, 0x6d, 0x61, 0x70, 0x73, 0x2f,
	0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x31, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2f, 0x69, 0x6e,
	0x67, 0x65, 0x73, 0x74, 0x2f, 0x61, 0x77, 0x73, 0x5f, 0x63, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x75,
	0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x3a, 0x01, 0x2a, 0x1a, 0x2a, 0xca, 0x41, 0x13, 0x67, 0x72,
	0x70, 0x63, 0x2e, 0x61, 0x70, 0x69, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x63, 0x6f,
	0x6d, 0xea, 0xd7, 0x02, 0x10, 0x61, 0x64, 0x6d, 0x69, 0x6e, 0x2e, 0x63, 0x6c, 0x6f, 0x75, 0x64,
	0x5f, 0x6d, 0x61, 0x70, 0x73, 0x42, 0xca, 0x02, 0x5a, 0x4e, 0x67, 0x69, 0x74, 0x68, 0x75, 0x62,
	0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2f, 0x61, 0x70, 0x69, 0x2d,
	0x73, 0x63, 0x68, 0x65, 0x6d, 0x61, 0x2f, 0x67, 0x65, 0x6e, 0x2f, 0x67, 0x6f, 0x2f, 0x6b, 0x65,
	0x6e, 0x74, 0x69, 0x6b, 0x2f, 0x63, 0x6c, 0x6f, 0x75, 0x64, 0x5f, 0x6d, 0x61, 0x70, 0x73, 0x2f,
	0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x31, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x3b, 0x63, 0x6c,
	0x6f, 0x75, 0x64, 0x5f, 0x6d, 0x61, 0x70, 0x73, 0x92, 0x41, 0xf6, 0x01, 0x12, 0x38, 0x0a, 0x0e,
	0x43, 0x6c, 0x6f, 0x75, 0x64, 0x20, 0x4d, 0x61, 0x70, 0x73, 0x20, 0x41, 0x50, 0x49, 0x22, 0x18,
	0x0a, 0x16, 0x4b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x20, 0x41, 0x50, 0x49, 0x20, 0x45, 0x6e, 0x67,
	0x69, 0x6e, 0x65, 0x65, 0x72, 0x69, 0x6e, 0x67, 0x32, 0x0c, 0x32, 0x30, 0x32, 0x32, 0x30, 0x31,
	0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2a, 0x01, 0x02, 0x32, 0x10, 0x61, 0x70, 0x70, 0x6c, 0x69,
	0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x2f, 0x6a, 0x73, 0x6f, 0x6e, 0x3a, 0x10, 0x61, 0x70, 0x70,
	0x6c, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x2f, 0x6a, 0x73, 0x6f, 0x6e, 0x5a, 0x44, 0x0a,
	0x1e, 0x0a, 0x05, 0x65, 0x6d, 0x61, 0x69, 0x6c, 0x12, 0x15, 0x08, 0x02, 0x1a, 0x0f, 0x58, 0x2d,
	0x43, 0x48, 0x2d, 0x41, 0x75, 0x74, 0x68, 0x2d, 0x45, 0x6d, 0x61, 0x69, 0x6c, 0x20, 0x02, 0x0a,
	0x22, 0x0a, 0x05, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x12, 0x19, 0x08, 0x02, 0x1a, 0x13, 0x58, 0x2d,
	0x43, 0x48, 0x2d, 0x41, 0x75, 0x74, 0x68, 0x2d, 0x41, 0x50, 0x49, 0x2d, 0x54, 0x6f, 0x6b, 0x65,
	0x6e, 0x20, 0x02, 0x62, 0x16, 0x0a, 0x09, 0x0a, 0x05, 0x65, 0x6d, 0x61, 0x69, 0x6c, 0x12, 0x00,
	0x0a, 0x09, 0x0a, 0x05, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x12, 0x00, 0x72, 0x35, 0x0a, 0x16, 0x4d,
	0x6f, 0x72, 0x65, 0x20, 0x61, 0x62, 0x6f, 0x75, 0x74, 0x20, 0x4b, 0x65, 0x6e, 0x74, 0x69, 0x6b,
	0x20, 0x41, 0x50, 0x49, 0x73, 0x12, 0x1b, 0x68, 0x74, 0x74, 0x70, 0x73, 0x3a, 0x2f, 0x2f, 0x64,
	0x6f, 0x63, 0x73, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x61,
	0x70, 0x69, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDescOnce sync.Once
	file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDescData = file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDesc
)

func file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDescGZIP() []byte {
	file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDescOnce.Do(func() {
		file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDescData = protoimpl.X.CompressGZIP(file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDescData)
	})
	return file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDescData
}

var file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes = make([]protoimpl.MessageInfo, 4)
var file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_goTypes = []interface{}{
	(*ProvideAwsMetadataStorageLocationRequest)(nil),  // 0: kentik.cloud_maps.v202201alpha1.ProvideAwsMetadataStorageLocationRequest
	(*ProvideAwsMetadataStorageLocationResponse)(nil), // 1: kentik.cloud_maps.v202201alpha1.ProvideAwsMetadataStorageLocationResponse
	(*GetAwsCrawlerConfigurationRequest)(nil),         // 2: kentik.cloud_maps.v202201alpha1.GetAwsCrawlerConfigurationRequest
	(*GetAwsCrawlerConfigurationResponse)(nil),        // 3: kentik.cloud_maps.v202201alpha1.GetAwsCrawlerConfigurationResponse
}
var file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_depIdxs = []int32{
	0, // 0: kentik.cloud_maps.v202201alpha1.CloudMapsService.ProvideAwsMetadataStorageLocation:input_type -> kentik.cloud_maps.v202201alpha1.ProvideAwsMetadataStorageLocationRequest
	2, // 1: kentik.cloud_maps.v202201alpha1.CloudMapsService.GetAwsCrawlerConfiguration:input_type -> kentik.cloud_maps.v202201alpha1.GetAwsCrawlerConfigurationRequest
	1, // 2: kentik.cloud_maps.v202201alpha1.CloudMapsService.ProvideAwsMetadataStorageLocation:output_type -> kentik.cloud_maps.v202201alpha1.ProvideAwsMetadataStorageLocationResponse
	3, // 3: kentik.cloud_maps.v202201alpha1.CloudMapsService.GetAwsCrawlerConfiguration:output_type -> kentik.cloud_maps.v202201alpha1.GetAwsCrawlerConfigurationResponse
	2, // [2:4] is the sub-list for method output_type
	0, // [0:2] is the sub-list for method input_type
	0, // [0:0] is the sub-list for extension type_name
	0, // [0:0] is the sub-list for extension extendee
	0, // [0:0] is the sub-list for field type_name
}

func init() { file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_init() }
func file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_init() {
	if File_kentik_cloud_maps_v202201alpha1_cloud_maps_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ProvideAwsMetadataStorageLocationRequest); i {
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
		file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ProvideAwsMetadataStorageLocationResponse); i {
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
		file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetAwsCrawlerConfigurationRequest); i {
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
		file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetAwsCrawlerConfigurationResponse); i {
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
			RawDescriptor: file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   4,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_goTypes,
		DependencyIndexes: file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_depIdxs,
		MessageInfos:      file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_msgTypes,
	}.Build()
	File_kentik_cloud_maps_v202201alpha1_cloud_maps_proto = out.File
	file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_rawDesc = nil
	file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_goTypes = nil
	file_kentik_cloud_maps_v202201alpha1_cloud_maps_proto_depIdxs = nil
}
