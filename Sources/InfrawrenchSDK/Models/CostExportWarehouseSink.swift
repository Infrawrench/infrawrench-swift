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

public struct CostExportWarehouseSink: Codable, Hashable, Sendable {
    public struct Account2: Codable, Hashable, Sendable {
        public var id: String
        public var name: String

        public init(
            id: String,
            name: String
        ) {
            self.id = id
            self.name = name
        }
    }

    public var pluginId: String
    public var displayName: String
    public var label: String
    public var description: String?
    public var targetFields: [CostExportWarehouseTargetField]
    public var accounts: [Account2]

    public init(
        pluginId: String,
        displayName: String,
        label: String,
        description: String? = nil,
        targetFields: [CostExportWarehouseTargetField],
        accounts: [Account2]
    ) {
        self.pluginId = pluginId
        self.displayName = displayName
        self.label = label
        self.description = description
        self.targetFields = targetFields
        self.accounts = accounts
    }
}
