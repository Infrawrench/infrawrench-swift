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

public struct AssociationCandidate: Codable, Hashable, Sendable {
    public var resourceId: ResourceId
    public var pluginId: String
    public var resourceTypeId: String
    public var accountId: String
    public var displayName: String
    /// The output that would fill the field; send it as `providerOutputKey`.
    public var outputKey: String
    /// Inline SVG markup; may be empty.
    public var pluginLogoSvg: String

    public init(
        resourceId: ResourceId,
        pluginId: String,
        resourceTypeId: String,
        accountId: String,
        displayName: String,
        outputKey: String,
        pluginLogoSvg: String
    ) {
        self.resourceId = resourceId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.accountId = accountId
        self.displayName = displayName
        self.outputKey = outputKey
        self.pluginLogoSvg = pluginLogoSvg
    }
}
