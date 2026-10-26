/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Where the change was learned from: an Infrafile run, a synced provider deploy,
/// a GitHub deployment, one recorded over this API, or the change timeline.
public enum DoraSource: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case infrafile
    case plugin
    case github
    case api
    case changeTimeline
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "infrafile": self = .infrafile
        case "plugin": self = .plugin
        case "github": self = .github
        case "api": self = .api
        case "change_timeline": self = .changeTimeline
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .infrafile: return "infrafile"
        case .plugin: return "plugin"
        case .github: return "github"
        case .api: return "api"
        case .changeTimeline: return "change_timeline"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [DoraSource] = [
        .infrafile,
        .plugin,
        .github,
        .api,
        .changeTimeline,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
