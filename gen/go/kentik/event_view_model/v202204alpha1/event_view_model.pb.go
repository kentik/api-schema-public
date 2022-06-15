// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.25.0
// 	protoc        (unknown)
// source: kentik/event_view_model/v202204alpha1/event_view_model.proto

package event_view_model

import (
	proto "github.com/golang/protobuf/proto"
	_ "github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2/options"
	_ "github.com/kentik/api-schema-public/gen/go/kentik/core/v202012alpha1"
	_ "google.golang.org/genproto/googleapis/api/annotations"
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	structpb "google.golang.org/protobuf/types/known/structpb"
	timestamppb "google.golang.org/protobuf/types/known/timestamppb"
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

type EventViewType int32

const (
	EventViewType_EVENT_VIEW_TYPE_UNSPECIFIED    EventViewType = 0
	EventViewType_EVENT_VIEW_TYPE_ALERT          EventViewType = 1
	EventViewType_EVENT_VIEW_TYPE_MITIGATION     EventViewType = 2
	EventViewType_EVENT_VIEW_TYPE_SYNTHETIC      EventViewType = 3
	EventViewType_EVENT_VIEW_TYPE_INSIGHT        EventViewType = 4
	EventViewType_EVENT_VIEW_TYPE_CUSTOM_INSIGHT EventViewType = 5
)

// Enum value maps for EventViewType.
var (
	EventViewType_name = map[int32]string{
		0: "EVENT_VIEW_TYPE_UNSPECIFIED",
		1: "EVENT_VIEW_TYPE_ALERT",
		2: "EVENT_VIEW_TYPE_MITIGATION",
		3: "EVENT_VIEW_TYPE_SYNTHETIC",
		4: "EVENT_VIEW_TYPE_INSIGHT",
		5: "EVENT_VIEW_TYPE_CUSTOM_INSIGHT",
	}
	EventViewType_value = map[string]int32{
		"EVENT_VIEW_TYPE_UNSPECIFIED":    0,
		"EVENT_VIEW_TYPE_ALERT":          1,
		"EVENT_VIEW_TYPE_MITIGATION":     2,
		"EVENT_VIEW_TYPE_SYNTHETIC":      3,
		"EVENT_VIEW_TYPE_INSIGHT":        4,
		"EVENT_VIEW_TYPE_CUSTOM_INSIGHT": 5,
	}
)

func (x EventViewType) Enum() *EventViewType {
	p := new(EventViewType)
	*p = x
	return p
}

func (x EventViewType) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (EventViewType) Descriptor() protoreflect.EnumDescriptor {
	return file_kentik_event_view_model_v202204alpha1_event_view_model_proto_enumTypes[0].Descriptor()
}

func (EventViewType) Type() protoreflect.EnumType {
	return &file_kentik_event_view_model_v202204alpha1_event_view_model_proto_enumTypes[0]
}

func (x EventViewType) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use EventViewType.Descriptor instead.
func (EventViewType) EnumDescriptor() ([]byte, []int) {
	return file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescGZIP(), []int{0}
}

type EventViewImportance int32

const (
	EventViewImportance_EVENT_VIEW_IMPORTANCE_UNSPECIFIED EventViewImportance = 0
	EventViewImportance_EVENT_VIEW_IMPORTANCE_HEALTHY     EventViewImportance = 1
	EventViewImportance_EVENT_VIEW_IMPORTANCE_NOTICE      EventViewImportance = 2
	EventViewImportance_EVENT_VIEW_IMPORTANCE_MINOR       EventViewImportance = 3
	EventViewImportance_EVENT_VIEW_IMPORTANCE_WARNING     EventViewImportance = 4
	EventViewImportance_EVENT_VIEW_IMPORTANCE_MAJOR       EventViewImportance = 5
	EventViewImportance_EVENT_VIEW_IMPORTANCE_SEVERE      EventViewImportance = 6
	EventViewImportance_EVENT_VIEW_IMPORTANCE_CRITICAL    EventViewImportance = 7
)

// Enum value maps for EventViewImportance.
var (
	EventViewImportance_name = map[int32]string{
		0: "EVENT_VIEW_IMPORTANCE_UNSPECIFIED",
		1: "EVENT_VIEW_IMPORTANCE_HEALTHY",
		2: "EVENT_VIEW_IMPORTANCE_NOTICE",
		3: "EVENT_VIEW_IMPORTANCE_MINOR",
		4: "EVENT_VIEW_IMPORTANCE_WARNING",
		5: "EVENT_VIEW_IMPORTANCE_MAJOR",
		6: "EVENT_VIEW_IMPORTANCE_SEVERE",
		7: "EVENT_VIEW_IMPORTANCE_CRITICAL",
	}
	EventViewImportance_value = map[string]int32{
		"EVENT_VIEW_IMPORTANCE_UNSPECIFIED": 0,
		"EVENT_VIEW_IMPORTANCE_HEALTHY":     1,
		"EVENT_VIEW_IMPORTANCE_NOTICE":      2,
		"EVENT_VIEW_IMPORTANCE_MINOR":       3,
		"EVENT_VIEW_IMPORTANCE_WARNING":     4,
		"EVENT_VIEW_IMPORTANCE_MAJOR":       5,
		"EVENT_VIEW_IMPORTANCE_SEVERE":      6,
		"EVENT_VIEW_IMPORTANCE_CRITICAL":    7,
	}
)

func (x EventViewImportance) Enum() *EventViewImportance {
	p := new(EventViewImportance)
	*p = x
	return p
}

func (x EventViewImportance) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (EventViewImportance) Descriptor() protoreflect.EnumDescriptor {
	return file_kentik_event_view_model_v202204alpha1_event_view_model_proto_enumTypes[1].Descriptor()
}

func (EventViewImportance) Type() protoreflect.EnumType {
	return &file_kentik_event_view_model_v202204alpha1_event_view_model_proto_enumTypes[1]
}

func (x EventViewImportance) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use EventViewImportance.Descriptor instead.
func (EventViewImportance) EnumDescriptor() ([]byte, []int) {
	return file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescGZIP(), []int{1}
}

type AlarmEvent struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id string `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
}

func (x *AlarmEvent) Reset() {
	*x = AlarmEvent{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *AlarmEvent) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*AlarmEvent) ProtoMessage() {}

func (x *AlarmEvent) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use AlarmEvent.ProtoReflect.Descriptor instead.
func (*AlarmEvent) Descriptor() ([]byte, []int) {
	return file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescGZIP(), []int{0}
}

func (x *AlarmEvent) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

type GetViewModelRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// Types that are assignable to Event:
	//	*GetViewModelRequest_Alarm
	Event isGetViewModelRequest_Event `protobuf_oneof:"event"`
}

func (x *GetViewModelRequest) Reset() {
	*x = GetViewModelRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetViewModelRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetViewModelRequest) ProtoMessage() {}

func (x *GetViewModelRequest) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetViewModelRequest.ProtoReflect.Descriptor instead.
func (*GetViewModelRequest) Descriptor() ([]byte, []int) {
	return file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescGZIP(), []int{1}
}

func (m *GetViewModelRequest) GetEvent() isGetViewModelRequest_Event {
	if m != nil {
		return m.Event
	}
	return nil
}

func (x *GetViewModelRequest) GetAlarm() *AlarmEvent {
	if x, ok := x.GetEvent().(*GetViewModelRequest_Alarm); ok {
		return x.Alarm
	}
	return nil
}

type isGetViewModelRequest_Event interface {
	isGetViewModelRequest_Event()
}

type GetViewModelRequest_Alarm struct {
	Alarm *AlarmEvent `protobuf:"bytes,2,opt,name=alarm,proto3,oneof"`
}

func (*GetViewModelRequest_Alarm) isGetViewModelRequest_Event() {}

type EventViewDetail struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Name  string          `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	Label string          `protobuf:"bytes,2,opt,name=label,proto3" json:"label,omitempty"`
	Tag   string          `protobuf:"bytes,3,opt,name=tag,proto3" json:"tag,omitempty"`
	Value *structpb.Value `protobuf:"bytes,4,opt,name=value,proto3" json:"value,omitempty"`
}

