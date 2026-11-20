/*
 * InfrawrenchSDK v1.122.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.122.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.ping`
public final class PingNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.ping.fail`
    public let fail: PingFailNamespace
    /// `client.ping.start`
    public let start: PingStartNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.fail = PingFailNamespace(transport: transport)
        self.start = PingStartNamespace(transport: transport)
    }

    /// Ping a heartbeat
    ///
    /// **Unauthenticated**: the token in the path is the credential. The job ran:
    /// the heartbeat is up and its next deadline is set from the schedule.
    /// Answers `OK` in plain text; an unknown token answers 404, and more than 20
    /// pings a minute for one heartbeat answer 429 without being recorded. A POST
    /// body's first 1000 characters are kept with the ping.
    ///
    /// POST /api/ping/{token}
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 429: Error
    public func create(
        token: String,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "POST",
                path: "/api/ping/{token}",
                pathParameters: ["token": token.parameterValue]
            ),
            options: options
        )
    }

    /// Ping a heartbeat (GET)
    ///
    /// **Unauthenticated**: the token in the path is the credential. The job ran:
    /// the heartbeat is up and its next deadline is set from the schedule.
    /// Answers `OK` in plain text; an unknown token answers 404, and more than 20
    /// pings a minute for one heartbeat answer 429 without being recorded. A POST
    /// body's first 1000 characters are kept with the ping.
    ///
    /// GET /api/ping/{token}
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 429: Error
    public func get(
        token: String,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "GET",
                path: "/api/ping/{token}",
                pathParameters: ["token": token.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.ping.fail`
public final class PingFailNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Signal a run failed
    ///
    /// **Unauthenticated**: the token in the path is the credential. The
    /// heartbeat goes down at once and alerts. Answers `OK` in plain text; an
    /// unknown token answers 404, and more than 20 pings a minute for one
    /// heartbeat answer 429 without being recorded. A POST body's first 1000
    /// characters are kept with the ping.
    ///
    /// POST /api/ping/{token}/fail
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 429: Error
    public func create(
        token: String,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "POST",
                path: "/api/ping/{token}/fail",
                pathParameters: ["token": token.parameterValue]
            ),
            options: options
        )
    }

    /// Signal a run failed (GET)
    ///
    /// **Unauthenticated**: the token in the path is the credential. The
    /// heartbeat goes down at once and alerts. Answers `OK` in plain text; an
    /// unknown token answers 404, and more than 20 pings a minute for one
    /// heartbeat answer 429 without being recorded. A POST body's first 1000
    /// characters are kept with the ping.
    ///
    /// GET /api/ping/{token}/fail
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 429: Error
    public func get(
        token: String,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "GET",
                path: "/api/ping/{token}/fail",
                pathParameters: ["token": token.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.ping.start`
public final class PingStartNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Signal a run started
    ///
    /// **Unauthenticated**: the token in the path is the credential. Records the
    /// start so the closing ping can report the run's duration. Answers `OK` in
    /// plain text; an unknown token answers 404, and more than 20 pings a minute
    /// for one heartbeat answer 429 without being recorded. A POST body's first
    /// 1000 characters are kept with the ping.
    ///
    /// POST /api/ping/{token}/start
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 429: Error
    public func create(
        token: String,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "POST",
                path: "/api/ping/{token}/start",
                pathParameters: ["token": token.parameterValue]
            ),
            options: options
        )
    }

    /// Signal a run started (GET)
    ///
    /// **Unauthenticated**: the token in the path is the credential. Records the
    /// start so the closing ping can report the run's duration. Answers `OK` in
    /// plain text; an unknown token answers 404, and more than 20 pings a minute
    /// for one heartbeat answer 429 without being recorded. A POST body's first
    /// 1000 characters are kept with the ping.
    ///
    /// GET /api/ping/{token}/start
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 429: Error
    public func get(
        token: String,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "GET",
                path: "/api/ping/{token}/start",
                pathParameters: ["token": token.parameterValue]
            ),
            options: options
        )
    }
}
