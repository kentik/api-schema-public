# Generated by the Protocol Buffers compiler. DO NOT EDIT!
# source: kentik/custom_application/v202501alpha1/custom_application.proto
# plugin: grpclib.plugin.main
import abc
import typing

import grpclib.const
import grpclib.client
if typing.TYPE_CHECKING:
    import grpclib.server

import google.api.annotations_pb2
import google.api.client_pb2
import google.api.field_behavior_pb2
import google.protobuf.timestamp_pb2
import protoc_gen_openapiv2.options.annotations_pb2
import kentik.core.v202303.annotations_pb2
import kentik.user.v202211.user_pb2
import kentik.custom_application.v202501alpha1.custom_application_pb2


class CustomApplicationServiceBase(abc.ABC):

    @abc.abstractmethod
    async def CreateCustomApplication(self, stream: 'grpclib.server.Stream[kentik.custom_application.v202501alpha1.custom_application_pb2.CreateCustomApplicationRequest, kentik.custom_application.v202501alpha1.custom_application_pb2.CreateCustomApplicationResponse]') -> None:
        pass

    @abc.abstractmethod
    async def ListCustomApplications(self, stream: 'grpclib.server.Stream[kentik.custom_application.v202501alpha1.custom_application_pb2.ListCustomApplicationsRequest, kentik.custom_application.v202501alpha1.custom_application_pb2.ListCustomApplicationsResponse]') -> None:
        pass

    @abc.abstractmethod
    async def GetCustomApplication(self, stream: 'grpclib.server.Stream[kentik.custom_application.v202501alpha1.custom_application_pb2.GetCustomApplicationRequest, kentik.custom_application.v202501alpha1.custom_application_pb2.GetCustomApplicationResponse]') -> None:
        pass

    @abc.abstractmethod
    async def UpdateCustomApplication(self, stream: 'grpclib.server.Stream[kentik.custom_application.v202501alpha1.custom_application_pb2.UpdateCustomApplicationRequest, kentik.custom_application.v202501alpha1.custom_application_pb2.UpdateCustomApplicationResponse]') -> None:
        pass

    @abc.abstractmethod
    async def DeleteCustomApplication(self, stream: 'grpclib.server.Stream[kentik.custom_application.v202501alpha1.custom_application_pb2.DeleteCustomApplicationRequest, kentik.custom_application.v202501alpha1.custom_application_pb2.DeleteCustomApplicationResponse]') -> None:
        pass

    def __mapping__(self) -> typing.Dict[str, grpclib.const.Handler]:
        return {
            '/kentik.custom_application.v202501alpha1.CustomApplicationService/CreateCustomApplication': grpclib.const.Handler(
                self.CreateCustomApplication,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.custom_application.v202501alpha1.custom_application_pb2.CreateCustomApplicationRequest,
                kentik.custom_application.v202501alpha1.custom_application_pb2.CreateCustomApplicationResponse,
            ),
            '/kentik.custom_application.v202501alpha1.CustomApplicationService/ListCustomApplications': grpclib.const.Handler(
                self.ListCustomApplications,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.custom_application.v202501alpha1.custom_application_pb2.ListCustomApplicationsRequest,
                kentik.custom_application.v202501alpha1.custom_application_pb2.ListCustomApplicationsResponse,
            ),
            '/kentik.custom_application.v202501alpha1.CustomApplicationService/GetCustomApplication': grpclib.const.Handler(
                self.GetCustomApplication,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.custom_application.v202501alpha1.custom_application_pb2.GetCustomApplicationRequest,
                kentik.custom_application.v202501alpha1.custom_application_pb2.GetCustomApplicationResponse,
            ),
            '/kentik.custom_application.v202501alpha1.CustomApplicationService/UpdateCustomApplication': grpclib.const.Handler(
                self.UpdateCustomApplication,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.custom_application.v202501alpha1.custom_application_pb2.UpdateCustomApplicationRequest,
                kentik.custom_application.v202501alpha1.custom_application_pb2.UpdateCustomApplicationResponse,
            ),
            '/kentik.custom_application.v202501alpha1.CustomApplicationService/DeleteCustomApplication': grpclib.const.Handler(
                self.DeleteCustomApplication,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.custom_application.v202501alpha1.custom_application_pb2.DeleteCustomApplicationRequest,
                kentik.custom_application.v202501alpha1.custom_application_pb2.DeleteCustomApplicationResponse,
            ),
        }


class CustomApplicationServiceStub:

    def __init__(self, channel: grpclib.client.Channel) -> None:
        self.CreateCustomApplication = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.custom_application.v202501alpha1.CustomApplicationService/CreateCustomApplication',
            kentik.custom_application.v202501alpha1.custom_application_pb2.CreateCustomApplicationRequest,
            kentik.custom_application.v202501alpha1.custom_application_pb2.CreateCustomApplicationResponse,
        )
        self.ListCustomApplications = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.custom_application.v202501alpha1.CustomApplicationService/ListCustomApplications',
            kentik.custom_application.v202501alpha1.custom_application_pb2.ListCustomApplicationsRequest,
            kentik.custom_application.v202501alpha1.custom_application_pb2.ListCustomApplicationsResponse,
        )
        self.GetCustomApplication = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.custom_application.v202501alpha1.CustomApplicationService/GetCustomApplication',
            kentik.custom_application.v202501alpha1.custom_application_pb2.GetCustomApplicationRequest,
            kentik.custom_application.v202501alpha1.custom_application_pb2.GetCustomApplicationResponse,
        )
        self.UpdateCustomApplication = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.custom_application.v202501alpha1.CustomApplicationService/UpdateCustomApplication',
            kentik.custom_application.v202501alpha1.custom_application_pb2.UpdateCustomApplicationRequest,
            kentik.custom_application.v202501alpha1.custom_application_pb2.UpdateCustomApplicationResponse,
        )
        self.DeleteCustomApplication = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.custom_application.v202501alpha1.CustomApplicationService/DeleteCustomApplication',
            kentik.custom_application.v202501alpha1.custom_application_pb2.DeleteCustomApplicationRequest,
            kentik.custom_application.v202501alpha1.custom_application_pb2.DeleteCustomApplicationResponse,
        )
