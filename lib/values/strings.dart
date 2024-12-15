import 'package:flutter/material.dart';

class StringConst {
  // Idioma seleccionado (por defecto español)
  static Locale _locale = const Locale('es');

  // Método para establecer el idioma
  static void setLocale(Locale locale) {
    _locale = locale;
  }

  // Método para obtener el texto basado en el idioma seleccionado
  static String _localizedValue({required String en, required String es}) {
    return _locale.languageCode == 'en' ? en : es;
  }

  // Strings
  static String get APP_NAME =>
      _localizedValue(en: "Daniel Leon Page", es: "Página Daniel Leon");
  static String get APP_TITLE => APP_NAME;
  static String get SITE_URL => "";

  static String get HOME => _localizedValue(en: "Home", es: "Inicio");
  static String get ABOUT => _localizedValue(en: "About Me", es: "Sobre mí");
  static String get WORKS => _localizedValue(en: "Works", es: "Trabajos");
  static String get EXPERIENCE =>
      _localizedValue(en: "Experience", es: "Experiencia");
  static String get PRIVACY_POLICY =>
      _localizedValue(en: "Privacy Policy", es: "Política de Privacidad");
  static String get PROJECT => _localizedValue(en: "Project", es: "Proyecto");
  static String get WORK =>
      _localizedValue(en: "Our Experience", es: "Nuestra Experiencia");
  static String get SERVICES =>
      _localizedValue(en: "Services", es: "Servicios");
  static String get CONTACT => _localizedValue(en: "Contact", es: "Contacto");
  static String get PHONE_NUMBER =>
      _localizedValue(en: "Phone Number", es: "Número de Teléfono");
  static String get DOWNLOAD =>
      _localizedValue(en: "Download CV", es: "Descarga CV");
  static String get CERTIFICATIONS =>
      _localizedValue(en: "Certifications", es: "Certificaciones");
  static String get EMAIL_VALUE => "daniel.leon07@hotmail.com";

  static String get EMAIL_RESPONSE => _localizedValue(
      en: "Thanks for reaching out to me! I will get back to you ASAP.",
      es: "¡Gracias por contactarme! Te responderé lo antes posible.");

  static String get EMAIL_FAILED_RESPONSE => _localizedValue(
      en: "Something went wrong. Please send me an email manually.",
      es: "Algo salió mal. Por favor, envíame un correo manualmente.");

  // Página de Inicio
  static String get VIEW => _localizedValue(en: "View", es: "Ver");
  static String get WELCOME =>
      _localizedValue(en: "Hello, I'm Daniel", es: "Hola, soy Daniel");
  static String get INTRODUCTION => _localizedValue(
      en: "Engineer with 3 years of experience in companies like:",
      es: "Ingeniero con 3 años de experiencia en empresas como:");
  static String get DESCRIPTION => _localizedValue(
      en: "Bosch, Siemens and LeanCe", es: "Bosch, Siemens y LeanCe");
  static String get DESCRIPTION2 => _localizedValue(
        en: "Specialized in creating mobile and web applications to ensure continuous improvement in daily processes.",
        es: "Especializado en la creación de aplicaciones móviles y web para garantizar una mejora constante en los procesos diarios.",
      );
  static String get SEE_MY_WORKS =>
      _localizedValue(en: "See My Works", es: "Ve mis trabajos");
  static String get SCROLL_DOWN =>
      _localizedValue(en: "Scroll Down", es: "Desliza");
  static String get CRAFTED_WITH_LOVE => _localizedValue(
      en: "Crafted with love and dedication.",
      es: "Hecho con amor y dedicación.");
  static String get SELECTION => _localizedValue(
      en: "Here is a selection of my most important works.",
      es: "Aquí hay una selección de mis trabajos más importantes.");
  static String get THERES_MORE =>
      _localizedValue(en: "There's more", es: "Hay más");
  static String get VIEW_ALL_PROJECTS =>
      _localizedValue(en: "View All Projects", es: "Ver todos mis proyectos");

