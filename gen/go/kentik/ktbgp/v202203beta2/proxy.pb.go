// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.25.0
// 	protoc        (unknown)
// source: kentik/ktbgp/v202203beta2/proxy.proto

package ktbgp

import (
	proto "github.com/golang/protobuf/proto"
	_ "github.com/kentik/api-schema-public/gen/go/kentik/core/v202012alpha1"
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

// ControlAction is used to signal Control() actions, such as blocking devices
type ControlAction int32

const (
	ControlAction_CONTROL_ACTION_UNSPECIFIED ControlAction = 0 // carry on, all good
	ControlAction_CONTROL_ACTION_BLOCK_IP    ControlAction = 1 // deny access, block all connections from proto + device_ip
)

// Enum value maps for ControlAction.
var (
	ControlAction_name = map[int32]string{
		0: "CONTROL_ACTION_UNSPECIFIED",
		1: "CONTROL_ACTION_BLOCK_IP",
	}
	ControlAction_value = map[string]int32{
		"CONTROL_ACTION_UNSPECIFIED": 0,
		"CONTROL_ACTION_BLOCK_IP":    1,
	}
)

func (x ControlAction) Enum() *ControlAction {
	p := new(ControlAction)
	*p = x
	return p
}

func (x ControlAction) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (ControlAction) Descriptor() protoreflect.EnumDescriptor {
	return file_kentik_ktbgp_v202203beta2_proxy_proto_enumTypes[0].Descriptor()
}

func (ControlAction) Type() protoreflect.EnumType {
	return &file_kentik_ktbgp_v202203beta2_proxy_proto_enumTypes[0]
}

func (x ControlAction) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use ControlAction.Descriptor instead.
func (ControlAction) EnumDescriptor() ([]byte, []int) {
	return file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescGZIP(), []int{0}
}

// DataAction is used to signal Data() actions, such as killing the session
type DataAction int32

const (
	DataAction_DATA_ACTION_UNSPECIFIED DataAction = 0 // no event, all good, carry on
	DataAction_DATA_ACTION_KILL        DataAction = 1 // kill the proxied connection
	DataAction_DATA_ACTION_RESTART     DataAction = 2 // graceful restart of the gRPC stream
)

// Enum value maps for DataAction.
var (
	DataAction_name = map[int32]string{
		0: "DATA_ACTION_UNSPECIFIED",
		1: "DATA_ACTION_KILL",
		2: "DATA_ACTION_RESTART",
	}
	DataAction_value = map[string]int32{
		"DATA_ACTION_UNSPECIFIED": 0,
		"DATA_ACTION_KILL":        1,
		"DATA_ACTION_RESTART":     2,
	}
)

func (x DataAction) Enum() *DataAction {
	p := new(DataAction)
	*p = x
	return p
}

func (x DataAction) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (DataAction) Descriptor() protoreflect.EnumDescriptor {
	return file_kentik_ktbgp_v202203beta2_proxy_proto_enumTypes[1].Descriptor()
}

func (DataAction) Type() protoreflect.EnumType {
	return &file_kentik_ktbgp_v202203beta2_proxy_proto_enumTypes[1]
}

func (x DataAction) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use DataAction.Descriptor instead.
func (DataAction) EnumDescriptor() ([]byte, []int) {
	return file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescGZIP(), []int{1}
}

// ControlRequest represents a new connection from customer device (already accepted or attempted by the customer)
type ControlRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// the 5-tuple
	Proto      string `protobuf:"bytes,1,opt,name=proto,proto3" json:"proto,omitempty"`                              // app protocol (eg. "BGP")
	DeviceIp   string `protobuf:"bytes,2,opt,name=device_ip,json=deviceIp,proto3" json:"device_ip,omitempty"`        // customer device's (internal) IP address
	DevicePort uint32 `protobuf:"varint,3,opt,name=device_port,json=devicePort,proto3" json:"device_port,omitempty"` // customer device's port number
	ProxyIp    string `protobuf:"bytes,4,opt,name=proxy_ip,json=proxyIp,proto3" json:"proxy_ip,omitempty"`           // proxy's (internal) IP address
	ProxyPort  uint32 `protobuf:"varint,5,opt,name=proxy_port,json=proxyPort,proto3" json:"proxy_port,omitempty"`    // proxy's destination TCP/IP port number
}

