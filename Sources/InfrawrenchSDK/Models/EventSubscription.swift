/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EventSubscription: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var enabled: Bool
    public var destination: EventDestination
    /// Human label for the destination.
    public var destinationLabel: String
    /// Event types to receive (see /event-subscriptions/catalog). Empty means
    /// all.
    public var eventTypes: [String]
    public var minSeverity: EventSeverity?
    /// Only events about these accounts. Empty does not filter; an event with no
    /// account never matches a non-empty list.
    public var accountIds: [String]
    /// Only events whose environment is one of these (case-insensitive). Empty
    /// does not filter; an event with no environment never matches a non-empty
    /// list.
    public var environments: [String]
    /// Last four characters of the signing secret; null for publish destinations.
    public var secretHint: String?
    /// Until when the secret before the last reroll still signs.
    public var previousSecretExpiresAt: String?
    /// Set when the subscription was turned off automatically after sustained
    /// failure.
    public var disabledReason: String?
    public var disabledAt: String?
    public var consecutiveFailures: Int
    public var failingSince: String?
    public var lastSuccessAt: String?
    public var lastFailureAt: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        enabled: Bool,
        destination: EventDestination,
        destinationLabel: String,
        eventTypes: [String],
        minSeverity: EventSeverity? = nil,
        accountIds: [String],
        environments: [String],
        secretHint: String? = nil,
        previousSecretExpiresAt: String? = nil,
        disabledReason: String? = nil,
        disabledAt: String? = nil,
        consecutiveFailures: Int,
        failingSince: String? = nil,
        lastSuccessAt: String? = nil,
        lastFailureAt: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.enabled = enabled
        self.destination = destination
        self.destinationLabel = destinationLabel
        self.eventTypes = eventTypes
        self.minSeverity = minSeverity
        self.accountIds = accountIds
        self.environments = environments
        self.secretHint = secretHint
        self.previousSecretExpiresAt = previousSecretExpiresAt
        self.disabledReason = disabledReason
        self.disabledAt = disabledAt
        self.consecutiveFailures = consecutiveFailures
        self.failingSince = failingSince
        self.lastSuccessAt = lastSuccessAt
        self.lastFailureAt = lastFailureAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
