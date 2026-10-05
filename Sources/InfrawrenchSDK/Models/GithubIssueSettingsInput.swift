/*
 * InfrawrenchSDK v1.73.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.73.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct GithubIssueSettingsInput: Codable, Hashable, Sendable {
    /// Master switch for filing, manual and routed.
    public var enabled: Bool
    public var defaultRepo: GithubRepoRef?
    public var labels: [String]
    public var assignees: [String]
    /// Ordered; the first match wins and no match falls back to `defaultRepo`.
    public var routes: [GithubIssueRouteInput]
    public var resolveAction: GithubResolveAction
    /// Allow holders of `github-issues:write` to open pull requests editing
    /// Terraform for IaC-managed findings. Never auto-merged.
    public var pullRequestsEnabled: Bool
    public var iacSources: [GithubIacSourceInput]

    public init(
        enabled: Bool,
        defaultRepo: GithubRepoRef? = nil,
        labels: [String],
        assignees: [String],
        routes: [GithubIssueRouteInput],
        resolveAction: GithubResolveAction,
        pullRequestsEnabled: Bool,
        iacSources: [GithubIacSourceInput]
    ) {
        self.enabled = enabled
        self.defaultRepo = defaultRepo
        self.labels = labels
        self.assignees = assignees
        self.routes = routes
        self.resolveAction = resolveAction
        self.pullRequestsEnabled = pullRequestsEnabled
        self.iacSources = iacSources
    }
}
