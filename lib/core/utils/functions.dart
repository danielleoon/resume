import 'package:cv_daniel/presentation/pages/project_detail/project_detail_page.dart';
import 'package:cv_daniel/presentation/widgets/project_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'package:flutter/services.dart';

class Functions {
  static void launchUrl(String url) async {
    await launch(url);
  }

  static Future<void> downloadFromAssets(
      String assetPath, String downloadFileName) async {
    // Cargar el archivo como bytes
    final ByteData data = await rootBundle.load(assetPath);
    final List<int> bytes = data.buffer.asUint8List();

    // Crear un blob y URL de descarga
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Crear un elemento <a> para iniciar la descarga
    final anchor = html.AnchorElement(href: url)
      ..setAttribute(
          "download", downloadFileName) // Nombre del archivo en la descarga
      ..style.display = "none" // Ocultar el elemento en la interfaz
      ..click(); // Simular el clic para iniciar la descarga

    // Liberar la URL creada
    html.Url.revokeObjectUrl(url);
  }

  static Size textSize({
    required String text,
    required TextStyle? style,
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: maxLines,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  static void navigateToProject({
    required BuildContext context,
    required List<ProjectItemData> dataSource,
    required ProjectItemData currentProject,
    required int currentProjectIndex,
  }) {
    ProjectItemData? nextProject;
    bool hasNextProject;
    if ((currentProjectIndex + 1) > (dataSource.length - 1)) {
      hasNextProject = false;
    } else {
      hasNextProject = true;
      nextProject = dataSource[currentProjectIndex + 1];
    }
    Navigator.of(context).pushNamed(
      ProjectDetailPage.projectDetailPageRoute,
      arguments: ProjectDetailArguments(
        dataSource: dataSource,
        currentIndex: currentProjectIndex,
        data: currentProject,
        nextProject: nextProject,
        hasNextProject: hasNextProject,
      ),
    );
  }
}
