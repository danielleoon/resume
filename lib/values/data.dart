part of 'values.dart';

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class NoteWorthyProjectDetails {
  NoteWorthyProjectDetails({
    required this.projectName,
    required this.isOnPlayStore,
    required this.isPublic,
    required this.technologyUsed,
    required this.isWeb,
    required this.isLive,
    this.projectDescription,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectName;
  final bool isPublic;
  final bool isOnPlayStore;
  final bool isWeb;
  final String? projectDescription;
  final bool isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    required this.company,
    this.companyUrl,
  });

  final String company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<ProjectItemData> get allProjects => projects;

  static ProjectItemData? findProjectByRouteId(String routeId) {
    for (final project in allProjects) {
      if (project.routeId == routeId) {
        return project;
      }
    }
    return null;
  }

  static int indexOfProject(ProjectItemData project) {
    return allProjects.indexWhere((item) => item.routeId == project.routeId);
  }

  static List<NavItemData> menuItems = [
    NavItemData(name: StringConst.HOME, route: StringConst.HOME_PAGE),
    NavItemData(name: StringConst.ABOUT, route: StringConst.ABOUT_PAGE),
    NavItemData(name: StringConst.WORKS, route: StringConst.WORKS_PAGE),
    NavItemData(
      name: StringConst.EXPERIENCE,
      route: StringConst.EXPERIENCE_PAGE,
    ),
    /*NavItemData(
      name: StringConst.CERTIFICATIONS,
      route: StringConst.CERTIFICATION_PAGE,
    ),*/
    NavItemData(name: StringConst.CONTACT, route: StringConst.CONTACT_PAGE),
  ];

  static List<SocialData> socialData = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    /* SocialData(
      name: StringConst.TWITTER,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),*/
    /* SocialData(
      name: StringConst.INSTAGRAM,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),*/
    /*SocialData(
      name: StringConst.TELEGRAM,
      iconData: FontAwesomeIcons.telegram,
      url: StringConst.TELEGRAM_URL,
    ),*/
  ];

  static List<String> mobileTechnologies = [
    "Flutter",
    "Dart",
    ".NET",
    "Android",
    "Kotlin"
  ];

  static List<String> otherTechnologies = [
    "Angular",
    "React",
    "TypeScript",
    "Node JS",
    "PHP",
    "SQL",
    "Git",
    "JavaScript",
    "Google Cloud",
    "C#",
    "C++",
    "HTML 5",
    "CSS 3",
    "Firebase",
    "Figma",
    "Microsoft Word",
    "Microsoft Excel",
    "Microsoft Power Point",
    "Power BI",
    "FlutterFlow",
  ];
  static List<SocialData> socialData1 = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    /* SocialData(
      name: StringConst.TWITTER,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),*/
  ];

  static List<SocialData> socialData2 = [
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    /*SocialData(
      name: StringConst.TWITTER,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),*/
    /*SocialData(
      name: StringConst.INSTAGRAM,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),*/
    /*SocialData(
      name: StringConst.TELEGRAM,
      iconData: FontAwesomeIcons.telegram,
      url: StringConst.TELEGRAM_URL,
    ),*/
  ];

  static List<ProjectItemData> recentWorks = [
    Projects.REFAC,
    Projects.BOSCH_INV,
    Projects.BOSCH_SS,
    Projects.BOSCH_CERT,
    //Projects.LOGIN_CATALOG,
    Projects.LEANCEAF,
    Projects.LEANCEPREV,
  ];

  static List<ProjectItemData> projects = [
    Projects.REFAC,
    Projects.BOSCH_INV,
    Projects.BOSCH_SS,
    Projects.BOSCH_CERT,
    //Projects.LOGIN_CATALOG,
    Projects.LEANCEAF,
    Projects.LEANCEPREV,
    Projects.NOUMI,
    Projects.LULUNET_VENTAS,
    Projects.IENTC_ALMACEN,
    Projects.LULUNET_CLIENTES,
    Projects.IENTC_LANDING_PAGE,
    Projects.LULUNET_LANDING_PAGE,
    Projects.ARSE_POLIZAS_JURIDICAS,
    /* Projects.OTP_TEXT_FIELD,
    Projects.AERIUM,
    Projects.AERIUM_V2,
    Projects.OUTFITR,*/
  ];

