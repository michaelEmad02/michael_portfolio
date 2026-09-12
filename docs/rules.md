# AI Development Rules — Michael Emad Portfolio

This document is the permanent development guideline for the project.

The AI MUST read and follow these rules before implementing, modifying,
refactoring, or adding any feature to the project.

These rules apply to the entire codebase.

---

# 1. General Principles

- Follow the existing project architecture and structure.
- Do not introduce unnecessary complexity.
- Prefer simple, readable, maintainable solutions.
- Do not duplicate code when it can be properly abstracted.
- Keep each class, function, and widget focused on a single responsibility.
- Do not modify unrelated parts of the project.
- Do not rewrite working code without a clear reason.
- Before implementing a feature, inspect the existing codebase and reuse
  existing components, utilities, services, and patterns whenever possible.

---

# 2. Architecture

The project MUST follow a scalable architecture based on:

- Clean Architecture
- Separation of Concerns
- SOLID Principles
- Dependency Inversion Principle
- Dependency Injection

Preferred structure:

lib/
├── core/
│   ├── constants/
│   ├── theme/
│   ├── localization/
│   ├── routing/
│   ├── utils/
│   └── services/
│
├── features/
│   ├── home/
│   ├── projects/
│   ├── skills/
│   ├── experience/
│   └── contact/
│
└── main.dart

The exact structure may evolve as the project grows, but responsibilities
must remain clearly separated.

---

# 3. Clean Architecture Rules

Each feature should follow this separation:

Presentation
    ↓
Domain
    ↓
Data

### Presentation

Contains:

- Pages
- Screens
- Widgets
- Controllers / BLoCs / Cubits
- UI state

Presentation MUST NOT directly depend on concrete Data-layer implementations.

---

### Domain

Contains:

- Entities
- Repository interfaces
- Use Cases
- Business rules

The Domain layer must remain independent from Flutter UI and external
framework-specific implementations whenever practical.

---

### Data

Contains:

- Repository implementations
- Data sources
- API clients
- Local storage
- DTOs / Models

The Data layer implements the abstractions defined by the Domain layer.

---

# 4. SOLID Principles

The implementation MUST follow SOLID.

### Single Responsibility Principle

Each class should have one clear responsibility.

Avoid large classes that handle:

- UI
- Networking
- Storage
- Business logic
- Navigation

all together.

---

### Open / Closed Principle

Prefer extending behavior through abstractions rather than repeatedly
modifying existing stable code.

---

### Liskov Substitution Principle

Implementations must correctly respect their abstractions.

---

### Interface Segregation Principle

Prefer small focused abstractions over large interfaces.

---

### Dependency Inversion Principle

High-level modules must depend on abstractions, not concrete implementations.

Example:

GOOD:

UseCase
    ↓
Repository Interface
    ↑
Repository Implementation

BAD:

UseCase
    ↓
SupabaseRepository directly

---

# 5. Dependency Injection

Dependency Injection MUST be used when dependencies become meaningful or
shared.

Preferred approach:

- Constructor Injection
- A centralized dependency registration mechanism
- GetIt when appropriate

Example:

class GetProjects {
  final ProjectRepository repository;

  GetProjects(this.repository);
}

The UseCase should not create its own Repository.

BAD:

final repository = ProjectRepositoryImpl();

GOOD:

final repository = getIt<ProjectRepository>();

or preferably inject the dependency through the constructor.

---

# 6. Singleton

Singleton should be used carefully.

Use Singleton only for genuinely shared stateless/stateful services such as:

- Configuration
- Storage service
- API client
- Dependency container
- Logging service

Do NOT turn normal business objects, widgets, repositories, or UseCases
into Singleton objects without a real architectural reason.

---

# 7. State Management

Use a predictable state-management approach.

Preferred:

- BLoC
- Cubit

Avoid putting business logic directly inside Widgets.

Widgets should primarily be responsible for:

- Rendering UI
- Receiving user interaction
- Triggering events/actions
- Displaying state

Business logic should live outside the UI layer.

---

# 8. Reusable UI Components

Create reusable widgets for repeated UI patterns.

Examples:

- CustomButton
- SectionHeader
- ProjectCard
- SkillCard
- AppNavbar
- ResponsiveContainer
- AnimatedSection

Do not duplicate the same UI implementation in multiple screens.

