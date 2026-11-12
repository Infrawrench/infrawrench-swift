/*
 * InfrawrenchSDK v1.105.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.105.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct GithubAppRepos: Codable, Hashable, Sendable {
    public struct Repo: Codable, Hashable, Sendable {
        public var installationId: Int
        public var id: Int
        public var fullName: String
        public var defaultBranch: String
        public var `private`: Bool

        public init(
            installationId: Int,
            id: Int,
            fullName: String,
            defaultBranch: String,
            `private`: Bool
        ) {
            self.installationId = installationId
            self.id = id
            self.fullName = fullName
            self.defaultBranch = defaultBranch
            self.`private` = `private`
        }
    }

    /// Every repository the organization's installations can access, by full
    /// name. An installation GitHub refused to list is left out.
    public var repos: [Repo]

    public init(
        repos: [Repo]
    ) {
        self.repos = repos
    }
}
