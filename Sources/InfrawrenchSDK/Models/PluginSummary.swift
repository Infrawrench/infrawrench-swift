/*
 * InfrawrenchSDK v0.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PluginSummary: Codable, Hashable, Sendable {
    public var id: String
    public var displayName: String
    public var logoSvg: String
    public var credentialFields: [CredentialField]
    public var preflight: PreflightDeclaration?

    public init(
        id: String,
        displayName: String,
        logoSvg: String,
        credentialFields: [CredentialField],
        preflight: PreflightDeclaration? = nil
    ) {
        self.id = id
        self.displayName = displayName
        self.logoSvg = logoSvg
        self.credentialFields = credentialFields
        self.preflight = preflight
    }
}
