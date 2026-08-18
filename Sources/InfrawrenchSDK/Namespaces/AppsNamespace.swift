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

/// `client.apps`
public final class AppsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Check whether a host can run Linux applications
    ///
    /// Runs a read-only shell probe over SSH and reports what the host is
    /// missing, plus the packages and commands that would fix it. A POST because
    /// it opens a connection to the named host and must never be cached — its
    /// whole value is saying what the host is now.
    ///
    /// POST /api/org/{orgId}/apps/check
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: The host key is new or has changed; trust it and retry
    ///
    /// Raises on 502: The host could not be reached or probed
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func check(
        orgId: String? = nil,
        body: LinuxAppHostTarget,
        options: RequestOptions? = nil
    ) async throws -> LinuxAppHostCheck {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/apps/check",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Install what a host needs to run Linux applications
    ///
    /// Installs the named requirements using the host's own package manager, then
    /// re-probes and reports what the host now is. Takes requirement ids, never
    /// commands — the commands are derived server-side from a fresh probe. Needs
    /// root or passwordless sudo on the host, respects change freezes, and is
    /// audited as `linux_app.host_setup`.
    ///
    /// Responds with `application/x-ndjson`: one `{"line":"…"}` per line of
    /// package-manager output, then a final `{"outcome":{…}}`. A failure arrives
    /// as `{"error":"…"}` inside the stream, because the status line has already
    /// been sent by then.
    ///
    /// POST /api/org/{orgId}/apps/setup
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: A change freeze is in effect, or the host key needs
    /// trusting
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func setup(
        orgId: String? = nil,
        body: LinuxAppSetupRequest,
        options: RequestOptions? = nil
    ) async throws -> LinuxAppSetupEvent {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/apps/setup",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
