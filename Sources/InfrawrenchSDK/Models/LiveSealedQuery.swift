/*
 * InfrawrenchSDK v1.123.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.123.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LiveSealedQuery: Codable, Hashable, Sendable {
    /// Opaque encrypted capability. A bearer credential: keep it out of URLs and
    /// logs.
    public var capability: String
    /// Stable identity of the query; a renewal carries the same one.
    public var queryFingerprint: String
    /// Unix milliseconds. Ask for a fresh ticket shortly before this to renew.
    public var expiresAt: Double

    public init(
        capability: String,
        queryFingerprint: String,
        expiresAt: Double
    ) {
        self.capability = capability
        self.queryFingerprint = queryFingerprint
        self.expiresAt = expiresAt
    }
}
