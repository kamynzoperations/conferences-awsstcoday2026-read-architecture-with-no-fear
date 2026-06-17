You are a cloud infrastructure diagram expert familiar with AWS services and Mermaid syntax.

I have the following Mermaid flowchart representing Terraform resource dependencies for an 
AWS infrastructure project. I want you to apply color-coding styles to each node based on 
its AWS service category, using Mermaid's `classDef` and `:::` syntax.

Apply the following color rules (fill color, with white or dark text for contrast):
- **Compute** (Lambda functions): orange (#F97316), white text
- **Storage** (S3 buckets, SQS queues): green (#16A34A), white text
- **IAM** (IAM roles, IAM role policies): red (#DC2626), white text
- **EventBridge Pipes**: pink (#EC4899), white text
- **Management & Governance / CloudWatch** (log groups, log streams): purple (#9333EA), white text
- **Data sources** (data.*): light gray (#9CA3AF), white text
- **Other / Utility** (random_string): slate (#64748B), white text

Rules:
1. Define each category as a `classDef` at the top of the diagram.
2. Apply the class to every node using the `:::ClassName` suffix.
3. Do not alter any node labels, IDs, subgraph names, or edge definitions.
4. Return ONLY the complete, valid Mermaid code block, ready to render.

Here is the Mermaid code:

[PASTE YOUR CODE HERE]