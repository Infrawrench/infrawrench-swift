/*
 * InfrawrenchSDK v0.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostQuerySeries: Codable, Hashable, Sendable {
    public var key: String
    public var label: String
    public var currency: String
    public var points: [CostSeriesPoint]

    public init(
        key: String,
        label: String,
        currency: String,
        points: [CostSeriesPoint]
    ) {
        self.key = key
        self.label = label
        self.currency = currency
        self.points = points
    }
}
