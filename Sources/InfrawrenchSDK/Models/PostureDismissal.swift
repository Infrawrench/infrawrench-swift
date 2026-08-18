/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PostureDismissal: Codable, Hashable, Sendable {
    public var resourceId: String
    public var ruleId: String
    /// When the finding was accepted.
    public var dismissedAt: String
    /// Display name or email of whoever accepted it; null when unknown.
    public var dismissedBy: String?
    /// The operator's note, when they left one.
    public var reason: String?

    public init(
        resourceId: String,
        ruleId: String,
        dismissedAt: String,
        dismissedBy: String? = nil,
        reason: String? = nil
    ) {
        self.resourceId = resourceId
        self.ruleId = ruleId
        self.dismissedAt = dismissedAt
        self.dismissedBy = dismissedBy
        self.reason = reason
    }
}
