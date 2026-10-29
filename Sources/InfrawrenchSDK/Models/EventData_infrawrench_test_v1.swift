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

/// `data` of a `infrawrench.test` event, version 1. Sent by Send test event.
/// Never raised by anything else.
public struct EventData_infrawrench_test_v1: Codable, Hashable, Sendable {
    /// Fixed text saying this is a test.
    public var message: String
    /// The subscription the test was sent to.
    public var subscriptionId: String

    public init(
        message: String,
        subscriptionId: String
    ) {
        self.message = message
        self.subscriptionId = subscriptionId
    }
}
