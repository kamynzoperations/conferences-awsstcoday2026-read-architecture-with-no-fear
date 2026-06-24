# Mermaid Diagram Styling Prompt – Updated
## AI Fluency Framework-Based Approach (4Ds Framework)
### Version 2.0 — Generalized for Any Mermaid Diagram with Internet Entry Point

---

## 📋 DELEGATION: Clear Instructions for AI Models

### What I Want
I need you to style a Mermaid diagram code with a professional color scheme, organize it into a hierarchical layout, add an external traffic entry point, and apply modern visual design principles.

### Context
- **Input**: Raw Mermaid diagram code (any type: flowchart, graph, state, ER, Gantt)
- **Output**: Styled Mermaid diagram with clear hierarchy, internet entry point, grouped layers, and professional styling
- **Purpose**: Create publication-ready architecture/system diagrams for mixed audiences
- **Constraints**: Should work for engineers AND non-technical stakeholders; valid for multiple cloud providers and domain types

### Expected Deliverable
```
- Mermaid diagram code with styling applied
- Top-down (TD) or appropriate layout with internet entry point at TOP
- Resources grouped into logical subgraphs by function/service type
- Each resource labeled with descriptive icons and readable names
- Clear data flow showing dependencies and entry/exit points
- Professional color scheme with consistent function-based categories
- Two versions (overview + detailed) for mixed audiences
```

---

## 🎯 DESCRIPTION: Detailed Technical Specifications

### Overview: What Makes This Different from v1.0

**NEW in v2.0:**
1. **Internet Entry Point Layer** — External users/traffic enters from TOP
2. **Generalized Color Scheme** — Not AWS-specific; works for any cloud provider or domain
3. **Symbol Selection** — Two icon options for internet users (👥 people, 🌐 globe)
4. **Two-Version Pattern** — Includes guidance for creating overview vs. detailed diagrams
5. **Works with ANY Mermaid Type** — Flowchart, graph, state, ER, Gantt, etc.

---

## Step 1: Choose Your Entry Point Symbol

**For "Internet Users / External Traffic" node, pick ONE:**

- **👥** — Use when representing END USERS, people, customers, client applications
  - *Example: "👥 Mobile App Users", "👥 API Clients", "👥 Web Browsers"*
  - Best for: User-facing systems, SaaS, consumer applications

- **🌐** — Use when representing GENERIC INTERNET TRAFFIC, any external source, cloud-agnostic access
  - *Example: "🌐 Internet Traffic", "🌐 External Requests", "🌐 Public Access"*
  - Best for: Infrastructure diagrams, multi-source systems, provider-agnostic documentation

**Recommendation**: Pick based on your audience. Non-technical stakeholders prefer 👥. Engineers prefer 🌐. Mixed audiences? Use 👥 for overview, 🌐 for detailed.

---

## Step 2: Define Your Color Scheme (Function-Based, Not Provider-Specific)

**Generic Function Categories** — Adapt to your provider/domain:

| Function Category | Example Color | Hex Code | Text Color | Examples |
|---|---|---|---|---|
| **Compute** | Orange | `#FF9900` | Dark (`#232F3E`) | Functions, Workers, Services, VMs |
| **Storage** | Green | `#7AA116` | White (`#fff`) | Object Storage, Disks, Blobs |
| **Database** | Teal | `#00897B` | White (`#fff`) | Relational DB, NoSQL, Cache |
| **Security/IAM** | Red | `#DD344C` | White (`#fff`) | Identity, Auth, Permissions, Secrets |
| **Networking** | Purple | `#A66AD1` | White (`#fff`) | Networks, Load Balancers, Routing, DNS |
| **Events/Messaging** | Pink | `#E7157B` | White (`#fff`) | Queues, Pub/Sub, Streams, Events |
| **Monitoring** | Light Pink | `#FF4F8B` | White (`#fff`) | Observability, Logs, Metrics, Alerts |
| **Config/Data** | Sky Blue | `#5294CF` | White (`#fff`) | Configs, Parameters, Secrets, Metadata |
| **Utility/Temp** | Gray | `#879196` | White (`#fff`) | Temporary resources, helpers, glue code |

**Customization**: Replace these hex codes with your organization's color palette. The *categories* (Compute, Storage, etc.) are universal; the *colors* adapt to your brand.

---

## Step 3: Define Your Hierarchy Layers (Top-Down)

**Standard Layer Order** (adapt to your use case):

