# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc

from kentik.cloud_maps.v202201alpha1 import cloud_maps_pb2 as kentik_dot_cloud__maps_dot_v202201alpha1_dot_cloud__maps__pb2


class CloudMapsServiceStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.ProvideAwsMetadataStorage = channel.unary_unary(
                '/kentik.cloud_maps.v202201alpha1.CloudMapsService/ProvideAwsMetadataStorage',
                request_serializer=kentik_dot_cloud__maps_dot_v202201alpha1_dot_cloud__maps__pb2.ProvideAwsMetadataStorageRequest.SerializeToString,
                response_deserializer=kentik_dot_cloud__maps_dot_v202201alpha1_dot_cloud__maps__pb2.ProvideAwsMetadataStorageResponse.FromString,
                )


class CloudMapsServiceServicer(object):
    """Missing associated documentation comment in .proto file."""

    def ProvideAwsMetadataStorage(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_CloudMapsServiceServicer_to_server(servicer, server):
    rpc_method_handlers = {
            'ProvideAwsMetadataStorage': grpc.unary_unary_rpc_method_handler(
                    servicer.ProvideAwsMetadataStorage,
                    request_deserializer=kentik_dot_cloud__maps_dot_v202201alpha1_dot_cloud__maps__pb2.ProvideAwsMetadataStorageRequest.FromString,
                    response_serializer=kentik_dot_cloud__maps_dot_v202201alpha1_dot_cloud__maps__pb2.ProvideAwsMetadataStorageResponse.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'kentik.cloud_maps.v202201alpha1.CloudMapsService', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class CloudMapsService(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def ProvideAwsMetadataStorage(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/kentik.cloud_maps.v202201alpha1.CloudMapsService/ProvideAwsMetadataStorage',
            kentik_dot_cloud__maps_dot_v202201alpha1_dot_cloud__maps__pb2.ProvideAwsMetadataStorageRequest.SerializeToString,
            kentik_dot_cloud__maps_dot_v202201alpha1_dot_cloud__maps__pb2.ProvideAwsMetadataStorageResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)
