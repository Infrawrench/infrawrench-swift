/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct WallboardIncidentLine: Codable, Hashable, Sendable {
    public var id: String
    public var title: String
    public var severity: String
    public var startedAt: String
    public var status: String

    public init(
        id: String,
        title: String,
        severity: String,
        startedAt: String,
        status: String
    ) {
        self.id = id
        self.title = title
        self.severity = severity
        self.startedAt = startedAt
        self.status = status
    }
}