```
LAYER 0: External Traffic / Internet Users (NEW in v2.0)
         ↓
LAYER 1: Entry Points (CDN, Load Balancer, API Gateway, Public DNS)
         ↓
LAYER 2: Security (Auth, Firewall, WAF, Identity)
         ↓
LAYER 3: Processing / Orchestration (Services, Functions, Workers)
         ↓
LAYER 4: Storage / Persistence (Databases, Caches, Object Storage)
         ↓
LAYER 5: Monitoring / Observability (Logs, Metrics, Alerts)
         ↓
LAYER 6: Supporting Infrastructure (Networking, Secrets, Config)
```

**Omit layers that don't apply to your diagram.**

---

## Step 4: Create the Internet Entry Point (NEW SECTION)

**At the TOP of your diagram, add an external traffic node:**

```
%% Internet users entry point (pick one symbol):

%% Option A: People icon (for end-user focus)
users["👥 End Users<br/>From Internet"]

%% Option B: Globe icon (for cloud-agnostic focus)
users["🌐 Internet Traffic<br/>External Requests"]
```

**Styling the entry point:**
- Use a neutral color: Gray or Light Blue (represents "outside" the system)
- Make it visually distinct from internal resources
- Connect it to your first internal layer with a clear arrow
- Example for AWS style:

```
classDef external fill:#F1EFE8,stroke:#5F5E5A,stroke-width:2px,color:#2C2C2A
class users external
```

**Flow**: Internet entry point → Entry layer (CDN/ALB) → Internal layers → Database/Output

---

## Step 5: Organize into Subgraphs by Function

Create a subgraph for each layer:

```
%% LAYER 0: External
subgraph internet["🌐 External Traffic"]
    direction LR
    users["👥 End Users<br/>From Internet"]
end

%% LAYER 1: Entry Points
subgraph entry["📥 Entry Points"]
    direction LR
    cdn["🌐 CDN / Edge<br/>Content Delivery"]
    alb["⚖️ Load Balancer<br/>Traffic Distribution"]
end

%% LAYER 2: Processing
subgraph compute["λ Compute"]
    direction LR
    service["⚙️ Service / Function<br/>Business Logic"]
end

%% LAYER 3: Storage
subgraph storage["💾 Storage"]
    direction LR
    database["🗄️ Database<br/>Persistence"]
end

%% Connections
internet --> entry
entry --> compute
compute --> storage
```

---

## Step 6: Apply Consistent Styling with ClassDef

**Paste at the TOP of your diagram:**

```
%% Color class definitions (function-based, not provider-specific)
classDef compute fill:#FF9900,stroke:#232F3E,stroke-width:2px,color:#232F3E
classDef storage fill:#7AA116,stroke:#232F3E,stroke-width:2px,color:#fff
classDef database fill:#00897B,stroke:#232F3E,stroke-width:2px,color:#fff
classDef iam fill:#DD344C,stroke:#232F3E,stroke-width:2px,color:#fff
classDef network fill:#A66AD1,stroke:#232F3E,stroke-width:2px,color:#fff
classDef messaging fill:#E7157B,stroke:#232F3E,stroke-width:2px,color:#fff
classDef monitoring fill:#FF4F8B,stroke:#232F3E,stroke-width:2px,color:#fff
classDef config fill:#5294CF,stroke:#232F3E,stroke-width:2px,color:#fff
classDef external fill:#F1EFE8,stroke:#5F5E5A,stroke-width:2px,color:#2C2C2A
```

---

## Step 7: Assign Classes to Nodes

At the end of your diagram:

```
class users external
class cdn,alb network
class service compute
class database database
```

---

## Step 8: Create TWO VERSIONS for Mixed Audiences (NEW SECTION)

### Overview Version (for presentations, executive summaries)

**What to keep:**
- Internet entry point ✓
- Major layer groups ✓
- Critical data flows ✓
- 4-8 nodes maximum

**What to remove:**
- Supporting infrastructure (unless critical)
- Internal connections within layers
- Detailed resource names (simplify to role)
- Secondary monitoring/config nodes

**Example approach**: Show only Main ingress → Processing → Storage. Hide intermediate steps.

### Detailed Version (for technical docs, deep-dive)

**What to keep:**
- Everything from overview ✓
- All supporting layers
- Security/monitoring/config details
- All internal connections
- Fully descriptive resource names

**What to remove:**
- Nothing; show the complete architecture

### Pattern: From One Source to Two Versions

