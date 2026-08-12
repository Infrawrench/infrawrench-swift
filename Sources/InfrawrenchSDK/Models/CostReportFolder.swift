/*
 * InfrawrenchSDK v1.17.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.17.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostReportFolder: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    /// Parent folder for nesting; null is a top-level folder. Nesting is capped
    /// at 3 levels, and moving a folder inside itself or one of its own
    /// subfolders is rejected — both are 400s.
    public var parentFolderId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        parentFolderId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.parentFolderId = parentFolderId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
