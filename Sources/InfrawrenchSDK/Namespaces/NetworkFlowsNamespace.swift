/*
 * InfrawrenchSDK v1.68.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.68.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct NetworkFlowsKubernetesSettingsUpdateBody: Codable, Hashable, Sendable {
    public var billedQuery: String?

    public init(
        billedQuery: String? = nil
    ) {
        self.billedQuery = billedQuery
    }
}

/// `client.networkFlows`
public final class NetworkFlowsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.networkFlows.kubernetes`
    public let kubernetes: NetworkFlowsKubernetesNamespace
    /// `client.networkFlows.settings`
    public let settings: NetworkFlowsSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.kubernetes = NetworkFlowsKubernetesNamespace(transport: transport)
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

/// `client.networkFlows.kubernetes`
public final class NetworkFlowsKubernetesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.networkFlows.kubernetes.settings`
    public let settings: NetworkFlowsKubernetesSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.settings = NetworkFlowsKubernetesSettingsNamespace(transport: transport)
    }

    /// Kubernetes network costs for one cluster
    ///
    /// Pod-level network attribution for a Kubernetes account: bytes by
    /// namespace, workload and boundary (same zone, cross-zone, cross-region,
    /// internet), the largest workload → peer pairs, and which sources the
    /// figures came from.
    ///
    /// `estimatedCost` is bytes at the published rate of the cloud the nodes run
    /// on, with any per-cluster overrides from the account's rates field. When a
    /// billed source is configured (`PUT .../settings`), `allocatedCost`
    /// apportions that real billed spend across the rows day by day, never
    /// handing out more than was billed; the rest is `unallocatedCost`.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/network-flows/kubernetes/{accountId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Defaults to the `orgId` the client was created with.
    ///
    /// - Parameter from: Inclusive start day. Defaults to 13 days ago.
    ///
    /// - Parameter to: Inclusive end day. Defaults to today.
    ///
    /// - Parameter limit: Pairs to return in `topTalkers`. Defaults to 25.
    public func get(
        orgId: String? = nil,
        accountId: String,
        from: String? = nil,
        to: String? = nil,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> KubernetesNetworkReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/network-flows/kubernetes/{accountId}",
                pathParameters: ["orgId": orgId?.parameterValue, "accountId": accountId.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to), QueryParameter("limit", limit)]
            ),
            options: options
        )
    }
}

/// `client.networkFlows.kubernetes.settings`
public final class NetworkFlowsKubernetesSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Read a cluster's network cost settings
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/network-flows/kubernetes/{accountId}/settings
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Defaults to the `orgId` the client was created with.
    public func get(
        orgId: String? = nil,
        accountId: String,
        options: RequestOptions? = nil
    ) async throws -> KubernetesNetworkSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/network-flows/kubernetes/{accountId}/settings",
                pathParameters: ["orgId": orgId?.parameterValue, "accountId": accountId.parameterValue]
            ),
            options: options
        )
    }

    /// Set the billed data-transfer source for a cluster
    ///
    /// Say which billed cost rows are this cluster's data transfer, in the cost
    /// query language. An empty or null query clears it. A query that narrows
    /// nothing is refused: it would apportion the whole bill across one cluster.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/network-flows/kubernetes/{accountId}/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Defaults to the `orgId` the client was created with.
    public func update(
        orgId: String? = nil,
        accountId: String,
        body: NetworkFlowsKubernetesSettingsUpdateBody,
        options: RequestOptions? = nil
    ) async throws -> KubernetesNetworkSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/network-flows/kubernetes/{accountId}/settings",
                pathParameters: ["orgId": orgId?.parameterValue, "accountId": accountId.parameterValue],
                body: AnyEncodable(body)
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
