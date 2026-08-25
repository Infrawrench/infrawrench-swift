/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ShowbackReport: Codable, Hashable, Sendable {
    public struct Centre: Codable, Hashable, Sendable {
        /// Null for the synthetic "Unallocated" bucket.
        public var costCentreId: String?
        public var name: String
        /// Spend allocated directly to this centre. A cost row is allocated
        /// exactly once, so summing this across every entry equals the
        /// organization's spend for the period.
        public var totals: [String: Double]
        /// This centre's own spend plus every descendant's. Equal to `totals` for
        /// a leaf and for every centre in an organization that does not nest. Do
        /// not sum this across entries — parents already contain their children.
        public var subtreeTotals: [String: Double]
        /// The centre this one sits under; null for a root and for Unallocated.
        public var parentId: String?
        /// 0 for a root; the indentation level.
        public var depth: Int

        public init(
            costCentreId: String? = nil,
            name: String,
            totals: [String: Double],
            subtreeTotals: [String: Double],
            parentId: String? = nil,
            depth: Int
        ) {
            self.costCentreId = costCentreId
            self.name = name
            self.totals = totals
            self.subtreeTotals = subtreeTotals
            self.parentId = parentId
            self.depth = depth
        }
    }

    public var from: String
    public var to: String
    public var currencies: [String]
    public var adjustment: CostAdjustmentSummary?
    /// Depth-first: each centre immediately followed by its children, siblings
    /// name-sorted, with the "Unallocated" bucket last.
    public var centres: [Centre]

    public init(
        from: String,
        to: String,
        currencies: [String],
        adjustment: CostAdjustmentSummary? = nil,
        centres: [Centre]
    ) {
        self.from = from
        self.to = to
        self.currencies = currencies
        self.adjustment = adjustment
        self.centres = centres
    }
}
