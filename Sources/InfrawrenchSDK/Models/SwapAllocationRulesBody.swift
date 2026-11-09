/*
 * InfrawrenchSDK v1.101.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.101.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Two allocation rule ids in the same org whose priorities should be swapped.
public struct SwapAllocationRulesBody: Codable, Hashable, Sendable {
    public var aId: JSONValue
    public var bId: JSONValue

    public init(
        aId: JSONValue,
        bId: JSONValue
    ) {
        self.aId = aId
        self.bId = bId
    }
}
