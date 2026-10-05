/*
 * InfrawrenchSDK v1.54.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.54.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct GithubIssueRoute: Codable, Hashable, Sendable {
    public var id: String
    public var match: GithubIssueRouteMatch
    public var repo: GithubRepoRef?
    /// Added to the organization-wide labels.
    public var labels: [String]
    /// Replace the organization-wide assignees when non-empty.
    public var assignees: [String]

    public init(
        id: String,
        match: GithubIssueRouteMatch,
        repo: GithubRepoRef? = nil,
        labels: [String],
        assignees: [String]
    ) {
        self.id = id
        self.match = match
        self.repo = repo
        self.labels = labels
        self.assignees = assignees
    }
}
