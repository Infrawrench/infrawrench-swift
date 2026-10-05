/*
 * InfrawrenchSDK v1.58.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.58.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostCanvasesConversationBody: Codable, Hashable, Sendable {
    public var model: String?
    public var fresh: Bool?

    public init(
        model: String? = nil,
        fresh: Bool? = nil
    ) {
        self.model = model
        self.fresh = fresh
    }
}

public struct CostCanvasesConversationResult: Codable, Hashable, Sendable {
    public var conversationId: String

    public init(
        conversationId: String
    ) {
        self.conversationId = conversationId
    }
}

public struct CostCanvasesPreviewBody: Codable, Hashable, Sendable {
    public var spec: CostCanvasSpec
    public var name: String?
    public var includeChartData: Bool?

    public init(
        spec: CostCanvasSpec,
        name: String? = nil,
        includeChartData: Bool? = nil
    ) {
        self.spec = spec
        self.name = name
        self.includeChartData = includeChartData
    }
}

public struct CostCanvasesRunBody: Codable, Hashable, Sendable {
    /// Include full chart series. Default true; the live UI passes false.
    public var includeChartData: Bool?

    public init(
        includeChartData: Bool? = nil
    ) {
        self.includeChartData = includeChartData
    }
}

/// `client.costCanvases`
public final class CostCanvasesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.costCanvases.notifications`
    public let notifications: CostCanvasesNotificationsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.notifications = CostCanvasesNotificationsNamespace(transport: transport)
    }

    /// Open the caller's editing conversation for a canvas
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-canvases/{id}/conversation
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func conversation(
        orgId: String? = nil,
        id: String,
        body: CostCanvasesConversationBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostCanvasesConversationResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-canvases/{id}/conversation",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Create a cost canvas from a spec
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-canvases
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CostCanvasInput,
        options: RequestOptions? = nil
    ) async throws -> CostCanvas {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-canvases",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a cost canvas
    ///
    /// Soft delete. Its dashboard cards and delivery schedules go with it.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-canvases/{id}
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
                path: "/api/org/{orgId}/cost-canvases/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Start a canvas from a description
    ///
    /// Creates an empty canvas and a chat conversation linked to it. Send
    /// `prompt` as the conversation's first message (`POST
    /// /chat/conversations/{id}/messages`); the agent writes the spec. Needs
    /// `chat:write` as well as `costs:write`.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-canvases/draft
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func draft(
        orgId: String? = nil,
        body: CostCanvasDraftInput,
        options: RequestOptions? = nil
    ) async throws -> CostCanvas {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-canvases/draft",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Get a cost canvas
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-canvases/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CostCanvas {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-canvases/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List cost canvases
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-canvases
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [CostCanvas] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-canvases",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Export a cost canvas as a PDF
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-canvases/{id}/pdf
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter tz: IANA zone the document's generated-at line is written in,
    /// e.g. `Europe/Berlin`. UTC when absent or unknown.
    public func pdf(
        orgId: String? = nil,
        id: String,
        tz: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-canvases/{id}/pdf",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                query: [QueryParameter("tz", tz)]
            ),
            options: options
        )
    }

    /// Run an unsaved canvas spec
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/cost-canvases/preview
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func preview(
        orgId: String? = nil,
        body: CostCanvasesPreviewBody,
        options: RequestOptions? = nil
    ) async throws -> CostCanvasRunResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-canvases/preview",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Run (refresh) a cost canvas
    ///
    /// Re-executes every block's query. Deterministic; no model call.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/cost-canvases/{id}/run
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func run(
        orgId: String? = nil,
        id: String,
        body: CostCanvasesRunBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostCanvasRunResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-canvases/{id}/run",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Replace a cost canvas
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/cost-canvases/{id}
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
        body: CostCanvasInput,
        options: RequestOptions? = nil
    ) async throws -> CostCanvas {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-canvases/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.costCanvases.notifications`
public final class CostCanvasesNotificationsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a canvas delivery schedule
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/cost-canvases/{id}/notifications
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        id: String,
        body: DashboardNotificationInput,
        options: RequestOptions? = nil
    ) async throws -> CostCanvasNotification {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-canvases/{id}/notifications",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a canvas delivery schedule
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-canvases/{id}/notifications/{notificationId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        notificationId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/cost-canvases/{id}/notifications/{notificationId}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue, "notificationId": notificationId.parameterValue]
            ),
            options: options
        )
    }

    /// List a canvas's delivery schedules
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-canvases/{id}/notifications
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> [CostCanvasNotification] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-canvases/{id}/notifications",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Send a canvas delivery now
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST
    /// /api/org/{orgId}/cost-canvases/{id}/notifications/{notificationId}/send
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
        notificationId: String,
        options: RequestOptions? = nil
    ) async throws -> DashboardNotificationSendResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-canvases/{id}/notifications/{notificationId}/send",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue, "notificationId": notificationId.parameterValue]
            ),
            options: options
        )
    }

    /// List the destinations a canvas schedule can deliver to
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/cost-canvases/{id}/notifications/targets
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func targets(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> ReportDeliveryTargets {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-canvases/{id}/notifications/targets",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Replace a canvas delivery schedule
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/cost-canvases/{id}/notifications/{notificationId}
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
        notificationId: String,
        body: DashboardNotificationInput,
        options: RequestOptions? = nil
    ) async throws -> CostCanvasNotification {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-canvases/{id}/notifications/{notificationId}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue, "notificationId": notificationId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
