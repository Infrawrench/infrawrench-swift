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

public enum CostDimension: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case provider
    case account
    case service
    case region
    case resource
    case tag
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "provider": self = .provider
        case "account": self = .account
        case "service": self = .service
        case "region": self = .region
        case "resource": self = .resource
        case "tag": self = .tag
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .provider: return "provider"
        case .account: return "account"
        case .service: return "service"
        case .region: return "region"
        case .resource: return "resource"
        case .tag: return "tag"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [CostDimension] = [
        .provider,
        .account,
        .service,
        .region,
        .resource,
        .tag,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
