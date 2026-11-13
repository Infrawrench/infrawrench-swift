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

/// What the job was lent, by name only: connections, SSH keys, resources and
/// `env-from:` grants.
public struct CiJobAccessNames: Codable, Hashable, Sendable {
    public var connections: [String]?
    public var sshKeys: [String]?
    public var resources: [String]?
    public var envFrom: [String]?

    public init(
        connections: [String]? = nil,
        sshKeys: [String]? = nil,
        resources: [String]? = nil,
        envFrom: [String]? = nil
    ) {
        self.connections = connections
        self.sshKeys = sshKeys
        self.resources = resources
        self.envFrom = envFrom
    }
}
