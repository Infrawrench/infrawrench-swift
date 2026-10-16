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

public struct CostForecastInput: Codable, Hashable, Sendable {
    public var name: String
    public var description: String?
    /// Scenario models to apply, **in priority order**. Each model is applied to
    /// the line the previous ones produced, so an org-wide percentage in a later
    /// model also scales amounts an earlier one added. Deleting a model a
    /// forecast names is refused.
    public var scenarioModelIds: [String]
    /// A business metric whose forecasted values drive the baseline: projected
    /// unit cost (the report's spend per unit, trended) times the forecasted
    /// value. Null keeps the trend.
    public var driverMetricId: String?
    /// Make this the report's default forecast, clearing any other. On update,
    /// absent keeps the current setting and false makes the report fall back to
    /// the automatic forecast.
    public var isDefault: Bool?

    public init(
        name: String,
        description: String? = nil,
        scenarioModelIds: [String],
        driverMetricId: String? = nil,
        isDefault: Bool? = nil
    ) {
        self.name = name
        self.description = description
        self.scenarioModelIds = scenarioModelIds
        self.driverMetricId = driverMetricId
        self.isDefault = isDefault
    }
}
