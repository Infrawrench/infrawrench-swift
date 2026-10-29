/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A tax applied to the invoice subtotal as its own line. Several rates each
/// apply to the same subtotal; they do not compound.
public struct BillingProfileTaxRate: Codable, Hashable, Sendable {
    public var name: String
    /// Percent.
    public var rate: Double

    public init(
        name: String,
        rate: Double
    ) {
        self.name = name
        self.rate = rate
    }
}
