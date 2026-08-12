/*
 * InfrawrenchSDK v1.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.21.0).
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
    case anthropic
    case assemblyai
    case aws
    case azure
    case cartesia
    case clickhouse
    case cloudflare
    case cloudinary
    case cohere
    case databricks
    case deepgram
    case deepseek
    case digitalocean
    case docker
    case elevenlabs
    case fireworks
    case fly
    case gcp
    case gemini
    case gladia
    case groq
    case hetzner
    case kafka
    case kubernetes
    case memcached
    case mistral
    case mongodb
    case mssql
    case mysql
    case neon
    case netlify
    case openai
    case openrouter
    case opensearch
    case ovh
    case planetscale
    case postgres
    case redis
    case replicate
    case revai
    case scaleway
    case speechmatics
    case ssh
    case together
    case turso
    case uploadthing
    case vercel
    case workos
    case xai
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "anthropic": self = .anthropic
        case "assemblyai": self = .assemblyai
        case "aws": self = .aws
        case "azure": self = .azure
        case "cartesia": self = .cartesia
        case "clickhouse": self = .clickhouse
        case "cloudflare": self = .cloudflare
        case "cloudinary": self = .cloudinary
        case "cohere": self = .cohere
        case "databricks": self = .databricks
        case "deepgram": self = .deepgram
        case "deepseek": self = .deepseek
        case "digitalocean": self = .digitalocean
        case "docker": self = .docker
        case "elevenlabs": self = .elevenlabs
        case "fireworks": self = .fireworks
        case "fly": self = .fly
        case "gcp": self = .gcp
        case "gemini": self = .gemini
        case "gladia": self = .gladia
        case "groq": self = .groq
        case "hetzner": self = .hetzner
        case "kafka": self = .kafka
        case "kubernetes": self = .kubernetes
        case "memcached": self = .memcached
        case "mistral": self = .mistral
        case "mongodb": self = .mongodb
        case "mssql": self = .mssql
        case "mysql": self = .mysql
        case "neon": self = .neon
        case "netlify": self = .netlify
        case "openai": self = .openai
        case "openrouter": self = .openrouter
        case "opensearch": self = .opensearch
        case "ovh": self = .ovh
        case "planetscale": self = .planetscale
        case "postgres": self = .postgres
        case "redis": self = .redis
        case "replicate": self = .replicate
        case "revai": self = .revai
        case "scaleway": self = .scaleway
        case "speechmatics": self = .speechmatics
        case "ssh": self = .ssh
        case "together": self = .together
        case "turso": self = .turso
        case "uploadthing": self = .uploadthing
        case "vercel": self = .vercel
        case "workos": self = .workos
        case "xai": self = .xai
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .anthropic: return "anthropic"
        case .assemblyai: return "assemblyai"
        case .aws: return "aws"
        case .azure: return "azure"
        case .cartesia: return "cartesia"
        case .clickhouse: return "clickhouse"
        case .cloudflare: return "cloudflare"
        case .cloudinary: return "cloudinary"
        case .cohere: return "cohere"
        case .databricks: return "databricks"
        case .deepgram: return "deepgram"
        case .deepseek: return "deepseek"
        case .digitalocean: return "digitalocean"
        case .docker: return "docker"
        case .elevenlabs: return "elevenlabs"
        case .fireworks: return "fireworks"
        case .fly: return "fly"
        case .gcp: return "gcp"
        case .gemini: return "gemini"
        case .gladia: return "gladia"
        case .groq: return "groq"
        case .hetzner: return "hetzner"
        case .kafka: return "kafka"
        case .kubernetes: return "kubernetes"
        case .memcached: return "memcached"
        case .mistral: return "mistral"
        case .mongodb: return "mongodb"
        case .mssql: return "mssql"
        case .mysql: return "mysql"
        case .neon: return "neon"
        case .netlify: return "netlify"
        case .openai: return "openai"
        case .openrouter: return "openrouter"
        case .opensearch: return "opensearch"
        case .ovh: return "ovh"
        case .planetscale: return "planetscale"
        case .postgres: return "postgres"
        case .redis: return "redis"
        case .replicate: return "replicate"
        case .revai: return "revai"
        case .scaleway: return "scaleway"
        case .speechmatics: return "speechmatics"
        case .ssh: return "ssh"
        case .together: return "together"
        case .turso: return "turso"
        case .uploadthing: return "uploadthing"
        case .vercel: return "vercel"
        case .workos: return "workos"
        case .xai: return "xai"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [PluginId] = [
        .anthropic,
        .assemblyai,
        .aws,
        .azure,
        .cartesia,
        .clickhouse,
        .cloudflare,
        .cloudinary,
        .cohere,
        .databricks,
        .deepgram,
        .deepseek,
        .digitalocean,
        .docker,
        .elevenlabs,
        .fireworks,
        .fly,
        .gcp,
        .gemini,
        .gladia,
        .groq,
        .hetzner,
        .kafka,
        .kubernetes,
        .memcached,
        .mistral,
        .mongodb,
        .mssql,
        .mysql,
        .neon,
        .netlify,
        .openai,
        .openrouter,
        .opensearch,
        .ovh,
        .planetscale,
        .postgres,
        .redis,
        .replicate,
        .revai,
        .scaleway,
        .speechmatics,
        .ssh,
        .together,
        .turso,
        .uploadthing,
        .vercel,
        .workos,
        .xai,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