1. **Start**: Build the complete detailed diagram
2. **Create overview**: Copy the diagram, delete non-critical nodes
3. **Test both**: Render in Mermaid Live Editor; ensure both are readable
4. **Document the difference**: In your presentation notes, explain what changed

**Version naming convention:**
```
diagram-detailed.mmd     (complete architecture)
diagram-overview.mmd     (simplified for slides)
```

---

## Step 9: Icon Reference Guide

Use consistent emoji icons across your diagrams:

| Function | Icon | Usage |
|---|---|---|
| **Entry/Traffic** | 👥 🌐 | Users, external access, internet |
| **API/Interface** | 📡 🔌 | API endpoints, webhooks, integrations |
| **Compute/Function** | λ ⚙️ | Services, functions, workers, tasks |
| **Storage** | 🪣 💾 | Object storage, disks, buckets |
| **Database** | 🗄️ | Relational, NoSQL, data persistence |
| **Security/Auth** | 🔐 📜 | IAM, credentials, policies, secrets |
| **Networking** | 🌐 🔗 | Networks, routing, DNS, load balancers |
| **Messaging** | 📮 📬 | Queues, topics, pub/sub, streams |
| **Monitoring** | 📝 📊 | Logs, metrics, dashboards, alerts |
| **Config** | ⚙️ 📋 | Configuration, parameters, settings |
| **Utility** | 🎲 ⚡ | Temp resources, helpers, random data |

---

## 🧠 DISCERNMENT: Quality Checks & Validation

### Visual Quality Checklist

- [ ] **Color Contrast**: Text readable against all backgrounds (WCAG AA, 4.5:1 minimum)
- [ ] **Consistency**: Same resource types use same colors everywhere
- [ ] **Hierarchy**: Clear top-down flow with internet entry at TOP
- [ ] **Clarity**: Node labels are concise but descriptive (noun + verb or role)
- [ ] **Icons**: Every resource has a relevant emoji/symbol
- [ ] **Grouping**: Related functions grouped in same subgraph
- [ ] **Dependencies**: Arrows show clear cause-and-effect relationships

### Audience Appropriateness Checklist

**For Overview Version (Presentations):**
- [ ] 4–8 nodes only (no information overload)
- [ ] Node labels use role-based names, not resource IDs
- [ ] Data flow is obvious at a glance
- [ ] Non-technical stakeholders can explain what they see

**For Detailed Version (Documentation):**
- [ ] All nodes present and properly named
- [ ] All connections explicit (no ambiguity)
- [ ] Diagram still fits on one page/screen (zoom if needed)
- [ ] Engineers can use it to understand the full system

### Accessibility Verification

- [ ] **Color Blindness**: Diagram readable without color (use shapes, text, icons)
- [ ] **Text Size**: Labels readable at 72dpi (standard screen resolution)
- [ ] **Spacing**: No overlapping nodes
- [ ] **Contrast Ratio**: Minimum 4.5:1 between text and background
- [ ] **Internet entry point**: Visually distinct from internal nodes

### Technical Validation

- [ ] **Valid Mermaid Syntax**: No syntax errors
- [ ] **Proper Relationships**: Connections make logical sense
- [ ] **No Orphaned Nodes**: Every node is connected or intentionally isolated
- [ ] **Clean Styling**: No conflicting `classDef` definitions
- [ ] **Renderable in standard tools**: Works in Mermaid Live, mermaid-cli, VS Code

---

## ✅ DILIGENCE: Implementation & Refinement

### Testing the Output

