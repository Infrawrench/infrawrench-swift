/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CommitmentPlanner: Codable, Hashable, Sendable {
    /// False when the data window is under the 60-day minimum.
    public var available: Bool
    public var windowDayCount: Int
    public var recommendations: [CommitmentRecommendation]
    public var rejected: [CommitmentRejectedCell]

    public init(
        available: Bool,
        windowDayCount: Int,
        recommendations: [CommitmentRecommendation],
        rejected: [CommitmentRejectedCell]
    ) {
        self.available = available
        self.windowDayCount = windowDayCount
        self.recommendations = recommendations
        self.rejected = rejected
    }
}
