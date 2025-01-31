// Code generated by protoc-gen-go-grpc. DO NOT EDIT.

package diagnostic

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// DiagnosticServiceClient is the client API for DiagnosticService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type DiagnosticServiceClient interface {
	Echo(ctx context.Context, in *EchoRequest, opts ...grpc.CallOption) (*EchoResponse, error)
	Chat(ctx context.Context, opts ...grpc.CallOption) (DiagnosticService_ChatClient, error)
}

type diagnosticServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewDiagnosticServiceClient(cc grpc.ClientConnInterface) DiagnosticServiceClient {
	return &diagnosticServiceClient{cc}
}

func (c *diagnosticServiceClient) Echo(ctx context.Context, in *EchoRequest, opts ...grpc.CallOption) (*EchoResponse, error) {
	out := new(EchoResponse)
	err := c.cc.Invoke(ctx, "/kentik.diagnostic.v202501.DiagnosticService/Echo", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *diagnosticServiceClient) Chat(ctx context.Context, opts ...grpc.CallOption) (DiagnosticService_ChatClient, error) {
	stream, err := c.cc.NewStream(ctx, &DiagnosticService_ServiceDesc.Streams[0], "/kentik.diagnostic.v202501.DiagnosticService/Chat", opts...)
	if err != nil {
		return nil, err
	}
	x := &diagnosticServiceChatClient{stream}
	return x, nil
}

type DiagnosticService_ChatClient interface {
	Send(*ChatRequest) error
	Recv() (*ChatResponse, error)
	grpc.ClientStream
}

type diagnosticServiceChatClient struct {
	grpc.ClientStream
}

func (x *diagnosticServiceChatClient) Send(m *ChatRequest) error {
	return x.ClientStream.SendMsg(m)
}

func (x *diagnosticServiceChatClient) Recv() (*ChatResponse, error) {
	m := new(ChatResponse)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

// DiagnosticServiceServer is the server API for DiagnosticService service.
// All implementations should embed UnimplementedDiagnosticServiceServer
// for forward compatibility
type DiagnosticServiceServer interface {
	Echo(context.Context, *EchoRequest) (*EchoResponse, error)
	Chat(DiagnosticService_ChatServer) error
}

// UnimplementedDiagnosticServiceServer should be embedded to have forward compatible implementations.
type UnimplementedDiagnosticServiceServer struct {
}

func (UnimplementedDiagnosticServiceServer) Echo(context.Context, *EchoRequest) (*EchoResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Echo not implemented")
}
func (UnimplementedDiagnosticServiceServer) Chat(DiagnosticService_ChatServer) error {
	return status.Errorf(codes.Unimplemented, "method Chat not implemented")
}

// UnsafeDiagnosticServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to DiagnosticServiceServer will
// result in compilation errors.
type UnsafeDiagnosticServiceServer interface {
	mustEmbedUnimplementedDiagnosticServiceServer()
}

func RegisterDiagnosticServiceServer(s grpc.ServiceRegistrar, srv DiagnosticServiceServer) {
	s.RegisterService(&DiagnosticService_ServiceDesc, srv)
}

func _DiagnosticService_Echo_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(EchoRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DiagnosticServiceServer).Echo(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/kentik.diagnostic.v202501.DiagnosticService/Echo",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DiagnosticServiceServer).Echo(ctx, req.(*EchoRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _DiagnosticService_Chat_Handler(srv interface{}, stream grpc.ServerStream) error {
	return srv.(DiagnosticServiceServer).Chat(&diagnosticServiceChatServer{stream})
}

type DiagnosticService_ChatServer interface {
	Send(*ChatResponse) error
	Recv() (*ChatRequest, error)
	grpc.ServerStream
}

type diagnosticServiceChatServer struct {
	grpc.ServerStream
}

func (x *diagnosticServiceChatServer) Send(m *ChatResponse) error {
	return x.ServerStream.SendMsg(m)
}

func (x *diagnosticServiceChatServer) Recv() (*ChatRequest, error) {
	m := new(ChatRequest)
	if err := x.ServerStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

// DiagnosticService_ServiceDesc is the grpc.ServiceDesc for DiagnosticService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var DiagnosticService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "kentik.diagnostic.v202501.DiagnosticService",
	HandlerType: (*DiagnosticServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Echo",
			Handler:    _DiagnosticService_Echo_Handler,
		},
	},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "Chat",
			Handler:       _DiagnosticService_Chat_Handler,
			ServerStreams: true,
			ClientStreams: true,
		},
	},
	Metadata: "kentik/diagnostic/v202501/diagnostic.proto",
}
