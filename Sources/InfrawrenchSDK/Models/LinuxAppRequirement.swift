/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LinuxAppRequirement: Codable, Hashable, Sendable {
    public enum Severity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case `required`
        case recommended
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "required": self = .`required`
            case "recommended": self = .recommended
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .`required`: return "required"
            case .recommended: return "recommended"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Severity] = [
            .`required`,
            .recommended,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var id: LinuxAppRequirementId
    public var severity: Severity
    public var title: String
    public var summary: String
    public var ok: Bool

    public init(
        id: LinuxAppRequirementId,
        severity: Severity,
        title: String,
        summary: String,
        ok: Bool
    ) {
        self.id = id
        self.severity = severity
        self.title = title
        self.summary = summary
        self.ok = ok
    }
}