  // Página de Contacto
  static String get GET_IN_TOUCH =>
      _localizedValue(en: "Get in Touch", es: "Contáctame");
  static String get CONTACT_MSG => _localizedValue(
        en: "Contact me for job offers or inquiries.",
        es: "Contáctame para ofertas laborales o consultas.",
      );
  static String get YOUR_NAME => _localizedValue(en: "Your Name", es: "Nombre");
  static String get NAME_ERROR_MSG => _localizedValue(
      en: "* Please enter your name", es: "* Por favor ingrese su nombre");
  static String get YOUR_EMAIL =>
      _localizedValue(en: "Your Email", es: "Correo Electrónico");
  static String get EMAIL_ERROR_MSG => _localizedValue(
      en: "* Please enter a valid email",
      es: "* Por favor ingrese un correo válido");
  static String get SUBJECT => _localizedValue(en: "Subject", es: "Asunto");
  static String get SUBJECT_ERROR_MSG => _localizedValue(
      en: "* Please tell me what this message is about",
      es: "* Por favor ingrese el asunto del mensaje");
  static String get MESSAGE => _localizedValue(en: "Message", es: "Mensaje");
  static String get MESSAGE_ERROR_MSG => _localizedValue(
      en: "* Please enter something to send this form",
      es: "* Por favor ingrese un mensaje");
  static String get SEND_MESSAGE =>
      _localizedValue(en: "Send Message", es: "Enviar Mensaje");
  static String get COPYRIGHT => _localizedValue(
        en: "© 2024 Built by $DEV_NAME,",
        es: "© 2024 Desarrollado por $DEV_NAME,",
      );
  static String get DESIGNED_BY => _localizedValue(
      en: "Designed by Julius G.", es: "Diseñado por Julius G.");
  static String get DESIGN_LINK =>
      "https://www.behance.net/gallery/63574251/Personal-Portfolio-Website-Design";

