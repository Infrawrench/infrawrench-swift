/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DigestSettingsUpdate: Codable, Hashable, Sendable {
    public var enabled: Bool?
    /// IANA time zone name. Rejected with 400 if the server does not know the
    /// zone.
    public var timezone: String?
    public var sendDay: Int?
    public var sendHour: Int?
    public var narrativeEnabled: Bool?

    public init(
        enabled: Bool? = nil,
        timezone: String? = nil,
        sendDay: Int? = nil,
        sendHour: Int? = nil,
        narrativeEnabled: Bool? = nil
    ) {
        self.enabled = enabled
        self.timezone = timezone
        self.sendDay = sendDay
        self.sendHour = sendHour
        self.narrativeEnabled = narrativeEnabled
    }
}
