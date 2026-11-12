/*
 * InfrawrenchSDK v1.104.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.104.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostAlertInput: Codable, Hashable, Sendable {
    public var name: String
    public var filters: [CostAlertFilter]?
    /// Per-group fan-out. Null watches the scope's one total; a dimension watches
    /// each group against its own prior window, and each offending group fires
    /// its own event.
    public var groupBy: CostDimension?
    /// Required when groupBy is tag.
    public var groupByTagKey: String?
    public var cadence: CostChangeCadence
    /// Percent of the prior window's spend the change must reach. At least one of
    /// the two thresholds must be set; when both are, BOTH must hold before the
    /// alert fires.
    public var thresholdPercent: Int?
    /// Cents the change must reach.
    public var thresholdAmountCents: Int?
    public var direction: CostChangeDirection
    public var enabled: Bool?
    public var emailRecipients: AlertEmailRecipients?

    public init(
        name: String,
        filters: [CostAlertFilter]? = nil,
        groupBy: CostDimension? = nil,
        groupByTagKey: String? = nil,
        cadence: CostChangeCadence,
        thresholdPercent: Int? = nil,
        thresholdAmountCents: Int? = nil,
        direction: CostChangeDirection,
        enabled: Bool? = nil,
        emailRecipients: AlertEmailRecipients? = nil
    ) {
        self.name = name
        self.filters = filters
        self.groupBy = groupBy
        self.groupByTagKey = groupByTagKey
        self.cadence = cadence
        self.thresholdPercent = thresholdPercent
        self.thresholdAmountCents = thresholdAmountCents
        self.direction = direction
        self.enabled = enabled
        self.emailRecipients = emailRecipients
    }
}