func (x *ControlRequest) Reset() {
	*x = ControlRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ControlRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ControlRequest) ProtoMessage() {}

func (x *ControlRequest) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ControlRequest.ProtoReflect.Descriptor instead.
func (*ControlRequest) Descriptor() ([]byte, []int) {
	return file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescGZIP(), []int{0}
}

func (x *ControlRequest) GetProto() string {
	if x != nil {
		return x.Proto
	}
	return ""
}

func (x *ControlRequest) GetDeviceIp() string {
	if x != nil {
		return x.DeviceIp
	}
	return ""
}

func (x *ControlRequest) GetDevicePort() uint32 {
	if x != nil {
		return x.DevicePort
	}
	return 0
}

func (x *ControlRequest) GetProxyIp() string {
	if x != nil {
		return x.ProxyIp
	}
	return ""
}

func (x *ControlRequest) GetProxyPort() uint32 {
	if x != nil {
		return x.ProxyPort
	}
	return 0
}

// ControlResponse provides parameters for establishing a proxy forwarding session to a customer device
type ControlResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// the 5-tuple
	Proto      string `protobuf:"bytes,1,opt,name=proto,proto3" json:"proto,omitempty"`                              // app protocol (eg. "BGP")
	DeviceIp   string `protobuf:"bytes,2,opt,name=device_ip,json=deviceIp,proto3" json:"device_ip,omitempty"`        // customer device's (internal) IP address
	DevicePort uint32 `protobuf:"varint,3,opt,name=device_port,json=devicePort,proto3" json:"device_port,omitempty"` // customer device's port number
	ProxyIp    string `protobuf:"bytes,4,opt,name=proxy_ip,json=proxyIp,proto3" json:"proxy_ip,omitempty"`           // proxy's (internal) IP address
	ProxyPort  uint32 `protobuf:"varint,5,opt,name=proxy_port,json=proxyPort,proto3" json:"proxy_port,omitempty"`    // proxy's destination TCP/IP port number
	// params for the terminator (internal use)
	TtlSeconds uint32        `protobuf:"varint,6,opt,name=ttl_seconds,json=ttlSeconds,proto3" json:"ttl_seconds,omitempty"`                    // how long to use this response (seconds); 0 means no caching
	TtlCounter uint32        `protobuf:"varint,7,opt,name=ttl_counter,json=ttlCounter,proto3" json:"ttl_counter,omitempty"`                    // how many times the cache can return this response; 0 means no limit
	Action     ControlAction `protobuf:"varint,8,opt,name=action,proto3,enum=kentik.ktbgp.v202203beta2.ControlAction" json:"action,omitempty"` // should we make any action different than the default?
	Metadata   []*KeyVal     `protobuf:"bytes,9,rep,name=metadata,proto3" json:"metadata,omitempty"`                                           // client MUST set this gRPC metadata for Data() calls
	// params for the connection
	CompanyId  uint32 `protobuf:"varint,10,opt,name=company_id,json=companyId,proto3" json:"company_id,omitempty"`   // company id
	DeviceId   uint32 `protobuf:"varint,11,opt,name=device_id,json=deviceId,proto3" json:"device_id,omitempty"`      // customer device's id
	DeviceName string `protobuf:"bytes,12,opt,name=device_name,json=deviceName,proto3" json:"device_name,omitempty"` // customer device's name
	TcpMd5     []byte `protobuf:"bytes,13,opt,name=tcp_md5,json=tcpMd5,proto3" json:"tcp_md5,omitempty"`             // TCP-MD5 key (optional)
}

