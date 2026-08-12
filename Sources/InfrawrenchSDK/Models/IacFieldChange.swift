/*
 * InfrawrenchSDK v1.20.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.20.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IacFieldChange: Codable, Hashable, Sendable {
    public var field: String
    /// The value Terraform state carries.
    public var from: JSONValue?
    /// The value actually running.
    public var to: JSONValue?

    public init(
        field: String,
        from: JSONValue? = nil,
        to: JSONValue? = nil
    ) {
        self.field = field
        self.from = from
        self.to = to
    }
}
