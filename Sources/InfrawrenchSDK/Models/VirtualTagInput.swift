/*
 * InfrawrenchSDK v1.68.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.68.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct VirtualTagInput: Codable, Hashable, Sendable {
    /// How filters address the tag: `virtual_tag['team'] = 'payments'`. Immutable
    /// after creation, because saved filters, budgets, reports and exports store
    /// it.
    public var key: String
    public var name: String
    public var description: String?
    /// Value for rows no rule matches; null leaves them unset.
    public var defaultValue: String?
    /// Evaluated in order; the first rule a row matches decides its value.
    public var rules: [VirtualTagRule]

    public init(
        key: String,
        name: String,
        description: String? = nil,
        defaultValue: String? = nil,
        rules: [VirtualTagRule]
    ) {
        self.key = key
        self.name = name
        self.description = description
        self.defaultValue = defaultValue
        self.rules = rules
    }
}
