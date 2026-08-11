/*
 * InfrawrenchSDK v1.9.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.9.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentDiffUnavailableType: Codable, Hashable, Sendable {
    public var resourceTypeId: String
    public var resourceTypeName: String
    /// The provider's complaint, as the lister reported it.
    public var message: String

    public init(
        resourceTypeId: String,
        resourceTypeName: String,
        message: String
    ) {
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.message = message
    }
}
