// Code generated by protoc-gen-go-copy. DO NOT EDIT.
// source: kentik/bgp_monitoring/v202205beta1/bgp_monitoring.proto

package bgp_monitoring

import v2023031 "github.com/kentik/api-schema-public/go/kentik/core/v202303"
import "github.com/kentik/api-schema-public/go/kentik/net/v202303"
import "google.golang.org/protobuf/types/known/timestamppb"

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *Nlri) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *Nlri:
		x.Afi = v.GetAfi()
		x.Safi = v.GetSafi()
		x.Type = v.GetType()
	default:
		if v, ok := v.(interface{ GetAfi() v202303.Afi }); ok {
			x.Afi = v.GetAfi()
		}
		if v, ok := v.(interface{ GetSafi() v202303.Safi }); ok {
			x.Safi = v.GetSafi()
		}
		if v, ok := v.(interface{ GetType() isNlri_Type }); ok {
			x.Type = v.GetType()
		} else {
			func() {
				if v, ok := v.(interface{ GetPrefix() string }); ok {
					var defaultValue string
					if v := v.GetPrefix(); v != defaultValue {
						x.Type = &Nlri_Prefix{Prefix: v}
						return
					}
				}
			}()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *Nlri) Proto_ShallowClone() (c *Nlri) {
	if x != nil {
		c = new(Nlri)
		c.Afi = x.Afi
		c.Safi = x.Safi
		c.Type = x.Type
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *BgpHealthSettings) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *BgpHealthSettings:
		x.ReachabilityWarning = v.GetReachabilityWarning()
		x.ReachabilityCritical = v.GetReachabilityCritical()
	default:
		if v, ok := v.(interface{ GetReachabilityWarning() float32 }); ok {
			x.ReachabilityWarning = v.GetReachabilityWarning()
		}
		if v, ok := v.(interface{ GetReachabilityCritical() float32 }); ok {
			x.ReachabilityCritical = v.GetReachabilityCritical()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *BgpHealthSettings) Proto_ShallowClone() (c *BgpHealthSettings) {
	if x != nil {
		c = new(BgpHealthSettings)
		c.ReachabilityWarning = x.ReachabilityWarning
		c.ReachabilityCritical = x.ReachabilityCritical
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *BgpMonitorSettings) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *BgpMonitorSettings:
		x.AllowedAsns = v.GetAllowedAsns()
		x.Targets = v.GetTargets()
		x.CheckRpki = v.GetCheckRpki()
		x.IncludeCoveredPrefixes = v.GetIncludeCoveredPrefixes()
		x.HealthSettings = v.GetHealthSettings()
		x.NotificationChannels = v.GetNotificationChannels()
	default:
		if v, ok := v.(interface{ GetAllowedAsns() []uint32 }); ok {
			x.AllowedAsns = v.GetAllowedAsns()
		}
		if v, ok := v.(interface{ GetTargets() []*Nlri }); ok {
			x.Targets = v.GetTargets()
		}
		if v, ok := v.(interface{ GetCheckRpki() bool }); ok {
			x.CheckRpki = v.GetCheckRpki()
		}
		if v, ok := v.(interface{ GetIncludeCoveredPrefixes() bool }); ok {
			x.IncludeCoveredPrefixes = v.GetIncludeCoveredPrefixes()
		}
		if v, ok := v.(interface{ GetHealthSettings() *BgpHealthSettings }); ok {
			x.HealthSettings = v.GetHealthSettings()
		}
		if v, ok := v.(interface{ GetNotificationChannels() []string }); ok {
			x.NotificationChannels = v.GetNotificationChannels()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *BgpMonitorSettings) Proto_ShallowClone() (c *BgpMonitorSettings) {
	if x != nil {
		c = new(BgpMonitorSettings)
		c.AllowedAsns = x.AllowedAsns
		c.Targets = x.Targets
		c.CheckRpki = x.CheckRpki
		c.IncludeCoveredPrefixes = x.IncludeCoveredPrefixes
		c.HealthSettings = x.HealthSettings
		c.NotificationChannels = x.NotificationChannels
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *BgpMonitor) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *BgpMonitor:
		x.Id = v.GetId()
		x.Name = v.GetName()
		x.Status = v.GetStatus()
		x.Settings = v.GetSettings()
		x.Cdate = v.GetCdate()
		x.Edate = v.GetEdate()
		x.CreatedBy = v.GetCreatedBy()
		x.LastUpdatedBy = v.GetLastUpdatedBy()
		x.Labels = v.GetLabels()
	default:
		if v, ok := v.(interface{ GetId() string }); ok {
			x.Id = v.GetId()
		}
		if v, ok := v.(interface{ GetName() string }); ok {
			x.Name = v.GetName()
		}
		if v, ok := v.(interface{ GetStatus() BgpMonitorStatus }); ok {
			x.Status = v.GetStatus()
		}
		if v, ok := v.(interface{ GetSettings() *BgpMonitorSettings }); ok {
			x.Settings = v.GetSettings()
		}
		if v, ok := v.(interface{ GetCdate() *timestamppb.Timestamp }); ok {
			x.Cdate = v.GetCdate()
		}
		if v, ok := v.(interface{ GetEdate() *timestamppb.Timestamp }); ok {
			x.Edate = v.GetEdate()
		}
		if v, ok := v.(interface{ GetCreatedBy() *v2023031.UserInfo }); ok {
			x.CreatedBy = v.GetCreatedBy()
		}
		if v, ok := v.(interface{ GetLastUpdatedBy() *v2023031.UserInfo }); ok {
			x.LastUpdatedBy = v.GetLastUpdatedBy()
		}
		if v, ok := v.(interface{ GetLabels() []string }); ok {
			x.Labels = v.GetLabels()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *BgpMonitor) Proto_ShallowClone() (c *BgpMonitor) {
	if x != nil {
		c = new(BgpMonitor)
		c.Id = x.Id
		c.Name = x.Name
		c.Status = x.Status
		c.Settings = x.Settings
		c.Cdate = x.Cdate
		c.Edate = x.Edate
		c.CreatedBy = x.CreatedBy
		c.LastUpdatedBy = x.LastUpdatedBy
		c.Labels = x.Labels
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *RouteInfo) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *RouteInfo:
		x.Nlri = v.GetNlri()
		x.OriginAsn = v.GetOriginAsn()
		x.AsPath = v.GetAsPath()
		x.VantagePoint = v.GetVantagePoint()
		x.RpkiStatus = v.GetRpkiStatus()
		x.Nexthop = v.GetNexthop()
	default:
		if v, ok := v.(interface{ GetNlri() *Nlri }); ok {
			x.Nlri = v.GetNlri()
		}
		if v, ok := v.(interface{ GetOriginAsn() uint32 }); ok {
			x.OriginAsn = v.GetOriginAsn()
		}
		if v, ok := v.(interface{ GetAsPath() []string }); ok {
			x.AsPath = v.GetAsPath()
		}
		if v, ok := v.(interface{ GetVantagePoint() *v202303.VantagePoint }); ok {
			x.VantagePoint = v.GetVantagePoint()
		}
		if v, ok := v.(interface{ GetRpkiStatus() v202303.RpkiStatus }); ok {
			x.RpkiStatus = v.GetRpkiStatus()
		}
		if v, ok := v.(interface{ GetNexthop() string }); ok {
			x.Nexthop = v.GetNexthop()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *RouteInfo) Proto_ShallowClone() (c *RouteInfo) {
	if x != nil {
		c = new(RouteInfo)
		c.Nlri = x.Nlri
		c.OriginAsn = x.OriginAsn
		c.AsPath = x.AsPath
		c.VantagePoint = x.VantagePoint
		c.RpkiStatus = x.RpkiStatus
		c.Nexthop = x.Nexthop
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *BgpMetric) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *BgpMetric:
		x.Timestamp = v.GetTimestamp()
		x.Nlri = v.GetNlri()
		x.Type = v.GetType()
	default:
		if v, ok := v.(interface{ GetTimestamp() *timestamppb.Timestamp }); ok {
			x.Timestamp = v.GetTimestamp()
		}
		if v, ok := v.(interface{ GetNlri() *Nlri }); ok {
			x.Nlri = v.GetNlri()
		}
		if v, ok := v.(interface{ GetType() isBgpMetric_Type }); ok {
			x.Type = v.GetType()
		} else {
			func() {
				if v, ok := v.(interface{ GetReachability() float32 }); ok {
					var defaultValue float32
					if v := v.GetReachability(); v != defaultValue {
						x.Type = &BgpMetric_Reachability{Reachability: v}
						return
					}
				}
				if v, ok := v.(interface{ GetPathChanges() uint32 }); ok {
					var defaultValue uint32
					if v := v.GetPathChanges(); v != defaultValue {
						x.Type = &BgpMetric_PathChanges{PathChanges: v}
						return
					}
				}
			}()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *BgpMetric) Proto_ShallowClone() (c *BgpMetric) {
	if x != nil {
		c = new(BgpMetric)
		c.Timestamp = x.Timestamp
		c.Nlri = x.Nlri
		c.Type = x.Type
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *ListMonitorsRequest) Proto_ShallowCopy(v interface{}) {
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *ListMonitorsRequest) Proto_ShallowClone() (c *ListMonitorsRequest) {
	if x != nil {
		c = new(ListMonitorsRequest)
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *ListMonitorsResponse) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *ListMonitorsResponse:
		x.Monitors = v.GetMonitors()
		x.InvalidCount = v.GetInvalidCount()
	default:
		if v, ok := v.(interface{ GetMonitors() []*BgpMonitor }); ok {
			x.Monitors = v.GetMonitors()
		}
		if v, ok := v.(interface{ GetInvalidCount() uint32 }); ok {
			x.InvalidCount = v.GetInvalidCount()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *ListMonitorsResponse) Proto_ShallowClone() (c *ListMonitorsResponse) {
	if x != nil {
		c = new(ListMonitorsResponse)
		c.Monitors = x.Monitors
		c.InvalidCount = x.InvalidCount
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *CreateMonitorRequest) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *CreateMonitorRequest:
		x.Monitor = v.GetMonitor()
	default:
		if v, ok := v.(interface{ GetMonitor() *BgpMonitor }); ok {
			x.Monitor = v.GetMonitor()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *CreateMonitorRequest) Proto_ShallowClone() (c *CreateMonitorRequest) {
	if x != nil {
		c = new(CreateMonitorRequest)
		c.Monitor = x.Monitor
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *CreateMonitorResponse) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *CreateMonitorResponse:
		x.Monitor = v.GetMonitor()
	default:
		if v, ok := v.(interface{ GetMonitor() *BgpMonitor }); ok {
			x.Monitor = v.GetMonitor()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *CreateMonitorResponse) Proto_ShallowClone() (c *CreateMonitorResponse) {
	if x != nil {
		c = new(CreateMonitorResponse)
		c.Monitor = x.Monitor
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *GetMonitorRequest) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *GetMonitorRequest:
		x.Id = v.GetId()
	default:
		if v, ok := v.(interface{ GetId() string }); ok {
			x.Id = v.GetId()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *GetMonitorRequest) Proto_ShallowClone() (c *GetMonitorRequest) {
	if x != nil {
		c = new(GetMonitorRequest)
		c.Id = x.Id
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *GetMonitorResponse) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *GetMonitorResponse:
		x.Monitor = v.GetMonitor()
	default:
		if v, ok := v.(interface{ GetMonitor() *BgpMonitor }); ok {
			x.Monitor = v.GetMonitor()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *GetMonitorResponse) Proto_ShallowClone() (c *GetMonitorResponse) {
	if x != nil {
		c = new(GetMonitorResponse)
		c.Monitor = x.Monitor
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *UpdateMonitorRequest) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *UpdateMonitorRequest:
		x.Monitor = v.GetMonitor()
	default:
		if v, ok := v.(interface{ GetMonitor() *BgpMonitor }); ok {
			x.Monitor = v.GetMonitor()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *UpdateMonitorRequest) Proto_ShallowClone() (c *UpdateMonitorRequest) {
	if x != nil {
		c = new(UpdateMonitorRequest)
		c.Monitor = x.Monitor
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *UpdateMonitorResponse) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *UpdateMonitorResponse:
		x.Monitor = v.GetMonitor()
	default:
		if v, ok := v.(interface{ GetMonitor() *BgpMonitor }); ok {
			x.Monitor = v.GetMonitor()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *UpdateMonitorResponse) Proto_ShallowClone() (c *UpdateMonitorResponse) {
	if x != nil {
		c = new(UpdateMonitorResponse)
		c.Monitor = x.Monitor
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *DeleteMonitorRequest) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *DeleteMonitorRequest:
		x.Id = v.GetId()
	default:
		if v, ok := v.(interface{ GetId() string }); ok {
			x.Id = v.GetId()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *DeleteMonitorRequest) Proto_ShallowClone() (c *DeleteMonitorRequest) {
	if x != nil {
		c = new(DeleteMonitorRequest)
		c.Id = x.Id
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *DeleteMonitorResponse) Proto_ShallowCopy(v interface{}) {
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *DeleteMonitorResponse) Proto_ShallowClone() (c *DeleteMonitorResponse) {
	if x != nil {
		c = new(DeleteMonitorResponse)
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *SetMonitorStatusRequest) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *SetMonitorStatusRequest:
		x.Id = v.GetId()
		x.Status = v.GetStatus()
	default:
		if v, ok := v.(interface{ GetId() string }); ok {
			x.Id = v.GetId()
		}
		if v, ok := v.(interface{ GetStatus() BgpMonitorStatus }); ok {
			x.Status = v.GetStatus()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *SetMonitorStatusRequest) Proto_ShallowClone() (c *SetMonitorStatusRequest) {
	if x != nil {
		c = new(SetMonitorStatusRequest)
		c.Id = x.Id
		c.Status = x.Status
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *SetMonitorStatusResponse) Proto_ShallowCopy(v interface{}) {
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *SetMonitorStatusResponse) Proto_ShallowClone() (c *SetMonitorStatusResponse) {
	if x != nil {
		c = new(SetMonitorStatusResponse)
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *GetMetricsForTargetRequest) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *GetMetricsForTargetRequest:
		x.StartTime = v.GetStartTime()
		x.EndTime = v.GetEndTime()
		x.Target = v.GetTarget()
		x.IncludeCovered = v.GetIncludeCovered()
		x.Metrics = v.GetMetrics()
	default:
		if v, ok := v.(interface{ GetStartTime() *timestamppb.Timestamp }); ok {
			x.StartTime = v.GetStartTime()
		}
		if v, ok := v.(interface{ GetEndTime() *timestamppb.Timestamp }); ok {
			x.EndTime = v.GetEndTime()
		}
		if v, ok := v.(interface{ GetTarget() *Nlri }); ok {
			x.Target = v.GetTarget()
		}
		if v, ok := v.(interface{ GetIncludeCovered() bool }); ok {
			x.IncludeCovered = v.GetIncludeCovered()
		}
		if v, ok := v.(interface{ GetMetrics() []BgpMetricType }); ok {
			x.Metrics = v.GetMetrics()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *GetMetricsForTargetRequest) Proto_ShallowClone() (c *GetMetricsForTargetRequest) {
	if x != nil {
		c = new(GetMetricsForTargetRequest)
		c.StartTime = x.StartTime
		c.EndTime = x.EndTime
		c.Target = x.Target
		c.IncludeCovered = x.IncludeCovered
		c.Metrics = x.Metrics
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *GetMetricsForTargetResponse) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *GetMetricsForTargetResponse:
		x.Metrics = v.GetMetrics()
	default:
		if v, ok := v.(interface{ GetMetrics() []*BgpMetric }); ok {
			x.Metrics = v.GetMetrics()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *GetMetricsForTargetResponse) Proto_ShallowClone() (c *GetMetricsForTargetResponse) {
	if x != nil {
		c = new(GetMetricsForTargetResponse)
		c.Metrics = x.Metrics
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *GetRoutesForTargetRequest) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *GetRoutesForTargetRequest:
		x.Time = v.GetTime()
		x.Target = v.GetTarget()
		x.IncludeCovered = v.GetIncludeCovered()
		x.CheckRpki = v.GetCheckRpki()
	default:
		if v, ok := v.(interface{ GetTime() *timestamppb.Timestamp }); ok {
			x.Time = v.GetTime()
		}
		if v, ok := v.(interface{ GetTarget() *Nlri }); ok {
			x.Target = v.GetTarget()
		}
		if v, ok := v.(interface{ GetIncludeCovered() bool }); ok {
			x.IncludeCovered = v.GetIncludeCovered()
		}
		if v, ok := v.(interface{ GetCheckRpki() bool }); ok {
			x.CheckRpki = v.GetCheckRpki()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *GetRoutesForTargetRequest) Proto_ShallowClone() (c *GetRoutesForTargetRequest) {
	if x != nil {
		c = new(GetRoutesForTargetRequest)
		c.Time = x.Time
		c.Target = x.Target
		c.IncludeCovered = x.IncludeCovered
		c.CheckRpki = x.CheckRpki
	}
	return
}

// Proto_ShallowCopy copies fields, from v to the receiver, using field getters.
// Note that v is of an arbitrary type, which may implement any number of the
// field getters, which are defined as any methods of the same signature as those
// generated for the receiver type, with a name starting with Get.
// WARNING: Optional fields may be ignored, if v is not the receiver type.
func (x *GetRoutesForTargetResponse) Proto_ShallowCopy(v interface{}) {
	switch v := v.(type) {
	case *GetRoutesForTargetResponse:
		x.Routes = v.GetRoutes()
		x.AsNames = v.GetAsNames()
	default:
		if v, ok := v.(interface{ GetRoutes() []*RouteInfo }); ok {
			x.Routes = v.GetRoutes()
		}
		if v, ok := v.(interface{ GetAsNames() map[uint32]string }); ok {
			x.AsNames = v.GetAsNames()
		}
	}
}

// Proto_ShallowClone returns a shallow copy of the receiver or nil if it's nil.
func (x *GetRoutesForTargetResponse) Proto_ShallowClone() (c *GetRoutesForTargetResponse) {
	if x != nil {
		c = new(GetRoutesForTargetResponse)
		c.Routes = x.Routes
		c.AsNames = x.AsNames
	}
	return
}
