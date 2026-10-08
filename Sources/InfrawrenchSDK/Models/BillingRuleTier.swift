/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BillingRuleTier: Codable, Hashable, Sendable {
    /// Exclusive upper bound of monthly spend this tier covers, in the rule's
    /// `currency`. Null on the last tier, which is open-ended.
    public var upTo: Double?
    /// Signed: +8 marks up by 8%, -2 discounts by 2%.
    public var percent: Double

    public init(
        upTo: Double? = nil,
        percent: Double
    ) {
        self.upTo = upTo
        self.percent = percent
    }
}
