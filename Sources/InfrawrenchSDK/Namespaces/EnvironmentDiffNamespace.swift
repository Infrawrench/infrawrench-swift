/*
 * InfrawrenchSDK v1.17.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.17.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.environmentDiff`
public final class EnvironmentDiffNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Compare two accounts' resource inventories
    ///
    /// Compares two accounts of the same provider — typically staging against
    /// production — over already-synced state: which resource types exist in one
    /// and not the other, the per-type count deltas, and the fields on which two
    /// corresponding resources disagree (instance class, engine version, feature
    /// flags).
    ///
    /// Resources are paired by resource type plus name with environment words
    /// removed, so `api-staging` lines up with `api-prod` without any naming
    /// convention to configure. By default the comparison hides divergences that
    /// are artefacts of being two different resources — ids, links, network
    /// addresses and timestamps — because every resource has different ones; pass
    /// `includeIdentityFields=true` to see them.
    ///
    /// Read-only and cheap: no provider API calls are made, so results reflect
    /// the last sync.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/environment-diff
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter a: Baseline account id — by convention the environment that
    /// works.
    ///
    /// - Parameter b: Compared account id. Must differ from `a` and use the same
    /// provider.
    ///
    /// - Parameter resourceTypeId: Compare one resource type only.
    ///
    /// - Parameter includeIdentityFields: Compare identity and timestamp fields
    /// too, instead of filtering them out. One of `true`, `false`.
    public func get(
        orgId: String? = nil,
        a: String,
        b: String,
        resourceTypeId: String? = nil,
        includeIdentityFields: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> EnvironmentDiffResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/environment-diff",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("a", a), QueryParameter("b", b), QueryParameter("resourceTypeId", resourceTypeId), QueryParameter("includeIdentityFields", includeIdentityFields)]
            ),
            options: options
        )
    }
}
