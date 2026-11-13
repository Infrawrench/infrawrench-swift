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

public struct GithubRepoRef: Codable, Hashable, Sendable {
    /// A GitHub App installation connected to the organization
    /// (`/github/status`).
    public var installationId: Int
    /// `owner/name`, as listed by `/github/repos`.
    public var fullName: String

    public init(
        installationId: Int,
        fullName: String
    ) {
        self.installationId = installationId
        self.fullName = fullName
    }
}
