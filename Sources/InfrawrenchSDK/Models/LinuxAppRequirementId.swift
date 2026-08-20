/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// gzip unpacks the uploaded app server; xkb is the keyboard layout data
/// xkbcommon compiles a keymap from; dbus is the session bus GTK applications
/// wait for; fonts, mesa and icons decide what an application then looks like.
public enum LinuxAppRequirementId: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case gzip
    case xkb
    case dbus
    case fonts
    case mesa
    case icons
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "gzip": self = .gzip
        case "xkb": self = .xkb
        case "dbus": self = .dbus
        case "fonts": self = .fonts
        case "mesa": self = .mesa
        case "icons": self = .icons
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .gzip: return "gzip"
        case .xkb: return "xkb"
        case .dbus: return "dbus"
        case .fonts: return "fonts"
        case .mesa: return "mesa"
        case .icons: return "icons"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [LinuxAppRequirementId] = [
        .gzip,
        .xkb,
        .dbus,
        .fonts,
        .mesa,
        .icons,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
