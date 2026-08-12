/*
 * InfrawrenchSDK v1.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CurrencySettings: Codable, Hashable, Sendable {
    /// The currency converted amounts are expressed in, or `null` for no
    /// conversion at all. `null` is the default and the state of every
    /// organization that has not opted in: cost data is stored per currency and
    /// never merged unless you ask.
    public var displayCurrency: String?

    public init(
        displayCurrency: String? = nil
    ) {
        self.displayCurrency = displayCurrency
    }
}
