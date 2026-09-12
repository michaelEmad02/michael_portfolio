import '../../domain/entities/project_entity.dart';
import '../../../../core/constants/app_links.dart';

abstract class ProjectsLocalDataSource {
  List<ProjectEntity> getProjects();
  ProjectEntity? getProjectById(String id);
}

class ProjectsLocalDataSourceImpl implements ProjectsLocalDataSource {
  final List<ProjectEntity> _projects = [
    // 1. Clinic Pro
    const ProjectEntity(
      id: 'clinic-pro',
      titleEn: 'Clinic Pro',
      titleAr: 'كلينيك برو (Clinic Pro)',
      subtitleEn: 'Multi-Clinic Management SaaS Platform',
      subtitleAr: 'منصة SaaS لإدارة العيادات والمراكز الطبية متعددة الفروع',
      categoryEn: 'Medical SaaS',
      categoryAr: 'نظام سحابي طبي',
      overviewEn: 'A SaaS platform for managing single clinics and multi-branch medical centers. It connects Owners, Doctors, and Secretaries through role-based dashboards with built-in billing, subscription management, server-side analytics, and zero-trust data security.',
      overviewAr: 'منصة SaaS لإدارة العيادات الفردية والمراكز الطبية متعددة الفروع. تربط بين مالك المنشأة والأطباء والسكرتارية عبر لوحات تحكم حسب الدور، مع نظام فوترة واشتراكات وتقارير سيرفرية وأمان شامل لعزل البيانات.',
      problemEn: 'Medical centers lack a unified system that handles multi-branch management, role-based access, patient records, e-prescriptions, billing, and detailed business analytics — without compromising data privacy between tenants.',
      problemAr: 'تفتقر المراكز الطبية لنظام موحد يجمع إدارة الفروع والصلاحيات وملفات المرضى والروشتات والفوترة والتقارير التحليلية — مع ضمان خصوصية بيانات كل عيادة.',
      solutionEn: 'A cross-platform Flutter app backed by Supabase (PostgreSQL) with strict RLS policies for tenant isolation, server-side reporting via PL/pgSQL RPCs, SaaS subscription gating verified by the server clock, and Paymob payment integration through Edge Functions.',
      solutionAr: 'تطبيق Flutter متعدد المنصات مدعوم بـ Supabase مع سياسات RLS لعزل البيانات، وتقارير سيرفرية عبر PL/pgSQL RPCs، ونظام اشتراكات يتحقق من ساعة السيرفر، وربط مدفوعات Paymob عبر Edge Functions.',
      technologies: [
        'Flutter & Dart',
        'Supabase (PostgreSQL)',
        'BLoC / Cubit',
        'Clean Architecture',
        'GetIt & Injectable',
        'Dartz (Either Type)',
        'PL/pgSQL & RPCs',
        'Edge Functions',
        'Paymob Gateway',
        'Supabase Auth & RLS',
      ],
      featuresEn: [
        ProjectFeature(
          title: 'Zero-Trust Multi-Tenant Security (RLS & RBAC)',
          description: 'Strict Row Level Security policies on every table ensure complete data isolation between clinics. Role-based access (Owner / Doctor / Secretary) is enforced via custom JWT claims at the database level.',
          iconCode: 'security',
        ),
        ProjectFeature(
          title: 'Staff Invitation & Deep-Link Onboarding System',
          description: 'Cryptographically signed invitation links with time-bounded tokens and state-machine lifecycle (Pending > Accepted > Expired). Empowers staff to set their own private passwords, guarantees audit accountability, and enables doctors to seamlessly switch between multiple clinic workspaces from a single unified account.',
          iconCode: 'people',
        ),
        ProjectFeature(
          title: 'Server-Side Reporting Engine (PL/pgSQL RPCs)',
          description: 'Complex financial and statistical reports run entirely on the server via stored procedures — covering revenue, receivables aging, branch comparison, doctor performance, medication frequency, and patient retention — with zero N+1 queries.',
          iconCode: 'analytics',
        ),
        ProjectFeature(
          title: 'SaaS Subscription & Feature Gate',
          description: 'Flexible subscription plans (Basic / Pro / Enterprise) with 14-day free trials. Feature access is validated server-side using the server clock, preventing client-side clock manipulation to bypass paywalls.',
          iconCode: 'payment',
        ),
        ProjectFeature(
          title: 'Secure Payments via Edge Functions',
          description: 'Subscription payments and clinic billing processed through Paymob gateway, with all sensitive logic handled inside Supabase Edge Functions to keep credentials and transaction flow fully server-side.',
          iconCode: 'payment',
        ),
        ProjectFeature(
          title: 'Medical Image Uploads (Labs & X-Rays)',
          description: 'Doctors can attach and view lab results, X-ray scans, and diagnostic images directly within the patient medical record for a complete clinical picture.',
          iconCode: 'image',
        ),
      ],
      featuresAr: [
        ProjectFeature(
          title: 'أمان Zero-Trust متعدد المستأجرين (RLS & RBAC)',
          description: 'سياسات Row Level Security على كل الجداول لعزل بيانات كل عيادة تماماً. صلاحيات الأدوار (مالك / طبيب / سكرتارية) تُفرض عبر JWT Claims على مستوى قاعدة البيانات.',
          iconCode: 'security',
        ),
        ProjectFeature(
          title: 'نظام دعوة وتعيين الموظفين بروابط ذكية (Staff Invitations & Deep Linking)',
          description: 'دعوات مشفرة بروابط ورموز توكن مؤقتة تتبع دورة حياة (Pending > Accepted > Expired). يمنح الموظف خصوصية كتابة كلمة مروره بنفسه، ويحقق المساءلة القانونية وسجلات التدقيق (Audit Logs)، ويمكّن الطبيب من التبديل بين عدة عيادات بحساب موحد.',
          iconCode: 'people',
        ),
        ProjectFeature(
          title: 'محرك تقارير سيرفري (PL/pgSQL RPCs)',
          description: 'تقارير مالية وإحصائية معقدة تعمل بالكامل على السيرفر عبر دوال مخزنة — تشمل الإيرادات وأعمار الديون ومقارنة الفروع وأداء الأطباء وتكرار الأدوية ومعدل احتفاظ المرضى — بدون أي N+1 queries.',
          iconCode: 'analytics',
        ),
        ProjectFeature(
          title: 'نظام اشتراكات SaaS و Feature Gate',
          description: 'باقات مرنة (Basic / Pro / Enterprise) مع فترة تجريبية 14 يوماً. التحقق من صلاحية الاشتراك يتم من ساعة السيرفر لمنع التحايل بتغيير توقيت الهاتف.',
          iconCode: 'payment',
        ),
        ProjectFeature(
          title: 'مدفوعات آمنة عبر Edge Functions',
          description: 'معالجة مدفوعات الاشتراكات وفواتير العيادات عبر بوابة Paymob، مع تنفيذ كل المنطق الحساس داخل Edge Functions للحفاظ على أمان بيانات الدفع.',
          iconCode: 'payment',
        ),
        ProjectFeature(
          title: 'رفع صور التحاليل والأشعة',
          description: 'يمكن للطبيب إرفاق واستعراض نتائج التحاليل والأشعة وصور التشخيص مباشرة داخل الملف الطبي للمريض.',
          iconCode: 'image',
        ),
      ],
      architectureEn: [
        ArchitectureLayer(
          name: 'Presentation Layer',
          description: 'Responsive UI layouts with BLoC / Cubit state management, dark & light themes, RTL/LTR localization, shimmer loading, and adaptive widgets.',
          items: ['BLoC / Cubit', 'State Management', 'Adaptive UI', 'RTL / LTR Localization', 'Theme Engine'],
        ),
        ArchitectureLayer(
          name: 'Domain Layer',
          description: 'Pure Dart business logic containing Entities, Use Cases, and Repository Contracts with functional error handling using Dartz Either.',
          items: ['Business Entities', 'Use Cases', 'Repository Interfaces', 'Failures & Exceptions', 'Dartz Either'],
        ),
        ArchitectureLayer(
          name: 'Data Layer',
          description: 'Concrete repository implementations handling Supabase PostgreSQL integration, PL/pgSQL RPC calls, Edge Functions, and local caching.',
          items: ['Repository Implementations', 'Data Sources (Remote & Local)', 'Data Models & Mappers', 'PL/pgSQL RPCs', 'Supabase Client'],
        ),
      ],
      architectureAr: [
        ArchitectureLayer(
          name: 'طبقة العرض (Presentation)',
          description: 'واجهات متجاوبة مع إدارة الحالة عبر BLoC / Cubit، دعم الوضع الداكن والفاتح، تعريب كامل RTL/LTR، وتأثيرات تحميل وتفاعل متقدمة.',
          items: ['BLoC / Cubit', 'إدارة الحالة', 'واجهات متجاوبة', 'تعريب RTL / LTR', 'محرك الثيمات'],
        ),
        ArchitectureLayer(
          name: 'طبقة النطاق (Domain)',
          description: 'منطق العمل البرمجي المستقل (Pure Dart) المحتوي على الكيانات وحالات الاستخدام وعقود المستودعات ومعالجة الأخطاء الوظيفية بـ Dartz Either.',
          items: ['الكيانات (Entities)', 'حالات الاستخدام (Use Cases)', 'واجهات المستودعات (Contracts)', 'معالجة الأخطاء', 'Dartz Either'],
        ),
        ArchitectureLayer(
          name: 'طبقة البيانات (Data)',
          description: 'تنفيذ المستودعات والتكامل مع قاعدة بيانات Supabase واستدعاءات PL/pgSQL RPCs و Edge Functions وإدارة التخزين المؤقت المحلي.',
          items: ['تنفيذ المستودعات (Repo Impls)', 'مصادر البيانات (DataSources)', 'النماذج والتحويل (Models)', 'دوال RPC السيرفرية', 'Supabase Client'],
        ),
      ],
      challengesEn: [
        ProjectChallenge(
          challenge: 'Secure staff onboarding without admin credential compromise (Staff Invitation & Multi-Tenant Deep-Linking)',
          solution: 'Replaced manual admin credential creation with a cryptographically signed invitation system (State Machine: Pending > Accepted > Expired). Invites generate expiring tokens delivered via email; clicking opens the Flutter app via Deep Linking, allowing staff to set private passwords independently, securing Audit Logs and enabling doctors to switch across multiple clinics seamlessly.',
        ),
        ProjectChallenge(
          challenge: 'Complex analytical reports without client overhead (Zero N+1 Network & Client Overhead)',
          solution: 'Built a dedicated server-side reporting engine using PL/pgSQL RPCs that execute aggregation, joins, and metric calculations directly inside the database engine, returning all multi-dimensional analytics in a single round-trip and eliminating N+1 queries.',
        ),
        ProjectChallenge(
          challenge: 'Complete data isolation in multi-tenant environment (Multi-Tenant Zero-Trust Security)',
          solution: 'Enforced strict Row Level Security (RLS) policies in PostgreSQL validated against JWT claims and clinic_id on every operation, preventing unauthorized cross-tenant data access even if client-side queries are tampered with.',
        ),
        ProjectChallenge(
          challenge: 'Dynamic multi-mode patient queue management (Dynamic Multi-System Queue Engine)',
          solution: 'Architected a queue engine supporting 4 operational modes (Arrival, Booking, Pattern, Scheduled) with a customizable Pattern Builder to alternate between regular, urgent, and follow-up consultations with seamless reactive state updates.',
        ),
        ProjectChallenge(
          challenge: 'Protecting SaaS features and trial subscriptions from tampering (Server-Authoritative Feature Gate)',
          solution: 'Established the central DB server clock as the single source of truth via PostgreSQL Security Definer functions and Edge Functions, verifying tier validity and feature limits before executing any premium feature regardless of device time.',
        ),
        ProjectChallenge(
          challenge: 'Adaptive multi-platform UI architecture (Adaptive Cross-Platform Responsive Layout)',
          solution: 'Engineered a unified responsive layout architecture (ResponsiveHelper & Adaptive Layouts) that transforms interfaces dynamically between touch and mouse/keyboard paradigms (multi-pane master-detail views, bottom sheets to dialogs) with full RTL and dark mode support.',
        ),
        ProjectChallenge(
          challenge: 'High-performance dynamic medical prescription & PDF generation (Dynamic Prescription & PDF Pipeline)',
          solution: 'Offloaded prescription formatting and high-resolution vector PDF compilation to isolated background worker logic, featuring extensive customization for clinic branding, doctor credentials, and digital verification barcodes without UI thread hitching.',
        ),
        ProjectChallenge(
          challenge: 'Maintainable and crash-resilient multi-feature architecture (Clean Architecture & Robust Error Handling)',
          solution: 'Structured the codebase into 3 strictly decoupled layers using Clean Architecture, BLoC/Cubit, and GetIt/Injectable DI, paired with Dartz (Either Type) functional error handling to encapsulate exceptions into explicit typed failures and eliminate unexpected crashes.',
        ),
      ],
      challengesAr: [
        ProjectChallenge(
          challenge: 'نظام دعوة الموظفين وحماية خصوصية الحسابات (Staff Invitation & Multi-Tenant Deep-Linking)',
          solution: 'استبدال الإنشاء اليدوي لكلمات المرور بنظام دعوات مشفر (State Machine: Pending > Accepted > Expired) بروابط Deep Linking مع وقت انتهاء صلاحية. يتيح للموظف تعيين كلمته السرية بنفسه لحماية سجلات التدقيق (Audit Logs) وإلغاء معرفة المدير للباسورد، مع تمكين الأطباء من العمل في عدة عيادات بحساب موحد والتبديل بينها.',
        ),
        ProjectChallenge(
          challenge: 'تقارير تحليلية معقدة بدون إثقال الهاتف (Zero N+1 Network & Client Overhead)',
          solution: 'بناء محرك تقارير متكامل عبر دوال PL/pgSQL RPCs يعمل بالكامل على الـ Database Engine ليتم تجميع وحساب البيانات على السيرفر بطلب شبكي واحد (Single Round-trip)، مما خفّض استهلاك الرام ومعالج الهاتف وقضى تماماً على مشكلة الـ N+1 Queries.',
        ),
        ProjectChallenge(
          challenge: 'عزل تام للبيانات في بيئة متعددة العيادات (Multi-Tenant Zero-Trust Security)',
          solution: 'تطبيق سياسات أمان صارمة على مستوى الصفوف Row Level Security (RLS) في PostgreSQL مع التحقق من صلاحيات JWT Claims وربط كل عملية بـ clinic_id، مما يمنع وصول أي مستخدم لبيانات عيادة أخرى برمجياً حتى لو حاول تعديل الاستعلامات من جهة العميل.',
        ),
        ProjectChallenge(
          challenge: 'خوارزمية ذكية ومرنة لإدارة طوابير الانتظار (Dynamic Multi-System Queue Engine)',
          solution: 'بناء محرك طوابير يدعم 4 أنظمة ديناميكية (Arrival, Booking, Pattern, Scheduled) مع إتاحة الـ Pattern Builder لتخصيص دورات الكشف، وإدارة الحالات اللحظية للمرضى وتحديثها في الـ State بشكل تفاعلي سلس.',
        ),
        ProjectChallenge(
          challenge: 'حماية ميزات الـ SaaS والاشتراكات من التلاعب (Server-Authoritative Feature Gate)',
          solution: 'جعل السيرفر هو المصدر الوحيد للحقيقة (Source of Truth) عبر PostgreSQL Security Definer Functions و Edge Functions لفحص سريان الباقة وحدود الميزات اعتماداً على ساعة الـ DB Server المركزية قبل تنفيذ أي ميزة مدفوعة.',
        ),
        ProjectChallenge(
          challenge: 'بنية واجهات متجاوبة لمنصات متعددة (Adaptive Cross-Platform Responsive Layout)',
          solution: 'تصميم معمارية استجابة مخصصة (ResponsiveHelper & Adaptive Layouts) تعيد تشكيل الواجهات ديناميكياً (كالتحول بين الـ Bottom Sheets والـ Dialogs، أو تقسيم الشاشات إلى Multi-Pane Views في التابلت والديسكتوب) مع دعم كامل للـ RTL والـ Dark Mode.',
        ),
        ProjectChallenge(
          challenge: 'مرونة صياغة الروشتات وتوليد الـ PDF الطبي بكفاءة عالية (Dynamic Prescription & PDF Pipeline)',
          solution: 'فصل معالجة بيانات الروشتة وعمليات بناء الـ PDF داخل Isolate/Background logic مستقل، مع دعم مصفوفة تخصيص شاملة لبيانات الطبيب والعيادة والباركود الرقمي دون تجميد واجهة المستخدم.',
        ),
        ProjectChallenge(
          challenge: 'معمارية قابلة للاختبار والصيانة وعزل منطق العمل (Clean Architecture & Robust Error Handling)',
          solution: 'تطبيق معمارية Clean Architecture الصارمة المفصولة لثلاث طبقات مستقلة، واستخدام BLoC/Cubit مع حقن التبعيات GetIt/Injectable، وتطبيق مبادئ البرمجة الوظيفية عبر Dartz (Either Type) لحصر ومعالجة الـ Exceptions وتحويلها إلى Failures واضحة تمنع انهيار التطبيق.',
        ),
      ],
      contributionsEn: [
        'Designed the full Clean Architecture structure with GetIt, Injectable, and Dartz for functional error handling.',
        'Built the server-side reporting engine with PL/pgSQL RPCs covering 7+ report types (financial, aging, branch comparison, doctor KPIs, medication analytics, patient demographics).',
        'Implemented the staff invitation lifecycle (Pending/Accepted/Expired) with Deep Linking and custom JWT claims for multi-clinic workspaces.',
        'Implemented zero-trust RLS policies and RBAC with custom JWT claims across all database tables.',
        'Integrated SaaS subscription flow with server-clock verification and Paymob payments via Edge Functions.',
        'Developed the EMR module with e-prescription PDF export, medication templates, and medical image uploads.',
      ],
      contributionsAr: [
        'تصميم هيكل Clean Architecture بالكامل مع GetIt و Injectable و Dartz لمعالجة الأخطاء الوظيفية.',
        'بناء محرك التقارير السيرفري عبر PL/pgSQL RPCs يغطي +7 أنواع تقارير (مالية، أعمار ديون، مقارنة فروع، أداء أطباء، تحليل أدوية، ديموغرافيا مرضى).',
        'بناء نظام دعوات الموظفين المتكامل (Pending/Accepted/Expired) مع الـ Deep Linking والـ JWT Claims لدعم تعدد العيادات.',
        'تنفيذ سياسات RLS و RBAC مع JWT Claims على كافة جداول قاعدة البيانات.',
        'ربط نظام الاشتراكات SaaS مع التحقق من ساعة السيرفر ومدفوعات Paymob عبر Edge Functions.',
        'تطوير وحدة الملف الطبي EMR مع تصدير الروشتة PDF وقوالب الأدوية ورفع صور التحاليل والأشعة.',
      ],
      userFeaturesEn: [
        ProjectFeature(
          title: 'Owner: Multi-Branch & BI Analytics Hub',
          description: 'Unified command center across branches. Track revenue, branch comparison, doctor KPIs, receivables aging, appointment trends, and patient retention powered by server RPCs.',
          iconCode: 'analytics',
        ),
        ProjectFeature(
          title: 'Staff Invitations & Multi-Clinic Workspace',
          description: 'Send expiring invitation links with preset roles. Staff create their own secure passwords without admin exposure, and doctors can switch between multiple clinic accounts effortlessly.',
          iconCode: 'people',
        ),
        ProjectFeature(
          title: 'Doctor: Smart EMR & Clinical Records',
          description: 'Comprehensive patient medical history, diagnoses, allergies, and chronic diseases with instant retrieval and continuous timeline tracking.',
          iconCode: 'medical',
        ),
        ProjectFeature(
          title: 'E-Prescriptions & PDF Generator',
          description: 'Instant prescription builder from a curated medication database with customizable dosage templates and high-resolution vector PDF export.',
          iconCode: 'file',
        ),
        ProjectFeature(
          title: 'Medical Image & Diagnostic Hub',
          description: 'Attach, zoom, and review lab results, X-rays, and radiology scans directly inside the consultation screen for seamless diagnosis.',
          iconCode: 'image',
        ),
        ProjectFeature(
          title: 'Secretary: Smart Scheduling & No-Show Tracking',
          description: 'Interactive appointment booking with no-show flags, urgent slot assignments, and duplicate-prevention patient directory search.',
          iconCode: 'calendar',
        ),
        ProjectFeature(
          title: 'Billing, Invoicing & Expense Tracker',
          description: 'Issue comprehensive medical invoices, manage installment & partial payments, track daily clinic expenses, and prevent revenue leakage.',
          iconCode: 'receipt',
        ),
        ProjectFeature(
          title: 'Dynamic Multi-System Patient Queue',
          description: 'Step-by-step patient flow (Waiting > Called > In-Progress > Done) supporting 4 queuing modes with real-time cross-device sync.',
          iconCode: 'queue',
        ),
      ],
      userFeaturesAr: [
        ProjectFeature(
          title: 'المالك: إدارة الفروع المتعددة وتحليلات BI',
          description: 'مركز تحكم موحد لإدارة الفروع ومتابعة الإيرادات والمصروفات ومقارنة أداء الفروع والأطباء وأعمار الديون وتقارير الاحتفاظ بالمرضى.',
          iconCode: 'analytics',
        ),
        ProjectFeature(
          title: 'نظام دعوة الموظفين والتبديل بين العيادات',
          description: 'إرسال روابط دعوة مؤقتة بالدور المحدد. يعيّن الموظف كلمة مروره بخصوصية تامة بدون معرفة المدير، مع تمكين الطبيب من التبديل بين عياداته بسلاسة.',
          iconCode: 'people',
        ),
        ProjectFeature(
          title: 'الطبيب: ملف طبي إلكتروني EMR متكامل',
          description: 'سجل طبي شامل يضم التشخيصات والحساسية والأمراض المزمنة وتاريخ الزيارات السابقة مع استرجاع فوري للبيانات أثناء الكشف.',
          iconCode: 'medical',
        ),
        ProjectFeature(
          title: 'روشتات إلكترونية ذكية وتصدير PDF',
          description: 'كتابة الروشتة من قاعدة بيانات الأدوية مع قوالب جرعات جاهزة للتكرار السريع، وتوليد ملف PDF عالي الدقة جاهز للطباعة أو الإرسال.',
          iconCode: 'file',
        ),
        ProjectFeature(
          title: 'معرض الأشعة والتحاليل الطبية',
          description: 'إرفاق واستعراض صور الأشعة والتحاليل ونتائج المختبرات داخل ملف المريض وتكبيرها لتقديم تشخيص دقيق وشامل.',
          iconCode: 'image',
        ),
        ProjectFeature(
          title: 'السكرتارية: جدول مواعيد ذكي وتتبع الحضور',
          description: 'حجز المواعيد مع تمييز الحالات المستعجلة ورصد الغياب (No-Shows)، والبحث الفوري في دليل المرضى بالاسم أو الهاتف مع منع التكرار.',
          iconCode: 'calendar',
        ),
        ProjectFeature(
          title: 'الفوترة الطبية ومتابعة المصروفات اليومية',
          description: 'إصدار فواتير الخدمات الطبية، إدارة الدفعات الجزئية والآجلة، وتسجيل المصروفات النثرية اليومية لمنع أي تسريب مالي.',
          iconCode: 'receipt',
        ),
        ProjectFeature(
          title: 'محرك طوابير ديناميكي متعدد الأنظمة',
          description: 'إدارة مسار المرضى خطوة بخطوة (انتظار > استدعاء > كشف > انتهاء) بـ 4 أنظمة كشف مختلفة مع تزامن لحظي فوري على كل الأجهزة.',
          iconCode: 'queue',
        ),
      ],
      heroImageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789210754/inner_section.webp',
      screenshots: [
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/owner_dashboard.webp',
          titleEn: 'Owner Dashboard & Real-Time KPIs',
          titleAr: 'لوحة تحكم المالك والمؤشرات اللحظية',
          descriptionEn: 'High-level business overview with revenue metrics, active branches, appointment volumes, and performance KPIs.',
          descriptionAr: 'نظرة شاملة ومؤشرات أداء لحظية لإجمالي الإيرادات، الفروع النشطة، حجم المواعيد، ونسب الإشغال.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/clinics_screen.webp',
          titleEn: 'Multi-Clinic & Branch Management',
          titleAr: 'إدارة الفروع والعيادات المتعددة',
          descriptionEn: 'Centralized directory to configure, monitor, and manage multiple branches under one unified SaaS organization.',
          descriptionAr: 'دليل مركزي لإدارة وإعداد ومتابعة كافة فروع المنشأة الطبية تحت حساب مؤسسي موحد.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/doctor_dashboard_screen.webp',
          titleEn: 'Doctor Clinical Dashboard & Queue',
          titleAr: 'لوحة تحكم الطبيب وطابور الكشف',
          descriptionEn: 'Doctor workflow command center displaying active patient queues, today\'s consultation schedule, and quick EMR actions.',
          descriptionAr: 'مركز عمل الطبيب لعرض طابور الانتظار اللحظي، مواعيد اليوم، والوصول السريع للملفات الطبية والروشتات.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789207741/medical_records.webp',
          titleEn: 'Smart EMR & Patient Medical Records',
          titleAr: 'الملف الطبي الإلكتروني EMR وسجل الزيارات',
          descriptionEn: 'Complete patient clinical history including diagnoses, chronic conditions, allergies, past visits, and attached radiology/lab scans.',
          descriptionAr: 'سجل طبي إلكتروني شامل يضم التشخيصات، الأمراض المزمنة، الحساسية، تاريخ الزيارات، وصور الأشعة والتحاليل.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/drugs_screen.webp',
          titleEn: 'Medication Database & Dosages',
          titleAr: 'قاعدة بيانات الأدوية وقوالب الجرعات',
          descriptionEn: 'Comprehensive drug formulary with dosage presets, active ingredients, and reusable prescription templates.',
          descriptionAr: 'دليل الأدوية التفاعلي مع قوالب الجرعات المسبقة والمواد الفعالة لتسريع كتابة الروشتات الطبية.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/invoices_screen.webp',
          titleEn: 'Medical Invoicing & Ledger History',
          titleAr: 'فواتير الخدمات الطبية والمدفوعات',
          descriptionEn: 'Comprehensive invoice management tracking paid, partial, and pending balances across all clinic services.',
          descriptionAr: 'إدارة متكاملة للفواتير الطبية وتتبع المبالغ المدفوعة والمتبقية والآجلة لكافة خدمات العيادة.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/add_invoice_sheet.webp',
          titleEn: 'Fast Invoice Generation & Payment Processing',
          titleAr: 'إصدار فاتورة جديدة ومعالجة الدفع',
          descriptionEn: 'Quick modal sheet to add multi-item services, apply discounts, select payment methods, and record transactions.',
          descriptionAr: 'نافذة سريعة لإضافة الخدمات الطبية، تطبيق الخصومات، واختيار طرق الدفع وإصدار إيصال السداد.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/appointments_screen.webp',
          titleEn: 'Appointment Scheduling & Queue Status',
          titleAr: 'جدول المواعيد ومتابعة تدفق الحالات',
          descriptionEn: 'Calendar scheduling interface with real-time patient queue stages: Waiting, Called, In-Progress, and Completed.',
          descriptionAr: 'واجهة جدولة المواعيد مع رصد لحظي لمراحل الكشف (في الانتظار، تم الاستدعاء، جاري الكشف، منتهي).',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/add_appointment.webp',
          titleEn: 'Smart Appointment Booking & Urgent Slots',
          titleAr: 'حجز موعد جديد وتخصيص الحالات المستعجلة',
          descriptionEn: 'Seamless patient appointment creation with doctor selection, date-time pickers, and urgent consultation tags.',
          descriptionAr: 'شاشة حجز مرنة تتيح اختيار الطبيب، تحديد التوقيت بدقة، وتمييز الحالات المستعجلة أو المراجعات.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/financial_report.webp',
          titleEn: 'Server-Side Financial & Revenue Report',
          titleAr: 'التقرير المالي وتحليلات الإيرادات السيرفرية',
          descriptionEn: 'Advanced financial analytics computed via PL/pgSQL RPCs covering net revenue, expense breakdown, and profit margins.',
          descriptionAr: 'تحليلات مالية متقدمة عبر دوال RPC السيرفرية تعرض صافي الإيرادات، المصروفات، وهوامش الأرباح.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/financial_receivables_report.webp',
          titleEn: 'Receivables Aging & Outstanding Debts',
          titleAr: 'تقرير أعمار الديون والمستحقات المالية',
          descriptionEn: 'Detailed aging of receivables report tracking outstanding patient balances and collection status across intervals.',
          descriptionAr: 'تقرير أعمار الديون لمتابعة مستحقات العيادة والمبالغ المتأخرة على المرضى وجدولة التحصيل.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/doctor_performance_report.webp',
          titleEn: 'Doctor KPIs & Clinical Performance Report',
          titleAr: 'تقرير تقييم أداء وإنتاجية الأطباء',
          descriptionEn: 'Comprehensive physician performance metrics tracking consultation counts, generated revenue, and average patient duration.',
          descriptionAr: 'مؤشرات أداء تفصيلية للأطباء تشمل عدد الكشوفات، مساهمة الدخل، ومتوسط وقت الكشف لكل طبيب.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/clinics_report.webp',
          titleEn: 'Multi-Branch Comparative Analytics',
          titleAr: 'تقرير المقارنة التحليلية بين الفروع',
          descriptionEn: 'Branch-by-branch operational comparison showing comparative patient volumes, earnings, and resource utilization.',
          descriptionAr: 'مقارنة تشغيلية ومالية بين الفروع المختلفة لتحديد الفروع الأكثر كفاءة ونمواً.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/appointments_report.webp',
          titleEn: 'Appointments & No-Show Trend Report',
          titleAr: 'تقرير اتجاهات المواعيد ونسب الغياب',
          descriptionEn: 'Statistical breakdown of appointment bookings, cancellations, peak visiting hours, and no-show rates.',
          descriptionAr: 'إحصائيات دقيقة لحركة المواعيد، أوقات الذروة، ونسب إلغاء الحجوزات والغياب (No-Show).',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/manage_staff_screen.webp',
          titleEn: 'Staff Management & Role Assignments',
          titleAr: 'إدارة طاقم العمل والصلاحيات',
          descriptionEn: 'Control panel to oversee employed physicians, receptionists, and nurses with instant status toggling and role overrides.',
          descriptionAr: 'لوحة تحكم لإدارة الأطباء وطاقم السكرتارية والتمريض مع تعيين وتعديل الصلاحيات الفردية.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/invite_staff_screen.webp',
          titleEn: 'Secure Role-Based Staff Invitations',
          titleAr: 'إرسال دعوة موظف جديد بروابط مشفرة',
          descriptionEn: 'Owner portal to dispatch role-bound expiring invitation tokens for secure self-onboarding without password sharing.',
          descriptionAr: 'بوابة إرسال دعوات مؤقتة ومحددة الدور مسبقاً لضمان خصوصية الموظف وتعيين كلمته السرية بنفسه.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789207741/accept_invitation.webp',
          titleEn: 'Deep Link Invitation Acceptance & Setup',
          titleAr: 'تفعيل وقبول الدعوة عبر الـ Deep Linking',
          descriptionEn: 'Mobile onboarding view where invited staff verify their credentials and set their private passwords via deep link.',
          descriptionAr: 'شاشة استقبال وقبول الدعوة عبر الرابط الذكي وتمكين الموظف من تفعيل حسابه بكلمة مرور خاصة.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/invite_friends_screen.webp',
          titleEn: 'Referral & Clinic Invitation Program',
          titleAr: 'برنامج الإحالات ومشاركة المنصة',
          descriptionEn: 'Built-in referral program allowing clinic owners to recommend the SaaS platform to other medical practices.',
          descriptionAr: 'نظام إحالة متكامل يتيح لملاك العيادات دعوة زملاء المهنة للاستفادة من المنصة.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206195/owner_settings_screen.webp',
          titleEn: 'Clinic Organization & SaaS Subscription Settings',
          titleAr: 'إعدادات المنشأة وإدارة باقة الاشتراك',
          descriptionEn: 'Configure clinic branding, working shifts, currency formats, and manage active SaaS subscription tiers.',
          descriptionAr: 'تخصيص هوية العيادة، مواعيد العمل، العملة الافتراضية، ومتابعة ترقية وتجديد باقات الاشتراك.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789206198/login_screen.webp',
          titleEn: 'Secure Authentication & Multi-Role Login',
          titleAr: 'تسجيل الدخول الآمن والتحقق من الدور',
          descriptionEn: 'JWT-authenticated login portal with custom claims directing users dynamically to their role-specific dashboard.',
          descriptionAr: 'بوابة تسجيل دخول آمنة عبر JWT Claims توجه المستخدم تلقائياً للوحة التحكم المخصصة لدوره.',
        ),
      ],
      githubUrl: AppLinks.clinicProRepo,
      isFeatured: true,
      metrics: {
        'Security': 'Zero-Trust RLS',
        'Reports': '7+ Server RPCs',
        'Model': 'Multi-Tenant SaaS',
        'Platform': 'Cross-Platform',
      },
    ),

