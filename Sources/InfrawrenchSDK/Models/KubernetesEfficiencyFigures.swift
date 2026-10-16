/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct KubernetesEfficiencyFigures: Codable, Hashable, Sendable {
    public var total: Double
    /// Capacity measurably used (and mounted volumes, load balancers).
    public var used: Double
    /// Requested but measured unused.
    public var unused: Double
    /// Allocated with no usage data.
    public var unmeasured: Double
    /// Capacity nobody requested, unrequested GPUs, unattached volumes.
    public var idle: Double
    /// System-reserved node capacity and the control-plane fee.
    public var overhead: Double
    /// used + unused + unmeasured.
    public var allocated: Double
    /// 0..1 on the report's basis; null when unmeasured.
    public var efficiency: Double?
    public var measuredShare: Double?

    public init(
        total: Double,
        used: Double,
        unused: Double,
        unmeasured: Double,
        idle: Double,
        overhead: Double,
        allocated: Double,
        efficiency: Double? = nil,
        measuredShare: Double? = nil
    ) {
        self.total = total
        self.used = used
        self.unused = unused
        self.unmeasured = unmeasured
        self.idle = idle
        self.overhead = overhead
        self.allocated = allocated
        self.efficiency = efficiency
        self.measuredShare = measuredShare
    }
}
