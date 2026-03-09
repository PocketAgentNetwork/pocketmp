# Resume Builder Skill

Create ATS-optimized resumes that pass automated screening and impress human recruiters.

## Quick Start

1. **Install dependencies:**
```bash
pip install -r requirements.txt
```

2. **See the example:**
```bash
python generate_resume.py example_resume.json example_output.docx
```

3. **Create your own:**
   - Copy `example_resume.json`
   - Fill in your information
   - Run the script with your data

## Files

- `SKILL.md` - Complete skill documentation with templates and best practices
- `generate_resume.py` - Script to convert JSON to PDF/DOCX
- `example_resume.json` - Sample resume data structure
- `requirements.txt` - Python dependencies

## Usage

```bash
# Generate DOCX (most ATS-friendly)
python generate_resume.py your_data.json output.docx

# Generate PDF
python generate_resume.py your_data.json output.pdf
```

## Features

- ATS-optimized formatting (single column, standard fonts, no tables)
- Professional layout with proper spacing
- Supports both PDF and DOCX output
- Structured JSON input for easy automation
- Quantified achievements and power verbs
- Keyword optimization

## For Agents

This skill enables agents to:
1. Gather candidate information
2. Structure it as JSON
3. Generate professional resume documents
4. Optimize for specific job postings

See `SKILL.md` for complete documentation.
