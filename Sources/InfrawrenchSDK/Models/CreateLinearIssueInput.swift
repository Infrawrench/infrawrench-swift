/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreateLinearIssueInput: Codable, Hashable, Sendable {
    public var sourceKind: LinearSourceKind
    /// The finding's own id, as the detector reports it.
    public var sourceId: String
    /// Team to file into. Every Linear issue belongs to exactly one team.
    public var teamId: String
    public var title: String
    /// Markdown, passed to Linear as-is — unlike Jira, where the server converts
    /// plain text to Atlassian Document Format.
    public var description: String?
    /// Ids of existing labels in the workspace. Linear cannot create labels here.
    public var labelIds: [String]?
    /// Optional project to attach the issue to.
    public var projectId: String?

    public init(
        sourceKind: LinearSourceKind,
        sourceId: String,
        teamId: String,
        title: String,
        description: String? = nil,
        labelIds: [String]? = nil,
        projectId: String? = nil
    ) {
        self.sourceKind = sourceKind
        self.sourceId = sourceId
        self.teamId = teamId
        self.title = title
        self.description = description
        self.labelIds = labelIds
        self.projectId = projectId
    }
}
