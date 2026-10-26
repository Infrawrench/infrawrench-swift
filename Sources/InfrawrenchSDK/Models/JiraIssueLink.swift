/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JiraIssueLink: Codable, Hashable, Sendable {
    public var id: String
    public var sourceKind: JiraSourceKind
    public var sourceId: String
    public var issueKey: String
    public var issueUrl: String
    /// The tracker's own status name, e.g. `In Progress`, `Backlog`, `Closed`.
    public var status: String?
    public var statusCategory: IssueStatusCategory?
    /// Assignee display name (Jira, Linear) or login (GitHub).
    public var assignee: String?
    /// When the issue last changed, as the tracker reports it.
    public var issueUpdatedAt: String?
    /// When Infrawrench last learned the status, by webhook or poll.
    public var statusSyncedAt: String?
    public var createdByUserId: String?
    public var createdAt: String

    public init(
        id: String,
        sourceKind: JiraSourceKind,
        sourceId: String,
        issueKey: String,
        issueUrl: String,
        status: String? = nil,
        statusCategory: IssueStatusCategory? = nil,
        assignee: String? = nil,
        issueUpdatedAt: String? = nil,
        statusSyncedAt: String? = nil,
        createdByUserId: String? = nil,
        createdAt: String
    ) {
        self.id = id
        self.sourceKind = sourceKind
        self.sourceId = sourceId
        self.issueKey = issueKey
        self.issueUrl = issueUrl
        self.status = status
        self.statusCategory = statusCategory
        self.assignee = assignee
        self.issueUpdatedAt = issueUpdatedAt
        self.statusSyncedAt = statusSyncedAt
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
    }
}
