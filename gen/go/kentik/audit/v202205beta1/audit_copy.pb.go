// Code generated by protoc-gen-go-copy. DO NOT EDIT.
// source: kentik/audit/v202205beta1/audit.proto

package audit

import "google.golang.org/protobuf/types/known/timestamppb"

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *RequestEvent) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *RequestEvent:
		x.RequestMethod = v.GetRequestMethod()
		x.RequestPath = v.GetRequestPath()
		x.ClientAddress = v.GetClientAddress()
		x.ResponseCode = v.GetResponseCode()
		x.RequestMetadata = v.GetRequestMetadata()
		x.ResponseMetadata = v.GetResponseMetadata()
		x.RequestProtocol = v.GetRequestProtocol()
	default:
		if v, ok := v.(interface{ GetRequestMethod() string }); ok {
			x.RequestMethod = v.GetRequestMethod()
		}
		if v, ok := v.(interface{ GetRequestPath() string }); ok {
			x.RequestPath = v.GetRequestPath()
		}
		if v, ok := v.(interface{ GetClientAddress() string }); ok {
			x.ClientAddress = v.GetClientAddress()
		}
		if v, ok := v.(interface{ GetResponseCode() uint32 }); ok {
			x.ResponseCode = v.GetResponseCode()
		}
		if v, ok := v.(interface{ GetRequestMetadata() map[string]string }); ok {
			x.RequestMetadata = v.GetRequestMetadata()
		}
		if v, ok := v.(interface{ GetResponseMetadata() map[string]string }); ok {
			x.ResponseMetadata = v.GetResponseMetadata()
		}
		if v, ok := v.(interface{ GetRequestProtocol() RequestProtocol }); ok {
			x.RequestProtocol = v.GetRequestProtocol()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *RequestEvent) Proto_ShallowClone() (c *RequestEvent) {
	if x != nil {
		c = new(RequestEvent)
		c.RequestMethod = x.RequestMethod
		c.RequestPath = x.RequestPath
		c.ClientAddress = x.ClientAddress
		c.ResponseCode = x.ResponseCode
		c.RequestMetadata = x.RequestMetadata
		c.ResponseMetadata = x.ResponseMetadata
		c.RequestProtocol = x.RequestProtocol
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *AuditEvent) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *AuditEvent:
		x.UserId = v.GetUserId()
		x.CompanyId = v.GetCompanyId()
		x.ServiceName = v.GetServiceName()
		x.EventId = v.GetEventId()
		x.Cdate = v.GetCdate()
		x.EventPayload = v.GetEventPayload()
		x.CorrelationId = v.GetCorrelationId()
		x.EventType = v.GetEventType()
	default:
		if v, ok := v.(interface{ GetUserId() string }); ok {
			x.UserId = v.GetUserId()
		}
		if v, ok := v.(interface{ GetCompanyId() string }); ok {
			x.CompanyId = v.GetCompanyId()
		}
		if v, ok := v.(interface{ GetServiceName() string }); ok {
			x.ServiceName = v.GetServiceName()
		}
		if v, ok := v.(interface{ GetEventId() string }); ok {
			x.EventId = v.GetEventId()
		}
		if v, ok := v.(interface{ GetCdate() *timestamppb.Timestamp }); ok {
			x.Cdate = v.GetCdate()
		}
		if v, ok := v.(interface{ GetEventPayload() string }); ok {
			x.EventPayload = v.GetEventPayload()
		}
		if v, ok := v.(interface{ GetCorrelationId() string }); ok {
			x.CorrelationId = v.GetCorrelationId()
		}
		if v, ok := v.(interface{ GetEventType() isAuditEvent_EventType }); ok {
			x.EventType = v.GetEventType()
		} else {
			func() {
				if v, ok := v.(interface{ GetRequest() *RequestEvent }); ok {
					var defaultValue *RequestEvent
					if v := v.GetRequest(); v != defaultValue {
						x.EventType = &AuditEvent_Request{Request: v}
						return
					}
				}
			}()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *AuditEvent) Proto_ShallowClone() (c *AuditEvent) {
	if x != nil {
		c = new(AuditEvent)
		c.UserId = x.UserId
		c.CompanyId = x.CompanyId
		c.ServiceName = x.ServiceName
		c.EventId = x.EventId
		c.Cdate = x.Cdate
		c.EventPayload = x.EventPayload
		c.CorrelationId = x.CorrelationId
		c.EventType = x.EventType
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *CreateAuditEventRequest) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *CreateAuditEventRequest:
		x.Events = v.GetEvents()
	default:
		if v, ok := v.(interface{ GetEvents() []*AuditEvent }); ok {
			x.Events = v.GetEvents()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *CreateAuditEventRequest) Proto_ShallowClone() (c *CreateAuditEventRequest) {
	if x != nil {
		c = new(CreateAuditEventRequest)
		c.Events = x.Events
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *CreateAuditEventResponse) Proto_ShallowCopy(v interface{}) {
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *CreateAuditEventResponse) Proto_ShallowClone() (c *CreateAuditEventResponse) {
	if x != nil {
		c = new(CreateAuditEventResponse)
	}
	return
}
