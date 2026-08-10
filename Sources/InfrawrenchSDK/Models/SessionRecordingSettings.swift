/*
 * InfrawrenchSDK v1.7.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.7.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SessionRecordingSettings: Codable, Hashable, Sendable {
    public var enabled: Bool
    /// Also record keystrokes. Separate from `enabled` because it captures input
    /// at prompts the remote host chose not to echo — a sudo password, a pasted
    /// token — which is a materially different promise to the people being
    /// recorded.
    public var captureInput: Bool
    public var retentionDays: Int
    public var usage: SessionRecordingUsage

    public init(
        enabled: Bool,
        captureInput: Bool,
        retentionDays: Int,
        usage: SessionRecordingUsage
    ) {
        self.enabled = enabled
        self.captureInput = captureInput
        self.retentionDays = retentionDays
        self.usage = usage
    }
}
