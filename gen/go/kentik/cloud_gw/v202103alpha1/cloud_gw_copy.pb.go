// Code generated by protoc-gen-go-copy. DO NOT EDIT.
// source: kentik/cloud_gw/v202103alpha1/cloud_gw.proto

package cloudgw

import "github.com/kentik/api-schema-public/gen/go/grpc/http_over_grpc"

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *LoginAwsRequest) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *LoginAwsRequest:
		x.Region = v.GetRegion()
		x.Role = v.GetRole()
		x.CallerId = v.GetCallerId()
	default:
		if v, ok := v.(interface{ GetRegion() string }); ok {
			x.Region = v.GetRegion()
		}
		if v, ok := v.(interface{ GetRole() string }); ok {
			x.Role = v.GetRole()
		}
		if v, ok := v.(interface{ GetCallerId() string }); ok {
			x.CallerId = v.GetCallerId()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *LoginAwsRequest) Proto_ShallowClone() (c *LoginAwsRequest) {
	if x != nil {
		c = new(LoginAwsRequest)
		c.Region = x.Region
		c.Role = x.Role
		c.CallerId = x.CallerId
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *LoginAwsResponse) Proto_ShallowCopy(v interface{}) {
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *LoginAwsResponse) Proto_ShallowClone() (c *LoginAwsResponse) {
	if x != nil {
		c = new(LoginAwsResponse)
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *ProxyAwsRequest) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *ProxyAwsRequest:
		x.Region = v.GetRegion()
		x.HttpRequest = v.GetHttpRequest()
	default:
		if v, ok := v.(interface{ GetRegion() string }); ok {
			x.Region = v.GetRegion()
		}
		if v, ok := v.(interface {
			GetHttpRequest() *http_over_grpc.HTTPOverGRPCRequest
		}); ok {
			x.HttpRequest = v.GetHttpRequest()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *ProxyAwsRequest) Proto_ShallowClone() (c *ProxyAwsRequest) {
	if x != nil {
		c = new(ProxyAwsRequest)
		c.Region = x.Region
		c.HttpRequest = x.HttpRequest
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *ProxyAwsResponse) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *ProxyAwsResponse:
		x.HttpResponse = v.GetHttpResponse()
	default:
		if v, ok := v.(interface {
			GetHttpResponse() *http_over_grpc.HTTPOverGRPCReply
		}); ok {
			x.HttpResponse = v.GetHttpResponse()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *ProxyAwsResponse) Proto_ShallowClone() (c *ProxyAwsResponse) {
	if x != nil {
		c = new(ProxyAwsResponse)
		c.HttpResponse = x.HttpResponse
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *ListAwsRolesRequest) Proto_ShallowCopy(v interface{}) {
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *ListAwsRolesRequest) Proto_ShallowClone() (c *ListAwsRolesRequest) {
	if x != nil {
		c = new(ListAwsRolesRequest)
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *ListAwsRolesResponse) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *ListAwsRolesResponse:
		x.CidRegionToRoles = v.GetCidRegionToRoles()
	default:
		if v, ok := v.(interface{ GetCidRegionToRoles() map[string]*RoleList }); ok {
			x.CidRegionToRoles = v.GetCidRegionToRoles()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *ListAwsRolesResponse) Proto_ShallowClone() (c *ListAwsRolesResponse) {
	if x != nil {
		c = new(ListAwsRolesResponse)
		c.CidRegionToRoles = x.CidRegionToRoles
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *RoleList) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *RoleList:
		x.Roles = v.GetRoles()
	default:
		if v, ok := v.(interface{ GetRoles() []string }); ok {
			x.Roles = v.GetRoles()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *RoleList) Proto_ShallowClone() (c *RoleList) {
	if x != nil {
		c = new(RoleList)
		c.Roles = x.Roles
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *GetAwsRequest) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *GetAwsRequest:
		x.Region = v.GetRegion()
		x.CallerId = v.GetCallerId()
	default:
		if v, ok := v.(interface{ GetRegion() string }); ok {
			x.Region = v.GetRegion()
		}
		if v, ok := v.(interface{ GetCallerId() string }); ok {
			x.CallerId = v.GetCallerId()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *GetAwsRequest) Proto_ShallowClone() (c *GetAwsRequest) {
	if x != nil {
		c = new(GetAwsRequest)
		c.Region = x.Region
		c.CallerId = x.CallerId
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *GetAwsResponse) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *GetAwsResponse:
		x.RequestId = v.GetRequestId()
		x.HttpRequest = v.GetHttpRequest()
	default:
		if v, ok := v.(interface{ GetRequestId() int64 }); ok {
			x.RequestId = v.GetRequestId()
		}
		if v, ok := v.(interface {
			GetHttpRequest() *http_over_grpc.HTTPOverGRPCRequest
		}); ok {
			x.HttpRequest = v.GetHttpRequest()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *GetAwsResponse) Proto_ShallowClone() (c *GetAwsResponse) {
	if x != nil {
		c = new(GetAwsResponse)
		c.RequestId = x.RequestId
		c.HttpRequest = x.HttpRequest
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *SendAwsRequest) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *SendAwsRequest:
		x.RequestId = v.GetRequestId()
		x.HttpResponse = v.GetHttpResponse()
	default:
		if v, ok := v.(interface{ GetRequestId() int64 }); ok {
			x.RequestId = v.GetRequestId()
		}
		if v, ok := v.(interface {
			GetHttpResponse() *http_over_grpc.HTTPOverGRPCReply
		}); ok {
			x.HttpResponse = v.GetHttpResponse()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *SendAwsRequest) Proto_ShallowClone() (c *SendAwsRequest) {
	if x != nil {
		c = new(SendAwsRequest)
		c.RequestId = x.RequestId
		c.HttpResponse = x.HttpResponse
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
func (x *SendAwsResponse) Proto_ShallowCopy(v interface{}) {
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *SendAwsResponse) Proto_ShallowClone() (c *SendAwsResponse) {
	if x != nil {
		c = new(SendAwsResponse)
	}
	return
}

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
