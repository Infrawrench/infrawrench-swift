/*
 * InfrawrenchSDK v1.70.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.70.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PriceCatalogRow: Codable, Hashable, Sendable {
    public struct Estimate: Codable, Hashable, Sendable {
        public var resourceTypeId: String
        public var fields: [String: String]

        public init(
            resourceTypeId: String,
            fields: [String: String]
        ) {
            self.resourceTypeId = resourceTypeId
            self.fields = fields
        }
    }

    public var pluginId: PluginId
    public var pluginName: String
    public var serviceId: String
    public var serviceLabel: String
    public var sku: String
    public var name: String
    public var family: PriceCatalogProductFamily
    public var series: String?
    public var specs: PriceCatalogSpecs
    public var region: String
    public var regionLabel: String
    public var price: PriceCatalogPrice
    /// `price` as a 730-hour month.
    public var monthlyAmount: Double?
    public var comparable: PriceCatalogComparable?
    /// The product's other rates in the same region.
    public var otherPrices: [PriceCatalogPrice]
    /// Create-form prefill for the plugin's estimate, with the region filled in.
    public var estimate: Estimate?

    public init(
        pluginId: PluginId,
        pluginName: String,
        serviceId: String,
        serviceLabel: String,
        sku: String,
        name: String,
        family: PriceCatalogProductFamily,
        series: String? = nil,
        specs: PriceCatalogSpecs,
        region: String,
        regionLabel: String,
        price: PriceCatalogPrice,
        monthlyAmount: Double? = nil,
        comparable: PriceCatalogComparable? = nil,
        otherPrices: [PriceCatalogPrice],
        estimate: Estimate? = nil
    ) {
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.serviceId = serviceId
        self.serviceLabel = serviceLabel
        self.sku = sku
        self.name = name
        self.family = family
        self.series = series
        self.specs = specs
        self.region = region
        self.regionLabel = regionLabel
        self.price = price
        self.monthlyAmount = monthlyAmount
        self.comparable = comparable
        self.otherPrices = otherPrices
        self.estimate = estimate
    }
}
