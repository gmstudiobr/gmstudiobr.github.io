# GMSTUDIO© — Site Oficial

> Estúdio de Branding & Direção Visual · Pouso Alegre/MG · Desde 2013

Site institucional do GMSTUDIO©, construído do zero com HTML, CSS e JavaScript puros — sem frameworks, sem build tools, sem dependências de runtime. Cada linha foi escrita à mão com foco em performance, autoria visual e controle total sobre cada detalhe.

---

## Estrutura do Projeto

```
gmstudiobr.github.io/
│
├── index.html              # Site principal (portfólio + sobre + serviços + contato)
├── site-content.json       # Conteúdo do site raiz
├── portfolio.json          # Projetos do portfólio (cases, covers, modais)
│
├── branding/
│   └── index.html          # Landing page /branding — pacotes e cases
├── branding-content.json   # Conteúdo da landing /branding
│
├── briefing/
│   └── index.html          # Formulário estratégico (11 etapas, 57 perguntas)
├── briefing-content.json   # Conteúdo do briefing
│
├── painel/
│   └── index.html          # Painel administrativo (acesso restrito)
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
Página institucional completa com hero, sobre, marquee, portfólio com modais, manifesto, serviços, clientes carousel, contato e footer. Todo conteúdo é carregado via `site-content.json` na inicialização.

### `/branding` — Landing Page
Landing page de captação focada em branding estratégico. Apresenta cases, pacotes de serviço, processo criativo, depoimentos e formulário de contato. Conteúdo gerenciado via `branding-content.json`.

### `/briefing` — Formulário Estratégico
Formulário multi-step de 11 etapas com 57 perguntas sobre negócio, posicionamento, público, personalidade, identidade visual e expectativas. Inclui mosaico tipográfico interativo, mosaico de tipos de marca e campos condicionais.

### `/painel` — Painel Administrativo
Acesso restrito. Permite editar textos, headlines, SEO, portfólio, cases, pacotes e configurações do briefing.

---

## Arquitetura

### Sistema de Headlines por Linhas
H1 e H2 de todas as páginas são compostos por linhas independentes, cada uma com estilo próprio: **Normal**, **Cor** (magenta), **Outline** (texto vazado) ou **Destaque** (fundo colorido).

### Rastreamento de Leads
`crm-tracker.js` captura submissões de formulário e envia para uma tabela `leads` no Supabase (PostgreSQL). Opera em fire-and-forget — não bloqueia o submit nem expõe erros ao usuário.

### Animações e Reveals
Sistema próprio de reveal baseado em `IntersectionObserver`. Elementos com classe `.rv` entram com fade + translateY. Headlines usam animação de clip por overflow com slide vertical por linha e stagger. Nenhuma biblioteca de animação externa.

---

## Linguagens e Tecnologias

| Linguagem / Tecnologia | Uso |
|---|---|
| **HTML5** | Estrutura de todas as páginas — semântica, SEO, acessibilidade |
| **CSS3** | Estilos completos no `<head>` — variáveis CSS, grid, clamp, animações |
| **JavaScript (ES2020+)** | Toda a lógica: CMS, formulários, modais, animações, API calls |
| **JSON** | Formato de conteúdo para `site-content`, `branding-content`, `briefing-content`, `portfolio` |
| **SQL (PostgreSQL)** | Schema da tabela de leads no Supabase (`SUPABASE_LEADS.sql`) |
| **Batch Script** | `DEPLOY.bat` — automação de deploy via Git no Windows |
| **SVG** | Wordmark GMSTUDIO©, favicon, ícones inline |

### Serviços Externos

| Serviço | Função |
|---|---|
| **GitHub Pages** | Hospedagem estática em `gmstudiobr.github.io` |
| **Supabase** | Banco de dados PostgreSQL para captura de leads |
| **Formspree** | Envio do formulário de briefing por e-mail |
| **Google Fonts** | Fontes para o mosaico tipográfico do briefing |

### Fonte Principal
**Bahnschrift** — self-hosted em `assets/fonts/`, usada em todos os headlines e títulos do site.

---

## Deploy

O repositório é hospedado no GitHub Pages. Execute `DEPLOY.bat` na raiz do projeto para publicar alterações. O GitHub Pages publica automaticamente após o push.

**Branch de produção:** `main`  
**URL:** `https://gmstudiobr.github.io`

---

**[gmstudiobr.github.io](https://gmstudiobr.github.io)** · [Instagram](https://instagram.com/gmstudio.br) · [Behance](https://behance.net/gmstudio-br) · [LinkedIn]([https://linkedin.com/company/gmstudiobr](https://www.linkedin.com/in/gustavomachado-dg/)) · [gmstudio@outlook.pt](mailto:gmstudio@outlook.pt)

*© 2026 GMSTUDIO©. Todos os direitos reservados.*
