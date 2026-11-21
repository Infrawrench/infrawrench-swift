/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct InfraenvRepoFile: Codable, Hashable, Sendable {
    public var path: String
    public var branch: String
    /// Null when the file does not exist on that branch yet.
    public var content: String?
    /// Blob sha to send back with a commit that replaces the file.
    public var sha: String?

    public init(
        path: String,
        branch: String,
        content: String? = nil,
        sha: String? = nil
    ) {
        self.path = path
        self.branch = branch
        self.content = content
        self.sha = sha
    }
}
