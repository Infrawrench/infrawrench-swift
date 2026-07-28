/*
 * InfrawrenchSDK v0.9.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.9.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Manifest id of an installed plugin.
public enum PluginId: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case aws
    case azure
    case clickhouse
    case cloudflare
    case cloudinary
    case databricks
    case digitalocean
    case docker
    case fly
    case gcp
    case hetzner
    case kafka
    case kubernetes
    case memcached
    case mongodb
    case mssql
    case mysql
    case neon
    case netlify
    case opensearch
    case ovh
    case planetscale
    case postgres
    case redis
    case scaleway
    case ssh
    case turso
    case vercel
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "aws": self = .aws
        case "azure": self = .azure
        case "clickhouse": self = .clickhouse
        case "cloudflare": self = .cloudflare
        case "cloudinary": self = .cloudinary
        case "databricks": self = .databricks
        case "digitalocean": self = .digitalocean
        case "docker": self = .docker
        case "fly": self = .fly
        case "gcp": self = .gcp
        case "hetzner": self = .hetzner
        case "kafka": self = .kafka
        case "kubernetes": self = .kubernetes
        case "memcached": self = .memcached
        case "mongodb": self = .mongodb
        case "mssql": self = .mssql
        case "mysql": self = .mysql
        case "neon": self = .neon
        case "netlify": self = .netlify
        case "opensearch": self = .opensearch
        case "ovh": self = .ovh
        case "planetscale": self = .planetscale
        case "postgres": self = .postgres
        case "redis": self = .redis
        case "scaleway": self = .scaleway
        case "ssh": self = .ssh
        case "turso": self = .turso
        case "vercel": self = .vercel
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .aws: return "aws"
        case .azure: return "azure"
        case .clickhouse: return "clickhouse"
        case .cloudflare: return "cloudflare"
        case .cloudinary: return "cloudinary"
        case .databricks: return "databricks"
        case .digitalocean: return "digitalocean"
        case .docker: return "docker"
        case .fly: return "fly"
        case .gcp: return "gcp"
        case .hetzner: return "hetzner"
        case .kafka: return "kafka"
        case .kubernetes: return "kubernetes"
        case .memcached: return "memcached"
        case .mongodb: return "mongodb"
        case .mssql: return "mssql"
        case .mysql: return "mysql"
        case .neon: return "neon"
        case .netlify: return "netlify"
        case .opensearch: return "opensearch"
        case .ovh: return "ovh"
        case .planetscale: return "planetscale"
        case .postgres: return "postgres"
        case .redis: return "redis"
        case .scaleway: return "scaleway"
        case .ssh: return "ssh"
        case .turso: return "turso"
        case .vercel: return "vercel"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [PluginId] = [
        .aws,
        .azure,
        .clickhouse,
        .cloudflare,
        .cloudinary,
        .databricks,
        .digitalocean,
        .docker,
        .fly,
        .gcp,
        .hetzner,
        .kafka,
        .kubernetes,
        .memcached,
        .mongodb,
        .mssql,
        .mysql,
        .neon,
        .netlify,
        .opensearch,
        .ovh,
        .planetscale,
        .postgres,
        .redis,
        .scaleway,
        .ssh,
        .turso,
        .vercel,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
