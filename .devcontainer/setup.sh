#!/bin/bash
# MCP-powered development environment setup script

set -e

echo "🚀 Setting up MCP-powered development environment..."

# Install Python dependencies for MCP orchestrator
echo "📦 Installing Python dependencies..."
pip install --user pyyaml aiohttp pydantic asyncio-mqtt websockets

# Install Node.js dependencies for web interfaces
echo "📦 Installing Node.js global tools..."
npm install -g typescript ts-node nodemon

# Install Go tools
echo "📦 Installing Go tools..."
go install github.com/air-verse/air@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# Setup MCP directories and permissions
echo "🔧 Setting up MCP infrastructure..."
mkdir -p /tmp/mcp-logs
mkdir -p /tmp/mcp-cache
chmod 755 .mcp/orchestrator.py

# Initialize MCP servers
echo "🔌 Initializing MCP servers..."
python .mcp/orchestrator.py --action=discover > /tmp/mcp-discovery.json

# Setup Git hooks for MCP integration
echo "🔗 Setting up Git hooks..."
mkdir -p .git/hooks

cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# MCP-powered pre-commit hook

echo "🔍 Running MCP-powered pre-commit checks..."

# Run MCP discovery to check for optimization opportunities
python .mcp/orchestrator.py --action=discover > /tmp/pre-commit-analysis.json

# Check if any MCP servers need updates
OPTIMIZATION_NEEDED=$(cat /tmp/pre-commit-analysis.json | jq -r '.optimization_opportunities | length')

if [ "$OPTIMIZATION_NEEDED" -gt 0 ]; then
    echo "⚠️  Repository optimization opportunities detected:"
    cat /tmp/pre-commit-analysis.json | jq -r '.optimization_opportunities[]'
    echo "💡 Consider running: python .mcp/orchestrator.py --action=optimize"
fi

echo "✅ Pre-commit checks completed"
EOF

chmod +x .git/hooks/pre-commit

# Setup development aliases
echo "⚡ Creating development aliases..."
cat >> ~/.bashrc << 'EOF'

# MCP Development Aliases
alias mcp-status='python .mcp/orchestrator.py --action=discover'
alias mcp-optimize='python .mcp/orchestrator.py --action=optimize'
alias mcp-servers='find . -name "server.py" -path "*/mcp_servers_and_integrations/*" -o -path "*/core_tooling_and_cli/*"'
alias mcp-logs='tail -f /tmp/mcp-logs/*.log'

# Quick development commands
alias dev-python='python -m venv venv && source venv/bin/activate'
alias dev-node='npm init -y && npm install'
alias dev-go='go mod init $(basename $PWD)'

# MCP server development
alias new-mcp-server='python .mcp/orchestrator.py --action=create-server'
alias test-mcp-servers='find . -name "server.py" -exec python {} --test \;'

echo "🔌 MCP Development Environment Ready!"
echo "Available commands:"
echo "  mcp-status     - Check repository status"
echo "  mcp-optimize   - Run optimization workflow"
echo "  mcp-servers    - List all MCP servers"
echo "  mcp-logs       - View MCP server logs"
EOF

# Create development workspace configuration
echo "📝 Creating workspace configuration..."
mkdir -p .vscode

cat > .vscode/settings.json << 'EOF'
{
  "python.defaultInterpreterPath": "/usr/local/python/current/bin/python",
  "python.terminal.activateEnvironment": true,
  "python.formatting.provider": "black",
  "python.linting.enabled": true,
  "python.linting.mypyEnabled": true,
  "go.toolsManagement.checkForUpdates": "local",
  "files.associations": {
    "*.mcp": "json",
    "*.mcpconfig": "yaml"
  },
  "search.exclude": {
    "**/node_modules": true,
    "**/venv": true,
    "**/.git": true,
    "**/tmp": true,
    "**/cache": true
  },
  "github.copilot.enable": {
    "*": true,
    "yaml": true,
    "plaintext": true,
    "markdown": true
  },
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.organizeImports": true
  }
}
EOF

