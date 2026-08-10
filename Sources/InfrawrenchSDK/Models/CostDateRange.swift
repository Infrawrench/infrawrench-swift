/*
 * InfrawrenchSDK v1.6.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.6.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A relative preset resolves against today every time the report runs, so a
/// saved report keeps meaning 'the last 30 days'; an absolute range pins it to
/// fixed dates.
///
/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum CostDateRange: Codable, Hashable, Sendable {
    public struct CostDateRangeObject: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case relative
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "relative": self = .relative
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .relative: return "relative"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .relative,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Preset: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case 7d
            case 30d
            case 90d
            case mtd
            case lastMonth
            case qtd
            case ytd
            case 12m
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "7d": self = .7d
                case "30d": self = .30d
                case "90d": self = .90d
                case "mtd": self = .mtd
                case "last_month": self = .lastMonth
                case "qtd": self = .qtd
                case "ytd": self = .ytd
                case "12m": self = .12m
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .7d: return "7d"
                case .30d: return "30d"
                case .90d: return "90d"
                case .mtd: return "mtd"
                case .lastMonth: return "last_month"
                case .qtd: return "qtd"
                case .ytd: return "ytd"
                case .12m: return "12m"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Preset] = [
                .7d,
                .30d,
                .90d,
                .mtd,
                .lastMonth,
                .qtd,
                .ytd,
                .12m,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        public var preset: Preset

        public init(
            kind: Kind,
            preset: Preset
        ) {
            self.kind = kind
            self.preset = preset
        }
    }

    public struct CostDateRangeObject2: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case absolute
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "absolute": self = .absolute
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .absolute: return "absolute"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .absolute,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        public var from: String
        public var to: String

        public init(
            kind: Kind,
            from: String,
            to: String
        ) {
            self.kind = kind
            self.from = from
            self.to = to
        }
    }

    case object(CostDateRangeObject)
    case object2(CostDateRangeObject2)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CostDateRangeObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(CostDateRangeObject2.self) {
            self = .object2(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value): try container.encode(value)
        case .object2(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