func (x *EventViewDetail) Reset() {
	*x = EventViewDetail{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *EventViewDetail) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*EventViewDetail) ProtoMessage() {}

func (x *EventViewDetail) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use EventViewDetail.ProtoReflect.Descriptor instead.
func (*EventViewDetail) Descriptor() ([]byte, []int) {
	return file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescGZIP(), []int{2}
}

func (x *EventViewDetail) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *EventViewDetail) GetLabel() string {
	if x != nil {
		return x.Label
	}
	return ""
}

func (x *EventViewDetail) GetTag() string {
	if x != nil {
		return x.Tag
	}
	return ""
}

func (x *EventViewDetail) GetValue() *structpb.Value {
	if x != nil {
		return x.Value
	}
	return nil
}

type EventViewModel struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Type          EventViewType          `protobuf:"varint,1,opt,name=type,proto3,enum=kentik.event_view_model.v202204alpha1.EventViewType" json:"type,omitempty"`
	Group         string                 `protobuf:"bytes,2,opt,name=group,proto3" json:"group,omitempty"`
	Description   string                 `protobuf:"bytes,3,opt,name=description,proto3" json:"description,omitempty"`
	IsActive      bool                   `protobuf:"varint,4,opt,name=is_active,json=isActive,proto3" json:"is_active,omitempty"`
	StartTime     *timestamppb.Timestamp `protobuf:"bytes,5,opt,name=start_time,json=startTime,proto3" json:"start_time,omitempty"`
	EndTime       *timestamppb.Timestamp `protobuf:"bytes,6,opt,name=end_time,json=endTime,proto3" json:"end_time,omitempty"`
	CurrentState  string                 `protobuf:"bytes,7,opt,name=current_state,json=currentState,proto3" json:"current_state,omitempty"`
	PreviousState string                 `protobuf:"bytes,8,opt,name=previous_state,json=previousState,proto3" json:"previous_state,omitempty"`
	Importance    EventViewImportance    `protobuf:"varint,9,opt,name=importance,proto3,enum=kentik.event_view_model.v202204alpha1.EventViewImportance" json:"importance,omitempty"`
	Details       []*EventViewDetail     `protobuf:"bytes,10,rep,name=details,proto3" json:"details,omitempty"`
}

