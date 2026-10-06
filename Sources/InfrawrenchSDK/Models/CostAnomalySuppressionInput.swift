/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostAnomalySuppressionInput: Codable, Hashable, Sendable {
    public var scope: CostAnomalySuppressionScope
    /// The scope's value: a plugin id (`provider`), a service name, an account
    /// id, a tag value, or a cost centre id. Accounts and cost centres must
    /// belong to the organization.
    public var scopeKey: String
    /// Required when `scope` is `tag`.
    public var tagKey: String?
    public var recurrence: CostAnomalyRecurrence
    /// The day the pattern is anchored to.
    public var anchorDay: String
    /// First day covered. Defaults to `anchorDay`.
    public var startsOn: String?
    /// Last day covered, inclusive. At most three years after `startsOn`, and not
    /// before it.
    public var expiresOn: String
    public var reason: CostAnomalyFeedbackReason?
    public var note: String?

    public init(
        scope: CostAnomalySuppressionScope,
        scopeKey: String,
        tagKey: String? = nil,
        recurrence: CostAnomalyRecurrence,
        anchorDay: String,
        startsOn: String? = nil,
        expiresOn: String,
        reason: CostAnomalyFeedbackReason? = nil,
        note: String? = nil
    ) {
        self.scope = scope
        self.scopeKey = scopeKey
        self.tagKey = tagKey
        self.recurrence = recurrence
        self.anchorDay = anchorDay
        self.startsOn = startsOn
        self.expiresOn = expiresOn
        self.reason = reason
        self.note = note
    }
}
