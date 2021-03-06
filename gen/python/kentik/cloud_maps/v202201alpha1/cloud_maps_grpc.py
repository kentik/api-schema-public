# Generated by the Protocol Buffers compiler. DO NOT EDIT!
# source: kentik/cloud_maps/v202201alpha1/cloud_maps.proto
# plugin: grpclib.plugin.main
import abc
import typing

import grpclib.const
import grpclib.client
if typing.TYPE_CHECKING:
    import grpclib.server

import google.api.http_pb2
import google.api.annotations_pb2
import google.api.client_pb2
import protoc_gen_openapiv2.options.annotations_pb2
import kentik.core.v202012alpha1.annotations_pb2
import kentik.cloud_maps.v202201alpha1.cloud_maps_pb2


class CloudMapsServiceBase(abc.ABC):

    @abc.abstractmethod
    async def ProvideAwsMetadataStorageLocation(self, stream: 'grpclib.server.Stream[kentik.cloud_maps.v202201alpha1.cloud_maps_pb2.ProvideAwsMetadataStorageLocationRequest, kentik.cloud_maps.v202201alpha1.cloud_maps_pb2.ProvideAwsMetadataStorageLocationResponse]') -> None:
        pass

    @abc.abstractmethod
    async def GetAwsCrawlerConfiguration(self, stream: 'grpclib.server.Stream[kentik.cloud_maps.v202201alpha1.cloud_maps_pb2.GetAwsCrawlerConfigurationRequest, kentik.cloud_maps.v202201alpha1.cloud_maps_pb2.GetAwsCrawlerConfigurationResponse]') -> None:
        pass

    def __mapping__(self) -> typing.Dict[str, grpclib.const.Handler]:
        return {
            '/kentik.cloud_maps.v202201alpha1.CloudMapsService/ProvideAwsMetadataStorageLocation': grpclib.const.Handler(
                self.ProvideAwsMetadataStorageLocation,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.cloud_maps.v202201alpha1.cloud_maps_pb2.ProvideAwsMetadataStorageLocationRequest,
                kentik.cloud_maps.v202201alpha1.cloud_maps_pb2.ProvideAwsMetadataStorageLocationResponse,
            ),
            '/kentik.cloud_maps.v202201alpha1.CloudMapsService/GetAwsCrawlerConfiguration': grpclib.const.Handler(
                self.GetAwsCrawlerConfiguration,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.cloud_maps.v202201alpha1.cloud_maps_pb2.GetAwsCrawlerConfigurationRequest,
                kentik.cloud_maps.v202201alpha1.cloud_maps_pb2.GetAwsCrawlerConfigurationResponse,
            ),
        }


class CloudMapsServiceStub:

    def __init__(self, channel: grpclib.client.Channel) -> None:
        self.ProvideAwsMetadataStorageLocation = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.cloud_maps.v202201alpha1.CloudMapsService/ProvideAwsMetadataStorageLocation',
            kentik.cloud_maps.v202201alpha1.cloud_maps_pb2.ProvideAwsMetadataStorageLocationRequest,
            kentik.cloud_maps.v202201alpha1.cloud_maps_pb2.ProvideAwsMetadataStorageLocationResponse,
        )
        self.GetAwsCrawlerConfiguration = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.cloud_maps.v202201alpha1.CloudMapsService/GetAwsCrawlerConfiguration',
            kentik.cloud_maps.v202201alpha1.cloud_maps_pb2.GetAwsCrawlerConfigurationRequest,
            kentik.cloud_maps.v202201alpha1.cloud_maps_pb2.GetAwsCrawlerConfigurationResponse,
        )
