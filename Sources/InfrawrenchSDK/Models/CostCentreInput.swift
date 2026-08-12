/*
 * InfrawrenchSDK v1.16.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.16.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostCentreInput: Codable, Hashable, Sendable {
    public var name: String
    public var description: String?
    /// Cost centre to nest this one under; null is the top level. On an update,
    /// moving a centre is this field changing — omitting it leaves the centre
    /// where it is. Rejected with 400 when the parent is unknown, is the centre
    /// itself or one of its own descendants, or when the resulting tree would be
    /// more than 4 levels deep (measured over the whole subtree being moved).
    public var parentId: String?

    public init(
        name: String,
        description: String? = nil,
        parentId: String? = nil
    ) {
        self.name = name
        self.description = description
        self.parentId = parentId
    }
}
