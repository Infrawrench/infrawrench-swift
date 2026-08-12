/*
 * InfrawrenchSDK v1.18.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.18.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.credits`
public final class CreditsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Prepaid credit balances, burn rate and runway
    ///
    /// Every prepaid pot the organization holds, most urgent first. A provider
    /// that bills in arrears sends an invoice you can argue with; a prepaid pot
    /// that empties simply stops answering — so this is an availability number as
    /// much as a finance one.
    ///
    /// The burn rate is measured from the server's own series of readings rather
    /// than reported by the provider, and it is the sum of the **decreases**
    /// between consecutive readings: a top-up inside the window is recorded
    /// separately, never netted off. The runway is bounded by both the burn and
    /// the credit's own expiry, whichever comes first.
    ///
    /// Only providers that expose a balance appear here; most bill in arrears and
    /// have no pot.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/credits
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CreditBurndown {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/credits",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
