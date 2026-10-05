/*
 * InfrawrenchSDK v1.73.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.73.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct GithubIacSourceInput: Codable, Hashable, Sendable {
    public var id: String?
    /// The IaC state scope this maps: the account an uploaded state document
    /// covers, or null for the organization-wide state.
    public var iacAccountId: String?
    public var repo: GithubRepoRef?
    /// Branch pull requests target. Null means the repository's default branch.
    public var baseBranch: String?
    /// Directory holding the root module's `.tf` files. Empty for the repository
    /// root.
    public var directory: String

    public init(
        id: String? = nil,
        iacAccountId: String? = nil,
        repo: GithubRepoRef? = nil,
        baseBranch: String? = nil,
        directory: String
    ) {
        self.id = id
        self.iacAccountId = iacAccountId
        self.repo = repo
        self.baseBranch = baseBranch
        self.directory = directory
    }
}
