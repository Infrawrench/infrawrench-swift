/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentDiffFieldChange: Codable, Hashable, Sendable {
    /// Field key; resolved-output keys are prefixed `outputs.`.
    public var field: String
    /// Value on side A; null when the key is absent there.
    public var a: JSONValue?
    /// Value on side B.
    public var b: JSONValue?

    public init(
        field: String,
        a: JSONValue? = nil,
        b: JSONValue? = nil
    ) {
        self.field = field
        self.a = a
        self.b = b
    }
}
