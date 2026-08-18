/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SessionRecording: Codable, Hashable, Sendable {
    public struct Participant: Codable, Hashable, Sendable {
        public enum Role2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case observer
            case driver
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "observer": self = .observer
                case "driver": self = .driver
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .observer: return "observer"
                case .driver: return "driver"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Role2] = [
                .observer,
                .driver,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var userId: String?
        public var userName: String?
        public var role: Role2
        public var joinedAt: String
        public var leftAt: String?

        public init(
            userId: String? = nil,
            userName: String? = nil,
            role: Role2,
            joinedAt: String,
            leftAt: String? = nil
        ) {
            self.userId = userId
            self.userName = userName
            self.role = role
            self.joinedAt = joinedAt
            self.leftAt = leftAt
        }
    }

    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case recording
        case complete
        case truncated
        case abandoned
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "recording": self = .recording
            case "complete": self = .complete
            case "truncated": self = .truncated
            case "abandoned": self = .abandoned
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .recording: return "recording"
            case .complete: return "complete"
            case .truncated: return "truncated"
            case .abandoned: return "abandoned"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .recording,
            .complete,
            .truncated,
            .abandoned,
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
    /// Who opened the session; null when the socket authenticated with an API
    /// key.
    public var userId: String?
    /// Display-name snapshot taken at record time, so a departed member still
    /// reads as one.
    public var userName: String?
    public var accountId: String?
    public var resourceId: String?
    /// Final hop, as dialled.
    public var host: String
    public var port: Int
    public var username: String
    /// 1 for a direct session; higher when it jumped through bastions.
    public var hopCount: Int
    public var cols: Int
    public var rows: Int
    /// True when the cast also contains keystrokes (the org opted into input
    /// capture).
    public var hasInput: Bool
    /// Set when this session was shared with colleagues while it ran.
    public var sharedConsoleId: String?
    /// Everyone who was attached to this session and in what role — the
    /// **highest** role they held, not their role at the end. Null or empty for
    /// an ordinary solo session. Once a session can be shared, `userId` alone
    /// stops answering 'whose hands were on this box'; this does. The cast
    /// carries the same facts in-band as asciicast `"m"` marker events, so a
    /// viewer sees *when* the keyboard moved.
    public var participants: [Participant]?
    /// `recording` (live), `complete` (closed cleanly), `truncated` (hit the
    /// per-session capture ceiling — the tape is a genuine partial and says so),
    /// or `abandoned` (the server handling the session went away before it could
    /// close the row).
    public var status: Status
    /// Terminal bytes captured, before compression.
    public var outputBytes: Int
    public var eventCount: Int
    public var startedAt: String
    public var endedAt: String?
    public var durationMs: Int?

    public init(
        id: String,
        userId: String? = nil,
        userName: String? = nil,
        accountId: String? = nil,
        resourceId: String? = nil,
        host: String,
        port: Int,
        username: String,
        hopCount: Int,
        cols: Int,
        rows: Int,
        hasInput: Bool,
        sharedConsoleId: String? = nil,
        participants: [Participant]? = nil,
        status: Status,
        outputBytes: Int,
        eventCount: Int,
        startedAt: String,
        endedAt: String? = nil,
        durationMs: Int? = nil
    ) {
        self.id = id
        self.userId = userId
        self.userName = userName
        self.accountId = accountId
        self.resourceId = resourceId
        self.host = host
        self.port = port
        self.username = username
        self.hopCount = hopCount
        self.cols = cols
        self.rows = rows
        self.hasInput = hasInput
        self.sharedConsoleId = sharedConsoleId
        self.participants = participants
        self.status = status
        self.outputBytes = outputBytes
        self.eventCount = eventCount
        self.startedAt = startedAt
        self.endedAt = endedAt
        self.durationMs = durationMs
    }
}
