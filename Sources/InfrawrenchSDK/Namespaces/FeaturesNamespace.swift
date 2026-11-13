/*
 * InfrawrenchSDK v1.106.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.106.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.features`
public final class FeaturesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List the organization's rolled-out features
    ///
    /// Features still being rolled out are turned on per organization by a
    /// platform admin. A feature not listed here is refused by its own routes.
    ///
    /// GET /api/org/{orgId}/features
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> OrgFeatureList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/features",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
