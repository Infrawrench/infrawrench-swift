/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// An organization's configuration. Every section is optional — a document that
/// omits one leaves it entirely alone, in both apply modes.
public struct OrgConfigDocument: Codable, Hashable, Sendable {
    public struct ExportedFrom: Codable, Hashable, Sendable {
        public var organizationId: String
        public var organizationName: String

        public init(
            organizationId: String,
            organizationName: String
        ) {
            self.organizationId = organizationId
            self.organizationName = organizationName
        }
    }

    public struct TagPolicy2: Codable, Hashable, Sendable {
        public struct RequiredTag2: Codable, Hashable, Sendable {
            public var key: String
            public var allowedValues: [String]?

            public init(
                key: String,
                allowedValues: [String]? = nil
            ) {
                self.key = key
                self.allowedValues = allowedValues
            }
        }

        public var requiredTags: [RequiredTag2]
        public var enforceOnCreate: Bool

        public init(
            requiredTags: [RequiredTag2],
            enforceOnCreate: Bool
        ) {
            self.requiredTags = requiredTags
            self.enforceOnCreate = enforceOnCreate
        }
    }

    public var version: Int?
    public var exportedAt: String?
    public var exportedFrom: ExportedFrom?
    public var budgets: [OrgConfigBudget]?
    public var customGraphs: [OrgConfigCustomGraph]?
    public var workflows: [OrgConfigWorkflow]?
    public var dashboards: [OrgConfigDashboard]?
    public var metricAlerts: [OrgConfigMetricAlert]?
    public var probes: [OrgConfigProbe]?
    public var costCentres: [OrgConfigCostCentre]?
    public var tagPolicy: TagPolicy2?
    public var alertSettings: OrgConfigAlertSettings?

    public init(
        version: Int? = nil,
        exportedAt: String? = nil,
        exportedFrom: ExportedFrom? = nil,
        budgets: [OrgConfigBudget]? = nil,
        customGraphs: [OrgConfigCustomGraph]? = nil,
        workflows: [OrgConfigWorkflow]? = nil,
        dashboards: [OrgConfigDashboard]? = nil,
        metricAlerts: [OrgConfigMetricAlert]? = nil,
        probes: [OrgConfigProbe]? = nil,
        costCentres: [OrgConfigCostCentre]? = nil,
        tagPolicy: TagPolicy2? = nil,
        alertSettings: OrgConfigAlertSettings? = nil
    ) {
        self.version = version
        self.exportedAt = exportedAt
        self.exportedFrom = exportedFrom
        self.budgets = budgets
        self.customGraphs = customGraphs
        self.workflows = workflows
        self.dashboards = dashboards
        self.metricAlerts = metricAlerts
        self.probes = probes
        self.costCentres = costCentres
        self.tagPolicy = tagPolicy
        self.alertSettings = alertSettings
    }
}
