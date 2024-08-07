# Generated by the Protocol Buffers compiler. DO NOT EDIT!
# source: kentik/vault/v202312alpha1/vault.proto
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
import kentik.vault.v202312alpha1.vault_pb2


class VaultServiceBase(abc.ABC):

    @abc.abstractmethod
    async def GetSecret(self, stream: 'grpclib.server.Stream[kentik.vault.v202312alpha1.vault_pb2.GetSecretRequest, kentik.vault.v202312alpha1.vault_pb2.GetSecretResponse]') -> None:
        pass

    @abc.abstractmethod
    async def ListSecret(self, stream: 'grpclib.server.Stream[kentik.vault.v202312alpha1.vault_pb2.ListSecretRequest, kentik.vault.v202312alpha1.vault_pb2.ListSecretResponse]') -> None:
        pass

    def __mapping__(self) -> typing.Dict[str, grpclib.const.Handler]:
        return {
            '/kentik.vault.v202312alpha1.VaultService/GetSecret': grpclib.const.Handler(
                self.GetSecret,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.vault.v202312alpha1.vault_pb2.GetSecretRequest,
                kentik.vault.v202312alpha1.vault_pb2.GetSecretResponse,
            ),
            '/kentik.vault.v202312alpha1.VaultService/ListSecret': grpclib.const.Handler(
                self.ListSecret,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.vault.v202312alpha1.vault_pb2.ListSecretRequest,
                kentik.vault.v202312alpha1.vault_pb2.ListSecretResponse,
            ),
        }


class VaultServiceStub:

    def __init__(self, channel: grpclib.client.Channel) -> None:
        self.GetSecret = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.vault.v202312alpha1.VaultService/GetSecret',
            kentik.vault.v202312alpha1.vault_pb2.GetSecretRequest,
            kentik.vault.v202312alpha1.vault_pb2.GetSecretResponse,
        )
        self.ListSecret = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.vault.v202312alpha1.VaultService/ListSecret',
            kentik.vault.v202312alpha1.vault_pb2.ListSecretRequest,
            kentik.vault.v202312alpha1.vault_pb2.ListSecretResponse,
        )
