/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// What the money bought. `network` is load balancers; `compute` is CPU and
/// memory together, and only appears on rows collected before the two were
/// written apart.
public enum KubernetesCostCategory: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case cpu
    case memory
    case gpu
    case storage
    case network
    case controlPlane
    case compute
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "cpu": self = .cpu
        case "memory": self = .memory
        case "gpu": self = .gpu
        case "storage": self = .storage
        case "network": self = .network
        case "control_plane": self = .controlPlane
        case "compute": self = .compute
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .cpu: return "cpu"
        case .memory: return "memory"
        case .gpu: return "gpu"
        case .storage: return "storage"
        case .network: return "network"
        case .controlPlane: return "control_plane"
        case .compute: return "compute"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [KubernetesCostCategory] = [
        .cpu,
        .memory,
        .gpu,
        .storage,
        .network,
        .controlPlane,
        .compute,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
