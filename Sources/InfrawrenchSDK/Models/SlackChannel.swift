/*
 * InfrawrenchSDK v0.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.34.0).
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
    /// Metric threshold rule firings and recoveries
    public var metricAlerts: Bool
    /// Batched resource-drift digests from the change timeline. Defaults to false
    /// when a channel is added — drift is continuous where the other triggers are
    /// exceptional.
    public var resourceDrift: Bool
    /// Pages and approval requests raised by a workflow (infra.page /
    /// infra.waitForApproval) or by POST /pages
    public var workflowPages: Bool
    /// A provider status-page incident overlaps resources you hold.
    public var providerIncidents: Bool
    /// Daily digests of approaching resource deadlines — expiring certificates,
    /// domains, tokens and keys past their rotation budget.
    public var expiryAlerts: Bool
    /// A saved log-workspace query with alerting enabled found matching log
    /// lines.
    public var logMatchAlerts: Bool
    /// Daily digests of critical/high security posture findings on synced
    /// resources — public buckets, world-open ingress, unencrypted disks.
    public var postureAlerts: Bool
    /// A synthetic probe crossed its consecutive-failure threshold (down) or
    /// answered again (recovered).
    public var probeAlerts: Bool
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
        metricAlerts: Bool,
        resourceDrift: Bool,
        workflowPages: Bool,
        providerIncidents: Bool,
        expiryAlerts: Bool,
        logMatchAlerts: Bool,
        postureAlerts: Bool,
        probeAlerts: Bool,
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
        self.metricAlerts = metricAlerts
        self.resourceDrift = resourceDrift
        self.workflowPages = workflowPages
        self.providerIncidents = providerIncidents
        self.expiryAlerts = expiryAlerts
        self.logMatchAlerts = logMatchAlerts
        self.postureAlerts = postureAlerts
        self.probeAlerts = probeAlerts
        self.weeklyDigest = weeklyDigest
    }
}
