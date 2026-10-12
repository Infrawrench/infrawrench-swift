/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EventSubscriptionWithSecret: Codable, Hashable, Sendable {
    public var subscription: EventSubscription
    /// The signing secret (`iwhsec_…`). Returned only here; store it now. Null
    /// for publish destinations.
    public var secret: String?

    public init(
        subscription: EventSubscription,
        secret: String? = nil
    ) {
        self.subscription = subscription
        self.secret = secret
    }
}
