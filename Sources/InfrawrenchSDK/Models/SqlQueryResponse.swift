/*
 * InfrawrenchSDK v0.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SqlQueryResponse: Codable, Hashable, Sendable {
    public var rows: [JsonObject]
    public var durationMs: Int?

    public init(
        rows: [JsonObject],
        durationMs: Int? = nil
    ) {
        self.rows = rows
        self.durationMs = durationMs
    }
}
