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

public struct SlackChannelCreate: Codable, Hashable, Sendable {
    public var installationId: String
    public var channelId: String
    public var channelName: String
    public var isPrivate: Bool?
    public var syncIncidents: Bool?
    public var budgetAlerts: Bool?
    public var anomalyAlerts: Bool?
    public var metricAlerts: Bool?
    public var resourceDrift: Bool?
    public var workflowPages: Bool?
    public var providerIncidents: Bool?
    public var expiryAlerts: Bool?
    public var logMatchAlerts: Bool?
    public var weeklyDigest: Bool?

    public init(
        installationId: String,
        channelId: String,
        channelName: String,
        isPrivate: Bool? = nil,
        syncIncidents: Bool? = nil,
        budgetAlerts: Bool? = nil,
        anomalyAlerts: Bool? = nil,
        metricAlerts: Bool? = nil,
        resourceDrift: Bool? = nil,
        workflowPages: Bool? = nil,
        providerIncidents: Bool? = nil,
        expiryAlerts: Bool? = nil,
        logMatchAlerts: Bool? = nil,
        weeklyDigest: Bool? = nil
    ) {
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
        self.weeklyDigest = weeklyDigest
    }
}
