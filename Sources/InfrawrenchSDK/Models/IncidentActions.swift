/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IncidentActions: Codable, Hashable, Sendable {
    /// Open an org change freeze for the duration, lifted when the incident
    /// resolves. Defaults to false — freezing has blast radius beyond the
    /// incident. Needs `freezes:write`; without it the freeze is recorded as a
    /// failed artefact naming the permission, and the incident still stands.
    public var openFreeze: Bool?
    /// Pin the moment (a timestamp and a window) so `GET /moment` is one click
    /// away. Defaults to true — it cannot fail, and the investigation always
    /// wants it.
    public var pinMoment: Bool?
    /// Announce through the org's alert routing rules under the `incidentAlerts`
    /// trigger, so channels, quiet hours, escalation and the acknowledge button
    /// all apply unchanged. Defaults to true. If no rule matches, the artefact
    /// fails and says so.
    public var postSlack: Bool?
    /// Post a public update on this status page. Omitted means no public update.
    public var statusPageId: String?
    /// Components on that page to mark affected. Empty means the page as a whole.
    public var statusPageComponentIds: [String]?

    public init(
        openFreeze: Bool? = nil,
        pinMoment: Bool? = nil,
        postSlack: Bool? = nil,
        statusPageId: String? = nil,
        statusPageComponentIds: [String]? = nil
    ) {
        self.openFreeze = openFreeze
        self.pinMoment = pinMoment
        self.postSlack = postSlack
        self.statusPageId = statusPageId
        self.statusPageComponentIds = statusPageComponentIds
    }
}
