# Generated by the Protocol Buffers compiler. DO NOT EDIT!
# source: kentik/notification_channel/v202210/notification_channel.proto
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
import kentik.core.v202303.annotations_pb2
import google.protobuf.timestamp_pb2
import kentik.notification_channel.v202210.notification_channel_pb2


class NotificationChannelServiceBase(abc.ABC):

    @abc.abstractmethod
    async def ListNotificationChannels(self, stream: 'grpclib.server.Stream[kentik.notification_channel.v202210.notification_channel_pb2.ListNotificationChannelsRequest, kentik.notification_channel.v202210.notification_channel_pb2.ListNotificationChannelsResponse]') -> None:
        pass

    @abc.abstractmethod
    async def GetNotificationChannel(self, stream: 'grpclib.server.Stream[kentik.notification_channel.v202210.notification_channel_pb2.GetNotificationChannelRequest, kentik.notification_channel.v202210.notification_channel_pb2.GetNotificationChannelResponse]') -> None:
        pass

    @abc.abstractmethod
    async def SearchNotificationChannels(self, stream: 'grpclib.server.Stream[kentik.notification_channel.v202210.notification_channel_pb2.SearchNotificationChannelsRequest, kentik.notification_channel.v202210.notification_channel_pb2.SearchNotificationChannelsResponse]') -> None:
        pass

    def __mapping__(self) -> typing.Dict[str, grpclib.const.Handler]:
        return {
            '/kentik.notification_channel.v202210.NotificationChannelService/ListNotificationChannels': grpclib.const.Handler(
                self.ListNotificationChannels,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.notification_channel.v202210.notification_channel_pb2.ListNotificationChannelsRequest,
                kentik.notification_channel.v202210.notification_channel_pb2.ListNotificationChannelsResponse,
            ),
            '/kentik.notification_channel.v202210.NotificationChannelService/GetNotificationChannel': grpclib.const.Handler(
                self.GetNotificationChannel,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.notification_channel.v202210.notification_channel_pb2.GetNotificationChannelRequest,
                kentik.notification_channel.v202210.notification_channel_pb2.GetNotificationChannelResponse,
            ),
            '/kentik.notification_channel.v202210.NotificationChannelService/SearchNotificationChannels': grpclib.const.Handler(
                self.SearchNotificationChannels,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.notification_channel.v202210.notification_channel_pb2.SearchNotificationChannelsRequest,
                kentik.notification_channel.v202210.notification_channel_pb2.SearchNotificationChannelsResponse,
            ),
        }


class NotificationChannelServiceStub:

    def __init__(self, channel: grpclib.client.Channel) -> None:
        self.ListNotificationChannels = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.notification_channel.v202210.NotificationChannelService/ListNotificationChannels',
            kentik.notification_channel.v202210.notification_channel_pb2.ListNotificationChannelsRequest,
            kentik.notification_channel.v202210.notification_channel_pb2.ListNotificationChannelsResponse,
        )
        self.GetNotificationChannel = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.notification_channel.v202210.NotificationChannelService/GetNotificationChannel',
            kentik.notification_channel.v202210.notification_channel_pb2.GetNotificationChannelRequest,
            kentik.notification_channel.v202210.notification_channel_pb2.GetNotificationChannelResponse,
        )
        self.SearchNotificationChannels = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.notification_channel.v202210.NotificationChannelService/SearchNotificationChannels',
            kentik.notification_channel.v202210.notification_channel_pb2.SearchNotificationChannelsRequest,
            kentik.notification_channel.v202210.notification_channel_pb2.SearchNotificationChannelsResponse,
        )