/*  static List<NoteWorthyProjectDetails> noteworthyProjects = [
    NoteWorthyProjectDetails(
      projectName: StringConst.UDAGRAM_IMAGE_FILTERING,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.UDAGRAM_IMAGE_FILTERING_TECH,
      projectDescription: StringConst.UDAGRAM_IMAGE_FILTERING_DETAIL,
      gitHubUrl: StringConst.UDAGRAM_IMAGE_FILTERING_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.SERVERLESS_TODO,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.SERVERLESS_TODO_TECH,
      projectDescription: StringConst.SERVERLESS_TODO_DETAIL,
      gitHubUrl: StringConst.SERVERLESS_TODO_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.PYTHON_ALGORITHMS,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.PYTHON_ALGORITHMS_DETAIL,
      gitHubUrl: StringConst.PYTHON_ALGORITHMS_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.PROGRAMMING_FOR_DATA_SCIENCE,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.PROGRAMMING_FOR_DATA_SCIENCE_DETAIL,
      gitHubUrl: StringConst.PROGRAMMING_FOR_DATA_SCIENCE_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.ONBOARDING_APP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.ONBOARDING_APP_DETAIL,
      gitHubUrl: StringConst.ONBOARDING_APP_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.FINOPP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.FINOPP_DETAIL,
      gitHubUrl: StringConst.FINOPP_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.AMOR_APP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: true,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.AMOR_APP_DETAIL,
      gitHubUrl: StringConst.AMOR_APP_GITHUB_URL,
      webUrl: StringConst.AMOR_APP_WEB_URL,
      isLive: true,
    ),
  ];*/

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.MSC_IT,
      url: StringConst.CMU_CERT_URL,
      image: ImagePath.CMU_MASTERS_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.CMU,
    ),
    CertificationData(
      title: StringConst.ASSOCIATE_ANDROID_DEV,
      url: StringConst.ASSOCIATE_ANDROID_DEV_URL,
      image: ImagePath.ASSOCIATE_ANDROID_DEV,
      imageSize: 0.325,
      awardedBy: StringConst.GOOGLE,
    ),
    CertificationData(
      title: StringConst.CLOUD_DEVELOPER,
      url: StringConst.CLOUD_DEVELOPER_URL,
      image: ImagePath.CLOUD_DEVELOPER_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDACITY,
    ),
    CertificationData(
      title: StringConst.DATA_SCIENCE,
      url: StringConst.DATA_SCIENCE_CERT_URL,
      image: ImagePath.DATA_SCIENCE_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDACITY,
    ),
    CertificationData(
      title: StringConst.ANDROID_BASICS,
      url: StringConst.ANDROID_BASICS_CERT_URL,
      image: ImagePath.ANDROID_BASICS_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDACITY,
    ),
  ];

  static List<ExperienceData> experienceData = [
    ExperienceData(
      company: StringConst.COMPANY_6,
      position: StringConst.POSITION_6,
      companyUrl: StringConst.COMPANY_6_URL,
      roles: [
        StringConst.COMPANY_6_ROLE_1,
        StringConst.COMPANY_6_ROLE_2,
        StringConst.COMPANY_6_ROLE_3,
      ],
      location: StringConst.LOCATION_6,
      duration: StringConst.DURATION_6,
    ),
    ExperienceData(
      company: StringConst.COMPANY_4,
      position: StringConst.POSITION_4,
      companyUrl: StringConst.COMPANY_4_URL,
      roles: [
        StringConst.COMPANY_4_ROLE_1,
        StringConst.COMPANY_4_ROLE_2,
        StringConst.COMPANY_4_ROLE_3,
      ],
      location: StringConst.LOCATION_4,
      duration: StringConst.DURATION_4,
    ),
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: StringConst.POSITION_3,
      companyUrl: StringConst.COMPANY_3_URL,
      roles: [
        StringConst.COMPANY_3_ROLE_1,
        StringConst.COMPANY_3_ROLE_2,
        StringConst.COMPANY_3_ROLE_3,
      ],
      location: StringConst.LOCATION_3,
      duration: StringConst.DURATION_3,
    ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.POSITION_2,
      companyUrl: StringConst.COMPANY_2_URL,
      roles: [
        StringConst.COMPANY_2_ROLE_1,
        StringConst.COMPANY_2_ROLE_2,
        StringConst.COMPANY_2_ROLE_3,
      ],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
    ExperienceData(
      company: StringConst.COMPANY_5,
      position: StringConst.POSITION_5,
      companyUrl: StringConst.COMPANY_5_URL,
      roles: [
        StringConst.COMPANY_5_ROLE_1,
        StringConst.COMPANY_5_ROLE_2,
        StringConst.COMPANY_5_ROLE_3,
      ],
      location: StringConst.LOCATION_5,
      duration: StringConst.DURATION_5,
    ),
  ];
}

