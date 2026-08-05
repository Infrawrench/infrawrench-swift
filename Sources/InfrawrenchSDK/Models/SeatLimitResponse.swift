/*
 * InfrawrenchSDK v0.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SeatLimitResponse: Codable, Hashable, Sendable {
    public enum Code: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case seatLimitReached
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "seat_limit_reached": self = .seatLimitReached
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .seatLimitReached: return "seat_limit_reached"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Code] = [
            .seatLimitReached,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var error: String
    public var code: Code
    /// Seats on the plan
    public var seatCount: Int
    /// Members plus pending unexpired invitations
    public var seatsUsed: Int

    public init(
        error: String,
        code: Code,
        seatCount: Int,
        seatsUsed: Int
    ) {
        self.error = error
        self.code = code
        self.seatCount = seatCount
        self.seatsUsed = seatsUsed
    }
}
