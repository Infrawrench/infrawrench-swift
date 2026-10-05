/*
 * InfrawrenchSDK v1.67.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.67.0).
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
