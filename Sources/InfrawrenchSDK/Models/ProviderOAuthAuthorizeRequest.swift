/*
 * InfrawrenchSDK v1.80.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.80.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ProviderOAuthAuthorizeRequest: Codable, Hashable, Sendable {
    public enum ReturnTo: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case web
        case desktop
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "web": self = .web
            case "desktop": self = .desktop
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .web: return "web"
            case .desktop: return "desktop"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [ReturnTo] = [
            .web,
            .desktop,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// `web`: the callback page posts the result to the window that opened it
    /// (`window.opener.postMessage`, targeted at this server's app origin).
    /// `desktop`: the callback redirects to
    /// `infrawrench://provider-oauth?payload=<base64url JSON>`.
    public var returnTo: ReturnTo
    /// Reconnecting an existing account: its id. Echoed in the result so the
    /// client knows which account to update.
    public var accountId: String?

    public init(
        returnTo: ReturnTo,
        accountId: String? = nil
    ) {
        self.returnTo = returnTo
        self.accountId = accountId
    }
}
