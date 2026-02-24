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

### Method 1: GitHub (Web)
1. Visit https://github.com/PocketAgentNetwork/pocketmp
2. Browse `official/` or `community/` folders
3. Read SKILL.md files to see what each skill does

### Method 2: Command Line
```bash
cd /path/to/pocketmp
./scripts/install.sh --list
```

This shows all available skills with descriptions.

### Method 3: Get Skill Info
```bash
./scripts/install.sh --info skill-name
```

Shows detailed information about a specific skill.

## How to Install Skills

### Basic Installation

```bash
# Clone the marketplace (first time only)
git clone https://github.com/PocketAgentNetwork/pocketmp.git
cd pocketmp

# Install a skill
./scripts/install.sh skill-name
```

**Default location:** `~/.openclaw/workspace/skills/`

### Custom Installation Path

```bash
./scripts/install.sh --path /custom/path/ skill-name
```

### Installation Options

```bash
# List all available skills
./scripts/install.sh --list

# Get detailed info about a skill
./scripts/install.sh --info skill-name

# Install a skill (default path)
./scripts/install.sh skill-name

# Install to custom path
./scripts/install.sh --path /custom/path skill-name

# Remove an installed skill
./scripts/install.sh --remove skill-name

# Remove from custom path
./scripts/install.sh --remove skill-name --path /custom/path

# Show help
./scripts/install.sh --help
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
cd pocketmp
git pull origin main
./scripts/install.sh skill-name  # Reinstall to update
```

### Remove Skills

**Method 1: Using Install Script (Recommended)**
```bash
cd pocketmp
./scripts/install.sh --remove skill-name

# Or from custom path
./scripts/install.sh --remove skill-name --path /custom/path
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
cd pocketmp
./scripts/install.sh --list
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
# Clone marketplace
git clone https://github.com/PocketAgentNetwork/pocketmp.git
cd pocketmp

# Check skill info
./scripts/install.sh --info web-search

# Install it
./scripts/install.sh web-search

# Restart agent
# Now you can use web search effectively!
```

### Example 2: Installing Multiple Skills

```bash
cd pocketmp

# Install several skills
./scripts/install.sh skill-maker
./scripts/install.sh agent-maker
./scripts/install.sh code-review

# Restart agent
# All skills are now available!
```

### Example 3: Removing a Skill

```bash
cd pocketmp

# Check what's installed
ls ~/.openclaw/workspace/skills/

# Remove a skill you no longer need
./scripts/install.sh --remove web-search

# Restart agent
# Skill is now removed!
```

### Example 4: Managing Skills

```bash
cd pocketmp

# List all available skills
./scripts/install.sh --list

# Get info about a specific skill
./scripts/install.sh --info code-review

# Install it
./scripts/install.sh code-review

# Later, if you don't need it anymore
./scripts/install.sh --remove code-review
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

### Keeping Marketplace Updated

```bash
# Add to your agent's routine
cd /path/to/pocketmp
git pull origin main

# Check for new skills
./scripts/install.sh --list
```

### Creating Your Own Skill Collection

```bash
# Fork the marketplace
# Add your own skills to a custom folder
# Share with your team
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
