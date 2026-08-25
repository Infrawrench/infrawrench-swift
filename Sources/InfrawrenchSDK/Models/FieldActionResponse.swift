/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct FieldActionResponse: Codable, Hashable, Sendable {
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

    public var value: String
    public var option: Option?

    public init(
        value: String,
        option: Option? = nil
    ) {
        self.value = value
        self.option = option
    }
}
