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

/// `client.pagingIncidents`
public final class PagingIncidentsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Acknowledge a provider incident
    ///
    /// Written to the provider as the acting member where the provider records
    /// who acted (PagerDuty's `From` header), falling back to the account's
    /// default user. The returned state is the provider's answer, not an
    /// assumption.
    ///
    /// POST /api/org/{orgId}/paging-incidents/{id}/acknowledge
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
    public func acknowledge(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> PagerIncident {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/paging-incidents/{id}/acknowledge",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List incidents mirrored from paging providers
    ///
    /// Only accounts with inbound mirroring turned on contribute. Open incidents
    /// by default; `status=all` includes resolved ones. These are a provider's
    /// pages, distinct from incidents declared in Infrawrench (`/incidents`).
    ///
    /// GET /api/org/{orgId}/paging-incidents
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
    ///
    /// - Parameter status: One of `open`, `all`.
    public func get(
        orgId: String? = nil,
        status: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> PagerIncidentsResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/paging-incidents",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("status", status)]
            ),
            options: options
        )
    }

    /// Resolve a provider incident
    ///
    /// Written to the provider as the acting member where the provider records
    /// who acted (PagerDuty's `From` header), falling back to the account's
    /// default user. The returned state is the provider's answer, not an
    /// assumption.
    ///
    /// POST /api/org/{orgId}/paging-incidents/{id}/resolve
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
    public func resolve(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> PagerIncident {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/paging-incidents/{id}/resolve",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }
}
