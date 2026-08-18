/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChangeFreezeInput: Codable, Hashable, Sendable {
    public var name: String
    public var reason: String?
    public var startsAt: String?
    public var endsAt: String?

    public init(
        name: String,
        reason: String? = nil,
        startsAt: String? = nil,
        endsAt: String? = nil
    ) {
        self.name = name
        self.reason = reason
        self.startsAt = startsAt
        self.endsAt = endsAt
    }
}
