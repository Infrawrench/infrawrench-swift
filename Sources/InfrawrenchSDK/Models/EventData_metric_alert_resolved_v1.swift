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

/// `data` of a `metric_alert.resolved` event, version 1. A firing metric alert
/// went back within its threshold.
public struct EventData_metric_alert_resolved_v1: Codable, Hashable, Sendable {
    /// Metric alert rule id.
    public var ruleId: String
    /// Rule name.
    public var ruleName: String
    /// The metric the rule watches.
    public var metricKey: String
    /// How `threshold` is compared.
    public var comparator: String
    /// The rule's threshold.
    public var threshold: Double
    /// How long the condition must hold.
    public var forMinutes: Int
    /// The resource the metric belongs to.
    public var resourceId: String
    /// Resource display name.
    public var resourceName: String
    /// The value that tripped the rule; null on resolve.
    public var observed: Double?
    /// Metric alert event id (shared by a firing and its resolve).
    public var alertEventId: String

    public init(
        ruleId: String,
        ruleName: String,
        metricKey: String,
        comparator: String,
        threshold: Double,
        forMinutes: Int,
        resourceId: String,
        resourceName: String,
        observed: Double? = nil,
        alertEventId: String
    ) {
        self.ruleId = ruleId
        self.ruleName = ruleName
        self.metricKey = metricKey
        self.comparator = comparator
        self.threshold = threshold
        self.forMinutes = forMinutes
        self.resourceId = resourceId
        self.resourceName = resourceName
        self.observed = observed
        self.alertEventId = alertEventId
    }
}
