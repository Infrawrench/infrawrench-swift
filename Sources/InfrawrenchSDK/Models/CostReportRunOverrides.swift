/*
 * InfrawrenchSDK v1.62.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.62.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostReportRunOverrides: Codable, Hashable, Sendable {
    public var measure: CostMeasure?
    /// The usage unit a `usage` measure sums, exactly as the provider spells it
    /// (`Hrs`, `GB-Mo`). List them with GET
    /// /costs/dimensions?dimension=usage-units. Required for `usage`, refused for
    /// any other measure.
    public var usageUnit: String?
    public var binning: CostBinning?
    /// Running totals from the start of the range, at any bin size. Omitted is
    /// off. Totals then report the last point rather than the sum.
    public var cumulative: Bool?

    public init(
        measure: CostMeasure? = nil,
        usageUnit: String? = nil,
        binning: CostBinning? = nil,
        cumulative: Bool? = nil
    ) {
        self.measure = measure
        self.usageUnit = usageUnit
        self.binning = binning
        self.cumulative = cumulative
    }
}
