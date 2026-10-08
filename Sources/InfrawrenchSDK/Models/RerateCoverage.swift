/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct RerateCoverage: Codable, Hashable, Sendable {
    public struct ByCurrencyValue: Codable, Hashable, Sendable {
        /// Collected spend priced from a provider-reported list price.
        public var listPriced: Double
        /// What that spend lists at.
        public var listTotal: Double
        /// Collected spend with no list price, priced at the uplift.
        public var fallback: Double

        public init(
            listPriced: Double,
            listTotal: Double,
            fallback: Double
        ) {
            self.listPriced = listPriced
            self.listTotal = listTotal
            self.fallback = fallback
        }
    }

    public struct Service: Codable, Hashable, Sendable {
        public var pluginId: String
        public var service: String
        public var currency: String
        public var listPriced: Double
        public var fallback: Double

        public init(
            pluginId: String,
            service: String,
            currency: String,
            listPriced: Double,
            fallback: Double
        ) {
            self.pluginId = pluginId
            self.service = service
            self.currency = currency
            self.listPriced = listPriced
            self.fallback = fallback
        }
    }

    public var byCurrency: [String: ByCurrencyValue]
    public var services: [Service]

    public init(
        byCurrency: [String: ByCurrencyValue],
        services: [Service]
    ) {
        self.byCurrency = byCurrency
        self.services = services
    }
}
