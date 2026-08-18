/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LinearIntegrationInput: Codable, Hashable, Sendable {
    /// Personal API key from Linear → Settings → Security & access. Omit to keep
    /// the stored key; required on first connect.
    public var apiKey: String?
    public var defaultTeamId: String?

    public init(
        apiKey: String? = nil,
        defaultTeamId: String? = nil
    ) {
        self.apiKey = apiKey
        self.defaultTeamId = defaultTeamId
    }
}
