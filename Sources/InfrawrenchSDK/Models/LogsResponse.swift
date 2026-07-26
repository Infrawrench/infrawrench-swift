/*
 * InfrawrenchSDK v0.3.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.3.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LogsResponse: Codable, Hashable, Sendable {
    public var lines: [String]
    public var nextPageToken: String?
    public var truncated: Bool?

    public init(
        lines: [String],
        nextPageToken: String? = nil,
        truncated: Bool? = nil
    ) {
        self.lines = lines
        self.nextPageToken = nextPageToken
        self.truncated = truncated
    }
}