  // Página Acerca de
  static String get ABOUT_DEV_CATCH_LINE => _localizedValue(
      en: "I am a passionate front-end developer and UI/UX designer with a keen eye for detail.",
      es: "Soy un desarrollador front-end y diseñador UI/UX apasionado, con un gran ojo para los detalles.");
  static String get ABOUT_DEV_CATCH_LINE_1 => _localizedValue(
      en: "I specialize in building ", es: "Me especializo en construir ");
  static String get ABOUT_DEV_CATCH_LINE_2 => _localizedValue(
      en: "high-quality mobile and web applications.",
      es: "aplicaciones móviles y web de alta calidad.");
  static String get ABOUT_DEV_CATCH_LINE_4 =>
      _localizedValue(en: "I also have a great", es: "También tengo una gran");
  static String get ABOUT_DEV_CATCH_LINE_5 => _localizedValue(
      en: "passion for details.", es: "pasión por los detalles.");
  static String get ABOUT_DEV_STORY =>
      _localizedValue(en: "Story", es: "Historia");
  static String get ABOUT_DEV_STORY_TITLE =>
      _localizedValue(en: "A bit about me.", es: "Un poco sobre mí.");
  static String get ABOUT_DEV_STORY_CONTENT_1 => _localizedValue(
      en: "I am an embedded systems and full-stack software engineer from Universidad Mondragón México with a strong passion for building high-quality solutions and applications. I have broad experience building front-end (mobile and web) and backend applications.",
      es: "Soy un ingeniero en sistemas embebidos y software full stack graduado de la Universidad Mondragón México con gran pasión por construir soluciones y aplicaciones de alta calidad. Tengo amplia experiencia construyendo aplicaciones front-end (móviles y web) y de backend.");
  static String get ABOUT_DEV_STORY_CONTENT_2 => _localizedValue(
      en: "I have experience working in international companies, which has allowed me to develop strong technical skills and excellent interpersonal skills to collaborate with teams and clients worldwide.",
      es: "Tengo experiencia trabajando en empresas de talla internacional, lo cual me ha permitido desarrollar sólidas habilidades técnicas y excelentes habilidades interpersonales para colaborar con equipos y clientes de todo el mundo.");
  static String get ABOUT_DEV_STORY_CONTENT_3 => _localizedValue(
      en: "I am very good at finding solutions to problems and have a keen eye for detail. I enjoy building fun/useful projects in my free time. I am a lover of all forms of art and music.",
      es: "Soy muy bueno encontrando soluciones a problemas y tengo un gran ojo para los detalles. Disfruto construyendo proyectos divertidos/útiles en mi tiempo libre. Soy amante de todas las formas de arte y música.");
  static String get ABOUT_DEV_TECHNOLOGY =>
      _localizedValue(en: "Technology", es: "Tecnología");
  static String get MOBILE_TECH =>
      _localizedValue(en: "Mobile Technologies", es: "Tecnologías Móviles");
  static String get OTHER_TECH => _localizedValue(
      en: "Web / Cloud / Design Technologies",
      es: "Tecnologías Web / Nube / Diseño");
  static String get ABOUT_DEV_TECHNOLOGY_TITLE =>
      _localizedValue(en: "What I Use.", es: "Lo que uso.");
  static String get ABOUT_DEV_TECHNOLOGY_CONTENT => _localizedValue(
      en: "I use a variety of tools to facilitate my creative process in bringing ideas to life. Below are the tools and technologies I've used over the years.",
      es: "Utilizo una variedad de herramientas para facilitar mi proceso creativo al dar vida a las ideas. A continuación se enumeran las herramientas y tecnologías que he utilizado a lo largo de los años.");
  static String get ABOUT_DEV_CONTACT =>
      _localizedValue(en: "Contact", es: "Contacto");
  static String get ABOUT_DEV_CONTACT_SOCIAL =>
      _localizedValue(en: "Social Networks", es: "Redes Sociales.");
  static String get ABOUT_DEV_CONTACT_EMAIL =>
      _localizedValue(en: "Email", es: "Correo Electrónico");
  static String get FAMOUS_QUOTE => _localizedValue(
      en: "“I have no special talents. I am only passionately curious.”",
      es: "“No tengo talentos especiales. Solo soy apasionadamente curioso.”");
  static String get FAMOUS_QUOTE_AUTHOR => "Albert Einstein";
  static String get WORK_TOGETHER =>
      _localizedValue(en: "Get in Touch", es: "Ponte en contacto conmigo");
  static String get AVAILABLE_FOR_FREELANCE => _localizedValue(
      en: "Available to hear you", es: "Disponible para escucharte");
  static String get SAY_HELLO =>
      _localizedValue(en: "Say Hello", es: "Contacto");

  // Página de Trabajos
  static String get VIEW_PROJECT =>
      _localizedValue(en: "View Project", es: "Ver Proyecto");
  static String get MY_WORKS =>
      _localizedValue(en: "My Works.", es: "Mis Trabajos.");
  static String get NOTE_WORTHY_PROJECTS => _localizedValue(
      en: "Other Noteworthy Projects.", es: "Otros Proyectos Destacados.");
  static String get NOTE_WORTHY_PROJECTS_DESC => _localizedValue(
      en: "Here are a few projects worth mentioning.",
      es: "Aquí hay algunos proyectos que vale la pena mencionar.");

  // Detalles del Proyecto
  static String get BUILT_WITH_FLUTTER =>
      _localizedValue(en: "Built with Flutter", es: "Desarrollado con Flutter");

