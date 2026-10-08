/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A standing limit, evaluated daily on the summed ratio over the trailing window
/// and routed under the unit-cost alert trigger. A window with fewer than half
/// its days reported is not judged.
public struct UnitCostThreshold: Codable, Hashable, Sendable {
    public enum Mode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case unitCost
        case margin
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "unit_cost": self = .unitCost
            case "margin": self = .margin
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .unitCost: return "unit_cost"
            case .margin: return "margin"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Mode] = [
            .unitCost,
            .margin,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Direction: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case above
        case below
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "above": self = .above
            case "below": self = .below
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .above: return "above"
            case .below: return "below"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Direction] = [
            .above,
            .below,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var mode: Mode
    public var direction: Direction
    /// Currency units per `scale` metric units for `unit_cost`; a percentage (30
    /// for 30%) for `margin`.
    public var value: Double
    public var scale: UnitCostScale?
    /// Evaluate per value of this label. The label must be mapped.
    public var groupByLabel: String?
    /// Trailing complete days the ratio is summed over. Default 7.
    public var windowDays: Int?

    public init(
        mode: Mode,
        direction: Direction,
        value: Double,
        scale: UnitCostScale? = nil,
        groupByLabel: String? = nil,
        windowDays: Int? = nil
    ) {
        self.mode = mode
        self.direction = direction
        self.value = value
        self.scale = scale
        self.groupByLabel = groupByLabel
        self.windowDays = windowDays
    }
}
