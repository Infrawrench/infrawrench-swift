/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostExportWarehouseTargetField: Codable, Hashable, Sendable {
    public var key: String
    public var label: String
    public var description: String?
    public var dependsOn: [String]
    public var `optional`: Bool
    /// A value outside the listed options is accepted (a table created on first
    /// run).
    public var allowCustom: Bool
    public var placeholder: String?
    public var emptyLabel: String?

    public init(
        key: String,
        label: String,
        description: String? = nil,
        dependsOn: [String],
        `optional`: Bool,
        allowCustom: Bool,
        placeholder: String? = nil,
        emptyLabel: String? = nil
    ) {
        self.key = key
        self.label = label
        self.description = description
        self.dependsOn = dependsOn
        self.`optional` = `optional`
        self.allowCustom = allowCustom
        self.placeholder = placeholder
        self.emptyLabel = emptyLabel
    }
}
