/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct InfraenvResourceDescription: Codable, Hashable, Sendable {
    public var resourceId: String
    public var output: String
    /// False when the organization has no such resource (deleted, or a typo).
    public var found: Bool
    public var displayName: String?
    public var pluginId: String?
    public var pluginName: String?
    public var resourceTypeId: String?
    public var resourceTypeName: String?
    public var accountId: String?
    public var accountName: String?
    public var outputLabel: String?
    /// False when the resource's type does not declare this output.
    public var outputKnown: Bool
    public var sensitive: Bool

    public init(
        resourceId: String,
        output: String,
        found: Bool,
        displayName: String? = nil,
        pluginId: String? = nil,
        pluginName: String? = nil,
        resourceTypeId: String? = nil,
        resourceTypeName: String? = nil,
        accountId: String? = nil,
        accountName: String? = nil,
        outputLabel: String? = nil,
        outputKnown: Bool,
        sensitive: Bool
    ) {
        self.resourceId = resourceId
        self.output = output
        self.found = found
        self.displayName = displayName
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.accountId = accountId
        self.accountName = accountName
        self.outputLabel = outputLabel
        self.outputKnown = outputKnown
        self.sensitive = sensitive
    }
}
