/*
 * InfrawrenchSDK v0.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ConnectTemplatesResponse: Codable, Hashable, Sendable {
    public var templates: [SecretExportTemplate]
    public var effectiveResourceTypeId: String
    public var supportsSecretImport: Bool
    public var namespaces: [String]

    public init(
        templates: [SecretExportTemplate],
        effectiveResourceTypeId: String,
        supportsSecretImport: Bool,
        namespaces: [String]
    ) {
        self.templates = templates
        self.effectiveResourceTypeId = effectiveResourceTypeId
        self.supportsSecretImport = supportsSecretImport
        self.namespaces = namespaces
    }
}
