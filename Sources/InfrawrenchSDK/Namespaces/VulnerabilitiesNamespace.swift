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

/// `client.vulnerabilities`
public final class VulnerabilitiesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.vulnerabilities.dismissals`
    public let dismissals: VulnerabilitiesDismissalsNamespace
    /// `client.vulnerabilities.settings`
    public let settings: VulnerabilitiesSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.dismissals = VulnerabilitiesDismissalsNamespace(transport: transport)
        self.settings = VulnerabilitiesSettingsNamespace(transport: transport)
    }

    /// List vulnerability findings joined to running resources
    ///
    /// Open findings from each connected provider's own scanner (Amazon
    /// Inspector, Artifact Analysis, Defender for Cloud, Dependabot, GitLab,
    /// JFrog Xray), joined to the synced resources that run the affected image or
    /// are the affected resource, and marked when the advisory is in the CISA
    /// Known Exploited Vulnerabilities catalog. Read from what the poller last
    /// collected; no provider calls are made. Dismissed findings are reported
    /// under `dismissed` and excluded from `findings`, the counts and the alerts.
    /// Each finding names the services its running resources belong to.
    /// `serviceId` and `resourceId` narrow the findings (and `dismissed`) to
    /// those running there and recompute the counts; `sources` always describes
    /// every scanner.
    ///
    /// GET /api/org/{orgId}/vulnerabilities
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter serviceId: Only findings running on a resource of this
    /// service.
    ///
    /// - Parameter resourceId: Only findings running on any of these Infrawrench
    /// resource ids. Repeat the parameter for several (at most 100).
    public func get(
        orgId: String? = nil,
        serviceId: String? = nil,
        resourceId: [String]? = nil,
        options: RequestOptions? = nil
    ) async throws -> VulnerabilityListResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/vulnerabilities",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("serviceId", serviceId), QueryParameter("resourceId", resourceId)]
            ),
            options: options
        )
    }
}

/// `client.vulnerabilities.dismissals`
public final class VulnerabilitiesDismissalsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Dismiss a vulnerability
    ///
    /// Accept an advisory as a known risk for one artifact (keyed on the image
    /// repository, so it survives rebuilds) or, with `artifactKey: "*"`,
    /// everywhere. Idempotent.
    ///
    /// POST /api/org/{orgId}/vulnerabilities/dismissals
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: VulnerabilityDismissalCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> VulnerabilityDismissal {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/vulnerabilities/dismissals",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Restore a dismissed vulnerability
    ///
    /// The key is in the query string because artifact keys contain slashes.
    ///
    /// DELETE /api/org/{orgId}/vulnerabilities/dismissals
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        advisoryId: String,
        artifactKey: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/vulnerabilities/dismissals",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("advisoryId", advisoryId), QueryParameter("artifactKey", artifactKey)]
            ),
            options: options
        )
    }
}

/// `client.vulnerabilities.settings`
public final class VulnerabilitiesSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the vulnerability alert settings
    ///
    /// Defaults when never saved: alerts on, critical only, running only.
    ///
    /// GET /api/org/{orgId}/vulnerabilities/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> VulnerabilitySettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/vulnerabilities/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update the vulnerability alert settings
    ///
    /// Saving never resets the alert cooldown.
    ///
    /// PUT /api/org/{orgId}/vulnerabilities/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: VulnerabilitySettingsUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> VulnerabilitySettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/vulnerabilities/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
