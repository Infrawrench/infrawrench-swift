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

public struct CiSshKeyLending: Codable, Hashable, Sendable {
    public var sshKeyId: String
    public var keyName: String
    public var ownerUserId: String
    public var ownerName: String?
    public var ciName: String
    /// Repositories (`owner/name`). Null: every repository the organization runs
    /// CI for.
    public var repos: [String]?
    /// Branches it holds for: globs separated by commas, where `*` stops at `/`
    /// and `**` does not (`main, release/*`). Null: every branch.
    public var branchPattern: String?
    public var mine: Bool
    public var createdAt: String

    public init(
        sshKeyId: String,
        keyName: String,
        ownerUserId: String,
        ownerName: String? = nil,
        ciName: String,
        repos: [String]? = nil,
        branchPattern: String? = nil,
        mine: Bool,
        createdAt: String
    ) {
        self.sshKeyId = sshKeyId
        self.keyName = keyName
        self.ownerUserId = ownerUserId
        self.ownerName = ownerName
        self.ciName = ciName
        self.repos = repos
        self.branchPattern = branchPattern
        self.mine = mine
        self.createdAt = createdAt
    }
}
