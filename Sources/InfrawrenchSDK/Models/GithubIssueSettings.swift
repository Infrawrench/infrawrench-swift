/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct GithubIssueSettings: Codable, Hashable, Sendable {
    public var enabled: Bool
    public var defaultRepo: GithubRepoRef?
    public var labels: [String]
    public var assignees: [String]
    public var routes: [GithubIssueRoute]
    public var resolveAction: GithubResolveAction
    public var pullRequestsEnabled: Bool
    public var iacSources: [GithubIacSource]
    public var updatedAt: String?

    public init(
        enabled: Bool,
        defaultRepo: GithubRepoRef? = nil,
        labels: [String],
        assignees: [String],
        routes: [GithubIssueRoute],
        resolveAction: GithubResolveAction,
        pullRequestsEnabled: Bool,
        iacSources: [GithubIacSource],
        updatedAt: String? = nil
    ) {
        self.enabled = enabled
        self.defaultRepo = defaultRepo
        self.labels = labels
        self.assignees = assignees
        self.routes = routes
        self.resolveAction = resolveAction
        self.pullRequestsEnabled = pullRequestsEnabled
        self.iacSources = iacSources
        self.updatedAt = updatedAt
    }
}
