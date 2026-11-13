/*
 * InfrawrenchSDK v1.107.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.107.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiResourceGrant: Codable, Hashable, Sendable {
    public var id: String
    public var accountId: String
    public var accountName: String
    public var pluginId: String
    public var resourceId: String
    public var resourceTypeId: String
    public var resourceName: String
    public var ciName: String
    public var outputs: [String]
    public var secretVersion: String?
    /// Repositories (`owner/name`). Null: every repository the organization runs
    /// CI for.
    public var repos: [String]?
    /// Branches it holds for: globs separated by commas, where `*` stops at `/`
    /// and `**` does not (`main, release/*`). Null: every branch.
    public var branchPattern: String?
    public var createdAt: String

    public init(
        id: String,
        accountId: String,
        accountName: String,
        pluginId: String,
        resourceId: String,
        resourceTypeId: String,
        resourceName: String,
        ciName: String,
        outputs: [String],
        secretVersion: String? = nil,
        repos: [String]? = nil,
        branchPattern: String? = nil,
        createdAt: String
    ) {
        self.id = id
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.resourceId = resourceId
        self.resourceTypeId = resourceTypeId
        self.resourceName = resourceName
        self.ciName = ciName
        self.outputs = outputs
        self.secretVersion = secretVersion
        self.repos = repos
        self.branchPattern = branchPattern
        self.createdAt = createdAt
    }
}