If a component is used in multiple places, consider extracting it into a
reusable widget.

---

# 9. Responsive Design

The portfolio MUST be responsive.

The UI must support:

- Desktop
- Laptop
- Tablet
- Mobile

Never design only for one screen size.

Use:

- LayoutBuilder
- MediaQuery
- Flexible
- Expanded
- Wrap
- GridView
- ConstrainedBox
- Responsive breakpoints

Avoid excessive fixed dimensions.

BAD:

width: 1200

GOOD:

constraints: BoxConstraints(
  maxWidth: 1200,
)

The layout must adapt naturally to different screen widths.

---

# 10. No Hardcoded UI Values

Avoid unnecessary hardcoded values throughout the application.

Do not scatter:

- Colors
- Font sizes
- Border radiuses
- Spacing
- Durations
- Breakpoints

throughout random widgets.

Centralize reusable design values using:

- Theme
- Constants
- Design tokens
- Configuration classes

Example:

AppSpacing.md

AppRadius.md

AppColors.primary

AppDurations.medium

---

# 11. Theme System

The application MUST support:

- Dark Theme
- Light Theme

Theme-specific values must be centralized.

Widgets should use:

Theme.of(context)

instead of hardcoding colors.

BAD:

color: Color(0xFF5CCBFF)

GOOD:

color: Theme.of(context).colorScheme.primary

unless the value is intentionally a fixed design token.

---

# 12. Localization

The application MUST support:

- English
- Arabic

The architecture must support:

- LTR
- RTL

Do NOT hardcode user-facing text directly throughout widgets.

All UI text should be handled through the localization system.

Example:

context.l10n.projects

instead of:

Text("Projects")

The layout must automatically adapt when switching between English and
Arabic.

---

# 13. RTL Rules

When Arabic is active:

- Text alignment should adapt correctly.
- Icons should be direction-aware when necessary.
- Navigation should support RTL.
- Padding and margins should use directional properties when appropriate.

Prefer:

EdgeInsetsDirectional

AlignmentDirectional

PositionedDirectional

instead of assuming left/right positioning.

---

# 14. Project Cards

Projects should be displayed using reusable ProjectCard components.

Each card should contain relevant information such as:

- Project name
- Category
- Short description
- Technologies
- Preview image
- CTA

When the user clicks a ProjectCard:

→ Navigate to a dedicated Project Details screen.

Project details should NOT be implemented by duplicating the entire card UI.

Use reusable models and components.

---

# 15. Animations

Animations should improve the experience without becoming distracting.

Preferred animations:

- Fade In
- Slide In
- Scale
- Hover effects
- Smooth page transitions
- Staggered section animations
- Card hover interactions

Animations must be:

- Smooth
- Short
- Purposeful
- Performance-friendly

Avoid excessive animation.

Do not animate every element unnecessarily.

---

# 16. Performance

Performance is a priority.

The AI MUST consider performance whenever implementing a feature.

Rules:

- Avoid unnecessary rebuilds.
- Use const constructors whenever possible.
- Avoid expensive operations inside build().
- Avoid unnecessary nested widgets.
- Dispose controllers, animations, and streams properly.
- Avoid rebuilding large widget trees unnecessarily.
- Use lazy lists/grids when displaying large collections.
- Optimize images.
- Avoid loading unnecessarily large assets.
- Avoid unnecessary network requests.
- Cache data when appropriate.
- Keep animations lightweight.

Prefer:

const Widget()

when possible.

---

# 17. Flutter Web Performance

Because this project targets Flutter Web:

- Avoid unnecessarily heavy dependencies.
- Optimize image sizes.
- Avoid huge assets.
- Avoid excessive blur/filter effects.
- Avoid unnecessarily complex animations.
- Keep the initial page lightweight.
- Lazy-load expensive content when appropriate.
- Avoid unnecessary API calls during initial rendering.

The first render should remain fast.

---

# 18. Images & Assets

Images must be optimized before being used.

Avoid unnecessarily large images.

Use appropriate formats such as:

- WebP
- PNG
- SVG

when suitable.

All assets must be referenced through centralized asset configuration
where practical.

Do not scatter arbitrary asset paths throughout the code.

---

# 19. Navigation

Navigation should be centralized.

Do not scatter navigation logic throughout random widgets.

