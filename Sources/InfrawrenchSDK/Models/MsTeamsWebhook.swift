/*
 * InfrawrenchSDK v0.5.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.5.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MsTeamsWebhook: Codable, Hashable, Sendable {
    public var id: String
    /// Display name for the channel, e.g. #alerts
    public var label: String
    /// Non-secret hint at the stored webhook URL (host and last four characters).
    /// The URL itself is never returned.
    public var urlHint: String
    public var syncIncidents: Bool
    public var budgetAlerts: Bool
    /// Alerts raised by a workflow calling infra.page(...)
    public var workflowPages: Bool

    public init(
        id: String,
        label: String,
        urlHint: String,
        syncIncidents: Bool,
        budgetAlerts: Bool,
        workflowPages: Bool
    ) {
        self.id = id
        self.label = label
        self.urlHint = urlHint
        self.syncIncidents = syncIncidents
        self.budgetAlerts = budgetAlerts
        self.workflowPages = workflowPages
    }
}