class Projects {
  static ProjectItemData NOUMI = ProjectItemData(
    id: "noumi",
    title: "Noumi",
    subtitle: "Noumi",
    platform: "Mobile App + Web Companion",
    primaryColor: Color(0xFF585391),
    image: ImagePath.NOUMI_1,
    coverUrl: ImagePath.NOUMI_1,
    navTitleColor: Color(0xFF585391),
    navSelectedTitleColor: Color(0xFF585391),
    appLogoColor: Color(0xFF585391),
    projectAssets: [
      ImagePath.NOUMI_2,
    ],
    category: "Bienestar emocional",
    portfolioDescription:
        "Aplicacion enfocada en gestion emocional diaria, journaling y tracking personal. La experiencia busca sentirse intima, segura y ligera, con espacios amplios, tipografia amigable y transiciones suaves sin saturacion visual.",
    isPublic: false,
    isOnPlayStore: true,
    isLive: true,
    webUrl: "https://www.noumi.mx/inicio",
    playStoreUrl: "https://play.google.com/store/apps/details?id=mx.noumi.app",
    appStoreUrl: "https://apps.apple.com/mx/app/noumi/id6744339024",
    technologyUsed: "Flutter",
  );

  static ProjectItemData LULUNET_VENTAS = ProjectItemData(
    id: "lulunet-ventas",
    title: "Lulunet Ventas",
    subtitle: "Lulunet Ventas",
    platform: "Mobile App",
    primaryColor: Color(0xFFD9FF00),
    image: ImagePath.WORKS,
    coverUrl: ImagePath.WORKS,
    navTitleColor: Color(0xFF000000),
    navSelectedTitleColor: Color(0xFFB8F000),
    appLogoColor: Color(0xFF000000),
    projectAssets: [ImagePath.WORKS],
    category: "Sistema de ventas",
    portfolioDescription:
        "Herramienta para vendedores en campo enfocada en cerrar ventas rapido. La prioridad es velocidad operativa, alto contraste, botones grandes, flujo paso a paso y feedback inmediato para trabajar incluso bajo el sol.",
    isPublic: false,
    isOnPlayStore: false,
    technologyUsed: StringConst.FLUTTER,
  );

  static ProjectItemData IENTC_ALMACEN = ProjectItemData(
    id: "ientc-almacen",
    title: "Ientc Almacen",
    subtitle: "Ientc Almacen",
    platform: "Mobile App",
    primaryColor: Color(0xFFDC2626),
    image: ImagePath.WORKS,
    coverUrl: ImagePath.WORKS,
    navTitleColor: Color(0xFF991B1B),
    navSelectedTitleColor: Color(0xFFDC2626),
    appLogoColor: Color(0xFFDC2626),
    projectAssets: [ImagePath.WORKS],
    category: "Control de almacen",
    portfolioDescription:
        "Sistema de inventario y operacion para procesos logisticos. La interfaz esta pensada para precision y rapidez, con inputs grandes, estados claros y una experiencia casi sin decoracion para reducir errores.",
    isPublic: false,
    isOnPlayStore: false,
    technologyUsed: StringConst.FLUTTER,
  );

