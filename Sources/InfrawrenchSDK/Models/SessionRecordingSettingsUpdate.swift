/*
 * InfrawrenchSDK v1.14.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.14.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SessionRecordingSettingsUpdate: Codable, Hashable, Sendable {
    public var enabled: Bool?
    public var captureInput: Bool?
    public var retentionDays: Int?

    public init(
        enabled: Bool? = nil,
        captureInput: Bool? = nil,
        retentionDays: Int? = nil
    ) {
        self.enabled = enabled
        self.captureInput = captureInput
        self.retentionDays = retentionDays
    }
}
