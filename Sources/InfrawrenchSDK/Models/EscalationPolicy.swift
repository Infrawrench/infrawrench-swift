/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Notify these destinations too if nobody acknowledges within afterMinutes.
/// Acknowledgement comes from the button on the Slack message, so an alert routed
/// only to Teams or push will always escalate.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct EscalationPolicy: Codable, Hashable, Sendable {
    public var afterMinutes: Int
    public var destinations: [AlertDestination]

    public init(
        afterMinutes: Int,
        destinations: [AlertDestination]
    ) {
        self.afterMinutes = afterMinutes
        self.destinations = destinations
    }
}
