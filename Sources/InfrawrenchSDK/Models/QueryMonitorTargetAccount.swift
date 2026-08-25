/*
 * InfrawrenchSDK v1.39.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.39.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct QueryMonitorTargetAccount: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    /// The account itself has a SQL driver, so it is a valid target on its own.
    public var accountSql: Bool
    public var resources: [QueryMonitorTargetResource]

    public init(
        id: String,
        name: String,
        accountSql: Bool,
        resources: [QueryMonitorTargetResource]
    ) {
        self.id = id
        self.name = name
        self.accountSql = accountSql
        self.resources = resources
    }
}