  static String get ABOUT_PROJECT =>
      _localizedValue(en: "About Project", es: "Acerca del Proyecto");
  static String get PLATFORM =>
      _localizedValue(en: "Platform", es: "Plataforma");
  static String get CATEGORY =>
      _localizedValue(en: "Category", es: "Categoría");
  static String get AUTHOR => _localizedValue(en: "Author", es: "Autor");
  static String get DESIGNER =>
      _localizedValue(en: "Designer", es: "Diseñador");
  static String get TECHNOLOGY_USED =>
      _localizedValue(en: "Technology Used", es: "Tecnología Utilizada");
  static String get LAUNCH_APP =>
      _localizedValue(en: "Launch App", es: "Lanzar Aplicación");
  static String get SOURCE_CODE =>
      _localizedValue(en: "Source Code", es: "Código Fuente");
  static String get NEXT_PROJECT =>
      _localizedValue(en: "Next Project", es: "Próximo Proyecto");

  // Formularios
  static String get NAME_HINT_TEXT => _localizedValue(en: "Name", es: "Nombre");
  static String get PHONE_HINT_TEXT =>
      _localizedValue(en: "Phone (Optional)", es: "Teléfono (Opcional)");
  static String get EMAIL_HINT_TEXT =>
      _localizedValue(en: "Email", es: "Correo");
  static String get MESSAGE_HINT_TEXT =>
      _localizedValue(en: "Message", es: "Mensaje");
  static const String DEV_EMAIL = "daniel.leon07@hotmail.com";

  static String get EMAIL_URL => "mailto:$DEV_EMAIL?subject=&body=";

  // Skills
  static String get FLUTTER => "Flutter";
  static String get JETPACK_COMPOSE => "Jetpack Compose";
  static String get JAVA => "Java";
  static String get ANDROID => "Android";
  static String get PYTHON => "Python";
  static String get KOTLIN => "Kotlin";
  static String get JAVASCRIPT => "Javascript";
  static String get PHP => "PHP";
  static String get LARAVEL => "Laravel";
  static String get SQL => "SQL";
  static String get WORDPRESS => "Wordpress";
  static String get BOOTSTRAP => "Bootstrap";
  static String get HTML_CSS => "HTML/CSS";

  // Rutas
  static String get LOADING_PAGE => "/";
  static String get HOME_PAGE => "/home";
  static String get ABOUT_PAGE => "/about";
  static String get WORKS_PAGE => "/works";
  static String get CONTACT_PAGE => "/contact";
  static String get PROJECT_PAGE => "/project";
  static String get PROJECT_DETAIL_PAGE => "/project-detail";
  static String get SERVICES_PAGE => "/services";
  static String get MESSAGE_PAGE => "/message-me";
  static String get EXPERIENCE_PAGE => "/experience";
  static String get PRIVACY_POLICY_PAGE => "/privacy-policy";
  static String get RESUME_PAGE => "/resume";
  static String get CERTIFICATION_PAGE => "/certifications";

  // Social Links (URLs can stay constant as they do not change with language)
  static const String GITHUB_URL = "https://github.com/danielleoon";
  static const String LINKED_IN_URL =
      "https://www.linkedin.com/in/jos%C3%A9-daniel-le%C3%B3n-s%C3%A1nchez-880a00136/";
  static const String TWITTER_URL = "https://twitter.com/DavidLegend47";
  static const String INSTAGRAM_URL =
      "https://www.instagram.com/david_legend_47";
  static const String TELEGRAM_URL = "https://t.me/DavidLegend";

  // Contacts
  static String get CONNECT => _localizedValue(en: "Follow Us", es: "Síguenos");
  static String get EMAIL => _localizedValue(en: "Email", es: "Correo");
  static String get LINKED_IN =>
      _localizedValue(en: "LinkedIn", es: "LinkedIn");
  static String get TWITTER => _localizedValue(en: "Twitter", es: "Twitter");
  static String get INSTAGRAM =>
      _localizedValue(en: "Instagram", es: "Instagram");
  static String get TELEGRAM => _localizedValue(en: "Telegram", es: "Telegram");
  static String get GITHUB => _localizedValue(en: "Github", es: "Github");

// Awarded By
  static String get GOOGLE => "Google";
  static String get UDACITY => "Udacity";
  static String get CMU => "Carnegie Mellon University";

