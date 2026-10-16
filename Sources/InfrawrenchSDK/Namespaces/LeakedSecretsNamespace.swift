/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.leakedSecrets`
public final class LeakedSecretsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Dismiss a leaked credential
    ///
    /// Accept the finding as not a risk. Closes it upstream with the matching
    /// reason unless `resolveUpstream` is false.
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// POST /api/org/{orgId}/leaked-secrets/{id}/dismiss
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func dismiss(
        orgId: String? = nil,
        id: String,
        body: LeakedSecretDismiss? = nil,
        options: RequestOptions? = nil
    ) async throws -> LeakedSecretResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/leaked-secrets/{id}/dismiss",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// List leaked credentials
    ///
    /// Secrets a scanner account (GitHub secret scanning, GitLab secret
    /// detection) found committed to code, attributed to the account or stored
    /// secret they belong to. Read from the last scan; no provider call is made.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/leaked-secrets
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter status: `open` needs rotating; `rotated` was rotated through
    /// Infrawrench or detected because the stored value changed; `dismissed` was
    /// accepted as not a risk; `resolved` was closed on the scanner by someone
    /// else before it was rotated here. One of `open`, `rotated`, `dismissed`,
    /// `resolved`.
    ///
    /// - Parameter accountId: Only leaks matched to, or possibly belonging to,
    /// this account.
    public func get(
        orgId: String? = nil,
        status: String? = nil,
        accountId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> LeakedSecretList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/leaked-secrets",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("status", status), QueryParameter("accountId", accountId)]
            ),
            options: options
        )
    }

    /// Record a rotation done at the provider
    ///
    /// For an account credential, the account must have been updated first: the
    /// request is refused with 409 while the stored credential still equals the
    /// leaked one.
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// POST /api/org/{orgId}/leaked-secrets/{id}/mark-rotated
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func markRotated(
        orgId: String? = nil,
        id: String,
        body: LeakedSecretMarkRotated? = nil,
        options: RequestOptions? = nil
    ) async throws -> LeakedSecretResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/leaked-secrets/{id}/mark-rotated",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Reopen a leaked credential
    ///
    /// Undo a dismissal or a rotation recorded by mistake. Does not reopen the
    /// finding on the scanner.
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// POST /api/org/{orgId}/leaked-secrets/{id}/reopen
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func reopen(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> LeakedSecretResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/leaked-secrets/{id}/reopen",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Rotate a leaked credential
    ///
    /// For `reissue` leaks the provider mints a new value and every output
    /// reference consuming it is updated at once; for `replace` leaks send the
    /// new `value`, which the provider receives first when it can. Refused with
    /// 409 when the stored value still equals the leaked one afterwards. Records
    /// the rotation, raises `secret.rotated` and closes the finding upstream as
    /// revoked unless `resolveUpstream` is false.
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// POST /api/org/{orgId}/leaked-secrets/{id}/rotate
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func rotate(
        orgId: String? = nil,
        id: String,
        body: LeakedSecretRotate? = nil,
        options: RequestOptions? = nil
    ) async throws -> LeakedSecretResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/leaked-secrets/{id}/rotate",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Scan every scanner account now
    ///
    /// Reads every scanner account's findings now instead of waiting for the next
    /// 30-minute scan.
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// POST /api/org/{orgId}/leaked-secrets/scan
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func scan(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> LeakedSecretScanResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/leaked-secrets/scan",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
