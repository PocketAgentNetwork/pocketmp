---
name: code-review
description: Review code professionally with constructive feedback
author: PocketAgent Team
version: 1.0.0
tags: [development, code, review, quality]
license: MIT
---

# Code Review Skill

## What This Does

This skill teaches you how to review code professionally, identify issues, and provide constructive feedback that helps developers improve.

## How to Use

### Review Process

1. **Understand the Context**
   - What is the code supposed to do?
   - What problem does it solve?
   - What are the requirements?

2. **Read the Code**
   - Read thoroughly, don't skim
   - Understand the logic flow
   - Note any questions

3. **Check Against Criteria**
   - Functionality: Does it work?
   - Readability: Is it clear?
   - Maintainability: Can it be maintained?
   - Performance: Is it efficient?
   - Security: Is it safe?

4. **Provide Feedback**
   - Be specific and constructive
   - Explain why, not just what
   - Offer solutions, not just problems
   - Acknowledge good code too

5. **Prioritize Issues**
   - Critical: Must fix (security, bugs)
   - Important: Should fix (performance, maintainability)
   - Nice-to-have: Could improve (style, optimization)

## Review Checklist

### Functionality
- [ ] Code does what it's supposed to do
- [ ] Edge cases are handled
- [ ] Error handling is present
- [ ] Input validation exists
- [ ] Output is correct

### Readability
- [ ] Variable names are clear
- [ ] Functions are well-named
- [ ] Code is properly formatted
- [ ] Comments explain why, not what
- [ ] Complex logic is documented

### Maintainability
- [ ] Code follows project conventions
- [ ] Functions are single-purpose
- [ ] No code duplication
- [ ] Dependencies are minimal
- [ ] Tests are included

### Performance
- [ ] No obvious inefficiencies
- [ ] Appropriate data structures
- [ ] No unnecessary operations
- [ ] Resource usage is reasonable
- [ ] Scalability considered

### Security
- [ ] Input is sanitized
- [ ] No SQL injection risks
- [ ] No XSS vulnerabilities
- [ ] Secrets not hardcoded
- [ ] Authentication/authorization correct

## Examples

### Example 1: Function Review

**Code:**
```python
def calc(a, b):
    return a + b
```

**Review:**
```
Issues:
1. Function name is too vague
2. No type hints
3. No docstring
4. No input validation

Suggestion:
```python
def add_numbers(num1: float, num2: float) -> float:
    """
    Add two numbers and return the result.
    
    Args:
        num1: First number
        num2: Second number
        
    Returns:
        Sum of num1 and num2
    """
    if not isinstance(num1, (int, float)) or not isinstance(num2, (int, float)):
        raise TypeError("Both arguments must be numbers")
    return num1 + num2
```

Why: Clear naming, type safety, documentation, and validation make the code more maintainable and robust.
```

### Example 2: Security Issue

**Code:**
```javascript
const query = `SELECT * FROM users WHERE id = ${userId}`;
```

**Review:**
```
🔴 CRITICAL: SQL Injection Vulnerability

This code is vulnerable to SQL injection attacks. Never concatenate user input directly into SQL queries.

Fix:
```javascript
const query = 'SELECT * FROM users WHERE id = ?';
db.query(query, [userId]);
```

Or use an ORM:
```javascript
const user = await User.findById(userId);
```

Why: Parameterized queries prevent SQL injection by treating user input as data, not code.
```

### Example 3: Performance Issue

**Code:**
```python
for item in items:
    if item in large_list:
        process(item)
```

**Review:**
```
⚠️ PERFORMANCE: O(n²) complexity

This code checks membership in a list repeatedly, which is O(n) per check.

Suggestion:
```python
large_set = set(large_list)  # O(n) once
for item in items:
    if item in large_set:  # O(1) per check
        process(item)
```

Why: Converting to a set makes lookups O(1) instead of O(n), dramatically improving performance for large datasets.
```

## Feedback Guidelines

### Be Constructive

❌ **Bad:** "This code is terrible."
✅ **Good:** "This function could be improved by extracting the validation logic into a separate function for better reusability."

### Be Specific

❌ **Bad:** "Fix the naming."
✅ **Good:** "Consider renaming `calc` to `calculate_total_price` to better describe what it does."

### Explain Why

❌ **Bad:** "Don't use var."
✅ **Good:** "Use `const` or `let` instead of `var` because they have block scope, which prevents common bugs from variable hoisting."

### Offer Solutions

❌ **Bad:** "This won't scale."
✅ **Good:** "This approach might not scale well with large datasets. Consider using pagination or implementing a caching layer."

### Acknowledge Good Code

✅ **Good:** "Nice use of the strategy pattern here! This makes the code very extensible."
✅ **Good:** "Great error handling - clear messages and proper exception types."

## Tone and Approach

### Professional Tone
- Be respectful and courteous
- Focus on the code, not the person
- Use "we" instead of "you"
- Frame as suggestions, not demands

### Collaborative Mindset
- You're helping, not criticizing
- Everyone makes mistakes
- Learning opportunity for both
- Goal is better code, not ego

### Examples of Good Phrasing
- "We could improve this by..."
- "Have you considered..."
- "What do you think about..."
- "This works, but we might want to..."
- "Great start! One thing to consider..."

## Priority Levels

### 🔴 Critical (Must Fix)
- Security vulnerabilities
- Data loss risks
- Breaking changes
- Major bugs

### 🟡 Important (Should Fix)
- Performance issues
- Maintainability problems
- Missing error handling
- Code duplication

### 🟢 Nice-to-Have (Could Improve)
- Style improvements
- Minor optimizations
- Better naming
- Additional comments

## Advanced Techniques

### Pattern Recognition
- Identify design patterns
- Spot anti-patterns
- Recognize code smells
- Note architectural issues

### Context Awareness
- Consider team conventions
- Respect project constraints
- Understand business requirements
- Balance idealism with pragmatism

### Teaching Moments
- Explain concepts
- Share best practices
- Provide resources
- Encourage learning

## Common Code Smells

1. **Long Functions** - Break into smaller functions
2. **Deep Nesting** - Extract to functions or use early returns
3. **Magic Numbers** - Use named constants
4. **Duplicate Code** - Extract to reusable functions
5. **God Objects** - Split responsibilities
6. **Tight Coupling** - Use dependency injection
7. **No Tests** - Add unit tests
8. **Poor Naming** - Use descriptive names

## Notes

- Review in small chunks (< 400 lines)
- Take breaks to stay focused
- Don't nitpick style if auto-formatters exist
- Prioritize learning over perfection
- Be open to discussion
- Follow up on critical issues

---

**Remember:** The goal is to help, not to criticize. Good code reviews make better code and better developers.
