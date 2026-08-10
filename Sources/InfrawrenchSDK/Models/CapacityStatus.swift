/*
 * InfrawrenchSDK v1.4.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.4.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CapacityStatus: Codable, Hashable, Sendable {
    /// False when this deployment has no one-time capacity price configured; the
    /// purchase route returns 503 and clients should hide the offer.
    public var purchasable: Bool
    public var termMonths: Int
    /// List price of one slot in whole dollars, for display copy.
    public var priceUsd: Int
    /// Seats from slots still inside their term, excluding lapsed and refunded.
    /// ADDITIONAL to `subscription.seatCount` — an org's capacity is the two
    /// summed, and an org can hold slots with no subscription at all.
    public var seats: Int
    /// Every purchase ever made, newest first, including lapsed and refunded.
    public var slots: [CapacitySlot]

    public init(
        purchasable: Bool,
        termMonths: Int,
        priceUsd: Int,
        seats: Int,
        slots: [CapacitySlot]
    ) {
        self.purchasable = purchasable
        self.termMonths = termMonths
        self.priceUsd = priceUsd
        self.seats = seats
        self.slots = slots
    }
}
