/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
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
    /// The public URL segment on the app host, and the page's access credential
    /// there. Generated with real entropy rather than derived from the title.
    public var slug: String
    public var title: String
    public var description: String?
    /// False until deliberately published; a fresh page is never reachable.
    public var published: Bool
    public var showHistory: Bool
    public var showUptime: Bool
    public var supportUrl: String?
    /// Vanity subdomain (e.g. status.acme.com), or null when none is attached.
    public var customHostname: String?
    public var customHostnameStatus: StatusPageCustomHostnameStatus
    public var customHostnameError: String?
    public var customHostnameVerification: StatusPageHostnameVerification?
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
        customHostname: String? = nil,
        customHostnameStatus: StatusPageCustomHostnameStatus,
        customHostnameError: String? = nil,
        customHostnameVerification: StatusPageHostnameVerification? = nil,
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
        self.customHostname = customHostname
        self.customHostnameStatus = customHostnameStatus
        self.customHostnameError = customHostnameError
        self.customHostnameVerification = customHostnameVerification
        self.components = components
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
