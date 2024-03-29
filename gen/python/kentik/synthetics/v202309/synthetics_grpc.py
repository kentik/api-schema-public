# Generated by the Protocol Buffers compiler. DO NOT EDIT!
# source: kentik/synthetics/v202309/synthetics.proto
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
import kentik.core.v202303.user_info_pb2
import kentik.synthetics.v202309.synthetics_pb2


class SyntheticsDataServiceBase(abc.ABC):

    @abc.abstractmethod
    async def GetResultsForTests(self, stream: 'grpclib.server.Stream[kentik.synthetics.v202309.synthetics_pb2.GetResultsForTestsRequest, kentik.synthetics.v202309.synthetics_pb2.GetResultsForTestsResponse]') -> None:
        pass

    @abc.abstractmethod
    async def GetTraceForTest(self, stream: 'grpclib.server.Stream[kentik.synthetics.v202309.synthetics_pb2.GetTraceForTestRequest, kentik.synthetics.v202309.synthetics_pb2.GetTraceForTestResponse]') -> None:
        pass

    def __mapping__(self) -> typing.Dict[str, grpclib.const.Handler]:
        return {
            '/kentik.synthetics.v202309.SyntheticsDataService/GetResultsForTests': grpclib.const.Handler(
                self.GetResultsForTests,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.synthetics.v202309.synthetics_pb2.GetResultsForTestsRequest,
                kentik.synthetics.v202309.synthetics_pb2.GetResultsForTestsResponse,
            ),
            '/kentik.synthetics.v202309.SyntheticsDataService/GetTraceForTest': grpclib.const.Handler(
                self.GetTraceForTest,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.synthetics.v202309.synthetics_pb2.GetTraceForTestRequest,
                kentik.synthetics.v202309.synthetics_pb2.GetTraceForTestResponse,
            ),
        }


class SyntheticsDataServiceStub:

    def __init__(self, channel: grpclib.client.Channel) -> None:
        self.GetResultsForTests = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.synthetics.v202309.SyntheticsDataService/GetResultsForTests',
            kentik.synthetics.v202309.synthetics_pb2.GetResultsForTestsRequest,
            kentik.synthetics.v202309.synthetics_pb2.GetResultsForTestsResponse,
        )
        self.GetTraceForTest = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.synthetics.v202309.SyntheticsDataService/GetTraceForTest',
            kentik.synthetics.v202309.synthetics_pb2.GetTraceForTestRequest,
            kentik.synthetics.v202309.synthetics_pb2.GetTraceForTestResponse,
        )


class SyntheticsAdminServiceBase(abc.ABC):

    @abc.abstractmethod
    async def ListAgents(self, stream: 'grpclib.server.Stream[kentik.synthetics.v202309.synthetics_pb2.ListAgentsRequest, kentik.synthetics.v202309.synthetics_pb2.ListAgentsResponse]') -> None:
        pass

    @abc.abstractmethod
    async def GetAgent(self, stream: 'grpclib.server.Stream[kentik.synthetics.v202309.synthetics_pb2.GetAgentRequest, kentik.synthetics.v202309.synthetics_pb2.GetAgentResponse]') -> None:
        pass

    @abc.abstractmethod
    async def UpdateAgent(self, stream: 'grpclib.server.Stream[kentik.synthetics.v202309.synthetics_pb2.UpdateAgentRequest, kentik.synthetics.v202309.synthetics_pb2.UpdateAgentResponse]') -> None:
        pass

    @abc.abstractmethod
    async def DeleteAgent(self, stream: 'grpclib.server.Stream[kentik.synthetics.v202309.synthetics_pb2.DeleteAgentRequest, kentik.synthetics.v202309.synthetics_pb2.DeleteAgentResponse]') -> None:
        pass

    @abc.abstractmethod
    async def ListTests(self, stream: 'grpclib.server.Stream[kentik.synthetics.v202309.synthetics_pb2.ListTestsRequest, kentik.synthetics.v202309.synthetics_pb2.ListTestsResponse]') -> None:
        pass

    @abc.abstractmethod
    async def CreateTest(self, stream: 'grpclib.server.Stream[kentik.synthetics.v202309.synthetics_pb2.CreateTestRequest, kentik.synthetics.v202309.synthetics_pb2.CreateTestResponse]') -> None:
        pass

    @abc.abstractmethod
    async def GetTest(self, stream: 'grpclib.server.Stream[kentik.synthetics.v202309.synthetics_pb2.GetTestRequest, kentik.synthetics.v202309.synthetics_pb2.GetTestResponse]') -> None:
        pass

    @abc.abstractmethod
    async def UpdateTest(self, stream: 'grpclib.server.Stream[kentik.synthetics.v202309.synthetics_pb2.UpdateTestRequest, kentik.synthetics.v202309.synthetics_pb2.UpdateTestResponse]') -> None:
        pass

    @abc.abstractmethod
    async def DeleteTest(self, stream: 'grpclib.server.Stream[kentik.synthetics.v202309.synthetics_pb2.DeleteTestRequest, kentik.synthetics.v202309.synthetics_pb2.DeleteTestResponse]') -> None:
        pass

    @abc.abstractmethod
    async def SetTestStatus(self, stream: 'grpclib.server.Stream[kentik.synthetics.v202309.synthetics_pb2.SetTestStatusRequest, kentik.synthetics.v202309.synthetics_pb2.SetTestStatusResponse]') -> None:
        pass

    def __mapping__(self) -> typing.Dict[str, grpclib.const.Handler]:
        return {
            '/kentik.synthetics.v202309.SyntheticsAdminService/ListAgents': grpclib.const.Handler(
                self.ListAgents,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.synthetics.v202309.synthetics_pb2.ListAgentsRequest,
                kentik.synthetics.v202309.synthetics_pb2.ListAgentsResponse,
            ),
            '/kentik.synthetics.v202309.SyntheticsAdminService/GetAgent': grpclib.const.Handler(
                self.GetAgent,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.synthetics.v202309.synthetics_pb2.GetAgentRequest,
                kentik.synthetics.v202309.synthetics_pb2.GetAgentResponse,
            ),
            '/kentik.synthetics.v202309.SyntheticsAdminService/UpdateAgent': grpclib.const.Handler(
                self.UpdateAgent,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.synthetics.v202309.synthetics_pb2.UpdateAgentRequest,
                kentik.synthetics.v202309.synthetics_pb2.UpdateAgentResponse,
            ),
            '/kentik.synthetics.v202309.SyntheticsAdminService/DeleteAgent': grpclib.const.Handler(
                self.DeleteAgent,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.synthetics.v202309.synthetics_pb2.DeleteAgentRequest,
                kentik.synthetics.v202309.synthetics_pb2.DeleteAgentResponse,
            ),
            '/kentik.synthetics.v202309.SyntheticsAdminService/ListTests': grpclib.const.Handler(
                self.ListTests,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.synthetics.v202309.synthetics_pb2.ListTestsRequest,
                kentik.synthetics.v202309.synthetics_pb2.ListTestsResponse,
            ),
            '/kentik.synthetics.v202309.SyntheticsAdminService/CreateTest': grpclib.const.Handler(
                self.CreateTest,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.synthetics.v202309.synthetics_pb2.CreateTestRequest,
                kentik.synthetics.v202309.synthetics_pb2.CreateTestResponse,
            ),
            '/kentik.synthetics.v202309.SyntheticsAdminService/GetTest': grpclib.const.Handler(
                self.GetTest,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.synthetics.v202309.synthetics_pb2.GetTestRequest,
                kentik.synthetics.v202309.synthetics_pb2.GetTestResponse,
            ),
            '/kentik.synthetics.v202309.SyntheticsAdminService/UpdateTest': grpclib.const.Handler(
                self.UpdateTest,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.synthetics.v202309.synthetics_pb2.UpdateTestRequest,
                kentik.synthetics.v202309.synthetics_pb2.UpdateTestResponse,
            ),
            '/kentik.synthetics.v202309.SyntheticsAdminService/DeleteTest': grpclib.const.Handler(
                self.DeleteTest,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.synthetics.v202309.synthetics_pb2.DeleteTestRequest,
                kentik.synthetics.v202309.synthetics_pb2.DeleteTestResponse,
            ),
            '/kentik.synthetics.v202309.SyntheticsAdminService/SetTestStatus': grpclib.const.Handler(
                self.SetTestStatus,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.synthetics.v202309.synthetics_pb2.SetTestStatusRequest,
                kentik.synthetics.v202309.synthetics_pb2.SetTestStatusResponse,
            ),
        }


