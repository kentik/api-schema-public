// Code generated by protoc-gen-go-copy. DO NOT EDIT.
// source: grpc/http_over_grpc/http_over_grpc.proto

package http_over_grpc

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *Header) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *Header:
		x.Key = v.GetKey()
		x.Values = v.GetValues()
	default:
		if v, ok := v.(interface{ GetKey() string }); ok {
			x.Key = v.GetKey()
		}
		if v, ok := v.(interface{ GetValues() []string }); ok {
			x.Values = v.GetValues()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *Header) Proto_ShallowClone() (c *Header) {
	if x != nil {
		c = new(Header)
		c.Key = x.Key
		c.Values = x.Values
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *HTTPOverGRPCRequest) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *HTTPOverGRPCRequest:
		x.Method = v.GetMethod()
		x.Url = v.GetUrl()
		x.Headers = v.GetHeaders()
		x.Body = v.GetBody()
	default:
		if v, ok := v.(interface{ GetMethod() string }); ok {
			x.Method = v.GetMethod()
		}
		if v, ok := v.(interface{ GetUrl() string }); ok {
			x.Url = v.GetUrl()
		}
		if v, ok := v.(interface{ GetHeaders() []*Header }); ok {
			x.Headers = v.GetHeaders()
		}
		if v, ok := v.(interface{ GetBody() []byte }); ok {
			x.Body = v.GetBody()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *HTTPOverGRPCRequest) Proto_ShallowClone() (c *HTTPOverGRPCRequest) {
	if x != nil {
		c = new(HTTPOverGRPCRequest)
		c.Method = x.Method
		c.Url = x.Url
		c.Headers = x.Headers
		c.Body = x.Body
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *HTTPOverGRPCReply) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *HTTPOverGRPCReply:
		x.Status = v.GetStatus()
		x.Headers = v.GetHeaders()
		x.Body = v.GetBody()
	default:
		if v, ok := v.(interface{ GetStatus() rune }); ok {
			x.Status = v.GetStatus()
		}
		if v, ok := v.(interface{ GetHeaders() []*Header }); ok {
			x.Headers = v.GetHeaders()
		}
		if v, ok := v.(interface{ GetBody() []byte }); ok {
			x.Body = v.GetBody()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *HTTPOverGRPCReply) Proto_ShallowClone() (c *HTTPOverGRPCReply) {
	if x != nil {
		c = new(HTTPOverGRPCReply)
		c.Status = x.Status
		c.Headers = x.Headers
		c.Body = x.Body
	}
	return
}