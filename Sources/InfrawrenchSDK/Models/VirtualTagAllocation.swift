/*
 * InfrawrenchSDK v1.63.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.63.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct VirtualTagAllocation: Codable, Hashable, Sendable {
    public var value: String
    /// `split` only. The shares of one rule sum to 100.
    public var percent: Double?
    /// `metric_split` only. The business metric whose daily value weights this
    /// share. A day where any share's metric has no value carries the last good
    /// day's weights forward, or splits evenly when there is none.
    public var metricId: String?

    public init(
        value: String,
        percent: Double? = nil,
        metricId: String? = nil
    ) {
        self.value = value
        self.percent = percent
        self.metricId = metricId
    }
}
