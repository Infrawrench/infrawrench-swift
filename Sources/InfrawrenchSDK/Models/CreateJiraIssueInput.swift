/*
 * InfrawrenchSDK v1.10.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.10.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreateJiraIssueInput: Codable, Hashable, Sendable {
    public var sourceKind: JiraSourceKind
    /// The finding's own id, as the detector reports it.
    public var sourceId: String
    public var projectKey: String
    public var issueTypeId: String
    public var summary: String
    /// Plain text. Converted server-side to Atlassian Document Format, which is
    /// what the Jira REST v3 description field requires; blank lines become
    /// paragraphs.
    public var description: String?
    /// Whitespace inside a label is replaced with '-', since Jira rejects it.
    public var labels: [String]?

    public init(
        sourceKind: JiraSourceKind,
        sourceId: String,
        projectKey: String,
        issueTypeId: String,
        summary: String,
        description: String? = nil,
        labels: [String]? = nil
    ) {
        self.sourceKind = sourceKind
        self.sourceId = sourceId
        self.projectKey = projectKey
        self.issueTypeId = issueTypeId
        self.summary = summary
        self.description = description
        self.labels = labels
    }
}