  static ProjectItemData LULUNET_CLIENTES = ProjectItemData(
    id: "lulunet-clientes",
    title: "Lulunet Clientes",
    subtitle: "Lulunet Clientes",
    platform: "Mobile App + Web",
    primaryColor: Color(0xFFD9FF00),
    image: ImagePath.WORKS,
    coverUrl: ImagePath.WORKS,
    navTitleColor: Color(0xFF000000),
    navSelectedTitleColor: Color(0xFFB8F000),
    appLogoColor: Color(0xFF000000),
    projectAssets: [ImagePath.WORKS],
    category: "Portal para clientes",
    portfolioDescription:
        "Portal para clientes residenciales de internet con una experiencia moderna, simple y accesible. La propuesta visual se apoya en una UI limpia con cards de consumo, pagos y plan, usando un lenguaje cercano y amigable.",
    isPublic: false,
    isOnPlayStore: false,
    technologyUsed: StringConst.FLUTTER,
  );

  static ProjectItemData IENTC_LANDING_PAGE = ProjectItemData(
    id: "landing-ientc",
    title: "Landing Page Ientc",
    subtitle: "Landing Page Ientc",
    platform: "Web",
    primaryColor: Color(0xFFDC2626),
    image: ImagePath.WORKS,
    coverUrl: ImagePath.WORKS,
    navTitleColor: Color(0xFF000000),
    navSelectedTitleColor: Color(0xFFDC2626),
    appLogoColor: Color(0xFFDC2626),
    projectAssets: [ImagePath.WORKS],
    category: "Landing page",
    portfolioDescription:
        "Landing corporativa para una empresa de telecomunicaciones empresariales. El enfoque es transmitir confianza, capacidad operativa y soporte, con secciones claras, mensajes directos y una presencia visual B2B fuerte.",
    isPublic: false,
    isOnPlayStore: false,
    technologyUsed: "Web",
    isLive: false,
  );

  static ProjectItemData LULUNET_LANDING_PAGE = ProjectItemData(
    id: "landing-lulunet",
    title: "Landing Page Lulunet",
    subtitle: "Landing Page Lulunet",
    platform: "Web",
    primaryColor: Color(0xFFD9FF00),
    image: ImagePath.WORKS,
    coverUrl: ImagePath.WORKS,
    navTitleColor: Color(0xFF000000),
    navSelectedTitleColor: Color(0xFFB8F000),
    appLogoColor: Color(0xFF000000),
    projectAssets: [ImagePath.WORKS],
    category: "Landing page",
    portfolioDescription:
        "Landing enfocada en internet residencial con una comunicacion mas dinamica y directa. La prioridad es destacar velocidad, precio y facilidad de contratacion mediante beneficios claros y CTAs visibles.",
    isPublic: false,
    isOnPlayStore: false,
    technologyUsed: "Web",
    isLive: false,
  );

  static ProjectItemData ARSE_POLIZAS_JURIDICAS = ProjectItemData(
    id: "arse-polizas-juridicas",
    title: "Arse Polizas Juridicas",
    subtitle: "Arse Polizas Juridicas",
    platform: "Web App",
    primaryColor: Color(0xFF0F172A),
    image: ImagePath.WORKS,
    coverUrl: ImagePath.WORKS,
    navTitleColor: Color(0xFF0F172A),
    navSelectedTitleColor: Color(0xFF0F172A),
    appLogoColor: Color(0xFF0F172A),
    projectAssets: [ImagePath.WORKS],
    category: "SaaS legal documental",
    portfolioDescription:
        "Sistema documental y legal para contratos y polizas juridicas. La experiencia esta pensada para transmitir orden, seguridad y formalidad mediante tablas limpias, jerarquia clara y cero distracciones.",
    isPublic: false,
    isOnPlayStore: false,
    technologyUsed: "Web",
  );

