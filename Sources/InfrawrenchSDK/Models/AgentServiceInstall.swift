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

public struct AgentServiceInstall: Codable, Hashable, Sendable {
    public var accountId: String
    public var pluginId: String
    public var message: String
    public var address: String?

    public init(
        accountId: String,
        pluginId: String,
        message: String,
        address: String? = nil
    ) {
        self.accountId = accountId
        self.pluginId = pluginId
        self.message = message
        self.address = address
    }
}
