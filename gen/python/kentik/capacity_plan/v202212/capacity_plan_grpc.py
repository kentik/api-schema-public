# Generated by the Protocol Buffers compiler. DO NOT EDIT!
# source: kentik/capacity_plan/v202212/capacity_plan.proto
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
import kentik.capacity_plan.v202212.capacity_plan_pb2


class CapacityPlanServiceBase(abc.ABC):

    @abc.abstractmethod
    async def ListCapacitySummaries(self, stream: 'grpclib.server.Stream[kentik.capacity_plan.v202212.capacity_plan_pb2.ListCapacitySummariesRequest, kentik.capacity_plan.v202212.capacity_plan_pb2.ListCapacitySummariesResponse]') -> None:
        pass

    @abc.abstractmethod
    async def GetCapacitySummary(self, stream: 'grpclib.server.Stream[kentik.capacity_plan.v202212.capacity_plan_pb2.GetCapacitySummaryRequest, kentik.capacity_plan.v202212.capacity_plan_pb2.GetCapacitySummaryResponse]') -> None:
        pass

    @abc.abstractmethod
    async def ListCapacityPlans(self, stream: 'grpclib.server.Stream[kentik.capacity_plan.v202212.capacity_plan_pb2.ListCapacityPlansRequest, kentik.capacity_plan.v202212.capacity_plan_pb2.ListCapacityPlansResponse]') -> None:
        pass

    @abc.abstractmethod
    async def GetCapacityPlan(self, stream: 'grpclib.server.Stream[kentik.capacity_plan.v202212.capacity_plan_pb2.GetCapacityPlanRequest, kentik.capacity_plan.v202212.capacity_plan_pb2.GetCapacityPlanResponse]') -> None:
        pass

    def __mapping__(self) -> typing.Dict[str, grpclib.const.Handler]:
        return {
            '/kentik.capacity_plan.v202212.CapacityPlanService/ListCapacitySummaries': grpclib.const.Handler(
                self.ListCapacitySummaries,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.capacity_plan.v202212.capacity_plan_pb2.ListCapacitySummariesRequest,
                kentik.capacity_plan.v202212.capacity_plan_pb2.ListCapacitySummariesResponse,
            ),
            '/kentik.capacity_plan.v202212.CapacityPlanService/GetCapacitySummary': grpclib.const.Handler(
                self.GetCapacitySummary,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.capacity_plan.v202212.capacity_plan_pb2.GetCapacitySummaryRequest,
                kentik.capacity_plan.v202212.capacity_plan_pb2.GetCapacitySummaryResponse,
            ),
            '/kentik.capacity_plan.v202212.CapacityPlanService/ListCapacityPlans': grpclib.const.Handler(
                self.ListCapacityPlans,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.capacity_plan.v202212.capacity_plan_pb2.ListCapacityPlansRequest,
                kentik.capacity_plan.v202212.capacity_plan_pb2.ListCapacityPlansResponse,
            ),
            '/kentik.capacity_plan.v202212.CapacityPlanService/GetCapacityPlan': grpclib.const.Handler(
                self.GetCapacityPlan,
                grpclib.const.Cardinality.UNARY_UNARY,
                kentik.capacity_plan.v202212.capacity_plan_pb2.GetCapacityPlanRequest,
                kentik.capacity_plan.v202212.capacity_plan_pb2.GetCapacityPlanResponse,
            ),
        }


class CapacityPlanServiceStub:

    def __init__(self, channel: grpclib.client.Channel) -> None:
        self.ListCapacitySummaries = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.capacity_plan.v202212.CapacityPlanService/ListCapacitySummaries',
            kentik.capacity_plan.v202212.capacity_plan_pb2.ListCapacitySummariesRequest,
            kentik.capacity_plan.v202212.capacity_plan_pb2.ListCapacitySummariesResponse,
        )
        self.GetCapacitySummary = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.capacity_plan.v202212.CapacityPlanService/GetCapacitySummary',
            kentik.capacity_plan.v202212.capacity_plan_pb2.GetCapacitySummaryRequest,
            kentik.capacity_plan.v202212.capacity_plan_pb2.GetCapacitySummaryResponse,
        )
        self.ListCapacityPlans = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.capacity_plan.v202212.CapacityPlanService/ListCapacityPlans',
            kentik.capacity_plan.v202212.capacity_plan_pb2.ListCapacityPlansRequest,
            kentik.capacity_plan.v202212.capacity_plan_pb2.ListCapacityPlansResponse,
        )
        self.GetCapacityPlan = grpclib.client.UnaryUnaryMethod(
            channel,
            '/kentik.capacity_plan.v202212.CapacityPlanService/GetCapacityPlan',
            kentik.capacity_plan.v202212.capacity_plan_pb2.GetCapacityPlanRequest,
            kentik.capacity_plan.v202212.capacity_plan_pb2.GetCapacityPlanResponse,
        )
