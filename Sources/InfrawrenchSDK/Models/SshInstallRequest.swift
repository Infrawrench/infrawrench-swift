/*
 * InfrawrenchSDK v1.42.2 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.42.2).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SshInstallRequest: Codable, Hashable, Sendable {
    public struct Target: Codable, Hashable, Sendable {
        public var accountId: String
        public var resourceTypeId: String
        public var resourceId: ResourceId

        public init(
            accountId: String,
            resourceTypeId: String,
            resourceId: ResourceId
        ) {
            self.accountId = accountId
            self.resourceTypeId = resourceTypeId
            self.resourceId = resourceId
        }
    }

    public var installerAccountId: String
    public var target: Target
    public var sshKeyId: String?
    public var username: String?
    public var port: Int?

    public init(
        installerAccountId: String,
        target: Target,
        sshKeyId: String? = nil,
        username: String? = nil,
        port: Int? = nil
    ) {
        self.installerAccountId = installerAccountId
        self.target = target
        self.sshKeyId = sshKeyId
        self.username = username
        self.port = port
    }
}
