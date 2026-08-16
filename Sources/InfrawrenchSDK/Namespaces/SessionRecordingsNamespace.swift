/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.sessionRecordings`
public final class SessionRecordingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.sessionRecordings.settings`
    public let settings: SessionRecordingsSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.settings = SessionRecordingsSettingsNamespace(transport: transport)
    }

    /// Download a recording as an asciicast
    ///
    /// The session as an [asciicast
    /// v2](https://docs.asciinema.org/manual/asciicast/v2/) document: a JSON
    /// header line followed by one `[time, code, data]` event per line.
    /// Deliberately somebody else's format — the same bytes play in `asciinema
    /// play` and in the reference web player, so a recording is useful to an
    /// auditor who has never seen this product. `?download=1` returns it as an
    /// attachment. **Every fetch is audit-logged**, including this one: an
    /// investigator has to be able to answer who has watched a given tape.
    ///
    /// _Requires permission: `session-recordings:read`._
    ///
    /// GET /api/org/{orgId}/session-recordings/{recordingId}/cast
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter download: Force an attachment disposition. One of `1`.
    public func cast(
        orgId: String? = nil,
        recordingId: String,
        download: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/session-recordings/{recordingId}/cast",
                pathParameters: ["orgId": orgId?.parameterValue, "recordingId": recordingId.parameterValue],
                query: [QueryParameter("download", download)]
            ),
            options: options
        )
    }

    /// Delete a recording
    ///
    /// Removes the recording and its stored chunks. Audit-logged.
    ///
    /// _Requires permission: `session-recordings:write`._
    ///
    /// DELETE /api/org/{orgId}/session-recordings/{recordingId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        recordingId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/session-recordings/{recordingId}",
                pathParameters: ["orgId": orgId?.parameterValue, "recordingId": recordingId.parameterValue]
            ),
            options: options
        )
    }

    /// Get one recording's metadata
    ///
    /// _Requires permission: `session-recordings:read`._
    ///
    /// GET /api/org/{orgId}/session-recordings/{recordingId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        recordingId: String,
        options: RequestOptions? = nil
    ) async throws -> SessionRecording {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/session-recordings/{recordingId}",
                pathParameters: ["orgId": orgId?.parameterValue, "recordingId": recordingId.parameterValue]
            ),
            options: options
        )
    }

    /// List recorded SSH sessions
    ///
    /// Recorded sessions, newest first. Only SSH opened through the cloud is
    /// recorded — those sessions are already proxied by the server, so recording
    /// tees a stream it holds rather than requiring an agent on the host. A
    /// desktop session that dials a host directly never reaches the server and
    /// cannot appear here.
    ///
    /// _Requires permission: `session-recordings:read`._
    ///
    /// GET /api/org/{orgId}/session-recordings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter status: `recording` (live), `complete` (closed cleanly),
    /// `truncated` (hit the per-session capture ceiling — the tape is a genuine
    /// partial and says so), or `abandoned` (the server handling the session went
    /// away before it could close the row). One of `recording`, `complete`,
    /// `truncated`, `abandoned`.
    ///
    /// - Parameter since: Inclusive lower bound on `startedAt`.
    ///
    /// - Parameter until: Exclusive upper bound on `startedAt`.
    public func list(
        orgId: String? = nil,
        status: String? = nil,
        userId: String? = nil,
        resourceId: String? = nil,
        accountId: String? = nil,
        since: String? = nil,
        until: String? = nil,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> [SessionRecording] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/session-recordings",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("status", status), QueryParameter("userId", userId), QueryParameter("resourceId", resourceId), QueryParameter("accountId", accountId), QueryParameter("since", since), QueryParameter("until", until), QueryParameter("limit", limit)]
            ),
            options: options
        )
    }
}

/// `client.sessionRecordings.settings`
public final class SessionRecordingsSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the recording policy
    ///
    /// The organization's recording policy plus what it currently stores. Usage
    /// rides along with the policy because the only question anyone asks about
    /// retention is what it costs.
    ///
    /// _Requires permission: `session-recordings:read`._
    ///
    /// GET /api/org/{orgId}/session-recordings/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SessionRecordingSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/session-recordings/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update the recording policy
    ///
    /// Partial update — omitted fields keep their current value. Recording is
    /// opt-in and off by default. Audit-logged with the before/after policy.
    ///
    /// _Requires permission: `session-recordings:write`._
    ///
    /// PUT /api/org/{orgId}/session-recordings/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: SessionRecordingSettingsUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> SessionRecordingSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/session-recordings/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
