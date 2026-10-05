/*
 * InfrawrenchSDK v1.74.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RealizedSavingsBucket: Codable, Hashable, Sendable {
    public var key: String
    public var label: String
    public var currency: String
    /// Currency units (not cents), in the row's currency.
    public var realized: Double
    /// Currency units (not cents), in the row's currency.
    public var projected: Double
    public var events: Int

    public init(
        key: String,
        label: String,
        currency: String,
        realized: Double,
        projected: Double,
        events: Int
    ) {
        self.key = key
        self.label = label
        self.currency = currency
        self.realized = realized
        self.projected = projected
        self.events = events
    }
}
