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

public struct StatusPage: Codable, Hashable, Sendable {
    public var id: String
    /// The public URL segment, and the page's only access credential. Generated
    /// with real entropy rather than derived from the title.
    public var slug: String
    public var title: String
    public var description: String?
    /// False until deliberately published; a fresh page is never reachable.
    public var published: Bool
    public var showHistory: Bool
    public var showUptime: Bool
    public var supportUrl: String?
    public var components: [StatusPageComponent]
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        slug: String,
        title: String,
        description: String? = nil,
        published: Bool,
        showHistory: Bool,
        showUptime: Bool,
        supportUrl: String? = nil,
        components: [StatusPageComponent],
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.slug = slug
        self.title = title
        self.description = description
        self.published = published
        self.showHistory = showHistory
        self.showUptime = showUptime
        self.supportUrl = supportUrl
        self.components = components
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
