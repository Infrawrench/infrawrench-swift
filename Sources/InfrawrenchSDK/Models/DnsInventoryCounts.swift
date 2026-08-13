/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Record counts per status; zones counted separately.
public struct DnsInventoryCounts: Codable, Hashable, Sendable {
    public var zones: Int
    public var records: Int
    public var owned: Int
    public var dangling: Int
    public var external: Int
    public var notAnalysed: Int

    public init(
        zones: Int,
        records: Int,
        owned: Int,
        dangling: Int,
        external: Int,
        notAnalysed: Int
    ) {
        self.zones = zones
        self.records = records
        self.owned = owned
        self.dangling = dangling
        self.external = external
        self.notAnalysed = notAnalysed
    }
}
