/*
 * InfrawrenchSDK v1.74.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.0).
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

    /// Automatic reference rates for one day
    ///
    /// Every rate the ECB feed holds for `date` (default today; weekends and
    /// holidays carry the last publication), expressed in `base` (default the
    /// display currency, else EUR), plus the feed's state. Readable whether or
    /// not the organization has automatic rates on.
    ///
    /// GET /api/org/{orgId}/currency/feed
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter base: ISO 4217 code, upper-case.
    public func feed(
        orgId: String? = nil,
        date: String? = nil,
        base: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> FxFeedRates {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/currency/feed",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("date", date), QueryParameter("base", base)]
            ),
            options: options
        )
    }

    /// The org's currency settings, exchange rate table and feed state
    ///
    /// Readable with `costs:read` rather than a settings permission: anyone who
    /// can see a converted total has to be able to see what it was converted at,
    /// or the number is unauditable. `feed` reports the automatic ECB
    /// reference-rate feed (global, the same for every organization): its newest
    /// publication, its coverage and its last error.
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

    /// Which rate a day of spend converts at
    ///
    /// Applies the organization's precedence (a stated rate covering the day,
    /// else the automatic feed when on, at the day or month-end rate per
    /// `rateBasis`) and explains the outcome. `to` defaults to the display
    /// currency; `date` defaults to today.
    ///
    /// GET /api/org/{orgId}/currency/lookup
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter from: ISO 4217 code, upper-case.
    ///
    /// - Parameter to: ISO 4217 code, upper-case.
    public func lookup(
        orgId: String? = nil,
        from: String,
        to: String? = nil,
        date: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ExchangeRateLookup {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/currency/lookup",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to), QueryParameter("date", date)]
            ),
            options: options
        )
    }

    /// Save the org's currency settings
    ///
    /// Setting a display currency opts the organization into converted totals;
    /// `null` turns conversion off everywhere and restores the per-currency view.
    /// Clearing does not delete the rate table, so conversion can be turned back
    /// on without re-stating anything. With `autoRates` off, only currencies with
    /// a stated rate are converted; with it on, the daily ECB reference rates
    /// fill the days no stated rate covers.
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
        body: CurrencySettingsInput,
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
    /// rate, then the automatic feed when on, or to unconverted if none applies.
    /// Spend never disappears: it reverts to its own currency.
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
    /// Upserts on (`fromCurrency`, `toCurrency`, `effectiveFrom`): one rate per
    /// pair per day, so correcting a rate replaces it rather than adding a second
    /// one whose precedence a reader would have to guess. Stated rates are one
    /// hop to the display currency and are never inverted or chained. A stated
    /// rate always wins over the automatic feed for the days it covers; give it
    /// an `effectiveTo` to hand the days after back to the feed.
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