cat > .vscode/tasks.json << 'EOF'
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "MCP: Discover Repository",
      "type": "shell",
      "command": "python",
      "args": [".mcp/orchestrator.py", "--action=discover"],
      "group": "build",
      "presentation": {
        "echo": true,
        "reveal": "always",
        "focus": false,
        "panel": "shared"
      }
    },
    {
      "label": "MCP: Optimize Repository",
      "type": "shell",
      "command": "python",
      "args": [".mcp/orchestrator.py", "--action=optimize"],
      "group": "build",
      "presentation": {
        "echo": true,
        "reveal": "always",
        "focus": false,
        "panel": "shared"
      }
    },
    {
      "label": "MCP: Test All Servers",
      "type": "shell",
      "command": "find",
      "args": [".", "-name", "server.py", "-exec", "python", "{}", "--test", ";"],
      "group": "test",
      "presentation": {
        "echo": true,
        "reveal": "always",
        "focus": false,
        "panel": "shared"
      }
    }
  ]
}
EOF

cat > .vscode/launch.json << 'EOF'
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "MCP Orchestrator",
      "type": "python",
      "request": "launch",
      "program": ".mcp/orchestrator.py",
      "console": "integratedTerminal",
      "cwd": "${workspaceFolder}",
      "env": {
        "MCP_ENVIRONMENT": "development"
      }
    },
    {
      "name": "Debug MCP Server",
      "type": "python",
      "request": "launch",
      "program": "${file}",
      "console": "integratedTerminal",
      "cwd": "${fileDirname}",
      "args": ["--debug"]
    }
  ]
}
EOF

# Create project-specific documentation
echo "📚 Creating MCP documentation..."
mkdir -p docs/mcp

cat > docs/mcp/README.md << 'EOF'
# MCP-Powered Development Environment

This repository uses Model Context Protocol (MCP) servers for intelligent automation and development assistance.

## Available MCP Servers

### Core Infrastructure
- **MCP Orchestrator** - Central coordination and workflow management
- **MCP Discovery** - Service registry and capability mapping
- **MCP Server Creator** - Automated server scaffolding

### GitHub Integration
- **GitHub Enterprise MCP** - Repository automation and workflow management
- **Chat MCP** - Conversational interface for development tasks

### Data & Storage
- **MongoDB MCP** - Document database integration
- **Redis MCP** - Caching and session management
- **SQLite MCP** - Lightweight database operations

### AI & Search
- **Chroma MCP** - Vector search and semantic analysis
- **Pinecone MCP** - Advanced vector operations
- **Computer Control MCP** - System automation

## Quick Start

1. **Discovery**: `mcp-status` - Analyze repository structure
2. **Optimization**: `mcp-optimize` - Apply best practices
3. **Development**: Use VS Code tasks and debugging configurations

## MCP Workflows

### Repository Optimization
```bash
python .mcp/orchestrator.py --action=optimize
```

### Code Analysis
```bash
python .mcp/orchestrator.py --action=analyze-code
```

### Server Management
```bash
# List all servers
mcp-servers

# Test server functionality
test-mcp-servers

# View logs
mcp-logs
```

## Integration with GitHub Copilot

This environment is optimized for GitHub Copilot with:
- MCP-aware code suggestions
- Intelligent workflow recommendations
- Automated documentation generation
- Context-aware development assistance

## Customization

Edit `.mcp/config.json` to modify server configurations and workflows.
EOF

echo "✅ MCP development environment setup completed!"
echo ""
echo "🔌 MCP Servers configured and ready"
echo "⚡ Development aliases installed"
echo "🎨 VS Code workspace configured"
echo "📚 Documentation created"
echo ""
echo "Run 'mcp-status' to check repository status"
echo "Run 'mcp-optimize' to apply optimizations"