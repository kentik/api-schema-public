# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc

from kentik.synthetics.v202202 import synthetics_pb2 as kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2


class SyntheticsDataServiceStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.GetResultsForTests = channel.unary_unary(
                '/kentik.synthetics.v202202.SyntheticsDataService/GetResultsForTests',
                request_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetResultsForTestsRequest.SerializeToString,
                response_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetResultsForTestsResponse.FromString,
                )
        self.GetHealthForTests = channel.unary_unary(
                '/kentik.synthetics.v202202.SyntheticsDataService/GetHealthForTests',
                request_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetHealthForTestsRequest.SerializeToString,
                response_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetHealthForTestsResponse.FromString,
                )
        self.GetTraceForTest = channel.unary_unary(
                '/kentik.synthetics.v202202.SyntheticsDataService/GetTraceForTest',
                request_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetTraceForTestRequest.SerializeToString,
                response_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetTraceForTestResponse.FromString,
                )


class SyntheticsDataServiceServicer(object):
    """Missing associated documentation comment in .proto file."""

    def GetResultsForTests(self, request, context):
        """Get measurement results for a set of tests
        """
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def GetHealthForTests(self, request, context):
        """Get health evalutation for a set of tests
        """
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def GetTraceForTest(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_SyntheticsDataServiceServicer_to_server(servicer, server):
    rpc_method_handlers = {
            'GetResultsForTests': grpc.unary_unary_rpc_method_handler(
                    servicer.GetResultsForTests,
                    request_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetResultsForTestsRequest.FromString,
                    response_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetResultsForTestsResponse.SerializeToString,
            ),
            'GetHealthForTests': grpc.unary_unary_rpc_method_handler(
                    servicer.GetHealthForTests,
                    request_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetHealthForTestsRequest.FromString,
                    response_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetHealthForTestsResponse.SerializeToString,
            ),
            'GetTraceForTest': grpc.unary_unary_rpc_method_handler(
                    servicer.GetTraceForTest,
                    request_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetTraceForTestRequest.FromString,
                    response_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetTraceForTestResponse.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'kentik.synthetics.v202202.SyntheticsDataService', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class SyntheticsDataService(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def GetResultsForTests(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/kentik.synthetics.v202202.SyntheticsDataService/GetResultsForTests',
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetResultsForTestsRequest.SerializeToString,
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetResultsForTestsResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def GetHealthForTests(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/kentik.synthetics.v202202.SyntheticsDataService/GetHealthForTests',
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetHealthForTestsRequest.SerializeToString,
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetHealthForTestsResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def GetTraceForTest(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/kentik.synthetics.v202202.SyntheticsDataService/GetTraceForTest',
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetTraceForTestRequest.SerializeToString,
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetTraceForTestResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)


class SyntheticsAdminServiceStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.ListAgents = channel.unary_unary(
                '/kentik.synthetics.v202202.SyntheticsAdminService/ListAgents',
                request_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.ListAgentsRequest.SerializeToString,
                response_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.ListAgentsResponse.FromString,
                )
        self.GetAgent = channel.unary_unary(
                '/kentik.synthetics.v202202.SyntheticsAdminService/GetAgent',
                request_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetAgentRequest.SerializeToString,
                response_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetAgentResponse.FromString,
                )
        self.UpdateAgent = channel.unary_unary(
                '/kentik.synthetics.v202202.SyntheticsAdminService/UpdateAgent',
                request_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.UpdateAgentRequest.SerializeToString,
                response_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.UpdateAgentResponse.FromString,
                )
        self.DeleteAgent = channel.unary_unary(
                '/kentik.synthetics.v202202.SyntheticsAdminService/DeleteAgent',
                request_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.DeleteAgentRequest.SerializeToString,
                response_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.DeleteAgentResponse.FromString,
                )
        self.ListTests = channel.unary_unary(
                '/kentik.synthetics.v202202.SyntheticsAdminService/ListTests',
                request_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.ListTestsRequest.SerializeToString,
                response_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.ListTestsResponse.FromString,
                )
        self.CreateTest = channel.unary_unary(
                '/kentik.synthetics.v202202.SyntheticsAdminService/CreateTest',
                request_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.CreateTestRequest.SerializeToString,
                response_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.CreateTestResponse.FromString,
                )
        self.GetTest = channel.unary_unary(
                '/kentik.synthetics.v202202.SyntheticsAdminService/GetTest',
                request_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetTestRequest.SerializeToString,
                response_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetTestResponse.FromString,
                )
        self.UpdateTest = channel.unary_unary(
                '/kentik.synthetics.v202202.SyntheticsAdminService/UpdateTest',
                request_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.UpdateTestRequest.SerializeToString,
                response_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.UpdateTestResponse.FromString,
                )
        self.DeleteTest = channel.unary_unary(
                '/kentik.synthetics.v202202.SyntheticsAdminService/DeleteTest',
                request_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.DeleteTestRequest.SerializeToString,
                response_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.DeleteTestResponse.FromString,
                )


class SyntheticsAdminServiceServicer(object):
    """Missing associated documentation comment in .proto file."""

    def ListAgents(self, request, context):
        """Agents

        """
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def GetAgent(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def UpdateAgent(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def DeleteAgent(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def ListTests(self, request, context):
        """Tests

        """
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def CreateTest(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def GetTest(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def UpdateTest(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def DeleteTest(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_SyntheticsAdminServiceServicer_to_server(servicer, server):
    rpc_method_handlers = {
            'ListAgents': grpc.unary_unary_rpc_method_handler(
                    servicer.ListAgents,
                    request_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.ListAgentsRequest.FromString,
                    response_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.ListAgentsResponse.SerializeToString,
            ),
            'GetAgent': grpc.unary_unary_rpc_method_handler(
                    servicer.GetAgent,
                    request_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetAgentRequest.FromString,
                    response_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetAgentResponse.SerializeToString,
            ),
            'UpdateAgent': grpc.unary_unary_rpc_method_handler(
                    servicer.UpdateAgent,
                    request_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.UpdateAgentRequest.FromString,
                    response_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.UpdateAgentResponse.SerializeToString,
            ),
            'DeleteAgent': grpc.unary_unary_rpc_method_handler(
                    servicer.DeleteAgent,
                    request_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.DeleteAgentRequest.FromString,
                    response_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.DeleteAgentResponse.SerializeToString,
            ),
            'ListTests': grpc.unary_unary_rpc_method_handler(
                    servicer.ListTests,
                    request_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.ListTestsRequest.FromString,
                    response_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.ListTestsResponse.SerializeToString,
            ),
            'CreateTest': grpc.unary_unary_rpc_method_handler(
                    servicer.CreateTest,
                    request_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.CreateTestRequest.FromString,
                    response_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.CreateTestResponse.SerializeToString,
            ),
            'GetTest': grpc.unary_unary_rpc_method_handler(
                    servicer.GetTest,
                    request_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetTestRequest.FromString,
                    response_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetTestResponse.SerializeToString,
            ),
            'UpdateTest': grpc.unary_unary_rpc_method_handler(
                    servicer.UpdateTest,
                    request_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.UpdateTestRequest.FromString,
                    response_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.UpdateTestResponse.SerializeToString,
            ),
            'DeleteTest': grpc.unary_unary_rpc_method_handler(
                    servicer.DeleteTest,
                    request_deserializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.DeleteTestRequest.FromString,
                    response_serializer=kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.DeleteTestResponse.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'kentik.synthetics.v202202.SyntheticsAdminService', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class SyntheticsAdminService(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def ListAgents(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/kentik.synthetics.v202202.SyntheticsAdminService/ListAgents',
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.ListAgentsRequest.SerializeToString,
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.ListAgentsResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def GetAgent(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/kentik.synthetics.v202202.SyntheticsAdminService/GetAgent',
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetAgentRequest.SerializeToString,
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetAgentResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def UpdateAgent(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/kentik.synthetics.v202202.SyntheticsAdminService/UpdateAgent',
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.UpdateAgentRequest.SerializeToString,
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.UpdateAgentResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def DeleteAgent(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/kentik.synthetics.v202202.SyntheticsAdminService/DeleteAgent',
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.DeleteAgentRequest.SerializeToString,
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.DeleteAgentResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def ListTests(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/kentik.synthetics.v202202.SyntheticsAdminService/ListTests',
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.ListTestsRequest.SerializeToString,
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.ListTestsResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def CreateTest(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/kentik.synthetics.v202202.SyntheticsAdminService/CreateTest',
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.CreateTestRequest.SerializeToString,
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.CreateTestResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def GetTest(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/kentik.synthetics.v202202.SyntheticsAdminService/GetTest',
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetTestRequest.SerializeToString,
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.GetTestResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def UpdateTest(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/kentik.synthetics.v202202.SyntheticsAdminService/UpdateTest',
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.UpdateTestRequest.SerializeToString,
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.UpdateTestResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def DeleteTest(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/kentik.synthetics.v202202.SyntheticsAdminService/DeleteTest',
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.DeleteTestRequest.SerializeToString,
            kentik_dot_synthetics_dot_v202202_dot_synthetics__pb2.DeleteTestResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)