  // Certification Types
  static String get MSC_IT => _localizedValue(
      en: "Msc In Information Technology",
      es: "Maestría en Tecnología de la Información");
  static String get ASSOCIATE_ANDROID_DEV => _localizedValue(
      en: "Associate Android Developer",
      es: "Desarrollador Asociado de Android");
  static String get CLOUD_DEVELOPER =>
      _localizedValue(en: "Cloud Developer", es: "Desarrollador de Nube");
  static String get DATA_SCIENCE =>
      _localizedValue(en: "Data Science", es: "Ciencia de Datos");
  static String get ANDROID_BASICS =>
      _localizedValue(en: "Android Basics", es: "Conceptos Básicos de Android");

  // Experience
  static String get CURRENT_MONTH_YEAR =>
      _localizedValue(en: "May 2020 - Current", es: "Mayo 2020 - Actualidad");
  static String get STARTED_MONTH_YEAR =>
      _localizedValue(en: "May 2017", es: "Mayo 2017");

  // Empresa Refac
  static String get COMPANY_5 => "Refac";
  static String get COMPANY_5_URL => SITE_URL;
  static String get POSITION_5 =>
      _localizedValue(en: "Partner and Programmer", es: "Socio y Programador");
  static String get COMPANY_5_ROLE_1 => _localizedValue(
      en: "Development and programming of Refac platform, a real-time auction application for buying and selling auto parts.",
      es: "Desarrollo y programación de la plataforma Refac, una aplicación de subastas en tiempo real para la compra y venta de autopartes.");
  static String get COMPANY_5_ROLE_2 => _localizedValue(
      en: "Responsible for optimizing user experience and ensuring platform security and efficiency.",
      es: "Responsable de optimizar la experiencia del usuario y garantizar la seguridad y eficiencia de la plataforma.");
  static String get COMPANY_5_ROLE_3 => _localizedValue(
      en: "Implementation of new features and improvements to ensure market competitiveness.",
      es: "Implementación de nuevas funcionalidades y mejoras para asegurar la competitividad en el mercado.");
  static String get LOCATION_5 =>
      _localizedValue(en: "Queretaro - Mexico", es: "Querétaro - México");
  static String get DURATION_5 => _localizedValue(
      en: "January 2024 - Present", es: "Enero 2024 - Actualidad");

  // Empresa LeanCe Logistics
  static String get COMPANY_4 => "LeanCe Logistics";
  static String get COMPANY_4_URL => "https://leance-logistics.com/";
  static String get POSITION_4 =>
      _localizedValue(en: "IT and Developer", es: "IT y Desarrollador");
  static String get COMPANY_4_ROLE_1 => _localizedValue(
      en: "Development of mobile applications for inventory of assets in industrial plants using Flutter.",
      es: "Desarrollo de aplicaciones móviles para inventario de activos en plantas industriales en Flutter.");
  static String get COMPANY_4_ROLE_2 => _localizedValue(
      en: "Implementation of a web application to monitor order status in industrial plants.",
      es: "Implementación de una aplicación web para monitorear el estado de pedidos en plantas industriales.");
  static String get COMPANY_4_ROLE_3 => _localizedValue(
      en: "Development of a mobile tracking application for real-time inventory management.",
      es: "Desarrollo de una aplicación de seguimiento móvil para gestionar inventarios en tiempo real.");
  static String get LOCATION_4 =>
      _localizedValue(en: "Queretaro - Mexico", es: "Querétaro - México");
  static String get DURATION_4 => _localizedValue(
      en: "March 2024 - Present", es: "Marzo 2024 - Actualidad");

