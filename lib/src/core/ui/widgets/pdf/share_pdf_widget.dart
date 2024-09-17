import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taalim/src/core/ui/widgets/pdf/generate_pdf_method.dart';
import 'package:taalim/src/data/model/dua_model.dart';

class SharePdfWidget extends StatelessWidget {
  final DuaModel duaModel;
  const SharePdfWidget({super.key, required this.duaModel});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/icons/share.png'),
      onPressed: () async {
        // Generate the PDF
        final File pdfFile = await generatePdf(duaModel);

        // Create a formatted text to share
        String shareText = buildShareText(duaModel);

        // Share the PDF file with formatted text
        Share.shareXFiles([XFile(pdfFile.path)], text: shareText);
      },
    );
  }
}
