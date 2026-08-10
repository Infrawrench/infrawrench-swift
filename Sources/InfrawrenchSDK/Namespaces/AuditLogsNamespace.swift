/*
 * InfrawrenchSDK v1.4.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.4.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.auditLogs`
public final class AuditLogsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List audit log entries (paginated, filterable)
    ///
    /// _Requires permission: `audit:read`._
    ///
    /// GET /api/org/{orgId}/audit-logs
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        page: Int? = nil,
        pageSize: Int? = nil,
        action: String? = nil,
        entityType: String? = nil,
        userId: String? = nil,
        from: String? = nil,
        to: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> AuditResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/audit-logs",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("page", page), QueryParameter("pageSize", pageSize), QueryParameter("action", action), QueryParameter("entityType", entityType), QueryParameter("userId", userId), QueryParameter("from", from), QueryParameter("to", to)]
            ),
            options: options
        )
    }
}