func (x *EventViewModel) Reset() {
	*x = EventViewModel{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *EventViewModel) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*EventViewModel) ProtoMessage() {}

func (x *EventViewModel) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use EventViewModel.ProtoReflect.Descriptor instead.
func (*EventViewModel) Descriptor() ([]byte, []int) {
	return file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescGZIP(), []int{3}
}

func (x *EventViewModel) GetType() EventViewType {
	if x != nil {
		return x.Type
	}
	return EventViewType_EVENT_VIEW_TYPE_UNSPECIFIED
}

func (x *EventViewModel) GetGroup() string {
	if x != nil {
		return x.Group
	}
	return ""
}

func (x *EventViewModel) GetDescription() string {
	if x != nil {
		return x.Description
	}
	return ""
}

func (x *EventViewModel) GetIsActive() bool {
	if x != nil {
		return x.IsActive
	}
	return false
}

func (x *EventViewModel) GetStartTime() *timestamppb.Timestamp {
	if x != nil {
		return x.StartTime
	}
	return nil
}

func (x *EventViewModel) GetEndTime() *timestamppb.Timestamp {
	if x != nil {
		return x.EndTime
	}
	return nil
}

func (x *EventViewModel) GetCurrentState() string {
	if x != nil {
		return x.CurrentState
	}
	return ""
}

func (x *EventViewModel) GetPreviousState() string {
	if x != nil {
		return x.PreviousState
	}
	return ""
}

func (x *EventViewModel) GetImportance() EventViewImportance {
	if x != nil {
		return x.Importance
	}
	return EventViewImportance_EVENT_VIEW_IMPORTANCE_UNSPECIFIED
}

func (x *EventViewModel) GetDetails() []*EventViewDetail {
	if x != nil {
		return x.Details
	}
	return nil
}

type GetViewModelResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Model *EventViewModel `protobuf:"bytes,1,opt,name=model,proto3" json:"model,omitempty"`
}

func (x *GetViewModelResponse) Reset() {
	*x = GetViewModelResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetViewModelResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetViewModelResponse) ProtoMessage() {}