  // Empresa Siemens
  static String get COMPANY_3 => "Siemens Querétaro";
  static String get COMPANY_3_URL => "https://www.siemens.com/";
  static String get POSITION_3 => _localizedValue(
      en: "Intern in Quality Team", es: "Intern en equipo de calidad");
  static String get COMPANY_3_ROLE_1 => _localizedValue(
      en: "Development of an automated email system for collecting signatures on procedural documents.",
      es: "Desarrollo de un sistema automatizado de correos para la recolección de firmas en documentos de procedimientos.");
  static String get COMPANY_3_ROLE_2 => _localizedValue(
      en: "Creation of Power BI reports to control activities and performance in the plant.",
      es: "Creación de reportes en Power BI para el control de actividades y rendimiento en la planta.");
  static String get COMPANY_3_ROLE_3 => _localizedValue(
      en: "Optimization of processes through automation to improve efficiency.",
      es: "Optimización de procesos mediante automatización para mejorar la eficiencia.");
  static String get LOCATION_3 =>
      _localizedValue(en: "Queretaro - Mexico", es: "Querétaro - México");
  static String get DURATION_3 => _localizedValue(
      en: "October 2023 - March 2024", es: "Octubre 2023 - Marzo 2024");

  // Empresa Bosch
  static String get COMPANY_2 => "Bosch Querétaro";
  static String get COMPANY_2_URL => "https://www.bosch.com/";
  static String get POSITION_2 => _localizedValue(
      en: "Intern in ICO and BPS as Programmer",
      es: "Intern en ICO y BPS como Programador");
  static String get COMPANY_2_ROLE_1 => _localizedValue(
      en: "Digitization and automation of processes for operational improvement in Querétaro and Florence plants, USA.",
      es: "Digitalización y automatización de procesos para la mejora operativa en plantas de Querétaro y Florence, EE.UU.");
  static String get COMPANY_2_ROLE_2 => _localizedValue(
      en: "Implementation of systems to increase efficiency and reduce processing time.",
      es: "Implementación de sistemas para aumentar la eficiencia y reducir el tiempo de procesamiento.");
  static String get COMPANY_2_ROLE_3 => _localizedValue(
      en: "Development of tools to optimize productivity in the plant.",
      es: "Desarrollo de herramientas para optimizar la productividad en la planta.");
  static String get COMPANY_2_ROLE_4 => _localizedValue(
      en: "Led 2 strategic projects and actively participated in a total of 5 different projects.",
      es: "Líder en 2 proyectos estratégicos y participación activa en un total de 5 proyectos diferentes.");
  static String get LOCATION_2 =>
      _localizedValue(en: "Queretaro - Mexico", es: "Querétaro - México");
  static String get DURATION_2 => _localizedValue(
      en: "October 2022 - October 2023", es: "Octubre 2022 - Octubre 2023");

  // Projects
  static String get REFAC => "Refac";
  static String get REFAC_PLATFORM =>
      _localizedValue(en: "Android / iOS / Web", es: "Android / iOS / Web");
  static String get REFAC_CATEGORY =>
      _localizedValue(en: "E-commerce", es: "Ecommerce");
  static String get REFAC_DESIGNER => "Daniel León";
  static String get REFAC_SUBTITLE => _localizedValue(
      en: "Application for buying and selling auto parts through real-time auctions.",
      es: "Aplicación para la compra y venta de autopartes mediante subastas en tiempo real.");
  static String get REFAC_DETAIL => _localizedValue(
      en: "Refac is a platform designed to facilitate the buying and selling of auto parts through real-time auctions. It allows users to bid online for specific parts, offering a secure and competitive market.",
      es: "Refac es una plataforma diseñada para facilitar la compra y venta de autopartes a través de subastas en tiempo real. Permite a los usuarios pujar en línea por partes específicas, ofreciendo un mercado seguro y competitivo.");
  // Project Details - Bosch Inventory App
  static String get BOSCH_INV => "Bosch Inventory App";
  static String get BOSCH_INV_PLATFORM =>
      _localizedValue(en: "Web / Android / iOS", es: "Web / Android / iOS");
  static String get BOSCH_INV_CATEGORY =>
      _localizedValue(en: "Productivity App", es: "App productiva");
  static String get BOSCH_INV_SUBTITLE => _localizedValue(
      en: "Tool to improve and optimize inventory in plants in Querétaro, Mexico, and Florence, USA.",
      es: "Herramienta para mejorar y optimizar el inventario en plantas Querétaro, México y Florence, Estados Unidos.");
  static String get BOSCH_INV_DETAIL => _localizedValue(
      en: "Bosch Inventory App is designed to enhance productivity by optimizing inventory management in industrial plants.",
      es: "La aplicación de inventario de Bosch está diseñada para mejorar la productividad optimizando la gestión de inventarios en plantas industriales.");

