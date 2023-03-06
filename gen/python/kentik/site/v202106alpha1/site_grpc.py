# Generated by the Protocol Buffers compiler. DO NOT EDIT!
# source: kentik/site/v202106alpha1/site.proto
# plugin: grpclib.plugin.main
import abc
import typing

import grpclib.const
import grpclib.client
if typing.TYPE_CHECKING:
    import grpclib.server

import google.api.annotations_pb2
import google.api.client_pb2
import google.type.latlng_pb2
import google.type.postal_address_pb2
import protoc_gen_openapiv2.options.annotations_pb2
import kentik.core.v202303.annotations_pb2
import kentik.site.v202106alpha1.site_pb2


class SiteServiceBase(abc.ABC):

    @abc.abstractmethod
    async def ListSite(self, stream: 'grpclib.server.Stream[kentik.site.v202106alpha1.site_pb2.ListSiteRequest, kentik.site.v202106alpha1.site_pb2.ListSiteResponse]') -> None:
        pass

    @abc.abstractmethod
    async def GetSite(self, stream: 'grpclib.server.Stream[kentik.site.v202106alpha1.site_pb2.GetSiteRequest, kentik.site.v202106alpha1.site_pb2.GetSiteResponse]') -> None:
        pass

    @abc.abstractmethod
    async def CreateSite(self, stream: 'grpclib.server.Stream[kentik.site.v202106alpha1.site_pb2.CreateSiteRequest, kentik.site.v202106alpha1.site_pb2.CreateSiteResponse]') -> None:
        pass

    @abc.abstractmethod
    async def UpdateSite(self, stream: 'grpclib.server.Stream[kentik.site.v202106alpha1.site_pb2.UpdateSiteRequest, kentik.site.v202106alpha1.site_pb2.UpdateSiteResponse]') -> None:
        pass

    @abc.abstractmethod
    async def DeleteSite(self, stream: 'grpclib.server.Stream[kentik.site.v202106alpha1.site_pb2.DeleteSiteRequest, kentik.site.v202106alpha1.site_pb2.DeleteSiteResponse]') -> None:
        pass

    def __mapping__(self) -> typing.Dict[str, grpclib.const.Handler]:
        return {
            '/kentik.site.v202106alpha1.SiteService/ListSite': grpclib.const.Handler(
                self.ListSite,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.site.v202106alpha1.site_pb2.ListSiteRequest,
                kentik.site.v202106alpha1.site_pb2.ListSiteResponse,
            ),
            '/kentik.site.v202106alpha1.SiteService/GetSite': grpclib.const.Handler(
                self.GetSite,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.site.v202106alpha1.site_pb2.GetSiteRequest,
                kentik.site.v202106alpha1.site_pb2.GetSiteResponse,
            ),
            '/kentik.site.v202106alpha1.SiteService/CreateSite': grpclib.const.Handler(
                self.CreateSite,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.site.v202106alpha1.site_pb2.CreateSiteRequest,
                kentik.site.v202106alpha1.site_pb2.CreateSiteResponse,
            ),
            '/kentik.site.v202106alpha1.SiteService/UpdateSite': grpclib.const.Handler(
                self.UpdateSite,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.site.v202106alpha1.site_pb2.UpdateSiteRequest,
                kentik.site.v202106alpha1.site_pb2.UpdateSiteResponse,
            ),
            '/kentik.site.v202106alpha1.SiteService/DeleteSite': grpclib.const.Handler(
                self.DeleteSite,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.site.v202106alpha1.site_pb2.DeleteSiteRequest,
                kentik.site.v202106alpha1.site_pb2.DeleteSiteResponse,
            ),
        }


class SiteServiceStub:

    def __init__(self, channel: grpclib.client.Channel) -> None:
        self.ListSite = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.site.v202106alpha1.SiteService/ListSite',
            kentik.site.v202106alpha1.site_pb2.ListSiteRequest,
            kentik.site.v202106alpha1.site_pb2.ListSiteResponse,
        )
        self.GetSite = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.site.v202106alpha1.SiteService/GetSite',
            kentik.site.v202106alpha1.site_pb2.GetSiteRequest,
            kentik.site.v202106alpha1.site_pb2.GetSiteResponse,
        )
        self.CreateSite = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.site.v202106alpha1.SiteService/CreateSite',
            kentik.site.v202106alpha1.site_pb2.CreateSiteRequest,
            kentik.site.v202106alpha1.site_pb2.CreateSiteResponse,
        )
        self.UpdateSite = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.site.v202106alpha1.SiteService/UpdateSite',
            kentik.site.v202106alpha1.site_pb2.UpdateSiteRequest,
            kentik.site.v202106alpha1.site_pb2.UpdateSiteResponse,
        )
        self.DeleteSite = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.site.v202106alpha1.SiteService/DeleteSite',
            kentik.site.v202106alpha1.site_pb2.DeleteSiteRequest,
            kentik.site.v202106alpha1.site_pb2.DeleteSiteResponse,
        )
