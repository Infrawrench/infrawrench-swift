/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DnsZone: Codable, Hashable, Sendable {
    public var resourceId: String
    public var pluginId: PluginId
    public var pluginName: String
    public var resourceTypeId: String
    public var resourceTypeName: String
    public var accountId: String
    public var accountName: String
    public var domain: String
    public var status: String?
    /// Split-horizon/internal zone; listed but never analysed for takeover.
    public var isPrivate: Bool
    /// Records synced into this zone.
    public var recordCount: Int
    /// The provider's own record count, when reported. May exceed `recordCount` —
    /// several plugins list zones without listing their records.
    public var providerRecordCount: Int?
    public var danglingCount: Int

    public init(
        resourceId: String,
        pluginId: PluginId,
        pluginName: String,
        resourceTypeId: String,
        resourceTypeName: String,
        accountId: String,
        accountName: String,
        domain: String,
        status: String? = nil,
        isPrivate: Bool,
        recordCount: Int,
        providerRecordCount: Int? = nil,
        danglingCount: Int
    ) {
        self.resourceId = resourceId
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.accountId = accountId
        self.accountName = accountName
        self.domain = domain
        self.status = status
        self.isPrivate = isPrivate
        self.recordCount = recordCount
        self.providerRecordCount = providerRecordCount
        self.danglingCount = danglingCount
    }
}
