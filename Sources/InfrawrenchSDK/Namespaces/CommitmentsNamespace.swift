/*
 * InfrawrenchSDK v1.24.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.24.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.commitments`
public final class CommitmentsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Reservations, savings plans and committed-use discounts
    ///
    /// The organization's purchased commitments — reserved instances, savings
    /// plans, committed-use discounts — with three derived readings.
    ///
    /// **Coverage** is a range, not a number: the broad ratio counts every
    /// uncovered usage dollar in the denominator (a lower bound — egress and
    /// per-request charges can never be committed against), the narrow ratio only
    /// uncovered usage in cells where a commitment demonstrably landed (an upper
    /// bound). Accounts whose plugin cannot distinguish charge types are excluded
    /// and listed; a scope where every account is excluded reports unavailable,
    /// not 0%.
    ///
    /// **Utilization** is measured only over days cost data was actually
    /// collected — a collection gap is reported as missing days, never counted as
    /// idle commitment. Unit-denominated commitments (GCP) report null with a
    /// reason, never 0%. Azure's own reported utilization rides on each holding
    /// separately and is never blended with the derived figure.
    ///
    /// **The planner** recommends committing at the p10 floor of daily uncovered
    /// spend, gated on presence, trend, floor and materiality. Savings are quoted
    /// against published "up to" discount rates and marked as such. Nothing is
    /// ever purchased automatically.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/commitments
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CommitmentsFeed {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/commitments",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
