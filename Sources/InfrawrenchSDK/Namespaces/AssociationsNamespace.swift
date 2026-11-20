/*
 * InfrawrenchSDK v1.123.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.123.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.associations`
public final class AssociationsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List the resources whose outputs can fill a secret field
    ///
    /// A candidate is a stored resource whose type hands one of its outputs to
    /// the field's plugin under the field's key (a peer integration's credential
    /// mapping) and whose fields pass that integration's visibility gates. Send
    /// one to `POST /associations` to point the field at it.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/associations/candidates
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter resourceId: The resource holding the field.
    ///
    /// - Parameter fieldKey: The secret field to fill, e.g. `connectionString`.
    public func candidates(
        orgId: String? = nil,
        resourceId: ResourceId,
        fieldKey: String,
        options: RequestOptions? = nil
    ) async throws -> [AssociationCandidate] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/associations/candidates",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("resourceId", resourceId), QueryParameter("fieldKey", fieldKey)]
            ),
            options: options
        )
    }

    /// Wire one resource's output into another resource's secret field
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// POST /api/org/{orgId}/associations
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: AssociationRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/associations",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Set a secret field to a literal plaintext value
    ///
    /// When the resource's plugin applies a new value upstream (resetting a
    /// database password, say), it does so first; a refusal there answers 502 and
    /// stores nothing.
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// POST /api/org/{orgId}/associations/literal
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 502: Bad gateway: an upstream service failed
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func literal(
        orgId: String? = nil,
        body: LiteralAssociationRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/associations/literal",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
