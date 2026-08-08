/*
 * InfrawrenchSDK v0.43.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.43.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PageResponse: Codable, Hashable, Sendable {
    /// True when at least one recipient was reached on any transport.
    public var delivered: Bool
    /// True when the key was still in cooldown, so nothing was sent.
    public var suppressed: Bool
    /// Twilio deliveries (SMS + voice) that Twilio accepted.
    public var sms: Int
    /// Push notifications accepted by Expo.
    public var push: Int
    /// Slack channel posts Slack accepted.
    public var slack: Int
    /// Microsoft Teams webhook posts Teams accepted.
    public var msTeams: Int
    /// When suppressed, the time at which this key can page again.
    public var retryAt: String?

    public init(
        delivered: Bool,
        suppressed: Bool,
        sms: Int,
        push: Int,
        slack: Int,
        msTeams: Int,
        retryAt: String? = nil
    ) {
        self.delivered = delivered
        self.suppressed = suppressed
        self.sms = sms
        self.push = push
        self.slack = slack
        self.msTeams = msTeams
        self.retryAt = retryAt
    }
}
