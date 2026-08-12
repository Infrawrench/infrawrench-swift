/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostAnnotationsGetResult: Codable, Hashable, Sendable {
    public var annotations: [CostAnnotation]

    public init(
        annotations: [CostAnnotation]
    ) {
        self.annotations = annotations
    }
}

/// `client.costAnnotations`
public final class CostAnnotationsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Pin a change's or deploy's cost impact onto the cost charts
    ///
    /// Writes the finding as a cost annotation, so the step in the run rate is
    /// explained on the graph where it shows. Re-posting the same subject
    /// **rewords the existing note** rather than adding a second — which is what
    /// makes it safe to pin a finding again once the provider has finished
    /// restating. The note's date and report scope are never rewritten: they may
    /// have been edited deliberately.
    ///
    /// A subject with no measurable impact is a 400, not a note reading
    /// `$0.00/day`.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-annotations/change-impact
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func changeImpact(
        orgId: String? = nil,
        body: ChangeCostImpactAnnotationRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> ChangeCostImpactAnnotationResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-annotations/change-impact",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Create a cost annotation
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-annotations
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CostAnnotationInput,
        options: RequestOptions? = nil
    ) async throws -> CostAnnotation {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-annotations",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a cost annotation
    ///
    /// A hard delete. A withdrawn explanation should stop being drawn, and
    /// nothing references a note by id.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-annotations/{id}
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
                path: "/api/org/{orgId}/cost-annotations/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List cost annotations
    ///
    /// Dated notes drawn over cost charts. With `reportId`, the set a chart for
    /// that report draws: the org-wide notes plus that report's own. Without it,
    /// every annotation in the org. Annotations are an overlay — they never
    /// appear in a series, a total, or an axis.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-annotations
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter reportId: Scope to the notes a chart for this report should
    /// draw.
    public func get(
        orgId: String? = nil,
        reportId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostAnnotationsGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-annotations",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("reportId", reportId)]
            ),
            options: options
        )
    }

    /// Update a cost annotation
    ///
    /// Replaces the note's dates, text and scope. Moving a note between org-wide
    /// and one report is this same PUT with a different `costReportId`.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/cost-annotations/{id}
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
        body: CostAnnotationInput,
        options: RequestOptions? = nil
    ) async throws -> CostAnnotation {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-annotations/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
