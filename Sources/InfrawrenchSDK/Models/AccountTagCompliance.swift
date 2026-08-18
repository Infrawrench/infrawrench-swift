/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AccountTagCompliance: Codable, Hashable, Sendable {
    public var accountId: String
    public var pluginId: String
    public var displayName: String
    public var totalResources: Int
    /// Resources whose stored record exposes a tag map (the scoreable set).
    public var evaluated: Int
    public var compliant: Int
    /// Percent of evaluated resources carrying every required tag; null when
    /// none.
    public var score: Int?

    public init(
        accountId: String,
        pluginId: String,
        displayName: String,
        totalResources: Int,
        evaluated: Int,
        compliant: Int,
        score: Int? = nil
    ) {
        self.accountId = accountId
        self.pluginId = pluginId
        self.displayName = displayName
        self.totalResources = totalResources
        self.evaluated = evaluated
        self.compliant = compliant
        self.score = score
    }
}
