/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct NetworkFlowReportGroupTotal: Codable, Hashable, Sendable {
    public var groupKey: String
    public var label: String
    public var currency: String
    public var pairCount: Int
    /// Observed bytes (decimal: a GB is 10^9 bytes).
    public var bytes: Double
    /// Bytes priced at the provider's published list rate for the boundary
    /// crossed. Always an estimate: free allowances, volume tiers and negotiated
    /// rates are not modelled.
    public var estimatedCost: Double
    /// Of `bytes`, those from a flow source that samples. The plugin already
    /// scaled them up; they are counted and labelled, never dropped.
    public var sampledBytes: Double
    /// Of `estimatedCost`, the part priced from sampled bytes.
    public var sampledCost: Double
    /// Of `bytes`, those that could not be tied to a workload at one end.
    public var unattributedBytes: Double
    /// Of `bytes`, the per-day remainder below the stored pair cap.
    public var truncatedBytes: Double

    public init(
        groupKey: String,
        label: String,
        currency: String,
        pairCount: Int,
        bytes: Double,
        estimatedCost: Double,
        sampledBytes: Double,
        sampledCost: Double,
        unattributedBytes: Double,
        truncatedBytes: Double
    ) {
        self.groupKey = groupKey
        self.label = label
        self.currency = currency
        self.pairCount = pairCount
        self.bytes = bytes
        self.estimatedCost = estimatedCost
        self.sampledBytes = sampledBytes
        self.sampledCost = sampledCost
        self.unattributedBytes = unattributedBytes
        self.truncatedBytes = truncatedBytes
    }
}