func (x *ControlResponse) Reset() {
	*x = ControlResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ControlResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ControlResponse) ProtoMessage() {}

func (x *ControlResponse) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ControlResponse.ProtoReflect.Descriptor instead.
func (*ControlResponse) Descriptor() ([]byte, []int) {
	return file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescGZIP(), []int{1}
}

func (x *ControlResponse) GetProto() string {
	if x != nil {
		return x.Proto
	}
	return ""
}

func (x *ControlResponse) GetDeviceIp() string {
	if x != nil {
		return x.DeviceIp
	}
	return ""
}

func (x *ControlResponse) GetDevicePort() uint32 {
	if x != nil {
		return x.DevicePort
	}
	return 0
}

func (x *ControlResponse) GetProxyIp() string {
	if x != nil {
		return x.ProxyIp
	}
	return ""
}

func (x *ControlResponse) GetProxyPort() uint32 {
	if x != nil {
		return x.ProxyPort
	}
	return 0
}

func (x *ControlResponse) GetTtlSeconds() uint32 {
	if x != nil {
		return x.TtlSeconds
	}
	return 0
}

func (x *ControlResponse) GetTtlCounter() uint32 {
	if x != nil {
		return x.TtlCounter
	}
	return 0
}

func (x *ControlResponse) GetAction() ControlAction {
	if x != nil {
		return x.Action
	}
	return ControlAction_CONTROL_ACTION_UNSPECIFIED
}

func (x *ControlResponse) GetMetadata() []*KeyVal {
	if x != nil {
		return x.Metadata
	}
	return nil
}

func (x *ControlResponse) GetCompanyId() uint32 {
	if x != nil {
		return x.CompanyId
	}
	return 0
}

func (x *ControlResponse) GetDeviceId() uint32 {
	if x != nil {
		return x.DeviceId
	}
	return 0
}

func (x *ControlResponse) GetDeviceName() string {
	if x != nil {
		return x.DeviceName
	}
	return ""
}

func (x *ControlResponse) GetTcpMd5() []byte {
	if x != nil {
		return x.TcpMd5
	}
	return nil
}

// KeyVal is a key-value(s) pair
// gRPC key-val metadata is represented as HTTP/2 headers
type KeyVal struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Key string   `protobuf:"bytes,1,opt,name=key,proto3" json:"key,omitempty"`
	Val []string `protobuf:"bytes,2,rep,name=val,proto3" json:"val,omitempty"`
}

func (x *KeyVal) Reset() {
	*x = KeyVal{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *KeyVal) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*KeyVal) ProtoMessage() {}

func (x *KeyVal) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use KeyVal.ProtoReflect.Descriptor instead.
func (*KeyVal) Descriptor() ([]byte, []int) {
	return file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescGZIP(), []int{2}
}

func (x *KeyVal) GetKey() string {
	if x != nil {
		return x.Key
	}
	return ""
}

func (x *KeyVal) GetVal() []string {
	if x != nil {
		return x.Val
	}
	return nil
}

// DataRequest holds bytes received from device that should be sent to the SaaS side
type DataRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Action DataAction `protobuf:"varint,1,opt,name=action,proto3,enum=kentik.ktbgp.v202203beta2.DataAction" json:"action,omitempty"` // if not 0, signals an event
	Data   [][]byte   `protobuf:"bytes,2,rep,name=data,proto3" json:"data,omitempty"`                                                // raw data bytes
}

func (x *DataRequest) Reset() {
	*x = DataRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DataRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DataRequest) ProtoMessage() {}

func (x *DataRequest) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DataRequest.ProtoReflect.Descriptor instead.
func (*DataRequest) Descriptor() ([]byte, []int) {
	return file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescGZIP(), []int{3}
}

func (x *DataRequest) GetAction() DataAction {
	if x != nil {
		return x.Action
	}
	return DataAction_DATA_ACTION_UNSPECIFIED
}

