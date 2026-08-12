/*
 * InfrawrenchSDK v1.14.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.14.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostAnnotation: Codable, Hashable, Sendable {
    public var id: String
    /// Inclusive first day (UTC) the note is about. Mapped to whichever bucket
    /// holds it at the chart's binning — daily and cumulative use the day itself,
    /// weekly the Monday that starts its week, monthly the first of its month.
    public var startDate: String
    /// Inclusive last day, or null for a note about a single moment. A deploy is
    /// a moment; a migration is a week, and a week spelled as seven notes
    /// misstates how many things happened. An end equal to the start is stored as
    /// null — the same fact has one spelling.
    public var endDate: String?
    public var text: String
    /// The report this note is scoped to, or null for **org-wide**. Null is the
    /// useful default: an org-wide note is drawn on every cost chart, because "we
    /// changed instance types" is not a fact about one report. An id from another
    /// org is a 400.
    public var costReportId: String?
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String
    /// The detected cost anomaly this note was written to explain (see POST
    /// /costs/anomalies/{anomalyId}/acknowledge), or null for a note written by
    /// hand. The reverse of the anomaly's own `acknowledgement.annotationId`,
    /// resolved from that same single link rather than stored twice.
    public var costAnomalyId: String?

    public init(
        id: String,
        startDate: String,
        endDate: String? = nil,
        text: String,
        costReportId: String? = nil,
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String,
        costAnomalyId: String? = nil
    ) {
        self.id = id
        self.startDate = startDate
        self.endDate = endDate
        self.text = text
        self.costReportId = costReportId
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.costAnomalyId = costAnomalyId
    }
}
