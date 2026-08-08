/*
 * InfrawrenchSDK v1.0.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.0.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LogWorkspaceQuery: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var resources: [LogStreamSelector]
    /// The search expression. Empty matches every line; `/pattern/` (optionally
    /// `/pattern/i`) is a regular expression; otherwise whitespace-separated
    /// terms that must ALL appear in a line (case-insensitive), with `"quoted
    /// phrases"` and `-term` negation.
    public var search: String
    /// When true the poller periodically evaluates the query and alerts on match.
    public var alertEnabled: Bool
    /// Last time the alert pass evaluated this query; null until it has run.
    public var lastEvalAt: String?
    /// Last evaluation that found at least one matching line.
    public var lastMatchAt: String?
    /// Last dispatched notification — the cooldown anchor.
    public var lastAlertedAt: String?
    /// Failure detail from the last evaluation.
    public var lastEvalError: String?
    /// Truncated sample of the most recent matching line.
    public var lastMatchSample: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        resources: [LogStreamSelector],
        search: String,
        alertEnabled: Bool,
        lastEvalAt: String? = nil,
        lastMatchAt: String? = nil,
        lastAlertedAt: String? = nil,
        lastEvalError: String? = nil,
        lastMatchSample: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.resources = resources
        self.search = search
        self.alertEnabled = alertEnabled
        self.lastEvalAt = lastEvalAt
        self.lastMatchAt = lastMatchAt
        self.lastAlertedAt = lastAlertedAt
        self.lastEvalError = lastEvalError
        self.lastMatchSample = lastMatchSample
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
