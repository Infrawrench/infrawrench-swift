/*
 * InfrawrenchSDK v0.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SshTunnelCreateAccountRequest: Codable, Hashable, Sendable {
    public var sshHost: String
    public var sshPort: Int
    public var sshUser: String
    public var sshKeyId: String
    public var remoteHost: String
    public var remotePort: Int
    public var pluginId: String
    public var displayName: String
    public var credentials: [String: String]

    public init(
        sshHost: String,
        sshPort: Int,
        sshUser: String,
        sshKeyId: String,
        remoteHost: String,
        remotePort: Int,
        pluginId: String,
        displayName: String,
        credentials: [String: String]
    ) {
        self.sshHost = sshHost
        self.sshPort = sshPort
        self.sshUser = sshUser
        self.sshKeyId = sshKeyId
        self.remoteHost = remoteHost
        self.remotePort = remotePort
        self.pluginId = pluginId
        self.displayName = displayName
        self.credentials = credentials
    }
}
