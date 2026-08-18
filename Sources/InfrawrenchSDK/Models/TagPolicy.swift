/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct TagPolicy: Codable, Hashable, Sendable {
    public var requiredTags: [RequiredTag]
    /// When true, resource creation is rejected with a 422 (`tag_policy_unmet`)
    /// if the submitted fields carry a tag map missing a required tag. Types
    /// whose create form has no `tags`/`labels` field are exempt.
    public var enforceOnCreate: Bool

    public init(
        requiredTags: [RequiredTag],
        enforceOnCreate: Bool
    ) {
        self.requiredTags = requiredTags
        self.enforceOnCreate = enforceOnCreate
    }
}
