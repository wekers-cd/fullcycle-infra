O objetivo é que qualquer alteração feita em uma branch `feature/*` ou `fix/*` execute automaticamente:

1. **CI**
   - validação do Terraform
   - geração de `terraform plan`

2. **Criação automática de Pull Request**
3. **Merge para `main`**
4. **CD**
   - execução de `terraform apply`
   - criação da infraestrutura na AWS

---

# 2. Arquitetura do Pipeline

```
Developer Push (feature branch)
        │
        ▼
GitHub Actions CI
terraform fmt
terraform validate
terraform plan
        │
        ▼
Pull Request automático
        │
        ▼
Merge para main
        │
        ▼
GitHub Actions CD
terraform apply
        │
        ▼
AWS Infrastructure
 ├─ EC2 Instance
 ├─ Security Group
 └─ Terraform State (S3)
```

---

# Resultado Final

Pipeline CI/CD totalmente automatizado:

```
GitHub Push
   ↓
Terraform CI
   ↓
Pull Request automático
   ↓
Merge
   ↓
Terraform Apply
   ↓
Infra criada na AWS
```

Infraestrutura gerenciada por **Infraestrutura como Código (IaC)** com **GitOps workflow**.

---