func (x *GetViewModelResponse) ProtoReflect() protoreflect.Message {
	mi := &file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetViewModelResponse.ProtoReflect.Descriptor instead.
func (*GetViewModelResponse) Descriptor() ([]byte, []int) {
	return file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescGZIP(), []int{4}
}

func (x *GetViewModelResponse) GetModel() *EventViewModel {
	if x != nil {
		return x.Model
	}
	return nil
}

var File_kentik_event_view_model_v202204alpha1_event_view_model_proto protoreflect.FileDescriptor

var file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDesc = []byte{
	0x0a, 0x3c, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2f, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x5f, 0x76,
	0x69, 0x65, 0x77, 0x5f, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x2f, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30,
	0x34, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2f, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x5f, 0x76, 0x69,
	0x65, 0x77, 0x5f, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x25,
	0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x5f, 0x76, 0x69, 0x65,
	0x77, 0x5f, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x34, 0x61,
	0x6c, 0x70, 0x68, 0x61, 0x31, 0x1a, 0x1c, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x61, 0x70,
	0x69, 0x2f, 0x61, 0x6e, 0x6e, 0x6f, 0x74, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x1a, 0x17, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f, 0x61, 0x70, 0x69, 0x2f,
	0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x63, 0x2d, 0x67, 0x65, 0x6e, 0x2d, 0x6f, 0x70, 0x65, 0x6e, 0x61, 0x70, 0x69,
	0x76, 0x32, 0x2f, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2f, 0x61, 0x6e, 0x6e, 0x6f, 0x74,
	0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x2b, 0x6b, 0x65,
	0x6e, 0x74, 0x69, 0x6b, 0x2f, 0x63, 0x6f, 0x72, 0x65, 0x2f, 0x76, 0x32, 0x30, 0x32, 0x30, 0x31,
	0x32, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2f, 0x61, 0x6e, 0x6e, 0x6f, 0x74, 0x61, 0x74, 0x69,
	0x6f, 0x6e, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x1f, 0x67, 0x6f, 0x6f, 0x67, 0x6c,
	0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f, 0x74, 0x69, 0x6d, 0x65, 0x73,
	0x74, 0x61, 0x6d, 0x70, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x1c, 0x67, 0x6f, 0x6f, 0x67,
	0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f, 0x73, 0x74, 0x72, 0x75,
	0x63, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x1c, 0x0a, 0x0a, 0x41, 0x6c, 0x61, 0x72,
	0x6d, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x02, 0x69, 0x64, 0x22, 0x69, 0x0a, 0x13, 0x47, 0x65, 0x74, 0x56, 0x69, 0x65,
	0x77, 0x4d, 0x6f, 0x64, 0x65, 0x6c, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x49, 0x0a,
	0x05, 0x61, 0x6c, 0x61, 0x72, 0x6d, 0x18, 0x02, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x31, 0x2e, 0x6b,
	0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x5f, 0x76, 0x69, 0x65, 0x77,
	0x5f, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x34, 0x61, 0x6c,
	0x70, 0x68, 0x61, 0x31, 0x2e, 0x41, 0x6c, 0x61, 0x72, 0x6d, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x48,
	0x00, 0x52, 0x05, 0x61, 0x6c, 0x61, 0x72, 0x6d, 0x42, 0x07, 0x0a, 0x05, 0x65, 0x76, 0x65, 0x6e,
	0x74, 0x22, 0x7b, 0x0a, 0x0f, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x56, 0x69, 0x65, 0x77, 0x44, 0x65,
	0x74, 0x61, 0x69, 0x6c, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x14, 0x0a, 0x05, 0x6c, 0x61, 0x62, 0x65,
	0x6c, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x6c, 0x61, 0x62, 0x65, 0x6c, 0x12, 0x10,
	0x0a, 0x03, 0x74, 0x61, 0x67, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x03, 0x74, 0x61, 0x67,
	0x12, 0x2c, 0x0a, 0x05, 0x76, 0x61, 0x6c, 0x75, 0x65, 0x18, 0x04, 0x20, 0x01, 0x28, 0x0b, 0x32,
	0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75,
	0x66, 0x2e, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x52, 0x05, 0x76, 0x61, 0x6c, 0x75, 0x65, 0x22, 0x9b,
	0x04, 0x0a, 0x0e, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x56, 0x69, 0x65, 0x77, 0x4d, 0x6f, 0x64, 0x65,
	0x6c, 0x12, 0x48, 0x0a, 0x04, 0x74, 0x79, 0x70, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0e, 0x32,
	0x34, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x5f, 0x76,
	0x69, 0x65, 0x77, 0x5f, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30,
	0x34, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2e, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x56, 0x69, 0x65,
	0x77, 0x54, 0x79, 0x70, 0x65, 0x52, 0x04, 0x74, 0x79, 0x70, 0x65, 0x12, 0x14, 0x0a, 0x05, 0x67,
	0x72, 0x6f, 0x75, 0x70, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x67, 0x72, 0x6f, 0x75,
	0x70, 0x12, 0x20, 0x0a, 0x0b, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6f, 0x6e,
	0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74,
	0x69, 0x6f, 0x6e, 0x12, 0x1b, 0x0a, 0x09, 0x69, 0x73, 0x5f, 0x61, 0x63, 0x74, 0x69, 0x76, 0x65,
	0x18, 0x04, 0x20, 0x01, 0x28, 0x08, 0x52, 0x08, 0x69, 0x73, 0x41, 0x63, 0x74, 0x69, 0x76, 0x65,
	0x12, 0x39, 0x0a, 0x0a, 0x73, 0x74, 0x61, 0x72, 0x74, 0x5f, 0x74, 0x69, 0x6d, 0x65, 0x18, 0x05,
	0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70,
	0x52, 0x09, 0x73, 0x74, 0x61, 0x72, 0x74, 0x54, 0x69, 0x6d, 0x65, 0x12, 0x35, 0x0a, 0x08, 0x65,
	0x6e, 0x64, 0x5f, 0x74, 0x69, 0x6d, 0x65, 0x18, 0x06, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e,
	0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e,
	0x54, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x52, 0x07, 0x65, 0x6e, 0x64, 0x54, 0x69,
	0x6d, 0x65, 0x12, 0x23, 0x0a, 0x0d, 0x63, 0x75, 0x72, 0x72, 0x65, 0x6e, 0x74, 0x5f, 0x73, 0x74,
	0x61, 0x74, 0x65, 0x18, 0x07, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0c, 0x63, 0x75, 0x72, 0x72, 0x65,
	0x6e, 0x74, 0x53, 0x74, 0x61, 0x74, 0x65, 0x12, 0x25, 0x0a, 0x0e, 0x70, 0x72, 0x65, 0x76, 0x69,
	0x6f, 0x75, 0x73, 0x5f, 0x73, 0x74, 0x61, 0x74, 0x65, 0x18, 0x08, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x0d, 0x70, 0x72, 0x65, 0x76, 0x69, 0x6f, 0x75, 0x73, 0x53, 0x74, 0x61, 0x74, 0x65, 0x12, 0x5a,
	0x0a, 0x0a, 0x69, 0x6d, 0x70, 0x6f, 0x72, 0x74, 0x61, 0x6e, 0x63, 0x65, 0x18, 0x09, 0x20, 0x01,
	0x28, 0x0e, 0x32, 0x3a, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x65, 0x76, 0x65, 0x6e,
	0x74, 0x5f, 0x76, 0x69, 0x65, 0x77, 0x5f, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x2e, 0x76, 0x32, 0x30,
	0x32, 0x32, 0x30, 0x34, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2e, 0x45, 0x76, 0x65, 0x6e, 0x74,
	0x56, 0x69, 0x65, 0x77, 0x49, 0x6d, 0x70, 0x6f, 0x72, 0x74, 0x61, 0x6e, 0x63, 0x65, 0x52, 0x0a,
	0x69, 0x6d, 0x70, 0x6f, 0x72, 0x74, 0x61, 0x6e, 0x63, 0x65, 0x12, 0x50, 0x0a, 0x07, 0x64, 0x65,
	0x74, 0x61, 0x69, 0x6c, 0x73, 0x18, 0x0a, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x36, 0x2e, 0x6b, 0x65,
	0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x5f, 0x76, 0x69, 0x65, 0x77, 0x5f,
	0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x34, 0x61, 0x6c, 0x70,
	0x68, 0x61, 0x31, 0x2e, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x56, 0x69, 0x65, 0x77, 0x44, 0x65, 0x74,
	0x61, 0x69, 0x6c, 0x52, 0x07, 0x64, 0x65, 0x74, 0x61, 0x69, 0x6c, 0x73, 0x22, 0x63, 0x0a, 0x14,
	0x47, 0x65, 0x74, 0x56, 0x69, 0x65, 0x77, 0x4d, 0x6f, 0x64, 0x65, 0x6c, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x73, 0x65, 0x12, 0x4b, 0x0a, 0x05, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x0b, 0x32, 0x35, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x65, 0x76, 0x65,
	0x6e, 0x74, 0x5f, 0x76, 0x69, 0x65, 0x77, 0x5f, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x2e, 0x76, 0x32,
	0x30, 0x32, 0x32, 0x30, 0x34, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2e, 0x45, 0x76, 0x65, 0x6e,
	0x74, 0x56, 0x69, 0x65, 0x77, 0x4d, 0x6f, 0x64, 0x65, 0x6c, 0x52, 0x05, 0x6d, 0x6f, 0x64, 0x65,
	0x6c, 0x2a, 0xcb, 0x01, 0x0a, 0x0d, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x56, 0x69, 0x65, 0x77, 0x54,
	0x79, 0x70, 0x65, 0x12, 0x1f, 0x0a, 0x1b, 0x45, 0x56, 0x45, 0x4e, 0x54, 0x5f, 0x56, 0x49, 0x45,
	0x57, 0x5f, 0x54, 0x59, 0x50, 0x45, 0x5f, 0x55, 0x4e, 0x53, 0x50, 0x45, 0x43, 0x49, 0x46, 0x49,
	0x45, 0x44, 0x10, 0x00, 0x12, 0x19, 0x0a, 0x15, 0x45, 0x56, 0x45, 0x4e, 0x54, 0x5f, 0x56, 0x49,
	0x45, 0x57, 0x5f, 0x54, 0x59, 0x50, 0x45, 0x5f, 0x41, 0x4c, 0x45, 0x52, 0x54, 0x10, 0x01, 0x12,
	0x1e, 0x0a, 0x1a, 0x45, 0x56, 0x45, 0x4e, 0x54, 0x5f, 0x56, 0x49, 0x45, 0x57, 0x5f, 0x54, 0x59,
	0x50, 0x45, 0x5f, 0x4d, 0x49, 0x54, 0x49, 0x47, 0x41, 0x54, 0x49, 0x4f, 0x4e, 0x10, 0x02, 0x12,
	0x1d, 0x0a, 0x19, 0x45, 0x56, 0x45, 0x4e, 0x54, 0x5f, 0x56, 0x49, 0x45, 0x57, 0x5f, 0x54, 0x59,
	0x50, 0x45, 0x5f, 0x53, 0x59, 0x4e, 0x54, 0x48, 0x45, 0x54, 0x49, 0x43, 0x10, 0x03, 0x12, 0x1b,
	0x0a, 0x17, 0x45, 0x56, 0x45, 0x4e, 0x54, 0x5f, 0x56, 0x49, 0x45, 0x57, 0x5f, 0x54, 0x59, 0x50,
	0x45, 0x5f, 0x49, 0x4e, 0x53, 0x49, 0x47, 0x48, 0x54, 0x10, 0x04, 0x12, 0x22, 0x0a, 0x1e, 0x45,
	0x56, 0x45, 0x4e, 0x54, 0x5f, 0x56, 0x49, 0x45, 0x57, 0x5f, 0x54, 0x59, 0x50, 0x45, 0x5f, 0x43,
	0x55, 0x53, 0x54, 0x4f, 0x4d, 0x5f, 0x49, 0x4e, 0x53, 0x49, 0x47, 0x48, 0x54, 0x10, 0x05, 0x2a,
	0xac, 0x02, 0x0a, 0x13, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x56, 0x69, 0x65, 0x77, 0x49, 0x6d, 0x70,
	0x6f, 0x72, 0x74, 0x61, 0x6e, 0x63, 0x65, 0x12, 0x25, 0x0a, 0x21, 0x45, 0x56, 0x45, 0x4e, 0x54,
	0x5f, 0x56, 0x49, 0x45, 0x57, 0x5f, 0x49, 0x4d, 0x50, 0x4f, 0x52, 0x54, 0x41, 0x4e, 0x43, 0x45,
	0x5f, 0x55, 0x4e, 0x53, 0x50, 0x45, 0x43, 0x49, 0x46, 0x49, 0x45, 0x44, 0x10, 0x00, 0x12, 0x21,
	0x0a, 0x1d, 0x45, 0x56, 0x45, 0x4e, 0x54, 0x5f, 0x56, 0x49, 0x45, 0x57, 0x5f, 0x49, 0x4d, 0x50,
	0x4f, 0x52, 0x54, 0x41, 0x4e, 0x43, 0x45, 0x5f, 0x48, 0x45, 0x41, 0x4c, 0x54, 0x48, 0x59, 0x10,
	0x01, 0x12, 0x20, 0x0a, 0x1c, 0x45, 0x56, 0x45, 0x4e, 0x54, 0x5f, 0x56, 0x49, 0x45, 0x57, 0x5f,
	0x49, 0x4d, 0x50, 0x4f, 0x52, 0x54, 0x41, 0x4e, 0x43, 0x45, 0x5f, 0x4e, 0x4f, 0x54, 0x49, 0x43,
	0x45, 0x10, 0x02, 0x12, 0x1f, 0x0a, 0x1b, 0x45, 0x56, 0x45, 0x4e, 0x54, 0x5f, 0x56, 0x49, 0x45,
	0x57, 0x5f, 0x49, 0x4d, 0x50, 0x4f, 0x52, 0x54, 0x41, 0x4e, 0x43, 0x45, 0x5f, 0x4d, 0x49, 0x4e,
	0x4f, 0x52, 0x10, 0x03, 0x12, 0x21, 0x0a, 0x1d, 0x45, 0x56, 0x45, 0x4e, 0x54, 0x5f, 0x56, 0x49,
	0x45, 0x57, 0x5f, 0x49, 0x4d, 0x50, 0x4f, 0x52, 0x54, 0x41, 0x4e, 0x43, 0x45, 0x5f, 0x57, 0x41,
	0x52, 0x4e, 0x49, 0x4e, 0x47, 0x10, 0x04, 0x12, 0x1f, 0x0a, 0x1b, 0x45, 0x56, 0x45, 0x4e, 0x54,
	0x5f, 0x56, 0x49, 0x45, 0x57, 0x5f, 0x49, 0x4d, 0x50, 0x4f, 0x52, 0x54, 0x41, 0x4e, 0x43, 0x45,
	0x5f, 0x4d, 0x41, 0x4a, 0x4f, 0x52, 0x10, 0x05, 0x12, 0x20, 0x0a, 0x1c, 0x45, 0x56, 0x45, 0x4e,
	0x54, 0x5f, 0x56, 0x49, 0x45, 0x57, 0x5f, 0x49, 0x4d, 0x50, 0x4f, 0x52, 0x54, 0x41, 0x4e, 0x43,
	0x45, 0x5f, 0x53, 0x45, 0x56, 0x45, 0x52, 0x45, 0x10, 0x06, 0x12, 0x22, 0x0a, 0x1e, 0x45, 0x56,
	0x45, 0x4e, 0x54, 0x5f, 0x56, 0x49, 0x45, 0x57, 0x5f, 0x49, 0x4d, 0x50, 0x4f, 0x52, 0x54, 0x41,
	0x4e, 0x43, 0x45, 0x5f, 0x43, 0x52, 0x49, 0x54, 0x49, 0x43, 0x41, 0x4c, 0x10, 0x07, 0x32, 0x97,
	0x03, 0x0a, 0x15, 0x45, 0x76, 0x65, 0x6e, 0x74, 0x56, 0x69, 0x65, 0x77, 0x4d, 0x6f, 0x64, 0x65,
	0x6c, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0xe1, 0x02, 0x0a, 0x0c, 0x47, 0x65, 0x74,
	0x56, 0x69, 0x65, 0x77, 0x4d, 0x6f, 0x64, 0x65, 0x6c, 0x12, 0x3a, 0x2e, 0x6b, 0x65, 0x6e, 0x74,
	0x69, 0x6b, 0x2e, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x5f, 0x76, 0x69, 0x65, 0x77, 0x5f, 0x6d, 0x6f,
	0x64, 0x65, 0x6c, 0x2e, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x34, 0x61, 0x6c, 0x70, 0x68, 0x61,
	0x31, 0x2e, 0x47, 0x65, 0x74, 0x56, 0x69, 0x65, 0x77, 0x4d, 0x6f, 0x64, 0x65, 0x6c, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x3b, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e, 0x65,
	0x76, 0x65, 0x6e, 0x74, 0x5f, 0x76, 0x69, 0x65, 0x77, 0x5f, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x2e,
	0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x34, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2e, 0x47, 0x65,
	0x74, 0x56, 0x69, 0x65, 0x77, 0x4d, 0x6f, 0x64, 0x65, 0x6c, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e,
	0x73, 0x65, 0x22, 0xd7, 0x01, 0x92, 0x41, 0x98, 0x01, 0x12, 0x4d, 0x45, 0x76, 0x65, 0x6e, 0x74,
	0x20, 0x76, 0x69, 0x65, 0x77, 0x20, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x20, 0x77, 0x69, 0x6c, 0x6c,
	0x20, 0x70, 0x72, 0x6f, 0x76, 0x69, 0x64, 0x65, 0x20, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x20, 0x63,
	0x6f, 0x6e, 0x74, 0x65, 0x78, 0x74, 0x20, 0x6e, 0x65, 0x63, 0x65, 0x73, 0x73, 0x61, 0x72, 0x79,
	0x20, 0x74, 0x6f, 0x20, 0x72, 0x65, 0x6e, 0x64, 0x65, 0x72, 0x20, 0x6e, 0x6f, 0x74, 0x69, 0x66,
	0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x1a, 0x39, 0x47, 0x65, 0x74, 0x56, 0x69, 0x65,
	0x77, 0x4d, 0x6f, 0x64, 0x65, 0x6c, 0x20, 0x77, 0x69, 0x6c, 0x6c, 0x20, 0x70, 0x72, 0x6f, 0x76,
	0x69, 0x64, 0x65, 0x20, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x20, 0x76, 0x69, 0x65, 0x77, 0x20, 0x6d,
	0x6f, 0x64, 0x65, 0x6c, 0x20, 0x64, 0x61, 0x74, 0x61, 0x20, 0x73, 0x74, 0x72, 0x75, 0x63, 0x74,
	0x75, 0x72, 0x65, 0x2a, 0x0c, 0x47, 0x65, 0x74, 0x56, 0x69, 0x65, 0x77, 0x4d, 0x6f, 0x64, 0x65,
	0x6c, 0x82, 0xd3, 0xe4, 0x93, 0x02, 0x35, 0x22, 0x30, 0x2f, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x5f,
	0x76, 0x69, 0x65, 0x77, 0x5f, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x2f, 0x76, 0x32, 0x30, 0x32, 0x32,
	0x30, 0x34, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2f, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x5f, 0x76,
	0x69, 0x65, 0x77, 0x5f, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x3a, 0x01, 0x2a, 0x1a, 0x1a, 0xca, 0x41,
	0x13, 0x67, 0x72, 0x70, 0x63, 0x2e, 0x61, 0x70, 0x69, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b,
	0x2e, 0x63, 0x6f, 0x6d, 0xf8, 0xd7, 0x02, 0x01, 0x42, 0xfc, 0x01, 0x5a, 0x5a, 0x67, 0x69, 0x74,
	0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2f, 0x61,
	0x70, 0x69, 0x2d, 0x73, 0x63, 0x68, 0x65, 0x6d, 0x61, 0x2f, 0x67, 0x65, 0x6e, 0x2f, 0x67, 0x6f,
	0x2f, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2f, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x5f, 0x76, 0x69,
	0x65, 0x77, 0x5f, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x2f, 0x76, 0x32, 0x30, 0x32, 0x32, 0x30, 0x34,
	0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x3b, 0x65, 0x76, 0x65, 0x6e, 0x74, 0x5f, 0x76, 0x69, 0x65,
	0x77, 0x5f, 0x6d, 0x6f, 0x64, 0x65, 0x6c, 0x92, 0x41, 0x9c, 0x01, 0x12, 0x3c, 0x0a, 0x12, 0x45,
	0x76, 0x65, 0x6e, 0x74, 0x56, 0x69, 0x65, 0x77, 0x4d, 0x6f, 0x64, 0x65, 0x6c, 0x20, 0x41, 0x50,
	0x49, 0x22, 0x18, 0x0a, 0x16, 0x4b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x20, 0x41, 0x50, 0x49, 0x20,
	0x45, 0x6e, 0x67, 0x69, 0x6e, 0x65, 0x65, 0x72, 0x69, 0x6e, 0x67, 0x32, 0x0c, 0x32, 0x30, 0x32,
	0x32, 0x30, 0x34, 0x61, 0x6c, 0x70, 0x68, 0x61, 0x31, 0x2a, 0x01, 0x02, 0x32, 0x10, 0x61, 0x70,
	0x70, 0x6c, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x2f, 0x6a, 0x73, 0x6f, 0x6e, 0x3a, 0x10,
	0x61, 0x70, 0x70, 0x6c, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x2f, 0x6a, 0x73, 0x6f, 0x6e,
	0x72, 0x35, 0x0a, 0x16, 0x4d, 0x6f, 0x72, 0x65, 0x20, 0x61, 0x62, 0x6f, 0x75, 0x74, 0x20, 0x4b,
	0x65, 0x6e, 0x74, 0x69, 0x6b, 0x20, 0x41, 0x50, 0x49, 0x73, 0x12, 0x1b, 0x68, 0x74, 0x74, 0x70,
	0x73, 0x3a, 0x2f, 0x2f, 0x64, 0x6f, 0x63, 0x73, 0x2e, 0x6b, 0x65, 0x6e, 0x74, 0x69, 0x6b, 0x2e,
	0x63, 0x6f, 0x6d, 0x2f, 0x61, 0x70, 0x69, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescOnce sync.Once
	file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescData = file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDesc
)

func file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescGZIP() []byte {
	file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescOnce.Do(func() {
		file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescData = protoimpl.X.CompressGZIP(file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescData)
	})
	return file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDescData
}

var file_kentik_event_view_model_v202204alpha1_event_view_model_proto_enumTypes = make([]protoimpl.EnumInfo, 2)
var file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes = make([]protoimpl.MessageInfo, 5)
var file_kentik_event_view_model_v202204alpha1_event_view_model_proto_goTypes = []interface{}{
	(EventViewType)(0),            // 0: kentik.event_view_model.v202204alpha1.EventViewType
	(EventViewImportance)(0),      // 1: kentik.event_view_model.v202204alpha1.EventViewImportance
	(*AlarmEvent)(nil),            // 2: kentik.event_view_model.v202204alpha1.AlarmEvent
	(*GetViewModelRequest)(nil),   // 3: kentik.event_view_model.v202204alpha1.GetViewModelRequest
	(*EventViewDetail)(nil),       // 4: kentik.event_view_model.v202204alpha1.EventViewDetail
	(*EventViewModel)(nil),        // 5: kentik.event_view_model.v202204alpha1.EventViewModel
	(*GetViewModelResponse)(nil),  // 6: kentik.event_view_model.v202204alpha1.GetViewModelResponse
	(*structpb.Value)(nil),        // 7: google.protobuf.Value
	(*timestamppb.Timestamp)(nil), // 8: google.protobuf.Timestamp
}
var file_kentik_event_view_model_v202204alpha1_event_view_model_proto_depIdxs = []int32{
	2, // 0: kentik.event_view_model.v202204alpha1.GetViewModelRequest.alarm:type_name -> kentik.event_view_model.v202204alpha1.AlarmEvent
	7, // 1: kentik.event_view_model.v202204alpha1.EventViewDetail.value:type_name -> google.protobuf.Value
	0, // 2: kentik.event_view_model.v202204alpha1.EventViewModel.type:type_name -> kentik.event_view_model.v202204alpha1.EventViewType
	8, // 3: kentik.event_view_model.v202204alpha1.EventViewModel.start_time:type_name -> google.protobuf.Timestamp
	8, // 4: kentik.event_view_model.v202204alpha1.EventViewModel.end_time:type_name -> google.protobuf.Timestamp
	1, // 5: kentik.event_view_model.v202204alpha1.EventViewModel.importance:type_name -> kentik.event_view_model.v202204alpha1.EventViewImportance
	4, // 6: kentik.event_view_model.v202204alpha1.EventViewModel.details:type_name -> kentik.event_view_model.v202204alpha1.EventViewDetail
	5, // 7: kentik.event_view_model.v202204alpha1.GetViewModelResponse.model:type_name -> kentik.event_view_model.v202204alpha1.EventViewModel
	3, // 8: kentik.event_view_model.v202204alpha1.EventViewModelService.GetViewModel:input_type -> kentik.event_view_model.v202204alpha1.GetViewModelRequest
	6, // 9: kentik.event_view_model.v202204alpha1.EventViewModelService.GetViewModel:output_type -> kentik.event_view_model.v202204alpha1.GetViewModelResponse
	9, // [9:10] is the sub-list for method output_type
	8, // [8:9] is the sub-list for method input_type
	8, // [8:8] is the sub-list for extension type_name
	8, // [8:8] is the sub-list for extension extendee
	0, // [0:8] is the sub-list for field type_name
}

func init() { file_kentik_event_view_model_v202204alpha1_event_view_model_proto_init() }
func file_kentik_event_view_model_v202204alpha1_event_view_model_proto_init() {
	if File_kentik_event_view_model_v202204alpha1_event_view_model_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*AlarmEvent); i {
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
		file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetViewModelRequest); i {
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
		file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*EventViewDetail); i {
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
		file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*EventViewModel); i {
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
		file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetViewModelResponse); i {
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
	file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes[1].OneofWrappers = []interface{}{
		(*GetViewModelRequest_Alarm)(nil),
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDesc,
			NumEnums:      2,
			NumMessages:   5,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_kentik_event_view_model_v202204alpha1_event_view_model_proto_goTypes,
		DependencyIndexes: file_kentik_event_view_model_v202204alpha1_event_view_model_proto_depIdxs,
		EnumInfos:         file_kentik_event_view_model_v202204alpha1_event_view_model_proto_enumTypes,
		MessageInfos:      file_kentik_event_view_model_v202204alpha1_event_view_model_proto_msgTypes,
	}.Build()
	File_kentik_event_view_model_v202204alpha1_event_view_model_proto = out.File
	file_kentik_event_view_model_v202204alpha1_event_view_model_proto_rawDesc = nil
	file_kentik_event_view_model_v202204alpha1_event_view_model_proto_goTypes = nil
	file_kentik_event_view_model_v202204alpha1_event_view_model_proto_depIdxs = nil
}
