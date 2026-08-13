/*
 * InfrawrenchSDK v1.24.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.24.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AlertRule: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var enabled: Bool
    /// Ascending evaluation order
    public var position: Int
    public var conditions: [AlertCondition]
    /// Empty is legal and meaningful: an enabled rule with no destinations
    /// swallows matching alerts and shadows the rules below it.
    public var destinations: [AlertDestination]
    /// False (the default) makes the list first-match-wins, which is what lets a
    /// narrow rule sit above a broad one. True makes the rule a tee that copies
    /// without shadowing.
    public var continueOnMatch: Bool
    public var quietHours: QuietHours?
    public var escalation: EscalationPolicy?

    public init(
        id: String,
        name: String,
        enabled: Bool,
        position: Int,
        conditions: [AlertCondition],
        destinations: [AlertDestination],
        continueOnMatch: Bool,
        quietHours: QuietHours? = nil,
        escalation: EscalationPolicy? = nil
    ) {
        self.id = id
        self.name = name
        self.enabled = enabled
        self.position = position
        self.conditions = conditions
        self.destinations = destinations
        self.continueOnMatch = continueOnMatch
        self.quietHours = quietHours
        self.escalation = escalation
    }
}
