# 📘 Site Estático na AWS com Terraform

## 🚀 Visão Geral
Este projeto implementa uma arquitetura **completa e automatizada** para hospedagem de um **site estático pessoal** na **AWS**, utilizando **Terraform** como ferramenta de **Infraestrutura como Código (IaC)**.

O repositório está organizado em **stacks independentes**, refletindo boas práticas de modularização, versionamento e separação de responsabilidades.  
Cada stack representa uma etapa do ciclo de provisionamento, desde o backend remoto até a distribuição global via **CloudFront** e **Route 53**.

---

## 🧩 Arquitetura Geral

| Camada | Stack | Descrição |
|--------|--------|-----------|
| **00** | 🧱 **Remote State Backend** | Cria o bucket S3 para armazenar o estado remoto do Terraform, garantindo consistência e bloqueio de concorrência. |
| **01** | 🌐 **Networking Stack** | Provisiona o bucket S3 do site estático, configura políticas de acesso, valida o certificado SSL no ACM e cria registros DNS no Route 53. |
| **02** | 🚀 **CloudFront Distribution Stack** | Configura a distribuição global do site via CloudFront, integrando com o bucket S3 e o certificado do ACM. |

---

## ⚙️ Tecnologias e Ferramentas

- **Terraform** → Provisionamento de infraestrutura (IaC)  
- **AWS S3** → Armazenamento do site estático  
- **AWS CloudFront** → CDN global com cache e HTTPS  
- **AWS Certificate Manager (ACM)** → Certificado SSL/TLS  
- **AWS Route 53** → DNS e registros A/CAA  
- **AWS S3 State Locking** → Controle de bloqueio de estado remoto  
- **GitHub** → Versionamento e base para CI/CD com GitHub Actions  
- **TailwindCSS** → Estilização do frontend (diretório `APP/Frontend`)  

---

## 🏗️ Estrutura do Projeto

```bash
site-estatico-s3-terraform/
│
├── 00-remote-state-backend/          # Criação do backend remoto (S3)
│   ├── main.tf
│   ├── outputs.tf
│   ├── s3.bucket.tf
│   └── variables.tf
│
├── 01-networking-stack/              # Bucket do site, ACM, DNS e políticas
│   ├── main.tf
│   ├── acm.validation.tf
│   ├── route53.tf
│   ├── s3.policy.tf
│   ├── s3.static-site.tf
│   ├── s3-upload.tf
│   ├── outputs.tf
│   └── variables.tf
│
├── 02-cloudfront-dist-stack/         # CDN + Integração com ACM e S3
│   ├── main.tf
│   ├── cloudfront.tf
│   ├── cloudfront.policy.tf
│   ├── data.acm.tf
│   ├── data.route53.tf
│   ├── data.s3-static-site.tf
│   ├── route53-dns.tf
│   └── outputs.tf
│
└── APP/
    └── Frontend/                     # Site estático (HTML + Tailwind)
        ├── index.html
        ├── package.json
        ├── tailwind.config.js
        ├── postcss.config.js
        └── dist/
            ├── output.css
            └── styles.css
```

---

## 🔐 Boas Práticas Aplicadas

- Estrutura **modularizada** por stack (facilita reuso e manutenção)  
- **Remote Backend** configurado (S3)  
- Uso de **data sources** para integração entre stacks  
- **Certificados SSL válidos e automatizados** via ACM  
- Separação de políticas IAM e configurações sensíveis  
- **Padronização de tags e variáveis reutilizáveis**  
- Compatível com **CI/CD via GitHub Actions**  
- Frontend minimalista otimizado com **TailwindCSS**  

---

## 🧠 Conceitos Praticados

- **Infraestrutura como Código (IaC)**  
- **Automação e provisionamento declarativo**  
- **Segurança em Cloud e práticas AWS Well-Architected**  
- **CDN e cache distribuído com CloudFront**  
- **Gerenciamento de DNS com Route 53**  
- **Integração contínua e versionamento com GitHub**  

---

## ▶️ Execução

> ⚠️ Antes de executar, configure suas credenciais AWS (`~/.aws/credentials`) e confirme a existência do domínio no Route 53.

### 🔹 Passo 1 – Remote Backend
```bash
cd 00-remote-state-backend
terraform init
terraform apply -auto-approve
```

### 🔹 Passo 2 – Networking (Bucket + ACM + DNS)
```bash
cd ../01-networking-stack
terraform init
terraform apply -auto-approve
```

### 🔹 Passo 3 – CloudFront Distribution
```bash
cd ../02-cloudfront-dist-stack
terraform init
terraform apply -auto-approve
```

---

## 🌍 Resultado Final

Ao final da execução, o site estará disponível via HTTPS no domínio configurado no **Route 53**, servido globalmente via **CloudFront**.

**Exemplo de saída:**
```bash
site_url = "https://www.lucasbarbosa.dev"
```

---

## 📦 Diretório Frontend

O diretório `APP/Frontend` contém o site estático utilizado no bucket S3.

Para editar ou testar localmente:
```bash
cd APP/Frontend
npm install
npx tailwindcss -i ./src/styles.css -o ./dist/output.css --watch
```

---

## 🧾 Próximos Passos

- Adicionar **GitHub Actions** para CI/CD automatizado  
- Implementar **monitoramento via CloudWatch**  
- Integrar **métricas e observabilidade** (ex: Grafana/Prometheus)  
- Criar **módulos Terraform reutilizáveis** (ACM, DNS, S3)  

---

## 👨‍💻 Autor

**Lucas Barbosa Santana**  
💼 DevOps | Cloud | IaC | Automation  
🌐 [GitHub: lbsantana](https://github.com/lbsantana)  
📧 [linkedin: Lucas Barbosa](https://www.linkedin.com/in/lucas-barbosa-41381b236/)

---

## 📄 Licença

Uso **pessoal e educacional**.  
Pode ser utilizado como referência para estudos de **AWS**, **DevOps**, **IaC** e **automação de infraestrutura**.
