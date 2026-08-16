/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct NetworkFlowRateCard: Codable, Hashable, Sendable {
    public var pluginId: String
    public var currency: String
    /// Date the rates were last checked against the provider's pricing page.
    public var asOf: String
    public var perGb: [String: Double]
    /// True when collecting flows runs queries the provider bills to your cloud
    /// account.
    public var queriesBillable: Bool
    /// True when the flow source samples rather than recording all flows.
    public var sampled: Bool

    public init(
        pluginId: String,
        currency: String,
        asOf: String,
        perGb: [String: Double],
        queriesBillable: Bool,
        sampled: Bool
    ) {
        self.pluginId = pluginId
        self.currency = currency
        self.asOf = asOf
        self.perGb = perGb
        self.queriesBillable = queriesBillable
        self.sampled = sampled
    }
}
