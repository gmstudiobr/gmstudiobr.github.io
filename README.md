# GMSTUDIO© — Site Oficial

> Estúdio de Branding & Direção Visual · Pouso Alegre/MG · Desde 2013

Site institucional do GMSTUDIO®, construído do zero com HTML, CSS e JavaScript puros — sem frameworks, sem build tools, sem dependências de runtime. Cada linha foi escrita à mão com foco em performance, autoria visual e controle total sobre cada detalhe.

---

## Estrutura do Projeto

```
gmstudiobr.github.io/
│
├── index.html              # Site principal (portfólio + sobre + serviços + contato)
├── site-content.json       # Conteúdo editável do site raiz
├── portfolio.json          # Projetos do portfólio (cases, covers, modais)
│
├── branding/
│   └── index.html          # Landing page /branding — pacotes e cases
├── branding-content.json   # Conteúdo editável da landing /branding
│
├── briefing/
│   └── index.html          # Formulário estratégico (11 etapas, 57 perguntas)
├── briefing-content.json   # Conteúdo editável do briefing
│
├── painel/
│   └── index.html          # Painel admin (encriptado AES-256-GCM + PBKDF2)
│
├── crm-tracker.js          # Rastreador de leads (Supabase, fire-and-forget)
├── SUPABASE_LEADS.sql      # Schema da tabela de leads
├── DEPLOY.bat              # Script de deploy via Git
│
├── assets/
│   ├── fonts/              # Fonte Bahnschrift (woff/ttf — self-hosted)
│   ├── images/             # Covers de cases, logos e imagens do site
│   ├── modal-pages/        # Imagens internas dos modais de portfólio
│   └── clients/            # Logos de clientes
│
└── favicon.svg             # Ícone da aba
```

---

## Páginas

### `/` — Site Principal
Página institucional completa com hero, sobre, marquee, portfólio com modais, manifesto, serviços, clientes carousel, contato e footer. Todo conteúdo é injetado via `site-content.json` na inicialização — cada texto e link editável sem tocar no HTML.

### `/branding` — Landing Page
Landing page de captação focada em branding estratégico. Apresenta cases, pacotes de serviço, processo criativo, depoimentos e formulário de contato integrado ao Supabase e Formspree. Conteúdo gerenciado via `branding-content.json`.

### `/briefing` — Formulário Estratégico
Formulário multi-step de 11 etapas com 57 perguntas sobre negócio, posicionamento, público, personalidade, identidade visual e expectativas. Inclui mosaico tipográfico interativo, mosaico de tipos de marca, campos condicionais e envio via Formspree. Conteúdo gerenciado via `briefing-content.json`.

### `/painel` — Painel Administrativo
CMS completo encriptado no próprio HTML. O painel só é acessível após autenticação — o conteúdo é decriptografado no browser via Web Crypto API. Permite editar textos, headlines, SEO, portfólio, cases, pacotes e configurações do briefing, publicando via GitHub API diretamente do browser.

---

## Arquitetura

### CMS Sem Backend
Todo o sistema de gestão de conteúdo roda inteiramente no browser. O painel lê os arquivos JSON do repositório via GitHub API, permite edição inline e salva de volta via commit autenticado. Zero servidores, zero banco de dados CMS.

### Sistema de Headlines por Linhas
H1 e H2 de todas as páginas são compostos por linhas independentes, cada uma com estilo próprio: **Normal**, **Cor** (magenta), **Outline** (texto vazado) ou **Destaque** (fundo colorido). O painel expõe cada linha em um campo separado com seletor de estilo — o HTML é gerado automaticamente no save.

### Encriptação do Painel
O painel administrativo é protegido por encriptação de chave simétrica derivada de senha. A decriptografia acontece inteiramente no browser, sem nenhum round-trip de servidor — nenhum dado sensível transita pela rede.

### Rastreamento de Leads
`crm-tracker.js` captura submissões de formulário e envia para uma tabela `leads` no Supabase (PostgreSQL). Opera em fire-and-forget — não bloqueia o submit nem expõe erros ao usuário. Row Level Security ativo na tabela.

### Animações e Reveals
Sistema próprio de reveal baseado em `IntersectionObserver`. Elementos com classe `.rv` entram com fade + translateY. Headlines usam `.hl-wrap`/`.hl-inner` com clip por overflow e slide vertical por linha, com stagger por `nth-child`. Nenhuma biblioteca de animação externa.

---

## Linguagens e Tecnologias

| Linguagem / Tecnologia | Uso |
|---|---|
| **HTML5** | Estrutura de todas as páginas — semântica, SEO, acessibilidade |
| **CSS3** | Estilos completos no `<head>` — variáveis CSS, grid, clamp, animações |
| **JavaScript (ES2020+)** | Toda a lógica: CMS, formulários, modais, animações, encriptação, API calls |
| **Web Crypto API** | Encriptação/decriptação AES-256-GCM + PBKDF2 nativa do browser |
| **JSON** | Formato de conteúdo para `site-content`, `branding-content`, `briefing-content`, `portfolio` |
| **SQL (PostgreSQL)** | Schema da tabela de leads no Supabase (`SUPABASE_LEADS.sql`) |
| **Batch Script** | `DEPLOY.bat` — automação de deploy via Git no Windows |
| **SVG** | Wordmark GMSTUDIO®, favicon, ícones inline |
| **Python** *(build only)* | Scripts de encriptação e geração do gateway (não versionados) |

### APIs e Serviços Externos

| Serviço | Função |
|---|---|
| **GitHub Pages** | Hospedagem estática em `gmstudiobr.github.io` |
| **GitHub API v3** | Leitura e escrita de arquivos JSON via painel admin |
| **Supabase** | Banco de dados PostgreSQL para captura de leads |
| **Formspree** | Envio do formulário de briefing por e-mail sem backend |
| **Google Fonts** | Fontes para o mosaico tipográfico do briefing |

### Fonte Principal
**Bahnschrift** — self-hosted em `assets/fonts/`, usada em todos os headlines e títulos do site.

---

## Deploy

O repositório é hospedado no GitHub Pages. Para publicar alterações, execute `DEPLOY.bat` na raiz do projeto. O script remove locks de git pendentes, adiciona os arquivos, faz commit e push para `main`. O GitHub Pages publica automaticamente em segundos após o push.

**Branch de produção:** `main`  
**URL:** `https://gmstudiobr.github.io`

---

## Segurança

- **Painel encriptado:** nenhuma lógica administrativa está acessível no código-fonte público
- **Credenciais:** nenhuma chave de acesso, senha ou token é armazenado no repositório
- **Supabase:** opera com anon key pública e RLS ativo — escopo limitado à tabela `leads`
- **Copyright:** proteções de direito autoral embutidas contra scraping e reprodução

---

---

**[gmstudiobr.github.io](https://gmstudiobr.github.io)** · [Instagram](https://instagram.com/gmstudiobr) · [Behance](https://behance.net/gmstudiobr) · [LinkedIn](https://linkedin.com/company/gmstudiobr) · [gmstudio@outlook.pt](mailto:gmstudio@outlook.pt)

*© 2026 GMSTUDIO®. Todos os direitos reservados.*
