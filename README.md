# Curriculum Vitae - Flutter Web

Um currículo vitae interativo desenvolvido em Flutter Web com arquitetura MVVM, tema claro/escuro, responsividade e internacionalização.

## 🚀 Características

- **Arquitetura MVVM**: Separação clara entre lógica de negócio e interface
- **Projetos Separados**: `curriculum_dart` (lógica pura) e `curriculum_flutter` (interface)
- **Tema Claro/Escuro**: Alternância entre temas com persistência
- **Responsivo**: Compatível com mobile, tablet e desktop
- **Internacionalização**: Suporte para português e inglês
- **Navegação**: Implementada com `auto_route`
- **Download PDF**: Geração e download do currículo em PDF
- **Contato Fácil**: Links diretos para WhatsApp, email, LinkedIn e GitHub
- **Animações Suaves**: Transições e animações para melhor UX
- **Deploy Automático**: GitHub Actions para deploy no GitHub Pages

## 🏗️ Estrutura do Projeto

```
curriculum_dart/
├── domain/
│   └── entities/
├── repo/
├── service/
├── state/
└── use_case/

curriculum_flutter/
├── infrastructure/
│   ├── dto/
│   ├── repo/
│   └── service/
├── interface/
│   ├── config/
│   ├── pages/
│   ├── view/
│   ├── view_model/
│   └── widget/
├── l10n/
└── theme/
```

## 🛠️ Tecnologias Utilizadas

- **Flutter 3.24.3**: Framework principal
- **Dart**: Linguagem de programação
- **auto_route**: Navegação e roteamento
- **responsive_framework**: Design responsivo
- **pdf & printing**: Geração e download de PDF
- **url_launcher**: Abertura de links externos
- **font_awesome_flutter**: Ícones
- **flutter_localizations**: Internacionalização

## 📱 Páginas

1. **Home**: Apresentação, contatos e principais tecnologias
2. **Experiências**: Histórico profissional detalhado
3. **Projetos**: Portfolio de projetos com detalhes
4. **Habilidades**: Competências técnicas e soft skills

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK 3.24.3 ou superior
- Dart SDK

### Instalação

1. Clone o repositório:
```bash
git clone <seu-repositorio>
cd curriculum
```

2. Instale as dependências do projeto Dart:
```bash
cd curriculum_dart
dart pub get
```

3. Instale as dependências do projeto Flutter:
```bash
cd ../curriculum_flutter
flutter pub get
```

4. Gere os arquivos de código:
```bash
dart run build_runner build
```

5. Execute o projeto:
```bash
flutter run -d chrome
```

### Build para Web

```bash
flutter build web --release --web-renderer html
```

## 🌐 Deploy no GitHub Pages

O projeto está configurado para deploy automático no GitHub Pages através do GitHub Actions.

### Configuração

1. Faça push do código para o branch `main`
2. Vá em Settings > Pages no seu repositório
3. Selecione "GitHub Actions" como source
4. O deploy será feito automaticamente

### Personalização

Para personalizar o deploy:

1. Edite o arquivo `.github/workflows/deploy.yml`
2. Altere o `base-href` se necessário
3. Adicione um domínio customizado no campo `cname` (opcional)

## 📝 Personalização

### Dados Pessoais

Edite o arquivo `curriculum_flutter/lib/infrastructure/repo/local_curriculum_repository.dart` para adicionar suas informações:

- Informações pessoais
- Experiências profissionais
- Projetos
- Habilidades
- Contatos

### Temas

Personalize as cores em `curriculum_flutter/lib/theme/app_theme.dart`.

### Idiomas

Adicione ou modifique traduções em:
- `curriculum_flutter/lib/l10n/app_en.arb` (inglês)
- `curriculum_flutter/lib/l10n/app_pt.arb` (português)

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## 📞 Contato

- **Email**: [seu-email@exemplo.com](mailto:seu-email@exemplo.com)
- **LinkedIn**: [Seu Perfil](https://linkedin.com/in/seu-perfil)
- **GitHub**: [Seu GitHub](https://github.com/seu-usuario)

---

Desenvolvido com ❤️ usando Flutter