Prefer a dedicated routing solution/configuration.

Project Details should receive the required project data rather than relying
on global mutable state.

---

# 20. Error Handling

External operations such as:

- API calls
- Database requests
- Storage
- Network requests

must have proper error handling.

Do not silently ignore failures.

The UI should have appropriate states such as:

- Loading
- Success
- Empty
- Error

---

# 21. Database / Backend

The portfolio UI itself should remain independent from a database.

If dynamic content is required later, backend/database integration can be
introduced through the Data layer.

The architecture must therefore allow:

UI
 ↓
UseCase
 ↓
Repository Interface
 ↓
Repository Implementation
 ↓
API / Database

Do NOT couple UI widgets directly to Supabase, Firebase, or any database.

---

# 22. Data Models

Do not pass large collections of primitive Maps throughout the application.

Prefer typed Models / Entities.

BAD:

Map<String, dynamic>

everywhere.

GOOD:

Project
Skill
Experience
Education

with clear typed properties.

---

# 23. Code Quality

Code must be:

- Readable
- Predictable
- Maintainable
- Testable
- Consistent

Use meaningful names.

Avoid:

- x
- temp
- data2
- obj
- thing

Prefer:

- project
- projectRepository
- projectDetails
- selectedProject

---

# 24. Comments

Do not add comments that simply explain obvious code.

BAD:

// Create a button
final button = ElevatedButton(...);

Use comments only when explaining:

- Complex logic
- Architectural decisions
- Non-obvious behavior
- Important constraints

---

# 25. Refactoring Rules

Before refactoring:

1. Understand the existing implementation.
2. Identify the actual problem.
3. Avoid unnecessary changes.
4. Preserve existing behavior.
5. Refactor incrementally.
6. Ensure the project still builds.

Do not refactor the entire project just to implement a small feature.

---

# 26. New Feature Workflow

Before implementing a new feature:

1. Inspect the existing architecture.
2. Identify the appropriate feature/module.
3. Reuse existing components.
4. Define required Domain models/entities.
5. Define repository abstraction if needed.
6. Implement Data layer if needed.
7. Implement UseCase.
8. Implement state management.
9. Implement UI.
10. Add navigation.
11. Add responsive behavior.
12. Add localization.
13. Consider performance.
14. Test the feature.

---

# 27. Modification Workflow

When modifying existing functionality:

1. Understand the current behavior.
2. Identify the smallest required change.
3. Do not break existing functionality.
4. Preserve the current architecture.
5. Reuse existing abstractions.
6. Test affected areas.
7. Check Desktop, Tablet, and Mobile.
8. Check English and Arabic.
9. Check Dark and Light themes.

---

# 28. Before Writing Code

The AI should ALWAYS ask itself:

- Where does this feature belong?
- Does an existing component already solve part of this problem?
- Am I violating Clean Architecture?
- Am I introducing unnecessary coupling?
- Can this dependency be injected?
- Is this value unnecessarily hardcoded?
- Is this responsive?
- Does it support RTL?
- Does it support localization?
- Does it work with Dark and Light themes?
- Could this cause unnecessary rebuilds?
- Could this affect Flutter Web performance?
- Is this reusable?
- Is this the simplest maintainable solution?

---

# 29. Final Implementation Checklist

Before considering a task complete, verify:

[ ] Clean Architecture respected
[ ] SOLID principles respected
[ ] Dependency Inversion respected
[ ] Dependencies injected properly
[ ] Singleton used only when justified
[ ] Business logic separated from UI
[ ] No unnecessary hardcoded values
[ ] Responsive on Desktop
[ ] Responsive on Tablet
[ ] Responsive on Mobile
[ ] English supported
[ ] Arabic supported
[ ] RTL supported
[ ] Dark Theme supported
[ ] Light Theme supported
[ ] Animations are purposeful
[ ] No unnecessary rebuilds
[ ] Assets optimized
[ ] Controllers/resources disposed
[ ] Error states handled where needed
[ ] Existing functionality preserved
[ ] Code is reusable and maintainable

---

# 30. Most Important Rule

DO NOT optimize for writing the smallest amount of code.

Optimize for:

Clean Architecture
+
Maintainability
+
Scalability
+
Performance
+
Reusability
+
Consistency
+
Good UX

Every implementation decision should support these principles.