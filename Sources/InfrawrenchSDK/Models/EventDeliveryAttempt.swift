/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EventDeliveryAttempt: Codable, Hashable, Sendable {
    public var at: String
    public var status: Int?
    public var durationMs: Int
    public var error: String?

    public init(
        at: String,
        status: Int? = nil,
        durationMs: Int,
        error: String? = nil
    ) {
        self.at = at
        self.status = status
        self.durationMs = durationMs
        self.error = error
    }
}
