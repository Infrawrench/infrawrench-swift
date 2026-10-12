/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ComplianceFrameworksResult: Codable, Hashable, Sendable {
    public var frameworks: [ComplianceFrameworkSummary]

    public init(
        frameworks: [ComplianceFrameworkSummary]
    ) {
        self.frameworks = frameworks
    }
}

public struct ComplianceControlsGetResult: Codable, Hashable, Sendable {
    public var settings: [ComplianceControlSetting]

    public init(
        settings: [ComplianceControlSetting]
    ) {
        self.settings = settings
    }
}

/// `client.compliance`
public final class ComplianceNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.compliance.controls`
    public let controls: ComplianceControlsNamespace
    /// `client.compliance.schedules`
    public let schedules: ComplianceSchedulesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.controls = ComplianceControlsNamespace(transport: transport)
        self.schedules = ComplianceSchedulesNamespace(transport: transport)
    }

    /// List compliance frameworks
    ///
    /// The framework registry: SOC 2 Trust Services Criteria and ISO/IEC
    /// 27001:2022 Annex A, each listing only the controls Infrawrench holds
    /// evidence for.
    ///
    /// _Requires permission: `audit:read`._
    ///
    /// GET /api/org/{orgId}/compliance/frameworks
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func frameworks(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ComplianceFrameworksResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/compliance/frameworks",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Compliance status for a framework and period
    ///
    /// Runs every evidence source the framework maps (access review, just-in-time
    /// access, the audit log, posture, vulnerabilities, backup coverage, restore
    /// drills, the change timeline, change freezes, session recordings,
    /// incidents, service scorecards, leaked credentials) and returns a status
    /// per control. Makes no provider API calls. A source whose own permission
    /// the caller lacks comes back `unavailable` naming it, rather than failing
    /// the request.
    ///
    /// _Requires permission: `audit:read`._
    ///
    /// GET /api/org/{orgId}/compliance
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter framework: Framework registry id: `soc2` or `iso27001`.
    ///
    /// - Parameter from: First day of the period (UTC). Defaults to 90 days
    /// before `to`.
    ///
    /// - Parameter to: Last day of the period, inclusive (UTC). Defaults to
    /// today.
    public func get(
        orgId: String? = nil,
        framework: String,
        from: String? = nil,
        to: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ComplianceStatus {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/compliance",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("framework", framework), QueryParameter("from", from), QueryParameter("to", to)]
            ),
            options: options
        )
    }

    /// Download an evidence pack
    ///
    /// A ZIP holding `summary.pdf`, `controls.csv`/`controls.json`, one CSV and
    /// JSON per control under `controls/`, one CSV and JSON per evidence source
    /// under `evidence/`, `manifest.json` (every other file with its SHA-256) and
    /// `SHA256SUMS` (the manifest's own digest, in `sha256sum -c` format).
    /// Audited as `compliance.pack_exported`.
    ///
    /// _Requires permission: `audit:read`._
    ///
    /// GET /api/org/{orgId}/compliance/pack
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter framework: Framework registry id: `soc2` or `iso27001`.
    ///
    /// - Parameter from: First day of the period (UTC). Defaults to 90 days
    /// before `to`.
    ///
    /// - Parameter to: Last day of the period, inclusive (UTC). Defaults to
    /// today.
    public func pack(
        orgId: String? = nil,
        framework: String,
        from: String? = nil,
        to: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/compliance/pack",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("framework", framework), QueryParameter("from", from), QueryParameter("to", to)]
            ),
            options: options
        )
    }
}

/// `client.compliance.controls`
public final class ComplianceControlsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Reset a control to applicable and unowned
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// DELETE /api/org/{orgId}/compliance/controls/{frameworkId}/{controlId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter frameworkId: Framework registry id: `soc2` or `iso27001`.
    public func delete(
        orgId: String? = nil,
        frameworkId: String,
        controlId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/compliance/controls/{frameworkId}/{controlId}",
                pathParameters: ["orgId": orgId?.parameterValue, "frameworkId": frameworkId.parameterValue, "controlId": controlId.parameterValue]
            ),
            options: options
        )
    }

    /// List stored control decisions
    ///
    /// Only controls somebody decided about; a missing control is applicable and
    /// unowned.
    ///
    /// _Requires permission: `audit:read`._
    ///
    /// GET /api/org/{orgId}/compliance/controls
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter framework: Framework registry id: `soc2` or `iso27001`.
    public func get(
        orgId: String? = nil,
        framework: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ComplianceControlsGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/compliance/controls",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("framework", framework)]
            ),
            options: options
        )
    }

    /// Get one control decision
    ///
    /// _Requires permission: `audit:read`._
    ///
    /// GET /api/org/{orgId}/compliance/controls/{frameworkId}/{controlId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter frameworkId: Framework registry id: `soc2` or `iso27001`.
    public func getOrgOrgIdComplianceControlsFrameworkIdControlId(
        orgId: String? = nil,
        frameworkId: String,
        controlId: String,
        options: RequestOptions? = nil
    ) async throws -> ComplianceControlSetting {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/compliance/controls/{frameworkId}/{controlId}",
                pathParameters: ["orgId": orgId?.parameterValue, "frameworkId": frameworkId.parameterValue, "controlId": controlId.parameterValue]
            ),
            options: options
        )
    }

    /// Set a control's applicability, owner and notes
    ///
    /// A full replace. Marking a control not applicable requires a justification.
    /// An owner is either a member (`ownerUserId`) or a free-text label, not
    /// both. Audited.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/compliance/controls/{frameworkId}/{controlId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter frameworkId: Framework registry id: `soc2` or `iso27001`.
    public func update(
        orgId: String? = nil,
        frameworkId: String,
        controlId: String,
        body: ComplianceControlSettingInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> ComplianceControlSetting {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/compliance/controls/{frameworkId}/{controlId}",
                pathParameters: ["orgId": orgId?.parameterValue, "frameworkId": frameworkId.parameterValue, "controlId": controlId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.compliance.schedules`
public final class ComplianceSchedulesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Schedule an evidence pack
    ///
    /// Delivers the previous calendar month or quarter's pack: email attaches the
    /// ZIP, Slack uploads it in the message thread, Teams gets the summary and a
    /// link. Packs render with full access. Audited.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/compliance/schedules
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CompliancePackScheduleInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> CompliancePackSchedule {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/compliance/schedules",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete an evidence-pack schedule
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// DELETE /api/org/{orgId}/compliance/schedules/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/compliance/schedules/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get an evidence-pack schedule
    ///
    /// _Requires permission: `audit:read`._
    ///
    /// GET /api/org/{orgId}/compliance/schedules/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CompliancePackSchedule {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/compliance/schedules/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List evidence-pack schedules
    ///
    /// _Requires permission: `audit:read`._
    ///
    /// GET /api/org/{orgId}/compliance/schedules
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter framework: Framework registry id: `soc2` or `iso27001`.
    public func list(
        orgId: String? = nil,
        framework: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [CompliancePackSchedule] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/compliance/schedules",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("framework", framework)]
            ),
            options: options
        )
    }

    /// Send an evidence-pack schedule now
    ///
    /// Builds the pack the next delivery would cover and sends it immediately.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/compliance/schedules/{id}/send
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func send(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CompliancePackSendResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/compliance/schedules/{id}/send",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Destinations a pack schedule can use
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/compliance/schedules/targets
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func targets(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CompliancePackDeliveryTargets {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/compliance/schedules/targets",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Replace an evidence-pack schedule
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/compliance/schedules/{id}
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
        body: CompliancePackScheduleInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> CompliancePackSchedule {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/compliance/schedules/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
