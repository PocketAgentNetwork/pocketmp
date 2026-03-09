---
name: resume-builder
description: Generate ATS-optimized resumes with quantified achievements and proper formatting
author: Community Contributor
version: 1.0.0
tags: [career, resume, job-search, ats, professional-development]
license: MIT
---

# Resume Builder Skill

## What This Does

Create professional, ATS-optimized resumes that pass automated screening systems. Includes templates, formulas, and a Python script to generate PDF/DOCX files.

## How to Use

### The Core Formula

Every resume element follows this structure:
```
[Action Verb] + [What You Did] + [Tool/Skill Applied] + [Quantified Outcome] + [Business Impact]
```

### Quick Start

1. Gather info: job description, work history, achievements, metrics
2. Extract keywords from job posting
3. Structure: header → summary → skills → experience → education
4. Optimize for ATS: standard headings, single column, no graphics
5. Quantify everything with metrics and impact

## Resume Template Structure

### Header
```
[FULL NAME]
[City, State] | [Phone] | [Email] | [LinkedIn] | [Portfolio]
TARGET ROLE: [Exact Job Title from Posting]
```

### Professional Summary
```
[Adjective] [Job Title] with [X+] years driving [outcome] in [industry]. 
Proven track record of [achievement type] through [key skill 1] and [key skill 2]. 
Seeking to leverage [expertise] to [company-specific goal].
```

### Core Competencies
```
TECHNICAL: [Tool 1] • [Tool 2] • [Tool 3] • [Tool 4]
METHODOLOGIES: [Framework 1] • [Framework 2] • [Process 3]
INDUSTRY: [Domain 1] • [Domain 2] • [Domain 3]
```

### Professional Experience
```
[COMPANY NAME] | [Location] | [Job Title]
[Start Date] – [End Date]

• [Action Verb] [task] resulting in [quantified outcome] by [method]
• [Action Verb] [scope] for [stakeholder], delivering [metric] within [timeframe]
• [Action Verb] [challenge] through [strategy], achieving [result] vs [benchmark]
```

## Examples

### Example 1: Weak vs Strong Bullet Points

❌ **Weak:**
```
• Responsible for social media
• Managed sales team
• Used Python for data analysis
```

✅ **Strong:**
```
• Grew Instagram engagement 340% (12K→53K followers) in 8 months through Reels strategy and A/B testing
• Led 7-person team to $2.3M revenue (+28% YoY) by restructuring commission incentives
• Built 12+ Python automation scripts that reduced reporting time by 73% (4hrs → 65min weekly)
```

### Example 2: Skill Descriptions

Instead of just listing skills, describe impact:

**Python:**
```
Leveraged Python to automate data pipelines, reducing processing time by 65% 
and saving $18K annually in manual labor costs.
```

**Project Management:**
```
Directed 8-person cross-functional team using Agile/Scrum, delivering $2.4M 
platform migration 3 weeks under budget.
```

**Data Analysis:**
```
Applied SQL and Tableau to analyze 2M+ customer records, identifying churn 
patterns that informed retention strategy and reduced attrition by 12%.
```

### Example 3: Professional Summary

**For Product Manager:**
```
Strategic Product Manager with 6+ years driving user-centric solutions in SaaS. 
Proven track record of launching features that increase retention by 40%+ through 
data-driven prioritization and cross-functional leadership. Seeking to leverage 
product strategy expertise to help Stripe scale payment infrastructure globally.
```

## Power Verb Bank

Replace weak verbs with strong action verbs:

| Instead of "Used" | Instead of "Helped" | Instead of "Made" |
|-------------------|---------------------|-------------------|
| Architected       | Championed          | Engineered        |
| Orchestrated      | Spearheaded         | Delivered         |
| Leveraged         | Optimized           | Generated         |
| Deployed          | Transformed         | Produced          |
| Harnessed         | Catalyzed           | Launched          |

## ATS Optimization Rules

### ✅ Do This
- Use .docx or simple PDF format
- Standard section headings
- Single-column layout
- Standard fonts (Arial, Calibri, Georgia)
- Match keywords from job posting verbatim
- Include hard skills, tools, certifications
- Use bullet points with standard symbols

### ❌ Avoid This
- Tables, text boxes, graphics, columns
- Headers/footers for critical info
- Creative section names ("My Journey")
- Photos (US/UK markets)
- "References available upon request"
- Vague soft skills without proof
- Typos or grammatical errors

## Resume Length Guidelines

Choose the right length based on experience:

**1 Page:**
- 0-10 years of experience
- Entry-level to mid-level roles
- Career changers (focus on relevant experience only)
- Startups/tech companies (prefer brevity)

