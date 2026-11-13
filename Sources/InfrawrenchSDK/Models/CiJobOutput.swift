/*
 * InfrawrenchSDK v1.106.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.106.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiJobOutput: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case passed
        case failed
        case skipped
        case error
        case cancelled
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "passed": self = .passed
            case "failed": self = .failed
            case "skipped": self = .skipped
            case "error": self = .error
            case "cancelled": self = .cancelled
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .passed: return "passed"
            case .failed: return "failed"
            case .skipped: return "skipped"
            case .error: return "error"
            case .cancelled: return "cancelled"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .passed,
            .failed,
            .skipped,
            .error,
            .cancelled,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum DurationMs: Codable, Hashable, Sendable {
        public enum DurationMsDurationMs: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case infinity
            case infinity2
            case naN
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "Infinity": self = .infinity
                case "-Infinity": self = .infinity2
                case "NaN": self = .naN
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .infinity: return "Infinity"
                case .infinity2: return "-Infinity"
                case .naN: return "NaN"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [DurationMsDurationMs] = [
                .infinity,
                .infinity2,
                .naN,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        case double(Double)
        case durationMs(DurationMsDurationMs)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(Double.self) {
                self = .double(value)
                return
            }
            if let value = try? container.decode(DurationMsDurationMs.self) {
                self = .durationMs(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .double(let value): try container.encode(value)
            case .durationMs(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    public var pipeline: String
    public var id: String
    public var name: String
    public var status: Status
    public var reason: String?
    public var durationMs: DurationMs?
    /// The job keys it waited for, as the pipeline's `needs:` expanded them.
    /// Absent from runs before runner 0.3.1.
    public var needs: [String]?
    public var stdout: String
    public var stderr: String
    /// The files the job kept with `downloads:`. Absent when it kept none.
    public var downloads: [CiDownload]?

    public init(
        pipeline: String,
        id: String,
        name: String,
        status: Status,
        reason: String? = nil,
        durationMs: DurationMs? = nil,
        needs: [String]? = nil,
        stdout: String,
        stderr: String,
        downloads: [CiDownload]? = nil
    ) {
        self.pipeline = pipeline
        self.id = id
        self.name = name
        self.status = status
        self.reason = reason
        self.durationMs = durationMs
        self.needs = needs
        self.stdout = stdout
        self.stderr = stderr
        self.downloads = downloads
    }
}