func (x *DataRequest) GetData() [][]byte {
	if x != nil {
		return x.Data
	}
	return nil
}

// DataResponse holds bytes received from SaaS that should be sent to the device
type DataResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Action DataAction `protobuf:"varint,1,opt,name=action,proto3,enum=kentik.ktbgp.v202203beta2.DataAction" json:"action,omitempty"` // if not 0, signals an event
	Data   [][]byte   `protobuf:"bytes,2,rep,name=data,proto3" json:"data,omitempty"`                                                // raw data bytes
}

func (x *DataResponse) Reset() {
	*x = DataResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DataResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DataResponse) ProtoMessage() {}

func (x *DataResponse) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DataResponse.ProtoReflect.Descriptor instead.
func (*DataResponse) Descriptor() ([]byte, []int) {
	return file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescGZIP(), []int{4}
}

func (x *DataResponse) GetAction() DataAction {
	if x != nil {
		return x.Action
	}
	return DataAction_DATA_ACTION_UNSPECIFIED
}

func (x *DataResponse) GetData() [][]byte {
	if x != nil {
		return x.Data
	}
	return nil
}

var File_kentik_ktbgp_v202203beta2_proxy_proto protoreflect.FileDescriptor

var file_kentik_ktbgp_v202203beta2_proxy_proto_rawDesc = []byte{
	0x0a, 0x25, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2f, 0x6b, 0x74, 0x62, 0x67, 0x70, 0x2f, 0x76,
	0x32, 0x30, 0x32, 0x32, 0x30, 0x33, 0x62, 0x65, 0x74, 0x61, 0x32, 0x2f, 0x70, 0x72, 0x6f, 0x78,
	0x79, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x19, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e,
	0x6b, 0x74, 0x62, 0x67, 0x70, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x33, 0x62, 0x65, 0x74,
	0x61, 0x32, 0x1a, 0x2b, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2f, 0x63, 0x6f, 0x72, 0x65, 0x2f,
	0x76, 0x32, 0x30, 0x32, 0x30, 0x31, 0x32, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2f, 0x61, 0x6e,
	0x6e, 0x6f, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22,
	0x9e, 0x01, 0x0a, 0x0e, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x12, 0x14, 0x0a, 0x05, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x18, 0x01, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x05, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x1b, 0x0a, 0x09, 0x64, 0x65, 0x76, 0x69,
	0x63, 0x65, 0x5f, 0x69, 0x70, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x64, 0x65, 0x76,
	0x69, 0x63, 0x65, 0x49, 0x70, 0x12, 0x1f, 0x0a, 0x0b, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x5f,
	0x70, 0x6f, 0x72, 0x74, 0x18, 0x03, 0x20, 0x01, 0x28, 0x0d, 0x52, 0x0a, 0x64, 0x65, 0x76, 0x69,
	0x63, 0x65, 0x50, 0x6f, 0x72, 0x74, 0x12, 0x19, 0x0a, 0x08, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x5f,
	0x69, 0x70, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x49,
	0x70, 0x12, 0x1d, 0x0a, 0x0a, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x5f, 0x70, 0x6f, 0x72, 0x74, 0x18,
	0x05, 0x20, 0x01, 0x28, 0x0d, 0x52, 0x09, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x50, 0x6f, 0x72, 0x74,
	0x22, 0xd8, 0x03, 0x0a, 0x0f, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x73, 0x65, 0x12, 0x14, 0x0a, 0x05, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x05, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x1b, 0x0a, 0x09, 0x64, 0x65,
	0x76, 0x69, 0x63, 0x65, 0x5f, 0x69, 0x70, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x64,
	0x65, 0x76, 0x69, 0x63, 0x65, 0x49, 0x70, 0x12, 0x1f, 0x0a, 0x0b, 0x64, 0x65, 0x76, 0x69, 0x63,
	0x65, 0x5f, 0x70, 0x6f, 0x72, 0x74, 0x18, 0x03, 0x20, 0x01, 0x28, 0x0d, 0x52, 0x0a, 0x64, 0x65,
	0x76, 0x69, 0x63, 0x65, 0x50, 0x6f, 0x72, 0x74, 0x12, 0x19, 0x0a, 0x08, 0x70, 0x72, 0x6f, 0x78,
	0x79, 0x5f, 0x69, 0x70, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x70, 0x72, 0x6f, 0x78,
	0x79, 0x49, 0x70, 0x12, 0x1d, 0x0a, 0x0a, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x5f, 0x70, 0x6f, 0x72,
	0x74, 0x18, 0x05, 0x20, 0x01, 0x28, 0x0d, 0x52, 0x09, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x50, 0x6f,
	0x72, 0x74, 0x12, 0x1f, 0x0a, 0x0b, 0x74, 0x74, 0x6c, 0x5f, 0x73, 0x65, 0x63, 0x6f, 0x6e, 0x64,
	0x73, 0x18, 0x06, 0x20, 0x01, 0x28, 0x0d, 0x52, 0x0a, 0x74, 0x74, 0x6c, 0x53, 0x65, 0x63, 0x6f,
	0x6e, 0x64, 0x73, 0x12, 0x1f, 0x0a, 0x0b, 0x74, 0x74, 0x6c, 0x5f, 0x63, 0x6f, 0x75, 0x6e, 0x74,
	0x65, 0x72, 0x18, 0x07, 0x20, 0x01, 0x28, 0x0d, 0x52, 0x0a, 0x74, 0x74, 0x6c, 0x43, 0x6f, 0x75,
	0x6e, 0x74, 0x65, 0x72, 0x12, 0x40, 0x0a, 0x06, 0x61, 0x63, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x08,
	0x20, 0x01, 0x28, 0x0e, 0x32, 0x28, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x6b, 0x74,
	0x62, 0x67, 0x70, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x33, 0x62, 0x65, 0x74, 0x61, 0x32,
	0x2e, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x41, 0x63, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x06,
	0x61, 0x63, 0x74, 0x69, 0x6f, 0x6e, 0x12, 0x3d, 0x0a, 0x08, 0x6d, 0x65, 0x74, 0x61, 0x64, 0x61,
	0x74, 0x61, 0x18, 0x09, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x21, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69,
	0x6b, 0x2e, 0x6b, 0x74, 0x62, 0x67, 0x70, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x33, 0x62,
	0x65, 0x74, 0x61, 0x32, 0x2e, 0x4b, 0x65, 0x79, 0x56, 0x61, 0x6c, 0x52, 0x08, 0x6d, 0x65, 0x74,
	0x61, 0x64, 0x61, 0x74, 0x61, 0x12, 0x1d, 0x0a, 0x0a, 0x63, 0x6f, 0x6d, 0x70, 0x61, 0x6e, 0x79,
	0x5f, 0x69, 0x64, 0x18, 0x0a, 0x20, 0x01, 0x28, 0x0d, 0x52, 0x09, 0x63, 0x6f, 0x6d, 0x70, 0x61,
	0x6e, 0x79, 0x49, 0x64, 0x12, 0x1b, 0x0a, 0x09, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x5f, 0x69,
	0x64, 0x18, 0x0b, 0x20, 0x01, 0x28, 0x0d, 0x52, 0x08, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x49,
	0x64, 0x12, 0x1f, 0x0a, 0x0b, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x5f, 0x6e, 0x61, 0x6d, 0x65,
	0x18, 0x0c, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0a, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x4e, 0x61,
	0x6d, 0x65, 0x12, 0x17, 0x0a, 0x07, 0x74, 0x63, 0x70, 0x5f, 0x6d, 0x64, 0x35, 0x18, 0x0d, 0x20,
	0x01, 0x28, 0x0c, 0x52, 0x06, 0x74, 0x63, 0x70, 0x4d, 0x64, 0x35, 0x22, 0x2c, 0x0a, 0x06, 0x4b,
	0x65, 0x79, 0x56, 0x61, 0x6c, 0x12, 0x10, 0x0a, 0x03, 0x6b, 0x65, 0x79, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x03, 0x6b, 0x65, 0x79, 0x12, 0x10, 0x0a, 0x03, 0x76, 0x61, 0x6c, 0x18, 0x02,
	0x20, 0x03, 0x28, 0x09, 0x52, 0x03, 0x76, 0x61, 0x6c, 0x22, 0x60, 0x0a, 0x0b, 0x44, 0x61, 0x74,
	0x61, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x3d, 0x0a, 0x06, 0x61, 0x63, 0x74, 0x69,
	0x6f, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0e, 0x32, 0x25, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69,
	0x6b, 0x2e, 0x6b, 0x74, 0x62, 0x67, 0x70, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x33, 0x62,
	0x65, 0x74, 0x61, 0x32, 0x2e, 0x44, 0x61, 0x74, 0x61, 0x41, 0x63, 0x74, 0x69, 0x6f, 0x6e, 0x52,
	0x06, 0x61, 0x63, 0x74, 0x69, 0x6f, 0x6e, 0x12, 0x12, 0x0a, 0x04, 0x64, 0x61, 0x74, 0x61, 0x18,
	0x02, 0x20, 0x03, 0x28, 0x0c, 0x52, 0x04, 0x64, 0x61, 0x74, 0x61, 0x22, 0x61, 0x0a, 0x0c, 0x44,
	0x61, 0x74, 0x61, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x3d, 0x0a, 0x06, 0x61,
	0x63, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0e, 0x32, 0x25, 0x2e, 0x6b, 0x65,
	0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x6b, 0x74, 0x62, 0x67, 0x70, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32,
	0x30, 0x33, 0x62, 0x65, 0x74, 0x61, 0x32, 0x2e, 0x44, 0x61, 0x74, 0x61, 0x41, 0x63, 0x74, 0x69,
	0x6f, 0x6e, 0x52, 0x06, 0x61, 0x63, 0x74, 0x69, 0x6f, 0x6e, 0x12, 0x12, 0x0a, 0x04, 0x64, 0x61,
	0x74, 0x61, 0x18, 0x02, 0x20, 0x03, 0x28, 0x0c, 0x52, 0x04, 0x64, 0x61, 0x74, 0x61, 0x2a, 0x4c,
	0x0a, 0x0d, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x41, 0x63, 0x74, 0x69, 0x6f, 0x6e, 0x12,
	0x1e, 0x0a, 0x1a, 0x43, 0x4f, 0x4e, 0x54, 0x52, 0x4f, 0x4c, 0x5f, 0x41, 0x43, 0x54, 0x49, 0x4f,
	0x4e, 0x5f, 0x55, 0x4e, 0x53, 0x50, 0x45, 0x43, 0x49, 0x46, 0x49, 0x45, 0x44, 0x10, 0x00, 0x12,
	0x1b, 0x0a, 0x17, 0x43, 0x4f, 0x4e, 0x54, 0x52, 0x4f, 0x4c, 0x5f, 0x41, 0x43, 0x54, 0x49, 0x4f,
	0x4e, 0x5f, 0x42, 0x4c, 0x4f, 0x43, 0x4b, 0x5f, 0x49, 0x50, 0x10, 0x01, 0x2a, 0x58, 0x0a, 0x0a,
	0x44, 0x61, 0x74, 0x61, 0x41, 0x63, 0x74, 0x69, 0x6f, 0x6e, 0x12, 0x1b, 0x0a, 0x17, 0x44, 0x41,
	0x54, 0x41, 0x5f, 0x41, 0x43, 0x54, 0x49, 0x4f, 0x4e, 0x5f, 0x55, 0x4e, 0x53, 0x50, 0x45, 0x43,
	0x49, 0x46, 0x49, 0x45, 0x44, 0x10, 0x00, 0x12, 0x14, 0x0a, 0x10, 0x44, 0x41, 0x54, 0x41, 0x5f,
	0x41, 0x43, 0x54, 0x49, 0x4f, 0x4e, 0x5f, 0x4b, 0x49, 0x4c, 0x4c, 0x10, 0x01, 0x12, 0x17, 0x0a,
	0x13, 0x44, 0x41, 0x54, 0x41, 0x5f, 0x41, 0x43, 0x54, 0x49, 0x4f, 0x4e, 0x5f, 0x52, 0x45, 0x53,
	0x54, 0x41, 0x52, 0x54, 0x10, 0x02, 0x32, 0x8f, 0x02, 0x0a, 0x0c, 0x50, 0x72, 0x6f, 0x78, 0x79,
	0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x7a, 0x0a, 0x07, 0x43, 0x6f, 0x6e, 0x74, 0x72,
	0x6f, 0x6c, 0x12, 0x29, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x6b, 0x74, 0x62, 0x67,
	0x70, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x33, 0x62, 0x65, 0x74, 0x61, 0x32, 0x2e, 0x43,
	0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x2a, 0x2e,
	0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x6b, 0x74, 0x62, 0x67, 0x70, 0x2e, 0x76, 0x32, 0x30,
	0x32, 0x32, 0x30, 0x33, 0x62, 0x65, 0x74, 0x61, 0x32, 0x2e, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f,
	0x6c, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x14, 0xf2, 0xd7, 0x02, 0x10, 0x6b,
	0x74, 0x62, 0x67, 0x70, 0x2e, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x3a, 0x72, 0x65, 0x61, 0x64, 0x28,
	0x01, 0x30, 0x01, 0x12, 0x72, 0x0a, 0x04, 0x44, 0x61, 0x74, 0x61, 0x12, 0x26, 0x2e, 0x6b, 0x65,
	0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x6b, 0x74, 0x62, 0x67, 0x70, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32,
	0x30, 0x33, 0x62, 0x65, 0x74, 0x61, 0x32, 0x2e, 0x44, 0x61, 0x74, 0x61, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x1a, 0x27, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x6b, 0x74, 0x62,
	0x67, 0x70, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x33, 0x62, 0x65, 0x74, 0x61, 0x32, 0x2e,
	0x44, 0x61, 0x74, 0x61, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x15, 0xf2, 0xd7,
	0x02, 0x11, 0x6b, 0x74, 0x62, 0x67, 0x70, 0x2e, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x3a, 0x77, 0x72,
	0x69, 0x74, 0x65, 0x28, 0x01, 0x30, 0x01, 0x1a, 0x0f, 0xea, 0xd7, 0x02, 0x0b, 0x6b, 0x74, 0x62,
	0x67, 0x70, 0x2e, 0x70, 0x72, 0x6f, 0x78, 0x79, 0x42, 0x45, 0x5a, 0x43, 0x67, 0x69, 0x74, 0x68,
	0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2f, 0x61, 0x70,
	0x69, 0x2d, 0x73, 0x63, 0x68, 0x65, 0x6d, 0x61, 0x2f, 0x67, 0x65, 0x6e, 0x2f, 0x67, 0x6f, 0x2f,
	0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2f, 0x6b, 0x74, 0x62, 0x67, 0x70, 0x2f, 0x76, 0x32, 0x30,
	0x32, 0x32, 0x30, 0x33, 0x62, 0x65, 0x74, 0x61, 0x32, 0x3b, 0x6b, 0x74, 0x62, 0x67, 0x70, 0x62,
	0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescOnce sync.Once
	file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescData = file_kentik_ktbgp_v202203beta2_proxy_proto_rawDesc
)

