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

public struct PriceCatalogSearchResponse: Codable, Hashable, Sendable {
    public var rows: [PriceCatalogRow]
    public var total: Int
    public var offset: Int
    public var limit: Int
    public var area: PriceCatalogArea
    public var rateType: PriceRateType
    public var providers: [PriceCatalogProviderStatus]
    public var displayCurrency: String?
    public var currencies: [String]
    /// True when rows were sorted across currencies with no common comparable
    /// figure.
    public var mixedCurrencies: Bool
    public var gpuModels: [String]
    public var generatedAt: String

    public init(
        rows: [PriceCatalogRow],
        total: Int,
        offset: Int,
        limit: Int,
        area: PriceCatalogArea,
        rateType: PriceRateType,
        providers: [PriceCatalogProviderStatus],
        displayCurrency: String? = nil,
        currencies: [String],
        mixedCurrencies: Bool,
        gpuModels: [String],
        generatedAt: String
    ) {
        self.rows = rows
        self.total = total
        self.offset = offset
        self.limit = limit
        self.area = area
        self.rateType = rateType
        self.providers = providers
        self.displayCurrency = displayCurrency
        self.currencies = currencies
        self.mixedCurrencies = mixedCurrencies
        self.gpuModels = gpuModels
        self.generatedAt = generatedAt
    }
}
