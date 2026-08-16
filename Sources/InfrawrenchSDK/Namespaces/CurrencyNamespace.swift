/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CurrencyRatesDeleteResult: Codable, Hashable, Sendable {
    public var ok: Bool

    public init(
        ok: Bool
    ) {
        self.ok = ok
    }
}

/// `client.currency`
public final class CurrencyNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.currency.rates`
    public let rates: CurrencyRatesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.rates = CurrencyRatesNamespace(transport: transport)
    }

    /// The org's display currency and exchange rate table
    ///
    /// Readable with `costs:read` rather than a settings permission: anyone who
    /// can see a converted total has to be able to see what it was converted at,
    /// or the number is unauditable.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/currency
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CurrencyConfig {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/currency",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Set or clear the org's display currency
    ///
    /// Setting a currency opts the organization into converted totals; `null`
    /// turns conversion off everywhere and restores the per-currency view.
    /// Clearing does not delete the rate table, so conversion can be turned back
    /// on without re-stating anything. Only currencies with a configured rate are
    /// converted — Infrawrench never fetches live exchange rates.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/currency
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: CurrencySettings,
        options: RequestOptions? = nil
    ) async throws -> CurrencySettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/currency",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.currency.rates`
public final class CurrencyRatesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Delete one exchange rate
    ///
    /// Removing a rate makes the days it covered fall back to the next-older
    /// rate, or to unconverted if none remains. Spend never disappears — it
    /// reverts to its own currency.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// DELETE /api/org/{orgId}/currency/rates/{rateId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        rateId: String,
        options: RequestOptions? = nil
    ) async throws -> CurrencyRatesDeleteResult {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/currency/rates/{rateId}",
                pathParameters: ["orgId": orgId?.parameterValue, "rateId": rateId.parameterValue]
            ),
            options: options
        )
    }

    /// Create or replace one exchange rate
    ///
    /// Upserts on (`fromCurrency`, `toCurrency`, `effectiveFrom`) — one rate per
    /// pair per day, so correcting a rate replaces it rather than adding a second
    /// one whose precedence a reader would have to guess. Rates are stated to the
    /// display currency in one hop: nothing inverts a rate or chains two, because
    /// both produce a number you never stated.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/currency/rates
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: ExchangeRateInput,
        options: RequestOptions? = nil
    ) async throws -> ExchangeRate {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/currency/rates",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
