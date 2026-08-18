/*
 * InfrawrenchSDK v1.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.calendar`
public final class CalendarNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.calendar.subscriptions`
    public let subscriptions: CalendarSubscriptionsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.subscriptions = CalendarSubscriptionsNamespace(transport: transport)
    }

    /// List dated operational events in a window
    ///
    /// One time axis over six things the organization already stores: change
    /// freezes, sleep/wake schedules, declared deadlines (certificates, domains,
    /// keys and resource leases), commitment term ends, cron-triggered workflow
    /// runs, and declared incidents. Nothing here is a new record — the calendar
    /// is recomputed on every read, exactly as posture findings and backup
    /// coverage are.
    ///
    /// The window defaults to the last 7 and next 35 days and may span at most
    /// 400. Recurring sources are expanded to at most 400 occurrences each, so
    /// one nightly schedule cannot flood a year-long query.
    ///
    /// GET /api/org/{orgId}/calendar
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter from: Inclusive lower bound. Defaults to 7 days ago.
    ///
    /// - Parameter to: Exclusive upper bound. Defaults to 35 days ahead.
    ///
    /// - Parameter kinds: Comma-separated `CalendarEventKind`s. Unknown members
    /// are ignored rather than rejected; omitting the parameter returns every
    /// kind.
    public func get(
        orgId: String? = nil,
        from: String? = nil,
        to: String? = nil,
        kinds: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CalendarResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/calendar",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to), QueryParameter("kinds", kinds)]
            ),
            options: options
        )
    }
}

/// `client.calendar.subscriptions`
public final class CalendarSubscriptionsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Mint an iCalendar subscription URL
    ///
    /// Returns the only copy of the feed URL. The token in it is 32 random bytes,
    /// stored as a SHA-256 hash, and is the sole credential on a route that runs
    /// outside every auth layer — treat the URL as a secret. The URL deliberately
    /// contains no organization id.
    ///
    /// An organization may hold 25 live subscriptions; revoking makes room.
    ///
    /// POST /api/org/{orgId}/calendar/subscriptions
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CalendarSubscriptionCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> CalendarSubscription {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/calendar/subscriptions",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Revoke an iCalendar subscription
    ///
    /// The URL stops working immediately. The row is kept, and revoking twice is
    /// not an error.
    ///
    /// DELETE /api/org/{orgId}/calendar/subscriptions/{subscriptionId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        subscriptionId: String,
        options: RequestOptions? = nil
    ) async throws -> CalendarSubscription {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/calendar/subscriptions/{subscriptionId}",
                pathParameters: ["orgId": orgId?.parameterValue, "subscriptionId": subscriptionId.parameterValue]
            ),
            options: options
        )
    }

    /// List the organization's iCalendar subscriptions
    ///
    /// Feed URLs that have been minted, including revoked ones — a revoked row is
    /// kept so the audit trail still resolves. The token itself is never
    /// returned.
    ///
    /// GET /api/org/{orgId}/calendar/subscriptions
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CalendarSubscriptionList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/calendar/subscriptions",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
