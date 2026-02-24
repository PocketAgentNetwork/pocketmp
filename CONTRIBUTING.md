# Contributing to PocketMP

Thank you for contributing to the PocketAgent Skills Marketplace! 🎉

---

## How to Contribute

### Option 1: Official Skills (Curated)

Official skills are reviewed and maintained by the PocketAgent team.

**Process:**
1. Fork this repository
2. Create your skill in `official/your-skill-name/`
3. Follow the skill structure guidelines
4. Test thoroughly
5. Submit a Pull Request
6. Wait for review (3-5 days)

**Requirements:**
- High quality documentation
- Clear usage examples
- No malicious code
- No hardcoded credentials
- Useful functionality

### Option 2: Community Skills (Open)

Community skills are contributed by users with minimal review.

**Process:**
1. Fork this repository
2. Create your skill in `community/your-skill-name/`
3. Follow the skill structure guidelines
4. Submit a Pull Request
5. Auto-merged after basic checks

**Requirements:**
- Valid SKILL.md
- No malicious code
- No hardcoded credentials

---

## Skill Structure

Every skill must follow this structure:

```
your-skill-name/
├── SKILL.md          # Required
├── HEARTBEAT.md      # Optional
├── MESSAGING.md      # Optional
├── LICENSE           # Optional but recommended
└── (other files)     # Optional
```

### SKILL.md Format

```markdown
---
name: your-skill-name
description: Brief description of what this skill does
author: Your Name
version: 1.0.0
tags: [tag1, tag2, tag3]
license: MIT
---

# Your Skill Name

## What This Does
Clear explanation of the skill's purpose and capabilities.

## How to Use
Step-by-step instructions on how to use the skill.

## Examples
Practical examples showing the skill in action.

## Requirements
Any dependencies or prerequisites.

## Notes
Additional information, limitations, or tips.
```

### Frontmatter Fields

**Required:**
- `name` - Skill name (lowercase, hyphens)
- `description` - Brief description (1-2 sentences)

**Recommended:**
- `author` - Your name or GitHub username
- `version` - Semantic version (1.0.0)
- `tags` - Array of relevant tags
- `license` - License type (MIT, Apache, etc.)

**Optional:**
- `homepage` - Link to documentation
- `repository` - Link to source code
- `dependencies` - Required tools or libraries

---

## Skill Guidelines

### Do's ✅

- **Clear Documentation** - Explain what it does and how to use it
- **Practical Examples** - Show real usage scenarios
- **Error Handling** - Handle edge cases gracefully
- **Version Control** - Use semantic versioning
- **License** - Include a LICENSE file
- **Test** - Test thoroughly before submitting
- **Tags** - Use relevant tags for discoverability

### Don'ts ❌

- **No Malicious Code** - No backdoors, data theft, or harmful actions
- **No Hardcoded Secrets** - No API keys, passwords, or tokens
- **No Copyrighted Content** - Don't include copyrighted material without permission
- **No Misleading Descriptions** - Be honest about what the skill does
- **No Duplicates** - Check if a similar skill already exists

---

## Review Process

### Official Skills

1. **Submission** - You submit a PR
2. **Automated Checks** - CI runs validation
3. **Code Review** - Team reviews for:
   - Code quality
   - Security
   - Documentation
   - Usefulness
4. **Feedback** - We may request changes
5. **Approval** - Merged when ready
6. **Published** - Skill is live!

**Timeline:** Usually 3-5 days

### Community Skills

1. **Submission** - You submit a PR
2. **Automated Checks** - CI runs basic validation
3. **Quick Review** - Basic safety check
4. **Auto-Merge** - Merged if checks pass

**Timeline:** Usually 1-2 days

---

## Skill Categories

Choose appropriate tags from these categories:

**Development:**
- coding
- debugging
- testing
- documentation
- code-review

**Research:**
- web-search
- data-analysis
- academic
- fact-checking

**Business:**
- email
- meetings
- planning
- reporting
- productivity

**Creative:**
- writing
- social-media
- design
- brainstorming

**Trading/Finance:**
- crypto
- trading
- market-analysis
- portfolio
- risk-management

**Automation:**
- scheduling
- file-management
- backup
- monitoring

**Communication:**
- messaging
- notifications
- alerts
- reporting

---

## Example Skills

### Simple Skill (Text-based)

```
web-search/
└── SKILL.md

SKILL.md:
---
name: web-search
description: Search the web effectively and cite sources
author: PocketAgent Team
version: 1.0.0
tags: [research, web, search]
---

# Web Search Skill

## What This Does
Searches the web using available tools and returns relevant, cited results.

## How to Use
1. Identify search query
2. Use web_search tool
3. Analyze results
4. Summarize findings
5. Cite all sources

## Examples
User: "Research the latest AI trends"
Agent: [Searches web, analyzes, summarizes with citations]

## Best Practices
- Use specific keywords
- Verify from multiple sources
- Always cite sources
- Check publication dates
```

### Advanced Skill (With Scripts)

```
data-analysis/
├── SKILL.md
├── analyze.py
├── requirements.txt
└── README.md

SKILL.md:
---
name: data-analysis
description: Analyze data files using Python scripts
author: Community Contributor
version: 1.0.0
tags: [data, analysis, python]
dependencies: [python3, pandas, numpy]
---

# Data Analysis Skill

## What This Does
Analyzes JSON/CSV data files and provides statistical summaries.

## How to Use
1. Prepare data file (JSON or CSV)
2. Run: python analyze.py <file>
3. Review output

## Requirements
- Python 3.x
- pandas
- numpy

Install: pip install -r requirements.txt

## Examples
python analyze.py sales_data.csv
```

---

## Testing Your Skill

Before submitting:

1. **Install locally**
   ```bash
   cp -r your-skill ~/.openclaw/workspace/skills/
   ```

2. **Test with your agent**
   - Restart agent
   - Try using the skill
   - Verify it works as documented

3. **Check documentation**
   - Is it clear?
   - Are examples helpful?
   - Any missing information?

4. **Validate structure**
   ```bash
   ./scripts/validate.sh official/your-skill
   ```

---

## Pull Request Template

When submitting, include:

```markdown
## Skill Information
- **Name:** your-skill-name
- **Type:** Official / Community
- **Category:** [category]
- **Description:** Brief description

## Checklist
- [ ] SKILL.md with proper frontmatter
- [ ] Clear usage instructions
- [ ] At least one example
- [ ] Tested with my agent
- [ ] No hardcoded credentials
- [ ] No malicious code
- [ ] LICENSE file included (if applicable)

## Additional Notes
Any additional context or information.
```

---

## Questions?

- **GitHub Discussions:** Ask questions
- **Discord:** Join our community
- **Issues:** Report problems

---

## Code of Conduct

- Be respectful and constructive
- Help others learn and grow
- Share knowledge generously
- Give credit where due
- Follow the guidelines

---

**Thank you for making PocketAgent better!** 🚀