  // Project Details - Bosch Smart Screens
  static String get BOSCH_SS => "Bosch Smart Screens App";
  static String get BOSCH_SS_PLATFORM =>
      _localizedValue(en: "Android / iOS / Linux", es: "Android / iOS / Linux");
  static String get BOSCH_SS_CATEGORY =>
      _localizedValue(en: "Productivity App", es: "App productiva");
  static String get BOSCH_SS_SUBTITLE => _localizedValue(
      en: "App for scheduling content on plant screens.",
      es: "Aplicación para la programación de contenido en las pantallas de la planta.");
  static String get BOSCH_SS_DESIGNER => "Daniel León";
  static String get BOSCH_SS_DETAIL => _localizedValue(
      en: "Smart Screens App is used to program announcements and inform the plant about current events.",
      es: "La aplicación de pantallas inteligentes se usa para programar anuncios e informar a la planta sobre eventos actuales.");
  // Project Details - Bosch Certifications App
  static String get BOSCH_CERT => "Bosch Certifications App";
  static String get BOSCH_CERT_PLATFORM =>
      _localizedValue(en: "Web / Android / iOS", es: "Web / Android / iOS");
  static String get BOSCH_CERT_CATEGORY =>
      _localizedValue(en: "Productivity App", es: "App productiva");
  static String get BOSCH_CERT_DESIGNER => "Daniel León";
  static String get BOSCH_CERT_SUBTITLE => _localizedValue(
      en: "App designed for active certification monitoring of associates in the plant.",
      es: "Aplicación diseñada para el control y monitoreo de certificaciones activas de asociados en la planta.");
  static String get BOSCH_CERT_DETAIL => _localizedValue(
      en: "The app provides a control panel for the human resources department to manage and track active certifications, including detailed reports and compliance management.",
      es: "La aplicación ofrece un panel de control para el departamento de recursos humanos, permitiendo gestionar y rastrear certificaciones activas, incluyendo reportes detallados y gestión de cumplimiento.");
  static String get BOSCH_CERT_GITHUB_URL =>
      "https://github.com/david-legend/bosch-certifications";
  static String get BOSCH_CERT_PLAYSTORE_URL =>
      "https://play.google.com/store/apps/details?id=com.bosch.certifications";

  // Project Details - Siemens Workflow
  static String get LOGIN_CATALOG => _localizedValue(
      en: "Siemens Reminder Workflow", es: "Siemens flujo en recordatorios");
  static String get LOGIN_CATALOG_PLATFORM => "Web";
  static String get LOGIN_CATALOG_CATEGORY =>
      _localizedValue(en: "Productivity Flow", es: "Flujo productivo");
  static String get LOGIN_CATALOG_DESIGNER => "Daniel León";
  static String get LOGIN_CATALOG_SUBTITLE => _localizedValue(
      en: "Workflow connected with SharePoint, responsible for maintaining document updates.",
      es: "Flujo conectado con SharePoint, encargado de mantener la actualización de documentos.");
  static String get LOGIN_CATALOG_DETAIL => _localizedValue(
      en: "This workflow helps streamline plant productivity by saving time and resources.",
      es: "Este flujo ayuda a agilizar la productividad de planta, ahorrando tiempo y recursos.");