  static ProjectItemData REFAC = ProjectItemData(
    id: "refac",
    title: StringConst.REFAC,
    subtitle: StringConst.REFAC,
    platform: StringConst.REFAC_PLATFORM,
    primaryColor: Color.fromARGB(255, 46, 80, 134),
    image: ImagePath.REFAC_COVER,
    coverUrl: ImagePath.REFAC_COVER,
    navSelectedTitleColor: Color.fromARGB(255, 46, 80, 134),
    appLogoColor: Color.fromARGB(255, 46, 80, 134),
    projectAssets: [
      ImagePath.REFAC_1,
      ImagePath.REFAC_2,
      ImagePath.REFAC_3,
      ImagePath.REFAC_4,
    ],
    category: StringConst.REFAC_CATEGORY,
    portfolioDescription: StringConst.REFAC_DETAIL,
    isPublic: false,
    isOnPlayStore: false,
    technologyUsed: StringConst.FLUTTER,
  );

  static ProjectItemData BOSCH_INV = ProjectItemData(
    id: "bosch-inv",
    title: StringConst.BOSCH_INV,
    subtitle: StringConst.BOSCH_INV,
    platform: StringConst.BOSCH_INV_PLATFORM,
    primaryColor: Color(0xFF0470B9),
    image: ImagePath.BOSCH_INV_COVER,
    coverUrl: ImagePath.BOSCH_INV_COVER,
    navSelectedTitleColor: Color(0xFF0470B9),
    appLogoColor: Color(0xFF0470B9),
    projectAssets: [
      ImagePath.BOSCH_INV_2,
      ImagePath.BOSCH_INV_1,
      ImagePath.BOSCH_INV_3,
    ],
    category: StringConst.BOSCH_INV_CATEGORY,
    portfolioDescription: StringConst.BOSCH_INV_DETAIL,
    isPublic: false,
    isOnPlayStore: false,
    technologyUsed: StringConst.FLUTTER,
  );
  static ProjectItemData BOSCH_SS = ProjectItemData(
    id: "bosch-ss",
    title: StringConst.BOSCH_SS,
    subtitle: StringConst.BOSCH_SS,
    platform: StringConst.BOSCH_SS_PLATFORM,
    primaryColor: Color(0xFFD51317),
    image: ImagePath.BOSCH_SS_COVER,
    category: StringConst.BOSCH_SS_CATEGORY,
    designer: StringConst.BOSCH_SS_DESIGNER,
    coverUrl: ImagePath.BOSCH_SS_COVER,
    navTitleColor: Color(0xFFD51317),
    navSelectedTitleColor: Color(0xFFD51317),
    appLogoColor: Color(0xFFD51317),
    projectAssets: [
      ImagePath.BOSCH_SS_1,
      ImagePath.BOSCH_SS_2,
      ImagePath.BOSCH_SS_3,
    ],
    portfolioDescription: StringConst.BOSCH_SS_DETAIL,
    isPublic: false,
    isOnPlayStore: false,
    technologyUsed: StringConst.FLUTTER,
  );
  static ProjectItemData BOSCH_CERT = ProjectItemData(
    id: "bosch-cert",
    title: StringConst.BOSCH_CERT,
    subtitle: StringConst.BOSCH_CERT,
    primaryColor: Color(0xFF01A053),
    category: StringConst.BOSCH_CERT,
    designer: StringConst.BOSCH_CERT_DESIGNER,
    platform: StringConst.BOSCH_CERT_PLATFORM,
    image: ImagePath.BOSCH_CERT_COVER,
    coverUrl: ImagePath.BOSCH_CERT_COVER,
    navTitleColor: Color(0xFF01A053),
    navSelectedTitleColor: Color(0xFF01A053),
    appLogoColor: Color(0xFF01A053),
    projectAssets: [
      ImagePath.BOSCH_CERT_1,
      ImagePath.BOSCH_CERT_2,
      ImagePath.BOSCH_CERT_3,
    ],
    portfolioDescription: StringConst.BOSCH_CERT_DETAIL,
    isPublic: false,
    isOnPlayStore: false,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.BOSCH_CERT_GITHUB_URL,
    playStoreUrl: StringConst.BOSCH_CERT_PLAYSTORE_URL,
  );

