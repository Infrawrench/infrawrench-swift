/*
 * InfrawrenchSDK v1.12.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.12.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PostureDismissalCreate: Codable, Hashable, Sendable {
    /// Infrawrench resource id the finding is on.
    public var resourceId: String
    /// The matched rule's id.
    public var ruleId: String
    /// Why this finding is acceptable. Trimmed; an empty note is stored as none.
    public var reason: String?

    public init(
        resourceId: String,
        ruleId: String,
        reason: String? = nil
    ) {
        self.resourceId = resourceId
        self.ruleId = ruleId
        self.reason = reason
    }
}
