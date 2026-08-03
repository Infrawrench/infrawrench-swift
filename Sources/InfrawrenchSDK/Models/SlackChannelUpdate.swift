/*
 * InfrawrenchSDK v0.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.29.0).
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
    public var resourceDrift: Bool?
    public var workflowPages: Bool?
    public var providerIncidents: Bool?
    public var expiryAlerts: Bool?
    public var weeklyDigest: Bool?

    public init(
        syncIncidents: Bool? = nil,
        budgetAlerts: Bool? = nil,
        anomalyAlerts: Bool? = nil,
        resourceDrift: Bool? = nil,
        workflowPages: Bool? = nil,
        providerIncidents: Bool? = nil,
        expiryAlerts: Bool? = nil,
        weeklyDigest: Bool? = nil
    ) {
        self.syncIncidents = syncIncidents
        self.budgetAlerts = budgetAlerts
        self.anomalyAlerts = anomalyAlerts
        self.resourceDrift = resourceDrift
        self.workflowPages = workflowPages
        self.providerIncidents = providerIncidents
        self.expiryAlerts = expiryAlerts
        self.weeklyDigest = weeklyDigest
    }
}
