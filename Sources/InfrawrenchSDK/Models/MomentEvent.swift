/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MomentEvent: Codable, Hashable, Sendable {
    /// Stable synthetic id, unique within a response (`feed:rowId[:phase]`).
    public var id: String
    public var feed: MomentFeedId
    /// Fine-grained `<noun>.<verb>` kind, e.g. `change.created`,
    /// `incident.started`, `workflow-run.failed`, `deployment.finished`,
    /// `freeze.started`, `drift-alert.sent`. Open set — render unknown kinds
    /// generically.
    public var kind: String
    public var timestamp: String
    /// One-line headline.
    public var title: String
    /// Optional second line — diff summary, actor, error text.
    public var detail: String?
    public var severity: MomentSeverity
    public var pluginId: String?
    public var accountId: String?
    public var accountName: String?
    public var resourceId: String?
    public var resourceTypeId: String?
    public var resourceName: String?
    public var link: MomentEventLink?

    public init(
        id: String,
        feed: MomentFeedId,
        kind: String,
        timestamp: String,
        title: String,
        detail: String? = nil,
        severity: MomentSeverity,
        pluginId: String? = nil,
        accountId: String? = nil,
        accountName: String? = nil,
        resourceId: String? = nil,
        resourceTypeId: String? = nil,
        resourceName: String? = nil,
        link: MomentEventLink? = nil
    ) {
        self.id = id
        self.feed = feed
        self.kind = kind
        self.timestamp = timestamp
        self.title = title
        self.detail = detail
        self.severity = severity
        self.pluginId = pluginId
        self.accountId = accountId
        self.accountName = accountName
        self.resourceId = resourceId
        self.resourceTypeId = resourceTypeId
        self.resourceName = resourceName
        self.link = link
    }
}
