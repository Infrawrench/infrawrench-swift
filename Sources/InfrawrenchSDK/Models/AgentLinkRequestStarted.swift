/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AgentLinkRequestStarted: Codable, Hashable, Sendable {
    /// Secret to the platform; poll with it.
    public var deviceCode: String
    /// `XXXX-XXXX`, shown to the person.
    public var userCode: String
    public var verificationUrl: String
    public var verificationUrlComplete: String
    /// Seconds.
    public var expiresIn: Int
    /// Minimum seconds between polls.
    public var interval: Int

    public init(
        deviceCode: String,
        userCode: String,
        verificationUrl: String,
        verificationUrlComplete: String,
        expiresIn: Int,
        interval: Int
    ) {
        self.deviceCode = deviceCode
        self.userCode = userCode
        self.verificationUrl = verificationUrl
        self.verificationUrlComplete = verificationUrlComplete
        self.expiresIn = expiresIn
        self.interval = interval
    }
}
