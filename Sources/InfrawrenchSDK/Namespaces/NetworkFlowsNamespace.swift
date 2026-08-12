/*
 * InfrawrenchSDK v1.15.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.15.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.networkFlows`
public final class NetworkFlowsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.networkFlows.settings`
    public let settings: NetworkFlowsSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.settings = NetworkFlowsSettingsNamespace(transport: transport)
    }

    /// Priced source→destination network flow attribution
    ///
    /// Which two things are talking, across which billing boundary, and what that
    /// costs. Answers the question the cost dimensions structurally cannot: every
    /// cost dimension is about one side of a transfer, and a network charge is
    /// about a pair.
    ///
    /// All figures are **estimates** and the `estimated` field says so
    /// unconditionally. Bytes come from the provider's flow logs (which sample,
    /// or drop records under capacity pressure) and are priced at published list
    /// rates with no free tier, no volume tier and no negotiated discount
    /// applied. Use the ranking; do not reconcile the total against an invoice
    /// line.
    ///
    /// Accounts whose provider has no readable flow source appear in `accounts`
    /// with `supportsFlows: false` and contribute nothing to the totals — never
    /// zero bytes.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/network-flows
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter from: Inclusive start day. Defaults to 13 days ago.
    ///
    /// - Parameter to: Inclusive end day. Defaults to today.
    ///
    /// - Parameter scope: Narrow to one billing boundary. One of `intra_zone`,
    /// `cross_zone`, `cross_region`, `internet_egress`, `internet_ingress`,
    /// `provider_service`, `nat_gateway`, `private_interconnect`, `unknown`.
    ///
    /// - Parameter accountId: Narrow to one connected account.
    ///
    /// - Parameter limit: Pairs to return in `topFlows`, largest cost first.
    /// Defaults to 50.
    public func get(
        orgId: String? = nil,
        from: String? = nil,
        to: String? = nil,
        scope: String? = nil,
        accountId: String? = nil,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> NetworkFlowFeed {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/network-flows",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to), QueryParameter("scope", scope), QueryParameter("accountId", accountId), QueryParameter("limit", limit)]
            ),
            options: options
        )
    }
}

/// `client.networkFlows.settings`
public final class NetworkFlowsSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Read the network flow collection switch
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/network-flows/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> NetworkFlowSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/network-flows/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Turn network flow collection on or off
    ///
    /// Collection is **off by default**. Enabling it authorizes Infrawrench to
    /// run daily queries against the provider's log store — and on AWS those
    /// queries are billed to your own cloud account per GB of log data scanned,
    /// every day, until you turn them off. That is why the write is governed by
    /// `org:settings:write` rather than `costs:write`, and why it is
    /// audit-logged.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/network-flows/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: NetworkFlowSettings,
        options: RequestOptions? = nil
    ) async throws -> NetworkFlowSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/network-flows/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
