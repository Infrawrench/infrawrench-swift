/*
 * InfrawrenchSDK v1.105.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.105.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChatSpendStatus: Codable, Hashable, Sendable {
    /// AI spend this calendar month (chat and workflow `infra.ai`), in millionths
    /// of a US dollar.
    public var monthToDateMicros: Double
    /// The cap that spend is held to; null when the organization set none and
    /// pays.
    public var monthlyCapMicros: Double?
    /// True when there is a cap and spend has reached it.
    public var exceeded: Bool
    /// True when the cap is the free tier's (no paid plan) rather than one the
    /// organization set.
    public var freeTier: Bool
    /// True when the organization has complimentary access: never billed,
    /// uncapped by default.
    public var complimentary: Bool

    public init(
        monthToDateMicros: Double,
        monthlyCapMicros: Double? = nil,
        exceeded: Bool,
        freeTier: Bool,
        complimentary: Bool
    ) {
        self.monthToDateMicros = monthToDateMicros
        self.monthlyCapMicros = monthlyCapMicros
        self.exceeded = exceeded
        self.freeTier = freeTier
        self.complimentary = complimentary
    }
}
