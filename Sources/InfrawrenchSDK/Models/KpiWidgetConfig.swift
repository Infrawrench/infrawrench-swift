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

public struct KpiWidgetConfig: Codable, Hashable, Sendable {
    public var version: Double
    public var source: KpiWidgetSource
    public var dateRange: CostDateRange?
    public var comparePreviousPeriod: Bool
    /// Which direction the change badge colours as good; absent derives it.
    public var upIsGood: Bool?

    public init(
        version: Double,
        source: KpiWidgetSource,
        dateRange: CostDateRange? = nil,
        comparePreviousPeriod: Bool,
        upIsGood: Bool? = nil
    ) {
        self.version = version
        self.source = source
        self.dateRange = dateRange
        self.comparePreviousPeriod = comparePreviousPeriod
        self.upIsGood = upIsGood
    }
}
