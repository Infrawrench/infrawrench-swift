/*
 * InfrawrenchSDK v1.17.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.17.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DnsInventoryResponse: Codable, Hashable, Sendable {
    /// Sorted by domain, then account name.
    public var zones: [DnsZone]
    /// Sorted worst status first, then by name.
    public var records: [DnsRecord]
    public var counts: DnsInventoryCounts
    /// Provider namespaces that were declared but not evaluated, and why — either
    /// no account for the plugin is connected, or no claimant resource has
    /// synced. Both are missing data rather than a clean bill of health, so they
    /// are reported rather than hidden.
    public var skippedNamespaces: [DnsSkippedNamespace]
    public var generatedAt: String

    public init(
        zones: [DnsZone],
        records: [DnsRecord],
        counts: DnsInventoryCounts,
        skippedNamespaces: [DnsSkippedNamespace],
        generatedAt: String
    ) {
        self.zones = zones
        self.records = records
        self.counts = counts
        self.skippedNamespaces = skippedNamespaces
        self.generatedAt = generatedAt
    }
}
