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

/// "Per N units": multiplies a ratio (cost per 1,000 requests) and divides a raw
/// metric. Margin ignores it. Absent is 1.
///
/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum UnitCostScale: Codable, Hashable, Sendable {
    case double(Double)
    case double2(Double)
    case double3(Double)
    case double4(Double)
    case double5(Double)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Double.self) {
            self = .double(value)
            return
        }
        if let value = try? container.decode(Double.self) {
            self = .double2(value)
            return
        }
        if let value = try? container.decode(Double.self) {
            self = .double3(value)
            return
        }
        if let value = try? container.decode(Double.self) {
            self = .double4(value)
            return
        }
        if let value = try? container.decode(Double.self) {
            self = .double5(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let value): try container.encode(value)
        case .double2(let value): try container.encode(value)
        case .double3(let value): try container.encode(value)
        case .double4(let value): try container.encode(value)
        case .double5(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
