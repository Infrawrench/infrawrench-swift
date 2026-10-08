/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct GithubIssueRouteResolution: Codable, Hashable, Sendable {
    public var repo: GithubRepoRef?
    public var labels: [String]
    public var assignees: [String]
    public var routeId: String?

    public init(
        repo: GithubRepoRef? = nil,
        labels: [String],
        assignees: [String],
        routeId: String? = nil
    ) {
        self.repo = repo
        self.labels = labels
        self.assignees = assignees
        self.routeId = routeId
    }
}
