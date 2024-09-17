import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;
import 'package:taalim/src/data/model/dua_model.dart';

Future<File> generatePdf(DuaModel duaModel) async {
  // Load custom fonts
  final fontRegularData =
      await rootBundle.load('assets/fonts/NotoSans-Regular.ttf');
  final fontRegular = pw.Font.ttf(fontRegularData);
  final fontArabicData =
      await rootBundle.load('assets/fonts/NotoNaskhArabic-Regular.ttf');
  final fontArabic = pw.Font.ttf(fontArabicData);

  // Define PDF document
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
        theme: pw.ThemeData.withFont(
          base: fontRegular,
        ),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Title at the top
              if (duaModel.title != null)
                pw.Text(
                  duaModel.title!,
                  style: pw.TextStyle(
                    font: fontRegular,
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              pw.SizedBox(height: 24), // Space after the title

              // Conditional Arabic Text
              if (duaModel.arabicText != null)
                pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    duaModel.arabicText!,
                    style: pw.TextStyle(
                      font: fontArabic,
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                    ),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              pw.Divider(),
              pw.SizedBox(height: 16),

              // Conditional Kyrgyz Text
              if (duaModel.kyrgyzText != null)
                pw.Text(
                  duaModel.kyrgyzText!,
                  style: pw.TextStyle(
                    font: fontRegular,
                    fontSize: 18,
                    fontWeight: pw.FontWeight.normal,
                  ),
                ),
              pw.SizedBox(height: 16),
              pw.Divider(),
              pw.SizedBox(height: 16),

              // Conditional Transcription
              if (duaModel.transcription != null)
                pw.Text(
                  duaModel.transcription!,
                  style: pw.TextStyle(
                    font: fontRegular,
                    fontSize: 18,
                    fontWeight: pw.FontWeight.normal,
                  ),
                ),
            ],
          );
        }),
  );

  // Save the PDF
  final directory = await getTemporaryDirectory();
  final file = File('${directory.path}/dua.pdf');
  await file.writeAsBytes(await pdf.save());

  return file;
}

// Function to build the text for sharing
String buildShareText(DuaModel duaModel) {
  StringBuffer textBuffer = StringBuffer();

  textBuffer.writeln(duaModel.title ?? 'No Title');
  textBuffer.writeln('');
  if (duaModel.arabicText != null) {
    textBuffer.writeln('Arabic Text:');
    textBuffer.writeln(duaModel.arabicText);
    textBuffer.writeln('');
  }
  if (duaModel.kyrgyzText != null) {
    textBuffer.writeln('Kyrgyz Text:');
    textBuffer.writeln(duaModel.kyrgyzText);
    textBuffer.writeln('');
  }
  if (duaModel.transcription != null) {
    textBuffer.writeln('Transcription:');
    textBuffer.writeln(duaModel.transcription);
    textBuffer.writeln('');
  }

  return textBuffer.toString();
}
