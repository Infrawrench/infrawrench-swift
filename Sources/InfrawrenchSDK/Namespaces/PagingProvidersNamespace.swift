/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.pagingProviders`
public final class PagingProvidersNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.pagingProviders.onCall`
    public let onCall: PagingProvidersOnCallNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.onCall = PagingProvidersOnCallNamespace(transport: transport)
    }

    /// List the targets and on-call sources a routing rule can name
    ///
    /// Listed live from each provider, so a destination is picked by name. A
    /// failure is reported per account in `error` rather than failing the
    /// response.
    ///
    /// GET /api/org/{orgId}/paging-providers/destinations
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 402: Payment required: the organization's plan does not include
    /// this
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 500: Server error
    ///
    /// Raises on 503: A backing service this endpoint depends on is not available
    ///
    /// Raises on reauth: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func destinations(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> PagingDestinationsResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/paging-providers/destinations",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// List upstream alerts Infrawrench opened
    ///
    /// One row per (account, target, dedup key): a trigger, its acknowledgement
    /// and its resolution are one alert upstream. `pendingAction` is set while a
    /// send is queued or being retried.
    ///
    /// GET /api/org/{orgId}/paging-providers/events
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 402: Payment required: the organization's plan does not include
    /// this
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 500: Server error
    ///
    /// Raises on 503: A backing service this endpoint depends on is not available
    ///
    /// Raises on reauth: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func events(
        orgId: String? = nil,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> PagingEventsResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/paging-providers/events",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("limit", limit)]
            ),
            options: options
        )
    }

    /// List paging provider accounts and their settings
    ///
    /// GET /api/org/{orgId}/paging-providers
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 402: Payment required: the organization's plan does not include
    /// this
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 500: Server error
    ///
    /// Raises on 503: A backing service this endpoint depends on is not available
    ///
    /// Raises on reauth: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> PagingProvidersResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/paging-providers",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Configure incident mirroring for a paging provider account
    ///
    /// Turning inbound on with a `managed` webhook subscribes one through the
    /// provider's API; turning it off removes the subscription and forgets the
    /// mirrored incidents. A webhook that cannot be subscribed is reported in
    /// `warning` and mirroring falls back to reconciling on a timer.
    ///
    /// PUT /api/org/{orgId}/paging-providers/{accountId}/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 402: Payment required: the organization's plan does not include
    /// this
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 500: Server error
    ///
    /// Raises on 503: A backing service this endpoint depends on is not available
    ///
    /// Raises on reauth: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    ///
    /// - Parameter orgId: Defaults to the `orgId` the client was created with.
    ///
    /// - Parameter accountId: A connected account whose plugin can page.
    public func settings(
        orgId: String? = nil,
        accountId: String,
        body: PagingProviderSettingsInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> PagingProviderSettingsResult {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/paging-providers/{accountId}/settings",
                pathParameters: ["orgId": orgId?.parameterValue, "accountId": accountId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Reconcile an account's incidents now
    ///
    /// POST /api/org/{orgId}/paging-providers/{accountId}/sync
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 402: Payment required: the organization's plan does not include
    /// this
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 500: Server error
    ///
    /// Raises on 503: A backing service this endpoint depends on is not available
    ///
    /// Raises on reauth: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    ///
    /// - Parameter orgId: Defaults to the `orgId` the client was created with.
    ///
    /// - Parameter accountId: A connected account whose plugin can page.
    public func sync(
        orgId: String? = nil,
        accountId: String,
        options: RequestOptions? = nil
    ) async throws -> PagingSyncResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/paging-providers/{accountId}/sync",
                pathParameters: ["orgId": orgId?.parameterValue, "accountId": accountId.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.pagingProviders.onCall`
public final class PagingProvidersOnCallNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Who is on call on a provider schedule or escalation policy
    ///
    /// Takes `team:read`, like the rotation preview. Each person is matched to an
    /// organization member by email; `memberUserId` is null for somebody who is
    /// on call upstream but not a member here.
    ///
    /// GET /api/org/{orgId}/paging-providers/{accountId}/on-call/{sourceId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 402: Payment required: the organization's plan does not include
    /// this
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 500: Server error
    ///
    /// Raises on 503: A backing service this endpoint depends on is not available
    ///
    /// Raises on reauth: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    ///
    /// - Parameter orgId: Defaults to the `orgId` the client was created with.
    ///
    /// - Parameter accountId: A connected account whose plugin can page.
    public func get(
        orgId: String? = nil,
        accountId: String,
        sourceId: String,
        options: RequestOptions? = nil
    ) async throws -> PagingOnCallNowResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/paging-providers/{accountId}/on-call/{sourceId}",
                pathParameters: ["orgId": orgId?.parameterValue, "accountId": accountId.parameterValue, "sourceId": sourceId.parameterValue]
            ),
            options: options
        )
    }
}
