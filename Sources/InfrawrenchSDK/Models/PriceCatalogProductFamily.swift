/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public enum PriceCatalogProductFamily: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case compute
    case gpu
    case database
    case kubernetesNode
    case storage
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "compute": self = .compute
        case "gpu": self = .gpu
        case "database": self = .database
        case "kubernetes-node": self = .kubernetesNode
        case "storage": self = .storage
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .compute: return "compute"
        case .gpu: return "gpu"
        case .database: return "database"
        case .kubernetesNode: return "kubernetes-node"
        case .storage: return "storage"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [PriceCatalogProductFamily] = [
        .compute,
        .gpu,
        .database,
        .kubernetesNode,
        .storage,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
