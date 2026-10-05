/*
 * InfrawrenchSDK v1.69.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.69.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CarbonEstimate: Codable, Hashable, Sendable {
    public var windowDays: Int
    public var totalKgCo2e: Double
    public var totalKwh: Double
    public var estimatedCount: Int
    public var unestimated: [CarbonUnestimatedRow]
    /// Total unestimated resources; `unestimated` is capped at 200.
    public var unestimatedCount: Int
    /// Kubernetes nodes skipped because their machine is already counted as an
    /// instance (a GKE node is also a GCE instance). Counted once, and the number
    /// skipped is said.
    public var duplicateCount: Int
    public var byRegion: [CarbonGroup]
    public var byAccount: [CarbonGroup]
    public var byProvider: [CarbonGroup]
    public var rows: [CarbonRow]
    public var assumptions: CarbonAssumptions
    public var generatedAt: String

    public init(
        windowDays: Int,
        totalKgCo2e: Double,
        totalKwh: Double,
        estimatedCount: Int,
        unestimated: [CarbonUnestimatedRow],
        unestimatedCount: Int,
        duplicateCount: Int,
        byRegion: [CarbonGroup],
        byAccount: [CarbonGroup],
        byProvider: [CarbonGroup],
        rows: [CarbonRow],
        assumptions: CarbonAssumptions,
        generatedAt: String
    ) {
        self.windowDays = windowDays
        self.totalKgCo2e = totalKgCo2e
        self.totalKwh = totalKwh
        self.estimatedCount = estimatedCount
        self.unestimated = unestimated
        self.unestimatedCount = unestimatedCount
        self.duplicateCount = duplicateCount
        self.byRegion = byRegion
        self.byAccount = byAccount
        self.byProvider = byProvider
        self.rows = rows
        self.assumptions = assumptions
        self.generatedAt = generatedAt
    }
}
