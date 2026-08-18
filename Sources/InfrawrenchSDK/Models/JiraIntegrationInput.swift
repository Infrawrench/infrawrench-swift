/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JiraIntegrationInput: Codable, Hashable, Sendable {
    /// Jira Cloud site address. Must resolve to a .atlassian.net (or legacy
    /// .jira.com) host; a bare hostname and a pasted board or issue URL are both
    /// accepted and normalized.
    public var siteUrl: String
    /// Atlassian account email — the username half of the basic-auth pair.
    public var accountEmail: String
    /// API token from id.atlassian.com. Omit to keep the stored token; required
    /// on first connect.
    public var apiToken: String?
    public var defaultProjectKey: String?
    public var defaultIssueTypeId: String?

    public init(
        siteUrl: String,
        accountEmail: String,
        apiToken: String? = nil,
        defaultProjectKey: String? = nil,
        defaultIssueTypeId: String? = nil
    ) {
        self.siteUrl = siteUrl
        self.accountEmail = accountEmail
        self.apiToken = apiToken
        self.defaultProjectKey = defaultProjectKey
        self.defaultIssueTypeId = defaultIssueTypeId
    }
}
