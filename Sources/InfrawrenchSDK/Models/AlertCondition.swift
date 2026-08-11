/*
 * InfrawrenchSDK v1.13.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.13.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// One clause of a rule. A rule matches when every condition matches; 'or' is
/// expressed by writing a second rule. A condition on a fact the alert does not
/// carry never matches — in either direction, so `accountId notIn [x]` does not
/// match an alert with no account.
///
/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum AlertCondition: Codable, Hashable, Sendable {
    public struct AlertConditionObject: Codable, Hashable, Sendable {
        public enum Field: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case trigger
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "trigger": self = .trigger
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .trigger: return "trigger"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Field] = [
                .trigger,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Op: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case `in`
            case notIn
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "in": self = .`in`
                case "notIn": self = .notIn
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .`in`: return "in"
                case .notIn: return "notIn"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Op] = [
                .`in`,
                .notIn,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var field: Field
        public var op: Op
        public var values: [AlertTrigger]

        public init(
            field: Field,
            op: Op,
            values: [AlertTrigger]
        ) {
            self.field = field
            self.op = op
            self.values = values
        }
    }

    public struct AlertConditionObject2: Codable, Hashable, Sendable {
        public enum Field: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case severity
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "severity": self = .severity
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .severity: return "severity"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Field] = [
                .severity,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Op: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case gte
            case eq
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "gte": self = .gte
                case "eq": self = .eq
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .gte: return "gte"
                case .eq: return "eq"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Op] = [
                .gte,
                .eq,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var field: Field
        public var op: Op
        public var severity: AlertSeverity

        public init(
            field: Field,
            op: Op,
            severity: AlertSeverity
        ) {
            self.field = field
            self.op = op
            self.severity = severity
        }
    }

    public struct AlertConditionObject3: Codable, Hashable, Sendable {
        public enum Field: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case accountId
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "accountId": self = .accountId
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .accountId: return "accountId"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Field] = [
                .accountId,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Op: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case `in`
            case notIn
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "in": self = .`in`
                case "notIn": self = .notIn
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .`in`: return "in"
                case .notIn: return "notIn"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Op] = [
                .`in`,
                .notIn,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var field: Field
        public var op: Op
        public var values: [String]

        public init(
            field: Field,
            op: Op,
            values: [String]
        ) {
            self.field = field
            self.op = op
            self.values = values
        }
    }

    public struct AlertConditionObject4: Codable, Hashable, Sendable {
        public enum Field: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case pluginId
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "pluginId": self = .pluginId
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .pluginId: return "pluginId"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Field] = [
                .pluginId,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Op: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case `in`
            case notIn
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "in": self = .`in`
                case "notIn": self = .notIn
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .`in`: return "in"
                case .notIn: return "notIn"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Op] = [
                .`in`,
                .notIn,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var field: Field
        public var op: Op
        public var values: [String]

        public init(
            field: Field,
            op: Op,
            values: [String]
        ) {
            self.field = field
            self.op = op
            self.values = values
        }
    }

    public struct AlertConditionObject5: Codable, Hashable, Sendable {
        public enum Field: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case resourceTypeId
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "resourceTypeId": self = .resourceTypeId
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .resourceTypeId: return "resourceTypeId"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Field] = [
                .resourceTypeId,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Op: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case `in`
            case notIn
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "in": self = .`in`
                case "notIn": self = .notIn
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .`in`: return "in"
                case .notIn: return "notIn"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Op] = [
                .`in`,
                .notIn,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var field: Field
        public var op: Op
        public var values: [String]

        public init(
            field: Field,
            op: Op,
            values: [String]
        ) {
            self.field = field
            self.op = op
            self.values = values
        }
    }

    public struct AlertConditionObject6: Codable, Hashable, Sendable {
        public enum Field: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case amountCents
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "amountCents": self = .amountCents
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .amountCents: return "amountCents"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Field] = [
                .amountCents,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Op: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case gte
            case lt
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "gte": self = .gte
                case "lt": self = .lt
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .gte: return "gte"
                case .lt: return "lt"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Op] = [
                .gte,
                .lt,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var field: Field
        public var op: Op
        public var cents: Int

        public init(
            field: Field,
            op: Op,
            cents: Int
        ) {
            self.field = field
            self.op = op
            self.cents = cents
        }
    }

    public struct AlertConditionObject7: Codable, Hashable, Sendable {
        public enum Field: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case key
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "key": self = .key
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .key: return "key"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Field] = [
                .key,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Op: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case contains
            case notContains
            case eq
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "contains": self = .contains
                case "notContains": self = .notContains
                case "eq": self = .eq
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .contains: return "contains"
                case .notContains: return "notContains"
                case .eq: return "eq"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Op] = [
                .contains,
                .notContains,
                .eq,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var field: Field
        public var op: Op
        public var value: String

        public init(
            field: Field,
            op: Op,
            value: String
        ) {
            self.field = field
            self.op = op
            self.value = value
        }
    }

    public struct AlertConditionObject8: Codable, Hashable, Sendable {
        public enum Field: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case text
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "text": self = .text
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .text: return "text"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Field] = [
                .text,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Op: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case contains
            case notContains
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "contains": self = .contains
                case "notContains": self = .notContains
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .contains: return "contains"
                case .notContains: return "notContains"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Op] = [
                .contains,
                .notContains,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var field: Field
        public var op: Op
        public var value: String

        public init(
            field: Field,
            op: Op,
            value: String
        ) {
            self.field = field
            self.op = op
            self.value = value
        }
    }

    case object(AlertConditionObject)
    case object2(AlertConditionObject2)
    case object3(AlertConditionObject3)
    case object4(AlertConditionObject4)
    case object5(AlertConditionObject5)
    case object6(AlertConditionObject6)
    case object7(AlertConditionObject7)
    case object8(AlertConditionObject8)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(AlertConditionObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(AlertConditionObject2.self) {
            self = .object2(value)
            return
        }
        if let value = try? container.decode(AlertConditionObject3.self) {
            self = .object3(value)
            return
        }
        if let value = try? container.decode(AlertConditionObject4.self) {
            self = .object4(value)
            return
        }
        if let value = try? container.decode(AlertConditionObject5.self) {
            self = .object5(value)
            return
        }
        if let value = try? container.decode(AlertConditionObject6.self) {
            self = .object6(value)
            return
        }
        if let value = try? container.decode(AlertConditionObject7.self) {
            self = .object7(value)
            return
        }
        if let value = try? container.decode(AlertConditionObject8.self) {
            self = .object8(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value): try container.encode(value)
        case .object2(let value): try container.encode(value)
        case .object3(let value): try container.encode(value)
        case .object4(let value): try container.encode(value)
        case .object5(let value): try container.encode(value)
        case .object6(let value): try container.encode(value)
        case .object7(let value): try container.encode(value)
        case .object8(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
