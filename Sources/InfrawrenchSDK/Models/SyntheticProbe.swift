/*
 * InfrawrenchSDK v0.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SyntheticProbe: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case up
        case down
        case unknown
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "up": self = .up
            case "down": self = .down
            case "unknown": self = .unknown
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .up: return "up"
            case .down: return "down"
            case .unknown: return "unknown"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .up,
            .down,
            .unknown,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var id: String
    public var name: String
    /// Absolute http(s) URL the check hits from the edge proxy.
    public var url: String
    /// HTTP method the probe uses — GET, HEAD or OPTIONS. Unknown values become
    /// GET.
    public var method: String
    /// Seconds between checks. Clamped server-side to 60–86400.
    public var intervalSeconds: Int
    /// Per-check timeout in milliseconds. Clamped server-side to 1000–60000.
    public var timeoutMs: Int
    /// Consecutive failures before the probe flips to `down` and notifies.
    /// Clamped 1–20.
    public var failureThreshold: Int
    public var enabled: Bool
    /// Account of the linked resource, when the URL came from one.
    public var accountId: String?
    /// Linked resource id; advisory, not a foreign key.
    public var resourceId: String?
    public var pluginId: PluginId?
    public var resourceTypeId: String?
    /// The resource output/field key the URL was suggested from.
    public var outputKey: String?
    /// The probe's state machine: `unknown` until the first result, `down` after
    /// `failureThreshold` consecutive failures, `up` on any success.
    public var status: Status
    public var consecutiveFailures: Int
    public var lastProbeAt: String?
    public var lastStatusCode: Int?
    public var lastLatencyMs: Int?
    /// Failure detail; null after a success.
    public var lastError: String?
    /// When status last flipped up/down.
    public var lastStateChangeAt: String?
    /// Fraction (0–1) of the trailing 24h the endpoint was up, from the recorded
    /// series; null before the first result lands in the metric store.
    public var uptime24h: Double?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        url: String,
        method: String,
        intervalSeconds: Int,
        timeoutMs: Int,
        failureThreshold: Int,
        enabled: Bool,
        accountId: String? = nil,
        resourceId: String? = nil,
        pluginId: PluginId? = nil,
        resourceTypeId: String? = nil,
        outputKey: String? = nil,
        status: Status,
        consecutiveFailures: Int,
        lastProbeAt: String? = nil,
        lastStatusCode: Int? = nil,
        lastLatencyMs: Int? = nil,
        lastError: String? = nil,
        lastStateChangeAt: String? = nil,
        uptime24h: Double? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.url = url
        self.method = method
        self.intervalSeconds = intervalSeconds
        self.timeoutMs = timeoutMs
        self.failureThreshold = failureThreshold
        self.enabled = enabled
        self.accountId = accountId
        self.resourceId = resourceId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.outputKey = outputKey
        self.status = status
        self.consecutiveFailures = consecutiveFailures
        self.lastProbeAt = lastProbeAt
        self.lastStatusCode = lastStatusCode
        self.lastLatencyMs = lastLatencyMs
        self.lastError = lastError
        self.lastStateChangeAt = lastStateChangeAt
        self.uptime24h = uptime24h
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
