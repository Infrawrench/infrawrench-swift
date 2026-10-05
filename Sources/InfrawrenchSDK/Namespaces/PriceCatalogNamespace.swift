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

public struct PriceCatalogProvidersResult: Codable, Hashable, Sendable {
    public var providers: [PriceCatalogProviderStatus]

    public init(
        providers: [PriceCatalogProviderStatus]
    ) {
        self.providers = providers
    }
}

/// `client.priceCatalog`
public final class PriceCatalogNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Compare equivalent instances across providers
    ///
    /// The cheapest product per provider that meets every stated spec (at least
    /// the vCPUs, memory and GPUs asked for), in each provider's region for the
    /// area. Give the target as specs, or name a reference product and its specs
    /// are used.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/price-catalog/compare
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 402: Payment required — the organization's plan does not include
    /// this
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 500: Server error
    ///
    /// Raises on 503: A backing service this endpoint depends on is not available
    ///
    /// Raises on reauth: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter vcpus: Minimum vCPUs.
    ///
    /// - Parameter memoryGb: Minimum memory, GB.
    ///
    /// - Parameter gpuCount: Minimum GPUs.
    ///
    /// - Parameter pluginIds: Comma-separated plugin ids.
    ///
    /// - Parameter alternatives: Runners-up per provider, 0 to 10. Default 2.
    public func compare(
        orgId: String? = nil,
        vcpus: String? = nil,
        memoryGb: String? = nil,
        gpuCount: String? = nil,
        gpuModel: String? = nil,
        referencePluginId: String? = nil,
        referenceSku: String? = nil,
        area: PriceCatalogArea? = nil,
        rateType: PriceRateType? = nil,
        pluginIds: String? = nil,
        alternatives: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> PriceCatalogCompareResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/price-catalog/compare",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("vcpus", vcpus), QueryParameter("memoryGb", memoryGb), QueryParameter("gpuCount", gpuCount), QueryParameter("gpuModel", gpuModel), QueryParameter("referencePluginId", referencePluginId), QueryParameter("referenceSku", referenceSku), QueryParameter("area", area), QueryParameter("rateType", rateType), QueryParameter("pluginIds", pluginIds), QueryParameter("alternatives", alternatives)]
            ),
            options: options
        )
    }

    /// List the providers that publish a price catalog
    ///
    /// Every plugin that declares a price catalog, with its source, refresh
    /// cadence, services, regions and whether its price API needs credentials. A
    /// credentialed provider the org has no account on reports `no-account`.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/price-catalog/providers
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 402: Payment required — the organization's plan does not include
    /// this
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 500: Server error
    ///
    /// Raises on 503: A backing service this endpoint depends on is not available
    ///
    /// Raises on reauth: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func providers(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> PriceCatalogProvidersResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/price-catalog/providers",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Search provider list prices
    ///
    /// Search instance types across every catalog provider: one row per product
    /// priced at the requested rate type in the region chosen for each provider.
    /// Filters narrow by provider, service, specs, GPU and price; rows sort by
    /// monthly price by default.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/price-catalog/search
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 402: Payment required — the organization's plan does not include
    /// this
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 500: Server error
    ///
    /// Raises on 503: A backing service this endpoint depends on is not available
    ///
    /// Raises on reauth: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter q: Free text over SKU, name, series and GPU model.
    ///
    /// - Parameter pluginIds: Comma-separated plugin ids.
    ///
    /// - Parameter serviceIds: Comma-separated service ids (from the providers
    /// list).
    ///
    /// - Parameter families: Comma-separated product families.
    ///
    /// - Parameter region: Exact provider region, for providers that declare it.
    ///
    /// - Parameter minVcpus: Minimum vCPUs.
    ///
    /// - Parameter maxVcpus: Maximum vCPUs.
    ///
    /// - Parameter minMemoryGb: Minimum memory, GB.
    ///
    /// - Parameter maxMemoryGb: Maximum memory, GB.
    ///
    /// - Parameter gpu: One of `any`, `required`, `none`.
    ///
    /// - Parameter gpuModel: Case-insensitive substring, e.g. `H100`.
    ///
    /// - Parameter minGpus: Minimum GPU count.
    ///
    /// - Parameter maxMonthlyPrice: Upper bound on the comparable monthly price.
    ///
    /// - Parameter term: `1yr` or `3yr` for commitments.
    ///
    /// - Parameter sort: One of `price`, `vcpus`, `memory`, `gpus`, `name`.
    ///
    /// - Parameter order: One of `asc`, `desc`.
    ///
    /// - Parameter limit: Rows per page, 1 to 500. Default 100.
    ///
    /// - Parameter offset: Rows to skip.
    public func search(
        orgId: String? = nil,
        q: String? = nil,
        pluginIds: String? = nil,
        serviceIds: String? = nil,
        families: String? = nil,
        region: String? = nil,
        area: PriceCatalogArea? = nil,
        minVcpus: String? = nil,
        maxVcpus: String? = nil,
        minMemoryGb: String? = nil,
        maxMemoryGb: String? = nil,
        gpu: String? = nil,
        gpuModel: String? = nil,
        minGpus: String? = nil,
        maxMonthlyPrice: String? = nil,
        rateType: PriceRateType? = nil,
        term: String? = nil,
        sort: String? = nil,
        order: String? = nil,
        limit: String? = nil,
        offset: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> PriceCatalogSearchResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/price-catalog/search",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("q", q), QueryParameter("pluginIds", pluginIds), QueryParameter("serviceIds", serviceIds), QueryParameter("families", families), QueryParameter("region", region), QueryParameter("area", area), QueryParameter("minVcpus", minVcpus), QueryParameter("maxVcpus", maxVcpus), QueryParameter("minMemoryGb", minMemoryGb), QueryParameter("maxMemoryGb", maxMemoryGb), QueryParameter("gpu", gpu), QueryParameter("gpuModel", gpuModel), QueryParameter("minGpus", minGpus), QueryParameter("maxMonthlyPrice", maxMonthlyPrice), QueryParameter("rateType", rateType), QueryParameter("term", term), QueryParameter("sort", sort), QueryParameter("order", order), QueryParameter("limit", limit), QueryParameter("offset", offset)]
            ),
            options: options
        )
    }
}
