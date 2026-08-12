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

/// `client.credentialHygiene`
public final class CredentialHygieneNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Credential hygiene report
    ///
    /// API keys nobody uses, SSH keys nothing references, and members holding
    /// write permissions they have never exercised — derived entirely from data
    /// the server already holds. No provider call and nothing to enable.
    ///
    /// **The audit log only witnesses writes.** Reading a resource list or a cost
    /// graph leaves no audit row by design, so this report draws no conclusion
    /// about read permissions: an absence of evidence about them proves nothing.
    /// `permissionFindingsWithheld` is set when the organization does not yet
    /// have enough audit history for the unused-permission finding to be
    /// meaningful. Both are load-bearing — a governance report that overclaims is
    /// worse than none.
    ///
    /// Gated on `audit:read` rather than a permission of its own: every fact here
    /// is already reachable by anyone who can read the audit log, so this is a
    /// lens rather than a new disclosure.
    ///
    /// _Requires permission: `audit:read`._
    ///
    /// GET /api/org/{orgId}/credential-hygiene
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter windowDays: Activity window. Defaults to 90.
    public func get(
        orgId: String? = nil,
        windowDays: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> HygieneReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/credential-hygiene",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("windowDays", windowDays)]
            ),
            options: options
        )
    }
}
