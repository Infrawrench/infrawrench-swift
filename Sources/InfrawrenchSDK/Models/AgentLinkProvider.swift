/*
 * InfrawrenchSDK v1.92.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.92.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AgentLinkProvider: Codable, Hashable, Sendable {
    public var id: String
    public var displayName: String

    public init(
        id: String,
        displayName: String
    ) {
        self.id = id
        self.displayName = displayName
    }
}
