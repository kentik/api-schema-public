# Generated by the Protocol Buffers compiler. DO NOT EDIT!
# source: kentik/connectivity_checker/v202410beta1/connectivity_checker.proto
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
import protoc_gen_openapiv2.options.annotations_pb2
import google.protobuf.timestamp_pb2
import kentik.core.v202303.annotations_pb2
import kentik.connectivity_checker.v202410beta1.connectivity_checker_pb2


class ConnectivityCheckerAdminServiceBase(abc.ABC):

    @abc.abstractmethod
    async def CreateConnectivityReport(self, stream: 'grpclib.server.Stream[kentik.connectivity_checker.v202410beta1.connectivity_checker_pb2.CreateConnectivityReportRequest, kentik.connectivity_checker.v202410beta1.connectivity_checker_pb2.CreateConnectivityReportResponse]') -> None:
        pass

    def __mapping__(self) -> typing.Dict[str, grpclib.const.Handler]:
        return {
            '/kentik.connectivity_checker.v202410beta1.ConnectivityCheckerAdminService/CreateConnectivityReport': grpclib.const.Handler(
                self.CreateConnectivityReport,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.connectivity_checker.v202410beta1.connectivity_checker_pb2.CreateConnectivityReportRequest,
                kentik.connectivity_checker.v202410beta1.connectivity_checker_pb2.CreateConnectivityReportResponse,
            ),
        }


class ConnectivityCheckerAdminServiceStub:

    def __init__(self, channel: grpclib.client.Channel) -> None:
        self.CreateConnectivityReport = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.connectivity_checker.v202410beta1.ConnectivityCheckerAdminService/CreateConnectivityReport',
            kentik.connectivity_checker.v202410beta1.connectivity_checker_pb2.CreateConnectivityReportRequest,
            kentik.connectivity_checker.v202410beta1.connectivity_checker_pb2.CreateConnectivityReportResponse,
        )
