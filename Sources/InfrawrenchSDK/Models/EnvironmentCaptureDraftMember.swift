/*
 * InfrawrenchSDK v1.28.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.28.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentCaptureDraftMember: Codable, Hashable, Sendable {
    public struct FieldMetaValue: Codable, Hashable, Sendable {
        public struct Option: Codable, Hashable, Sendable {
            public var id: String
            public var label: String

            public init(
                id: String,
                label: String
            ) {
                self.id = id
                self.label = label
            }
        }

        public var label: String
        public var kind: String
        public var `required`: Bool
        public var options: [Option]?
        public var parameterisable: Bool

        public init(
            label: String,
            kind: String,
            `required`: Bool,
            options: [Option]? = nil,
            parameterisable: Bool
        ) {
            self.label = label
            self.kind = kind
            self.`required` = `required`
            self.options = options
            self.parameterisable = parameterisable
        }
    }

    /// Unique within the template; the id references are written against.
    public var key: String
    public var pluginId: PluginId
    public var resourceTypeId: String
    public var accountId: String
    public var sourceName: String
    public var sourceResourceId: String?
    /// The create-form field carrying the resource's name, detected at capture by
    /// matching the captured value against the source's display name. The
    /// instance name prefix is applied to this field and no other.
    public var nameFieldKey: String?
    public var parentMember: String?
    public var fields: [String: EnvironmentTemplateFieldValue]
    public var fieldMeta: [String: FieldMetaValue]

    public init(
        key: String,
        pluginId: PluginId,
        resourceTypeId: String,
        accountId: String,
        sourceName: String,
        sourceResourceId: String? = nil,
        nameFieldKey: String? = nil,
        parentMember: String? = nil,
        fields: [String: EnvironmentTemplateFieldValue],
        fieldMeta: [String: FieldMetaValue]
    ) {
        self.key = key
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.accountId = accountId
        self.sourceName = sourceName
        self.sourceResourceId = sourceResourceId
        self.nameFieldKey = nameFieldKey
        self.parentMember = parentMember
        self.fields = fields
        self.fieldMeta = fieldMeta
    }
}
