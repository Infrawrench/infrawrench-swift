/*
 * InfrawrenchSDK v0.43.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.43.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SlackChannelUpdate: Codable, Hashable, Sendable {
    public var syncIncidents: Bool?
    public var budgetAlerts: Bool?
    public var anomalyAlerts: Bool?
    public var metricAlerts: Bool?
    public var resourceDrift: Bool?
    public var workflowPages: Bool?
    public var providerIncidents: Bool?
    public var expiryAlerts: Bool?
    public var logMatchAlerts: Bool?
    public var postureAlerts: Bool?
    public var probeAlerts: Bool?
    public var weeklyDigest: Bool?

    public init(
        syncIncidents: Bool? = nil,
        budgetAlerts: Bool? = nil,
        anomalyAlerts: Bool? = nil,
        metricAlerts: Bool? = nil,
        resourceDrift: Bool? = nil,
        workflowPages: Bool? = nil,
        providerIncidents: Bool? = nil,
        expiryAlerts: Bool? = nil,
        logMatchAlerts: Bool? = nil,
        postureAlerts: Bool? = nil,
        probeAlerts: Bool? = nil,
        weeklyDigest: Bool? = nil
    ) {
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
