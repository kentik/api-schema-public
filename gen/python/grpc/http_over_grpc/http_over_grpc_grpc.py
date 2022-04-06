# Generated by the Protocol Buffers compiler. DO NOT EDIT!
# source: grpc/http_over_grpc/http_over_grpc.proto
# plugin: grpclib.plugin.main
import abc
import typing

import grpclib.const
import grpclib.client
if typing.TYPE_CHECKING:
    import grpclib.server

import grpc.http_over_grpc.http_over_grpc_pb2


class HTTPOverGRPCBase(abc.ABC):

    @abc.abstractmethod
    async def HTTPRequest(self, stream: 'grpclib.server.Stream[grpc.http_over_grpc.http_over_grpc_pb2.HTTPOverGRPCRequest, grpc.http_over_grpc.http_over_grpc_pb2.HTTPOverGRPCReply]') -> None:
        pass

    def __mapping__(self) -> typing.Dict[str, grpclib.const.Handler]:
        return {
            '/grpc.http_over_grpc.HTTPOverGRPC/HTTPRequest': grpclib.const.Handler(
                self.HTTPRequest,
                grpclib.const.Cardinality.UNARY_UNARY,
                grpc.http_over_grpc.http_over_grpc_pb2.HTTPOverGRPCRequest,
                grpc.http_over_grpc.http_over_grpc_pb2.HTTPOverGRPCReply,
            ),
        }


class HTTPOverGRPCStub:

    def __init__(self, channel: grpclib.client.Channel) -> None:
        self.HTTPRequest = grpclib.client.UnaryUnaryMethod(
            channel,
            '/grpc.http_over_grpc.HTTPOverGRPC/HTTPRequest',
            grpc.http_over_grpc.http_over_grpc_pb2.HTTPOverGRPCRequest,
            grpc.http_over_grpc.http_over_grpc_pb2.HTTPOverGRPCReply,
        )
