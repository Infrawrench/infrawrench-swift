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

public struct EventSubscriptionsCatalogResult: Codable, Hashable, Sendable {
    public var eventTypes: [EventTypeInfo]

    public init(
        eventTypes: [EventTypeInfo]
    ) {
        self.eventTypes = eventTypes
    }
}

public struct EventSubscriptionsTestResult: Codable, Hashable, Sendable {
    public var delivery: EventDelivery

    public init(
        delivery: EventDelivery
    ) {
        self.delivery = delivery
    }
}

public struct EventSubscriptionsDeliveriesGetResult: Codable, Hashable, Sendable {
    public var deliveries: [EventDelivery]

    public init(
        deliveries: [EventDelivery]
    ) {
        self.deliveries = deliveries
    }
}

public struct EventSubscriptionsDeliveriesRedeliverResult: Codable, Hashable, Sendable {
    public var delivery: EventDelivery

    public init(
        delivery: EventDelivery
    ) {
        self.delivery = delivery
    }
}

public struct EventSubscriptionsGetGetResult: Codable, Hashable, Sendable {
    public var subscriptions: [EventSubscription]

    public init(
        subscriptions: [EventSubscription]
    ) {
        self.subscriptions = subscriptions
    }
}

/// `client.eventSubscriptions`
public final class EventSubscriptionsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.eventSubscriptions.deliveries`
    public let deliveries: EventSubscriptionsDeliveriesNamespace
    /// `client.eventSubscriptions.get`
    public let get: EventSubscriptionsGetNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.deliveries = EventSubscriptionsDeliveriesNamespace(transport: transport)
        self.get = EventSubscriptionsGetNamespace(transport: transport)
    }

    /// List event types and their payload schemas
    ///
    /// Every event a subscription can receive, with the JSON Schema of its
    /// `data`.
    ///
    /// GET /api/org/{orgId}/event-subscriptions/catalog
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func catalog(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> EventSubscriptionsCatalogResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/event-subscriptions/catalog",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Create an event subscription
    ///
    /// Returns the signing secret once. Responds 403 when the filters include
    /// cost events and the caller lacks costs:read, 409 at the per-org limit.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/event-subscriptions
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: EventSubscriptionInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> EventSubscriptionWithSecret {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/event-subscriptions",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete an event subscription
    ///
    /// Its delivery log goes with it.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// DELETE /api/org/{orgId}/event-subscriptions/{id}
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
                path: "/api/org/{orgId}/event-subscriptions/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Picker options for the subscription form
    ///
    /// Connected accounts, environment values seen on resource tags, and every
    /// resource that can receive events.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/event-subscriptions/options
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func options(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> EventSubscriptionOptions {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/event-subscriptions/options",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Reroll a webhook signing secret
    ///
    /// Returns the new secret once. The previous secret keeps signing (a second
    /// v1 in the signature header) for 24 hours.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/event-subscriptions/{id}/reroll-secret
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func rerollSecret(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> EventSubscriptionWithSecret {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/event-subscriptions/{id}/reroll-secret",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Send a test event
    ///
    /// Sends an `infrawrench.test` event and returns the attempt. Tried once,
    /// never retried, and not counted toward auto-disable. Works on a disabled
    /// subscription.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/event-subscriptions/{id}/test
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func test(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> EventSubscriptionsTestResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/event-subscriptions/{id}/test",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Replace an event subscription
    ///
    /// Whole-object update. The destination kind cannot change. Re-enabling a
    /// subscription that was turned off automatically clears its failure history.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/event-subscriptions/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: EventSubscriptionInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> EventSubscription {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/event-subscriptions/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.eventSubscriptions.deliveries`
public final class EventSubscriptionsDeliveriesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List event deliveries
    ///
    /// The delivery log, newest first. Kept for 30 days.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/event-subscriptions/deliveries
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter state: One of `pending`, `retrying`, `succeeded`, `dead`,
    /// `skipped`.
    ///
    /// - Parameter before: Page backwards.
    public func get(
        orgId: String? = nil,
        subscriptionId: String? = nil,
        state: String? = nil,
        eventType: String? = nil,
        limit: Int? = nil,
        before: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> EventSubscriptionsDeliveriesGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/event-subscriptions/deliveries",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("subscriptionId", subscriptionId), QueryParameter("state", state), QueryParameter("eventType", eventType), QueryParameter("limit", limit), QueryParameter("before", before)]
            ),
            options: options
        )
    }

    /// Redeliver an event
    ///
    /// Queues a fresh delivery of the same envelope (same event id) with its own
    /// retry ladder.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/event-subscriptions/deliveries/{id}/redeliver
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func redeliver(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> EventSubscriptionsDeliveriesRedeliverResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/event-subscriptions/deliveries/{id}/redeliver",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.eventSubscriptions.get`
public final class EventSubscriptionsGetNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List event subscriptions
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/event-subscriptions
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> EventSubscriptionsGetGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/event-subscriptions",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get an event subscription
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/event-subscriptions/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdEventSubscriptionsId(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> EventSubscription {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/event-subscriptions/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }
}
