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

public struct RealizedSavingsTotal: Codable, Hashable, Sendable {
    public var currency: String
    /// Currency units (not cents), in the row's currency.
    public var realized: Double
    /// Currency units (not cents), in the row's currency.
    public var projected: Double

    public init(
        currency: String,
        realized: Double,
        projected: Double
    ) {
        self.currency = currency
        self.realized = realized
        self.projected = projected
    }
}
