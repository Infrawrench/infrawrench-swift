/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AlertEmailSuppressionsDeleteResult: Codable, Hashable, Sendable {
    public var ok: Bool

    public init(
        ok: Bool
    ) {
        self.ok = ok
    }
}

/// `client.alertEmail`
public final class AlertEmailNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.alertEmail.settings`
    public let settings: AlertEmailSettingsNamespace
    /// `client.alertEmail.suppressions`
    public let suppressions: AlertEmailSuppressionsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.settings = AlertEmailSettingsNamespace(transport: transport)
        self.suppressions = AlertEmailSuppressionsNamespace(transport: transport)
    }

    /// Recipient picker options for alert email
    ///
    /// Current members (with their login address), the external-address policy
    /// and whether email is available on this deployment: everything a client
    /// needs to edit the `emailRecipients` on a budget, cost change alert,
    /// anomaly settings or efficiency alert settings, or an email destination on
    /// an alert routing rule. Requires `costs:read`.
    ///
    /// GET /api/org/{orgId}/alert-email
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> AlertEmailOptions {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/alert-email",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.alertEmail.settings`
public final class AlertEmailSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the alert email policy and suppression list
    ///
    /// GET /api/org/{orgId}/alert-email/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> AlertEmailSettingsView {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/alert-email/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Set the alert email external-address policy
    ///
    /// Whole object. Tightening the policy does not edit any stored recipient
    /// list: an address that no longer passes is skipped at send time, and
    /// loosening the policy again brings it back.
    ///
    /// PUT /api/org/{orgId}/alert-email/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: AlertEmailSettings? = nil,
        options: RequestOptions? = nil
    ) async throws -> AlertEmailSettingsView {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/alert-email/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.alertEmail.suppressions`
public final class AlertEmailSuppressionsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Resume alert email to an unsubscribed address
    ///
    /// DELETE /api/org/{orgId}/alert-email/suppressions/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> AlertEmailSuppressionsDeleteResult {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/alert-email/suppressions/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }
}
