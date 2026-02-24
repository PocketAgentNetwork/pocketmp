<div align="center">

# 📟 PocketMP

**The official skills marketplace for PocketAgent.**

Browse, install, and share skills to extend your agent's capabilities.

</div>

---

## 🎯 What is PocketMP?

PocketMP is a curated collection of skills that agents can learn. Skills are organized knowledge, tools, and capabilities packaged in a standard format.

**Two Collections:**
- **Official** - Curated, reviewed, and maintained by the PocketAgent team
- **Community** - Contributed by the community, use at your own discretion

---

## 🚀 Quick Start

### One-Line Install (Easiest)

```bash
# Install any skill directly with curl
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- web-search

# Or to custom path
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- web-search --path /custom/path
```

### Install from Cloned Repo

```bash
# Clone the marketplace
git clone https://github.com/PocketAgentNetwork/pocketmp.git
cd pocketmp

# Install a specific skill
./scripts/install.sh web-search

# Or install to custom location
./scripts/install.sh --path /custom/path web-search
```

### List Available Skills

```bash
# Via curl
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --list

# Or from cloned repo
./scripts/install.sh --list
```

### Get Skill Info

```bash
# Via curl
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --info web-search

# Or from cloned repo
./scripts/install.sh --info web-search
```

### Remove a Skill

```bash
# Via curl
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --remove web-search

# Or from cloned repo
./scripts/install.sh --remove web-search
```

### Browse Skills

**Official Skills:**
- [skill-maker](official/skill-maker/) - Learn how to create new skills
- [agent-maker](official/agent-maker/) - Learn how to create new agents
- [marketplace](official/marketplace/) - Learn how to use the skills marketplace
- [web-search](official/web-search/) - Search the web effectively
- [code-review](official/code-review/) - Review code professionally

**Community Skills:**
- Coming soon! Be the first to contribute.

---

## 📦 Skill Structure

Every skill follows this format:

```
skill-name/
├── SKILL.md          # Required: What the skill does and how to use it
├── HEARTBEAT.md      # Optional: Periodic checks
├── MESSAGING.md      # Optional: Communication guide
└── (other files)     # Optional: Scripts, configs, data
```

**SKILL.md Format:**
```markdown
---
name: skill-name
description: Brief description
author: Your Name
version: 1.0.0
tags: [tag1, tag2]
---

# Skill Name

## What This Does
Explain the purpose.

## How to Use
Clear instructions.

## Examples
Practical examples.
```

---

## 🎨 Submit Your Skill

### Phase 1: Official Skills (Curated)

Want to contribute to the official collection?

1. **Create your skill** in your agent's workspace
2. **Test thoroughly** - Make sure it works
3. **Fork this repo**
4. **Add your skill** to `official/` folder
5. **Submit a PR** with:
   - Skill files
   - Clear description
   - Usage examples
   - Why it's useful

**Review Process:**
- We check for quality and safety
- No malicious code
- Clear documentation
- Useful functionality

**Approval:** Usually within 3-5 days

### Phase 2: Community Skills (Open)

Want to share quickly without review?

1. **Fork this repo**
2. **Add your skill** to `community/` folder
3. **Submit a PR**
4. **Auto-merged** (minimal review)

**Note:** Community skills are not officially endorsed. Users install at their own risk.

### Phase 3: PAN Network (Coming Soon)

Share skills directly between agents via the PocketAgent Network.

---

## 📋 Submission Guidelines

### Required:
- [ ] SKILL.md with proper frontmatter
- [ ] Clear description of what it does
- [ ] Usage instructions
- [ ] At least one example
- [ ] No malicious code
- [ ] No hardcoded credentials

### Recommended:
- [ ] Version number
- [ ] Author information
- [ ] Tags for discoverability
- [ ] HEARTBEAT.md if periodic checks needed
- [ ] MESSAGING.md if communication patterns needed

### Forbidden:
- ❌ Malicious code
- ❌ Hardcoded API keys or credentials
- ❌ Copyrighted content without permission
- ❌ Misleading descriptions
- ❌ Duplicate skills (check existing first)

---

## 🔍 Skill Categories

**Development:**
- code-review - Review code professionally

**Meta (Agent Skills):**
- skill-maker - Create new skills
- agent-maker - Create sub-agents
- marketplace - Use the skills marketplace

**Research:**
- web-search - Search the web effectively

---

**More categories coming soon as the marketplace grows!**

Planned categories:
- Business (email, meetings, planning)
- Creative (writing, social media, design)
- Trading/Finance (crypto, market analysis)
- Automation (scheduling, file management, monitoring)

---

## 🛠️ For Developers

### Install Script Usage

```bash
# Install to default location (~/.openclaw/workspace/skills/)
./scripts/install.sh skill-name

# Install to custom location
./scripts/install.sh skill-name /custom/path/

# List available skills
./scripts/install.sh --list

# Show skill info
./scripts/install.sh --info skill-name
```

### Skill Validation

```bash
# Validate skill structure
./scripts/validate.sh official/my-skill

# Check all skills
./scripts/validate.sh --all
```

---

## 📊 Statistics

**Official Skills:** 5  
**Community Skills:** 0  
**Total Downloads:** Coming soon  
**Contributors:** Growing!

---

## 🤝 Community

- **Discord:** [Join our community](https://discord.gg/pocketagent)
- **GitHub Discussions:** [Ask questions, share ideas](https://github.com/PocketAgentNetwork/pocketmp/discussions)
- **Issues:** [Report bugs or request skills](https://github.com/PocketAgentNetwork/pocketmp/issues)

---

## 📜 License

Skills in this marketplace are licensed individually. Check each skill's LICENSE file.

The marketplace infrastructure is MIT licensed.

---

## 🗺️ Roadmap

**Phase 1: GitHub Marketplace** ✅ (Current)
- Curated official skills
- Community contributions
- Manual installation

**Phase 2: Registry & CLI** (Q2 2026)
- Self-service publishing
- `pocketmp install skill-name`
- Ratings and reviews
- Version management

**Phase 3: PAN Integration** (Q3 2026)
- Agent-to-agent skill sharing
- Decentralized discovery
- Peer-to-peer installation
- Skill evolution tracking

---

**Built with ❤️ by the PocketAgent community**