class SyntheticsAdminServiceStub:

    def __init__(self, channel: grpclib.client.Channel) -> None:
        self.ListAgents = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.synthetics.v202309.SyntheticsAdminService/ListAgents',
            kentik.synthetics.v202309.synthetics_pb2.ListAgentsRequest,
            kentik.synthetics.v202309.synthetics_pb2.ListAgentsResponse,
        )
        self.GetAgent = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.synthetics.v202309.SyntheticsAdminService/GetAgent',
            kentik.synthetics.v202309.synthetics_pb2.GetAgentRequest,
            kentik.synthetics.v202309.synthetics_pb2.GetAgentResponse,
        )
        self.UpdateAgent = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.synthetics.v202309.SyntheticsAdminService/UpdateAgent',
            kentik.synthetics.v202309.synthetics_pb2.UpdateAgentRequest,
            kentik.synthetics.v202309.synthetics_pb2.UpdateAgentResponse,
        )
        self.DeleteAgent = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.synthetics.v202309.SyntheticsAdminService/DeleteAgent',
            kentik.synthetics.v202309.synthetics_pb2.DeleteAgentRequest,
            kentik.synthetics.v202309.synthetics_pb2.DeleteAgentResponse,
        )
        self.ListTests = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.synthetics.v202309.SyntheticsAdminService/ListTests',
            kentik.synthetics.v202309.synthetics_pb2.ListTestsRequest,
            kentik.synthetics.v202309.synthetics_pb2.ListTestsResponse,
        )
        self.CreateTest = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.synthetics.v202309.SyntheticsAdminService/CreateTest',
            kentik.synthetics.v202309.synthetics_pb2.CreateTestRequest,
            kentik.synthetics.v202309.synthetics_pb2.CreateTestResponse,
        )
        self.GetTest = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.synthetics.v202309.SyntheticsAdminService/GetTest',
            kentik.synthetics.v202309.synthetics_pb2.GetTestRequest,
            kentik.synthetics.v202309.synthetics_pb2.GetTestResponse,
        )
        self.UpdateTest = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.synthetics.v202309.SyntheticsAdminService/UpdateTest',
            kentik.synthetics.v202309.synthetics_pb2.UpdateTestRequest,
            kentik.synthetics.v202309.synthetics_pb2.UpdateTestResponse,
        )
        self.DeleteTest = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.synthetics.v202309.SyntheticsAdminService/DeleteTest',
            kentik.synthetics.v202309.synthetics_pb2.DeleteTestRequest,
            kentik.synthetics.v202309.synthetics_pb2.DeleteTestResponse,
        )
        self.SetTestStatus = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.synthetics.v202309.SyntheticsAdminService/SetTestStatus',
            kentik.synthetics.v202309.synthetics_pb2.SetTestStatusRequest,
            kentik.synthetics.v202309.synthetics_pb2.SetTestStatusResponse,
        )
