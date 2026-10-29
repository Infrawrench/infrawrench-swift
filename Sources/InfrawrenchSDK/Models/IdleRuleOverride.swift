/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IdleRuleOverride: Codable, Hashable, Sendable {
    /// False switches the rule off for the organization.
    public var enabled: Bool?
    /// Threshold overrides by key; each must sit within the rule's declared
    /// range.
    public var thresholds: [String: Double]?

    public init(
        enabled: Bool? = nil,
        thresholds: [String: Double]? = nil
    ) {
        self.enabled = enabled
        self.thresholds = thresholds
    }
}
