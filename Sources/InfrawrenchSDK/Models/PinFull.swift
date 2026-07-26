/*
 * InfrawrenchSDK v0.3.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.3.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PinFull: Codable, Hashable, Sendable {
    public var pinId: String
    public var resourceId: ResourceId
    public var gridX: Int
    public var gridY: Int
    public var gridW: Int
    public var gridH: Int
    public var displayName: String
    public var pluginId: String
    public var resourceTypeId: String
    public var accountId: String
    public var fieldsJson: JsonObject
    public var outputsJson: JsonObject
    public var pluginLogoSvg: String
    public var pluginDisplayName: String
    public var status: ProbeStatus

    public init(
        pinId: String,
        resourceId: ResourceId,
        gridX: Int,
        gridY: Int,
        gridW: Int,
        gridH: Int,
        displayName: String,
        pluginId: String,
        resourceTypeId: String,
        accountId: String,
        fieldsJson: JsonObject,
        outputsJson: JsonObject,
        pluginLogoSvg: String,
        pluginDisplayName: String,
        status: ProbeStatus
    ) {
        self.pinId = pinId
        self.resourceId = resourceId
        self.gridX = gridX
        self.gridY = gridY
        self.gridW = gridW
        self.gridH = gridH
        self.displayName = displayName
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.accountId = accountId
        self.fieldsJson = fieldsJson
        self.outputsJson = outputsJson
        self.pluginLogoSvg = pluginLogoSvg
        self.pluginDisplayName = pluginDisplayName
        self.status = status
    }
}
