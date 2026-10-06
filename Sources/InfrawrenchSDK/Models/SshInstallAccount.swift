/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SshInstallAccount: Codable, Hashable, Sendable {
    public var accountId: String
    public var displayName: String
    public var pluginId: String
    public var serviceName: String
    public var description: String
    public var logoSvg: String?

    public init(
        accountId: String,
        displayName: String,
        pluginId: String,
        serviceName: String,
        description: String,
        logoSvg: String? = nil
    ) {
        self.accountId = accountId
        self.displayName = displayName
        self.pluginId = pluginId
        self.serviceName = serviceName
        self.description = description
        self.logoSvg = logoSvg
    }
}
