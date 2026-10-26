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

public struct EventSubscriptionInput: Codable, Hashable, Sendable {
    public var name: String
    public var enabled: Bool?
    public var destination: EventDestination
    /// Event types to receive (see /event-subscriptions/catalog). Empty means
    /// all.
    public var eventTypes: [String]?
    public var minSeverity: EventSeverity?
    /// Only events about these accounts. Empty does not filter; an event with no
    /// account never matches a non-empty list.
    public var accountIds: [String]?
    /// Only events whose environment is one of these (case-insensitive). Empty
    /// does not filter; an event with no environment never matches a non-empty
    /// list.
    public var environments: [String]?

    public init(
        name: String,
        enabled: Bool? = nil,
        destination: EventDestination,
        eventTypes: [String]? = nil,
        minSeverity: EventSeverity? = nil,
        accountIds: [String]? = nil,
        environments: [String]? = nil
    ) {
        self.name = name
        self.enabled = enabled
        self.destination = destination
        self.eventTypes = eventTypes
        self.minSeverity = minSeverity
        self.accountIds = accountIds
        self.environments = environments
    }
}
