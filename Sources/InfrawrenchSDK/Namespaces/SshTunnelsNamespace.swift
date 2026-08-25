/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SshTunnelsCloseBody: Codable, Hashable, Sendable {
    public var tunnelId: String

    public init(
        tunnelId: String
    ) {
        self.tunnelId = tunnelId
    }
}

public struct SshTunnelsOpenBody: Codable, Hashable, Sendable {
    public var accountId: String

    public init(
        accountId: String
    ) {
        self.accountId = accountId
    }
}

public struct SshTunnelsOpenResult: Codable, Hashable, Sendable {
    public var tunnelId: String
    public var localPort: Int

    public init(
        tunnelId: String,
        localPort: Int
    ) {
        self.tunnelId = tunnelId
        self.localPort = localPort
    }
}

/// `client.sshTunnels`
public final class SshTunnelsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List active tunnels for this org
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// GET /api/org/{orgId}/ssh-tunnels/active
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func active(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [String: ActiveTunnel] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ssh-tunnels/active",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Close a tunnel by id
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/ssh-tunnels/close
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func close(
        orgId: String? = nil,
        body: SshTunnelsCloseBody,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ssh-tunnels/close",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Create an account whose traffic is tunneled over SSH
    ///
    /// Verifies the SSH connection works before persisting.
    ///
    /// _Requires permission: `accounts:write`._
    ///
    /// POST /api/org/{orgId}/ssh-tunnels/create-account
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func createAccount(
        orgId: String? = nil,
        body: SshTunnelCreateAccountRequest,
        options: RequestOptions? = nil
    ) async throws -> SshTunnelCreateAccountResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ssh-tunnels/create-account",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Run a command over SSH using an org SSH key
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/ssh-tunnels/exec
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func exec(
        orgId: String? = nil,
        body: SshExecRequest,
        options: RequestOptions? = nil
    ) async throws -> SshExecResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ssh-tunnels/exec",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Re-open the tunnel for an existing account
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/ssh-tunnels/open
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func open(
        orgId: String? = nil,
        body: SshTunnelsOpenBody,
        options: RequestOptions? = nil
    ) async throws -> SshTunnelsOpenResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ssh-tunnels/open",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
