/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LinearIssueLink: Codable, Hashable, Sendable {
    public var id: String
    public var sourceKind: LinearSourceKind
    public var sourceId: String
    public var issueIdentifier: String
    public var issueUrl: String
    public var createdByUserId: String?
    public var createdAt: String

    public init(
        id: String,
        sourceKind: LinearSourceKind,
        sourceId: String,
        issueIdentifier: String,
        issueUrl: String,
        createdByUserId: String? = nil,
        createdAt: String
    ) {
        self.id = id
        self.sourceKind = sourceKind
        self.sourceId = sourceId
        self.issueIdentifier = issueIdentifier
        self.issueUrl = issueUrl
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
    }
}
