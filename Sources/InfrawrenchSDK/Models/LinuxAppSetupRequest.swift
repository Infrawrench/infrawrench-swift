/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LinuxAppSetupRequest: Codable, Hashable, Sendable {
    public var accountId: String
    public var resourceId: String
    public var sshKeyId: String
    public var host: String
    public var username: String
    public var port: Int?
    public var requirements: [LinuxAppRequirementId]?

    public init(
        accountId: String,
        resourceId: String,
        sshKeyId: String,
        host: String,
        username: String,
        port: Int? = nil,
        requirements: [LinuxAppRequirementId]? = nil
    ) {
        self.accountId = accountId
        self.resourceId = resourceId
        self.sshKeyId = sshKeyId
        self.host = host
        self.username = username
        self.port = port
        self.requirements = requirements
    }
}
