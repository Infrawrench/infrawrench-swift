/*
 * InfrawrenchSDK v1.24.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.24.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Null when the metric has no values at all — not an error, but every unit-cost
/// chart drawn from it is one continuous gap.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct BusinessMetricCoverage: Codable, Hashable, Sendable {
    /// Earliest reported day, YYYY-MM-DD.
    public var firstDay: String
    public var lastDay: String
    /// Days carrying a value — compare against the span to spot a sparse series.
    public var reportedDays: Int

    public init(
        firstDay: String,
        lastDay: String,
        reportedDays: Int
    ) {
        self.firstDay = firstDay
        self.lastDay = lastDay
        self.reportedDays = reportedDays
    }
}
