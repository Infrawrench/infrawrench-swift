/*
 * InfrawrenchSDK v1.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChangeCostImpactsRequest: Codable, Hashable, Sendable {
    /// Change ids from `GET /changes`. At most 50 — one feed page.
    public var changeIds: [String]
    /// Days either side of the change. Default 7; clamped server-side.
    public var windowDays: Int?
    public var costBasis: ChangeCostBasis?

    public init(
        changeIds: [String],
        windowDays: Int? = nil,
        costBasis: ChangeCostBasis? = nil
    ) {
        self.changeIds = changeIds
        self.windowDays = windowDays
        self.costBasis = costBasis
    }
}
