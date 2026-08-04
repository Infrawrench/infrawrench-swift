/*
 * InfrawrenchSDK v0.32.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.32.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.billing`
public final class BillingNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Start a Stripe Checkout session
    ///
    /// Rejected with 400 for complimentary organizations — they are never billed.
    ///
    /// _Requires permission: `billing:write`._
    ///
    /// POST /api/org/{orgId}/billing/checkout
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 500: Server error
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func checkout(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> StripeRedirectUrl {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/billing/checkout",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get a Stripe customer portal URL
    ///
    /// _Requires permission: `billing:write`._
    ///
    /// POST /api/org/{orgId}/billing/portal
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func portal(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> StripeRedirectUrl {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/billing/portal",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get the org's billing status (complimentary flag + subscription or `null`)
    ///
    /// _Requires permission: `billing:read`._
    ///
    /// GET /api/org/{orgId}/billing/status
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func status(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> BillingStatus {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/billing/status",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
