/*
 * InfrawrenchSDK v0.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CredentialExport: Codable, Hashable, Sendable {
    public struct Field: Codable, Hashable, Sendable {
        public var label: String
        public var value: String
        public var sensitive: Bool?
        public var hint: String?

        public init(
            label: String,
            value: String,
            sensitive: Bool? = nil,
            hint: String? = nil
        ) {
            self.label = label
            self.value = value
            self.sensitive = sensitive
            self.hint = hint
        }
    }

    public var content: String
    public var filename: String
    public var mimeType: String
    public var fields: [Field]?
    public var warning: String?

    public init(
        content: String,
        filename: String,
        mimeType: String,
        fields: [Field]? = nil,
        warning: String? = nil
    ) {
        self.content = content
        self.filename = filename
        self.mimeType = mimeType
        self.fields = fields
        self.warning = warning
    }
}
