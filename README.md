# Tools Repository

A comprehensive collection of AI/ML tools, MCP servers, SDKs, and sample applications for modern development workflows.

## 🚀 Repository Overview

This repository contains a curated collection of tools and frameworks organized into focused categories:

### 🛠️ [Core Tooling and CLI](./core_tooling_and_cli/)
Essential command-line tools and developer utilities:
- **MCP Developer SubAgent** - Developer assistance tools
- **MCP Server Creator** - Server scaffolding and creation tools
- **MCP CLI Host** - Command-line interface hosting
- **MCP Create** - Project creation utilities
- **MCP Discovery** - Service discovery tools
- **MCP Language Server** - Language server implementations
- **MCP Proxy** - Proxy and routing tools

### 🌐 [MCP Servers and Integrations](./mcp_servers_and_integrations/)
Model Context Protocol server implementations and integrations:
- **A2A MCP Server** - Agent-to-agent communication
- **GitHub Enterprise MCP** - GitHub Enterprise integration
- **Database Integrations** - MongoDB, Redis, SQLite support
- **Vector Databases** - Chroma, Pinecone integrations
- **Specialized Servers** - Healthcare, legal, voice lab integrations

### 🏗️ [Platforms and Specialized Projects](./platforms_and_specialized_projects/)
Domain-specific platforms and specialized implementations:
- **Healthcare Platforms** - Medical and healthcare tools
- **Operations Agent** - DevOps and operational tooling
- **Workload Agent Platform** - Resource management systems
- **Page Voither** - Web application framework

### 📱 [Sample Apps and Templates](./sample_apps_and_templates/)
Ready-to-use applications and project templates:
- **Agent Starter Pack** - Quick-start templates for AI agents
- **GenAI Applications** - Generative AI sample apps
- **Database Retrieval Apps** - Data retrieval and processing
- **Language-specific Samples** - Go, Python, and other language examples

### 📚 [SDKs and Frameworks](./sdks_and_frameworks/)
Software development kits and frameworks:
- **Multi-language SDKs** - Go, Python implementations
- **FastMCP** - High-performance MCP framework
- **Cognee** - Cognitive computing framework
- **Fast Agent** - Rapid agent development tools

### 🔧 [GenKit Introduction](./genkit-intro/)
Google AI GenKit integration and examples

## 🚀 Quick Start

### Prerequisites
- **Node.js** 18+ (for JavaScript/TypeScript projects)
- **Python** 3.8+ (for Python projects)
- **Go** 1.19+ (for Go projects)
- **Docker** (optional, for containerized development)

### Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/myselfgus/tools.git
   cd tools
   ```

2. **Choose your project area:**
   ```bash
   # For MCP server development
   cd mcp_servers_and_integrations
   
   # For sample applications
   cd sample_apps_and_templates
   
   # For SDK development
   cd sdks_and_frameworks
   ```

3. **Follow project-specific README instructions** in each directory

### Development Environments

#### GitHub Codespaces
Click the "Code" button and select "Open with Codespaces" for an instant development environment.

#### Local Development with Docker
```bash
# Build development container
docker build -t tools-dev .

# Run interactive development session
docker run -it -v $(pwd):/workspace tools-dev
```

#### Manual Setup
Each project directory contains specific setup instructions in its README.md file.

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details on:
- Code style and standards
- Pull request process
- Issue reporting
- Development workflow

## 📋 Project Structure

```
tools/
├── core_tooling_and_cli/        # Essential CLI tools and utilities
├── mcp_servers_and_integrations/ # MCP server implementations
├── platforms_and_specialized_projects/ # Domain-specific platforms
├── sample_apps_and_templates/   # Example applications and templates
├── sdks_and_frameworks/         # Development frameworks and SDKs
├── genkit-intro/               # Google AI GenKit examples
├── .github/                    # GitHub workflows and templates
├── docs/                       # Documentation and guides
└── scripts/                    # Utility scripts
```

## 🔍 Finding Projects

### By Technology Stack
- **Python Projects**: Search for `pyproject.toml` or `requirements.txt` files
- **Node.js Projects**: Look for `package.json` files
- **Go Projects**: Find `go.mod` files
- **Docker Projects**: Locate `Dockerfile` or `docker-compose.yml` files

### By Use Case
- **AI/ML Development**: Check `sample_apps_and_templates/genai-*` directories
- **Database Integration**: Explore `mcp_servers_and_integrations/*-mcp` projects
- **CLI Tools**: Browse `core_tooling_and_cli/` directory
- **Platform Development**: Review `platforms_and_specialized_projects/`

## 📖 Documentation

- [API Documentation](docs/api/) - Comprehensive API references
- [Getting Started Guide](docs/getting-started.md) - Detailed setup instructions
- [Architecture Overview](docs/architecture.md) - System design and patterns
- [Best Practices](docs/best-practices.md) - Development guidelines
- [FAQ](docs/faq.md) - Frequently asked questions

## 🔒 Security

Please report security vulnerabilities to our [Security Policy](SECURITY.md). Do not open public issues for security concerns.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🌟 Support

- **Issues**: [GitHub Issues](https://github.com/myselfgus/tools/issues)
- **Discussions**: [GitHub Discussions](https://github.com/myselfgus/tools/discussions)
- **Documentation**: [Project Docs](docs/)

## 🚀 Roadmap

- [ ] Enhanced MCP server ecosystem
- [ ] Improved SDK documentation and examples
- [ ] Additional platform integrations
- [ ] Performance optimization tools
- [ ] Advanced monitoring and analytics

---

**Made with ❤️ by the Tools Community**