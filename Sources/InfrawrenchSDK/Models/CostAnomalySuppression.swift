/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct CostAnomalySuppression: Codable, Hashable, Sendable {
    public var id: String
    public var scope: CostAnomalySuppressionScope
    public var scopeKey: String
    public var tagKey: String?
    /// The account or cost centre name for id-valued scopes; null otherwise.
    public var scopeLabel: String?
    public var recurrence: CostAnomalyRecurrence
    public var anchorDay: String
    public var startsOn: String
    public var expiresOn: String
    public var reason: CostAnomalyFeedbackReason?
    public var note: String?
    /// The anomaly whose `expected` verdict created this; null for one made by
    /// hand.
    public var sourceAnomalyId: String?
    public var createdByUserId: String?
    public var createdByName: String?
    public var createdAt: String
    public var updatedAt: String
    /// Whether it still covers today or a later day. Read-only.
    public var active: Bool
    /// How many detected findings it has suppressed so far. Read-only.
    public var suppressedCount: Int

    public init(
        id: String,
        scope: CostAnomalySuppressionScope,
        scopeKey: String,
        tagKey: String? = nil,
        scopeLabel: String? = nil,
        recurrence: CostAnomalyRecurrence,
        anchorDay: String,
        startsOn: String,
        expiresOn: String,
        reason: CostAnomalyFeedbackReason? = nil,
        note: String? = nil,
        sourceAnomalyId: String? = nil,
        createdByUserId: String? = nil,
        createdByName: String? = nil,
        createdAt: String,
        updatedAt: String,
        active: Bool,
        suppressedCount: Int
    ) {
        self.id = id
        self.scope = scope
        self.scopeKey = scopeKey
        self.tagKey = tagKey
        self.scopeLabel = scopeLabel
        self.recurrence = recurrence
        self.anchorDay = anchorDay
        self.startsOn = startsOn
        self.expiresOn = expiresOn
        self.reason = reason
        self.note = note
        self.sourceAnomalyId = sourceAnomalyId
        self.createdByUserId = createdByUserId
        self.createdByName = createdByName
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.active = active
        self.suppressedCount = suppressedCount
    }
}
