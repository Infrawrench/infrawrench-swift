/*
 * InfrawrenchSDK v0.28.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.28.0).
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
    /// Statistical spend-spike (cost anomaly) alerts
    public var anomalyAlerts: Bool
    /// Batched resource-drift digests from the change timeline. Defaults to false
    /// when a channel is added — drift is continuous where the other triggers are
    /// exceptional.
    public var resourceDrift: Bool
    /// Pages and approval requests raised by a workflow (infra.page /
    /// infra.waitForApproval) or by POST /pages
    public var workflowPages: Bool
    /// The Monday-morning weekly digest. Only sends when the organization has
    /// enabled the digest (see /digest).
    public var weeklyDigest: Bool

    public init(
        id: String,
        label: String,
        urlHint: String,
        syncIncidents: Bool,
        budgetAlerts: Bool,
        anomalyAlerts: Bool,
        resourceDrift: Bool,
        workflowPages: Bool,
        weeklyDigest: Bool
    ) {
        self.id = id
        self.label = label
        self.urlHint = urlHint
        self.syncIncidents = syncIncidents
        self.budgetAlerts = budgetAlerts
        self.anomalyAlerts = anomalyAlerts
        self.resourceDrift = resourceDrift
        self.workflowPages = workflowPages
        self.weeklyDigest = weeklyDigest
    }
}
