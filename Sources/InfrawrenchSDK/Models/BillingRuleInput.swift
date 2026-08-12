/*
 * InfrawrenchSDK v1.18.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.18.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BillingRuleInput: Codable, Hashable, Sendable {
    public var name: String
    public var description: String?
    /// Disabled rules are kept and excluded from every query. Switching a markup
    /// off for a quarter is an edit, not a delete.
    public var enabled: Bool?
    /// Lower evaluates first. Percentage rules all apply regardless of order
    /// (multiplication commutes); reallocation is first-match-wins, so priority
    /// decides which one moves a row.
    public var priority: Int
    public var match: BillingRuleMatch
    public var adjustment: BillingRuleAdjustment

    public init(
        name: String,
        description: String? = nil,
        enabled: Bool? = nil,
        priority: Int,
        match: BillingRuleMatch,
        adjustment: BillingRuleAdjustment
    ) {
        self.name = name
        self.description = description
        self.enabled = enabled
        self.priority = priority
        self.match = match
        self.adjustment = adjustment
    }
}
