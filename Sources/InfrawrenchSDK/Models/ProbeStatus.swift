/*
 * InfrawrenchSDK v0.1.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.1.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ProbeStatus: Codable, Hashable, Sendable {
    public enum Phase: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case ok
        case loading
        case error
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "ok": self = .ok
            case "loading": self = .loading
            case "error": self = .error
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .ok: return "ok"
            case .loading: return "loading"
            case .error: return "error"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Phase] = [
            .ok,
            .loading,
            .error,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Sparkline: Codable, Hashable, Sendable {
        public var ts: Double
        public var value: Double

        public init(
            ts: Double,
            value: Double
        ) {
            self.ts = ts
            self.value = value
        }
    }

    public struct ResourceCount: Codable, Hashable, Sendable {
        public var typeId: String
        public var count: Int

        public init(
            typeId: String,
            count: Int
        ) {
            self.typeId = typeId
            self.count = count
        }
    }

    public var phase: Phase
    public var error: String?
    public var stats: [JsonObject]?
    public var sparkline: [Sparkline]?
    public var sparklineLabel: String?
    public var resourceCounts: [ResourceCount]?

    public init(
        phase: Phase,
        error: String? = nil,
        stats: [JsonObject]? = nil,
        sparkline: [Sparkline]? = nil,
        sparklineLabel: String? = nil,
        resourceCounts: [ResourceCount]? = nil
    ) {
        self.phase = phase
        self.error = error
        self.stats = stats
        self.sparkline = sparkline
        self.sparklineLabel = sparklineLabel
        self.resourceCounts = resourceCounts
    }
}
