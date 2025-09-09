# Automated Incident Response Playbooks for Cloud Security Incidents

This project automates detection and response for AWS cloud security incidents using:
- **Terraform** for Infrastructure as Code (IaC)
- **AWS services** (CloudTrail, CloudWatch, EventBridge, Lambda, SNS)
- **GitHub Actions** for CI/CD automation

## Repo Structure
- terraform/ : Terraform code for AWS infra
- lambda/    : Lambda handler code
- .github/workflows/ : CI workflows
- docs/      : screenshots and documentation
