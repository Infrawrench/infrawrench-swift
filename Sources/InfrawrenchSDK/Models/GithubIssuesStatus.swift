/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct GithubIssuesStatus: Codable, Hashable, Sendable {
    public var appConfigured: Bool
    public var installations: [GithubInstallationAccess]
    public var settings: GithubIssueSettings
    /// Whether the server verifies GitHub App webhooks
    /// (`GITHUB_APP_WEBHOOK_SECRET` is set), which makes issue status live rather
    /// than polled.
    public var webhookConfigured: Bool
    /// The URL the GitHub App's webhook points at; null when the server has no
    /// APP_URL.
    public var webhookUrl: String?

    public init(
        appConfigured: Bool,
        installations: [GithubInstallationAccess],
        settings: GithubIssueSettings,
        webhookConfigured: Bool,
        webhookUrl: String? = nil
    ) {
        self.appConfigured = appConfigured
        self.installations = installations
        self.settings = settings
        self.webhookConfigured = webhookConfigured
        self.webhookUrl = webhookUrl
    }
}
