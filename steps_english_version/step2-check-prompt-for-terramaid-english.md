# Mermaid Diagram Styling Prompt - v2.0 Deliverables
## Ready for Team Use

**Project**: Generalized Mermaid Styling Prompt with Internet Entry Point  

---

## What You're Getting

This package contains **everything needed to standardize architecture diagrams** across your team/organization. It includes the updated prompt, specification document, pattern guide, and examples.

### 📦 Files Included

1. **MERMAID_STYLING_PROMPT_UPDATED.md** — The main prompt (v2.0)
   - Updated from the original v1.0 (AWS-only) → v2.0 (any Mermaid diagram)
   - Adds internet entry point at top of diagrams
   - Includes guidance for creating two versions (overview + detailed)
   - Generalized color palette (function-based, not provider-specific)
   - **Use**: Share with team; copy into Claude/ChatGPT/Gemini when styling diagrams
---

## How to Use This Package

### Scenario 1: Create Your First Styled Diagram (Quick Start)

1. **Open Mermaid Live Editor**: https://mermaid.live/
2. **Paste your raw Mermaid code**
3. **Copy the updated prompt** from `MERMAID_STYLING_PROMPT_UPDATED.md`
4. **Paste into Claude (or ChatGPT/Gemini)**:
   ```
   [Copy updated prompt]
   
   Now please style this Mermaid diagram:
   [Paste your raw code]
   
   Create TWO versions:
   - Overview (simplified, 6-8 nodes, for presentation)
   - Detailed (complete, all nodes, for documentation)
   ```
5. **Verify both render** in Mermaid Live Editor
6. **Export** (PNG for slides, SVG for docs)


## Additional Resources

- **Mermaid Docs**: https://mermaid.js.org/
- **Live Editor**: https://mermaid.live/ (test diagrams here)
- **Mermaid CLI**: Install with `npm install -g mermaid-cli`
- **Color Accessibility**: https://webaim.org/resources/contrastchecker/

---

## Quick Reference: Using the Prompt

### With Claude
```markdown
[Paste MERMAID_STYLING_PROMPT_UPDATED.md content]

Apply this to my diagram:

[Paste your Mermaid code]

Create both overview and detailed versions.
```

### With ChatGPT
```
You are an expert at creating professional Mermaid diagrams.

[Paste DESCRIPTION + DISCERNMENT sections from the prompt]

Now apply this to my diagram:

[Paste your Mermaid code]

Create an overview version (6-8 nodes, simplified) and a detailed version (all nodes, complete).
```

### With Gemini
Same approach as ChatGPT; copy the prompt and your diagram.

---

## Summary

✅ **You now have**:
- A reusable prompt for your entire team
- A specification document tracking all decisions
- A pattern guide with concrete examples
- Everything needed for your AWS Student Day presentation
- Version control-friendly Markdown files

✅ **You can**:
- Apply this prompt to ANY Mermaid diagram (not just AWS)
- Create overview versions for presentations
- Create detailed versions for documentation
- Customize colors for your organization
- Train your team using the provided pattern