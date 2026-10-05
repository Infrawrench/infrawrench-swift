/*
 * InfrawrenchSDK v1.74.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The structured query spec. It holds queries, never numbers: running the canvas
/// re-executes every block, so a refresh needs no model call. Validated strictly
/// on write; there is no field that takes a query string or SQL.
public struct CostCanvasSpec: Codable, Hashable, Sendable {
    public var version: Double
    public var blocks: [CostCanvasBlock]

    public init(
        version: Double,
        blocks: [CostCanvasBlock]
    ) {
        self.version = version
        self.blocks = blocks
    }
}
