/*
 * InfrawrenchSDK v1.19.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.19.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SftpPathRequest: Codable, Hashable, Sendable {
    public var accountId: String
    public var path: String
    public var sshKeyId: String?
    public var sshHost: String?
    public var sshUsername: String?

    public init(
        accountId: String,
        path: String,
        sshKeyId: String? = nil,
        sshHost: String? = nil,
        sshUsername: String? = nil
    ) {
        self.accountId = accountId
        self.path = path
        self.sshKeyId = sshKeyId
        self.sshHost = sshHost
        self.sshUsername = sshUsername
    }
}
