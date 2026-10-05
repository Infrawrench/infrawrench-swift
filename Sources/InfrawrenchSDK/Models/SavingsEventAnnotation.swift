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

public struct SavingsEventAnnotation: Codable, Hashable, Sendable {
    public var note: String?
    public var costCentreId: String?
    public var horizonMonths: Int?
    public var endedOn: String?

    public init(
        note: String? = nil,
        costCentreId: String? = nil,
        horizonMonths: Int? = nil,
        endedOn: String? = nil
    ) {
        self.note = note
        self.costCentreId = costCentreId
        self.horizonMonths = horizonMonths
        self.endedOn = endedOn
    }
}