1. **Render the diagram**
   - Use [Mermaid Live Editor](https://mermaid.live/) or Use the Mermaid Plugin in IDE such as Visual Studio Code.
   - Check for rendering errors or layout issues
   - Verify colors display correctly
   - Test dark mode (if supported)

2. **Validate relationships**
   - Trace data flow from internet entry → output
   - Confirm all dependencies are represented
   - Check for bidirectional relationships if applicable

3. **Accessibility testing**
   - Use [Color Blindness Simulator](https://www.color-blindness.com/coblis-color-blindness-simulator/)
   - Verify text contrast with [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/)
   - Test with screen reader (for exported diagrams)

4. **Audience testing**
   - Show overview to non-technical stakeholder; can they explain it?
   - Show detailed to engineer; can they rebuild the system from it?

### Refinement Questions

- **Clarity**: Can a non-technical person understand where internet users enter?
- **Completeness**: Are all critical resources shown?
- **Two Versions**: Does the overview feel simplified? Does the detailed feel complete?
- **Generality**: Could a colleague use this prompt with a different cloud provider or domain?
- **Maintainability**: Can this diagram be updated as infrastructure changes?

### Export & Sharing

**For different purposes:**

| Purpose | Export Format | Method | Command |
|---------|--------------|--------|---------|
| Presentation Slide | PNG | Mermaid CLI | `mmdc -i diagram.mmd -o diagram.png -w 2400 -H 1600` |
| Web Embed | SVG | Mermaid CLI | `mmdc -i diagram.mmd -o diagram.svg` |
| Documentation | PNG/SVG | Browser print or CLI | Save from [Mermaid Live](https://mermaid.live/) |
| GitHub README | Mermaid markdown | Copy code block | Paste diagram code in \`\`\`mermaid \`\`\` |
| PDF Report | PDF | Browser print-to-PDF | Print from Live Editor, save as PDF |

---

## 📐 REFERENCE: Complete Color Palette & Templates

### Function-Based Color Palette (Copy-Paste Ready)

```
%% Use this at the start of ANY Mermaid diagram
%% Adapt colors to your org/provider

classDef compute fill:#FF9900,stroke:#232F3E,stroke-width:2px,color:#232F3E
classDef storage fill:#7AA116,stroke:#232F3E,stroke-width:2px,color:#fff
classDef database fill:#00897B,stroke:#232F3E,stroke-width:2px,color:#fff
classDef iam fill:#DD344C,stroke:#232F3E,stroke-width:2px,color:#fff
classDef messaging fill:#E7157B,stroke:#232F3E,stroke-width:2px,color:#fff
classDef monitoring fill:#FF4F8B,stroke:#232F3E,stroke-width:2px,color:#fff
classDef config fill:#5294CF,stroke:#232F3E,stroke-width:2px,color:#fff
classDef network fill:#A66AD1,stroke:#232F3E,stroke-width:2px,color:#fff
classDef external fill:#F1EFE8,stroke:#5F5E5A,stroke-width:2px,color:#2C2C2A
```

### Generic Template (Works for Any Domain)

```
flowchart TD
    %% ===== STYLE DEFINITIONS =====
    classDef compute fill:#FF9900,stroke:#232F3E,stroke-width:2px,color:#232F3E
    classDef storage fill:#7AA116,stroke:#232F3E,stroke-width:2px,color:#fff
    classDef database fill:#00897B,stroke:#232F3E,stroke-width:2px,color:#fff
    classDef network fill:#A66AD1,stroke:#232F3E,stroke-width:2px,color:#fff
    classDef monitoring fill:#FF4F8B,stroke:#232F3E,stroke-width:2px,color:#fff
    classDef external fill:#F1EFE8,stroke:#5F5E5A,stroke-width:2px,color:#2C2C2A
    
    %% ===== LAYER 0: INTERNET ENTRY POINT =====
    subgraph internet["👥 External Users / 🌐 Internet Traffic"]
        direction LR
        users["Pick one:<br/>👥 End Users OR 🌐 Internet"]
    end
    
    %% ===== LAYER 1: ENTRY/INGRESS =====
    subgraph entry["📥 Entry Points & Ingress"]
        direction LR
        in1["Gateway/LB<br/>Entry Point"]
        in2["DNS/Routing<br/>Direction"]
    end
    
    %% ===== LAYER 2: PROCESSING =====
    subgraph processing["λ Processing & Logic"]
        direction LR
        proc1["Service/Function<br/>Business Logic"]
        proc2["Orchestrator<br/>Workflow"]
    end
    
    %% ===== LAYER 3: STORAGE =====
    subgraph storage_layer["💾 Data Storage"]
        direction LR
        stor1["Database<br/>Persistence"]
        stor2["Cache<br/>Speed"]
    end
    
    %% ===== LAYER 4: MONITORING =====
    subgraph monitoring["📝 Observability"]
        direction LR
        mon1["Logs<br/>Events"]
        mon2["Metrics<br/>Health"]
    end
    
    %% ===== CONNECTIONS =====
    internet --> entry
    entry --> processing
    processing --> storage_layer
    processing --> monitoring
    storage_layer --> monitoring
    
    %% ===== CLASS ASSIGNMENTS =====
    class users external
    class in1,in2 network
    class proc1,proc2 compute
    class stor1,stor2 database
    class mon1,mon2 monitoring
```

### Customization Examples

**Change a single color:**
```
%% Default (orange compute)
classDef compute fill:#FF9900,stroke:#232F3E,stroke-width:2px,color:#232F3E

%% Modified (blue compute for a different org)
classDef compute fill:#0066CC,stroke:#232F3E,stroke-width:2px,color:#fff
```

**Add emphasis to critical resources:**
```
classDef critical fill:#FF9900,stroke:#DD344C,stroke-width:4px,color:#232F3E
class critical_node1,critical_node2 critical
```

**Deprecate or highlight experimental resources:**
```
classDef deprecated fill:#CCCCCC,stroke:#666,stroke-width:2px,stroke-dasharray:5 5,color:#333
classDef experimental fill:#FFE680,stroke:#FFB300,stroke-width:2px,color:#333
```

---

## 🎓 How to Use This Prompt with AI Models

### For Claude (Anthropic):
```
[Copy the updated prompt above]

Now, please style my Mermaid diagram following this framework:

[Paste your raw Mermaid code here]

Required output:
- Add 👥 or 🌐 at TOP (you choose which)
- Top-down (TD) layout with hierarchical layers
- Function-based color scheme applied
- Create BOTH an overview version (simplified) and detailed version (complete)
- Include a brief explanation of what differs between versions
```

### For ChatGPT / GPT-4:
```
You are an expert in creating professional diagrams using Mermaid.

Follow this specification:
[Copy DESCRIPTION + DISCERNMENT sections]

Color palette:
[Copy color table]

Apply this to my diagram:
[Paste your raw Mermaid code]

Then create TWO versions: one simplified for a presentation slide, one detailed for documentation.
```

### For Google Gemini, Llama, or other models:
Replace model-specific references but keep the core structure:
1. Clearly state the task (Delegation)
2. Provide detailed instructions (Description)
3. Include validation criteria (Discernment)
4. Specify output formats (Diligence)

---

## 📝 Practical Examples

### Example 1: AWS Architecture (From v1.0)

**Overview Version** (Presentation, 6 nodes):
```
👥 Users → CloudFront → ALB → ECS → RDS + CloudWatch
```

**Detailed Version** (Documentation, 45+ nodes):
All the full AWS stack with security groups, subnets, routes, etc.

### Example 2: Data Pipeline (Non-AWS)

**Overview Version**:
```
🌐 Data Source → ETL → Data Warehouse → Dashboard
```

**Detailed Version**:
```
🌐 Data Source → Extract → Transform → Load → Schema → Warehouse → Query Engine → BI Tool
                                                     ↓
                                                Data Quality Checks
                                                     ↓
                                                Alerting / Monitoring
```

### Example 3: CI/CD Pipeline

**Overview Version**:
```
👥 Developer → Git Push → Build → Test → Deploy → Production
```

**Detailed Version**:
```
👥 Developer
    ↓
Git Commit → GitHub Webhook → CI Runner (build job)
                               ↓
                           Linting → Unit Tests → Build Artifact
                               ↓
                           Deploy to Staging
                               ↓
                           Integration Tests
                               ↓
                           Manual Approval (optional)
                               ↓
                           Deploy to Production
                               ↓
                           Health Checks + Monitoring
```

---

## 📞 Implementation Checklist for Teams

- [ ] **Decide on symbol**: 👥 (people-focused) or 🌐 (generic)? Or both?
- [ ] **Adapt color palette**: Does your org have brand colors? Map them to the function-based categories
- [ ] **Choose layer structure**: Does the standard layer order work for your use cases, or customize?
- [ ] **Create team template**: Build ONE reference diagram showing both versions as a team example
- [ ] **Version control**: Store `.mmd` files alongside your infrastructure/code
- [ ] **Document decisions**: Update this spec with your team's choices (color assignments, symbol preference, etc.)
- [ ] **Train the team**: Show one concrete example; let them apply it to their own diagrams
- [ ] **Iterate**: Gather feedback; refine the color scheme or layer structure after a few weeks

---

**Framework Used**: AI Fluency Framework - 4Ds (Delegation, Description, Discernment, Diligence). Link: https://anthropic.skilljar.com/ai-fluency-framework-foundations

**Version**: 2.0 — Generalized for Any Mermaid Diagram with Internet Entry Point  

**Last Updated**: June 23, 2026  

**Compatibility**: Claude, ChatGPT, Gemini, Llama, and other LLMs  

**Status**: Ready for Team Use
