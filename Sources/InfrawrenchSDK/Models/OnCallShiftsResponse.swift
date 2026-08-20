/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OnCallShiftsResponse: Codable, Hashable, Sendable {
    public var shifts: [OnCallShift?]
    /// Covers overlapping the previewed window, returned **separately** rather
    /// than merged into the shifts: a preview that folded them in would make it
    /// impossible to see what the rotation itself does, which is the thing being
    /// edited.
    public var overrides: [OnCallOverride]

    public init(
        shifts: [OnCallShift?],
        overrides: [OnCallOverride]
    ) {
        self.shifts = shifts
        self.overrides = overrides
    }
}
