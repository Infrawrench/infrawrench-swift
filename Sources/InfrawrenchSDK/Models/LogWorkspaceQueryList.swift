/*
 * InfrawrenchSDK v0.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LogWorkspaceQueryList: Codable, Hashable, Sendable {
    public var queries: [LogWorkspaceQuery]

    public init(
        queries: [LogWorkspaceQuery]
    ) {
        self.queries = queries
    }
}
