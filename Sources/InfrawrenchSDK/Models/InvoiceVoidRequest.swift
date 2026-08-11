/*
 * InfrawrenchSDK v1.13.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.13.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct InvoiceVoidRequest: Codable, Hashable, Sendable {
    /// Required. The only record of why a customer was sent an invoice that was
    /// then withdrawn.
    public var reason: String
    /// Raise the corrective draft in the same call, linked both ways to the
    /// original. Doing it in one call is what keeps the pair from being left
    /// half-made by a failed second request.
    public var supersede: Bool?

    public init(
        reason: String,
        supersede: Bool? = nil
    ) {
        self.reason = reason
        self.supersede = supersede
    }
}
