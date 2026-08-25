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

public struct StatusPageCreate: Codable, Hashable, Sendable {
    public var title: String
    public var description: String?
    /// Defaults to false.
    public var published: Bool?
    public var showHistory: Bool?
    public var showUptime: Bool?
    public var supportUrl: String?
    /// Order is significant — it is the public render order.
    public var components: [StatusPageComponentInput]?

    public init(
        title: String,
        description: String? = nil,
        published: Bool? = nil,
        showHistory: Bool? = nil,
        showUptime: Bool? = nil,
        supportUrl: String? = nil,
        components: [StatusPageComponentInput]? = nil
    ) {
        self.title = title
        self.description = description
        self.published = published
        self.showHistory = showHistory
        self.showUptime = showUptime
        self.supportUrl = supportUrl
        self.components = components
    }
}
