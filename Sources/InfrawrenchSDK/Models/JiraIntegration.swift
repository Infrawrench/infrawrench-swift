/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct JiraIntegration: Codable, Hashable, Sendable {
    public var siteUrl: String
    public var accountEmail: String
    /// Redacted marker for the stored API token, e.g. `…a7f2`. The token itself
    /// is never returned.
    public var tokenHint: String
    public var defaultProjectKey: String?
    public var defaultIssueTypeId: String?
    public var updatedAt: String

    public init(
        siteUrl: String,
        accountEmail: String,
        tokenHint: String,
        defaultProjectKey: String? = nil,
        defaultIssueTypeId: String? = nil,
        updatedAt: String
    ) {
        self.siteUrl = siteUrl
        self.accountEmail = accountEmail
        self.tokenHint = tokenHint
        self.defaultProjectKey = defaultProjectKey
        self.defaultIssueTypeId = defaultIssueTypeId
        self.updatedAt = updatedAt
    }
}
