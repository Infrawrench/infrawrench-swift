/*
 * InfrawrenchSDK v1.97.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.97.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AwsPricingSource: Codable, Hashable, Sendable {
    /// A platform name, or `spot` for EC2 spot prices.
    public var source: String
    public var version: String
    /// Newest price list in the data (UTC).
    public var priceListTo: String?
    /// When it was loaded (UTC).
    public var syncedAt: String
    public var priceRows: Int

    public init(
        source: String,
        version: String,
        priceListTo: String? = nil,
        syncedAt: String,
        priceRows: Int
    ) {
        self.source = source
        self.version = version
        self.priceListTo = priceListTo
        self.syncedAt = syncedAt
        self.priceRows = priceRows
    }
}
