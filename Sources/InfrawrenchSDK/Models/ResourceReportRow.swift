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

public struct ResourceReportRow: Codable, Hashable, Sendable {
    /// The resource id the resource detail view is addressed by.
    public var id: String
    public var accountId: String
    public var pluginId: String
    public var resourceTypeId: String
    /// Text per non-cost column id; null when the resource has no value.
    public var values: [String: String?]
    /// Spend per cost column id, one entry per currency, largest first. Empty
    /// when the resource had no cost rows in the window.
    public var costs: [String: [ResourceReportMoney]]

    public init(
        id: String,
        accountId: String,
        pluginId: String,
        resourceTypeId: String,
        values: [String: String?],
        costs: [String: [ResourceReportMoney]]
    ) {
        self.id = id
        self.accountId = accountId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.values = values
        self.costs = costs
    }
}
