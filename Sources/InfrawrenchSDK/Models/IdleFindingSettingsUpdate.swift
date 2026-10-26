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

public struct IdleFindingSettingsUpdate: Codable, Hashable, Sendable {
    public var enabled: Bool?
    public var lookbackDays: Int?
    /// Replaces the whole overrides map when sent.
    public var rules: [String: IdleRuleOverride]?

    public init(
        enabled: Bool? = nil,
        lookbackDays: Int? = nil,
        rules: [String: IdleRuleOverride]? = nil
    ) {
        self.enabled = enabled
        self.lookbackDays = lookbackDays
        self.rules = rules
    }
}
