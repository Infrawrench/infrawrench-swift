/*
 * InfrawrenchSDK v1.19.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.19.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AlertRulesAdoptDefaultsResult: Codable, Hashable, Sendable {
    public var rules: [AlertRule]
    public var adopted: Bool

    public init(
        rules: [AlertRule],
        adopted: Bool
    ) {
        self.rules = rules
        self.adopted = adopted
    }
}

public struct AlertRulesUpdateBody: Codable, Hashable, Sendable {
    public var rules: [AlertRuleInput]

    public init(
        rules: [AlertRuleInput]
    ) {
        self.rules = rules
    }
}

public struct AlertRulesUpdateResult: Codable, Hashable, Sendable {
    public var rules: [AlertRule]

    public init(
        rules: [AlertRule]
    ) {
        self.rules = rules
    }
}

public struct AlertRulesDeliveriesAckResult: Codable, Hashable, Sendable {
    public enum Reason: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case notPending
        case alreadyEscalated
        case alreadyAcknowledged
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "not_pending": self = .notPending
            case "already_escalated": self = .alreadyEscalated
            case "already_acknowledged": self = .alreadyAcknowledged
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .notPending: return "not_pending"
            case .alreadyEscalated: return "already_escalated"
            case .alreadyAcknowledged: return "already_acknowledged"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Reason] = [
            .notPending,
            .alreadyEscalated,
            .alreadyAcknowledged,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var acknowledged: Bool
    public var alreadyAcknowledgedBy: String?
    /// Why the acknowledgement did not take. `not_pending` means the delivery
    /// exists but was never awaiting one — still held, already sent, or expired.
    public var reason: Reason?
    public var title: String?

    public init(
        acknowledged: Bool,
        alreadyAcknowledgedBy: String? = nil,
        reason: Reason? = nil,
        title: String? = nil
    ) {
        self.acknowledged = acknowledged
        self.alreadyAcknowledgedBy = alreadyAcknowledgedBy
        self.reason = reason
        self.title = title
    }
}

public struct AlertRulesDeliveriesCancelBody: Codable, Hashable, Sendable {
    public var ids: [String]

    public init(
        ids: [String]
    ) {
        self.ids = ids
    }
}

public struct AlertRulesDeliveriesCancelResult: Codable, Hashable, Sendable {
    public var cancelled: Int

    public init(
        cancelled: Int
    ) {
        self.cancelled = cancelled
    }
}

/// `client.alertRules`
public final class AlertRulesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.alertRules.deliveries`
    public let deliveries: AlertRulesDeliveriesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.deliveries = AlertRulesDeliveriesNamespace(transport: transport)
    }

    /// Persist the default rule so it can be edited
    ///
    /// A no-op when the organization already has rules.
    ///
    /// POST /api/org/{orgId}/alert-rules/adopt-defaults
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func adoptDefaults(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> AlertRulesAdoptDefaultsResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/alert-rules/adopt-defaults",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get the organization's alert routing rules
    ///
    /// Returns the rules in evaluation order, plus the channels and accounts a
    /// rule can name so a client can render destinations by name. An organization
    /// that has saved no rules gets the synthesized default with `usingDefaults:
    /// true`.
    ///
    /// GET /api/org/{orgId}/alert-rules
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> AlertRulesResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/alert-rules",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Replace the organization's alert routing rules
    ///
    /// Whole-list replacement in one transaction. Order is part of the meaning —
    /// a rule is only correct relative to the ones above it — so a reorder
    /// applied as several requests would leave a window in which alerts route
    /// somewhere nobody asked for. Positions are re-derived from array order.
    ///
    /// PUT /api/org/{orgId}/alert-rules
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: AlertRulesUpdateBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> AlertRulesUpdateResult {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/alert-rules",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.alertRules.deliveries`
public final class AlertRulesDeliveriesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Acknowledge an alert, cancelling its escalation
    ///
    /// A conditional update: only a delivery still in `awaiting_ack` can move, so
    /// two people pressing at once produce one acknowledgement and an alert that
    /// already escalated cannot be retroactively silenced.
    ///
    /// POST /api/org/{orgId}/alert-rules/deliveries/{id}/ack
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func ack(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> AlertRulesDeliveriesAckResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/alert-rules/deliveries/{id}/ack",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Drop held or awaiting-acknowledgement deliveries
    ///
    /// POST /api/org/{orgId}/alert-rules/deliveries/cancel
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func cancel(
        orgId: String? = nil,
        body: AlertRulesDeliveriesCancelBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> AlertRulesDeliveriesCancelResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/alert-rules/deliveries/cancel",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// List recent held and escalating alerts
    ///
    /// Only alerts a rule created follow-up work for appear here: one held by
    /// quiet hours, or one waiting on an acknowledgement. An alert that went
    /// straight out leaves no row.
    ///
    /// GET /api/org/{orgId}/alert-rules/deliveries
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> [AlertDelivery] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/alert-rules/deliveries",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("limit", limit)]
            ),
            options: options
        )
    }
}
