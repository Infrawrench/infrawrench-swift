/*
 * InfrawrenchSDK v1.33.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.33.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.wallboard`
public final class WallboardNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Everything that is wrong right now, for a screen on a wall
    ///
    /// A different reading of data the product already holds, built on one rule:
    /// a wallboard may only show things that are true **right now** and that
    /// somebody would cross a room to look at. There is deliberately no history,
    /// no trend and no breakdown — those belong on the page you open when you do
    /// walk over.
    ///
    /// Three sources — declared incidents, synthetic probes and account sync
    /// health — each guarded independently, because a television that goes blank
    /// because one query threw is showing nothing to a room that was relying on
    /// it.
    ///
    /// Session-authenticated on purpose: unlike the calendar feed or a public
    /// status page, this carries incident titles, probe names and account names,
    /// and a screen in an office is exactly what a visitor photographs. The
    /// machine driving the wall signs in once.
    ///
    /// GET /api/org/{orgId}/wallboard
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> WallboardResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/wallboard",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
