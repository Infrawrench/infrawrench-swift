/*
 * InfrawrenchSDK v1.55.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.55.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CarbonAssumptions: Codable, Hashable, Sendable {
    public struct VcpuWattsValue: Codable, Hashable, Sendable {
        public var min: Double
        public var max: Double

        public init(
            min: Double,
            max: Double
        ) {
            self.min = min
            self.max = max
        }
    }

    /// Assumed average CPU utilisation, 0 to 1. **The largest single source of
    /// error**, stated here rather than buried in a constant: the product does
    /// not collect per-resource CPU history for every provider, and a figure
    /// derived from the few that do would be quietly inconsistent across an
    /// estate.
    public var cpuUtilization: Double
    /// Fleet Power Usage Effectiveness, per contributing grid.
    public var pue: [String: Double]
    public var vcpuWatts: [String: VcpuWattsValue]
    public var coefficientSource: String
    public var coefficientVintage: String
    /// What the estimate covers, in one sentence a reader can check.
    public var scope: String

    public init(
        cpuUtilization: Double,
        pue: [String: Double],
        vcpuWatts: [String: VcpuWattsValue],
        coefficientSource: String,
        coefficientVintage: String,
        scope: String
    ) {
        self.cpuUtilization = cpuUtilization
        self.pue = pue
        self.vcpuWatts = vcpuWatts
        self.coefficientSource = coefficientSource
        self.coefficientVintage = coefficientVintage
        self.scope = scope
    }
}
