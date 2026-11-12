/*
 * InfrawrenchSDK v1.104.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.104.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct GithubAppStatus: Codable, Hashable, Sendable {
    public struct Installation: Codable, Hashable, Sendable {
        public var installationId: Int
        /// The GitHub user or organization the app is installed on.
        public var accountLogin: String?

        public init(
            installationId: Int,
            accountLogin: String? = nil
        ) {
            self.installationId = installationId
            self.accountLogin = accountLogin
        }
    }

    /// Whether this server has a GitHub App configured at all.
    public var configured: Bool
    /// The GitHub App's slug, as in `github.com/apps/<slug>`.
    public var appSlug: String?
    /// The organization's connected installations.
    public var installations: [Installation]

    public init(
        configured: Bool,
        appSlug: String? = nil,
        installations: [Installation]
    ) {
        self.configured = configured
        self.appSlug = appSlug
        self.installations = installations
    }
}
