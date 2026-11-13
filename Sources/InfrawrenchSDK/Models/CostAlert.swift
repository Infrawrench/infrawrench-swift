/*
 * InfrawrenchSDK v1.106.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.106.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A change-based cost alert: fires when spend on its scope moves more than the
/// configured threshold versus the prior period. The third alert family alongside
/// budgets (absolute monthly total) and anomaly detection (statistical outliers
/// against a learned baseline).
public struct CostAlert: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var filters: [CostAlertFilter]
    /// Per-group fan-out. Null watches the scope's one total; a dimension watches
    /// each group against its own prior window, and each offending group fires
    /// its own event.
    public var groupBy: CostDimension?
    public var groupByTagKey: String?
    public var cadence: CostChangeCadence
    public var thresholdPercent: Int?
    public var thresholdAmountCents: Int?
    public var direction: CostChangeDirection
    public var enabled: Bool
    public var lastEvaluatedAt: String?
    public var lastFiredAt: String?
    public var emailRecipients: AlertEmailRecipients
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        filters: [CostAlertFilter],
        groupBy: CostDimension? = nil,
        groupByTagKey: String? = nil,
        cadence: CostChangeCadence,
        thresholdPercent: Int? = nil,
        thresholdAmountCents: Int? = nil,
        direction: CostChangeDirection,
        enabled: Bool,
        lastEvaluatedAt: String? = nil,
        lastFiredAt: String? = nil,
        emailRecipients: AlertEmailRecipients,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.filters = filters
        self.groupBy = groupBy
        self.groupByTagKey = groupByTagKey
        self.cadence = cadence
        self.thresholdPercent = thresholdPercent
        self.thresholdAmountCents = thresholdAmountCents
        self.direction = direction
        self.enabled = enabled
        self.lastEvaluatedAt = lastEvaluatedAt
        self.lastFiredAt = lastFiredAt
        self.emailRecipients = emailRecipients
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
