import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as path;

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  bool isUploading = false;
  int _currentIndex = 0;

  final supabase = Supabase.instance.client;

  Future<void> uploadFile() async {
    setState(() {
      isUploading = true;
    });

    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null && result.files.single.bytes != null) {
      final file = result.files.single;
      final fileName = '${DateTime.now().millisecondsSinceEpoch}_${file.name}';
      final storagePath = 'pdfs/$fileName';

      try {
        // Subir archivo a Supabase Storage
        final storageResponse = await supabase.storage
            .from('pdfs')
            .uploadBinary(storagePath, file.bytes!, fileOptions: FileOptions(contentType: 'application/pdf'));

        final publicUrl = supabase.storage.from('pdfs').getPublicUrl(storagePath);

        // Insertar metadata en la tabla pdf_uploads
        await supabase.from('pdf_uploads').insert({
          'file_name': file.name,
          'file_url': publicUrl,
          'uploaded_by': supabase.auth.currentUser!.id,
        });

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Archivo subido con éxito')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al subir: $e')),
        );
      }
    }

    setState(() {
      isUploading = false;
    });
  }

  void goToDocumentList() {
    Navigator.pushNamed(context, '/registroclinico');
  }

  void _onBottomNavTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/menu');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/location');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/chat');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FBFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Historial Médico',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0277BD),
                ),
              ),
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.lightBlue[100],
                ),
                child: Center(
                  child: isUploading
                      ? const CircularProgressIndicator()
                      : TextButton.icon(
                          onPressed: uploadFile,
                          icon: const Icon(Icons.upload_file, size: 32, color: Colors.white),
                          label: const Text(
                            'Subir Archivo',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: goToDocumentList,
                icon: const Icon(Icons.folder_open),
                label: const Text('Ver Archivos Subidos'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan[600],
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 18),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
              ),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, size: 12, color: Colors.grey),
                  SizedBox(width: 12),
                  Icon(Icons.circle, size: 12, color: Colors.grey),
                  SizedBox(width: 12),
                  Icon(Icons.circle, size: 12, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _onBottomNavTapped(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menú',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Ubicación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
