/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SshFanoutSnippetsCreateResult: Codable, Hashable, Sendable {
    public var id: String

    public init(
        id: String
    ) {
        self.id = id
    }
}

public struct SshFanoutSnippetsGetResult: Codable, Hashable, Sendable {
    public var snippets: [SshSnippet]

    public init(
        snippets: [SshSnippet]
    ) {
        self.snippets = snippets
    }
}

/// `client.sshFanout`
public final class SshFanoutNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.sshFanout.snippets`
    public let snippets: SshFanoutSnippetsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.snippets = SshFanoutSnippetsNamespace(transport: transport)
    }

    /// Run one command across many SSH hosts
    ///
    /// Executes the command on every selected target under a concurrency cap
    /// (default 8, max 16). Per-host results carry stdout, stderr, and exit code;
    /// transport failures (unreachable, untrusted host key, blocked internal
    /// host) are per-host too. Resource targets need `sshKeyId` (an org SSH key
    /// owned by the caller). Blocked with HTTP 423 while a change freeze is in
    /// effect; audit-logged.
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/ssh-fanout/run
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 423: Blocked by an active change freeze. Retry with the
    /// `x-change-freeze-override: true` header if you hold `freezes:override`;
    /// both blocks and overrides are audit-logged.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func run(
        orgId: String? = nil,
        body: SshFanoutRunRequest,
        options: RequestOptions? = nil
    ) async throws -> SshFanoutRunResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ssh-fanout/run",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// List SSH-capable fan-out targets
    ///
    /// Every SSH-capable target in the org: `ssh` plugin accounts (native
    /// credentials) plus resources whose type declares an sshEndpoint with a
    /// resolvable host (EC2 instances, droplets, Hetzner servers, …).
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/ssh-fanout/targets
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func targets(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SshFanoutTargetsResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ssh-fanout/targets",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.sshFanout.snippets`
public final class SshFanoutSnippetsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Save a command snippet
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/ssh-fanout/snippets
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: SshSnippetInput,
        options: RequestOptions? = nil
    ) async throws -> SshFanoutSnippetsCreateResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ssh-fanout/snippets",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a saved command snippet
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// DELETE /api/org/{orgId}/ssh-fanout/snippets/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/ssh-fanout/snippets/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List saved command snippets
    ///
    /// Org-shared saved commands for reuse from the fan-out screen and CLI.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/ssh-fanout/snippets
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SshFanoutSnippetsGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ssh-fanout/snippets",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update a saved command snippet
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// PUT /api/org/{orgId}/ssh-fanout/snippets/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: SshSnippetInput,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/ssh-fanout/snippets/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
