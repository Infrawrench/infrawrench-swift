/*
 * InfrawrenchSDK v0.3.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.3.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BillingStatus: Codable, Hashable, Sendable {
    /// Platform-granted complimentary access: all paid perks, uncapped AI chat,
    /// never billed.
    public var complimentary: Bool
    public var subscription: Subscription?

    public init(
        complimentary: Bool,
        subscription: Subscription? = nil
    ) {
        self.complimentary = complimentary
        self.subscription = subscription
    }
}
