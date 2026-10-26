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

public struct IdleFindingSettings: Codable, Hashable, Sendable {
    /// Master switch: off stops collection and hides every idle row.
    public var enabled: Bool
    /// Days of metrics each rule judges over, 7 to 42. Ships as 14.
    public var lookbackDays: Int
    /// Overrides keyed by `pluginId:ruleId`. A rule absent here runs enabled with
    /// its declared defaults.
    public var rules: [String: IdleRuleOverride]

    public init(
        enabled: Bool,
        lookbackDays: Int,
        rules: [String: IdleRuleOverride]
    ) {
        self.enabled = enabled
        self.lookbackDays = lookbackDays
        self.rules = rules
    }
}
