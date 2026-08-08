/*
 * InfrawrenchSDK v1.1.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.1.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChildTypeRef: Codable, Hashable, Sendable {
    public var id: String
    public var displayName: String
    public var pluralDisplayName: String?
    public var supportsCreate: Bool
    public var fields: [JsonObject]?

    public init(
        id: String,
        displayName: String,
        pluralDisplayName: String? = nil,
        supportsCreate: Bool,
        fields: [JsonObject]? = nil
    ) {
        self.id = id
        self.displayName = displayName
        self.pluralDisplayName = pluralDisplayName
        self.supportsCreate = supportsCreate
        self.fields = fields
    }
}