    // 2. Kemet Odyssey
    const ProjectEntity(
      id: 'kemet-odyssey',
      titleEn: 'Kemet Odyssey',
      titleAr: 'كيميت أوديسي (Kemet Odyssey)',
      subtitleEn: 'Smart Egyptian Tourism & Multi-Day Travel Planning Platform',
      subtitleAr: 'تطبيق سياحي ذكي لاستكشاف معالم مصر وتخطيط الرحلات متعددة الأيام',
      categoryEn: 'Tourism & Smart Travel',
      categoryAr: 'سياحة وتخطيط رحلات ذكي',
      overviewEn: 'A travel companion mobile platform for exploring Egypt\'s heritage and modern attractions. Built with Flutter, it features an algorithmic Multi-Day Smart Travel Plan Generator that calculates geographic proximity to minimize transit overhead, 3D artifact models, interactive Google Maps clustering, and multi-provider Firebase Authentication.',
      overviewAr: 'منصة سياحية متكاملة لاستكشاف المعالم الأثرية والحديثة في مصر. تم تطويرها بـ Flutter وتتميز بمحرك خوارزمي لتوليد خطط سفر ذكية متعددة الأيام يراعي التقارب الجغرافي لتقليل التنقل، مع نماذج تفاعلية ثلاثية الأبعاد (3D Models)، وخرائط Google التفاعلية، ودعم تسجيل الدخول الموثوق عبر Firebase.',
      problemEn: 'Travelers visiting Egypt struggle with fragmented information across scattered sources, inefficient and exhausting travel routes between distant attractions, lack of personalized multi-day itineraries, and absence of 3D visual previews prior to visiting historical sites.',
      problemAr: 'يواجه السياح وزوار المعالم المصرية تشتت المعلومات بين مصادر متعددة، وإرهاق التنقل غير المنظم بين المعالم المتباعدة، وغياب خطط سياحية مخصصة حسب أيام واهتمامات الزائر، وعدم توفر معاينات ثلاثية الأبعاد للمعالم.',
      solutionEn: 'A production-ready cross-platform application architected with Clean Architecture + BLoC, featuring a dedicated Smart Travel Plan Generator algorithm (factoring in duration, tourism types, and geolocation distances), interactive Google Maps integration, 3D model rendering, and structured offline-ready local storage.',
      solutionAr: 'تطبيق احترافي متجاوب مبني بمعمارية Clean Architecture و BLoC، يضم خوارزمية ذكية لتوليد خطط الرحلات تحسب المسافات الجغرافية وتراعي التفضيلات والمدة، مع دمج خرائط Google ومعاينة النماذج ثلاثية الأبعاد والتخزين المحلي المنظم.',
      technologies: [
        'Flutter & Dart',
        'BLoC / Cubit',
        'Clean Architecture',
        'SOLID Principles',
        'Dependency Injection (GetIt)',
        'REST APIs & HTTP Client',
        'Firebase Auth & Firestore',
        'Google Maps & Clustering',
        'Geolocation & Distance Matrix',
        '3D Model Rendering',
        'Local Storage & Caching',
        'Adaptive Responsive UI',
      ],
      featuresEn: [
        ProjectFeature(
          title: 'Algorithmic Smart Travel Plan Generator',
          description: 'A multi-parameter trip generator that factors in target city, trip duration in days, preferred tourism categories, and geospatial distances to construct optimized day-by-day itineraries with dedicated visit durations, rest stops, and meal intervals while eliminating redundant transit.',
          iconCode: 'itinerary',
        ),
        ProjectFeature(
          title: 'Deep Destination Guides & 3D Interactive Models',
          description: 'Rich attraction profiles containing curated multi-angle galleries, interactive 3D landmark models, operating hours, ticket pricing breakdowns, contact information, and verified traveler recommendations.',
          iconCode: 'image',
        ),
        ProjectFeature(
          title: 'Google Maps Spatial Clustering & Route Exploration',
          description: 'Custom-styled Google Maps integration featuring real-time location tracking, dynamic marker clustering, distance calculations, and instant route preview between historical sites.',
          iconCode: 'map',
        ),
        ProjectFeature(
          title: 'Multi-Tier Plans: Free & Premium Curated Itineraries',
          description: 'Support for generating alternative plan variations per request, allowing travelers to choose, bookmark, and rate customized itineraries with distinction between standard and premium curated tours.',
          iconCode: 'star',
        ),
        ProjectFeature(
          title: 'Multi-Provider Authentication & Cloud Bookmarks',
          description: 'Robust user authentication supporting multiple identity providers via Firebase Auth, with seamless cloud synchronization of saved bookmarks, custom itineraries, and user reviews.',
          iconCode: 'security',
        ),
      ],
      featuresAr: [
        ProjectFeature(
          title: 'محرك توليد خطط السفر الذكية (Smart Plan Generator)',
          description: 'خوارزمية مخصصة تبني مسارات سياحية متعددة الأيام اعتماداً على المدينة المختارة، مدة الرحلة، أنواع السياحة المفضلة، والحسابات الجغرافية لترتيب الأماكن وتقليل التنقل غير الضروري، مع بناء Timeline ينظم أوقات الزيارة والراحة والوجبات.',
          iconCode: 'itinerary',
        ),
        ProjectFeature(
          title: 'أدلة معالم شاملة ونماذج ثلاثية الأبعاد (3D Models)',
          description: 'صفحات تفصيلية لكل معلم تشمل معارض الصور، نماذج 3D تفاعلية، الموقع الجغرافي الدقيق، مواعيد العمل، أسعار التذاكر، وبيانات التواصل.',
          iconCode: 'image',
        ),
        ProjectFeature(
          title: 'خرائط Google وتجميع النقاط الجغرافية (Clustering)',
          description: 'تكامل كامل مع Google Maps يدعم التجميع الذكي للعلامات (Marker Clustering)، تحديد الموقع اللحظي، وحساب المسافات ومسارات التنقل بين المعالم السياحية.',
          iconCode: 'map',
        ),
        ProjectFeature(
          title: 'خطط متعددة ودعم الخطط المجانية والمدفوعة (Premium)',
          description: 'إمكانية توليد عدة بدائل للرحلة الواحدة بدل الاعتماد على مسار وحيد، مع دعم تقييم الخطط وحفظها، والتمييز بين الخطط المجانية والخطط المميزة (Premium Plans).',
          iconCode: 'star',
        ),
        ProjectFeature(
          title: 'تسجيل دخول متعدد وتزامن سحابي (Firebase Auth)',
          description: 'توثيق المستخدمين عبر أكثر من وسيلة تسجيل دخول مدعومة بـ Firebase Auth، مع مزامنة سحابية فورية لقوائم المفضلة والخطط المحفوظة والتقييمات.',
          iconCode: 'security',
        ),
      ],
      architectureEn: [
        ArchitectureLayer(
          name: 'Presentation Layer',
          description: 'Ancient Egyptian aesthetic-inspired UI built with Flutter, reactive BLoC/Cubit state management, sliver scrolling, responsive multi-breakpoint layouts, and smooth 60fps animations.',
          items: ['BLoC / Cubit', 'State Management', 'Sliver Views', 'Google Maps Widget', 'Responsive Layout', '3D Viewport Engine'],
        ),
        ArchitectureLayer(
          name: 'Domain Layer',
          description: 'Pure Dart business logic adhering to SOLID principles, containing Entities, Use Cases for itinerary generation and distance algorithms, and functional error handling contracts.',
          items: ['Business Entities', 'Use Cases', 'Itinerary Engine Contracts', 'Repository Interfaces', 'Domain Failures'],
        ),
        ArchitectureLayer(
          name: 'Data Layer',
          description: 'Robust data management implementing Repository pattern with remote REST APIs, Firebase Firestore & Auth, local caching storage, and explicit Model-to-Entity mappers.',
          items: ['Repository Implementations', 'REST API Client', 'Firebase Auth & Store', 'Local Storage DataSources', 'DTOs & Mappers'],
        ),
      ],
      architectureAr: [
        ArchitectureLayer(
          name: 'طبقة العرض (Presentation)',
          description: 'واجهات مستوحاة من الهوية المصرية القديمة مع إدارة حالة تفاعلية عبر BLoC/Cubit، واستخدام Slivers للشاشات المعقدة وتوافق تام مع مختلف مقاسات الشاشات وسرعة 60 إطاراً/ثانية.',
          items: ['BLoC / Cubit', 'إدارة الحالة', 'عروض Slivers', 'ويدجت خرائط Google', 'تصميم متجاوب', 'عارض 3D Models'],
        ),
        ArchitectureLayer(
          name: 'طبقة النطاق (Domain)',
          description: 'منطق العمل البرمجي المستقل (Pure Dart) الملتزم بمبادئ SOLID، ويشمل الكيانات، حالات الاستخدام (Use Cases) لخوارزميات تخطيط الرحلات والحسابات الجغرافية، وعقود المستودعات.',
          items: ['الكيانات (Entities)', 'حالات الاستخدام (Use Cases)', 'عقود خوارزمية الرحلات', 'واجهات المستودعات', 'تصنيف الأخطاء (Failures)'],
        ),
        ArchitectureLayer(
          name: 'طبقة البيانات (Data)',
          description: 'تنفيذ المستودعات بنمط Repository Pattern، والتكامل مع REST APIs و Firebase Firestore & Auth، والتخزين المحلي، مع فصل كامل عبر Data Models ومحولات Mapping.',
          items: ['تنفيذ المستودعات (Repo Impls)', 'عميل REST APIs', 'خدمات Firebase', 'مصادر التخزين المحلي', 'نماذج البيانات (Models & Mappers)'],
        ),
      ],
      challengesEn: [
        ProjectChallenge(
          challenge: 'Algorithmic multi-day itinerary generation without travel fatigue (Smart Proximity Routing)',
          solution: 'Engineered a specialized itinerary algorithm factoring in geographic coordinates, opening hours, activity duration, and travel categories. It clusters geographically close landmarks per day to eliminate unnecessary transit and builds balanced timelines with rest and meal intervals.',
        ),
        ProjectChallenge(
          challenge: 'Rendering hundreds of interactive map markers at smooth 60 FPS (Map Viewport Clustering)',
          solution: 'Implemented client-side spatial marker clustering and bounded viewport loading with Google Maps SDK, dynamically merging nearby points of interest to maintain fluid 60fps frame rates.',
        ),
        ProjectChallenge(
          challenge: 'Integrating 3D artifact models & rich media without UI hitching (3D Viewport Optimization)',
          solution: 'Decoupled 3D model asset loading and caching into asynchronous background pipelines with fallback progressive image previews, preventing main UI thread blocking during complex render cycles.',
        ),
        ProjectChallenge(
          challenge: 'Enterprise-grade scalable codebase with decoupled dependencies (Clean Architecture & SOLID)',
          solution: 'Applied strict Clean Architecture separation (Data Source > Model > Repository > Entity > Use Case > BLoC > UI) with explicit mapping layers to ensure zero tight coupling, effortless testing, and future feature extensibility.',
        ),
      ],
      challengesAr: [
        ProjectChallenge(
          challenge: 'خوارزمية توليد خطط السفر متعددة الأيام بدون إرهاق التنقل (Smart Proximity Routing)',
          solution: 'بناء خوارزمية ذكية تعتمد على الإحداثيات الجغرافية وساعات العمل ونوع النشاط لترتيب المعالم، بحيث تجمّع الأماكن المتقاربة جغرافياً في نفس اليوم لتقليل زمن وتكلفة المواصلات، مع تنظيم فترات الراحة والوجبات في جدول زمني Timeline متوازن.',
        ),
        ProjectChallenge(
          challenge: 'عرض مئات المعالم على الخريطة بسلاسة تامة 60 FPS (Map Viewport Clustering)',
          solution: 'تطبيق خوارزميات التجميع المكاني (Marker Clustering) والتحميل المقيد بمجال رؤية الخريطة (Viewport Bounding) لدمج النقاط المتقاربة في مجموعات تفاعلية، مما منع هبوط الإطارات وحافظ على سلاسة الحركة.',
        ),
        ProjectChallenge(
          challenge: 'معاينة النماذج ثلاثية الأبعاد 3D والوسائط الغنية بدون تجميد الواجهة (3D Media Pipeline)',
          solution: 'فصل تحميل ومعالجة النماذج ثلاثية الأبعاد في مسارات غير متزامنة مع دعم المعاينة التدريجية للصور، مما ضمن عدم حجز الـ Main UI Thread أثناء الريندر المعقد.',
        ),
        ProjectChallenge(
          challenge: 'هيكلة مشروع ضخم وتوسعه بدون ترابط معقد (Clean Architecture & SOLID)',
          solution: 'تطبيق المعمارية النظيفة الصارمة (Data Source > Model > Repository > Entity > Use Case > BLoC > UI) مع التحويل الدقيق بين الـ Models والـ Entities وفصل مسؤوليات كل طبقة، مما جعل المشروع قابلاً للاختبار والتوسع وإضافة مميزات جديدة بسهولة.',
        ),
      ],
      contributionsEn: [
        'Architected the entire application structure following Clean Architecture, SOLID principles, and BLoC state management.',
        'Developed the proprietary Smart Travel Plan Generator algorithm optimizing geographic routing and daily timelines.',
        'Integrated interactive Google Maps with custom Egyptian themed styling, marker clustering, and geolocation tracking.',
        'Implemented 3D landmark model rendering and asynchronous image gallery handling.',
        'Engineered multi-provider Firebase Authentication and multi-tier plan structures (Free & Premium).',
      ],
      contributionsAr: [
        'تصميم المعمارية البرمجية بالكامل وفق Clean Architecture ومبادئ SOLID وإدارة الحالة بـ BLoC/Cubit.',
        'تطوير خوارزمية Smart Travel Plan Generator لتنظيم خطط الرحلات والمسافات الجغرافية وبناء الـ Timelines.',
        'دمج خرائط Google Maps مع علامات مخصصة وتجميع النقاط (Clustering) والتوجيه الجغرافي اللحظي.',
        'تضمين عارض النماذج ثلاثية الأبعاد 3D Models وإدارة معارض الصور والوسائط المتعددة.',
        'تنفيذ نظام المصادقة المتعددة عبر Firebase وتصميم هياكل الخطط المجانية والمميزة (Free & Premium).',
      ],
      userFeaturesEn: [
        ProjectFeature(
          title: 'Algorithmic Multi-Day Trip Planner',
          description: 'Generate customized day-by-day itineraries tailored to your chosen city, trip length, and interests with optimal geographic route ordering.',
          iconCode: 'itinerary',
        ),
        ProjectFeature(
          title: 'Interactive 3D Landmark Experience',
          description: 'Inspect detailed historical artifacts and monuments in interactive 3D viewports before visiting.',
          iconCode: 'image',
        ),
        ProjectFeature(
          title: 'Google Maps Navigation & Clustering',
          description: 'Explore monuments, nearby restaurants, and activities with GPS distance calculations and interactive clustered map pins.',
          iconCode: 'map',
        ),
        ProjectFeature(
          title: 'Free & Premium Alternative Itineraries',
          description: 'Generate multiple itinerary options per trip, compare route schedules, and unlock specialized curated premium tours.',
          iconCode: 'star',
        ),
        ProjectFeature(
          title: 'Favorites & Cross-Device Cloud Sync',
          description: 'Bookmark preferred destinations, save generated itineraries, and sync travel data across all your devices securely.',
          iconCode: 'security',
        ),
        ProjectFeature(
          title: 'Authentic Reviews & Practical Info',
          description: 'Access ticket prices, opening hours, contact data, and real traveler community reviews with photos.',
          iconCode: 'reviews',
        ),
      ],
      userFeaturesAr: [
        ProjectFeature(
          title: 'مخطط رحلات ذكي متعدد الأيام',
          description: 'إنشاء جداول سياحية يومية متناسقة ومخصصة حسب مدة إقامتك والمدينة واهتماماتك، مع ترتيب الأماكن لتقليل وقت التنقل.',
          iconCode: 'itinerary',
        ),
        ProjectFeature(
          title: 'معاينة المعالم بنماذج ثلاثية الأبعاد (3D)',
          description: 'استعراض النماذج ثلاثية الأبعاد للآثار والمعالم التاريخية والتفاعل معها قبل الذهاب لموقع الزيارة.',
          iconCode: 'image',
        ),
        ProjectFeature(
          title: 'خرائط Google التفاعلية والملاحة',
          description: 'استكشاف الأماكن السياحية والمطاعم المحيطة مع حساب المسافات بدقة وتجميع العلامات (Clustering).',
          iconCode: 'map',
        ),
        ProjectFeature(
          title: 'بدائل متعددة للخطط (مجانية ومميزة)',
          description: 'توليد أكثر من خيار للرحلة الواحدة مع تقييم الخطط ودعم الخطط المجانية والخطط المميزة (Premium).',
          iconCode: 'star',
        ),
        ProjectFeature(
          title: 'قائمة المفضلة والمزامنة السحابية',
          description: 'حفظ المعالم المفضلة والخطط السياحية والوصول إليها عبر مختلف أجهزتك بأمان عبر Firebase.',
          iconCode: 'security',
        ),
        ProjectFeature(
          title: 'تقييمات المسافرين ومعلومات الزيارة',
          description: 'الاطلاع على أسعار التذاكر ومواعيد العمل وبيانات التواصل وتجارب وتقييمات الزوار الحقيقية.',
          iconCode: 'reviews',
        ),
      ],
      heroImageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA7Z_XhYLZRjqilJ6rhJrBQ5CxVHFL5MZTDBWpomUJXMWcX6ZYGwxhJHz7-fCOr0w-U0HPeWFBixbtocmpdpdHjO1P0vyMwUFvquEh5X6JmSG4luwkK4ftXioEOZ1thscCh1K1yFszsqsuDdvROsagj0a4OPm77m0S8vNJYYef1H_OmN59hFic2E-7o8ImkmCpg_fe1xpQa14Z7muP_21Y35bcivTfTUB9PGoabtbNEN8p2wdAa9lf7tg',
      screenshots: [
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789211359/home_screen.webp',
          titleEn: 'Home & Destination Discovery',
          titleAr: 'الرئيسية واستكشاف الوجهات والمعالم',
          descriptionEn: 'Curated home feed featuring popular cities, top-rated historical monuments, fast search, and quick itinerary generator access.',
          descriptionAr: 'واجهة رئيسية غنية بأشهر المدن والمعالم الأثرية الأكثر تقييماً، مع بحث فوري ووصول مباشر لمولد الرحلات.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789211359/explore_cities.webp',
          titleEn: 'Explore Cities & Historic Sites',
          titleAr: 'استكشاف المدن والمزارات السياحية',
          descriptionEn: 'Browse tourist cities across Egypt with full site overviews, GPS locations, interactive 3D model previews, and traveler ratings.',
          descriptionAr: 'استعراض مدن مصر السياحية مع تفاصيل المعالم، الموقع الجغرافي، المعاينة ثلاثية الأبعاد (3D)، وتقييمات الزوار.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789211359/generate_plan.webp',
          titleEn: 'Algorithmic Trip Generator',
          titleAr: 'مخطط ومولد الرحلات السياحية الذكي',
          descriptionEn: 'Customize your itinerary based on city, travel duration, pace preference, and interests using smart proximity sorting.',
          descriptionAr: 'توليد جدول رحلة مخصص حسب المدينة، عدد الأيام، وتفضيلات السفر مع خوارزمية ذكية لترتيب المزارات وتقليل وقت التنقل.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789211359/explore_plans.webp',
          titleEn: 'Explore & Compare Travel Plans',
          titleAr: 'استعراض ومقارنة خطط الرحلات',
          descriptionEn: 'Compare curated multi-day tour options, estimated costs, activity count, and explore both Free and Premium curated routes.',
          descriptionAr: 'مقارنة خيارات الجداول السياحية المتنوعة، التكلفة التقديرية، عدد الأنشطة، والاطلاع على الخطط المجانية والمميزة (Premium).',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789211359/plan_details.webp',
          titleEn: 'Detailed Itinerary & Daily Timeline',
          titleAr: 'تفاصيل الخطة والجدول الزمني اليومي',
          descriptionEn: 'Step-by-step breakdown of daily stops, morning/afternoon schedules, map routes, recommended visit durations, and site tickets.',
          descriptionAr: 'جدول تفصيلي مقسم بالساعات والأيام لكل مزار سياحي، المسار على الخريطة، المدة المقترحة للزيارة، وأسعار التذاكر.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789211359/favorites_screen.webp',
          titleEn: 'Saved Favorites & Cloud Sync',
          titleAr: 'قائمة المفضلة والمزامنة السحابية',
          descriptionEn: 'Instant access to saved tourist landmarks, bookmarked plans, and notes synced securely across all user devices via Firebase.',
          descriptionAr: 'الوصول السريع للمعالم والخطط السياحية المحفوظة مع مزامنة سحابية لحظية عبر Firebase على كافة أجهزة المستخدم.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789211359/login_screen.webp',
          titleEn: 'Authentication & Personalized Profile',
          titleAr: 'تسجيل الدخول وإدارة الملف الشخصي',
          descriptionEn: 'Secure Firebase email and social sign-in with personalized travel preferences and account management.',
          descriptionAr: 'تسجيل دخول آمن وسريع عبر Firebase، مع تخصيص تفضيلات السفر وإدارة الحساب والخطط المحفوظة.',
        ),
      ],
      githubUrl: AppLinks.kemetOdysseyRepo,
      isFeatured: true,
      metrics: {
        'Algorithm': 'Proximity Routing',
        'Architecture': 'Clean + SOLID',
        'Maps': 'Google Maps SDK',
        '3D Preview': 'Interactive Models',
      },
    ),

    // 3. Smart Daftar ERP
    const ProjectEntity(
      id: 'smart-daftar',
      titleEn: 'Smart Daftar ERP',
      titleAr: 'سمارت دفتر (Smart Daftar ERP)',
      subtitleEn: 'Integrated Enterprise ERP & Financial Management Suite',
      subtitleAr: 'نظام محاسبي وإداري متكامل للشركات والمخازن متعددة الفروع',
      categoryEn: 'Enterprise ERP',
      categoryAr: 'أنظمة إدارة المؤسسات ERP',
      overviewEn: 'A high-performance enterprise ERP system built with C#, .NET Framework, and DevExpress on Microsoft SQL Server. It empowers retail, pharmacy, and multi-branch enterprises with dynamic inventory valuation (FIFO, LIFO, Weighted Average), real-time database sync via SQL Table Dependency, full accounting ledgers, and automated landing cost calculations.',
      overviewAr: 'نظام تخطيط موارد المؤسسات (ERP) عالي الأداء تم تطويره باستخدام C# و .NET و DevExpress وقاعدة بيانات SQL Server. يقدم حلاً هندسياً شاملاً لإدارة تجارة التجزئة والصيدليات والأنشطة متعددة الفروع، مع تقييم المخزون بأساليب (FIFO / LIFO / المتوسط المرجح)، والمزامنة اللحظية عبر SQL Table Dependency، وشجرة حسابات مالية متكاملة.',
      problemEn: 'Growing enterprises suffer from manual accounting discrepancies, inventory wastage, stockouts without reorder warnings, inaccurate profit margins due to untracked shipping/landing costs, and slow multi-terminal network synchronization.',
      problemAr: 'تعاني المؤسسات والشركات من الأخطاء الحسابية اليدوية، وركود أو تلف المخزون دون إنذارات مسبقة، وحساب غير دقيق للأرباح بسبب إغفال مصاريف الشحن والتوريد، وبطء مزامنة البيانات عبر أجهزة الشبكة المحلية.',
      solutionEn: 'An end-to-end ERP desktop ecosystem featuring real-time data push via SQL Table Dependency, dynamic Chart of Accounts with journal vouchers, comprehensive Inventory & Reorder Point monitoring, multi-currency purchasing with automated landing cost distribution, and Argon2-encrypted cloud license activation.',
      solutionAr: 'نظام ERP متكامل يربط نقاط البيع والمخازن بالحسابات العامة، مع مزامنة لحظية عبر SQL Table Dependency، وشجرة حسابات مرنة تدعم القيود اليومية والقوائم المالية، ونظام رقابة مخزنية ذكي، وتحميل المصاريف الإضافية على التكلفة، وتشفير عسكري بـ Argon2.',
      technologies: [
        'C# (.NET Framework)',
        'DevExpress Suite',
        'MS SQL Server',
        'SQL Table Dependency',
        'LINQ to SQL',
        'Firebase (Cloud Licensing)',
        'Argon2 Password Hashing',
        'Crystal Reports & DevExpress Reports',
        'Layered Architecture & OOP',
        'Export Pipeline (PDF/Excel/Word)',
      ],
      featuresEn: [
        ProjectFeature(
          title: 'Advanced Inventory & Valuation Engine (FIFO / LIFO / Avg)',
          description: 'Multi-unit conversion (Piece / Box / Carton), automated reorder point alerts, wastage/damage tracking, inter-branch stock transfers, and precise profit calculation via FIFO, LIFO, and Weighted Average costing methods.',
          iconCode: 'inventory',
        ),
        ProjectFeature(
          title: 'Real-Time Network Sync (SQL Table Dependency)',
          description: 'Instant event-driven UI updates across all network terminals using SQL Table Dependency, eliminating polling overhead and guaranteeing zero stale data in high-concurrency environments.',
          iconCode: 'database',
        ),
        ProjectFeature(
          title: 'Full Financial Cycle & Dynamic Chart of Accounts',
          description: 'Automated double-entry bookkeeping, manual journal vouchers, multi-cashbox treasury management, customer/vendor ledgers, and instant generation of Trial Balance, Income Statement, and Balance Sheet.',
          iconCode: 'money',
        ),
        ProjectFeature(
          title: 'Procurement & Automated Landing Cost Calculation',
          description: 'Full invoice/return cycles with sell-below-cost prevention, supplier price history, and automated apportionment of shipping, customs, and freight expenses onto unit cost prices.',
          iconCode: 'pos',
        ),
        ProjectFeature(
          title: 'Interactive BI Dashboards & 12-Month Trend Analytics',
          description: 'Executive dashboards visualizing Top 5 items, highest-margin products, top customers/vendors, and 12-month comparative sales vs. profit charts with instant Excel/PDF/Word export.',
          iconCode: 'chart',
        ),
        ProjectFeature(
          title: 'Granular RBAC Security & Military-Grade Encryption',
          description: 'Screen-level and action-level permissions (Add / Edit / Delete / Print), user-specific sales rules, automated scheduled backups, and Argon2 password hashing with Firebase cloud license verification.',
          iconCode: 'security',
        ),
      ],
      featuresAr: [
        ProjectFeature(
          title: 'محرك تقييم المخزون الذكي (FIFO / LIFO / المتوسط المرجح)',
          description: 'إدارة متطورة للأصناف متعددة الوحدات (قطعة، علبة، كرتونة) مع تحويل تلقائي، وتنبيهات فورية لنقاط إعادة الطلب (Reorder Point)، ومتابعة الهالك والراكد، والتحويل بين الفروع مع تقييم دقيق للتكلفة والأرباح.',
          iconCode: 'inventory',
        ),
        ProjectFeature(
          title: 'التحديث اللحظي للبيانات عبر الشبكة (SQL Table Dependency)',
          description: 'التقاط وتحديث البيانات فورياً على كافة الأجهزة في الشبكة المحلية عبر SQL Table Dependency، مما يلغي عمليات الـ Polling ويضمن سرعة خيالية وتزامناً دقيقاً بدون تعارض.',
          iconCode: 'database',
        ),
        ProjectFeature(
          title: 'نظام محاسبي متكامل وشجرة حسابات ديناميكية',
          description: 'شجرة حسابات (Chart of Accounts) مرنة، قيود يومية تلقائية ويدوية، إدارة الخزائن والصناديق ومقبوضات العملاء، مع استخراج ميزان المراجعة وقائمة الدخل والميزانية العمومية بدقة متناهية.',
          iconCode: 'money',
        ),
        ProjectFeature(
          title: 'المبيعات والمشتريات وحساب التكلفة الفعلية (Landing Cost)',
          description: 'دورة فواتير ومرتجعات كاملة، منع البيع بأقل من التكلفة مع إظهار الرصيد اللحظي، وتحميل مصاريف الشحن والجمارك والنقل تلقائياً على سعر شراء الصنف لحساب التكلفة الحقيقية بدقة.',
          iconCode: 'pos',
        ),
        ProjectFeature(
          title: 'لوحة تحكم إحصائية تفاعلية وتحليلات 12 شهراً',
          description: 'شاشات BI تعرض أعلى 5 أصناف ربحية وأكثر العملاء والموردين تعاملاً، مع رسوم بيانية لمقارنة مبيعات وأرباح 12 شهراً وإمكانية تصدير التقارير لـ (Excel / PDF / Word).',
          iconCode: 'chart',
        ),
        ProjectFeature(
          title: 'نظام أمان وصلاحيات دقيق وتشفير عسكري بـ Argon2',
          description: 'تحكم كامل في صلاحيات كل مستخدم (إضافة، تعديل، حذف، طباعة) على مستوى كل شاشة، نظام نسخ احتياطي مجدول وتلقائي، وتشفير لكلمات المرور بخوارزمية Argon2 مع تفعيل التراخيص سحابياً عبر Firebase.',
          iconCode: 'security',
        ),
      ],
      architectureEn: [
        ArchitectureLayer(
          name: 'Presentation & UI Layer',
          description: 'Rich desktop interfaces built with C# WinForms and DevExpress Controls, offering responsive grids, custom themes, data-bound reporting viewers, and real-time interactive dashboards.',
          items: ['DevExpress XtraBars', 'Interactive Grids', 'XtraCharts Engine', 'Dashboard Viewports', 'Theme Manager'],
        ),
        ArchitectureLayer(
          name: 'Business Logic & Valuation Layer',
          description: 'Core domain services managing inventory costing algorithms (FIFO/LIFO/Average), landing cost distribution, double-entry accounting rules, and granular RBAC authorization.',
          items: ['Valuation Engine (FIFO/LIFO)', 'Landing Cost Calculator', 'Accounting Ledger Engine', 'RBAC Manager', 'Audit & Validation'],
        ),
        ArchitectureLayer(
          name: 'Data Access & Synchronization Layer',
          description: 'Enterprise data pipeline utilizing Microsoft SQL Server, LINQ to SQL, SQL Table Dependency for real-time notification brokers, and Argon2 cryptographic services.',
          items: ['MS SQL Server', 'SQL Table Dependency', 'LINQ to SQL Context', 'Crystal / DevExpress Reports', 'Argon2 Security Provider'],
        ),
      ],
      architectureAr: [
        ArchitectureLayer(
          name: 'طبقة واجهة المستخدم (Presentation Layer)',
          description: 'واجهات ديسكتوب احترافية ومتقدمة مبنية بـ C# WinForms وأدوات DevExpress، توفر جداول تفاعلية سريعة، ثيمات قابلة للتخصيص، وعارض تقارير وطباعة متقدم.',
          items: ['أدوات DevExpress', 'جداول تفاعلية سريعة', 'محرك الرسوم البيانية', 'لوحات تحكم BI', 'محرك الثيمات والتخصيص'],
        ),
        ArchitectureLayer(
          name: 'طبقة منطق العمل والحسابات (Business Logic Layer)',
          description: 'خدمات برمجية لإدارة خوارزميات تقييم المخزون (FIFO / LIFO / المتوسط)، توزيع مصاريف الشحن، القيود المحاسبية المزدوجة، وصلاحيات الأمان التفصيلية.',
          items: ['محرك تقييم المخزون', 'حاسبة التكلفة الفعلية', 'محرك القيود المزدوجة', 'مدير الصلاحيات (RBAC)', 'قواعد التحقق والرقابة'],
        ),
        ArchitectureLayer(
          name: 'طبقة البيانات والمزامنة اللحظية (Data & Sync Layer)',
          description: 'بنية بيانات قوية تعتمد على SQL Server مع LINQ to SQL، والمزامنة اللحظية عبر شبكة الأجهزة بـ SQL Table Dependency، وخدمات التشفير بـ Argon2.',
          items: ['قاعدة بيانات SQL Server', 'مزامنة SQL Table Dependency', 'سياق LINQ to SQL', 'محرك التقارير (DevExpress/Crystal)', 'مزود التشفير Argon2'],
        ),
      ],
      challengesEn: [
        ProjectChallenge(
          challenge: 'Real-time multi-terminal data sync without polling network bottlenecks (SQL Table Dependency)',
          solution: 'Engineered a reactive notification bridge using SQL Table Dependency on SQL Server Service Broker, pushing real-time table modifications to all connected terminals instantly with zero database polling overhead.',
        ),
        ProjectChallenge(
          challenge: 'Accurate profit calculation under fluctuating purchase prices (FIFO, LIFO & Weighted Average Engine)',
          solution: 'Built a dynamic inventory valuation engine that tracks purchase batches and automatically computes Cost of Goods Sold (COGS) using FIFO, LIFO, or Weighted Average algorithms alongside automated landing cost apportionment.',
        ),
        ProjectChallenge(
          challenge: 'Preventing revenue leakage and selling below actual landed cost (Automated Landed Cost & Stock Guard)',
          solution: 'Implemented strict transactional validation rules that intercept sales transactions, calculate landed costs in real-time, and alert or block users from completing invoices below margin thresholds.',
        ),
        ProjectChallenge(
          challenge: 'Enterprise security, audit trails and anti-piracy licensing (Argon2 & Firebase Cloud Licensing)',
          solution: 'Integrated Argon2 hashing for unbreakable credential security, granular per-action screen RBAC, automated scheduled database backups, and online license activation via Firebase.',
        ),
      ],
      challengesAr: [
        ProjectChallenge(
          challenge: 'مزامنة البيانات لحظياً على شبكة الأجهزة دون إبطاء السيرفر (SQL Table Dependency)',
          solution: 'بناء جسر مزامنة يعتمد على SQL Table Dependency و SQL Server Service Broker لدفع التغييرات لحظياً لكافة شاشات الأجهزة المتصلة دون الحاجة لعمل Polling دوري مجهد للشبكة.',
        ),
        ProjectChallenge(
          challenge: 'دقة حساب الأرباح وتكلفة البضاعة المباعة مع تذبذب الأسعار (FIFO, LIFO & Weighted Average)',
          solution: 'برمجة محرك تقييم مخزني متقدم يتبع دفعات الشراء بدقة ويحسب تكلفة البضاعة المباعة (COGS) بأساليب FIFO و LIFO والمتوسط المرجح مع توزيع المصاريف الإضافية للشحن والنقل.',
        ),
        ProjectChallenge(
          challenge: 'منع التسريب المالي والبيع بأقل من التكلفة الفعلية (Landed Cost & Stock Guard)',
          solution: 'تطبيق قواعد تحقق مالية لحظية عند إصدار الفاتورة تحسب التكلفة الحقيقية للصنف وتمنع أو تحذر الكاشير عند محاولة البيع بأقل من سعر التكلفة أو تجاوز الحد الائتماني.',
        ),
        ProjectChallenge(
          challenge: 'الأمان العسكري وحماية التراخيص والبيانات (Argon2 & Cloud Licensing)',
          solution: 'تطبيق تشفير Argon2 لكلمات المرور، صلاحيات دقيقة على مستوى كل زر وشاشة (RBAC)، نظام نسخ احتياطي تلقائي مجدول، والتحقق السحابي من تراخيص النسخ عبر Firebase.',
        ),
      ],
      contributionsEn: [
        'Architected the entire ERP solution in C# with DevExpress and Microsoft SQL Server.',
        'Engineered the real-time synchronization layer utilizing SQL Table Dependency across LAN networks.',
        'Implemented the multi-method inventory costing engine (FIFO, LIFO, Weighted Average, and Landed Cost).',
        'Built dynamic Chart of Accounts, Journal Vouchers, and automated financial statement generation (Balance Sheet, Income Statement).',
        'Implemented screen-level RBAC, automated scheduled backups, and Argon2 credential encryption.',
      ],
      contributionsAr: [
        'تصميم وتطوير نظام الـ ERP المتكامل بالكامل باستخدام C# و DevExpress و Microsoft SQL Server.',
        'برمجة طبقة المزامنة اللحظية للبيانات عبر شبكة الأجهزة باستخدام SQL Table Dependency.',
        'تطوير محرك تقييم المخزون متعدد الأساليب (FIFO / LIFO / المتوسط المرجح) وحساب التكلفة الفعلية.',
        'بناء شجرة الحسابات والقيود اليومية المحاسبية الآلية وتوليد القوائم الختامية والميزانية العمومية.',
        'تنفيذ نظام الصلاحيات التفصيلي (RBAC)، النسخ الاحتياطي التلقائي المجدول، وتشفير Argon2.',
      ],
      userFeaturesEn: [
        ProjectFeature(
          title: 'Multi-Unit & Smart Stock Inventory',
          description: 'Manage items with automatic unit conversion (Piece / Box / Carton), instant reorder point warnings, damaged stock tracking, and inter-branch transfers.',
          iconCode: 'inventory',
        ),
        ProjectFeature(
          title: 'Real-Time Sync Across LAN Terminals',
          description: 'Instant event-driven synchronization ensures all cashiers and back-office staff work with identical, real-time stock and pricing data without delays.',
          iconCode: 'database',
        ),
        ProjectFeature(
          title: 'Sales, POS & Sell-Below-Cost Guard',
          description: 'Fast barcode invoicing, returns management, landed cost integration, and strict security guards preventing sales below purchase cost.',
          iconCode: 'pos',
        ),
        ProjectFeature(
          title: 'Dynamic Accounting & Financial Statements',
          description: 'Double-entry bookkeeping, treasury & cashbox transfers, expense logging, Income Statement, Trial Balance, and Balance Sheet generation.',
          iconCode: 'money',
        ),
        ProjectFeature(
          title: 'Executive BI & 12-Month Trend Analytics',
          description: 'Interactive graphical dashboards visualizing Top 5 profitable items, key customers, vendor balances, and 12-month sales vs profit metrics.',
          iconCode: 'chart',
        ),
        ProjectFeature(
          title: 'Customer/Vendor CRM & Auto Backups',
          description: 'Detailed financial statement ledgers for customers and suppliers with debt tracking, scheduled automated backups, and cloud license verification.',
          iconCode: 'backup',
        ),
      ],
      userFeaturesAr: [
        ProjectFeature(
          title: 'إدارة المخزون الذكي وتعدد وحدات القياس',
          description: 'إضافة أكثر من وحدة قياس للصنف مع تحويل تلقائي، وتنبيهات فورية عند الوصول لحد الطلب، ومتابعة الهالك والراكد والتحويل بين الفروع.',
          iconCode: 'inventory',
        ),
        ProjectFeature(
          title: 'تحديث لحظي وسرعة فائقة عبر الشبكة',
          description: 'مزامنة فورية لحركات البيع والمخزون عبر شبكة الأجهزة بدون أي بطء، مما يضمن دقة الأرصدة والأسعار لحظياً لدى جميع المستخدمين.',
          iconCode: 'database',
        ),
        ProjectFeature(
          title: 'المبيعات وفواتير نقاط البيع والرقابة المالية',
          description: 'فواتير بيع وشراء ومرتجعات سريعة مع منع البيع بأقل من التكلفة وتوزيع مصاريف الشحن والنقل على سعر شراء الأصناف بدقة.',
          iconCode: 'pos',
        ),
        ProjectFeature(
          title: 'شجرة حسابات وقوائم مالية ختامية',
          description: 'شؤون مالية متكاملة تشمل القيود اليومية، الخزائن والصناديق، المصروفات، واستخراج قائمة الدخل وميزان المراجعة والميزانية العمومية.',
          iconCode: 'money',
        ),
        ProjectFeature(
          title: 'لوحة تحكم تفاعلية وتقارير 12 شهراً',
          description: 'متابعة فورية للأرباح، وتحديد الأصناف الأكثر ربحية، مع رسوم بيانية لمقارنة الأداء على مدار 12 شهراً وتصدير التقارير (Excel/PDF).',
          iconCode: 'chart',
        ),
        ProjectFeature(
          title: 'كشوف حساب العملاء والموردين ونسخ احتياطي',
          description: 'كشوف حساب تفصيلية تظهر كافة الحركات المالية والديون، مع نظام نسخ احتياطي تلقائي ومجدول لضمان أمان قاعدة البيانات.',
          iconCode: 'backup',
        ),
      ],
      heroImageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/sales_statisctics.webp',
      screenshots: [
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/dashboard.webp',
          titleEn: 'Executive Dashboard & Real-Time Analytics',
          titleAr: 'لوحة التحكم الرئيسية والمؤشرات اللحظية',
          descriptionEn: 'Live tracking of daily sales and profits compared to yesterday, monthly profit indicators, 12-month interactive trend charts, and Top 5 items, clients, and suppliers.',
          descriptionAr: 'متابعة فورية لمبيعات وأرباح اليوم ومقارنتها بالأمس، مع مؤشرات الربح الشهري، رسوم بيانية تفاعلية لآخر 12 شهراً، وقوائم الـ Top 5 للأصناف والعملاء والموردين.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/add_sales_invoice.webp',
          titleEn: 'Point of Sale & Sales Invoicing',
          titleAr: 'فاتورة مبيعات جديدة والرقابة المالية',
          descriptionEn: 'High-speed barcode invoicing with sell-below-cost prevention, live stock balance and item cost display during sale, and instant invoice printing.',
          descriptionAr: 'إصدار فواتير المبيعات بسرعة فائقة مع دعم الباركود، منع البيع بأقل من التكلفة، وإظهار الرصيد الفعلي والتكلفة الحالية لحظة البيع مع خيارات الطباعة.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/edit_invoice.webp',
          titleEn: 'Invoice Management & Returns Processing',
          titleAr: 'استعراض وتعديل الفواتير وإدارة المرتجعات',
          descriptionEn: 'Search, audit, and modify previous invoices, process sales/purchase returns, and automatically adjust inventory stock and customer/supplier balances.',
          descriptionAr: 'البحث في الفواتير السابقة وتعديلها وإجراء مرتجعات البيع والشراء بكل سهولة مع إعادة احتساب حركات المخزن وأرصدة الحسابات تلقائياً.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/add_purchase_invoice.webp',
          titleEn: 'Purchase Invoice & Landed Cost Loading',
          titleAr: 'فاتورة المشتريات وتحميل التكلفة الفعلية',
          descriptionEn: 'Enter vendor purchase invoices with automated apportionment of additional freight, customs, and shipping expenses onto unit purchase prices.',
          descriptionAr: 'تسجيل فواتير الشراء مع إمكانية تحميل المصاريف الإضافية (شحن، جمارك، نقل) على سعر الشراء لضمان دقة متناهية في حساب تكلفة كل صنف.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/purchases_invoices.webp',
          titleEn: 'Purchases Archive & Supplier Log',
          titleAr: 'سجل وأرشيف فواتير المشتريات',
          descriptionEn: 'Comprehensive log of all vendor invoices with flexible date filters, supplier filtering, payment status tracking, and report export.',
          descriptionAr: 'أرشيف شامل لجميع فواتير المشتريات مع إمكانية الفلترة حسب المورد أو التاريخ وتتبع حالة السداد (نقدي/آجل) وطباعة التقارير.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/sales_statisctics.webp',
          titleEn: 'Sales Performance & Profit Statistics',
          titleAr: 'إحصائيات المبيعات وتحليل الأرباح',
          descriptionEn: 'In-depth statistical reporting of net sales, margins, daily/monthly revenues, and top-performing categories within custom date ranges.',
          descriptionAr: 'تقارير وإحصائيات تفصيلية دقيقة لحجم المبيعات والإيرادات وهوامش الأرباح الإجمالية والصافية خلال فترة زمنية يحددها المستخدم.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/purchase_statistics.webp',
          titleEn: 'Procurement Statistics & Cost Analysis',
          titleAr: 'إحصائيات المشتريات ومؤشرات الإنفاق',
          descriptionEn: 'Visual analytics on purchasing volume, supplier distribution, cost trends, and procurement seasonality to optimize inventory capital.',
          descriptionAr: 'رسوم بيانية وإحصائيات متقدمة لحجم المشتريات وتحليل أسعار التوريد ومقارنة الموردين للتحكم في تكاليف الشراء وإدارة السيولة.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/items_list.webp',
          titleEn: 'Master Inventory & Products Catalog',
          titleAr: 'دليل وقائمة الأصناف الرئيسية',
          descriptionEn: 'Full product directory showing barcodes, unit levels, purchase/sale pricing, minimum reorder thresholds, and current stock across warehouses.',
          descriptionAr: 'شاشة شاملة لجميع الأصناف المسجلة، تشمل الباركود، أسعار البيع والشراء بالوحدات المختلفة، حد الطلب، والرصيد الفعلي المتوفر في المخزن.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/add_item_info.webp',
          titleEn: 'Item Definition & Multi-Unit Setup',
          titleAr: 'إضافة صنف وضبط وحدات القياس المتعددة',
          descriptionEn: 'Add items with multiple measurement units (Piece, Box, Carton) with automatic conversion ratios, reorder points, and promotional discounts.',
          descriptionAr: 'إضافة وتعديل بيانات الصنف مع إمكانية تحديد أكثر من وحدة قياس (قطعة، علبة، كرتونة) مع تحويل تلقائي، وتحديد حد إعادة الطلب ونسب الخصم.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/inventory_balance.webp',
          titleEn: 'Inventory Balance & Multi-Method Valuation',
          titleAr: 'جرد المخزون والتقييم المحاسبي (FIFO/LIFO/Avg)',
          descriptionEn: 'Warehouse balance audits with full support for FIFO, LIFO, and Weighted Average costing methods, shortage warnings, and branch stock monitoring.',
          descriptionAr: 'تقرير أرصدة المخازن مع دعم كامل لطرق التقييم العالمية (FIFO, LIFO, المتوسط المرجح) لضمان دقة الأرباح وتنبيهات فورية بنواقص المخزون.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/items_log.webp',
          titleEn: 'Item Movement Log & Damaged Stock Tracking',
          titleAr: 'كارت الصنف وسجل حركة المخزن والهالك',
          descriptionEn: 'Detailed audit trail tracking every single item transaction: sales, purchases, returns, damaged/expired stock, and inter-branch transfers.',
          descriptionAr: 'سجل تفصيلي لحركة الصنف يشمل فواتير البيع والشراء والمرتجع، وتتبع الأصناف التالفة أو منتهية الصلاحية، والتحويلات المخزنية بين الفروع.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/balance_sheet.webp',
          titleEn: 'Balance Sheet & Final Financial Statements',
          titleAr: 'الميزانية العمومية والتقارير الختامية',
          descriptionEn: 'Automated extraction of Balance Sheet, Income Statement, and Trial Balance from the dynamic Chart of Accounts with extreme accounting precision.',
          descriptionAr: 'استخراج القوائم الختامية بدقة متناهية تشمل الميزانية العمومية، قائمة الدخل، وميزان المراجعة اعتماداً على شجرة الحسابات والقيود اليومية.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/account_statement.webp',
          titleEn: 'Detailed Customer & Vendor Account Statement',
          titleAr: 'كشف حساب تفصيلي للعملاء والموردين',
          descriptionEn: 'Comprehensive financial statement showing all debit and credit movements, invoices, payments, and remaining balance within any specified date range.',
          descriptionAr: 'كشف حساب تفصيلي يوضح كافة الحركات المالية لكل عميل أو مورد (مدين/دائن) ومتابعة دقيقة لحركات الديون والمدفوعات والمتبقي مع إمكانية الطباعة.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/debit_customers.webp',
          titleEn: 'Customer Receivables & Debt Collection',
          titleAr: 'أرصدة العملاء ومتابعة الديون والتحصيل',
          descriptionEn: 'Monitor customer debit balances, credit limits, overdue invoices, and aging debts to enforce strict financial control and optimize cash collection.',
          descriptionAr: 'شاشة متخصصة لمتابعة مديونيات العملاء، الحدود الائتمانية، وتواريخ الاستحقاق لتسهيل عمليات التحصيل وضبط التدفقات النقدية.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/receiving_mony.webp',
          titleEn: 'Cash Receipts & Treasury Management',
          titleAr: 'سندات القبض وإدارة الخزينة والصناديق',
          descriptionEn: 'Record cash and check receipts from customers, allocate funds to specific cash registers or bank accounts, and auto-generate accounting journal entries.',
          descriptionAr: 'إدارة المقبوضات من العملاء وتسجيل سندات القبض وتوجيهها للصناديق أو البنوك، مع التحويل بين الخزائن وتوليد القيود المحاسبية آلياً.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/add_expenses.webp',
          titleEn: 'Operational Expenses Logging',
          titleAr: 'تسجيل المصروفات العامة والتشغيلية',
          descriptionEn: 'Record general, administrative, and operational expenses (electricity, rent, salaries, maintenance) categorized under the Chart of Accounts.',
          descriptionAr: 'تسجيل كافة المصروفات اليومية والتشغيلية (إيجار، كهرباء، صيانة، نثرية) وربطها ببنود شجرة الحسابات لخصمها بدقة من صافي الأرباح.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/add_customer.webp',
          titleEn: 'Customer & Vendor CRM Management',
          titleAr: 'إضافة عميل / مورد وضبط البيانات الائتمانية',
          descriptionEn: 'Register customer and supplier profiles with tax registration numbers, credit limits, default discount rates, and opening balance records.',
          descriptionAr: 'تسجيل بيانات العملاء والموردين بدقة مع تحديد الرقم الضريبي، الحد الائتماني المسموح به، فئة الخصم، والرصيد الافتتاحي لبدء التعامل.',
        ),
        ProjectScreenshot(
          imageUrl: 'https://res.cloudinary.com/v3hxdb7o/image/upload/v1789212593/users_logs.webp',
          titleEn: 'User Activity Logs & Security Audit Trail',
          titleAr: 'سجل نشاط المستخدمين والرقابة الأمنية',
          descriptionEn: 'Detailed audit trail capturing user logins, invoice creations, voids, data edits, and permission-restricted operations with exact timestamps.',
          descriptionAr: 'سجل أمني مفصل يرصد كافة عمليات المستخدمين (تسجيل دخول، إنشاء أو تعديل أو حذف الفواتير، الطباعة) لضمان أعلى مستويات الأمان والشفافية.',
        ),
      ],
      downloadUrl: AppLinks.smartDaftarDownloadUrl,
      isFeatured: true,
      metrics: {
        'Sync Engine': 'SQL Dependency',
        'Database': 'MS SQL Server',
        'Valuation': 'FIFO / LIFO / Avg',
        'UI Suite': 'DevExpress .NET',
      },
    ),
  ];

  @override
  List<ProjectEntity> getProjects() => _projects;

  @override
  ProjectEntity? getProjectById(String id) {
    try {
      return _projects.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}
