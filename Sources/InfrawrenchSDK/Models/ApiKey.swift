/*
 * InfrawrenchSDK v0.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ApiKey: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var `prefix`: String
    public var scopes: [Permission]
    public var lastUsedAt: String?
    public var expiresAt: String?
    public var revokedAt: String?
    /// Cutover date past which a key still on the legacy SHA-256 hash will be
    /// refused. Null once rehashed to HMAC.
    public var legacyHashSunsetAt: String?
    /// True when this key is still hashed with the legacy SHA-256 scheme and
    /// should be rotated before `legacyHashSunsetAt`.
    public var needsRotation: Bool
    public var createdAt: String

    public init(
        id: String,
        name: String,
        `prefix`: String,
        scopes: [Permission],
        lastUsedAt: String? = nil,
        expiresAt: String? = nil,
        revokedAt: String? = nil,
        legacyHashSunsetAt: String? = nil,
        needsRotation: Bool,
        createdAt: String
    ) {
        self.id = id
        self.name = name
        self.`prefix` = `prefix`
        self.scopes = scopes
        self.lastUsedAt = lastUsedAt
        self.expiresAt = expiresAt
        self.revokedAt = revokedAt
        self.legacyHashSunsetAt = legacyHashSunsetAt
        self.needsRotation = needsRotation
        self.createdAt = createdAt
    }
}