**2 Pages:**
- 10+ years of experience
- Senior/executive roles (Director, VP, C-suite)
- Academic/research positions (publications needed)
- Multiple highly relevant roles that all matter

**Rule:** Every line must earn its place. If stretching to fill 2 pages, stick to 1. If cramming important achievements into tiny font, go to 2.

**Never 3+ pages** (unless academic CV with publications)

Recruiters spend 6-7 seconds on initial scan - front-load your best achievements on page 1.

## Quality Checklist

Before finalizing, verify:
- [ ] Job title appears in summary
- [ ] Top 5 job keywords in first half of page
- [ ] Every bullet has action verb + metric
- [ ] No acronyms without first use spelled out
- [ ] Contact info is parseable
- [ ] File name: FirstName_LastName_JobTitle.pdf
- [ ] Correct length: 1 page (0-10 yrs) or 2 pages (10+ yrs)
- [ ] Consistent formatting throughout
- [ ] All dates and numbers accurate

## Adaptation Rules

| Scenario | Adjustment |
|----------|------------|
| Career change | Lead with "Transferable Experience" section |
| Employment gap | Use "Consulting/Projects" header |
| No metrics | Use scale indicators: "large-scale," "enterprise-level" |
| Overqualified | Focus on last 10-15 years only |
| Academic role | Move Education before Experience |
| Creative role | Add "Selected Work" with URLs |

## AI Agent Prompt Template

When using this skill programmatically:

```
ROLE: Expert Resume Writer & ATS Optimization Specialist

INPUTS:
1. CANDIDATE PROFILE: [Resume/CV text or structured data]
2. TARGET JOB POSTING: [Full job description]
3. INDUSTRY CONTEXT: [Sector + seniority level]

TASK: Generate ATS-optimized resume following the template structure.

CONSTRAINTS:
- Match 70%+ of hard skills from job posting verbatim
- Include 3-5 quantified achievements per recent role
- 1 page (0-10 yrs experience) or 2 pages (10+ yrs), 11pt font, single column
- No tables, graphics, or creative formatting
- Use action verbs from the Power Verb Bank

OUTPUT: Structured resume with clear sections and [BRACKETS] for missing data
```

## Common Mistakes to Avoid

1. **Generic summaries** - Tailor to each job
2. **Listing duties instead of achievements** - Show impact
3. **Missing metrics** - Quantify everything possible
4. **Inconsistent formatting** - Keep it uniform
5. **Too long or too short** - 1 page for 0-10 yrs, 2 pages for 10+ yrs
6. **Keyword stuffing** - Integrate naturally
7. **Outdated information** - Keep it current
8. **No proofreading** - Always check for errors

## Testing Your Resume

Use these free tools to validate ATS compatibility:
- Jobscan.co - ATS match score
- Resume Worded - AI-powered feedback
- Google Docs - Test parseability
- LinkedIn Resume Builder - Format check

## Generating the Final Document

Python script included to convert JSON data into PDF or DOCX files.

### Setup

```bash
pip install -r requirements.txt
```

Installs: `python-docx` (DOCX) and `reportlab` (PDF)

### Usage

**Create JSON file** (see `example_resume.json` for structure):

```json
{
  "header": {
    "name": "Your Name",
    "location": "City, State",
    "phone": "(555) 123-4567",
    "email": "your.email@example.com",
    "linkedin": "linkedin.com/in/yourname",
    "target_role": "Target Job Title"
  },
  "summary": "Your professional summary...",
  "skills": {
    "Technical": ["Skill1", "Skill2"],
    "Methodologies": ["Method1", "Method2"]
  },
  "experience": [{
    "company": "Company Name",
    "location": "City, State",
    "title": "Job Title",
    "start_date": "Jan 2020",
    "end_date": "Present",
    "bullets": ["Achievement with metrics..."]
  }],
  "education": [...],
  "certifications": [...]
}
```

**Generate document:**

```bash
# DOCX (recommended for ATS)
python generate_resume.py data.json output.docx

# PDF
python generate_resume.py data.json output.pdf
```

### Agent Workflow

1. Gather info from user (work history, years of experience, target job)
2. Determine length: 1 page (0-10 yrs) or 2 pages (10+ yrs)
3. Structure as JSON
4. Write JSON file
5. Run: `python generate_resume.py data.json resume.docx`
6. Deliver file to user

### File Naming

Use: `FirstName_LastName_JobTitle.docx`  
Example: `Jane_Smith_Senior_Product_Manager.docx`

## Notes

- Tailor 80% of content for each job
- Keep a master resume with all achievements
- DOCX is more ATS-friendly than PDF
- Always proofread before sending

---

**Write for ATS first, then optimize for humans. Every line should prove your value.**

