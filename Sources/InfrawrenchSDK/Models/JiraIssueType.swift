/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JiraIssueType: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    /// Always false — subtasks need a parent issue, so they are filtered out.
    public var subtask: Bool
    public var description: String?

    public init(
        id: String,
        name: String,
        subtask: Bool,
        description: String? = nil
    ) {
        self.id = id
        self.name = name
        self.subtask = subtask
        self.description = description
    }
}
