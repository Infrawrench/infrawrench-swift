/*
 * InfrawrenchSDK v0.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreateApiKeyRequest: Codable, Hashable, Sendable {
    public var name: String
    public var scopes: [Permission]
    public var expiresAt: String?

    public init(
        name: String,
        scopes: [Permission],
        expiresAt: String? = nil
    ) {
        self.name = name
        self.scopes = scopes
        self.expiresAt = expiresAt
    }
}
