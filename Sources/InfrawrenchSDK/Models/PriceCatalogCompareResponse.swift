/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PriceCatalogCompareResponse: Codable, Hashable, Sendable {
    public var target: PriceCatalogCompareTarget
    public var reference: PriceCatalogRow?
    public var area: PriceCatalogArea
    public var rateType: PriceRateType
    public var providers: [PriceCatalogCompareProvider]
    public var displayCurrency: String?
    public var mixedCurrencies: Bool
    public var generatedAt: String

    public init(
        target: PriceCatalogCompareTarget,
        reference: PriceCatalogRow? = nil,
        area: PriceCatalogArea,
        rateType: PriceRateType,
        providers: [PriceCatalogCompareProvider],
        displayCurrency: String? = nil,
        mixedCurrencies: Bool,
        generatedAt: String
    ) {
        self.target = target
        self.reference = reference
        self.area = area
        self.rateType = rateType
        self.providers = providers
        self.displayCurrency = displayCurrency
        self.mixedCurrencies = mixedCurrencies
        self.generatedAt = generatedAt
    }
}
