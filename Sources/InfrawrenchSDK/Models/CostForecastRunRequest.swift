/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostForecastRunRequest: Codable, Hashable, Sendable {
    /// First projected day; defaults to (and is never earlier than) the day after
    /// the last day with observed spend.
    public var from: String?
    /// Last projected day; defaults to 90 days after the last observed day, at
    /// most 366.
    public var to: String?
    /// A forecast id, `"baseline"` for the automatic forecast, or absent for the
    /// report's default (the automatic forecast when none is set).
    public var forecastId: String?
    /// Narrow to these providers (plugin ids), ANDed with the report's filters.
    public var providers: [String]?
    /// Narrow to these services, ANDed with the report's filters.
    public var services: [String]?
    public var confidenceLevel: CostForecastConfidenceLevel?
    /// Also return every named forecast, side by side.
    public var all: Bool?

    public init(
        from: String? = nil,
        to: String? = nil,
        forecastId: String? = nil,
        providers: [String]? = nil,
        services: [String]? = nil,
        confidenceLevel: CostForecastConfidenceLevel? = nil,
        all: Bool? = nil
    ) {
        self.from = from
        self.to = to
        self.forecastId = forecastId
        self.providers = providers
        self.services = services
        self.confidenceLevel = confidenceLevel
        self.all = all
    }
}
