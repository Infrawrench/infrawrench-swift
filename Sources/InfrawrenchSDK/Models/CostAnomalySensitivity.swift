/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostAnomalySensitivity: Codable, Hashable, Sendable {
    public struct Adjustment: Codable, Hashable, Sendable {
        public enum Dimension: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case provider
            case service
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "provider": self = .provider
                case "service": self = .service
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .provider: return "provider"
                case .service: return "service"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Dimension] = [
                .provider,
                .service,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var dimension: Dimension
        public var dimensionKey: String
        public var baseSigmas: Double
        /// The σ this key's spikes are judged against.
        public var sigmas: Double
        public var expectedCount: Int
        public var unexpectedCount: Int
        public var explanation: String

        public init(
            dimension: Dimension,
            dimensionKey: String,
            baseSigmas: Double,
            sigmas: Double,
            expectedCount: Int,
            unexpectedCount: Int,
            explanation: String
        ) {
            self.dimension = dimension
            self.dimensionKey = dimensionKey
            self.baseSigmas = baseSigmas
            self.sigmas = sigmas
            self.expectedCount = expectedCount
            self.unexpectedCount = unexpectedCount
            self.explanation = explanation
        }
    }

    /// The `feedbackTuning` setting; false means no key moves.
    public var enabled: Bool
    public var windowDays: Int
    public var baseSigmas: Double
    public var adjustments: [Adjustment]

    public init(
        enabled: Bool,
        windowDays: Int,
        baseSigmas: Double,
        adjustments: [Adjustment]
    ) {
        self.enabled = enabled
        self.windowDays = windowDays
        self.baseSigmas = baseSigmas
        self.adjustments = adjustments
    }
}