func file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescGZIP() []byte {
	file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescOnce.Do(func() {
		file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescData = protoimpl.X.CompressGZIP(file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescData)
	})
	return file_kentik_ktbgp_v202203beta2_proxy_proto_rawDescData
}

var file_kentik_ktbgp_v202203beta2_proxy_proto_enumTypes = make([]protoimpl.EnumInfo, 2)
var file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes = make([]protoimpl.MessageInfo, 5)
var file_kentik_ktbgp_v202203beta2_proxy_proto_goTypes = []interface{}{
	(ControlAction)(0),      // 0: kentik.ktbgp.v202203beta2.ControlAction
	(DataAction)(0),         // 1: kentik.ktbgp.v202203beta2.DataAction
	(*ControlRequest)(nil),  // 2: kentik.ktbgp.v202203beta2.ControlRequest
	(*ControlResponse)(nil), // 3: kentik.ktbgp.v202203beta2.ControlResponse
	(*KeyVal)(nil),          // 4: kentik.ktbgp.v202203beta2.KeyVal
	(*DataRequest)(nil),     // 5: kentik.ktbgp.v202203beta2.DataRequest
	(*DataResponse)(nil),    // 6: kentik.ktbgp.v202203beta2.DataResponse
}
var file_kentik_ktbgp_v202203beta2_proxy_proto_depIdxs = []int32{
	0, // 0: kentik.ktbgp.v202203beta2.ControlResponse.action:type_name -> kentik.ktbgp.v202203beta2.ControlAction
	4, // 1: kentik.ktbgp.v202203beta2.ControlResponse.metadata:type_name -> kentik.ktbgp.v202203beta2.KeyVal
	1, // 2: kentik.ktbgp.v202203beta2.DataRequest.action:type_name -> kentik.ktbgp.v202203beta2.DataAction
	1, // 3: kentik.ktbgp.v202203beta2.DataResponse.action:type_name -> kentik.ktbgp.v202203beta2.DataAction
	2, // 4: kentik.ktbgp.v202203beta2.ProxyService.Control:input_type -> kentik.ktbgp.v202203beta2.ControlRequest
	5, // 5: kentik.ktbgp.v202203beta2.ProxyService.Data:input_type -> kentik.ktbgp.v202203beta2.DataRequest
	3, // 6: kentik.ktbgp.v202203beta2.ProxyService.Control:output_type -> kentik.ktbgp.v202203beta2.ControlResponse
	6, // 7: kentik.ktbgp.v202203beta2.ProxyService.Data:output_type -> kentik.ktbgp.v202203beta2.DataResponse
	6, // [6:8] is the sub-list for method output_type
	4, // [4:6] is the sub-list for method input_type
	4, // [4:4] is the sub-list for extension type_name
	4, // [4:4] is the sub-list for extension extendee
	0, // [0:4] is the sub-list for field type_name
}

