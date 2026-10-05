/*
 * InfrawrenchSDK v1.69.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.69.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.budgets`
public final class BudgetsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.budgets.events`
    public let events: BudgetsEventsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.events = BudgetsEventsNamespace(transport: transport)
    }

    /// Create a budget
    ///
    /// POST /api/org/{orgId}/budgets
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: BudgetInput,
        options: RequestOptions? = nil
    ) async throws -> BudgetFull {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/budgets",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a budget
    ///
    /// DELETE /api/org/{orgId}/budgets/{id}
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
                path: "/api/org/{orgId}/budgets/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a budget with current-period status
    ///
    /// GET /api/org/{orgId}/budgets/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> BudgetWithStatus {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/budgets/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List budgets with current-period actuals and forecasts
    ///
    /// GET /api/org/{orgId}/budgets
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [BudgetWithStatus] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/budgets",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update a budget
    ///
    /// PUT /api/org/{orgId}/budgets/{id}
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
        body: BudgetInput,
        options: RequestOptions? = nil
    ) async throws -> BudgetFull {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/budgets/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.budgets.events`
public final class BudgetsEventsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Alert event history for a budget
    ///
    /// GET /api/org/{orgId}/budgets/{id}/events
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> [BudgetAlertEvent] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/budgets/{id}/events",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Explain a fired budget alert
    ///
    /// Saves a note on one firing (who and when are recorded), draws it on every
    /// cost chart as an org-wide annotation at the day the alert fired, and posts
    /// it after the alert: a reply in each Slack message's thread and a follow-up
    /// to the Teams webhooks it reached. Sending again rewrites the note and
    /// rewords the same chart marker rather than adding another; a marker
    /// somebody deleted is not recreated. Alerts that fired before notes existed,
    /// or that quiet hours held, have no recorded chat messages to follow. Needs
    /// `budgets:read` and `costs:write`.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/budgets/{id}/events/{eventId}/note
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func note(
        orgId: String? = nil,
        id: String,
        eventId: String,
        body: BudgetAlertNoteInput,
        options: RequestOptions? = nil
    ) async throws -> BudgetAlertNoteResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/budgets/{id}/events/{eventId}/note",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue, "eventId": eventId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
