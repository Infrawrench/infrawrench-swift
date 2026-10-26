/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PlatformAgent: Codable, Hashable, Sendable {
    public var id: String
    public var externalId: String
    public var label: String
    public var scopes: [String]
    /// Empty means every provider.
    public var providers: [String]
    public var credentialPrefix: String?
    public var lastSeenAt: String?
    public var revokedAt: String?
    public var createdAt: String

    public init(
        id: String,
        externalId: String,
        label: String,
        scopes: [String],
        providers: [String],
        credentialPrefix: String? = nil,
        lastSeenAt: String? = nil,
        revokedAt: String? = nil,
        createdAt: String
    ) {
        self.id = id
        self.externalId = externalId
        self.label = label
        self.scopes = scopes
        self.providers = providers
        self.credentialPrefix = credentialPrefix
        self.lastSeenAt = lastSeenAt
        self.revokedAt = revokedAt
        self.createdAt = createdAt
    }
}
