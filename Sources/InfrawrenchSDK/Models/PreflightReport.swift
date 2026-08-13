/*
 * InfrawrenchSDK v1.23.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.23.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PreflightReport: Codable, Hashable, Sendable {
    public var pluginId: String
    public var supported: Bool
    /// Provider-side identity the credential resolved to (ARN, service account…).
    public var identity: String?
    public var checks: [PreflightCheck]

    public init(
        pluginId: String,
        supported: Bool,
        identity: String? = nil,
        checks: [PreflightCheck]
    ) {
        self.pluginId = pluginId
        self.supported = supported
        self.identity = identity
        self.checks = checks
    }
}