  static ProjectItemData LOGIN_CATALOG = ProjectItemData(
    id: "login-catalog",
    title: StringConst.LOGIN_CATALOG,
    primaryColor: AppColors.login_catalog,
    subtitle: StringConst.LOGIN_CATALOG,
    category: StringConst.LOGIN_CATALOG_CATEGORY,
    platform: StringConst.LOGIN_CATALOG_PLATFORM,
    image: ImagePath.LOGIN_CATALOG_COVER,
    coverUrl: ImagePath.LOGIN_CATALOG_COVER,
    portfolioDescription: StringConst.LOGIN_CATALOG_DETAIL,
    navTitleColor: AppColors.loginCatalogNavTitle,
    navSelectedTitleColor: AppColors.loginCatalogSelectedNavTitle,
    appLogoColor: AppColors.loginCatalogAppLogo,
    projectAssets: [
      ImagePath.LOGIN_DESIGN_4,
      ImagePath.LOGIN_DESIGN_5,
      ImagePath.LOGIN_DESIGN_7,
      ImagePath.LOGIN_DESIGN_8,
      ImagePath.LOGIN_DESIGN_9,
    ],
    isPublic: true,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
  );
  static ProjectItemData LEANCEAF = ProjectItemData(
    id: "leanceaf",
    title: StringConst.LEANCEAF,
    subtitle: StringConst.LEANCEAF_SUBTITLE,
    category: StringConst.LEANCEAF_CATEGORY,
    designer: StringConst.LEANCEAF_DESIGNER,
    primaryColor: Color(0xFF273061),
    platform: StringConst.LEANCEAF_PLATFORM,
    image: ImagePath.LEANCEAF_COVER,
    coverUrl: ImagePath.LEANCEAF_COVER,
    navTitleColor: Color(0xFF273061),
    navSelectedTitleColor: AppColors.foodybiteSelectedNavTitle,
    appLogoColor: Color(0xFF273061),
    projectAssets: [
      ImagePath.LEANCEAF_1,
      ImagePath.LEANCEAF_2,
      ImagePath.LEANCEAF_3,
    ],
    portfolioDescription: StringConst.LEANCEAF_DETAIL,
    playStoreUrl: StringConst.LEANCEAF_PLAYSTORE_URL,
    isPublic: false,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
  );

  static ProjectItemData LEANCEPREV = ProjectItemData(
    id: "leanceprev",
    title: StringConst.LEANCEPREV,
    subtitle: StringConst.LEANCEPREV,
    primaryColor: Color(0xFF273061),
    platform: StringConst.LEANCEPREV_PLATFORM,
    category: StringConst.LEANCEPREV_CATEGORY,
    designer: StringConst.LEANCEPREV_DESIGNER,
    image: ImagePath.LEANCEPREV_COVER,
    coverUrl: ImagePath.LEANCEPREV_COVER,
    navTitleColor: Color(0xFF273061),
    navSelectedTitleColor: Color(0xFF273061),
    playStoreUrl: StringConst.LEANCEPREV_PLAYSTORE_URL,
    projectAssets: [
      ImagePath.LEANCEPREV_1,
      ImagePath.LEANCEPREV_2,
      ImagePath.LEANCEPREV_3,
      ImagePath.LEANCEPREV_4,
    ],
    portfolioDescription: StringConst.LEANCEPREV_DETAIL,
    isPublic: false,
    isOnPlayStore: true,
    isLive: false,
    technologyUsed: StringConst.FLUTTER,
  );
}
