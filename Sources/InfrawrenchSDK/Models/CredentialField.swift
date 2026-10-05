/*
 * InfrawrenchSDK v1.56.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.56.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CredentialField: Codable, Hashable, Sendable {
    public struct ProviderOptions: Codable, Hashable, Sendable {
        public var dependsOn: [String]
        public var emptyLabel: String?

        public init(
            dependsOn: [String],
            emptyLabel: String? = nil
        ) {
            self.dependsOn = dependsOn
            self.emptyLabel = emptyLabel
        }
    }

    public struct HelpLink: Codable, Hashable, Sendable {
        public var label: String
        public var url: String

        public init(
            label: String,
            url: String
        ) {
            self.label = label
            self.url = url
        }
    }

    public var key: String
    public var label: String
    public var description: String?
    public var placeholder: String?
    public var sensitive: Bool?
    public var multiline: Bool?
    public var defaultValue: String?
    public var regions: [CredentialFieldRegion]?
    /// Present when the field's choices come from the provider. Once every field
    /// in `dependsOn` has a value, `POST /accounts/credential-options` returns
    /// them.
    public var providerOptions: ProviderOptions?
    public var helpLink: HelpLink?

    public init(
        key: String,
        label: String,
        description: String? = nil,
        placeholder: String? = nil,
        sensitive: Bool? = nil,
        multiline: Bool? = nil,
        defaultValue: String? = nil,
        regions: [CredentialFieldRegion]? = nil,
        providerOptions: ProviderOptions? = nil,
        helpLink: HelpLink? = nil
    ) {
        self.key = key
        self.label = label
        self.description = description
        self.placeholder = placeholder
        self.sensitive = sensitive
        self.multiline = multiline
        self.defaultValue = defaultValue
        self.regions = regions
        self.providerOptions = providerOptions
        self.helpLink = helpLink
    }
}
