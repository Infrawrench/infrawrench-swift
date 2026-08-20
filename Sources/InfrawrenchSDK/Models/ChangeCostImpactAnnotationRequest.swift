/*
 * InfrawrenchSDK v1.33.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.33.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChangeCostImpactAnnotationRequest: Codable, Hashable, Sendable {
    public enum SubjectKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case change
        case deployment
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "change": self = .change
            case "deployment": self = .deployment
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .change: return "change"
            case .deployment: return "deployment"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [SubjectKind] = [
            .change,
            .deployment,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var subjectKind: SubjectKind
    public var subjectId: String
    public var windowDays: Int?
    public var costBasis: ChangeCostBasis?

    public init(
        subjectKind: SubjectKind,
        subjectId: String,
        windowDays: Int? = nil,
        costBasis: ChangeCostBasis? = nil
    ) {
        self.subjectKind = subjectKind
        self.subjectId = subjectId
        self.windowDays = windowDays
        self.costBasis = costBasis
    }
}
