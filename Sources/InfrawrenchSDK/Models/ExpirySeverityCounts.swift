/*
 * InfrawrenchSDK v1.7.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.7.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Item count per severity; every bucket present, zeros included.
public struct ExpirySeverityCounts: Codable, Hashable, Sendable {
    public var expired: Int
    public var critical: Int
    public var warning: Int
    public var upcoming: Int
    public var ok: Int

    public init(
        expired: Int,
        critical: Int,
        warning: Int,
        upcoming: Int,
        ok: Int
    ) {
        self.expired = expired
        self.critical = critical
        self.warning = warning
        self.upcoming = upcoming
        self.ok = ok
    }
}