func init() { file_kentik_ktbgp_v202203beta2_proxy_proto_init() }
func file_kentik_ktbgp_v202203beta2_proxy_proto_init() {
	if File_kentik_ktbgp_v202203beta2_proxy_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ControlRequest); i {
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
		file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ControlResponse); i {
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
		file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*KeyVal); i {
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
		file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DataRequest); i {
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
		file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DataResponse); i {
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
			RawDescriptor: file_kentik_ktbgp_v202203beta2_proxy_proto_rawDesc,
			NumEnums:      2,
			NumMessages:   5,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_kentik_ktbgp_v202203beta2_proxy_proto_goTypes,
		DependencyIndexes: file_kentik_ktbgp_v202203beta2_proxy_proto_depIdxs,
		EnumInfos:         file_kentik_ktbgp_v202203beta2_proxy_proto_enumTypes,
		MessageInfos:      file_kentik_ktbgp_v202203beta2_proxy_proto_msgTypes,
	}.Build()
	File_kentik_ktbgp_v202203beta2_proxy_proto = out.File
	file_kentik_ktbgp_v202203beta2_proxy_proto_rawDesc = nil
	file_kentik_ktbgp_v202203beta2_proxy_proto_goTypes = nil
	file_kentik_ktbgp_v202203beta2_proxy_proto_depIdxs = nil
}
