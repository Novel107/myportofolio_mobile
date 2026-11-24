import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myportofolio_mobile/models/experience.dart';
import 'package:myportofolio_mobile/providers/auth_provider.dart';
import 'package:myportofolio_mobile/screens/login_screen.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();
  final ApiClient _apiClient = ApiClient();

  String _roleTitle = "";
  String _organization = "";
  String _experienceType = "Internship";
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isCurrentRole = false;
  String _description = "";
  bool _isSubmitting = false;

  final List<String> _experienceTypes = [
    'Internship',
    'Full-time',
    'Part-time',
    'Organization',
    'Volunteer',
    'Competition',
  ];

  String _formatDate(DateTime? date) {
    if (date == null) return "Belum dipilih";
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  Future<void> _pickStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked;
        if (_endDate != null && _endDate!.isBefore(_startDate!)) {
          _endDate = null;
        }
      });
    }
  }

  Future<void> _pickEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? (_startDate ?? DateTime.now()),
      firstDate: _startDate ?? DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final auth = context.read<AuthProvider>();
    if (!auth.isAuthenticated || auth.token == null) {
      final loggedIn = await Navigator.push<bool>(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
      if (loggedIn != true || !mounted) return;
    }

    final token = context.read<AuthProvider>().token;
    if (token == null) return;

    final String periodeText = _isCurrentRole
        ? "${_formatDate(_startDate)} - Sekarang"
        : "${_formatDate(_startDate)} - ${_formatDate(_endDate)}";

    final newExperience = Experience(
      title: "${_roleTitle.trim()} - ${_organization.trim()}",
      description: "[$_experienceType | $periodeText]\n${_description.trim()}",
      category: _experienceType.toLowerCase(),
    );

    setState(() => _isSubmitting = true);

    try {
      await _apiClient.createExperience(
        experience: newExperience,
        token: token,
      );

      if (!mounted) return;
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Pengalaman berhasil disimpan ke server!'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Posisi: $_roleTitle'),
                  Text('Organisasi: $_organization'),
                  Text('Jenis: $_experienceType'),
                  Text('Periode: $periodeText'),
                  Text('Deskripsi: $_description'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );

      if (!mounted) return;
      if (Navigator.canPop(context)) {
        Navigator.pop(context, true);
      } else {
        _formKey.currentState!.reset();
        setState(() {
          _roleTitle = "";
          _organization = "";
          _experienceType = "Internship";
          _startDate = null;
          _endDate = null;
          _isCurrentRole = false;
          _description = "";
        });
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceFirst('Exception: ', '')),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Experience Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Posisi / Role ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Software Engineer Intern",
                    labelText: "Posisi / Peran",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _roleTitle = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Posisi / peran tidak boleh kosong!";
                    }
                    if (value.trim().length < 3) {
                      return "Posisi / peran minimal 3 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Perusahaan / Organisasi ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Fakultas Ilmu Komputer UI",
                    labelText: "Perusahaan / Organisasi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _organization = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama perusahaan/organisasi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Jenis Pengalaman ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Jenis Pengalaman",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _experienceType,
                  items: _experienceTypes
                      .map(
                        (type) =>
                            DropdownMenuItem(value: type, child: Text(type)),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _experienceType = newValue!;
                    });
                  },
                ),
              ),

              // === Tanggal Mulai ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormField<DateTime>(
                  validator: (value) {
                    if (_startDate == null) {
                      return "Tanggal mulai wajib dipilih!";
                    }
                    return null;
                  },
                  builder: (state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            await _pickStartDate();
                            state.didChange(_startDate);
                          },
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: "Tanggal Mulai",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              errorText: state.errorText,
                              suffixIcon: const Icon(Icons.calendar_today),
                            ),
                            child: Text(_formatDate(_startDate)),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // === Checkbox Masih Berlangsung ===
              CheckboxListTile(
                title: const Text("Saya masih aktif di posisi ini"),
                value: _isCurrentRole,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    _isCurrentRole = value ?? false;
                    if (_isCurrentRole) {
                      _endDate = null;
                    }
                  });
                },
              ),

              // === Tanggal Selesai ===
              if (!_isCurrentRole)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormField<DateTime>(
                    validator: (value) {
                      if (!_isCurrentRole && _endDate == null) {
                        return "Tanggal selesai wajib dipilih jika sudah tidak aktif!";
                      }
                      if (_startDate != null &&
                          _endDate != null &&
                          _endDate!.isBefore(_startDate!)) {
                        return "Tanggal selesai tidak boleh sebelum tanggal mulai!";
                      }
                      return null;
                    },
                    builder: (state) {
                      return InkWell(
                        onTap: () async {
                          await _pickEndDate();
                          state.didChange(_endDate);
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: "Tanggal Selesai",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            errorText: state.errorText,
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                          child: Text(_formatDate(_endDate)),
                        ),
                      );
                    },
                  ),
                ),

              // === Deskripsi Pengalaman ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText:
                        "Jelaskan tanggung jawab atau pencapaian utama...",
                    labelText: "Deskripsi Pengalaman",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi pengalaman tidak boleh kosong!";
                    }
                    if (value.trim().length < 10) {
                      return "Deskripsi minimal 10 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: _isSubmitting ? null : _submitForm,
                    child: Text(
                      _isSubmitting ? "Menyimpan..." : "Save",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
