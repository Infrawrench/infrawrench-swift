/*
 * InfrawrenchSDK v0.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MomentResponse: Codable, Hashable, Sendable {
    /// The centre timestamp, normalized to ISO.
    public var at: String
    public var from: String
    public var to: String
    /// The half-window actually applied, after clamping to 1–4320 minutes.
    public var windowMinutes: Int
    public var generatedAt: String
    /// One entry per feed, in canonical order — including omitted and errored
    /// feeds.
    public var feeds: [MomentFeedStatus]
    /// Chronological, oldest first.
    public var events: [MomentEvent]
    public var incidents: [MomentIncidentSpan]

    public init(
        at: String,
        from: String,
        to: String,
        windowMinutes: Int,
        generatedAt: String,
        feeds: [MomentFeedStatus],
        events: [MomentEvent],
        incidents: [MomentIncidentSpan]
    ) {
        self.at = at
        self.from = from
        self.to = to
        self.windowMinutes = windowMinutes
        self.generatedAt = generatedAt
        self.feeds = feeds
        self.events = events
        self.incidents = incidents
    }
}
