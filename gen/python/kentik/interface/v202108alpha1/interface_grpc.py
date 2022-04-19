# Generated by the Protocol Buffers compiler. DO NOT EDIT!
# source: kentik/interface/v202108alpha1/interface.proto
# plugin: grpclib.plugin.main
import abc
import typing

import grpclib.const
import grpclib.client
if typing.TYPE_CHECKING:
    import grpclib.server

import google.api.annotations_pb2
import google.api.client_pb2
import protoc_gen_openapiv2.options.annotations_pb2
import kentik.core.v202012alpha1.annotations_pb2
import google.protobuf.timestamp_pb2
import kentik.interface.v202108alpha1.interface_pb2


class InterfaceServiceBase(abc.ABC):

    @abc.abstractmethod
    async def ManualClassify(self, stream: 'grpclib.server.Stream[kentik.interface.v202108alpha1.interface_pb2.ManualClassifyRequest, kentik.interface.v202108alpha1.interface_pb2.ManualClassifyResponse]') -> None:
        pass

    @abc.abstractmethod
    async def ListInterface(self, stream: 'grpclib.server.Stream[kentik.interface.v202108alpha1.interface_pb2.ListInterfaceRequest, kentik.interface.v202108alpha1.interface_pb2.ListInterfaceResponse]') -> None:
        pass

    @abc.abstractmethod
    async def GetInterface(self, stream: 'grpclib.server.Stream[kentik.interface.v202108alpha1.interface_pb2.GetInterfaceRequest, kentik.interface.v202108alpha1.interface_pb2.GetInterfaceResponse]') -> None:
        pass

    @abc.abstractmethod
    async def CreateInterface(self, stream: 'grpclib.server.Stream[kentik.interface.v202108alpha1.interface_pb2.CreateInterfaceRequest, kentik.interface.v202108alpha1.interface_pb2.CreateInterfaceResponse]') -> None:
        pass

    @abc.abstractmethod
    async def UpdateInterface(self, stream: 'grpclib.server.Stream[kentik.interface.v202108alpha1.interface_pb2.UpdateInterfaceRequest, kentik.interface.v202108alpha1.interface_pb2.UpdateInterfaceResponse]') -> None:
        pass

    @abc.abstractmethod
    async def DeleteInterface(self, stream: 'grpclib.server.Stream[kentik.interface.v202108alpha1.interface_pb2.DeleteInterfaceRequest, kentik.interface.v202108alpha1.interface_pb2.DeleteInterfaceResponse]') -> None:
        pass

    def __mapping__(self) -> typing.Dict[str, grpclib.const.Handler]:
        return {
            '/kentik.interface.v202108alpha1.InterfaceService/ManualClassify': grpclib.const.Handler(
                self.ManualClassify,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.interface.v202108alpha1.interface_pb2.ManualClassifyRequest,
                kentik.interface.v202108alpha1.interface_pb2.ManualClassifyResponse,
            ),
            '/kentik.interface.v202108alpha1.InterfaceService/ListInterface': grpclib.const.Handler(
                self.ListInterface,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.interface.v202108alpha1.interface_pb2.ListInterfaceRequest,
                kentik.interface.v202108alpha1.interface_pb2.ListInterfaceResponse,
            ),
            '/kentik.interface.v202108alpha1.InterfaceService/GetInterface': grpclib.const.Handler(
                self.GetInterface,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.interface.v202108alpha1.interface_pb2.GetInterfaceRequest,
                kentik.interface.v202108alpha1.interface_pb2.GetInterfaceResponse,
            ),
            '/kentik.interface.v202108alpha1.InterfaceService/CreateInterface': grpclib.const.Handler(
                self.CreateInterface,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.interface.v202108alpha1.interface_pb2.CreateInterfaceRequest,
                kentik.interface.v202108alpha1.interface_pb2.CreateInterfaceResponse,
            ),
            '/kentik.interface.v202108alpha1.InterfaceService/UpdateInterface': grpclib.const.Handler(
                self.UpdateInterface,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.interface.v202108alpha1.interface_pb2.UpdateInterfaceRequest,
                kentik.interface.v202108alpha1.interface_pb2.UpdateInterfaceResponse,
            ),
            '/kentik.interface.v202108alpha1.InterfaceService/DeleteInterface': grpclib.const.Handler(
                self.DeleteInterface,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.interface.v202108alpha1.interface_pb2.DeleteInterfaceRequest,
                kentik.interface.v202108alpha1.interface_pb2.DeleteInterfaceResponse,
            ),
        }


class InterfaceServiceStub:

    def __init__(self, channel: grpclib.client.Channel) -> None:
        self.ManualClassify = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.interface.v202108alpha1.InterfaceService/ManualClassify',
            kentik.interface.v202108alpha1.interface_pb2.ManualClassifyRequest,
            kentik.interface.v202108alpha1.interface_pb2.ManualClassifyResponse,
        )
        self.ListInterface = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.interface.v202108alpha1.InterfaceService/ListInterface',
            kentik.interface.v202108alpha1.interface_pb2.ListInterfaceRequest,
            kentik.interface.v202108alpha1.interface_pb2.ListInterfaceResponse,
        )
        self.GetInterface = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.interface.v202108alpha1.InterfaceService/GetInterface',
            kentik.interface.v202108alpha1.interface_pb2.GetInterfaceRequest,
            kentik.interface.v202108alpha1.interface_pb2.GetInterfaceResponse,
        )
        self.CreateInterface = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.interface.v202108alpha1.InterfaceService/CreateInterface',
            kentik.interface.v202108alpha1.interface_pb2.CreateInterfaceRequest,
            kentik.interface.v202108alpha1.interface_pb2.CreateInterfaceResponse,
        )
        self.UpdateInterface = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.interface.v202108alpha1.InterfaceService/UpdateInterface',
            kentik.interface.v202108alpha1.interface_pb2.UpdateInterfaceRequest,
            kentik.interface.v202108alpha1.interface_pb2.UpdateInterfaceResponse,
        )
        self.DeleteInterface = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.interface.v202108alpha1.InterfaceService/DeleteInterface',
            kentik.interface.v202108alpha1.interface_pb2.DeleteInterfaceRequest,
            kentik.interface.v202108alpha1.interface_pb2.DeleteInterfaceResponse,
        )