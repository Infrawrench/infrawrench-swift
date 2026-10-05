/*
 * InfrawrenchSDK v1.70.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.70.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.billingRules`
public final class BillingRulesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a billing rule
    ///
    /// Requires `org:settings:write` rather than `costs:write`: a billing rule
    /// changes every figure the organisation reports about itself, which is a
    /// governance act on the scale of stating an exchange rate, not the scale of
    /// saving a report.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/billing-rules
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: BillingRuleInput,
        options: RequestOptions? = nil
    ) async throws -> BillingRule {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/billing-rules",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a billing rule
    ///
    /// Nothing cascades and nothing is restated: no adjustment was ever written
    /// into stored cost data, so the next read simply computes without this rule.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// DELETE /api/org/{orgId}/billing-rules/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/billing-rules/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a billing rule
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/billing-rules/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> BillingRule {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/billing-rules/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List billing rules in evaluation order
    ///
    /// Billing rules are the organisation's own adjustments to collected spend —
    /// a markup that recovers shared overhead, a discount negotiated outside the
    /// provider's pricing, a shared cluster reallocated onto the teams that use
    /// it.
    ///
    /// **They are applied at query time and never written into stored cost
    /// data.** Collected spend stays exactly what the provider reported, so it
    /// can still be reconciled against an invoice, and editing or deleting a rule
    /// restates nothing.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/billing-rules
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [BillingRule] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/billing-rules",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Preview a rule or customer pricing against a month of spend
    ///
    /// Prices one calendar month (last month by default) twice: with the saved
    /// rules and settings, and with the candidate rule or customer settings
    /// swapped in. Nothing is written. Returns both totals, every effect,
    /// re-rating coverage, any expression failures and the lines that moved most.
    ///
    /// Requires `costs:read`, and `invoices:read` as well when a customer is
    /// named.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/billing-rules/preview
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func preview(
        orgId: String? = nil,
        body: PricingPreviewRequest,
        options: RequestOptions? = nil
    ) async throws -> PricingPreviewResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/billing-rules/preview",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Reorder billing rules
    ///
    /// Rewrites every rule's priority to match the given order (10, 20, 30…) in
    /// one transaction and one audit entry. The list must name every rule exactly
    /// once.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/billing-rules/reorder
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func reorder(
        orgId: String? = nil,
        body: BillingRuleOrder,
        options: RequestOptions? = nil
    ) async throws -> [BillingRule] {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/billing-rules/reorder",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Update a billing rule
    ///
    /// A full replace, `enabled` included — switching a markup off is an edit of
    /// the rule, so there is one audited action for “this rule changed” rather
    /// than two.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/billing-rules/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: BillingRuleInput,
        options: RequestOptions? = nil
    ) async throws -> BillingRule {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/billing-rules/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
