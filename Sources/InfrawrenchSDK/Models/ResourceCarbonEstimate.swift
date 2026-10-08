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

/// Estimated monthly CO2e of the same configuration, beside its price. Null for a
/// peer resource or when the size catalogue could not be read.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct ResourceCarbonEstimate: Codable, Hashable, Sendable {
    public enum Reason: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case unsupportedProvider
        case unknownRegion
        case unknownSize
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "unsupported-provider": self = .unsupportedProvider
            case "unknown-region": self = .unknownRegion
            case "unknown-size": self = .unknownSize
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .unsupportedProvider: return "unsupported-provider"
            case .unknownRegion: return "unknown-region"
            case .unknownSize: return "unknown-size"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Reason] = [
            .unsupportedProvider,
            .unknownRegion,
            .unknownSize,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Role2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case instance
        case aggregate
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "instance": self = .instance
            case "aggregate": self = .aggregate
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .instance: return "instance"
            case .aggregate: return "aggregate"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Role2] = [
            .instance,
            .aggregate,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Assumptions: Codable, Hashable, Sendable {
        /// Assumed average CPU utilisation, 0 to 1. **The largest single source
        /// of error**, stated here rather than buried in a constant: the product
        /// does not collect per-resource CPU history for every provider, and a
        /// figure derived from the few that do would be quietly inconsistent
        /// across an estate.
        public var cpuUtilization: Double
        public var coefficientSource: String
        public var coefficientVintage: String
        /// What the estimate covers, in one sentence a reader can check.
        public var scope: String

        public init(
            cpuUtilization: Double,
            coefficientSource: String,
            coefficientVintage: String,
            scope: String
        ) {
            self.cpuUtilization = cpuUtilization
            self.coefficientSource = coefficientSource
            self.coefficientVintage = coefficientVintage
            self.scope = scope
        }
    }

    public var estimate: CarbonFootprint?
    /// Why a resource has no estimate. Reported per resource rather than folded
    /// into the total: a figure that quietly excluded a third of the estate would
    /// read as a complete answer.
    public var reason: Reason?
    /// False when the type declares nothing to read: a bucket, a DNS record.
    public var inScope: Bool
    /// `aggregate`: a group (a managed cluster) whose machines are also listed in
    /// their own right; shown per resource, never summed into the org total.
    public var role: Role2
    public var assumptions: Assumptions

    public init(
        estimate: CarbonFootprint? = nil,
        reason: Reason? = nil,
        inScope: Bool,
        role: Role2,
        assumptions: Assumptions
    ) {
        self.estimate = estimate
        self.reason = reason
        self.inScope = inScope
        self.role = role
        self.assumptions = assumptions
    }
}
