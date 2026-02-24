---
name: marketplace
description: How to browse, install, and manage skills from PocketMP
author: PocketAgent Team
version: 1.0.0
tags: [meta, marketplace, skills, installation]
license: MIT
---

# Marketplace Skill

## What This Does

This skill teaches you how to use the PocketMP (PocketAgent Skills Marketplace) to discover, install, and manage skills.

## What is PocketMP?

PocketMP is the official skills marketplace for PocketAgent. It contains:
- **Official Skills** - Curated and maintained by the PocketAgent team
- **Community Skills** - Contributed by users (use at your own discretion)

**Repository:** https://github.com/PocketAgentNetwork/pocketmp

## How to Browse Skills

### Method 1: One-Line Command (Fastest)
```bash
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --list
```

This shows all available skills with descriptions instantly.

### Method 2: Get Skill Info
```bash
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --info skill-name
```

Shows detailed information about a specific skill.

### Method 3: GitHub (Web)
1. Visit https://github.com/PocketAgentNetwork/pocketmp
2. Browse `official/` or `community/` folders
3. Read SKILL.md files to see what each skill does

## How to Install Skills

### One-Line Install (Recommended)

```bash
# Install any skill directly (no cloning needed!)
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- web-search
```

**Default location:** `~/.openclaw/workspace/skills/`

### Custom Installation Path

```bash
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- web-search --path /custom/path
```

### All Available Commands

```bash
# List all available skills
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --list

# Get detailed info about a skill
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --info skill-name

# Install a skill (default path)
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- skill-name

# Install to custom path
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- skill-name --path /custom/path

# Remove an installed skill
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --remove skill-name

# Remove from custom path
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --remove skill-name --path /custom/path
```

### After Installation

1. Restart your agent or reload skills
2. The skill is now available to use
3. Read the skill's SKILL.md for usage instructions

## Available Skills

### Official Skills

**Meta (Agent Skills):**
- `skill-maker` - Learn how to create new skills
- `agent-maker` - Learn how to create sub-agents
- `marketplace` - Learn how to use the marketplace (this skill!)

**Development:**
- `code-review` - Review code professionally

**Research:**
- `web-search` - Search the web effectively

### Community Skills

Check the repository for community contributions!

## Skill Structure

Every skill follows this format:

```
skill-name/
├── SKILL.md          # Required: What it does and how to use it
├── HEARTBEAT.md      # Optional: Periodic checks
├── MESSAGING.md      # Optional: Communication guide
└── (other files)     # Optional: Scripts, configs, data
```

## How to Contribute Skills

### Option 1: Official Skills (Curated)

1. Create your skill
2. Test thoroughly
3. Fork the pocketmp repository
4. Add your skill to `official/` folder
5. Submit a Pull Request
6. Wait for review (3-5 days)

**Requirements:**
- High quality documentation
- Clear usage examples
- No malicious code
- No hardcoded credentials

### Option 2: Community Skills (Open)

1. Create your skill
2. Fork the pocketmp repository
3. Add your skill to `community/` folder
4. Submit a Pull Request
5. Auto-merged after basic checks

**Note:** Community skills are not officially endorsed.

## Skill Management

### Update Skills

```bash
# Reinstall to get latest version
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- skill-name
```

### Remove Skills

**Method 1: Using Install Script (Recommended)**
```bash
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --remove skill-name

# Or from custom path
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --remove skill-name --path /custom/path
```

**Method 2: Manual Removal**
```bash
rm -rf ~/.openclaw/workspace/skills/skill-name
```

Then restart your agent.

### List Installed Skills

```bash
ls ~/.openclaw/workspace/skills/
```

### Check Available Skills

```bash
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --list
```

## Best Practices

### When Installing Skills

✅ **Do:**
- Read the SKILL.md first
- Check the author and version
- Review the code if it includes scripts
- Test in a safe environment first
- Keep skills updated

❌ **Don't:**
- Install without reading documentation
- Trust community skills blindly
- Install skills with hardcoded credentials
- Skip testing before production use

### When Using Skills

1. **Read the documentation** - Each skill has usage instructions
2. **Follow examples** - Skills include practical examples
3. **Understand limitations** - Know what the skill can and can't do
4. **Provide feedback** - Report issues or suggest improvements

## Examples

### Example 1: Installing Web Search Skill

```bash
# Check skill info first
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --info web-search

# Install it
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- web-search

# Restart agent
# Now you can use web search effectively!
```

### Example 2: Installing Multiple Skills

```bash
# Install several skills (one at a time)
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- skill-maker
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- agent-maker
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- code-review

# Restart agent
# All skills are now available!
```

### Example 3: Removing a Skill

```bash
# Check what's installed
ls ~/.openclaw/workspace/skills/

# Remove a skill you no longer need
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --remove web-search

# Restart agent
# Skill is now removed!
```

### Example 4: Managing Skills

```bash
# List all available skills
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --list

# Get info about a specific skill
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --info code-review

# Install it
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- code-review

# Later, if you don't need it anymore
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --remove code-review
```

## Troubleshooting

### Skill Not Working After Installation

1. **Restart your agent** - Skills load on startup
2. **Check the path** - Ensure skill is in `~/.openclaw/workspace/skills/`
3. **Read SKILL.md** - Make sure you're using it correctly
4. **Check dependencies** - Some skills need additional tools

### Can't Find a Skill

1. **Update marketplace** - `git pull origin main`
2. **Check spelling** - Skill names are case-sensitive
3. **List all skills** - `./scripts/install.sh --list`

### Installation Failed

1. **Check permissions** - Ensure you can write to the target directory
2. **Verify marketplace** - Make sure you cloned the repo correctly
3. **Check disk space** - Ensure you have enough space

## Advanced Usage

### Keeping Skills Updated

```bash
# Reinstall any skill to get the latest version
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- skill-name

# Check for new skills
curl -fsSL https://raw.githubusercontent.com/PocketAgentNetwork/pocketmp/main/scripts/install.sh | bash -s -- --list
```

### Skill Discovery

Browse by category in the README:
- Development skills
- Research skills
- Business skills
- Creative skills
- Trading/Finance skills
- Automation skills

## Future Features

**Phase 2: Registry & CLI** (Coming Soon)
- `pocketmp install skill-name` - Direct installation
- `pocketmp search keyword` - Search skills
- `pocketmp update` - Update all skills
- Ratings and reviews

**Phase 3: PAN Integration** (Future)
- Agent-to-agent skill sharing
- Decentralized discovery
- Peer-to-peer installation

## Notes

- The marketplace is open source and community-driven
- Official skills are reviewed for quality and safety
- Community skills are user-contributed (use at your own risk)
- Always read documentation before installing
- Keep your skills updated for best results

---

**The marketplace is your gateway to extending your capabilities. Explore, install, and grow!**
