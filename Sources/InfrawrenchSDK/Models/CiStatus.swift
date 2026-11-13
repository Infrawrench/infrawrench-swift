/*
 * InfrawrenchSDK v1.108.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.108.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiStatus: Codable, Hashable, Sendable {
    /// CI is turned on for this organization
    public var enabled: Bool
    /// The runner pool is configured on this server
    public var configured: Bool
    public var githubConfigured: Bool
    public var planIncludesCi: Bool
    public var accounts: [CiAccount]

    public init(
        enabled: Bool,
        configured: Bool,
        githubConfigured: Bool,
        planIncludesCi: Bool,
        accounts: [CiAccount]
    ) {
        self.enabled = enabled
        self.configured = configured
        self.githubConfigured = githubConfigured
        self.planIncludesCi = planIncludesCi
        self.accounts = accounts
    }
}
