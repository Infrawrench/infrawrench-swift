/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.workflowSecrets`
public final class WorkflowSecretsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create workflow secret metadata
    ///
    /// Creates metadata without a value. Write the value separately through the
    /// write-only value endpoint.
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// POST /api/org/{orgId}/workflow-secrets
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: WorkflowSecretCreate,
        options: RequestOptions? = nil
    ) async throws -> WorkflowSecret {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/workflow-secrets",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a workflow secret
    ///
    /// Also removes every workflow assignment through database cascades.
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// DELETE /api/org/{orgId}/workflow-secrets/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Workflow secret id.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/workflow-secrets/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List reusable workflow secrets
    ///
    /// Returns metadata and hasValue only; plaintext values are never returned.
    ///
    /// _Requires permission: `secrets:read`._
    ///
    /// GET /api/org/{orgId}/workflow-secrets
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [WorkflowSecret] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/workflow-secrets",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update workflow secret metadata
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// PATCH /api/org/{orgId}/workflow-secrets/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Workflow secret id.
    public func update(
        orgId: String? = nil,
        id: String,
        body: WorkflowSecretUpdate,
        options: RequestOptions? = nil
    ) async throws -> WorkflowSecret {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/workflow-secrets/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Write a workflow secret value
    ///
    /// Write-only. The response contains metadata and hasValue, never the
    /// supplied plaintext.
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// PUT /api/org/{orgId}/workflow-secrets/{id}/value
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Workflow secret id.
    public func value(
        orgId: String? = nil,
        id: String,
        body: WorkflowSecretValueWrite,
        options: RequestOptions? = nil
    ) async throws -> WorkflowSecret {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/workflow-secrets/{id}/value",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
