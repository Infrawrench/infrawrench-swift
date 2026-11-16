/*
 * InfrawrenchSDK v1.112.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.112.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiResourceGrantInput: Codable, Hashable, Sendable {
    public var resourceId: String
    /// The name pipelines use: `[A-Za-z0-9][A-Za-z0-9_-]{0,63}`, unique in the
    /// organization.
    public var ciName: String
    public var outputs: [String]
    public var secretVersion: String?
    /// Repositories (`owner/name`). Null: every repository the organization runs
    /// CI for.
    public var repos: [String]?
    /// Branches it holds for: globs separated by commas, where `*` stops at `/`
    /// and `**` does not (`main, release/*`). Null: every branch.
    public var branchPattern: String?
    /// Use the resource as a peer plugin's connection: lend it (`connections:
    /// [<ciName>]`), run cloud jobs on it, or both. Null: neither. An update must
    /// send it when the grant has one: a client that cannot show it is refused
    /// (409) rather than changing a grant whose lending it cannot see.
    public var peer: CiResourceGrantPeerInput?

    public init(
        resourceId: String,
        ciName: String,
        outputs: [String],
        secretVersion: String? = nil,
        repos: [String]? = nil,
        branchPattern: String? = nil,
        peer: CiResourceGrantPeerInput? = nil
    ) {
        self.resourceId = resourceId
        self.ciName = ciName
        self.outputs = outputs
        self.secretVersion = secretVersion
        self.repos = repos
        self.branchPattern = branchPattern
        self.peer = peer
    }
}