  // Project Details - LeanCe AF App
  static String get LEANCEAF => "LeanCe AF App";
  static String get LEANCEAF_PLATFORM => "Android / IOS";
  static String get LEANCEAF_CATEGORY =>
      _localizedValue(en: "Productivity App", es: "App productiva");
  static String get LEANCEAF_DESIGNER => "Daniel León";
  static String get LEANCEAF_SUBTITLE => _localizedValue(
      en: "App for asset inventory in industrial plants.",
      es: "Aplicación para inventario de activos en plantas.");
  static String get LEANCEAF_DETAIL => _localizedValue(
      en: "LeanCe AF App is designed for detailed asset inventory in plants, optimizing workflow in foreign trade.",
      es: "LeanCe AF App está diseñada para inventarios detallados de activos en plantas, optimizando el flujo de trabajo en comercio exterior.");
  static String get LEANCEAF_PLAYSTORE_URL =>
      "https://play.google.com/store/apps/details?id=com.leance.af_app";

  // Project Details - LeanCe Previos App
  static String get LEANCEPREV => "LeanCe Previos App";
  static String get LEANCEPREV_PLATFORM => "Android / IOS";
  static String get LEANCEPREV_CATEGORY =>
      _localizedValue(en: "Productivity App", es: "App productiva");
  static String get LEANCEPREV_DESIGNER =>
      _localizedValue(en: "Daniel León", es: "Daniel León.");
  static String get LEANCEPREV_SUBTITLE => _localizedValue(
      en: "App for registering and capturing customs entries.",
      es: "Aplicación para registrar y capturar los previos en aduanas.");
  static String get LEANCEPREV_DETAIL => _localizedValue(
      en: "LeanCe Previos App is a tool for tracking customs entries and ensuring compliance in the customs process.",
      es: "LeanCe Previos App es una herramienta para rastrear los previos en aduanas y asegurar el cumplimiento en el proceso aduanero.");
  static String get LEANCEPREV_PLAYSTORE_URL =>
      "https://play.google.com/store/apps/details?id=com.leance.previos_app";

  // Certification Links
  static const String CMU_CERT_URL =
      "https://www.cmu.edu/hub/registrar/graduation/diplomas/electronic/validation/index.html";
  static const String ASSOCIATE_ANDROID_DEV_URL =
      "https://www.credential.net/b296da88-d6be-4bb5-9756-b13efea3a421";
  static const String DATA_SCIENCE_CERT_URL =
      "https://graduation.udacity.com/confirm/7CGEJAFR";
  static const String CLOUD_DEVELOPER_URL =
      "https://confirm.udacity.com/PJU23DCP";
  static const String ANDROID_BASICS_CERT_URL =
      "https://graduation.udacity.com/confirm/9VTDRN5K";

  // Otros textos
  static String get DEV_NAME => "Daniel León";
  static String get PUNCH_LINE => _localizedValue(
      en: "I Build Things with Flutter", es: "Construyo cosas con Flutter");
  static String get SPECIALITY =>
      _localizedValue(en: "FLUTTER DEVELOPER", es: "DESARROLLADOR FLUTTER");
  static String get DESIGNED_IN =>
      _localizedValue(en: "Made in Mexico with ", es: "Hecho en México con ");
  static String get BUILT_BY => _localizedValue(
      en: "Built by Daniel León", es: "Desarrollado por Daniel León");

  // Font Family
  static const String VISUELT_PRO = "VisueltPro";

  // API
  static const String BASE_URL = "https://portfolio-api-liart.vercel.app/api";
  static const String GET_IN_TOUCH_POINT = "/getintouch";
}
