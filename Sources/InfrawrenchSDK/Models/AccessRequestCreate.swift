/*
 * InfrawrenchSDK v1.3.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.3.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AccessRequestCreate: Codable, Hashable, Sendable {
    public var permissions: [String]
    public var reason: String
    public var durationMinutes: Int

    public init(
        permissions: [String],
        reason: String,
        durationMinutes: Int
    ) {
        self.permissions = permissions
        self.reason = reason
        self.durationMinutes = durationMinutes
    }
}
