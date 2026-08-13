/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct UpdateWidgetRequest: Codable, Hashable, Sendable {
    public var title: String?
    public var config: JsonObject?
    public var gridX: Int?
    public var gridY: Int?
    public var gridW: Int?
    public var gridH: Int?

    public init(
        title: String? = nil,
        config: JsonObject? = nil,
        gridX: Int? = nil,
        gridY: Int? = nil,
        gridW: Int? = nil,
        gridH: Int? = nil
    ) {
        self.title = title
        self.config = config
        self.gridX = gridX
        self.gridY = gridY
        self.gridW = gridW
        self.gridH = gridH
    }
}
