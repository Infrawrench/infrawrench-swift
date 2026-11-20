/*
 * InfrawrenchSDK v1.123.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.123.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct HeartbeatSuggestion: Codable, Hashable, Sendable {
    public var resourceId: String
    public var displayName: String
    public var pluginId: PluginId
    public var resourceTypeId: String
    public var accountId: String
    /// The field the plugin flags as the resource's schedule.
    public var fieldKey: String
    /// The value as the provider reported it.
    public var rawSchedule: String
    /// The value read as a heartbeat schedule; null when its dialect is not
    /// readable.
    public var schedule: HeartbeatSchedule?
    /// Heartbeats already watching this resource.
    public var watchedBy: [String]

    public init(
        resourceId: String,
        displayName: String,
        pluginId: PluginId,
        resourceTypeId: String,
        accountId: String,
        fieldKey: String,
        rawSchedule: String,
        schedule: HeartbeatSchedule? = nil,
        watchedBy: [String]
    ) {
        self.resourceId = resourceId
        self.displayName = displayName
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.accountId = accountId
        self.fieldKey = fieldKey
        self.rawSchedule = rawSchedule
        self.schedule = schedule
        self.watchedBy = watchedBy
    }
}
