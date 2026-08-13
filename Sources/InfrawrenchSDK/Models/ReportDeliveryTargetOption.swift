/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ReportDeliveryTargetOption: Codable, Hashable, Sendable {
    /// The stored row id — what the schedule input carries.
    public var id: String
    /// Display label: `#channel` for Slack, the saved label for Teams.
    public var label: String

    public init(
        id: String,
        label: String
    ) {
        self.id = id
        self.label = label
    }
}
