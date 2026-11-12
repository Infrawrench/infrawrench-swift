/*
 * InfrawrenchSDK v1.105.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.105.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiVariable: Codable, Hashable, Sendable {
    public var name: String
    public var value: String
    public var updatedAt: String

    public init(
        name: String,
        value: String,
        updatedAt: String
    ) {
        self.name = name
        self.value = value
        self.updatedAt = updatedAt
    }
}
