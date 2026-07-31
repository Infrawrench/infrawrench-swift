/*
 * InfrawrenchSDK v0.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SlackChannel: Codable, Hashable, Sendable {
    public var id: String
    public var installationId: String
    /// Slack channel id (C…/G…)
    public var channelId: String
    /// Channel name without the leading #
    public var channelName: String
    public var isPrivate: Bool
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
        installationId: String,
        channelId: String,
        channelName: String,
        isPrivate: Bool,
        syncIncidents: Bool,
        budgetAlerts: Bool,
        anomalyAlerts: Bool,
        resourceDrift: Bool,
        workflowPages: Bool,
        weeklyDigest: Bool
    ) {
        self.id = id
        self.installationId = installationId
        self.channelId = channelId
        self.channelName = channelName
        self.isPrivate = isPrivate
        self.syncIncidents = syncIncidents
        self.budgetAlerts = budgetAlerts
        self.anomalyAlerts = anomalyAlerts
        self.resourceDrift = resourceDrift
        self.workflowPages = workflowPages
        self.weeklyDigest = weeklyDigest
    }
}
