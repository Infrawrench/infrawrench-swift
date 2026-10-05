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

public struct AiProviderCoverage: Codable, Hashable, Sendable {
    public var provider: String
    public var currency: String
    public var billedAmount: Double
    public var attributedAmount: Double
    public var unattributedAmount: Double

    public init(
        provider: String,
        currency: String,
        billedAmount: Double,
        attributedAmount: Double,
        unattributedAmount: Double
    ) {
        self.provider = provider
        self.currency = currency
        self.billedAmount = billedAmount
        self.attributedAmount = attributedAmount
        self.unattributedAmount = unattributedAmount
    }
}
