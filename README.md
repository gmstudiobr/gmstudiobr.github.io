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
│   └── index.html          # Landing page /branding — pacotes e cases de identidade visual
├── branding-content.json   # Conteúdo editável da landing /branding
│
├── briefing/
│   └── index.html          # Formulário estratégico de briefing (11 etapas, 57 perguntas)
├── briefing-content.json   # Conteúdo editável do briefing
│
├── painel/
│   └── index.html          # Painel admin (AES-256-GCM + PBKDF2, acesso por senha)
│
├── crm-tracker.js          # Rastreador de leads (Supabase, fire-and-forget)
├── SUPABASE_LEADS.sql      # Schema da tabela de leads no Supabase
├── DEPLOY.bat              # Script de deploy via Git
│
├── assets/
│   ├── fonts/              # Fonte Bahnschrift (woff/ttf — self-hosted)
│   ├── images/             # Covers de cases, foto do Gustavo, logos
│   ├── modal-pages/        # Imagens internas dos modais de portfólio
│   └── clients/            # Logos de clientes
│
└── favicon.svg             # Ícone da aba
```

---

## Páginas

### `/` — Site Principal
Página institucional completa com seções de hero, sobre, marquee, portfólio com modais, manifesto, serviços, clientes carousel, contato e footer. Todo conteúdo é injetado via `site-content.json` na inicialização, tornando cada texto e link editável sem tocar no HTML.

### `/branding` — Landing Page
Landing page de captação focada em branding estratégico. Apresenta cases, pacotes de serviço, processo criativo, depoimentos e formulário de contato integrado ao Supabase e Formspree. Conteúdo gerenciado via `branding-content.json`.

### `/briefing` — Formulário Estratégico
Formulário multi-step de 11 etapas com 57 perguntas profundas sobre negócio, posicionamento, público, personalidade, identidade visual e expectativas. Inclui mosaico tipográfico interativo, mosaico de tipos de marca, campos condicionais e envio via Formspree. Conteúdo gerenciado via `briefing-content.json`.

### `/painel` — Painel Administrativo
Painel CMS completo encriptado com AES-256-GCM + PBKDF2 (200.000 iterações). O HTML do painel é decriptografado no browser via Web Crypto API apenas após a senha correta. Permite editar todos os textos, headlines, subtítulos, SEO, portfólio, cases, pacotes e configurações do briefing — e publica tudo via GitHub API diretamente do browser.

---

## Arquitetura

### CMS Sem Backend
Todo o sistema de gestão de conteúdo roda no browser. O painel lê os arquivos JSON do GitHub via API, permite edição inline e salva de volta via commit autenticado com GitHub Personal Access Token armazenado no `localStorage`. Zero servidores, zero banco de dados CMS.

### Sistema de Headlines por Linhas
H1 e H2 de todas as páginas são compostos por linhas independentes, cada uma com estilo próprio: **Normal**, **Cor** (magenta/vermelho), **Outline** (texto vazado) ou **Destaque** (fundo colorido). O painel expõe cada linha em um campo separado com seletor de estilo — o HTML é gerado automaticamente no save.

### Encriptação do Painel
```
Senha → PBKDF2(SHA-256, 200.000 iter, salt aleatório) → chave AES-256
HTML do painel → AES-GCM(iv aleatório) → base64 → gateway.html
```
O gateway é um HTML minimalista com o bloco encriptado embutido. A decriptografia acontece inteiramente no browser, sem round-trip de servidor.

### Rastreamento de Leads
`crm-tracker.js` captura submissões de formulário e envia para uma tabela `leads` no Supabase (PostgreSQL). Opera em fire-and-forget — não bloqueia o submit nem expõe erros ao usuário. Row Level Security ativo na tabela.

### Animações e Reveals
Sistema próprio de reveal baseado em `IntersectionObserver`. Elementos com classe `.rv` entram com fade + translateY. Headlines usam `.hl-wrap`/`.hl-inner` com clip por overflow e slide vertical por linha, com stagger por `nth-child`. Nenhuma biblioteca de animação externa.

---

## Linguagens e Tecnologias

| Linguagem / Tecnologia | Uso |
|---|---|
| **HTML5** | Estrutura de todas as páginas — semântica, SEO, acessibilidade |
| **CSS3** | Estilos completos inline no `<head>` — variáveis CSS, grid, clamp, animações |
| **JavaScript (ES2020+)** | Toda a lógica: CMS, formulários, modais, animações, encriptação, API calls |
| **Web Crypto API** | Encriptação/decriptação AES-256-GCM + PBKDF2 nativa do browser |
| **JSON** | Formato de conteúdo para `site-content`, `branding-content`, `briefing-content`, `portfolio` |
| **SQL (PostgreSQL)** | Schema da tabela de leads no Supabase (`SUPABASE_LEADS.sql`) |
| **Batch Script** | `DEPLOY.bat` — automação de deploy via Git no Windows |
| **SVG** | Wordmark GMSTUDIO®, favicon, ícones inline |
| **Python** *(build only)* | Scripts de encriptação e geração do gateway do painel (não está no repo) |

### APIs e Serviços Externos

| Serviço | Função |
|---|---|
| **GitHub Pages** | Hospedagem estática gratuita em `gmstudiobr.github.io` |
| **GitHub API v3** | Leitura e escrita de arquivos JSON pelo painel admin via REST |
| **Supabase** | Banco de dados PostgreSQL para captura de leads |
| **Formspree** | Envio de formulário do briefing por email sem backend |
| **WhatsApp API** | Links `wa.me` para contato direto no CTA |
| **Google Fonts** | Fontes tipográficas para o mosaico do briefing (Playfair, Bebas Neue, Dancing Script etc.) |

### Fonte Principal
**Bahnschrift** — self-hosted (`assets/fonts/`), fonte condensed/expanded da Microsoft usada em todos os headlines e títulos do site.

---

## Deploy

O repositório é hospedado no GitHub Pages. Para publicar alterações:

```batch
DEPLOY.bat
```

O script remove locks de git, adiciona os arquivos modificados, faz commit e push para `main`. O GitHub Pages publica automaticamente em segundos após o push.

**Repositório:** `gmstudiobr/gmstudiobr.github.io`  
**Branch de produção:** `main`  
**URL:** `https://gmstudiobr.github.io`

---

## Segurança

- **Painel encriptado:** nenhuma lógica administrativa é acessível sem a senha correta
- **Token GitHub:** armazenado apenas em `localStorage` do browser do administrador, nunca em código
- **Supabase:** chave pública (anon key) com RLS ativo — apenas INSERT e SELECT permitidos na tabela `leads`
- **Copyright:** proteções de direito autoral embutidas no `index.html` contra scraping e reprodução não autorizada

---

## Autor

**Gustavo Machado** — Designer & Diretor Criativo  
[gmstudio@outlook.pt](mailto:gmstudio@outlook.pt) · [gmstudio.br](https://gmstudiobr.github.io) · [LinkedIn](https://www.linkedin.com/in/gustavomachado-dg/) · [Behance](https://www.behance.net/gmstudio-br)

---

*© 2026 GMSTUDIO®. Todos os direitos reservados.*
