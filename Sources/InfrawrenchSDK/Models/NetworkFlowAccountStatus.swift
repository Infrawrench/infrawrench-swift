/*
 * InfrawrenchSDK v1.71.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.71.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct NetworkFlowAccountStatus: Codable, Hashable, Sendable {
    public var accountId: String
    public var pluginId: String
    public var displayName: String
    /// False when the account's provider has no flow source we can read. Such
    /// accounts are listed and excluded from the totals rather than contributing
    /// zero bytes — zero would be a claim about their network, this is a
    /// statement about our coverage.
    public var supportsFlows: Bool
    /// True when the account's flows re-cut traffic another account may already
    /// report (a Kubernetes cluster's pods). Left out of this feed's totals
    /// unless asked for by `accountId`; see `GET
    /// /network-flows/kubernetes/{accountId}`.
    public var recut: Bool
    public var collectedThrough: String?
    public var lastPolledAt: String?
    public var failureCount: Int
    public var lastError: String?
    public var lastErrorHelpUrl: String?
    public var sources: [NetworkFlowSource]
    /// Log data the provider billed this account for the last collection's
    /// queries.
    public var lastQueryBytesScanned: Double?

    public init(
        accountId: String,
        pluginId: String,
        displayName: String,
        supportsFlows: Bool,
        recut: Bool,
        collectedThrough: String? = nil,
        lastPolledAt: String? = nil,
        failureCount: Int,
        lastError: String? = nil,
        lastErrorHelpUrl: String? = nil,
        sources: [NetworkFlowSource],
        lastQueryBytesScanned: Double? = nil
    ) {
        self.accountId = accountId
        self.pluginId = pluginId
        self.displayName = displayName
        self.supportsFlows = supportsFlows
        self.recut = recut
        self.collectedThrough = collectedThrough
        self.lastPolledAt = lastPolledAt
        self.failureCount = failureCount
        self.lastError = lastError
        self.lastErrorHelpUrl = lastErrorHelpUrl
        self.sources = sources
        self.lastQueryBytesScanned = lastQueryBytesScanned
    }
}
